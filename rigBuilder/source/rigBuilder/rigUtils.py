"""

    Common utilities useful to rigging
    ----------------------------------
    
    Author: Evan (The Man) Jacobson
    
"""

import os, string, re, rigEnv
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as openmaya
import maya.OpenMayaAnim as openmayaanim

def addGuideAttrs(node):
    
    if not cmds.attributeQuery('order',n=node,ex=True):
        cmds.addAttr(node,ln='order',dt='string')
        cmds.setAttr('%s.order' % node,'zyx',typ='string')
        
    if not cmds.attributeQuery('secondaryAxis',n=node,ex=True):
        cmds.addAttr(node,ln='secondaryAxis',dt='string')
        cmds.setAttr('%s.secondaryAxis' % node,'yup',typ='string')
        
    if not cmds.attributeQuery('label',n=node,ex=True):
        cmds.addAttr(node,ln='label',at='enum',en='none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe')
    
    if not cmds.attributeQuery('otherType',n=node,ex=True):
        cmds.addAttr(node,ln='otherType',dt='string')
        
    if not cmds.attributeQuery('twist',n=node,ex=True):
        cmds.addAttr(node,ln='twist',at='long',min=0,max=1,dv=0)
        
    if not cmds.attributeQuery('bend',n=node,ex=True):
        cmds.addAttr(node,ln='bend',at='long',min=0,max=1,dv=0)
        
    if not cmds.attributeQuery('global',n=node,ex=True):
        cmds.addAttr(node,ln='global',at='long',min=0,max=1,dv=0)
    
    
def boundCurveToJoints(jnts, prefix, locus, count, offset=[0.0, 0.0, 0.0], degree=3):
    """Create and bind a curve to a set of joints. One cv per joint."""

    crv = '%s_%s_crv_%s' % (locus, prefix, int(count))
    cmd = 'import maya.cmds as cmds; cmds.curve(n=\'%s\',d=%s,p=[' % (crv, degree)

    for i in range(len(jnts)):
        x, y, z = cmds.xform(jnts[i], q=True, ws=True, t=True)
        cmd = '%s[%s,%s,%s]' % (cmd, x + offset[0], y + offset[1], z + offset[2])
        if i == len(jnts) - 1: break
        cmd = '%s,' % cmd

    cmd = '%s])' % cmd
    run = compile(cmd, '', 'exec')
    eval(run)

    skincluster = cmds.skinCluster(jnts, crv)[0]
    for i in range(len(jnts)):
        cmds.skinPercent(skincluster, '%s.cv[%s]' % (crv, i), tv=[jnts[i], 1])

    return crv


def boundCurveToLocators(locators, prefix, locus, count):
    """Create and bind a curve to a set of locators. One cv per locator."""

    crv = '%s_%s_crv_%s' % (locus, prefix, int(count))
    cmd = 'import maya.cmds as cmds; cmds.curve(n=\'%s\',d=3,p=[' % crv

    for i in range(len(locators)):
        x, y, z = cmds.xform(locators[i], q=True, ws=True, t=True)
        cmd = '%s[%s,%s,%s]' % (cmd, x, y, z)

        if i == len(locators) - 1: break

        cmd = '%s,' % cmd

    cmd = '%s])' % cmd
    run = compile(cmd, '', 'exec')
    eval(run)

    for i in range(len(locators)):
        shp = cmds.listRelatives(locators[i], s=True)[0]
        cmds.connectAttr('%s.worldPosition' % shp, '%s.cv[%s]' % (crv, i))

    return crv


