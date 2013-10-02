import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds
import os, re

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        if not cmds.objExists('comp_torso0RN'): return
        
        torso = os.path.basename(cmds.referenceQuery('comp_torso0RN',f=True))
        
        if re.match('torsoQuad_guide_v[0-9]{3}.ma',torso):
            cmds.joint('head%s' % self.count,e=True,oj='yxz',secondaryAxisOrient='zup',zso=True)