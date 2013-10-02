import rigBuilder.body.bodyClasses as classes
import string

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.parentConstraint('C_chest_bnd_0','%s_neckFk_ctj_%s' % (self.locus,self.count),mo=True)
        cmds.parentConstraint('C_chest_bnd_0','%s_%s0Ik_org_%s' % (self.locus,self.namespace.lower(),self.count),mo=True)
        cmds.parentConstraint('C_chest_bnd_0','%s_%sFKIK_org_%s' % (self.locus,self.namespace,self.count),mo=True)
        
        pConst = cmds.parentConstraint('C_chest_bnd_0','%s_%s1Ik_org_%s' % (self.locus,self.namespace.lower(),self.count),mo=True)[0]
        cmds.connectAttr('%s_%s1FollowIk_str_%s.outValueX' % (self.locus,self.namespace.lower(),self.count),'%s.C_chest_bnd_0W1' % pConst)
        
        pConst = cmds.parentConstraint('C_chest_bnd_0','%s_%s2Ik_org_%s' % (self.locus,self.namespace.lower(),self.count),mo=True)[0]
        cmds.connectAttr('%s_%s2FollowIk_str_%s.outValueX' % (self.locus,self.namespace.lower(),self.count),'%s.C_chest_bnd_0W1' % pConst)
        
        cmds.setAttr('%s_%s1Ik_ctl_%s.follow' % (self.locus,self.namespace.lower(),self.count),1)
        cmds.setAttr('%s_%s2Ik_ctl_%s.follow' % (self.locus,self.namespace.lower(),self.count),1)
        cmds.setAttr('%s_%s2Ik_ctl_%s.rx' % (self.locus,self.namespace.lower(),self.count),l=True,k=False)
        cmds.setAttr('%s_%s2Ik_ctl_%s.ry' % (self.locus,self.namespace.lower(),self.count),l=True,k=False)
        cmds.setAttr('%s_%s2Ik_ctl_%s.rz' % (self.locus,self.namespace.lower(),self.count),l=True,k=False)
        
        cmds.setAttr('%s_%sIk_hdl_%s.dTwistControlEnable' % (self.locus,self.namespace.lower(),self.count),1)
        cmds.setAttr('%s_%sIk_hdl_%s.dWorldUpType' % (self.locus,self.namespace.lower(),self.count),3)
        cmds.connectAttr('C_chest_bnd_0.worldMatrix[0]','%s_%sIk_hdl_%s.dWorldUpMatrix' % (self.locus,self.namespace.lower(),self.count))
        cmds.delete('%s_neckQuadIk_orc_%s' % (self.locus,self.count))
        cmds.makeIdentity('%s_neckQuadIk_jnt_%s' % (self.locus,self.count),a=True,r=True,jo=True,t=False,s=False)