def boundLocatorsToCurve(number, prefix, curve, locus, count, vectorprefix=None):
    """Create and bind a set of locators to a curve, spaced equally."""

    if number == 1.0:
        step = 0.5
    else:
        # get length
        spans = cmds.getAttr('%s.cp' % curve, s=1)
        midpoint = (spans - 1.0) / 2.0
        posStart = cmds.xform('%s.cv[0]' % curve, q=True, ws=True, t=True)
        posMid = cmds.xform('%s.cv[%s]' % (curve, midpoint), q=True, ws=True, t=True)
        posEnd = cmds.xform('%s.cv[%s]' % (curve, spans - 1), q=True, ws=True, t=True)

        tmpDistA = cmds.createNode('distanceBetween')
        tmpDistB = cmds.createNode('distanceBetween')

        # length of first CP to mid CP
        cmds.setAttr('%s.point1X' % tmpDistA, posStart[0])
        cmds.setAttr('%s.point1Y' % tmpDistA, posStart[1])
        cmds.setAttr('%s.point1Z' % tmpDistA, posStart[2])
        cmds.setAttr('%s.point2X' % tmpDistA, posMid[0])
        cmds.setAttr('%s.point2Y' % tmpDistA, posMid[1])
        cmds.setAttr('%s.point2Z' % tmpDistA, posMid[2])
        halfdist = cmds.getAttr('%s.distance' % tmpDistA)

        # length of last CP to mid CP
        cmds.setAttr('%s.point1X' % tmpDistB, posMid[0])
        cmds.setAttr('%s.point1Y' % tmpDistB, posMid[1])
        cmds.setAttr('%s.point1Z' % tmpDistB, posMid[2])
        cmds.setAttr('%s.point2X' % tmpDistB, posEnd[0])
        cmds.setAttr('%s.point2Y' % tmpDistB, posEnd[1])
        cmds.setAttr('%s.point2Z' % tmpDistB, posEnd[2])
        fulldist = cmds.getAttr('%s.distance' % tmpDistB) + halfdist
        
        midUpos = halfdist / fulldist
        locmidpoint = (number - 1.0) / 2.0
        stepA = midUpos / locmidpoint
        stepB = (1 - midUpos) / locmidpoint

    step = 0.0
    locators = []
    for i in range(number):

        loc = '%s_%s%s_loc_%s' % (locus, prefix, i, int(count))
        loc = cmds.spaceLocator(n=loc)[0]

        if vectorprefix:
            vecloc = '%s_%s%s_loc_%s' % (locus, vectorprefix, i, int(count))
            path = '%s_%s%s_path_%s' % (locus, prefix, i, int(count))
            path = cmds.pathAnimation(loc, n=path, c=curve, fm=True, ua='y', fa='x', wut='object', wuo=vecloc, f=True)
        else:
            path = '%s_%s%s_path_%s' % (locus, prefix, i, int(count))
            path = cmds.pathAnimation(loc, n=path, c=curve, fm=True)
        src = cmds.listConnections('%s.u' % path, s=True, d=False, p=True)[0]
        cmds.disconnectAttr(src, '%s.u' % path)

        # set U value
        if number == 1:
            cmds.setAttr('%s.u' % path, 0.5)
        elif not i: # value of 0 for motion path U causes issues
            cmds.setAttr('%s.u' % path, .001)
        elif i == number - 1: # likewise, value of greater than 0.995 for motion path U causes issues
            cmds.setAttr('%s.u' % path, .995)
        else:
            cmds.setAttr('%s.u' % path, step)

        if i < locmidpoint:
            step = step + stepA
        elif i >= locmidpoint:
            step = step + stepB
        
        # remove addDoubleLinear nodes
        cmds.connectAttr('%s.allCoordinates' % path, '%s.translate' % loc)
        cmds.delete(cmds.listConnections('%s.xCoordinate' % path, s=False, d=True)[0])
        cmds.delete(cmds.listConnections('%s.yCoordinate' % path, s=False, d=True)[0])
        cmds.delete(cmds.listConnections('%s.zCoordinate' % path, s=False, d=True)[0])

        locators.append(loc)

    return locators

def createGuideLoc():
    
    i = 0
    while True:
        name = 'C_guide%s_loc_X' % i
        if not cmds.objExists(name): break
        i = i + 1
    
    loc = cmds.spaceLocator(n=name)[0]
    
    addGuideAttrs(loc)
    
    return loc

def createGuideLocSet():
    
    if cmds.objExists('loc_set'): return
    
    cmds.select(cl=True)
    cmds.sets(n='loc_set')

