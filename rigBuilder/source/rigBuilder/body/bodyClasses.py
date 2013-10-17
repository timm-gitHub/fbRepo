"""

    Classes useful for rigging
    --------------------------
    
    Author: Evan (The Man) Jacobson
        
"""

import string, re, tempfile, time, imp, os, bodyPublish, bodyIO
import maya.cmds as cmds
import maya.mel as mel
from xml.dom import minidom
from datetime import datetime, timedelta
from rigBuilder import rigUtils, rigEnv

mel.eval('source "advancedSkeleton.mel"')

cmds.cycleCheck(e=False)
reload(rigUtils)
class RigComponent(object):
    
    def __init__(self,count,namespace,component,locus):
        
        self.count     = count
        self.namespace = namespace
        self.component = component
        self.locus     = locus
        

class RigNode(object):
    """ 
    Hierarchical node for use in Rig class.
    
    RigNodes correspond to _loc_ nodes in the guide rig. 
    Joints created for each RigNode in RigNode hierarchy.  
    """
    
    def __init__(self,name):
        self.name     = name
        self.parent   = None
        self.children = []
        self.count    = 0
        self.posX     = 0.0
        self.posY     = 0.0
        self.posZ     = 1.0
        self.order    = 'xyz'
        self.secaxis  = 'zup'
        self.label    = None
        self.locus    = None
        self.asset    = None
        self.twist    = False
        self.bend     = False
        self.symmetrical = None
        self.othertype = None
        self.namespace = None
        self.globalorient = False


