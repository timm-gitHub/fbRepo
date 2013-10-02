import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        hip   = '%sHip%s' % (self.namespace,self.count)
        knee  = '%sKnee%s' % (self.namespace,self.count)
        hock  = '%sHock%s' % (self.namespace,self.count)
        ankle = '%sAnkle%s' % (self.namespace,self.count)
        inner = '%sInnerfoot%s' % (self.namespace,self.count)
        outer = '%sOuterfoot%s' % (self.namespace,self.count)
        
        # orient the leg joints
        cmds.parent(knee,w=True)
        cmds.delete(cmds.aimConstraint(knee,hip,aim=[1,0,0],u=[0,0,1],wut='objectrotation',wu=[0,0,1],wuo='comp_%s%s:R_hipOrient_ctl_0' % (self.namespace,self.count))[0])
        cmds.parent(knee,hip)
        
        cmds.parent(hock,w=True)
        cmds.delete(cmds.aimConstraint(hock,knee,aim=[1,0,0],u=[0,0,1],wut='objectrotation',wu=[0,0,1],wuo='comp_%s%s:R_hipOrient_ctl_0' % (self.namespace,self.count))[0])
        cmds.parent(hock,knee)
        
        cmds.parent(ankle,w=True)
        cmds.delete(cmds.aimConstraint(ankle,hock,aim=[1,0,0],u=[0,0,1],wut='objectrotation',wu=[0,0,1],wuo='comp_%s%s:R_hipOrient_ctl_0' % (self.namespace,self.count))[0])
        cmds.parent(ankle,hock)
        
        cmds.makeIdentity(ankle,a=True,r=True,jo=True)
        
        children = cmds.listRelatives(ankle)
        for child in children:
            cmds.parent(child,w=True)
        
        aConst = cmds.aimConstraint('%sMidfoot%s' % (self.namespace,self.count),ankle,aim=[1,0,0],u=[0,-1,0])
        cmds.setAttr('%s.rotateOrder' % ankle,2)
        cmds.delete(aConst)
        cmds.parent(ankle,w=True)
        cmds.setAttr('%s.rz' % ankle,0)
        cmds.makeIdentity(ankle,a=True,r=True)
        
        cmds.parent(ankle,hock)
        
        for child in children:
            cmds.parent(child,ankle)
        
        cmds.joint('%sMidfoot%s' % (self.namespace,self.count),e=True,oj='xyz',secondaryAxisOrient='ydown',zso=True)
        
        cmds.makeIdentity(inner,a=True,r=True,jo=True)
        cmds.makeIdentity(outer,a=True,r=True,jo=True)