def createSquashControl(name,namespace,locus,count):

    # controls
    squashctl = cmds.curve(n='%s_%sSquash_ctl_%s' % (locus,name,count),d=1,p=[[-.5,0,-.5],[.5,0,.5],[-.5,0,.5],[.5,0,-.5],[.5,0,.5],[.5,0,-.5],[-.5,0,-.5],[-.5,0,.5]])
    basectl   = cmds.curve(n='%s_%sSquashBase_ctl_%s' % (locus,name,count),d=1,p=[[-.75,0,-.75],[.75,0,.75],[-.75,0,.75],[.75,0,-.75],[.75,0,.75],[.75,0,-.75],[-.75,0,-.75],[-.75,0,.75]])
    cth       = cmds.group(n='%s_%sSquash_cth_%s' % (locus,name,count))
    ctg       = cmds.group(n='%s_%sSquash_ctg_%s' % (locus,name,count))
    off       = cmds.group(n='%s_%sSquash_off_%s' % (locus,name,count),em=True)
    bndorg    = cmds.group(n='%s_%sSquashBind_off_%s' % (locus,name,count),em=True)
    
    cmds.setAttr('%s.overrideEnabled' % ctg,1)
    cmds.setAttr('%s.overrideColor' % ctg,6)
    cmds.addAttr(basectl,ln='groundPlaneSquash',at='double',min=0,max=1,dv=0)
    cmds.setAttr('%s.groundPlaneSquash' % basectl,e=True,k=True)
    cmds.addAttr(basectl,ln='volumePreservation',at='double',min=0,max=1,dv=0)
    cmds.setAttr('%s.volumePreservation' % basectl,e=True,k=True)
    cmds.addAttr(basectl,ln='squashScale',at='double',dv=1)
    cmds.setAttr('%s.squashScale' % basectl,e=True,k=True)
    cmds.addAttr(basectl,ln='follow',at='double',min=0,max=1,dv=1)
    cmds.setAttr('%s.follow' % basectl,e=True,k=True)
    cmds.parent(squashctl,basectl)
    cmds.parent(off,squashctl)
    
    cmds.connectAttr('%s.squashScale' % basectl, '%s.sy' % off)
    
    cmds.setAttr('%s.tx' % off,l=True,k=False)
    cmds.setAttr('%s.tz' % off,l=True,k=False)
    cmds.setAttr('%s.rx' % off,l=True,k=False)
    cmds.setAttr('%s.ry' % off,l=True,k=False)
    cmds.setAttr('%s.rz' % off,l=True,k=False)
    cmds.setAttr('%s.sx' % off,l=True,k=False)
    cmds.setAttr('%s.sy' % off,l=True,k=False)
    cmds.setAttr('%s.sz' % off,l=True,k=False)
    cmds.setAttr('%s.v' % off,0,l=True,k=False)
    
    cmds.setAttr('%s.sx' % basectl,l=True,k=False)
    cmds.setAttr('%s.sy' % basectl,l=True,k=False)
    cmds.setAttr('%s.sz' % basectl,l=True,k=False)
    cmds.setAttr('%s.v' % basectl,l=True,k=False)
    cmds.setAttr('%s.tx' % squashctl,l=True,k=False)
    cmds.setAttr('%s.tz' % squashctl,l=True,k=False)
    cmds.setAttr('%s.rx' % squashctl,l=True,k=False)
    cmds.setAttr('%s.ry' % squashctl,l=True,k=False)
    cmds.setAttr('%s.rz' % squashctl,l=True,k=False)
    cmds.setAttr('%s.sx' % squashctl,l=True,k=False)
    cmds.setAttr('%s.sy' % squashctl,l=True,k=False)
    cmds.setAttr('%s.sz' % squashctl,l=True,k=False)
    cmds.setAttr('%s.v' % squashctl,l=True,k=False)
    
    # ground plane lattice
    cmds.select(cl=True)
    ffd,lat,bse = cmds.lattice(n='%s_%sGround_ffd_%s' % (locus,name,count),dv=[2,5,2],ldv=[2,2,2])
    cmds.scale(100,100,100,lat,bse)
    cmds.move(0,-0.001,0,'%s.pt[0:1][1][0]' % lat,'%s.pt[0:1][1][1]' % lat,ws=True,z=False,x=False,y=True)
    cmds.move(0,-0.002,0,'%s.pt[0:1][0][0]' % lat,'%s.pt[0:1][0][1]' % lat,ws=True,z=False,x=False,y=True)
    cmds.parent(lat,bse,off)
    cmds.setAttr('%s.outsideLattice' % ffd,1)
    cmds.connectAttr('%s.groundPlaneSquash' % basectl, '%s.envelope' % ffd)
    
    # volume preservation lattice
    cmds.select(cl=True)
    ffd,lat,bse = cmds.lattice(n='%s_%sVolume_ffd_%s' % (locus,name,count),dv=[2,20,2],ldv=[10,10,10])
    cmds.scale(100,12,100,lat,bse)
    cmds.parent(lat,bse,off)
    cmds.setAttr('%s.outsideLattice' % ffd,0)
    cmds.connectAttr('%s.volumePreservation' % basectl, '%s.envelope' % ffd)
    
    # joints
    cmds.select(cl=True)
    jnt1  = cmds.joint(n='%s_%sSquash1_bnd_%s' % (locus,name,count))
    cmds.setAttr('%s.v' % jnt1,0)
    
    cmds.select(cl=True)
    jnt2 = cmds.joint(n='%s_%sSquash2_bnd_%s' % (locus,name,count))
    mult  = cmds.createNode('multiplyDivide')
    avg   = cmds.createNode('plusMinusAverage')
    clamp = cmds.createNode('clamp')
    cmds.connectAttr('%s.ty' % squashctl,'%s.inputG' % clamp)
    cmds.connectAttr('%s.outputG' % clamp,'%s.input1Y' % mult)
    cmds.connectAttr('%s.outputY' % mult,'%s.input1D[0]' % avg)
    cmds.connectAttr('%s.output1D' % avg,'%s.sx' % jnt2)
    cmds.connectAttr('%s.output1D' % avg,'%s.sz' % jnt2)
    cmds.setAttr('%s.maxG' % clamp,9999)
    cmds.setAttr('%s.input2Y' % mult,2)
    cmds.setAttr('%s.input1D[1]' % avg,1)
    cmds.setAttr('%s.v' % jnt2,0)
    
    cmds.select(cl=True)
    jnt3 = cmds.joint(n='%s_%sSquash3_bnd_%s' % (locus,name,count))
    mult  = cmds.createNode('multiplyDivide')
    avg   = cmds.createNode('plusMinusAverage')
    clamp = cmds.createNode('clamp')
    cmds.connectAttr('%s.ty' % squashctl,'%s.inputG' % clamp)
    cmds.connectAttr('%s.outputG' % clamp,'%s.input1Y' % mult)
    cmds.connectAttr('%s.outputY' % mult,'%s.input1D[0]' % avg)
    cmds.connectAttr('%s.output1D' % avg,'%s.sx' % jnt3)
    cmds.connectAttr('%s.output1D' % avg,'%s.sz' % jnt3)
    cmds.setAttr('%s.maxG' % clamp,9999)
    cmds.setAttr('%s.input2Y' % mult,4)
    cmds.setAttr('%s.input1D[1]' % avg,1)
    cmds.setAttr('%s.v' % jnt3,0)
    
    cmds.select(cl=True)
    jnt4 = cmds.joint(n='%s_%sSquash4_bnd_%s' % (locus,name,count))
    mult  = cmds.createNode('multiplyDivide')
    avg   = cmds.createNode('plusMinusAverage')
    clamp = cmds.createNode('clamp')
    cmds.connectAttr('%s.ty' % squashctl,'%s.inputG' % clamp)
    cmds.connectAttr('%s.outputG' % clamp,'%s.input1Y' % mult)
    cmds.connectAttr('%s.outputY' % mult,'%s.input1D[0]' % avg)
    cmds.connectAttr('%s.output1D' % avg,'%s.sx' % jnt4)
    cmds.connectAttr('%s.output1D' % avg,'%s.sz' % jnt4)
    cmds.setAttr('%s.maxG' % clamp,9999)
    cmds.setAttr('%s.input2Y' % mult,4)
    cmds.setAttr('%s.input1D[1]' % avg,1)
    cmds.setAttr('%s.v' % jnt4,0)
    
    cmds.select(cl=True)
    jnt5 = cmds.joint(n='%s_%sSquash5_bnd_%s' % (locus,name,count))
    mult  = cmds.createNode('multiplyDivide')
    avg   = cmds.createNode('plusMinusAverage')
    clamp = cmds.createNode('clamp')
    cmds.connectAttr('%s.ty' % squashctl,'%s.inputG' % clamp)
    cmds.connectAttr('%s.outputG' % clamp,'%s.input1Y' % mult)
    cmds.connectAttr('%s.outputY' % mult,'%s.input1D[0]' % avg)
    cmds.connectAttr('%s.output1D' % avg,'%s.sx' % jnt5)
    cmds.connectAttr('%s.output1D' % avg,'%s.sz' % jnt5)
    cmds.setAttr('%s.maxG' % clamp,9999)
    cmds.setAttr('%s.input2Y' % mult,2)
    cmds.setAttr('%s.input1D[1]' % avg,1)
    cmds.setAttr('%s.v' % jnt5,0)
    
    pos = cmds.xform('%s.pt[0][10][1]' % lat,q=True,ws=True,t=True)
    cmds.move(0,pos[1],0,jnt2,ws=True)
    pos = cmds.xform('%s.pt[0][11][1]' % lat,q=True,ws=True,t=True)
    cmds.move(0,pos[1],0,jnt3,ws=True)
    pos = cmds.xform('%s.pt[0][12][1]' % lat,q=True,ws=True,t=True)
    cmds.move(0,pos[1],0,jnt4,ws=True)
    pos = cmds.xform('%s.pt[0][13][1]' % lat,q=True,ws=True,t=True)
    cmds.move(0,pos[1],0,jnt5,ws=True)
    
    joints      = [jnt1,jnt2,jnt3,jnt4,jnt5]
    skincluster = cmds.skinCluster(joints, lat, sm=2, foc=True, tsb=True)[0]
    
    for a in range(2):
        for b in range(2):
            for c in range(10):
                cmds.skinPercent(skincluster,'%s.pt[%s][%s][%s]' % (lat,a,c,b),tv=[joints[0],1])
            for c in range(1,5):
                cmds.skinPercent(skincluster,'%s.pt[%s][%s][%s]' % (lat,a,c+9,b),tv=[joints[c],1])
            for c in range(14,20):
                cmds.skinPercent(skincluster,'%s.pt[%s][%s][%s]' % (lat,a,c,b),tv=[joints[0],1])
                
    if cmds.objExists('%s_%sDyn_org_%s' % (locus,namespace,count)):
        cmds.setAttr('%s.inheritsTransform' % bndorg,0)
        cmds.parent(bndorg,'%s_%sBind_org_%s' % (locus,namespace,count))
        cmds.parent(joints,bndorg)
        cmds.parent(ctg,'%s_%sDyn_org_%s' % (locus,namespace,count))