class Rig(object):
    """
    Character rig class.
    
    Methods:
      build              - Run prebuild or postbuild scripts
      createASRig        - generate advanced skeleton rig from fitskeleton
      createFitJoints    - create joint hierarchy for each component
      createFitJointTree - create joint hierarchy
      publishGuide       - save scene as guide rig
      guideRemove        - remove references to guide components
      buildGuide         - Open existing guide rig, replace missing components
      parseBuildModule   - Load build script, reload and run build - for pre/post building
      parseLayout        - Read through and store info from layout file
      printPretty        - output RigNode hierarchy with tabs for all components
      printPrettyTree    - output RigNode hierarchy
      referenceGeo       - reference latest geo
      getRootNode          - create subhierarchy of RigNodes
      
    Attributes:
      name       - character name
      root       - top most RigNode (usually root [pelvis])
      components - dictionary of components - {name:[asset,rootparent,root,symmetry],...}
      assets     - list of assets used in the rig
      xml        - path to character layout file
      guide      - path to character guide rig
      georoot    - path to character geometry directory
      
    """
    
    def __init__(self,name):
        
        self.name      = name
        self.data      = None
        self.rootnodes = None
        self.busy      = False
    
    def build(self,module):
        """Process build module. module arg either 'prebuild' or 'postbuild'."""
        
        builds = []
        if module == 'prebuild': mod = 'pre'
        elif module == 'postbuild': mod ='post'
        
        rigUtils.log('Processing %s build scripts' % module,'h')
        
        # Component builds first
        for rootnode in self.rootnodes:
            
            path    = None
            version = 0
            for file in os.listdir(rigEnv.LOCALBUILDS):
                if re.match('%s_%sbuild_v[0-9]{3}.py$' % (rootnode.asset,mod),file):
                    if version < int(re.search('[0-9]{3}',file).group(0)):
                        version = int(re.search('[0-9]{3}',file).group(0))
                        path    = os.path.join(rigEnv.LOCALBUILDS,file)
                    
            if not path: path = bodyPublish.getComponentBuildScript(rootnode.asset,module)
            if not path:
                rigUtils.log('%s not found: %s' % (module,rootnode.asset))
                continue
            
            rigUtils.log('%sing %s: %s' % (module,rootnode.namespace,path))
            
            build    = imp.load_source("build",path)
            rigbuild = build.RigBuild(rootnode.count,rootnode.namespace,rootnode.asset,rootnode.locus)
            rigbuild.build()
            if rootnode.symmetrical and rootnode.locus != 'C':
                locus    = 'L' if rootnode.locus == 'R' else 'R'
                rigbuild = build.RigBuild(rootnode.count,rootnode.namespace,rootnode.asset,locus)
                rigbuild.build()
                
            builds.append(path)
            
        # Character build next
        path    = None
        version = 0
        for file in os.listdir(rigEnv.LOCALBUILDS):
            if re.match('%s_rig_%sBuildScript_v[0-9]{3}_[A-Z]{4}.py$' % (self.name,mod),file):
                if version < int(re.search('[0-9]{3}',file).group(0)):
                    version = int(re.search('[0-9]{3}',file).group(0))
                    path    = os.path.join(rigEnv.LOCALBUILDS,file)
        
        if not path: path = bodyPublish.getRigBuildScript(self.name,module)
        if not path:
            rigUtils.log('%s not found: %s' % (module,self.name)) 
            return builds
        
        rigUtils.log('%sing %s: %s' % (module,self.name,path))
        
        build    = imp.load_source("build",path)
        rigbuild = build.RigBuild()
        rigbuild.build()
        builds.append(path)
        
        return builds
    
    def buildGuide(self,refgeo=False,verbose=True,version=None):
        """Open the guide rig, check guide rig components, update guide with missing components."""
        
        # get the layout information
        self.data = self.getLayoutData()
        
        if not self.data:
            rigUtils.log('Layout file not found - aborting','w')
            return
        
        cmds.file(new=True,f=True)
        
        if version:
            guidepath = bodyPublish.getRigGuideVersion(self.name,version)
        else:
            guidepath = bodyPublish.getRigGuide(self.name)
        
        if guidepath: 
            cmds.file(guidepath,f=True,pr=True,typ='mayaAscii',i=True,lrd='none',pmt=False)
            cmds.file(pmt=True)
        
        # remove redundant references
        references = cmds.ls(rf=True)
        
        x = 0
        while x < len(self.data):
            
            namespace   = self.data[x][0]
            asset       = self.data[x][1]
            mapping     = self.data[x][2]
            symmetrical = self.data[x][3]
            count       = self.data[x][4]
            countoffset = 0
            
            for i in range(x):
                if self.data[i][1] == asset and self.data[i][0] == namespace:
                    countoffset = countoffset + self.data[i][4]
            
            for i in range(count):
                
                RN = 'comp_%s%sRN' % (namespace,i+countoffset)
                if RN in references:
                    references.remove(RN)
                    
            x = x + 1
        
        for reference in references:
            try: cmds.file(rr=True,rfn=reference,f=True)
            except: cmds.delete(reference)
        
        # remove unknown reference node
        if cmds.objExists('_UNKNOWN_REF_NODE_'): cmds.delete('_UNKNOWN_REF_NODE_')
        
        if not cmds.objExists('rig_guide'):
            cmds.group(n='rig_guide',em=True)
            
        if not cmds.objExists('guide_loc_set'):
            cmds.sets(n='guide_loc_set',em=True)
        
        # load the references
        references = cmds.ls(rf=True)
        x = 0
        while x < len(self.data):
            
            namespace   = self.data[x][0]
            asset       = self.data[x][1]
            mapping     = self.data[x][2]
            symmetrical = self.data[x][3]
            count       = self.data[x][4]
            countoffset = 0
            
            for i in range(x):
                if self.data[i][1] == asset and self.data[i][0] == namespace:
                    countoffset = countoffset + self.data[i][4]
            
            for i in range(count):
                
                RN   = 'comp_%s%sRN' % (namespace,i+countoffset)
                NS   = 'comp_%s%s' % (namespace,i+countoffset)
                path = bodyPublish.getComponentGuide(asset)
                
                if not path:
                    rigUtils.log('Component not found: %s' % asset,'w')
                    continue
                
                path = str(path).encode('string-escape').replace('\\\\','/')
                
                # make sure there are no locked nodes in the component guide
                fin = open(path,'r')
                for line in fin.readlines():
                    if 'lockNode -l 1 ;' in line:
                        rigUtils.log('Quitting - Locked nodes found in guide component: %s' % path,'e')
                        fin.close()
                        return False
                fin.close()
                
                if '%sRN' % NS in references:
                    try:
                        references.remove('%sRN' % NS)
                        cmds.file(path,lr='%sRN' % NS)
                    except:
                        cmds.delete('%sRN' % NS)
                        cmds.file(path,r=True,typ='mayaAscii',gl=True,lrd='all',ns=NS)
                else:
                    cmds.file(path,r=True,typ='mayaAscii',gl=True,lrd='all',ns=NS)
                
                p = cmds.listRelatives('%s:rig_guide' % NS,p=True)
                if p:
                    if p[0] != 'rig_guide':
                        cmds.parent('%s:rig_guide' % NS,'rig_guide')
                else:
                    cmds.parent('%s:rig_guide' % NS,'rig_guide')
                
                cmds.sets('%s:loc_set' % NS,add='guide_loc_set')
                rigUtils.log('Component added: %s' % NS)
                
            x = x + 1
        
        if refgeo:
            rigUtils.log('Processing geometry: %s' % self.name)
            type      = 'base'
            lod       = '100'
            namespace = 'GEO'
            self.referenceGeo(type,lod,namespace)
            
        if verbose: rigUtils.log('*** Guide Complete : %s ***' % self.name,'h')
    
        return guidepath
    
    def buildRig(self,defaultmaps=[],debug=False,combine=False,publish=False,keepGuide=False,importDeformers=True,importControlData=True,comment=''):
        """Generate advanced skeleton rig from guide."""
        
        cmds.file(new=True,f=True)
        
        start = time.time()
        
        # import guide rig
        if not self.buildGuide(verbose=False): return
        
        # make sure guide is A-OK!
        if not self.testGuide(): return
        
        # store the root nodes
        self.rootnodes = self.getRootNodes()
        
        # test that symmetrized components are on the right
        for root in self.rootnodes:
            if root.symmetrical and root.locus == 'L':
                rigUtils.log('%s positioned incorrectly - Symmetrized components must be positioned in negative X' % root.namespace,'e')
                return
        
        # create 'fit' skeleton to build AS rig
        self.createFitJoints()
        
        # run prebuild scripts
        self.build('prebuild')
        
        if debug:
            buildtime = timedelta(seconds=time.time()-start)
            rigUtils.log('*** Build Complete : %s ***' % self.name,'h')
            rigUtils.log('*** Build Time : %s ***' % str(buildtime))
            rigUtils.log('*** Estimated Complete Build Time : %s ***' % str(buildtime*18))
            return
        
        # create separate AS rigs for each component
        self.createASComponents()
        self.updateASComponents()
        
        # reference geo:
        basereferenced = self.referenceGeo('base','100','GEO')
        
        # run postbuild scripts
        self.build('postbuild')
        
        # import geo deformers
        if basereferenced and importDeformers: self.importSkin(defaultmaps)
        
        # reshape controls
        if importControlData: self.getControlData()
        
        # change controller color
        rigUtils.updateControlColours()
        
        # unlock nodeState for all nodes
        for dagnode in cmds.ls():
            if not cmds.attributeQuery('nodeState',n=dagnode,ex=True): continue
            if cmds.lockNode(dagnode,q=True,l=True): continue
            
            conn = cmds.listConnections('%s.nodeState' % dagnode,s=True,d=False,p=True)
            if conn: cmds.disconnectAttr(conn,'%s.nodeState' % dagnode)
            
            cmds.setAttr('%s.nodeState' % dagnode,l=False)
        
        # import face rig and bind to body rig
        if combine: self.referenceFaceRig()
        
        # keep guide
        if not keepGuide or publish: self.guideRemove()
        
        # create bind joint set
        cmds.select(cmds.ls('*_bnd_*',type='joint'),r=True)
        cmds.sets(n='bind_joints_set')
        
        # add labels to the bind joints
        for jnt in cmds.ls(sl=True):
            cmds.setAttr('%s.type' % jnt, 18)
            cmds.setAttr('%s.otherType' % jnt,string.split(jnt,'_')[1],typ='string')
        
        # search for nodes with the same name for sanity check
        nodes     = rigUtils.searchForDagNodesWithSameName()
        buildtime = timedelta(seconds=time.time()-start)
        
        # complete
        rigUtils.log('*** Build Complete : %s ***' % self.name,'h')
        rigUtils.log('*** Build Time : %s ***' % str(buildtime))
        if nodes:
            rigUtils.log('*** Resulting rig nodes with the same name: ***')
            for node in nodes:
                rigUtils.log('*** %s' % node)
        
        # publish the rig
        if publish: self.publishRig(comment)
    
    def createASComponents(self):
        
        a = cmds.group(em=True,n='geometry_grp')
        b = cmds.group(em=True,n='visibility_grp')
        c = cmds.group(em=True,n='spaces_grp')
        d = cmds.group(em=True,n='prefs_grp')
        e = cmds.group(em=True,n='modules_grp')
        cmds.group(a,b,c,d,e,n='rig_anim_combined')
        
        # turn off transform inheritance
        cmds.setAttr('rig_anim_combined.inheritsTransform',0)
        
        rigUtils.log('Generating Components','h')
        
        for rootnode in self.rootnodes:
            
            root        = rootnode.name
            asset       = rootnode.asset
            namespace   = rootnode.namespace
            count       = rootnode.count
            locus       = rootnode.locus
            symmetrical = rootnode.symmetrical
            label       = rootnode.label
            
            #if root != 'root':
            if label != 1: # 1 == 'Root'
                cmds.select(cl=True)
                tmp = cmds.joint(n='tmpRoot')
                cmds.setAttr('%s.type' % tmp,1)
                cmds.setAttr('%s.drawLabel' % tmp,1)
                cmds.parent('%s%s' % (root,count),tmp)
            else:
                tmp = '%s%s' % (root,count)
            
            cmds.select(tmp,r=True)
            rigUtils.log('Generating: %s%s' % (namespace,count))
            mel.eval('$asNoPrompt = 1; advancedSkeleton;')
            
            dobreak = False
            while(True):
                
                oldlocus = locus
                if locus == 'C': oldlocus = 'M'
                
                mod = cmds.group(n='%s_%s_mod_%s' % (locus,namespace,count),em=True)
                cmds.parent(mod,'modules_grp')
                
                # rearrange the bind joints
                grp = cmds.group(n='%s_%sBind_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                cmds.parent('%s%s_%s' % (root,count,oldlocus),grp)
                
                # rearrange the global offset nodes
                grp = cmds.group(n='%s_%sGlobalOffset_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('GlobalSystem',c=True)
                if children:
                    for x in children:
                        if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                # rearrange the wag nodes
                grp = cmds.group(n='%s_%sWag_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('WagSystem',c=True)
                
                if children:
                    for x in children:
                        cmds.parent(x,grp)
                
                # rearrange the aim nodes
                grp = cmds.group(n='%s_%sAim_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('AimSystem',c=True)
                if children:
                    for x in children:
                        cmds.parent(x,grp)
                
                # rearrange the root nodes
                grp = cmds.group(n='%s_%sRoot_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('RootSystem',c=True)
                if children:
                    for x in children:
                        cmds.parent(x,grp)
                
                # rearrange the dynamic nodes
                grp = cmds.group(n='%s_%sDyn_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('DynamicSystem',c=True)
                if children:
                    for x in children:
                        cmds.parent(x,grp)
                
                # rearrange the FKIK nodes
                grp = cmds.group(n='%s_%sFKIK_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('FKIKSystem',c=True)
                if children:
                    for x in children:
                        if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                # rearrange the fk ctl nodes
                grp = cmds.group(n='%s_%sCtl_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                if cmds.objExists('FKXtmpRoot_M'):
                    children = cmds.listRelatives('FKXtmpRoot_M',c=True)
                    if children:
                        for x in children:
                            if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                children = cmds.listRelatives('FKSystem',c=True)
                if children:
                    for x in children:
                        #if 'Center' in x and root == 'root':
                        if 'Center' in x and label == 1:
                            x = cmds.rename(x,string.replace(x,'_org_','_ctg_'))
                        #elif 'Center' in x and root != 'root': continue
                        elif 'Center' in x and label != 1: continue
                         
                        if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                # rearrange the twist nodes
                grp = cmds.group(n='%s_%sTwist_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('TwistSystem',c=True)
                if children:
                    for x in children:
                        if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                # rearrange the bend nodes
                grp = cmds.group(n='%s_%sBend_org_%s' % (locus,namespace,count),em=True)
                cmds.setAttr('%s.inheritsTransform' % grp,0)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('BendSystem',c=True)
                if children:
                    for x in children:
                        if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                # rearrange the IK nodes
                grp = cmds.group(n='%s_%sIK_org_%s' % (locus,namespace,count),em=True)
                cmds.parent(grp,mod)
                children = cmds.listRelatives('IKSystem',c=True)
                if children:
                    for sub in children:
                        subchildren = cmds.listRelatives(sub,c=True)
                        if not subchildren: continue
                        for x in subchildren:
                            if '_%s' % oldlocus in x: cmds.parent(x,grp)
                
                if dobreak: break
                 
                if locus == 'R' and int(symmetrical):
                    locus   = 'L'
                    dobreak = True
                elif locus == 'L' and int(symmetrical):
                    locus   = 'R'
                    dobreak = True
                else: 
                    break
            
            cmds.delete('Group')
            
            # rename all advanced skeleton nodes to FB nodes
            rigUtils.convertNameConventionAStoFB(count,namespace)
            
            if cmds.objExists('ControlSet'): cmds.delete('ControlSet')
            if cmds.objExists('DeformSet'): cmds.delete('DeformSet')
            if cmds.objExists('AllSet'): cmds.delete('AllSet')
    
    def createFitJoints(self):
        """Create fit joints for entire skeleton."""
        
        for rootnode in self.rootnodes:
            self.createFitJointTree(rootnode)
    
    def createFitJointTree(self,node):
        """Create fit joint skeleton hierarchy.
        
           ** it's important not to change the AS naming convention during this step **
        
        """
        cmds.select(cl=True)
        
        joint = cmds.joint(n='%s%s' % (node.name,node.count),p=[node.posX,node.posY,node.posZ],r=True,a=True)
        
        if node.parent:
            cmds.parent(joint,'%s%s' % (node.parent.name,node.parent.count))
            cmds.joint('%s%s' % (node.parent.name,node.parent.count),e=True,oj='xyz',roo=node.parent.order,sao=node.parent.secaxis)
        
        if node.label:
            cmds.setAttr('%s.drawLabel' % joint,True)
            cmds.setAttr('%s.type' % joint, node.label)
            if node.label == 18:
                cmds.setAttr('%s.otherType' % joint,node.othertype,typ='string')
        
        if node.globalorient:
            loc = cmds.spaceLocator(n='%s_globalLocator' % joint)
            cmds.parent(loc,joint,r=True)
            cmds.addAttr(joint,ln='global',at='double',min=0,max=10,dv=10)
            cmds.addAttr(joint,ln='globalConnect',at='double',min=0,max=10,dv=10)
            cmds.connectAttr('%s.global' % joint,'%s.globalConnect' % joint)
        
        if node.twist:
            cmds.addAttr(joint,ln='twistJoints',at='long',min=0,max=10,dv=2)

        if node.bend:
            cmds.addAttr(joint,ln='bend',at='bool',dv=1)
        else:
            cmds.addAttr(joint,ln='bend',at='bool',dv=0)
        
        if not node.symmetrical:
            cmds.setAttr('%s.side' % joint,1)
            cmds.setAttr('%s.drawLabel' % joint,1)
        
        for child in node.children:
            self.createFitJointTree(child)
        
        if not node.parent: return
        
        if node.parent.twist:
        
            par = '%s%s' % (node.parent.name,node.parent.count)
        
            avg = cmds.createNode('plusMinusAverage')
            mlt = cmds.createNode('multiplyDivide',n='%s_multDiv' % par)
            
            cmds.connectAttr('%s.twistJoints' % par, '%s.input1D[0]' % avg)
            cmds.setAttr('%s.input1D[1]' % avg, 1)
            cmds.setAttr('%s.operation' % mlt, 2)
            cmds.connectAttr('%s.translate' % joint, '%s.input1' % mlt)
            cmds.connectAttr('%s.output1D' % avg, '%s.input2.input2X' % mlt)
            cmds.connectAttr('%s.output1D' % avg, '%s.input2.input2Y' % mlt)
            cmds.connectAttr('%s.output1D' % avg, '%s.input2.input2Z' % mlt)
            
            i = 1
            while i < 11:
                loc = cmds.spaceLocator(n='%s_twistJointsLocator%s' % (par,i))[0]
                shp = cmds.listRelatives(loc,s=True)[0]
                attrs = cmds.listAttr(loc,k=True)
                cmds.setAttr('%s.overrideEnabled' % loc,1)
                cmds.setAttr('%s.overrideColor' % loc,31)
                cmds.addAttr(loc,ln='twistPosition',at='double',k=False,dv=i,min=0,max=10)
                cmds.parent(loc,par)
                cmds.xform(loc,os=True,t=[0,0,0],ro=[0,0,0],s=[.5,.5,.5])
                mult = cmds.createNode('multiplyDivide',n='%s_multDiv%s' % (par,i))
                cmds.connectAttr('%s.output' % mlt, '%s.input1' % mult)
                cmds.connectAttr('%s.twistPosition' % loc, '%s.input2X' % mult,f=True)
                cmds.setAttr('%s.input2Y' % mult,i)
                cmds.setAttr('%s.input2Z' % mult,i)
                cmds.connectAttr('%s.output' % mult, '%s.translate' % loc)
                
                mult = cmds.createNode('multiplyDivide')
                cmds.connectAttr('%s.twistJoints' % par, '%s.input1X' % mult)
                cmds.setAttr('%s.input2X' % mult, ((1/(2*i))+.001))
                cmds.connectAttr('%s.outputX' % mult, '%s.v' % loc)
                for attr in attrs:
                    cmds.setAttr('%s.%s' % (loc,attr), l=True, k=False)
                
                i = i + 1
    
    def getControlData(self,skip=[]):
        """Import control shape data for selected controls."""
        
        tmp = []
        if skip:
            for sel in skip:
                shp = cmds.listRelatives(sel,s=True)
                if shp: tmp.append(shp[0])
        
        path = bodyPublish.getRigMapping(self.name)
        if path: bodyIO.importControlData(path,tmp)
    
    def getLayoutData(self):
        """Extrapolate component information from a layout file."""
        
        path = bodyPublish.getRigLayout(self.name)
        
        if not path: return
        
        dom      = minidom.parse(path)
        domcomps = dom.getElementsByTagName('comp')
        
        if not len(domcomps): rigUtils.log('No components found: %s' % path,'w')
        
        data = []
        for comp in domcomps:
            
            try:
                namespace  = comp.getElementsByTagName('namespace')[0].firstChild.nodeValue
                asset      = comp.getElementsByTagName('asset')[0].firstChild.nodeValue
                mapping    = comp.getElementsByTagName('mapping')[0].firstChild.nodeValue
                symmetry   = comp.getElementsByTagName('symmetry')[0].firstChild.nodeValue
                count      = comp.getElementsByTagName('count')[0].firstChild.nodeValue
                
                data.append([namespace,asset,mapping,symmetry,int(count)])
            
            except:
                rigUtils.log('Error getting elements from layout file: %s' % path)
                return
        
        return data
    
    def getRootNode(self,locator,parent,namespace,asset,count,symmetrical=False):
        """Create a hierarchy of RigNodes.
        
           ** The nodes store the name of the joint to be used by advanced skeleton. For this **
           ** reason the tree maintains the AS naming convention.                             **
        
        """
        
        # do nothing if the node is not enabled
        if cmds.attributeQuery('enable',n=locator,ex=True):
            if not cmds.getAttr('%s.enable' % locator): 
                return None
        
        posX = cmds.xform(locator,t=True,ws=True,q=True)[0]
        posY = cmds.xform(locator,t=True,ws=True,q=True)[1]
        posZ = cmds.xform(locator,t=True,ws=True,q=True)[2]
        
        if posX == 0: locus = 'C'
        elif posX < 0: locus = 'R'
        else: locus = 'L'
        
        name  = re.search('(?<=:)[_a-zA-Z0-9]+',locator).group(0) # locator name without namespace
        name  = string.split(name,'_')[1] # joint name
        if 'xxNAMESPACExx' in name: # wildcard
            name = string.replace(name,'xxNAMESPACExx',namespace)
        elif 'xxASSETxx' in name: # wildcard
            name = string.replace(name,'xxASSETxx',namespace)
        node  = RigNode(name)
        
        children = []
        for child in cmds.listRelatives(locator,c=True,s=False,f=True):
            if not cmds.objectType(child) == 'transform': continue # workaround - cmds.listRelatives type bug
            child     = string.split(child,'|')[-1]
            childnode = self.getRootNode(child,node,namespace,asset,count,symmetrical)
            if childnode: children.append(childnode)
        
        order        = cmds.getAttr('%s.order' % locator)
        secaxis      = cmds.getAttr('%s.secondaryAxis' % locator)
        label        = cmds.getAttr('%s.label' % locator)
        twist        = cmds.getAttr('%s.twist' % locator)
        bend         = cmds.getAttr('%s.bend' % locator)
        othertype    = cmds.getAttr('%s.otherType' % locator)
        globalorient = cmds.getAttr('%s.global' % locator)
        
        node.posX      = posX
        node.posY      = posY
        node.posZ      = posZ
        node.bend      = bend
        node.count     = count
        node.label     = label
        node.locus     = locus
        node.twist     = twist
        node.order     = order
        node.asset     = asset
        node.parent    = parent
        node.secaxis   = secaxis
        node.children  = children
        node.othertype = othertype
        node.namespace = namespace
        node.globalorient = globalorient
        node.symmetrical  = symmetrical
        
        return node
    
    def getRootNodes(self):
        
        rootnodes = []
        
        x = 0
        while x < len(self.data):
            
            namespace   = self.data[x][0]
            asset       = self.data[x][1]
            mapping     = self.data[x][2]
            symmetrical = self.data[x][3]
            count       = self.data[x][4]
            countoffset = 0
            
            for i in range(x):
                if self.data[i][1] == asset and self.data[i][0] == namespace:
                    countoffset = countoffset + self.data[i][4]
            
            for i in range(count):
                
                NS  = 'comp_%s%s' % (namespace,i+countoffset)
                set = '%s:loc_set' % NS
                
                if not cmds.objExists(set): continue
                
                for loc in cmds.sets(set,q=True):
                    par   = cmds.listRelatives(loc,p=True)[0]
                    shape = cmds.listRelatives(par,s=True)
                    if not shape: # top most locator will be child of group node that has no shape node
                        root = loc
                        break
                
                rootnode = self.getRootNode(root,None,namespace,asset,i+countoffset,int(symmetrical))
                rootnodes.append(rootnode)
                
            x = x + 1
        
        return rootnodes
    
    def guideRemove(self):
        """Remove references to component guide rigs from the scene."""
        
        rigUtils.log('Removing Guides','h')
        
        for reference in cmds.ls('*RN'):
            
            if reference == 'FACERN': continue
            
            cmds.file(rr=True,rfn=reference,f=True)
            rigUtils.log('Reference unloaded: %s' % reference)
            
        cmds.delete('rig_guide')
        cmds.delete('guide_loc_set')
    
    def finalise(self):
        
        for control in cmds.ls('*_ctl_*',type='transform'):
            # reset all control positions
            if not cmds.getAttr('%s.tx' % control,l=True): cmds.setAttr('%s.tx' % control,0)
            if not cmds.getAttr('%s.ty' % control,l=True): cmds.setAttr('%s.ty' % control,0)
            if not cmds.getAttr('%s.tz' % control,l=True): cmds.setAttr('%s.tz' % control,0)
            if not cmds.getAttr('%s.rx' % control,l=True): cmds.setAttr('%s.rx' % control,0)
            if not cmds.getAttr('%s.ry' % control,l=True): cmds.setAttr('%s.ry' % control,0)
            if not cmds.getAttr('%s.rz' % control,l=True): cmds.setAttr('%s.rz' % control,0)
            if not cmds.getAttr('%s.sx' % control,l=True): cmds.setAttr('%s.sx' % control,1)
            if not cmds.getAttr('%s.sy' % control,l=True): cmds.setAttr('%s.sy' % control,1)
            if not cmds.getAttr('%s.sz' % control,l=True): cmds.setAttr('%s.sz' % control,1)
            # turn off special attributes
            if cmds.attributeQuery('global',n=control,ex=True): cmds.setAttr('%s.global' % control,0)
            if cmds.attributeQuery('Global',n=control,ex=True):
                if '_ankleIk_ctl_' in control:
                     cmds.setAttr('%s.Global' % control,1)
                else:
                    cmds.setAttr('%s.Global' % control,0)
            if cmds.attributeQuery('FKIKBlend',n=control,ex=True):
                if '_leg' in control: 
                    cmds.setAttr('%s.FKIKBlend' % control,1)
                else:
                    cmds.setAttr('%s.FKIKBlend' % control,0)
            if cmds.attributeQuery('follow',n=control,ex=True): cmds.setAttr('%s.follow' % control,0)
            if cmds.attributeQuery('jointVis',n=control,ex=True): cmds.setAttr('%s.jointVis' % control,0)
            
        # toggle selectability of geo
        for mesh in cmds.ls(type='mesh'):
            parent = cmds.listRelatives(mesh,p=True)[0]
            cmds.setAttr('%s.overrideEnabled' % parent,1)
            cmds.setAttr('%s.overrideDisplayType' % parent,2)
            
        # remove all layers
        for layer in cmds.ls(type='displayLayer'):
            if layer == 'controlJointLayer' or layer =='defaultLayer' or layer =='jointLayer': continue
            cmds.delete(layer)
            
        # remove extra cameras
        for camera in cmds.ls(cameras=True):
            if camera == 'frontShape': continue
            if camera == 'perspShape': continue
            if camera == 'sideShape': continue
            if camera == 'topShape': continue
            parent = cmds.listRelatives(camera,p=True)[0]
            cmds.delete(parent)
            
        # create control set
        if not cmds.objExists('control_set'):
            cmds.select(cmds.ls('*_ctl_*',type='transform'),r=True)
            cmds.sets(n='control_set')
        
        # remove bind set
        if cmds.objExists('bind_joints_set'):
            cmds.delete('bind_joints_set')
    
    def importControlData(self,version=None):
        
        if version:
            path = bodyPublish.getRigDataVersion(self.name,version)
        else:
            path = bodyPublish.getRigData(self.name)
        if not path: return
        
        bodyIO.importControlData(path)
    
    def importControlDataSelected(self,version=None):
        
        if version:
            path = bodyPublish.getRigDataVersion(self.name,version)
        else:
            path = bodyPublish.getRigData(self.name)
        if not path: return
        
        sel = cmds.ls(sl=True)
        
        bodyIO.importControlData(path,sel)
    
    def importSkin(self,defaultmaps,version=None):
        """Import skin data and apply skinclusters."""
        
        skip = []
        
        if defaultmaps:
            for map in defaultmaps:
                skinned = bodyIO.importSkinBySkin(map)
                bodyIO.importDeformers(map)
                skip    = skip + skinned
        
        if version:
            path = bodyPublish.getRigMappingVersion(self.name,version)
        else:
            path = bodyPublish.getRigMapping(self.name)
        if not path: return
        
        bodyIO.importSkinByRef('GEO',path,skip)
        bodyIO.importDeformers(path,skip)
    
    def importSkinSelected(self,defaultmaps,version=None):
        """Import skin data and apply skinclusters."""
        
        skip = []
        
        if defaultmaps:
            for map in defaultmaps:
                skinned = bodyIO.importSkinBySkin(map)
                bodyIO.importDeformers(map)
                skip    = skip + skinned
        
        if version:
            path = bodyPublish.getRigMappingVersion(self.name,version)
        else:
            path = bodyPublish.getRigMapping(self.name)
        if not path: return
        
        bodyIO.importSkinBySel(path)
        bodyIO.importDeformersBySel(path)
    
    def publishGuide(self,comment=''):
        """Export referenced guide components and loc_sets as guide rig."""
        
        # Export
        
        grp = 'rig_guide'
        set = 'guide_loc_set'
        
        if not cmds.objExists(grp): grp = cmds.group(n=grp,em=True)
        if not cmds.objExists(set): set = cmds.sets(n=set,em=True)
        
        cmds.select(grp,set,ne=True,r=True)
        
        tmpin  = tempfile.mkstemp('.ma')[1]
        tmpout = tempfile.mkstemp('.ma')[1]
        rigUtils.log('Saving temp file for %s: %s' % (self.name,tmpin))
        cmds.file(tmpin,pr=True,es=True,f=True,typ='mayaAscii')
        
        fin      = open(tmpin,'r')
        fout     = open(tmpout,'w')
        write    = True
        lastlock = False
        
        rigUtils.log('Removing lockNode commands from temp file: %s.ma' % tmpin)
        
        # remove lockNode commands from ma file
        for line in fin.readlines():
            
            if 'lockNode' in line: continue
            
            fout.write(line)
        
        fin.close()
        fout.close()
        
        bodyPublish.publishRigGuide(self.name,tmpout,comment)
    
    def publishControlData(self,comment=''):
        """Publish character control data."""
        
        tmp = tempfile.mkstemp('.json')[1]
        rigUtils.log('Saving temp file for %s: %s' % (self.name,tmp))
        bodyIO.exportControlData(tmp)
        
        bodyPublish.publishRigData(self.name,tmp,comment)
        
    def publishMapping(self,comment=''):
        """Publish character mapping."""

        tmp = tempfile.mkstemp('.json')[1]
        rigUtils.log('Saving temp file for %s: %s' % (self.name,tmp))
        bodyIO.exportSkinByRef('GEO',tmp)
        
        bodyPublish.publishRigMapping(self.name,tmp,'100',comment)
        
    def publishRig(self,type='anim',comment=''):
        """Publish current maya scene as rig."""
        
        tmp = tempfile.mkstemp('.ma')[1]
        rigUtils.log('Saving temp file for %s: %s' % (self.name,tmp))
        cmds.file(rn=tmp)
        cmds.file(s=True,typ='mayaAscii')
        
        rigUtils.log('Removing lockNode commands from temp file: %s' % tmp)
        
        tmp2 = tempfile.mkstemp('.ma')[1]
        
        fin      = open(tmp,'r')
        fout     = open(tmp2,'w')
        write    = True
        lastlock = False
        
        # remove lockNode commands from ma file
        for line in fin.readlines():
            if 'lockNode' in line: continue
            fout.write(line)
        
        fin.close()
        fout.close()
        
        bodyPublish.publishRig(self.name,tmp2,type,comment)
        
    def referenceFaceRig(self):
        
        cmds.setAttr('C_headFkIk_ctl_0.v',l=False,k=True)
        cmds.setAttr('C_headFkIk_ctl_0.v',1)
        cmds.setAttr('C_headFkIk_ctl_0.v',l=True,k=False)
        
        # add face attrs to head fkik control
        cmds.addAttr('C_headFkIk_ctl_0',ln='face',nn=' ',at='enum',en='Face')
        cmds.setAttr('C_headFkIk_ctl_0.face',cb=True)
        cmds.addAttr('C_headFkIk_ctl_0',ln='faceControls',at='double',min=0,max=1,dv=1)
        cmds.setAttr('C_headFkIk_ctl_0.faceControls',cb=True,k=False)
        cmds.addAttr('C_headFkIk_ctl_0',ln='advFaceControls',at='double',min=0,max=1,dv=1)
        cmds.setAttr('C_headFkIk_ctl_0.advFaceControls',cb=True,k=False)
        cmds.addAttr('C_headFkIk_ctl_0',ln='tongueControls',at='double',min=0,max=1,dv=1)
        cmds.setAttr('C_headFkIk_ctl_0.tongueControls',cb=True,k=False)
        cmds.addAttr('C_headFkIk_ctl_0',ln='followHead',at='double',min=0,max=1,dv=0)
        cmds.setAttr('C_headFkIk_ctl_0.followHead',cb=True)
        
        # get relative path to latest face rig
        path = bodyPublish.getComponent(self.name,'face',relativepath=True)
        
        if not path: return
        
        # reference into scene
        cmds.file(path,r=True,typ='mayaBinary',ns='FACE',f=True,pr=True,lrd='all')
        
        # organise heirarchy
        grp = cmds.group(n='C_face_org_0',em=True)
        cmds.parent(grp,'modules_grp')
        cmds.parent('FACE:rig_face_anim',grp)
        cmds.parentConstraint('C_head_bnd_0','FACE:transform_grp',mo=True)
        
        # get all geometry in model
        cmds.namespace(set='GEO')
        dagnodes = cmds.namespaceInfo(lod=True)
        cmds.namespace(set=':')
        
        for geo in dagnodes:
            
            if not cmds.objExists(geo): continue # groupId node disappears
            if not cmds.objectType(geo,isType='transform'): continue
            if 'antenna' in geo: continue
            
            # add facial geometry as blendshapes to model geometry
            shp = cmds.listRelatives(geo,s=True)
            if not shp: continue
            
            blend = 'FACE:model_face_100_base:%s' % string.split(geo,':')[-1]
            
            # doesn't exist, move on
            if not cmds.objExists(blend): continue
            # doesn't have any deformers driving it, move on
            if not mel.eval('findRelatedDeformer "%s"' % blend): continue
            
            cmds.setAttr('%s.v' % blend,0)
            
            # ensure geo is visible
            geosrc = cmds.listConnections('%s.v' % geo,s=True,d=False,p=True)
            if geosrc: 
                cmds.disconnectAttr(geosrc[0],'%s.v' % geo)
                cmds.setAttr('%s.v' % geo,1)
            
            shpdict = {}
            for shp in cmds.listRelatives(geo,s=True):
                shpsrc = cmds.listConnections('%s.v' % shp,s=True,d=False,p=True)
                if shpsrc:
                    shpdict[shp] = shpsrc[0]
                    cmds.disconnectAttr(shpsrc[0],'%s.v' % shp)
                    cmds.setAttr('%s.v' % shp,1)
            # check to see if there's an existing blendshape, and use it instead
            existingBlend = None
            deformers = mel.eval('findRelatedDeformer %s' % geo)
            for deformer in deformers:
                if cmds.objectType(deformer, i='blendShape'):
                    existingBlend = deformer
                    break
            if existingBlend:
                cmds.blendShape(existingBlend, edit=True, t=[geo, 1, blend, 1])
                blend = existingBlend
            else:
                blend = cmds.blendShape(blend,geo,foc=True)[0]
            
            # reconnect
            if geosrc: cmds.connectAttr(geosrc[0],'%s.v' % geo)
            for shp in shpdict:
                shpsrc = shpdict[shp]
                cmds.connectAttr(shpsrc,'%s.v' % shp)
        
            cmds.setAttr('%s.%s' % (blend,string.split(geo,':')[-1]),1)
            
            if 'helmet' in geo:
                control = None
                if cmds.objExists('C_helmetAFk_ctl_0'):
                    control = 'C_helmetAFk_ctl_0'
                elif cmds.objExists('C_hatGuardFk_ctl_0'):
                    control = 'C_hatGuardFk_ctl_0'
                    
                if control:
                    
                    rev = None
                    for connection in cmds.listConnections('%s.separate' % control, s=False,d=True):
                        if cmds.objectType(connection,isType='reverse'):
                            rev = connection
                    if not rev:
                        rev = cmds.createNode('reverse')
                        cmds.connectAttr('%s.separate' % control,'%s.inputX' % rev)
                        
                    mult = cmds.createNode('multDoubleLinear')
                    adl = cmds.createNode('addDoubleLinear')
                    clamp = cmds.createNode('clamp')
                    cmds.setAttr('%s.mnr' % clamp, 0)
                    cmds.setAttr('%s.mxr' % clamp, 1)
                    
                    cmds.connectAttr('%s.outputX' % rev,'%s.input1' % mult)
                    cmds.connectAttr('%s.squash' % control,'%s.input2' % mult)
                    cmds.connectAttr('%s.output' % mult, '%s.input1' % adl)
                    cmds.connectAttr('%s.squashOverride' % control, '%s.input2' % adl) 
                    cmds.connectAttr('%s.output' % adl, '%s.ipr' % clamp)

                    cmds.connectAttr('%s.opr' % clamp, '%s.envelope' % blend)
            
            if '_eyeInner_' in geo or '_eyeOuter_' in geo or '_eyeCornea_' in geo: cmds.setAttr('%s.origin' % blend,0)
            
            if 'teeth' in geo:
                
                cmds.setAttr('%s.origin' % blend,0)
                
                # rearrange blendshape and skincluster deformers
                deformers   = mel.eval('findRelatedDeformer "%s"' % geo)
                skincluster = None
                for x in deformers:
                    if 'skinCluster' in x:
                        skincluster = x
                        break
                    
                if not skincluster: continue
                
                cmds.reorderDeformers(blend,skincluster,geo)
                        
        # connect sticky control vis toggle
        cmds.connectAttr('C_headFkIk_ctl_0.advFaceControls','FACE:visibility_grp.stickyControlsDisplayControls')
                
        for tongue in cmds.ls('FACE:*tongue*'):
            if cmds.objectType(tongue,isType='nurbsCurve'):
                cmds.connectAttr('C_headFkIk_ctl_0.tongueControls','%s.v' % tongue)
        
        cmds.connectAttr('C_headFkIk_ctl_0.faceControls','FACE:C_faceFrame_cth_0.v')
        
        # connect eyeballs
        cmds.connectAttr('L_eye_bnd_0.rotate','FACE:preferences_grp.leftEyeBodyRigEyeIn',f=True)
        cmds.connectAttr('R_eye_bnd_0.rotate','FACE:preferences_grp.rightEyeBodyRigEyeIn',f=True)
        
        # hide face geometry
        cmds.setAttr('FACE:visibility_grp.baseModelDisplayMeshes',0)
        cmds.setAttr('FACE:visibility_grp.baseModelDisplayPrimaryMeshes',0)
        cmds.setAttr('FACE:visibility_grp.baseModelDisplaySecondaryMeshes',0)
        cmds.setAttr('FACE:visibility_grp.baseModelDisplayTertiaryMeshes',0)
        
        # constrain the antennae
        for locus in ['R','L']:
            for suffix in ['', 'Stem']:
                if not cmds.objExists('FACE:model_face_100_base:%s_antenna%s_geo_0' %(locus, suffix)):
                    continue
                    
                # toggle face ge of visibility
                cmds.setAttr('FACE:visibility_grp.baseModelDisplayMeshes',1)
                cmds.setAttr('FACE:visibility_grp.baseModelDisplayTertiaryMeshes',1)
                
                # create anchor
                anchor = cmds.spaceLocator(n='%s_antennaAnchor_loc_0' % locus)[0]
                cmds.setAttr('%s.v' % anchor, 0)
                cmds.parent(anchor,'%s_antDyn_org_0' % locus)
                
                # constrain anchor to geo
                cmds.select('FACE:model_face_100_base:%s_antenna%s_geo_0.e[46]' %(locus, suffix),r=True)
                cmds.select(anchor,add=True)
                mel.eval('doCreatePointOnPolyConstraintArgList 1 { "0","0","0","1","","1" };')
                
                # constrain antennae to anchor
                cmds.parentConstraint(anchor,'%s_antTgtFollow_loc_0' % locus,mo=True,sr=['x','y','z'])
                pConst = cmds.parentConstraint(anchor,'C_hedCtl_org_0','%s_antTgtFollow_loc_0' % locus,mo=True,st=['x','y','z'])[0]
                rev    = cmds.createNode('reverse')
                cmds.connectAttr('C_headFkIk_ctl_0.antennaeGlobal%s' % locus,'%s.C_hedCtl_org_0W1' % pConst)
                cmds.connectAttr('C_headFkIk_ctl_0.antennaeGlobal%s' % locus,'%s.inputX' % rev)
                cmds.connectAttr('%s.outputX' % rev,'%s.%sW0' % (pConst,anchor))
                cmds.setAttr('%s.interpType' % pConst,2)
                    
                # toggle face geo of visibility
                cmds.setAttr('FACE:visibility_grp.baseModelDisplayMeshes',0)
                cmds.setAttr('FACE:visibility_grp.baseModelDisplayTertiaryMeshes',0)
        
        cmds.file(path,ur='FACERN')
        cmds.parent('FACERNfosterParent1','C_face_org_0')
        
    def referenceGeo(self,type,lod,namespace):
        """Locate and reference of latest geometry when positioning the guide rig."""
        
        relpath = bodyPublish.getModel(self.name,lod,type)
        
        if not relpath:
            rigUtils.log('Error referencing model: %s, %s, %s' % (self.name,lod,type),'e')
            return
        
        # import
        rigUtils.log('Importing geo: %s' % relpath)
        try: 
            cmds.file(relpath,ns=namespace,i=True,f=True)
        except:
            rigUtils.log('Error importing file: %s' % relpath,'e')
            return
        
        # stop here if we're not working on the animation rig
        if not cmds.objExists('rig_anim_combined|geometry_grp'):
            cmds.setAttr('GEO:model_100_base.overrideEnabled',1)
            cmds.setAttr('GEO:model_100_base.overrideDisplayType',1)
            return
        
        # arrange hierarchy
        grp = '%s:model_%s_%s' % (namespace,lod,type)
        if cmds.objExists(grp): cmds.parent(grp,'rig_anim_combined|geometry_grp')
        
        return relpath
    
    def reorganiseCalamariGeo(self,joint):
                
        mesh = None
        children = cmds.listRelatives(joint,c=True)
        if not children: return
        for geo in children:
            
            if cmds.objectType(geo,isType='transform'):
                shp = cmds.listRelatives(geo,s=True)
                
                if not shp: continue
                if not cmds.objectType(shp,isType='mesh'): continue
                
                cmds.setAttr('%s.overrideDisplayType' % geo,0)
                mesh = geo
                break
        
        org = None
        ctl = None
        if mesh:
            
            org = string.replace(re.search('(?<=:)[_a-zA-Z0-9]+', mesh).group(0),'geo','org')
            ctl = string.replace(re.search('(?<=:)[_a-zA-Z0-9]+', mesh).group(0),'geo','ctl')
            cmds.group(em=True,n=org)
            cmds.parent(org,joint)
            cmds.setAttr('%s.translate' % org, 0,0,0)
            cmds.setAttr('%s.rotate' % org, 0,0,0)
            cmds.parent(mesh,org)
            cmds.makeIdentity(mesh,a=True,t=True,r=True)
            cmds.setAttr('%s.rotatePivotX' % mesh,0)
            cmds.setAttr('%s.rotatePivotY' % mesh,0)
            cmds.setAttr('%s.rotatePivotZ' % mesh,0)
            cmds.setAttr('%s.scalePivotX' % mesh,0)
            cmds.setAttr('%s.scalePivotY' % mesh,0)
            cmds.setAttr('%s.scalePivotZ' % mesh,0)
            src = cmds.listConnections('%s.v' % mesh, s=True,d=False,p=True)[0]
            cmds.disconnectAttr(src,'%s.v' % mesh)
            cmds.setAttr('%s.v' % mesh,l=True,k=False)
            cmds.rename(mesh,ctl)
            
        for child in cmds.listRelatives(joint,c=True):
            
            childorg  = None
            
            if cmds.objectType(child,isType='joint'): 
                childorg = self.reorganiseCalamariGeo(child)
                
                if not childorg: continue
                if mesh:
                    cmds.parent(childorg,ctl)
                    cmds.setAttr('%s.tx' % childorg,l=True)
                    cmds.setAttr('%s.ty' % childorg,l=True)
                    cmds.setAttr('%s.tz' % childorg,l=True)
                    cmds.setAttr('%s.rx' % childorg,l=True)
                    cmds.setAttr('%s.ry' % childorg,l=True)
                    cmds.setAttr('%s.rz' % childorg,l=True)
                    cmds.setAttr('%s.sx' % childorg,l=True)
                    cmds.setAttr('%s.sy' % childorg,l=True)
                    cmds.setAttr('%s.sz' % childorg,l=True)
                    cmds.setAttr('%s.v' % childorg,l=True)
                    
                else:
                    org = childorg
        
        return org
    
    def testGuide(self):
        
        # test for YZ plane crossing
        for set in cmds.sets('guide_loc_set',q=True):
            locus = None
            for locator in cmds.sets(set,q=True):
                
                if cmds.attributeQuery('enable',n=locator,ex=True):
                    if not cmds.getAttr('%s.enable' % locator): continue
                
                pos = cmds.xform(locator,q=True,ws=True,t=True)
                
                if round(pos[0],3) < 0:
                    tmp = 'R'
                elif round(pos[0],3) > 0:
                    tmp = 'L'
                else:
                    tmp = 'C'
                    
                if locus != None:
                    if tmp != locus:
                        rigUtils.log('Guide components must not cross the YZ plane: %s' % locator,'e')
                        return False
                else:
                    locus = tmp
        
        return True
                           
    
    def updateASComponents(self):
        """Run the advanced skeleton mel script."""
        
        # add extra cogs
        c = 'C_center_ctl_0'
        a = cmds.duplicate(c,n='C_centerA_ctl_0',rc=True)[0]
        b = cmds.duplicate(c,n='C_centerB_ctl_0',rc=True)[0]
        c = cmds.rename(c,'C_centerC_ctl_0')
        
        for x in cmds.listRelatives(a,c=True):
            if cmds.objectType(x,isType='nurbsCurve'): continue 
            cmds.delete(x)
        for x in cmds.listRelatives(b,c=True):
            if cmds.objectType(x,isType='nurbsCurve'): continue
            cmds.delete(x)
        
        cmds.scale(1.25,1.25,1.25,'%s.cv[0:7]' % b,r=True,ocp=True)
        cmds.scale(1.5,1.5,1.5,'%s.cv[0:7]' % a,r=True,ocp=True)
        cmds.parent(c,b)
        cmds.parent(b,a)
        a = cmds.listRelatives(a,s=True)[0]
        b = cmds.listRelatives(b,s=True)[0]
        c = cmds.listRelatives(c,s=True)[0]
        cmds.setAttr('%s.overrideEnabled' % a,1)
        cmds.setAttr('%s.overrideColor' % a,15)
        cmds.setAttr('%s.overrideEnabled' % b,1)
        cmds.setAttr('%s.overrideColor' % b,29)
        cmds.setAttr('%s.overrideEnabled' % c,1)
        cmds.setAttr('%s.overrideColor' % c,18)
        cmds.addAttr('C_centerA_ctl_0',ln='secondaryCOGs',at='double',min=0,max=1,dv=0)
        cmds.setAttr('C_centerA_ctl_0.secondaryCOGs',e=True,k=True)
        cmds.connectAttr('C_centerA_ctl_0.secondaryCOGs','%s.v' % b)
        cmds.connectAttr('C_centerA_ctl_0.secondaryCOGs','%s.v' % c)
        
        # add head cross
        crv = cmds.curve(n='C_headFkIk_ctl_0',d=1,p=[[6.47624,4.63246e-009,0.0529893],
                                 [6.47624,-4.63247e-009,-0.0529892],
                                 [6.158275,-4.63247e-009,-0.0529892],
                                 [6.158275,-3.24299e-008,-0.370955],
                                 [6.052296,-3.24299e-008,-0.370955],
                                 [6.052296,-4.63247e-009,-0.0529892],
                                 [5.73433,-4.63246e-009,-0.0529891],
                                 [5.73433,4.63247e-009,0.0529894],
                                 [6.052296,4.63247e-009,0.0529894],
                                 [6.052296,3.24299e-008,0.370955],
                                 [6.158275,3.24299e-008,0.370955],
                                 [6.158275,4.63247e-009,0.0529894],
                                 [6.47624,4.63246e-009,0.0529893]])
        shp = cmds.listRelatives(crv,s=True)[0]
        cmds.setAttr('%s.overrideEnabled' % shp,1)
        cmds.setAttr('%s.overrideColor' % shp, rigEnv.CONTROL_COLOR['C'])
        cmds.rename(shp,'C_headFkIk_ctl_0Shape')
        if cmds.objExists('C_headFk_ctl_0'):
            cmds.parent(crv,'C_headFk_ctl_0',r=True)
        else:
            cmds.parent(crv,'C_centerC_ctl_0',r=True)
        cmds.setAttr('%s.tx' % crv,l=True,k=False)
        cmds.setAttr('%s.ty' % crv,l=True,k=False)
        cmds.setAttr('%s.tz' % crv,l=True,k=False)
        cmds.setAttr('%s.rx' % crv,l=True,k=False)
        cmds.setAttr('%s.ry' % crv,l=True,k=False)
        cmds.setAttr('%s.rz' % crv,l=True,k=False)
        cmds.setAttr('%s.sx' % crv,l=True,k=False)
        cmds.setAttr('%s.sy' % crv,l=True,k=False)
        cmds.setAttr('%s.sz' % crv,l=True,k=False)
        cmds.setAttr('%s.v' % crv,0)
        cmds.setAttr('%s.v' % crv,l=True,k=False)
        
        # add the main cogs
        a = cmds.circle(n='C_mainA_ctl_0',ch=False,nr=[0,1,0],d=3,s=8)[0]
        b = cmds.curve(n='C_mainB_ctl_0',d=1,p=[[0,0,-2.608138], 
                          [-0.579586,0,-2.028551], 
                          [-0.289793,0,-2.028551],
                          [-0.289793,0,-0.289793],
                          [-2.028551,0,-0.289793],
                          [-2.028551,0,-0.579586],
                          [-2.608138,0,0],
                          [-2.028551,0,0.579586], 
                          [-2.028551,0,0.289793],
                          [-0.289793,0,0.289793],
                          [-0.289793,0,2.028551],
                          [-0.579586,0,2.028551],
                          [0,0,2.608138],
                          [0.579586,0,2.028551], 
                          [0.289793,0,2.028551],
                          [0.289793,0,0.289793],
                          [2.028551,0,0.289793],
                          [2.028551,0,0.579586],
                          [2.608138,0,0],
                          [2.028551,0,-0.579586], 
                          [2.028551,0,-0.289793],
                          [0.289793,0,-0.289793],
                          [0.289793,0,-2.028551],
                          [0.579586,0,-2.028551],
                          [0,0,-2.608138]])
        loc = cmds.spaceLocator(n='C_main_loc_0')[0]
        grp = cmds.group(n='C_main_mod_0')
        shp = cmds.listRelatives(b,s=True)[0]
        cmds.rename(shp,'C_mainB_ctl_0Shape')
        cmds.parent(b,a)
        cmds.parent(loc,b)
        cmds.parent(a,grp)
        cmds.parent(grp,'modules_grp')
        cmds.setAttr('%s.sx' % b,l=True,k=False)
        cmds.setAttr('%s.sy' % b,l=True,k=False)
        cmds.setAttr('%s.sz' % b,l=True,k=False)
        cmds.setAttr('%s.v' % b,l=True,k=False)
        cmds.setAttr('%s.v' % a,l=True,k=False)
        cmds.setAttr('%s.v' % loc,0,l=True,k=False)
        cmds.addAttr(a,ln='jointVis',at='double',max=1,min=0,dv=0)
        cmds.setAttr('%s.jointVis' % a,k=False,cb=False)
        
        # add the main dummy joint
        cmds.select(cl=True)
        cmds.joint(n='C_main_dmy_0')
        dummyOrg = cmds.group(n='C_mainDummy_org_0')
        cmds.setAttr('%s.v' % dummyOrg,0)
        cmds.setAttr('%s.inheritsTransform' % dummyOrg,0)
        cmds.parent(dummyOrg,grp)
        
        # hide joints
        layer = cmds.createNode('displayLayer',n='jointLayer')
        for joint in cmds.ls(type='joint'):
            cmds.connectAttr('%s.drawInfo' % layer,'%s.drawOverride' % joint,f=True)
        rev = cmds.createNode('reverse')
        cmds.connectAttr('C_mainA_ctl_0.jointVis','%s.inputX' % rev)
        cmds.connectAttr('%s.outputX' % rev,'%s.levelOfDetail' % layer)
        
        # set all parent constraint interpolation to shortest
        for pConst in cmds.ls(type='parentConstraint'):
            cmds.setAttr('%s.interpType' % pConst,2)
        
        # set all orient constraint interpolation to shortest
        for oConst in cmds.ls(type='orientConstraint'):
            cmds.setAttr('%s.interpType' % oConst,2)
        
        # change max of 10 to max of 1
        rigUtils.log('Updating max values to 1','h')
        for ctl in cmds.ls('*_ctl_*',typ='transform'):
            keyableAttrs = cmds.listAttr(ctl,k=True)
            if not keyableAttrs: continue
            
            for attr in keyableAttrs:
                if cmds.attributeQuery(attr,n=ctl,mxe=True):
                    max = cmds.attributeQuery(attr,n=ctl,max=True)[0]
                    if max == 10:
                        
                        destinations = cmds.listConnections('%s.%s' % (ctl,attr),s=False,d=True,p=True)
                        if destinations:
                            for dest in destinations:
                                
                                node = string.split(dest,'.')[0]
                                plug = string.split(dest,'.')[1]
                            
                                if cmds.objectType(node,isType='setRange'):
                                
                                    y = plug[-1]
                                
                                    oldmin = cmds.getAttr('%s.oldMin%s' % (node,y))
                                    newmin = oldmin*.1
                                    cmds.setAttr('%s.oldMin%s' % (node,y),newmin)
                                    
                                    oldmax = cmds.getAttr('%s.oldMax%s' % (node,y))
                                    newmax = oldmax*.1
                                    cmds.setAttr('%s.oldMax%s' % (node,y),newmax)
                                    
                                elif cmds.objectType(node,isType='unitConversion'):
                                    
                                    cmds.setAttr('%s.conversionFactor' % node,1)
                        
                        if cmds.getAttr('%s.%s' % (ctl,attr)) == 10: cmds.setAttr('%s.%s' % (ctl,attr),1)
                        cmds.addAttr('%s.%s' % (ctl,attr),e=True,max=max*.1)
                        
                        rigUtils.log('Max value updated to 1: %s' % ctl)
        
        # change min from -10 to -1
        rigUtils.log('Updating min values to -1','h')
        for ctl in cmds.ls('*_ctl_*',typ='transform'):
            keyableAttrs = cmds.listAttr(ctl,k=True)
            if not keyableAttrs: continue
            
            for attr in keyableAttrs:
                if cmds.attributeQuery(attr,n=ctl,mne=True):
                    min = cmds.attributeQuery(attr,n=ctl,min=True)[0]
                    if min == -10:
                        
                        destinations = cmds.listConnections('%s.%s' % (ctl,attr),s=False,d=True,p=True)
                        if destinations:
                            for dest in destinations:
                                
                                node = string.split(dest,'.')[0]
                                plug = string.split(dest,'.')[1]
                            
                                if cmds.objectType(node,isType='setRange'):
                                
                                    y = plug[-1]
                                
                                    oldmin = cmds.getAttr('%s.oldMin%s' % (node,y))
                                    newmin = oldmin*.1
                                    cmds.setAttr('%s.oldMin%s' % (node,y),newmin)
                                    
                                    oldmax = cmds.getAttr('%s.oldMax%s' % (node,y))
                                    newmax = oldmax*.1
                                    cmds.setAttr('%s.oldMax%s' % (node,y),newmax)
                                    
                                elif cmds.objectType(node,isType='unitConversion'):
                                    
                                    cmds.setAttr('%s.conversionFactor' % node,1)
                        
                        if cmds.getAttr('%s.%s' % (ctl,attr)) == -10: cmds.setAttr('%s.%s' % (ctl,attr),1)
                        cmds.addAttr('%s.%s' % (ctl,attr),e=True,min=min*.1)
                        
                        rigUtils.log('Min value updated to -1: %s' % ctl)
        
        # set global to off for all applicable controls
        rigUtils.log('Setting globals','h')
        for ctl in cmds.ls('*_ctl_*',typ='transform'):
            keyableAttrs = cmds.listAttr(ctl,k=True)
            if not keyableAttrs: continue
            
            for attr in keyableAttrs:
                if attr == 'Global':
                    cmds.setAttr('%s.%s' % (ctl,attr),0)
                    rigUtils.log('Set global to zero: %s' % ctl)
        
        # set blendColor node color 2 attributes to 1
        for bc in cmds.ls(type='blendColors'):
            if cmds.listConnections('%s.color2' % bc,s=True,d=False): continue
            cmds.setAttr('%s.color2R' % bc,1)
            cmds.setAttr('%s.color2G' % bc,1)
        
        # remove all non-bind joints from the jointLayer
        layer = cmds.createNode('displayLayer',n='controlJointLayer')
        cmds.setAttr('%s.levelOfDetail' % layer,1)
        connections = cmds.listConnections('jointLayer.drawInfo',s=False,d=True,p=True)
        for connection in connections:
            if '_bnd_' not in connection:
                cmds.disconnectAttr('jointLayer.drawInfo',connection)
                cmds.connectAttr('%s.drawInfo' % layer,connection)
