import rigBuilder.body.bodyClasses as classes

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.parentConstraint('%s_legToe_bnd_0' % self.locus,'%s_%sAFk_ctj_%s' % (self.locus,self.namespace,self.count),mo=True)
        
        # lock attributes
        for attr in ['sx','sy','sz','tx','ty','tz']:
            cmds.setAttr('%s_%sAFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sBFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
        
        if cmds.objExists('%s_legFkIk_ctl_0' % self.locus):
            fkikctl = '%s_legFkIk_ctl_0' % self.locus
        elif cmds.objExists('%s_legBackFkIk_ctl_0' % self.locus):
            fkikctl = '%s_legBackFkIk_ctl_0' % self.locus
        
        # add toe curl attr
        cmds.addAttr(fkikctl,ln='%s%sCurl' % (self.namespace,self.count),at='double')
        cmds.setAttr('%s.%s%sCurl' % (fkikctl,self.namespace,self.count),e=True,k=True,l=False)
        cmds.connectAttr('%s.%s%sCurl' % (fkikctl,self.namespace,self.count),'%s_%sAFk_cth_%s.rz' % (self.locus,self.namespace,self.count))
        cmds.connectAttr('%s.%s%sCurl' % (fkikctl,self.namespace,self.count),'%s_%sBFk_ctj_%s.rz' % (self.locus,self.namespace,self.count))
        
        # connect visibility toggle
#         cmds.connectAttr('%s.feetControls' % fkikctl,'%s_%sAFk_ctl_%sShape.v' % (self.locus,self.namespace,self.count))
#         cmds.connectAttr('%s.feetControls' % fkikctl,'%s_%sBFk_ctl_%sShape.v' % (self.locus,self.namespace,self.count))