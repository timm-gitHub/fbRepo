import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
                    
        root  = 'root%s' % self.count
        back  = 'back%s' % self.count
        chest = 'chest%s' % self.count
        neck  = 'neck%s' % self.count
        
        if not cmds.objExists(root): return
        
        # root
        cmds.parent(back,w=True)
        cmds.setAttr('%s.jointOrientY' % root,0)
        cmds.parent(back,root)
        
        # midsection
        cmds.joint(back,e=True,oj='xyz',sao='zup',zso=True)
        
        # chest
        cmds.parent(neck,w=True)
        cmds.makeIdentity(chest,a=True,t=False,r=True,s=False,n=False,jo=True)    
        rx,ry,rz = cmds.xform(chest,q=True,ws=True,ro=True)
        cmds.setAttr('%s.jointOrientZ' % chest,ry)
        cmds.parent(neck,chest)
        
        grp = cmds.group(n='fit',em=True)
        cmds.parent(root,grp)