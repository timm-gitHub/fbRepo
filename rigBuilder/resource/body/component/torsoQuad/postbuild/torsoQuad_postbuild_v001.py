import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        # constrain to the rig
        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        
        # add torso attributes to centerA control
        cmds.addAttr('C_center_ctl_0',ln='spine',nn='   ',at='enum',en='Torso')
        cmds.setAttr('C_center_ctl_0.spine',cb=True)
        cmds.addAttr('C_center_ctl_0',ln='spineFKIKBlend',at='double',min=0,max=1,dv=0)
        cmds.setAttr('C_center_ctl_0.spineFKIKBlend',e=True,k=True)
        cmds.addAttr('C_center_ctl_0',ln='spineautoVis',at='bool')
        cmds.setAttr('C_center_ctl_0.spineautoVis',1,e=True,cb=True)
        cmds.addAttr('C_center_ctl_0',ln='spineFKVis',at='bool')
        cmds.setAttr('C_center_ctl_0.spineFKVis',e=True,cb=True)
        cmds.addAttr('C_center_ctl_0',ln='spineIKVis',at='bool')
        cmds.setAttr('C_center_ctl_0.spineIKVis',e=True,cb=True)
        
        # add head attributes to centerA control
        cmds.addAttr('C_center_ctl_0',ln='neck',nn='   ',at='enum',en='Neck')
        cmds.setAttr('C_center_ctl_0.neck',cb=True)
        cmds.addAttr('C_center_ctl_0',ln='neckFKIKBlend',at='double',min=0,max=1,dv=0)
        cmds.setAttr('C_center_ctl_0.neckFKIKBlend',e=True,k=True)
        cmds.addAttr('C_center_ctl_0',ln='neckautoVis',at='bool')
        cmds.setAttr('C_center_ctl_0.neckautoVis',1,e=True,cb=True)
        cmds.addAttr('C_center_ctl_0',ln='neckFKVis',at='bool')
        cmds.setAttr('C_center_ctl_0.neckFKVis',e=True,cb=True)
        cmds.addAttr('C_center_ctl_0',ln='neckIKVis',at='bool')
        cmds.setAttr('C_center_ctl_0.neckIKVis',e=True,cb=True)
        
        # add extra cogs
        c = 'C_center_ctl_0'
        a = cmds.duplicate(c,n='%s_centerA_ctl_%s' % (self.locus,self.count),rc=True)[0]
        b = cmds.duplicate(c,n='%s_centerB_ctl_%s' % (self.locus,self.count),rc=True)[0]
        c = cmds.rename(c,'%s_centerC_ctl_%s' % (self.locus,self.count))
        
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
        cmds.addAttr('%s_centerA_ctl_%s' % (self.locus,self.count),ln='secondaryCOGs',at='double',min=0,max=1,dv=0)
        cmds.setAttr('%s_centerA_ctl_%s.secondaryCOGs' % (self.locus,self.count),e=True,k=True)
        cmds.connectAttr('%s_centerA_ctl_%s.secondaryCOGs' % (self.locus,self.count),'%s.v' % b)
        cmds.connectAttr('%s_centerA_ctl_%s.secondaryCOGs' % (self.locus,self.count),'%s.v' % c)
        
        # fix hip swinger root orientation
        cmds.delete('%s_hipSwingerGrouproot_orc_%s' % (self.locus,self.count))
        cmds.parent('%s_hipSwingerroot_org_%s' % (self.locus,self.count),'%s_rootFk_ctj_%s' % (self.locus,self.count),r=True)
        cmds.setAttr('%s_hipSwingerroot_org_%s.translate' % (self.locus,self.count),0,0,0)
        cmds.setAttr('%s_hipSwingerroot_org_%s.rotate' % (self.locus,self.count),0,0,0)
        org = cmds.duplicate('%s_hipSwingerroot_org_%s' % (self.locus,self.count),n='%s_hipSwingerrootDriven_org_%s' % (self.locus,self.count),po=True)[0]
        off = cmds.duplicate('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),n='%s_hipSwingerrootDriven_off_%s' % (self.locus,self.count),po=True)[0]
        drv = cmds.duplicate('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),n='%s_hipSwingerrootDriven_drv_%s' % (self.locus,self.count),po=True)[0]
        posA = cmds.xform('%s_backA_bnd_%s' % (self.locus,self.count),q=True,ws=True,t=True)
        posB = cmds.xform('%s_root_bnd_%s' % (self.locus,self.count),q=True,ws=True,t=True)
        cmds.select(cl=True)
        cmds.joint(n='%s_hipSwingA_jnt_%s' % (self.locus,self.count),p=[posA[0],posA[1],posA[2]])
        cmds.joint(n='%s_hipSwingB_jnt_%s' % (self.locus,self.count),p=[posB[0],posB[1],posB[2]])
        hdl = cmds.ikHandle(sj='%s_hipSwingA_jnt_%s' % (self.locus,self.count),ee='%s_hipSwingB_jnt_%s' % (self.locus,self.count))[0]
        cmds.move(posA[0],posA[1],posA[2],'%s_hipSwingerrootDriven_org_%s' % (self.locus,self.count),ws=True)
        cmds.parent(off,org)
        cmds.parent(drv,off)
        cmds.parent(hdl,drv)
        cmds.parent('%s_hipSwingA_jnt_%s' % (self.locus,self.count),'%s_rootFk_ctj_%s' % (self.locus,self.count))
        cmds.connectAttr('%s_hipSwingerroot_ctl_%s.translate' % (self.locus,self.count),'%s.translate' % drv)
        cmds.connectAttr('%s_hipSwingerroot_ctl_%s.rotate' % (self.locus,self.count),'%s.rotate' % org)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s.v' % hdl,0)
        cmds.setAttr('%s_hipSwingA_jnt_%s.v' % (self.locus,self.count),0)
        cmds.orientConstraint('%s_hipSwingA_jnt_%s' % (self.locus,self.count),'%s_hipSwingerGrouproot_org_%s' % (self.locus,self.count),mo=True)
        
        # reconnect spine attrs to centerA attrs
        attrs = cmds.listAttr('%s_spineFkIk_ctl_%s' % (self.locus,self.count),cb=True) + cmds.listAttr('%s_spineFkIk_ctl_%s' % (self.locus,self.count),k=True)
        for attr in attrs:
            newattr = 'spine%s' % attr
            for plug in cmds.listConnections('%s_spineFkIk_ctl_%s.%s' % (self.locus,self.count,attr),s=False,d=True,p=True):
                cmds.connectAttr('C_centerA_ctl_0.%s' % newattr,plug,f=True)
                
        # reconnect neck attrs to centerA attrs
#         rev  = cmds.createNode('reverse')
#         cond = cmds.createNode('condition')
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','%s.inputX' % rev)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','C_neck_prc_0.IKXneck0_MW1',f=True)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','C_neck_prc_0.IKXneckB0_MW1',f=True)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','C_scaleBlendneck_bcl_0.blender',f=True)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','C_scaleBlendneckB_bcl_0.blender',f=True)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','C_transXBlendneckQuad_bta_0.attributesBlender',f=True)
#         cmds.connnectAttr('%s.outputX' % rev,'C_neck_prc_0.FKXneck0_MW0',f=True)
#         cmds.connnectAttr('%s.outputX' % rev,'C_neck_prc_0.FKXneckB0_MW0',f=True))
#         cmds.connectAttr('C_centerA_ctl_0.neckautoVis','%s.firstTerm' % cond)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKVis','%s.colorIfTrueG' % cond)
#         cmds.connectAttr('C_centerA_ctl_0.neckIKVis','%s.colorIfTrueR' % cond)
#         cmds.connectAttr('%s.outputX' % rev,'%s.colorIfFalseG' % cond)
#         cmds.connectAttr('C_centerA_ctl_0.neckFKIKBlend','%s.colorIfFalseR' % cond)
#         cmds.setAttr('%s.operation' % cond,0)
#         cmds.setAttr('%s.secondTerm' % cond,0)
#         cmds.connectAttr('')
        
        
                
        cmds.delete('%s_spineFkIk_org_%s' % (self.locus,self.count))
                
        # turn off transform inheritance of IK group
        cmds.setAttr('%s_%sIK_org_%s.inheritsTransform' % (self.locus,self.namespace,self.count),0)