def convertNameConventionAStoFB(count=0,namespace=None):

    for dag in cmds.sets('AllSet', q=True):
        if not cmds.objExists(dag): continue
        if 'Shape' in dag and not cmds.objectType(dag, isType='animCurveUU'): continue
        if cmds.objectType(dag, isType='dagPose'): continue
        if cmds.objectType(dag, isType='displayLayer'): continue
        if cmds.objectType(dag, isType='objectSet'): continue
        
        buff = string.split(dag, '_')
        # locus 
        locus = getLocus(buff)
        if locus == 'M':
            locus = 'C'
        # description
        description = getDescription(buff,namespace)
        # type            
        type = getType(dag)
        
        cmds.rename(dag, '_'.join([locus, description, type, str(count)]))
        
    for effector in cmds.ls(type='ikEffector'):
        p = cmds.listRelatives(effector, p=True)[0]
        buffer = string.split(effector, '_')
        buffer[1] = string.split(p, '_')[1]
        cmds.rename(effector, '_'.join([buffer[0],buffer[1],buffer[-2],buffer[-1]]))

def findSkinClusterOnNode(dagnode):
    
    if not cmds.objExists(dagnode): return False
    
    skincluster = None
    deformers   = mel.eval('findRelatedDeformer "%s"' % dagnode)

    for x in deformers:
        if cmds.objectType(x, isType='skinCluster'):
            skincluster = x
            break

    return skincluster


