import rigBuilder.body.bodyClasses as classes
import rigBuilder.rigEnv as env
import maya.cmds as cmds
import maya.mel as mel
import re, string

cmds.cycleCheck(e=False)
mel.eval('ikSpringSolver')

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        FKIKCtl       = '%s_legFkIk_ctl_%s' % (self.locus,self.count)
        IKCtl         = '%s_legIk_ctl_%s' % (self.locus,self.count)
        footBallPivot = '%s_footPivotBallLegBackIk_org_%s' % (self.locus,self.count)
        footRoll      = '%s_footRollLegBackIk_org_%s' % (self.locus,self.count)
        ballIkCtl     = '%s_legBallIk_ctl_%s' % (self.locus,self.count)
        legikhandle   = '%s_legIk_hdl_%s' % (self.locus,self.count)
        
        cmds.rename('%s_footPivotBallLegIk_org_%s' % (self.locus,self.count),footBallPivot)
        cmds.rename('%s_footRollLegIk_org_%s' % (self.locus,self.count),footRoll)
        
        cmds.ikHandle(legikhandle,e=True,sol='ikSpringSolver')
        
        # add attrs
        cmds.addAttr(FKIKCtl,ln='feetControls',at='double',min=0,max=1,dv=1)
        cmds.setAttr('%s.feetControls' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='swivel',at='double',dv=0)
        cmds.setAttr('%s.swivel' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='toeRoll',at='double',dv=0)
        cmds.setAttr('%s.toeRoll' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='toeSwivel',at='double',dv=0)
        cmds.setAttr('%s.toeSwivel' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='toeTwist',at='double',dv=0)
        cmds.setAttr('%s.toeTwist' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='heelBank',at='double',dv=0)
        cmds.setAttr('%s.heelBank' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='heelSwivel',at='double',dv=0)
        cmds.setAttr('%s.heelSwivel' % FKIKCtl,e=True,k=True)
        cmds.addAttr(FKIKCtl,ln='kneeWeighting',at='double',min=0,max=1,dv=0.5)
        cmds.setAttr('%s.kneeWeighting' % FKIKCtl,e=True,k=True)
        
        negate = 1
        if self.locus == 'L': 
            negate = -1
        elif self.locus == 'C':
            # fix the outer and inner foot bind joints if the foot is centered
            cmds.rename('L_%sInnerfoot_bnd_%s' % (self.namespace,self.count),'C_%sInnerfoot_bnd_%s' % (self.namespace,self.count))
            cmds.rename('R_%sOuterfoot_bnd_%s' % (self.namespace,self.count),'C_%sOuterfoot_bnd_%s' % (self.namespace,self.count))
        
        # constrain to the rig
        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.parentConstraint('%s_%sAnkle_bnd_%s' % (self.locus,self.namespace,self.count),'%s_%sFKIK_org_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.parentConstraint('C_root_bnd_0','%s_%sCtl_org_%s' % (self.locus,self.namespace,self.count),mo=True)
        hiprootloc = cmds.spaceLocator(n='%s_hipRootFollow_loc_%s' % (self.locus,self.count))[0]
        cmds.parent(hiprootloc,'%s_%sHip_bnd_%s' % (self.locus,self.namespace,self.count),r=True)
        cmds.parent(hiprootloc,'C_root_bnd_0')
        cmds.setAttr('%s.v' % hiprootloc,0)
        
        cmds.orientConstraint(hiprootloc,'%s_%sAim_org_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.pointConstraint(hiprootloc,'%s_%sHipIk_jth_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.setAttr('%s_%sHipIk_org_%s.inheritsTransform' % (self.locus,self.namespace,self.count),0)
                              
        ankle = cmds.duplicate('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_tmp_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.parent(ankle,w=True)
        
        posA = cmds.xform('%s_%sKnee_bnd_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
        posB = cmds.xform('comp_%s%s:R_knee_ctl_0' % (self.namespace,self.count),q=True,ws=True,t=True)
        
        if round(posA[0]) != round(posB[0]*negate) or round(posA[1]) != round(posB[1]) or round(posA[2]) != round(posB[2]): 
        
            # reposition the pole vector control - this messes up the joint orientations
            cmds.delete('%s_poleLeg_prc_%s' % (self.locus,self.count))
            pos    = cmds.xform('comp_%s%s:R_poleVector_loc_0' % (self.namespace,self.count),q=True,ws=True,t=True)
            cmds.move(pos[0]*negate,pos[1],pos[2],'%s_poleLegStatic_tgt_%s' % (self.locus,self.count),ws=True)
            cmds.move(pos[0]*negate,pos[1],pos[2],'%s_poleLeg_org_%s' % (self.locus,self.count),ws=True)
            pConst = cmds.parentConstraint(IKCtl,'%s_poleLegStatic_tgt_%s' % (self.locus,self.count),'%s_poleLeg_org_%s' % (self.locus,self.count),mo=True)[0]
            rev    = cmds.createNode('reverse')
            cmds.connectAttr('%s_poleLeg_ctl_%s.follow' % (self.locus,self.count),'%s.%sW0' % (pConst,IKCtl))
            cmds.connectAttr('%s_poleLeg_ctl_%s.follow' % (self.locus,self.count),'%s.inputX' % rev)
            cmds.connectAttr('%s.outputX' % rev,'%s.%s_poleLegStatic_tgt_%sW1' % (pConst,self.locus,self.count))
            cmds.setAttr('%s.interpType' % pConst,2)
        
        # re create IK chain to set correct the messed up orientations
        cmds.select(cl=True)
        hock  = cmds.joint(n='%s_%sHockIk_tmp_%s' % (self.locus,self.namespace,self.count))
        knee  = cmds.joint(n='%s_%sKneeIk_tmp_%s' % (self.locus,self.namespace,self.count))
        
        cmds.parent(knee,'%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),r=True)
        cmds.setAttr('%s.rx' % knee,180)
        cmds.parent(knee,'%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(hock,'%s_%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),r=True)
        cmds.setAttr('%s.rx' % hock,180)
        cmds.parent(hock,knee)
        cmds.parent(ankle,hock)
        
        plug = cmds.listConnections('%s_%sKneeIk_jnt_%s.tx' % (self.locus,self.namespace,self.count),s=True,d=False,p=True)[0]
        cmds.connectAttr(plug,'%s.tx' % knee)
        plug = cmds.listConnections('%s_%sHockIk_jnt_%s.tx' % (self.locus,self.namespace,self.count),s=True,d=False,p=True)[0]
        cmds.connectAttr(plug,'%s.tx' % hock)
        
        cmds.delete(legikhandle)
        cmds.parent('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),w=True)
        cmds.parent('%s_fKAlignedLegIk_org_%s' % (self.locus,self.count),w=True)
        cmds.parent('%s_poleLeg_ann_%s' % (self.locus,self.count),w=True,r=True)
        cmds.delete('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count))
        
        cmds.makeIdentity('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),a=True,r=True)
        cmds.joint('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),e=True,spa=True,ch=True)
        legikhandle = cmds.ikHandle(sj='%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),ee=ankle,sol='ikSpringSolver')[0]
        cmds.poleVectorConstraint('%s_poleLeg_ctl_%s' % (self.locus,self.count),legikhandle)
        
        cmds.parent('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),ankle)
        cmds.parent('%s_fKAlignedLegIk_org_%s' % (self.locus,self.count),ankle)
        cmds.parent(legikhandle,footBallPivot)
        
        handle = cmds.ikHandle(sj=ankle,ee='%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),sol='ikSCsolver')[0]
        cmds.parent(handle,footBallPivot)
        cmds.setAttr('%s.v' % handle,0)
        
        # rename tmp joints and reconstrain bind joints
        cmds.rename(knee,'%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count))
        cmds.rename(hock,'%s_%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count))
        cmds.rename(ankle,'%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sKnee_bnd_%s' % (self.locus,self.namespace,self.count),mo=False)[0]
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sKneeIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint('%s_%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sHock_bnd_%s' % (self.locus,self.namespace,self.count),mo=False)[0]
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sHockIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sAnkle_bnd_%s' % (self.locus,self.namespace,self.count),mo=False)[0]
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sAnkleIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        
        # fix the fk chain orientations
        knee  = '%s_%sKneeFk_ctj_%s' % (self.locus,self.namespace,self.count)
        hock  = '%s_%sHockFk_ctj_%s' % (self.locus,self.namespace,self.count)
        ankle = '%s_%sAnkleFk_ctj_%s' % (self.locus,self.namespace,self.count)
        cmds.parent(knee,w=True)
        cmds.parent(hock,w=True)
        cmds.parent(ankle,w=True)
        
        cmds.delete(cmds.aimConstraint(hock,knee,wut='object',wuo='comp_%s%s:%s_poleVector_loc_0' % (self.namespace,self.count,self.locus),aim=[negate,0,0],u=[0,negate,0]))
        cmds.delete(cmds.aimConstraint(ankle,hock,wut='object',wuo='comp_%s%s:%s_poleVector_loc_0' % (self.namespace,self.count,self.locus),aim=[negate,0,0],u=[0,negate,0]))
        
        cmds.parent(ankle,'%s_%sHockFk_ctl_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(hock,'%s_%sKneeFk_ctl_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(knee,'%s_%sHipFk_jnt_%s' % (self.locus,self.namespace,self.count))
        
        # connect fkikctl attrs to ik foot ctl attrs
        cmds.connectAttr('%s.swivel' % FKIKCtl,'%s.swivel' % IKCtl)
        cmds.setAttr('%s.swivel' % IKCtl,l=True,k=False)
        cmds.setAttr('%s.toe' % IKCtl,l=True,k=False)
        cmds.setAttr('%s.rollAngle' % IKCtl,l=True,k=False)
        
        # add control to IK feet controls to hide other controls
        cmds.connectAttr('%s.feetControls' % FKIKCtl,'%s_legToeIk_ctl_%sShape.v' % (self.locus,self.count))
        cmds.connectAttr('%s.feetControls' % FKIKCtl,'%s_legHeelIk_ctl_%sShape.v' % (self.locus,self.count))
        
        # add follow to ik feet controls
        cmds.addAttr(IKCtl,ln='follow',at='double',min=0,max=1,dv=0)
        cmds.setAttr('%s.follow' % IKCtl,e=True,k=True)
        
        pConst = cmds.parentConstraint('%s_%sIK_org_%s' % (self.locus,self.namespace,self.count),'C_root_bnd_0','%s_legIk_org_%s' % (self.locus,self.count),mo=True)[0]
        rev    = cmds.createNode('reverse')
        
        cmds.connectAttr('%s.follow' % IKCtl,'%s.C_root_bnd_0W1' % pConst)
        cmds.connectAttr('%s.follow' % IKCtl,'%s.inputX' % rev)
        cmds.connectAttr('%s.outputX' % rev,'%s.%s_%sIK_org_%sW0' % (pConst,self.locus,self.namespace,self.count))
        cmds.setAttr('%s.interpType' % pConst, 2)
        
        # reconnect foot roll
#         cmds.parent(footBallPivot, '%s_legBallIk_cth_%s' % (self.locus,self.count))
#         cmds.setAttr('%s.roll' % IKCtl,l=True,cb=False,k=False)
#         cmds.connectAttr('%s.swivel' % IKCtl,'%s_legToeIk_cth_%s.ry' % (self.locus,self.count))
#         cmds.disconnectAttr('%s.swivel' % IKCtl,'%s_poleAimLeg_amc_%s.offsetX' % (self.locus,self.count))
        
        # add foot bank
        off = cmds.group(em=True,n='%s_%sFootBankInIk_off_%s' % (self.locus,self.namespace,self.count))
        inn = cmds.group(em=True,n='%s_%sFootBankInIk_org_%s' % (self.locus,self.namespace,self.count))
        cmds.delete(cmds.parentConstraint('%s_%sInnerfoot_bnd_%s' % (self.locus,self.namespace,self.count),inn,mo=False))
        cmds.delete(cmds.parentConstraint('%s_%sInnerfoot_bnd_%s' % (self.locus,self.namespace,self.count),off,mo=False))
        
        out = cmds.group(em=True,n='%s_%sFootBankOutIk_org_%s' % (self.locus,self.namespace,self.count))
        cmds.delete(cmds.parentConstraint('%s_%sOuterfoot_bnd_%s' % (self.locus,self.namespace,self.count),out,mo=False))
        
        cmds.parent(off,IKCtl)
        cmds.parent(inn,off)
        cmds.parent(out,inn)
        cmds.parent(footRoll,out)
        
        cmds.setAttr('%s.rz' % ballIkCtl,l=False,k=True)
        cmds.transformLimits(ballIkCtl,erz=[0,0])
        
        cond = cmds.createNode('condition')
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s.rz' % ballIkCtl,'%s.firstTerm' % cond)
        cmds.connectAttr('%s.rz' % ballIkCtl,'%s.colorIfTrueR' % cond)
        if self.locus == 'R': cmds.setAttr('%s.operation' % cond,2)
        else: cmds.setAttr('%s.operation' % cond,4)
        cmds.setAttr('%s.colorIfFalseR' % cond,0)
        cmds.setAttr('%s.input2X' % mult,negate)
        cmds.connectAttr('%s.outColorR' % cond,'%s.input1X' % mult)
        cmds.connectAttr('%s.outputX' % mult,'%s.rx' % out)
        
        cond = cmds.createNode('condition')
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s.rz' % ballIkCtl,'%s.firstTerm' % cond)
        cmds.connectAttr('%s.rz' % ballIkCtl,'%s.colorIfTrueR' % cond)
        if self.locus == 'R': cmds.setAttr('%s.operation' % cond,4)
        else: cmds.setAttr('%s.operation' % cond,2)
        cmds.setAttr('%s.colorIfFalseR' % cond,0)
        cmds.setAttr('%s.input2X' % mult,negate)
        cmds.connectAttr('%s.outColorR' % cond,'%s.input1X' % mult)
        cmds.connectAttr('%s.outputX' % mult,'%s.rx' % inn)
        
        dup = cmds.duplicate(ballIkCtl,po=True,n='%s_legBallIk_dmy_%s' % (self.locus,self.count))[0]
        cmds.parent(footBallPivot,dup)
        cmds.connectAttr('%s.rx' % ballIkCtl,'%s.rx' % dup)
        
        # reorient the toes and midfoot controls
#         toe    = cmds.circle(ch=False)[0]
#         midfoot = cmds.circle(ch=False)[0]
#         new     = [toe,midfoot]
#         old     = ['%s_%sToesFk_ctl_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfootFk_ctl_%s' % (self.locus,self.namespace,self.count)]
#          
#         i = 0
#         while True:
#             if i == len(new): break
#              
#             a   = new[i]
#             b   = old[i]
#             p   = cmds.listRelatives(b,p=True)[0]
#             gp  = cmds.listRelatives(p,p=True)[0]
#             pos = cmds.xform(b,q=True,ws=True,t=True)
#             cmds.move(pos[0],pos[1],pos[2],a,ws=True)
#             cmds.parent(b,a)
#             cmds.parent(p,w=True)
#             cmds.setAttr('%s.rotate' % p,0,0,0)
#             cmds.parent(p,gp)
#             cmds.parent(a,p)
#             shpA = cmds.listRelatives(a,s=True)[0]
#             cmds.setAttr('%s.overrideEnabled' % shpA,1)
#             shpB = cmds.listRelatives(b,s=True)[0]
#             plg = cmds.listConnections('%s.v' % shpB,s=True,d=False,p=True)
#             if plg:
#                 cmds.disconnectAttr(plg[0],'%s.v' % shpB)
#                 cmds.connectAttr(plg[0],'%s.v' % shpA)
#             cmds.setAttr('%s.v' % shpB,0)
#             cmds.setAttr('%s.v' % a,l=True,k=False)
#             cmds.connectAttr('%s.sx' % a, '%s.sz' % b)
#             cmds.connectAttr('%s.sy' % a, '%s.sy' % b)
#             cmds.connectAttr('%s.sz' % a, '%s.sx' % b)
#             cmds.rename(b,string.replace(b,'_ctl_','_dmy_'))
#             cmds.rename(shpA,'%sShape' % b)
#             cmds.rename(a,b)
#             i = i + 1
            
        # rerig foot roll to incorporate the toe joint
#         cmds.delete('%s_%sToesEnd_bnd_%s' % (self.locus,self.namespace,self.count))
#         cmds.parent('%s_legToe_bnd_%s' % (self.locus,self.count),'%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count))
#         # create toes IK joint
#         toesIKJoint = cmds.joint(n='%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count))
#         pos         = cmds.xform('%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
#         cmds.move(pos[0],pos[1],pos[2],toesIKJoint,ws=True)
#         cmds.parent(toesIKJoint,'%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count))
#         cmds.makeIdentity(toesIKJoint,a=True,r=True,jo=True)
#         cmds.parent('%s_legToeIk_jnt_%s' % (self.locus,self.count),toesIKJoint)
#         # new rotational groups
#         org = cmds.group(em=True,n='%s_%sToesPivotBallLegIK_org_%s' % (self.locus,self.namespace,self.count))
#         cmds.parent(org,'%s_legBallIk_cth_%s' % (self.locus,self.count),r=True)
#         cmds.move(pos[0],pos[1],pos[2],org,ws=True)
#         cmds.parent(footBallPivot,org)
#         # toe ik handles
#         #cmds.delete('%s_liftToeLegToeIk_org_%s' % (self.locus,self.count))
#         toesIK = cmds.ikHandle(sj='%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),ee=toesIKJoint)[0]
#         toeIK  = cmds.ikHandle(sj=toesIKJoint,ee='%s_legToeIk_jnt_%s' % (self.locus,self.count))[0]
#         cmds.setAttr('%s.v' % toesIK,0)
#         cmds.setAttr('%s.v' % toeIK,0)
        
        # connect roll
#         clamp = cmds.createNode('clamp')
#         mult  = cmds.createNode('multiplyDivide')
#         cmds.setAttr('%s.maxR' % clamp,99999)
#         cmds.setAttr('%s.input2X' % mult,0.25)
#         cmds.connectAttr('%s.rx' % ballIkCtl,'%s.inputR' % clamp)
#         cmds.connectAttr('%s.outputR' % clamp,'%s.input1X' % mult)
#         cmds.connectAttr('%s.outputX' % mult,'%s_%sToesPivotBallLegIK_org_%s.rx' % (self.locus,self.namespace,self.count))
#         cmds.connectAttr('%s.outputR' % clamp,'%s.rx' % footBallPivot)
#         clamp = cmds.createNode('clamp')
#         #avg   = cmds.createNode('plusMinusAverage')
#         plug  = cmds.listConnections('%s_rollLegHeelIk_org_%s.rx' % (self.locus,self.count),s=True,d=False,p=True)[0]
#         cmds.setAttr('%s.minR' % clamp,-99999)
#         cmds.connectAttr('%s.rx' % ballIkCtl,'%s.inputR' % clamp)
#         cmds.disconnectAttr(plug,'%s_rollLegHeelIk_org_%s.rx' % (self.locus,self.count))
#         cmds.connectAttr('%s.outputR' % clamp,'%s_rollLegHeelIk_org_%s.rx' % (self.locus,self.count))
#         cmds.connectAttr('%s.heelBank' % FKIKCtl,'%s.rz' % footBallPivot)
#         cmds.connectAttr('%s.heelBank' % FKIKCtl,'%s_%sToesPivotBallLegIK_org_%s.rz' % (self.locus,self.namespace,self.count))
#         #cmds.setAttr('%s.input1D[0]' % avg,cmds.getAttr('%s.ry' % footBallPivot))
#         #cmds.connectAttr('%s.heelSwivel' % FKIKCtl,'%s.input1D[1]' % avg)
#         #cmds.connectAttr('%s.output1D' % avg, '%s.ry' % footBallPivot)
#         children = cmds.listRelatives(footBallPivot,c=True)
#         cmds.parent(children,w=True)
#         cmds.connectAttr('%s.heelSwivel' % FKIKCtl,'%s.ry' % footBallPivot)
#         cmds.parent(children,footBallPivot)
#         cmds.connectAttr('%s.heelSwivel' % FKIKCtl,'%s_%sToesPivotBallLegIK_org_%s.ry' % (self.locus,self.namespace,self.count))
#         # create 'fk' controls
#         toesctl = cmds.circle(ch=False,n='%s_%sToesIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
#         toescth = cmds.group(n='%s_%sToesIk_cth_%s' % (self.locus,self.namespace,self.count))
#         toesctg = cmds.group(n='%s_%sToesIk_ctg_%s' % (self.locus,self.namespace,self.count))
#         toesdummyoff = cmds.group(n='%s_%sToesIkDummy_off_%s' % (self.locus,self.namespace,self.count),em=True)
#         toesdummyorg = cmds.group(n='%s_%sToesIkDummy_org_%s' % (self.locus,self.namespace,self.count))
#         #cmds.move(pos[0],pos[1],pos[2],toesctg,ws=True)
#         #cmds.move(pos[0],pos[1],pos[2],toesdummyorg,ws=True)
#         cmds.delete(cmds.parentConstraint('%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count),toesctg,mo=False))
#         cmds.delete(cmds.parentConstraint('%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count),toesdummyorg,mo=False))
#         
#         pos = cmds.xform('%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
#         footctl = cmds.circle(ch=False,n='%s_%sMidfootIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
#         footcth = cmds.group(n='%s_%sMidfootIk_cth_%s' % (self.locus,self.namespace,self.count))
#         footctg = cmds.group(n='%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count))
#         footdummyoff  = cmds.group(n='%s_%sMidfootIkDummy_off_%s' % (self.locus,self.namespace,self.count),em=True)
#         footdummyorg  = cmds.group(n='%s_%sMidfootIkDummy_org_%s' % (self.locus,self.namespace,self.count))
#         footdummymain = cmds.group(n='%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count))
#         #cmds.move(pos[0],pos[1],pos[2],footctg,ws=True)
#         #cmds.move(pos[0],pos[1],pos[2],footdummyorg,ws=True)
#         cmds.delete(cmds.parentConstraint('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),footctg,mo=False))
#         cmds.delete(cmds.parentConstraint('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),footdummymain,mo=False))
#         
#         cmds.setAttr('%s.tx' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.ty' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.tz' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.sx' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.sy' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.sz' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.v' % toesctl,l=True,k=False)
#         cmds.setAttr('%s.tx' % footctl,l=True,k=False)
#         cmds.setAttr('%s.ty' % footctl,l=True,k=False)
#         cmds.setAttr('%s.tz' % footctl,l=True,k=False)
#         cmds.setAttr('%s.sx' % footctl,l=True,k=False)
#         cmds.setAttr('%s.sy' % footctl,l=True,k=False)
#         cmds.setAttr('%s.sz' % footctl,l=True,k=False)
#         cmds.setAttr('%s.v' % footctl,l=True,k=False)
#         
#         cmds.parent(toesctg,footctl)
#         cmds.parent(toesdummyorg,footdummyoff)
#         #cmds.parent(footdummyorg,footdummymain)
#         cmds.parent(footctg,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
#         cmds.parent(footdummymain,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
#         cmds.parent(toeIK,toesdummyoff)
#         cmds.parent(toesIK,footdummyoff)
#         
#         #####################################
#         #####################################
#         #####################################
#         #####################################
#         cmds.connectAttr('%s.rotate' % toesctl,'%s.rotate' % toesdummyoff)
#         cmds.connectAttr('%s.rotate' % footctl,'%s.rotate' % footdummyoff)
#         #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toescth)
#         #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footcth)
#         #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toesdummyorg)
#         #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footdummyorg)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % toescth)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % footcth)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % toesdummyorg)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % footdummyorg)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toescth)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footcth)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toesdummyorg)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footdummyorg)
#         #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toescth)
#         #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footcth)
#         #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toesdummyorg)
#         #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footdummyorg)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % toescth)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % footcth)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % toesdummyorg)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % footdummyorg)
# #         cmds.parent(toesctg,footctl)
# #         cmds.parent(toesdummyorg,footdummyoff)
# #         cmds.parent(footctg,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
# #         cmds.parent(footdummyorg,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
# #         cmds.parent(toeIK,toesdummyoff)
# #         cmds.parent(toesIK,footdummyoff)
# #         cmds.connectAttr('%s.rotate' % toesctl,'%s.rotate' % toesdummyoff)
# #         cmds.connectAttr('%s.rotate' % footctl,'%s.rotate' % footdummyoff)
# #         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toescth)
# #         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footcth)
# #         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toesdummyorg)
# #         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footdummyorg)
# #         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toescth)
# #         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footcth)
# #         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toesdummyorg)
# #         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footdummyorg)
# #         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toescth)
# #         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footcth)
# #         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toesdummyorg)
# #         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footdummyorg)
#         
#         cmds.parentConstraint('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),footctg,mo=True)
#         cmds.parentConstraint('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),toesctg,mo=True)
#         # connect shape visibility
#         shp = cmds.listRelatives(toesctl,s=True)[0]
#         cmds.connectAttr('%s.feetControls' % FKIKCtl,'%s.v' % shp)
#         shp = cmds.listRelatives(footctl,s=True)[0]
#         cmds.connectAttr('%s.feetControls' % FKIKCtl,'%s.v' % shp)
#         # move original fk controls
#         cmds.parent('%s_%sMidfootFk_ctj_%s' % (self.locus,self.namespace,self.count),'%s_%sAnkleFk_jnt_%s' % (self.locus,self.namespace,self.count))
#         cmds.parent('%s_%sToesFk_ctj_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfootFk_jnt_%s' % (self.locus,self.namespace,self.count))
#         cmds.delete('%s_to%sMidfootFk_jth_%s' % (self.locus,self.namespace,self.count),'%s_to%sAnkleFk_jth_%s' % (self.locus,self.namespace,self.count))
#         # constrain bind joints
#         for constraint in cmds.listConnections('%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),s=True,d=False):
#             if cmds.objectType(constraint,isAType='constraint'):
#                 cmds.delete(constraint)
#                 break
#         pConst = cmds.parentConstraint('%s_%sMidfootFk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count))[0]
#         rev    = cmds.createNode('reverse')
#         cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.inputX' % rev)
#         cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sMidfootIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
#         cmds.connectAttr('%s.outputX' % rev,'%s.%s_%sMidfootFk_jnt_%sW0' % (pConst,self.locus,self.namespace,self.count))
#         
#         for constraint in cmds.listConnections('%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count),s=True,d=False):
#             if cmds.objectType(constraint,isAType='constraint'):
#                 cmds.delete(constraint)
#                 break
#         pConst = cmds.parentConstraint('%s_%sToesFk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count))[0]
#         cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sToesIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
#         cmds.connectAttr('%s.outputX' % rev,'%s.%s_%sToesFk_jnt_%sW0' % (pConst,self.locus,self.namespace,self.count))
        
        # replace the ik control with split translational/rotational controls
#         ctg = cmds.duplicate('%s_%sAnkleFk_cth_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_ctg_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         cth = cmds.duplicate('%s_%sAnkleFk_cth_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_cth_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         ctl = cmds.duplicate('%s_%sAnkleFk_ctl_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
#         cmds.delete(cmds.listRelatives(ctl,type='joint',f=True))
#         cmds.parent(ctl,cth)
#         cmds.parent(cth,ctg)
#         cmds.parent(ctg,IKCtl)
#         cmds.makeIdentity(ctg,a=True,r=True)
#         cmds.parent('%s_%sFootBankInIk_org_%s' % (self.locus,self.namespace,self.count),ctl)
        
        # create dummy ik leg to constrain the ankle rotation controls
#         hip   = cmds.duplicate('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sHipIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         knee  = cmds.duplicate('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sKneeIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         hock  = cmds.duplicate('%s_%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sHockIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         ankle = cmds.duplicate('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         cmds.parent(ankle,hock)
#         cmds.parent(hock,knee)
#         cmds.parent(knee,hip)
#         dummyikhandle = cmds.ikHandle(sj=hip,ee=ankle,sol='ikSpringSolver')[0]
#         cmds.parent(dummyikhandle,IKCtl)
#         cmds.poleVectorConstraint('%s_poleLeg_ctl_%s' % (self.locus,self.count),dummyikhandle)
        
        # setup the global orientation blending of the ik ankle rotational control
#         pConst = cmds.parentConstraint(ankle,IKCtl,ctg,st=['x','y','z'],mo=True)[0]
#         rev    = cmds.createNode('reverse')
#         cmds.connectAttr('%s.Global' % ctl,'%s.%sW1' % (pConst,IKCtl))
#         cmds.connectAttr('%s.Global' % ctl,'%s.inputX' % rev)
#         cmds.connectAttr('%s.outputX' % rev,'%s.%sW0' % (pConst,ankle))
#         cmds.setAttr('%s.interpType' % pConst,2)
#         cmds.setAttr('%s.Global' % ctl,1)
        
        # lower the foot roll controls to the ground plane
        cmds.setAttr('%s_rollLegBallIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegBallIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegBallIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.parent('%s_rollLegBallIk_org_%s' % (self.locus,self.count),w=True)
        #cmds.parent('%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count),w=True)
        #cmds.parent('%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count),w=True)
        cmds.setAttr('%s_rollLegHeelIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegHeelIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegHeelIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegToeIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegToeIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegToeIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.parent('%s_legToeIk_hdl_%s' % (self.locus,self.count),w=True)
        cmds.move(0,0,0,'%s_rollLegHeelIk_org_%s' % (self.locus,self.count),ws=True,x=False,y=True,z=False)
        cmds.move(0,0,0,'%s_rollLegToeIk_org_%s' % (self.locus,self.count),ws=True,x=False,y=True,z=False)
        cmds.parent('%s_rollLegBallIk_org_%s' % (self.locus,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        cmds.parent('%s_legToeIk_hdl_%s' % (self.locus,self.count),'%s_liftToeLegToeIk_org_%s' % (self.locus,self.count))
        #cmds.parent('%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        #cmds.parent('%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        
        # fix the IK partial stretching
        if not cmds.listConnections('%s_%sAnkleIk_jnt_%s.tx' % (self.locus,self.namespace,self.count),s=True,d=False):
            mult = cmds.createNode('multiplyDivide')
            x    = cmds.getAttr('%s_%sAnkleIk_jnt_%s.tx' % (self.locus,self.namespace,self.count))
            cmds.setAttr('%s.input1X' % mult,x)
            cmds.connectAttr('%s_messureDivLegIk_mdn_%s.outputX' % (self.locus,self.count),'%s.input2X' % mult)
            cmds.connectAttr('%s.outputX' % mult,'%s_%sAnkleIk_jnt_%s.tx' % (self.locus,self.namespace,self.count))
        
        # create the secondary IK structure
        ctl = cmds.circle(n='%s_%sHipIk_ctl_%s' % (self.locus,self.namespace,self.count),d=3,s=8,ch=False,nr=[1,0,0])[0]
        cth = cmds.group(n='%s_%sHipIk_cth_%s' % (self.locus,self.namespace,self.count))
        ctg = cmds.group(n='%s_%sHipIk_ctg_%s' % (self.locus,self.namespace,self.count))
        org = cmds.group(n='%s_secondaryIk_org_%s' % (self.locus,self.count))
        loc = cmds.spaceLocator(n='%s_%sKneeIk_loc_%s' % (self.locus,self.namespace,self.count))[0]
        
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.v' % org)
        
        cmds.setAttr('%s.tx' % ctl,l=True,k=False)
        cmds.setAttr('%s.ty' % ctl,l=True,k=False)
        cmds.setAttr('%s.tz' % ctl,l=True,k=False)
        cmds.setAttr('%s.rx' % ctl,l=True,k=False)
        cmds.setAttr('%s.sx' % ctl,l=True,k=False)
        cmds.setAttr('%s.sy' % ctl,l=True,k=False)
        cmds.setAttr('%s.sz' % ctl,l=True,k=False)
        cmds.setAttr('%s.v' % ctl,l=True,k=False)
        
        # position hip control
        cmds.parent(org,'%s_%sIK_org_%s' % (self.locus,self.namespace,self.count))
        cmds.parentConstraint('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),ctg,mo=False)
        
        # position knee locator
        cmds.parent(loc,ctl,r=True)
        cmds.connectAttr('%s_%sKneeIk_jnt_%s.tx' % (self.locus,self.namespace,self.count),'%s.tx' % loc)
        cmds.setAttr('%s.v' % loc,0)
        
        # duplicate knee
        knee  = cmds.duplicate('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_secondary%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        hock  = cmds.duplicate('%s_%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_secondary%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        ankle = cmds.duplicate('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_secondary%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        
        if not cmds.listConnections('%s.drawOverride' % knee,s=True,d=False):
            cmds.connectAttr('controlJointLayer.drawInfo','%s.drawOverride' % knee)
            cmds.connectAttr('controlJointLayer.drawInfo','%s.drawOverride' % hock)
        cmds.connectAttr('%s_%sHockIk_jnt_%s.tx' % (self.locus,self.namespace,self.count),'%s.tx' % hock)
        
        cmds.parent(ankle,hock)
        cmds.parent(hock,knee)
        cmds.parent('%s_poleLeg_ann_%s' % (self.locus,self.count),knee,r=True)
        cmds.parent(knee,org)
        
        # create IK
        handle = cmds.ikHandle(sj=knee,ee=ankle,sol='ikRPsolver')[0]
        cmds.parent(handle,footBallPivot)
        cmds.poleVectorConstraint('%s_poleLeg_ctl_%s' % (self.locus,self.count),handle)[0]
        cmds.pointConstraint(loc,knee)
        cmds.setAttr('%s.v' % handle,0)
        posA = cmds.xform('%s_%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
        posB = cmds.xform(hock,q=True,ws=True,t=True)
        
        if round(posA[0]) != round(posB[0]) or round(posA[1]) != round(posB[1]) or round(posA[2]) != round(posB[2]):
            cmds.setAttr('%s.twist' % handle,180)
        
        # setup the IK hip twist
        hipTwistIK  = cmds.duplicate('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_twist%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        kneeTwistIK = cmds.duplicate('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_twist%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        
        cmds.parent(kneeTwistIK,hipTwistIK)
        cmds.parent(hipTwistIK,'%s_%sAim_org_%s' % (self.locus,self.namespace,self.count))
        
        handle  = cmds.ikHandle(sj=hipTwistIK,ee=kneeTwistIK,sol='ikRPsolver')[0]
        cmds.parent(handle,ctl)
        cmds.poleVectorConstraint(hiprootloc,handle)[0]
        cmds.pointConstraint(hiprootloc,hipTwistIK)
        cmds.setAttr('%s.v' % handle,0)
        
#         mult = cmds.createNode('multiplyDivide')
#         cmds.connectAttr('C_root_bnd_0.rx','%s.input1X' % mult)
#         cmds.connectAttr('%s.outputX' % mult,'%s.twist' % handle)
#         cmds.setAttr('%s.input2X' % mult,-1)
        
        twistLocAIK = cmds.spaceLocator(n='%s_%sHipIkTwistA_loc_%s' % (self.locus,self.namespace,self.count))[0]
        twistLocBIK = cmds.spaceLocator(n='%s_%sHipIkTwistB_loc_%s' % (self.locus,self.namespace,self.count))[0]
        cmds.parent(twistLocAIK,twistLocBIK,hipTwistIK,r=True)
        pConst = cmds.pointConstraint(hipTwistIK,kneeTwistIK,twistLocAIK,mo=False)[0]
        oConst = cmds.orientConstraint(ctl,hipTwistIK,twistLocAIK,mo=False)[0]
        cmds.setAttr('%s.interpType' % oConst,2)
        cmds.setAttr('%s.%sW0' % (pConst,hipTwistIK),0.65)
        cmds.setAttr('%s.%sW1' % (pConst,kneeTwistIK),0.35)
        cmds.setAttr('%s.%sW0' % (oConst,ctl),0.35)
        cmds.setAttr('%s.%sW1' % (oConst,hipTwistIK),0.65)
        pConst = cmds.pointConstraint(hipTwistIK,kneeTwistIK,twistLocBIK,mo=False)[0]
        oConst = cmds.orientConstraint(ctl,hipTwistIK,twistLocBIK,mo=False)[0]
        cmds.setAttr('%s.interpType' % oConst,2)
        cmds.setAttr('%s.%sW0' % (pConst,hipTwistIK),0.35)
        cmds.setAttr('%s.%sW1' % (pConst,kneeTwistIK),0.65)
        cmds.setAttr('%s.%sW0' % (oConst,ctl),0.65)
        cmds.setAttr('%s.%sW1' % (oConst,hipTwistIK),0.35)
        
        # setup the FK hip twist
        hipTwistFK  = cmds.duplicate('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_twist%sHipFk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        kneeTwistFK = cmds.duplicate('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_twist%sKneeFk_jnt_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        
        cmds.parent(kneeTwistFK,hipTwistFK)
        cmds.parent(hipTwistFK,'%s_%sAim_org_%s' % (self.locus,self.namespace,self.count))
        
        handle = cmds.ikHandle(sj=hipTwistFK,ee=kneeTwistFK,sol='ikRPsolver')[0]
        cmds.parent(handle,'%s_%sHipFk_ctl_%s' % (self.locus,self.namespace,self.count))
        cmds.poleVectorConstraint('%s_%sHipFk_ctl_%s' % (self.locus,self.namespace,self.count),handle)[0]
        cmds.pointConstraint('%s_%sHipFk_ctl_%s' % (self.locus,self.namespace,self.count),hipTwistFK)
        cmds.setAttr('%s.v' % handle,0)
        
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('C_root_bnd_0.rx','%s.input1X' % mult)
        cmds.connectAttr('%s.outputX' % mult,'%s.twist' % handle)
        cmds.setAttr('%s.input2X' % mult,-1)
        
        twistLocAFK = cmds.spaceLocator(n='%s_%sHipFkTwistA_loc_%s' % (self.locus,self.namespace,self.count))[0]
        twistLocBFK = cmds.spaceLocator(n='%s_%sHipFkTwistB_loc_%s' % (self.locus,self.namespace,self.count))[0]
        cmds.parent(twistLocAFK,twistLocBFK,hipTwistFK,r=True)
        pConst = cmds.pointConstraint(hipTwistFK,kneeTwistFK,twistLocAFK,mo=False)[0]
        oConst = cmds.orientConstraint('%s_%sHipFk_ctl_%s' % (self.locus,self.namespace,self.count),hipTwistFK,twistLocAFK,mo=False)[0]
        cmds.setAttr('%s.interpType' % oConst,2)
        cmds.setAttr('%s.%sW0' % (pConst,hipTwistFK),0.65)
        cmds.setAttr('%s.%sW1' % (pConst,kneeTwistFK),0.35)
        cmds.setAttr('%s.%s_%sHipFk_ctl_%sW0' % (oConst,self.locus,self.namespace,self.count),0.35)
        cmds.setAttr('%s.%sW1' % (oConst,hipTwistFK),0.65)
        pConst = cmds.pointConstraint(hipTwistFK,kneeTwistFK,twistLocBFK,mo=False)[0]
        oConst = cmds.orientConstraint('%s_%sHipFk_ctl_%s' % (self.locus,self.namespace,self.count),hipTwistFK,twistLocBFK,mo=False)[0]
        cmds.setAttr('%s.interpType' % oConst,2)
        cmds.setAttr('%s.%sW0' % (pConst,hipTwistFK),0.35)
        cmds.setAttr('%s.%sW1' % (pConst,kneeTwistFK),0.65)
        cmds.setAttr('%s.%s_%sHipFk_ctl_%sW0' % (oConst,self.locus,self.namespace,self.count),0.65)
        cmds.setAttr('%s.%sW1' % (oConst,hipTwistFK),0.35)
        
        # re-constrain the bind joints
        cmds.delete('%s_%sHip_prc_%s' % (self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint(hipTwistFK,hipTwistIK,'%s_%sHip_bnd_%s' % (self.locus,self.namespace,self.count),mo=True)[0]
        cmds.setAttr('%s.interpType' % pConst,2)
        cmds.connectAttr('%s_blendLegFkIk_rev_%s.outputX' % (self.locus,self.count),'%s.%sW0' % (pConst,hipTwistFK))
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%sW1' % (pConst,hipTwistIK))
        
        cmds.delete('%s_%sKnee_prc_%s' % (self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint('%s_%sKneeFk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_secondary%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sKnee_bnd_%s' % (self.locus,self.namespace,self.count))[0]
        cmds.setAttr('%s.interpType' % pConst,2)
        cmds.connectAttr('%s_blendLegFkIk_rev_%s.outputX' % (self.locus,self.count),'%s.%s_%sKneeFk_jnt_%sW0' % (pConst,self.locus,self.namespace,self.count))
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_secondary%sKneeIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        
        cmds.delete('%s_%sHock_prc_%s' % (self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint('%s_%sHockFk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_secondary%sHockIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sHock_bnd_%s' % (self.locus,self.namespace,self.count))[0]
        cmds.setAttr('%s.interpType' % pConst,2)
        cmds.connectAttr('%s_blendLegFkIk_rev_%s.outputX' % (self.locus,self.count),'%s.%s_%sHockFk_jnt_%sW0' % (pConst,self.locus,self.namespace,self.count))
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_secondary%sHockIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        
        # create the hip twist bind joints
        cmds.select(cl=True)
        jnt = cmds.joint(n='%s_%sHipA_bnd_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(jnt,'%s_%sHip_bnd_%s' % (self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint(twistLocAFK,twistLocAIK,jnt,mo=False)[0]
        cmds.setAttr('%s.interpType' % pConst,2)
        cmds.connectAttr('%s_blendLegFkIk_rev_%s.outputX' % (self.locus,self.count),'%s.%sW0' % (pConst,twistLocAFK))
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%sW1' % (pConst,twistLocAIK))
        
        cmds.select(cl=True)
        jnt = cmds.joint(n='%s_%sHipB_bnd_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(jnt,'%s_%sHipA_bnd_%s' % (self.locus,self.namespace,self.count))
        pConst = cmds.parentConstraint(twistLocBFK,twistLocBIK,jnt,mo=False)[0]
        cmds.setAttr('%s.interpType' % pConst,2)
        cmds.connectAttr('%s_blendLegFkIk_rev_%s.outputX' % (self.locus,self.count),'%s.%sW0' % (pConst,twistLocBFK))
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%sW1' % (pConst,twistLocBIK))
        
        cmds.parent('%s_%sKnee_bnd_%s' % (self.locus,self.namespace,self.count),jnt)
        
        # lock attributes
        for attr in ['sx','sy','sz']:
            cmds.setAttr('%s_%sHipFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sKneeFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sHockFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sAnkleFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            #cmds.setAttr('%s_%sAnkleIk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sMidfootFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            #cmds.setAttr('%s_%sToesFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
        
        # create toe locator
        loc = cmds.spaceLocator(n='%s_toe_loc_%s' % (self.locus,self.count))[0]
        cmds.parent(loc,'%s_legToe_bnd_%s' % (self.locus,self.count),r=True)
        cmds.setAttr('%s.v' % loc,0)
        
        avg = cmds.createNode('plusMinusAverage')
        cmds.connectAttr('%s.kneeWeighting' % FKIKCtl,'%s.springAngleBias[0].springAngleBias_FloatValue' % legikhandle)
        cmds.connectAttr('%s.kneeWeighting' % FKIKCtl,'%s.input1D[1]' % avg)
        cmds.setAttr('%s.input1D[0]' % avg,1)
        cmds.setAttr('%s.operation' % avg,2)
        cmds.connectAttr('%s.output1D' % avg,'%s.springAngleBias[1].springAngleBias_FloatValue' % legikhandle)
        if cmds.getAttr('%s.v' % legikhandle):
            cmds.setAttr('%s.v' % legikhandle,0)
        
#         cmds.connectAttr('%s.kneeWeighting' % FKIKCtl,'%s.springAngleBias[0].springAngleBias_FloatValue' % dummyikhandle)
#         cmds.setAttr('%s.input1D[0]' % avg,1)
#         cmds.setAttr('%s.operation' % avg,2)
#         cmds.connectAttr('%s.output1D' % avg,'%s.springAngleBias[1].springAngleBias_FloatValue' % dummyikhandle)
#         cmds.setAttr('%s.v' % dummyikhandle,0)