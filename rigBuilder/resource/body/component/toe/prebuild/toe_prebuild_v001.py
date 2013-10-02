import rigBuilder.body.bodyClasses as classes

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        toe = '%sA%s' % (self.namespace,self.count)
        
        if not cmds.objExists(toe): return
        
        jnts = cmds.listRelatives(toe,c=True,typ='joint',ad=True)
        
        for jntA in jnts:
            jntB = cmds.listRelatives(jntA,p=True,typ='joint')
            cmds.parent(jntA,w=True)
            aim = cmds.aimConstraint(jntA,jntB,wut='object',wuo='comp_%s%s:R_toe_vec_0' % (self.namespace,self.count),u=[0,-1,0])
            cmds.delete(aim[0])
            cmds.makeIdentity(jntA,a=True,r=True)
            cmds.parent(jntA,jntB)