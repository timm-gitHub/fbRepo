import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        shoulder = '%sShoulder%s' % (self.namespace,self.count)
        elbow    = '%sElbow%s' % (self.namespace,self.count)
        wrist    = '%sWrist%s' % (self.namespace,self.count)
        
        # orient arm joints
        cmds.parent(elbow,w=True)
        cmds.delete(cmds.aimConstraint(elbow,shoulder,mo=False,aim=[1,0,0],u=[0,0,1],wut='object',wuo='comp_%s%s:armUp' % (self.namespace,self.count))[0])
        cmds.parent(elbow,shoulder)
        
        cmds.parent(wrist,w=True)
        cmds.delete(cmds.aimConstraint(wrist,elbow,mo=False,aim=[1,0,0],u=[0,0,1],wut='object',wuo='comp_%s%s:armUp' % (self.namespace,self.count))[0])
        cmds.parent(wrist,elbow)
        
        children = cmds.listRelatives(wrist,c=True,s=False)
        cmds.parent(children,w=True)
        cmds.makeIdentity(wrist,a=True,t=False,r=True,s=False,n=False,jo=True)    
        cmds.parent(children,wrist)
        
        # orient fingers
        for finger in ['thumb','index','middle','pinky']:
            descendents = cmds.listRelatives('%s%sA%s' % (self.namespace,finger.title(),self.count),ad=True)
            for child in descendents:
                parent = cmds.listRelatives(child,p=True)[0]
                cmds.parent(child,w=True)
                cmds.delete(cmds.aimConstraint(child,parent,mo=False,aim=[1,0,0],u=[0,1,0],wut='objectrotation',wuo='comp_%s%s:R_%sOrient_ctl_0' % (self.namespace,self.count,finger))[0])
                cmds.parent(child,parent)