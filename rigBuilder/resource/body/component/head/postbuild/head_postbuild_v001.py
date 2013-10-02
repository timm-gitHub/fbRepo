import rigBuilder.body.bodyClasses as classes
import string

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        cmds.parent('%s_skull_bnd_%s' % (self.locus,self.count),w=True)
        cmds.parent('%s_skullFk_jnt_%s' % (self.locus,self.count),w=True)
        
        if cmds.objExists('C_neckQuadIk_jnt_0'):
            cmds.setAttr('%s_globalhead_org_%s.rx' % (self.locus,self.count),0)
            cmds.setAttr('%s_globalhead_org_%s.ry' % (self.locus,self.count),-90)
            cmds.setAttr('%s_globalhead_org_%s.rz' % (self.locus,self.count),0)
            cmds.setAttr('%s_headFk_ctj_%s.rx' % (self.locus,self.count),0)
            cmds.setAttr('%s_headFk_ctj_%s.ry' % (self.locus,self.count),-90)
            cmds.setAttr('%s_headFk_ctj_%s.rz' % (self.locus,self.count),0)
              
        else:
            cmds.setAttr('%s_globalhead_org_%s.rx' % (self.locus,self.count),0)
            cmds.setAttr('%s_globalhead_org_%s.ry' % (self.locus,self.count),0)
            cmds.setAttr('%s_globalhead_org_%s.rz' % (self.locus,self.count),0)
            cmds.setAttr('%s_headFk_ctj_%s.rx' % (self.locus,self.count),0)
            cmds.setAttr('%s_headFk_ctj_%s.ry' % (self.locus,self.count),0)
            cmds.setAttr('%s_headFk_ctj_%s.rz' % (self.locus,self.count),0)
            
        cmds.parent('%s_skull_bnd_%s' % (self.locus,self.count),'%s_head_bnd_%s' % (self.locus,self.count))
        cmds.parent('%s_skullFk_jnt_%s' % (self.locus,self.count),'%s_headFk_jnt_%s' % (self.locus,self.count))

        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        
        if cmds.objExists('C_neckQuadIk_jnt_0'):
            cmds.parentConstraint('C_neckQuad_bnd_0','%s_headFk_ctj_%s' % (self.locus,self.count),mo=True)
        else:
            cmds.parentConstraint('C_neckend_bnd_0','%s_headFk_ctj_%s' % (self.locus,self.count),mo=True)
        
        # lock attrs
        for attr in ['sx','sy','sz']:
            cmds.setAttr('%s_headFk_ctl_%s.%s' % (self.locus,self.count,attr),l=True,k=False)