def getAvailableComponents():
    """Return list of components with valid guide rigs, in alphabetical order."""

    components = []

    for component in os.listdir(rigEnv.ROOTCOMP):
        path = '%s/%s/guide/%s_guide.ma' % (rigEnv.ROOTCOMP, component, component)
        if os.path.exists(path): components.append(component)
    components.sort()

    return components


def getDefDictionary(dagnode):

    dict = {}
    deformers = mel.eval('findRelatedDeformer "%s"' % dagnode)

    # temporarily disable deleteComponent nodes
    for delComp in cmds.ls('deleteComponent*'):
            cmds.setAttr('%s.nodeState' % delComp,1)
                
    for deform in deformers:
        
        if 'tweak' in deform:
            continue
        
        elif cmds.objectType(deform) in ['blendShape', 'nonLinear']:
            continue
        
        elif cmds.objectType(deform, isType='skinCluster'):
            dict = getSkinClusterAsDictionary(deform, dict)
        
        elif cmds.objectType(deform, isType='ffd'):
            dict = getFFDAsDictionary(deform, dagnode, dict)
        
        else:
            dict = getDeformersAsDictionary(deform, dagnode, dict)
    
    # turn deleteComponent nodes back on
    for delComp in cmds.ls('deleteComponent*'):
            cmds.setAttr('%s.nodeState' % delComp,0)
            
    return dict


