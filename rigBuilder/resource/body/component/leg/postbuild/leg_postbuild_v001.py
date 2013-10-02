import rigBuilder.body.bodyClasses as classes
import rigBuilder.rigEnv as env
import maya.cmds as cmds
import re, string

cmds.cycleCheck(e=False)

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        FKIKCtl       = '%s_legFkIk_ctl_%s' % (self.locus,self.count)
        IKCtl         = '%s_legIk_ctl_%s' % (self.locus,self.count)
        footBallPivot = '%s_footPivotBallLegIk_org_%s' % (self.locus,self.count)
        footRoll      = '%s_footRollLegIk_org_%s' % (self.locus,self.count)
        ballIkCtl     = '%s_legBallIk_ctl_%s' % (self.locus,self.count)
        
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
        cmds.parentConstraint('C_root_bnd_0','%s_%sHipIk_org_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.parentConstraint('C_root_bnd_0','%s_%sCtl_org_%s' % (self.locus,self.namespace,self.count),mo=True)
        
        #FKIKCtl = '%s_legFkIk_ctl_%s' % (self.locus,self.count)
        
        # connect fkikctl attrs to ik foot ctl attrs
        cmds.connectAttr('%s.swivel' % FKIKCtl,'%s.swivel' % IKCtl)
        cmds.setAttr('%s.swivel' % IKCtl,l=True,k=False)
        cmds.setAttr('%s.toe' % IKCtl,l=True,k=False)
        cmds.setAttr('%s.rollAngle' % IKCtl,l=True,k=False)
        
        # fix rotating feet/hands during stretch or bend
        src = cmds.listConnections('%s_%sKneePart2_bnd_%s.scale' % (self.locus,self.namespace,self.count),s=True,d=False,p=True)[0]
        cmds.disconnectAttr(src,'%s_%sKneePart2_bnd_%s.scale' % (self.locus,self.namespace,self.count))
        
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
        
        # add hip translational control
        grp = cmds.group(em=True,n='%s_%sHipIk_ctg_%s' % (self.locus,self.namespace,self.count))
        off = cmds.group(em=True,n='%s_%sHipIk_cth_%s' % (self.locus,self.namespace,self.count))
        crv = cmds.circle(n='%s_%sHipIk_ctl_%s' % (self.locus,self.namespace,self.count),d=1,s=4,ch=False,nr=[0,1,0])[0]
        cmds.parent(crv,off)
        cmds.parent(off,grp)
        cmds.parent(grp,'%s_%sHipIk_org_%s' % (self.locus,self.namespace,self.count))
        pos = cmds.xform('%s_%sHipIk_jth_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
        cmds.move(pos[0],pos[1],pos[2],grp,ws=True)
        cmds.parent('%s_%sHipIk_jth_%s' % (self.locus,self.namespace,self.count),crv)
        cmds.setAttr('%s.rx' % crv,l=True,k=False)
        cmds.setAttr('%s.ry' % crv,l=True,k=False)
        cmds.setAttr('%s.rz' % crv,l=True,k=False)
        cmds.setAttr('%s.sx' % crv,l=True,k=False)
        cmds.setAttr('%s.sy' % crv,l=True,k=False)
        cmds.setAttr('%s.sz' % crv,l=True,k=False)
        cmds.setAttr('%s.v' % crv,l=True,k=False)
        
        shp = cmds.listRelatives(crv,s=True)[0]
        cmds.setAttr('%s.overrideEnabled' % shp,1)
        cmds.setAttr('%s.overrideColor' % shp, env.CONTROL_COLOR[self.locus])
                
        # reconnect foot roll
        cmds.parent(footBallPivot, '%s_legBallIk_cth_%s' % (self.locus,self.count))
        cmds.setAttr('%s.roll' % IKCtl,l=True,cb=False,k=False)
        cmds.connectAttr('%s.swivel' % IKCtl,'%s_legToeIk_cth_%s.ry' % (self.locus,self.count))
    
    
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
        
        # add 50 joint
        dup = cmds.duplicate('%s_%sAnkle_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkle50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.004,0,dup,os=True,r=True)
        pConst = cmds.parentConstraint('%s_%sKneePart2_bnd_%s' % (self.locus,self.namespace,self.count),'%s_%sAnkle_bnd_%s' % (self.locus,self.namespace,self.count),dup,mo=True,st=['x','y','z'])
        cmds.setAttr('%s.interpType' % pConst[0],2)
        cmds.pointConstraint('%s_%sAnkle_bnd_%s' % (self.locus,self.namespace,self.count),dup,mo=True)
        
        dup = cmds.duplicate('%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sMidfoot50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.004,0,dup,os=True,r=True)
        pConst = cmds.parentConstraint('%s_%sAnkle_bnd_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),dup,mo=True,st=['x','y','z'])
        cmds.setAttr('%s.interpType' % pConst[0],2)
        
        dup = cmds.duplicate('%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sToes50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.004,0,dup,os=True,r=True)
        pConst = cmds.parentConstraint('%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),'%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count),dup,mo=True,st=['x','y','z'])
        cmds.setAttr('%s.interpType' % pConst[0],2)
        
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
        cmds.delete('%s_%sToesEnd_bnd_%s' % (self.locus,self.namespace,self.count))
        cmds.parent('%s_legToe_bnd_%s' % (self.locus,self.count),'%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count))
        # create toes IK joint
        toesIKJoint = cmds.joint(n='%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count))
        pos         = cmds.xform('%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
        cmds.move(pos[0],pos[1],pos[2],toesIKJoint,ws=True)
        cmds.parent(toesIKJoint,'%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count))
        cmds.makeIdentity(toesIKJoint,a=True,r=True,jo=True)
        cmds.parent('%s_legToeIk_jnt_%s' % (self.locus,self.count),toesIKJoint)
        # new rotational groups
        org = cmds.group(em=True,n='%s_%sToesPivotBallLegIK_org_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(org,'%s_legBallIk_cth_%s' % (self.locus,self.count),r=True)
        cmds.move(pos[0],pos[1],pos[2],org,ws=True)
        cmds.parent(footBallPivot,org)
        # toe ik handles
        cmds.delete('%s_liftToeLegToeIk_org_%s' % (self.locus,self.count))
        midfootIK = cmds.ikHandle(n='%s_legMidfootIk_hdl_%s' % (self.locus,self.count),sj='%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),ee=toesIKJoint)[0]
        toeIK     = cmds.ikHandle(n='%s_legToeIk_hdl_%s' % (self.locus,self.count),sj=toesIKJoint,ee='%s_legToeIk_jnt_%s' % (self.locus,self.count))[0]
        cmds.setAttr('%s.v' % midfootIK,0)
        cmds.setAttr('%s.v' % toeIK,0)
        
        # connect roll
        clamp = cmds.createNode('clamp')
        mult  = cmds.createNode('multiplyDivide')
        cmds.setAttr('%s.maxR' % clamp,99999)
        cmds.setAttr('%s.input2X' % mult,0.25)
        cmds.connectAttr('%s.rx' % ballIkCtl,'%s.inputR' % clamp)
        cmds.connectAttr('%s.outputR' % clamp,'%s.input1X' % mult)
        cmds.connectAttr('%s.outputX' % mult,'%s.rx' % footBallPivot)
        cmds.connectAttr('%s.outputR' % clamp,'%s.rx' % org)
        clamp = cmds.createNode('clamp')
        #avg   = cmds.createNode('plusMinusAverage')
        plug  = cmds.listConnections('%s_rollLegHeelIk_org_%s.rx' % (self.locus,self.count),s=True,d=False,p=True)[0]
        cmds.setAttr('%s.minR' % clamp,-99999)
        cmds.connectAttr('%s.rx' % ballIkCtl,'%s.inputR' % clamp)
        cmds.disconnectAttr(plug,'%s_rollLegHeelIk_org_%s.rx' % (self.locus,self.count))
        cmds.connectAttr('%s.outputR' % clamp,'%s_rollLegHeelIk_org_%s.rx' % (self.locus,self.count))
        cmds.connectAttr('%s.heelBank' % FKIKCtl,'%s.rz' % footBallPivot)
        cmds.connectAttr('%s.heelBank' % FKIKCtl,'%s.rz' % org)
        #cmds.setAttr('%s.input1D[0]' % avg,cmds.getAttr('%s.ry' % footBallPivot))
        #cmds.connectAttr('%s.heelSwivel' % FKIKCtl,'%s.input1D[1]' % avg)
        #cmds.connectAttr('%s.output1D' % avg, '%s.ry' % footBallPivot)
        children = cmds.listRelatives(footBallPivot,c=True)
        cmds.parent(children,w=True)
        cmds.connectAttr('%s.heelSwivel' % FKIKCtl,'%s.ry' % footBallPivot)
        cmds.parent(children,footBallPivot)
        cmds.connectAttr('%s.heelSwivel' % FKIKCtl,'%s.ry' % org)
        # create 'fk' controls
        toesctl = cmds.circle(ch=False,n='%s_%sToesIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
        toescth = cmds.group(n='%s_%sToesIk_cth_%s' % (self.locus,self.namespace,self.count))
        toesctg = cmds.group(n='%s_%sToesIk_ctg_%s' % (self.locus,self.namespace,self.count))
        toesdummyoff = cmds.group(n='%s_%sToesIkDummy_off_%s' % (self.locus,self.namespace,self.count),em=True)
        toesdummyorg = cmds.group(n='%s_%sToesIkDummy_org_%s' % (self.locus,self.namespace,self.count))
        #cmds.move(pos[0],pos[1],pos[2],toesctg,ws=True)
        #cmds.move(pos[0],pos[1],pos[2],toesdummyorg,ws=True)
        cmds.delete(cmds.parentConstraint('%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count),toesctg,mo=False))
        cmds.delete(cmds.parentConstraint('%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count),toesdummyorg,mo=False))
        
        pos = cmds.xform('%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,t=True)
        footctl = cmds.circle(ch=False,n='%s_%sMidfootIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
        footcth = cmds.group(n='%s_%sMidfootIk_cth_%s' % (self.locus,self.namespace,self.count))
        footctg = cmds.group(n='%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count))
        footdummyoff  = cmds.group(n='%s_%sMidfootIkDummy_off_%s' % (self.locus,self.namespace,self.count),em=True)
        footdummyorg  = cmds.group(n='%s_%sMidfootIkDummy_org_%s' % (self.locus,self.namespace,self.count))
        footdummymain = cmds.group(n='%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count))
        #cmds.move(pos[0],pos[1],pos[2],footctg,ws=True)
        #cmds.move(pos[0],pos[1],pos[2],footdummyorg,ws=True)
        cmds.delete(cmds.parentConstraint('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),footctg,mo=False))
        cmds.delete(cmds.parentConstraint('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),footdummymain,mo=False))
        
        cmds.setAttr('%s.tx' % toesctl,l=True,k=False)
        cmds.setAttr('%s.ty' % toesctl,l=True,k=False)
        cmds.setAttr('%s.tz' % toesctl,l=True,k=False)
        cmds.setAttr('%s.sx' % toesctl,l=True,k=False)
        cmds.setAttr('%s.sy' % toesctl,l=True,k=False)
        cmds.setAttr('%s.sz' % toesctl,l=True,k=False)
        cmds.setAttr('%s.v' % toesctl,l=True,k=False)
        cmds.setAttr('%s.tx' % footctl,l=True,k=False)
        cmds.setAttr('%s.ty' % footctl,l=True,k=False)
        cmds.setAttr('%s.tz' % footctl,l=True,k=False)
        cmds.setAttr('%s.sx' % footctl,l=True,k=False)
        cmds.setAttr('%s.sy' % footctl,l=True,k=False)
        cmds.setAttr('%s.sz' % footctl,l=True,k=False)
        cmds.setAttr('%s.v' % footctl,l=True,k=False)
        
        cmds.parent(toesctg,footctl)
        cmds.parent(toesdummyorg,footdummyoff)
        #cmds.parent(footdummyorg,footdummymain)
        cmds.parent(footctg,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        cmds.parent(footdummymain,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        cmds.parent(toeIK,toesdummyoff)
        cmds.parent(midfootIK,footdummyoff)
        
        #####################################
        #####################################
        #####################################
        #####################################
        cmds.connectAttr('%s.rotate' % toesctl,'%s.rotate' % toesdummyoff)
        cmds.connectAttr('%s.rotate' % footctl,'%s.rotate' % footdummyoff)
        #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toescth)
        #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footcth)
        #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toesdummyorg)
        #cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footdummyorg)
        cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % toescth)
        cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % footcth)
        cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % toesdummyorg)
        cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rz' % footdummyorg)
        cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toescth)
        cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footcth)
        cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toesdummyorg)
        cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footdummyorg)
        #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toescth)
        #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footcth)
        #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toesdummyorg)
        #cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footdummyorg)
        cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % toescth)
        cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % footcth)
        cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % toesdummyorg)
        cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rx' % footdummyorg)
#         cmds.parent(toesctg,footctl)
#         cmds.parent(toesdummyorg,footdummyoff)
#         cmds.parent(footctg,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
#         cmds.parent(footdummyorg,'%s_legToeIk_ctl_%s' % (self.locus,self.count))
#         cmds.parent(toeIK,toesdummyoff)
#         cmds.parent(midfootIK,footdummyoff)
#         cmds.connectAttr('%s.rotate' % toesctl,'%s.rotate' % toesdummyoff)
#         cmds.connectAttr('%s.rotate' % footctl,'%s.rotate' % footdummyoff)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toescth)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footcth)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % toesdummyorg)
#         cmds.connectAttr('%s.toeRoll' % FKIKCtl,'%s.rx' % footdummyorg)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toescth)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footcth)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % toesdummyorg)
#         cmds.connectAttr('%s.toeSwivel' % FKIKCtl,'%s.ry' % footdummyorg)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toescth)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footcth)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % toesdummyorg)
#         cmds.connectAttr('%s.toeTwist' % FKIKCtl,'%s.rz' % footdummyorg)
        
        cmds.parentConstraint('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),footctg,mo=True)
        cmds.parentConstraint('%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),toesctg,mo=True)
        # connect shape visibility
        shp = cmds.listRelatives(toesctl,s=True)[0]
        cmds.connectAttr('%s.feetControls' % FKIKCtl,'%s.v' % shp)
        shp = cmds.listRelatives(footctl,s=True)[0]
        cmds.connectAttr('%s.feetControls' % FKIKCtl,'%s.v' % shp)
        # move original fk controls
        cmds.parent('%s_%sMidfootFk_ctj_%s' % (self.locus,self.namespace,self.count),'%s_%sAnkleFk_jnt_%s' % (self.locus,self.namespace,self.count))
        cmds.parent('%s_%sToesFk_ctj_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfootFk_jnt_%s' % (self.locus,self.namespace,self.count))
        cmds.delete('%s_to%sMidfootFk_jth_%s' % (self.locus,self.namespace,self.count),'%s_to%sAnkleFk_jth_%s' % (self.locus,self.namespace,self.count))
        # constrain bind joints
        for constraint in cmds.listConnections('%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count),s=True,d=False):
            if cmds.objectType(constraint,isAType='constraint'):
                cmds.delete(constraint)
                break
        pConst = cmds.parentConstraint('%s_%sMidfootFk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfootIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sMidfoot_bnd_%s' % (self.locus,self.namespace,self.count))[0]
        rev    = cmds.createNode('reverse')
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.inputX' % rev)
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sMidfootIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        cmds.connectAttr('%s.outputX' % rev,'%s.%s_%sMidfootFk_jnt_%sW0' % (pConst,self.locus,self.namespace,self.count))
        
        for constraint in cmds.listConnections('%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count),s=True,d=False):
            if cmds.objectType(constraint,isAType='constraint'):
                cmds.delete(constraint)
                break
        pConst = cmds.parentConstraint('%s_%sToesFk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sToesIk_jnt_%s' % (self.locus,self.namespace,self.count),'%s_%sToes_bnd_%s' % (self.locus,self.namespace,self.count))[0]
        cmds.connectAttr('%s.FKIKBlend' % FKIKCtl,'%s.%s_%sToesIk_jnt_%sW1' % (pConst,self.locus,self.namespace,self.count))
        cmds.connectAttr('%s.outputX' % rev,'%s.%s_%sToesFk_jnt_%sW0' % (pConst,self.locus,self.namespace,self.count))
        
        # fix the upper leg twist
        cmds.setAttr('%s_%sHip_bnd_%s.twistAmount' % (self.locus,self.namespace,self.count),1)
        cmds.setAttr('%s_%sHipPart1_bnd_%s.twistAmount' % (self.locus,self.namespace,self.count),1)
        cmds.setAttr('%s_%sHipPart2_bnd_%s.twistAmount' % (self.locus,self.namespace,self.count),1)
        
        # replace the ik control with split translational/rotational controls
#         cmds.delete('%s_%sAnkleIk_orc_%s' % (self.locus,self.namespace,self.count))
#         ctg = cmds.duplicate('%s_%sAnkleFk_cth_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_ctg_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         cth = cmds.duplicate('%s_%sAnkleFk_cth_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_cth_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         ctl = cmds.duplicate('%s_%sAnkleFk_ctl_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
#         cmds.delete(cmds.listRelatives(ctl,type='joint',f=True))
#         cmds.parent(ctl,cth)
#         cmds.parent(cth,ctg)
#         cmds.parent(ctg,'%s_legIk_ctl_%s' % (self.locus,self.count))
#         cmds.makeIdentity(ctg,a=True,r=True)
#         cmds.parent('%s_footBankInIk_org_%s' % (self.locus,self.count),ctl)
        
        # create dummy ik leg to constrain the ankle rotation controls
#         hip   = cmds.duplicate('%s_%sHipIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sHipIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         knee  = cmds.duplicate('%s_%sKneeIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sKneeIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         ankle = cmds.duplicate('%s_%sAnkleIk_jnt_%s' % (self.locus,self.namespace,self.count),n='%s_%sAnkleIk_dmy_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         cmds.parent(ankle,knee)
#         cmds.parent(knee,hip)
#         handle = cmds.ikHandle(sj=hip,ee=ankle,sol='ikRPsolver')[0]
#         cmds.parent(handle,'%s_legIk_ctl_%s' % (self.locus,self.count))
#         cmds.setAttr('%s.v' % handle,0)
        
        # setup the global orientation blending of the ik ankle rotational control
#         pConst = cmds.parentConstraint(knee,'%s_legIk_ctl_%s' % (self.locus,self.count),ctg,st=['x','y','z'],mo=True)[0]
#         rev    = cmds.createNode('reverse')
#         cmds.connectAttr('%s.Global' % ctl,'%s.%s_legIk_ctl_%sW1' % (pConst,self.locus,self.count))
#         cmds.connectAttr('%s.Global' % ctl,'%s.inputX' % rev)
#         cmds.connectAttr('%s.outputX' % rev,'%s.%sW0' % (pConst,knee))
#         cmds.setAttr('%s.interpType' % pConst,2)
#         cmds.setAttr('%s.Global' % ctl,1)
        
        # lower the foot roll controls to the ground plane
#         cmds.setAttr('%s_rollLegBallIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
#         cmds.setAttr('%s_rollLegBallIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
#         cmds.setAttr('%s_rollLegBallIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
#         cmds.parent('%s_rollLegBallIk_org_%s' % (self.locus,self.count),w=True)
#         cmds.parent('%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count),w=True)
#         cmds.parent('%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count),w=True)
#         cmds.setAttr('%s_rollLegHeelIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
#         cmds.setAttr('%s_rollLegHeelIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
#         cmds.setAttr('%s_rollLegHeelIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
#         cmds.move(0,0,0,'%s_rollLegHeelIk_org_%s' % (self.locus,self.count),ws=True,x=False,y=True,z=False)
#         cmds.parent('%s_rollLegBallIk_org_%s' % (self.locus,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
#         cmds.parent('%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
#         cmds.parent('%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        
        # lower the foot roll controls to the ground plane
        cmds.setAttr('%s_rollLegBallIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegBallIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegBallIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.parent('%s_rollLegBallIk_org_%s' % (self.locus,self.count),w=True)
        cmds.parent('%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count),w=True)
        cmds.parent('%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count),w=True)
        cmds.setAttr('%s_rollLegHeelIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegHeelIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegHeelIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegToeIk_org_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegToeIk_org_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_rollLegToeIk_org_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.parent(toeIK,w=True)
        cmds.move(0,0,0,'%s_rollLegHeelIk_org_%s' % (self.locus,self.count),ws=True,x=False,y=True,z=False)
        cmds.move(0,0,0,'%s_rollLegToeIk_org_%s' % (self.locus,self.count),ws=True,x=False,y=True,z=False)
        cmds.parent('%s_rollLegBallIk_org_%s' % (self.locus,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        cmds.parent('%s_%sMidfootIk_ctg_%s' % (self.locus,self.namespace,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        cmds.parent('%s_%sFootIkDummy_org_%s' % (self.locus,self.namespace,self.count),'%s_legToeIk_ctl_%s' % (self.locus,self.count))
        cmds.parent(toeIK,toesdummyoff)
        
        
        # create toe locator
#         loc = cmds.spaceLocator(n='%s_toe_loc_%s' % (self.locus,self.count))[0]
#         cmds.parent(loc,'%s_%sToe_bnd_%s' % (self.locus,self.namespace,self.count),r=True)
#         cmds.setAttr('%s.v' % loc,0)
        
        # lock attributes
        for attr in ['sx','sy','sz']:
            cmds.setAttr('%s_%sHipFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sKneeFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sAnkleFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            #cmds.setAttr('%s_%sAnkleIk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sMidfootFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sToesFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
        
#         cmds.setAttr('%s_legIk_ctl_%s.stretchy' % (self.locus,self.count),l=True,k=False)
#         cmds.setAttr('%s_legIk_ctl_%s.antiPop' % (self.locus,self.count),l=True,k=False)