def getFFDAsDictionary(deformer, dagnode, dict={}):
    
    count   = cmds.polyEvaluate(dagnode,v=True)
    members = cmds.ls(cmds.sets(cmds.listConnections('%s.message' % deformer, s=False, d=True, p=False, t='objectSet')[-1], q=True), fl=True)
    tmp     = []
    
    for i in range(count):
        if '%s.vtx[%s]' % (dagnode,i) in members:
            tmp.append('1')
        else:
            tmp.append('0')
    
    dict[deformer] = tmp
    
    return dict
    

def getDeformersAsDictionary(deformer, dagnode, dict={}):
    """ Testing softmod weight export. Doesn't do much but print the softmod weight value per vertex."""
    
    # get shape of dagnode
    shape = cmds.listRelatives(dagnode,s=True)
    if not shape: return
    shape = shape[0]

    # get deformer
    selection = openmaya.MSelectionList()
    selection.add(deformer)
    deformerobject = openmaya.MObject()
    selection.getDependNode(0, deformerobject)
    softmod = openmayaanim.MFnWeightGeometryFilter(deformerobject)

    # get dagpath to skinned object
    path = openmaya.MDagPath()
    
    # find the correct geo to extract deformation weighting from. Need to account for deleteComponent nodes
    i = 0
    while True:
        try:
            softmod.getPathAtIndex(i, path) # hardcoded to first element - should iterate
            if shape == path.partialPathName():
                break
        except RuntimeError: 
            return
        i = i + 1
    
    weightdata = []
    it = openmaya.MItGeometry(path)
    while not it.isDone(): # step through vertices

        posarray = []
        weightarray = []

        comp = it.currentItem() # get vertex
        db = openmaya.MFloatArray() # place holder

        # get softmod weights
        softmod.getWeights(path, comp, db)
        weightdata.append(db[0])
        it.next()

    if weightdata: dict[deformer] = weightdata

    return dict


def getDescription(buffer,namespace=None):

    name = buffer[0]
    
    if len(buffer) > 1:
        if len(buffer[1]) > 2:
            name = '%s%s' % (buffer[0], buffer[1][1:])

    point = re.match('[a-zA-Z0-9]+(?=Point)', name)
    part  = re.match('[a-zA-Z0-9]+(?=Part)', name)
    blend = re.match('[a-zA-Z0-9]+(?=blend)', name)
    if point:
        i = len(point.group(0))
        description = '%s%s' % (name[:i - 1], name[i:])

    elif part:
        i = len(part.group(0))
        description = '%s%s' % (name[:i - 1], name[i:])

    elif blend:
        i = len(blend.group(0))
        description = '%s%s' % (name[:i - 1], name[i:])

    elif re.match('[0-9]+', name[-2:]):
        description = '%s' % name[:-2]

    elif re.match('[0-9]+', name[-1]) and 'Spine' not in name and 'Spline' not in name :
        #elif re.match('[0-9]+', name[-1]) and 'Spine' not in name:
        description = name[:-1]

    else: description = name
    
    if 'Extra' in name:
        description = string.replace(description, 'Extra', '')
    elif 'Offset' in name:
        description = string.replace(description, 'Offset', '')
    elif 'Annotation' in name:
        description = string.replace(description, 'Annotation', '')
    elif 'distance' in name:
        description = string.replace(description, 'distance', '')
    elif 'Locator' in name:
        description = string.replace(description, 'Locator', '')
    elif 'ParentConstraint' in name:
        description = string.replace(description, 'ParentConstraint', '')
    elif 'AimConstraint' in name:
        description = string.replace(description, 'AimConstraint', '')
    elif 'Handle' in name:
        description = string.replace(description, 'Handle', '')
    elif 'PointOnCurveInfo' in name:
        description = string.replace(description, 'PointOnCurveInfo', '')
    elif 'Reverse' in name:
        description = string.replace(description, 'Reverse', '')
    elif 'Condition' in name:
        description = string.replace(description, 'Condition', '')
    elif 'SetRange' in name:
        description = string.replace(description, 'SetRange', '')
    
    if 'Spline' in name:
        description = string.replace(description, 'Spline', namespace.title())
    if 'spline' in name:
        description = string.replace(description, 'Spline', namespace)

    if name[:4] == 'FKIK':
        description = '%sFkIk' % description[4:]
    elif name[:3] == 'IKX':
        description = '%sIk' % description[3:]
    elif name[:3] == 'FKX':
        description = '%sFk' % description[3:]
    elif name[:2] == 'IK':
        description = '%sIk' % description[2:]
    elif name[:2] == 'FK':
        description = '%sFk' % description[2:]

    description = '%s%s' % (description[0].lower(), description[1:])

    return description


def getLocus(buffer):

    if len(buffer) > 1:

        if buffer[1][0] != 'R' and buffer[1][0] != 'L' and buffer[1][0] != 'M':

            if len(buffer) == 3: locus = buffer[2]
            else: locus = 'M'
        else:
            locus = buffer[1][0]
    else:
        locus = 'M'

    return locus


def getSkinClusterAsDictionary(skincluster, dict={}):
    """Spit out a dictionary containing the skin data per vertex of a dagnode."""

    skindict = {}

    # get skin cluster
    selection = openmaya.MSelectionList()
    selection.add(skincluster)
    clusterobject = openmaya.MObject()
    selection.getDependNode(0, clusterobject)
    skin = openmayaanim.MFnSkinCluster(clusterobject)

    # get influences
    influences = openmaya.MDagPathArray()
    infcount = skin.influenceObjects(influences)

    strinfluences = []
    for i in range(infcount):
        infpath = influences[i]
        strinfluences.append(infpath.partialPathName())

    # get dagpath to skinned object
    skinpath = openmaya.MDagPath()
    skin.getPathAtIndex(0, skinpath) # hardcoded to first element - should iterate

    skindict['influences'] = strinfluences
    pointdata = {}

    it = openmaya.MItGeometry(skinpath)
    while not it.isDone(): # step through vertices

        posarray = []
        weightarray = []

        comp = it.currentItem() # get vertex
        db = openmaya.MDoubleArray() # place holder

        # get skin weights
        for i in range(infcount): # step through influences
            skin.getWeights(skinpath, comp, i, db)
            weightarray.append(db[0])

        # get blend weights
        skin.getBlendWeights(skinpath, comp, db)
        blendweight = (db[0])

        # get vertex positions
        point = openmaya.MPoint(it.position(openmaya.MSpace.kWorld))
        posarray.append(point.x)
        posarray.append(point.y)
        posarray.append(point.z)

        pointdata[it.index()] = {'position':posarray, 'skinweights':weightarray, 'blendweight':blendweight}

        it.next()

    skindict['pointdata'] = pointdata
    dict['skinCluster'] = skindict

    return dict


def getType(dag):

    type = cmds.objectType(dag)

    if type == 'joint':
        if 'Offset' in dag: return 'ctj'
        elif 'Bind_org_' in cmds.listRelatives(dag, p=True, f=True)[0]:
            return 'bnd'
        else: return 'jnt'

    if type == 'transform':
        
        shp = cmds.listRelatives(dag, s=True)
        children = cmds.listRelatives(dag, c=True)

        if shp:
            shp     = shp[0]
            shpType = cmds.objectType(shp)
            if shpType == 'nurbsCurve':
                if cmds.sets(dag,im='ControlSet'): return 'ctl'
                else: return 'crv'
            elif shpType == 'locator': return 'loc'
            elif shpType == 'distanceDimShape': return 'dst'
            elif shpType == 'annotationShape': return 'ann'

        elif 'Extra' in dag: return 'cth'

        elif not children:
            dest = cmds.listConnections('%s.parentMatrix[0]' % dag, s=False, d=True)
            if dest:
                if cmds.objectType(dest[0], isa='constraint'): return 'tgt'
            else: return 'org'

        elif children:
            jointchild  = cmds.objectType(children[0], isType='joint')
            transparent = cmds.objectType(cmds.listRelatives(dag, p=True)[0], isType='transform')
            if jointchild and transparent: return 'jth'
            else: return 'org'

        else: return 'org'

    if type == 'pointConstraint': return 'ptc'
    if type == 'orientConstraint': return 'orc'
    if type == 'parentConstraint': return 'prc'
    if type == 'aimConstraint': return 'amc'
    if type == 'poleVectorConstraint': return'pvc'
    if type == 'tangentConstraint': return'tnc'
    if type == 'ikEffector': return 'eff'
    if type == 'ikHandle': return 'hdl'
    if type == 'blendColors': return 'bcl'
    if type == 'animCurveUU': return 'acu'
    if type == 'blendTwoAttr': return 'bta'
    if type == 'clamp': return 'clp'
    if type == 'condition': return 'con'
    if type == 'multiplyDivide': return 'mdn'
    if type == 'pointOnCurveInfo': return 'poc'
    if type == 'reverse': return 'rev'
    if type == 'setRange': return 'str'
    if type == 'plusMinusAverage': return 'avg'
    if type == 'unitConversion': return 'ucv'
    if type == 'curveInfo': return 'cvi'

    return 'foo'


def listRelatives(dagnode,s=True):
    """Curse Maya's default listRelatives command and it returning shapes all the time. Here's my own, without shapes!"""
    
    allChildren = cmds.listRelatives(dagnode,c=True)
    allShapes   = cmds.listRelatives(dagnode,s=True)
    children    = []
    
    if not allChildren: return children
    
    for x in allChildren:
        if not s and allShapes:
            if x in allShapes: continue
        children.append(x)
    
    return children


def log(msg, type=''):
    """Convenience method for outputting messages."""

    prefix  = 'rig >> '
    postfix = ''
    
    if type == 'w': # warning
        prefix = 'rig >> Warning - '
    elif type == 'e': # error
        prefix = 'rig >> ERROR - '
    elif type == 'h': # heading
        prefix  = 'rig >> ----\nrig >> '
        postfix = '\nrig >> ---- '

    print '%s%s%s' % (prefix,msg,postfix)


def mirrorShapes():

    for node1 in cmds.ls('R_*_ctl_*'):
        if not cmds.objectType(node1, isType='transform'): continue

        for shpSrc in cmds.listRelatives(node1, s=True):

            shpDest = 'L%s' % shpSrc[1:]
            if not cmds.objExists(shpDest): continue

            form = cmds.getAttr('%s.form' % shpSrc)
            if form == 0:
                cvs = cmds.getAttr('%s.spans' % shpSrc) + cmds.getAttr('%s.degree' % shpSrc)
            elif form == 2:
                cvs = cmds.getAttr('%s.spans' % shpSrc)

            for i in range(cvs):

                pos = cmds.xform('%s.cv[%s]' % (shpSrc, i), q=True, ws=True, t=True)
                cmds.move(pos[0] * -1, pos[1], pos[2], '%s.cv[%s]' % (shpDest, i), ws=True)


def searchForDagNodesWithSameName():

    dict = {}
    nodes = []
    for dag in cmds.ls(dag=True, l=True):

        dag = string.split(dag, '|')[-1]

        if dag not in dict: dict[dag] = 1
        else: dict[dag] = dict[dag] + 1

    for dag in dict:
        if dict[dag] > 1:
            nodes.append(dag)

    return nodes


def updateControlColours():

    for shp in cmds.ls(type='nurbsCurve'):

        if not '_ctl_' in shp: continue

        if re.match('[RL]+_legBallIk_ctl_[0-9]+Shape', shp):
            cmds.setAttr('%s.overrideEnabled' % shp, 1)
            cmds.setAttr('%s.overrideColor' % shp, rigEnv.CONTROL_COLOR['C'])

        elif re.match('R_[a-zA-Z0-9]+_ctl_[0-9]+Shape', shp):
            cmds.setAttr('%s.overrideEnabled' % shp, 1)
            cmds.setAttr('%s.overrideColor' % shp, rigEnv.CONTROL_COLOR['R'])

        elif re.match('L_[a-zA-Z0-9]+_ctl_[0-9]+Shape', shp):
            cmds.setAttr('%s.overrideEnabled' % shp, 1)
            cmds.setAttr('%s.overrideColor' % shp, rigEnv.CONTROL_COLOR['L'])

        elif re.match('C_chestFk_ctl_0Shape|C_backAFk_ctl_0Shape|C_backBFk_ctl_0Shape|C_backCFk_ctl_0Shape|C_backFk_ctl_0Shape|C_hipSwingerroot_ctl_0Shape', shp):
            cmds.setAttr('%s.overrideEnabled' % shp, 1)
            cmds.setAttr('%s.overrideColor' % shp, 21)

        elif re.match('C_mainB_ctl_0Shape|C_mainA_ctl_0Shape', shp):
            cmds.setAttr('%s.overrideEnabled' % shp, 1)
            cmds.setAttr('%s.overrideColor' % shp, 5)

        elif re.match('C_[a-zA-Z0-9]+_ctl_[0-9]+Shape', shp):
            if 'Center' in shp: continue
            cmds.setAttr('%s.overrideEnabled' % shp, 1)
            cmds.setAttr('%s.overrideColor' % shp, rigEnv.CONTROL_COLOR['C'])