import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds

cmds.cycleCheck(e=False)

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    
    def build(self):
        
        if self.locus == 'L': negate = -1
        else: negate = 1
        
        FKIKCtl = '%s_armFkIk_ctl_%s' % (self.locus,self.count)
        
        # constrain to rig
        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.delete('%s_armFkIk_prc_%s' % (self.locus,self.count))
        cmds.parentConstraint('%s_%sWrist_bnd_%s' % (self.locus,self.namespace,self.count),'%s_armFkIk_org_%s' % (self.locus,self.count),mo=True)
        
        # constrain arms
        loc = cmds.spaceLocator(n='%s_%sChestFollow_loc_%s' % (self.locus,self.namespace,self.count))[0]
        cmds.parent(loc,'%s_%sClavicle_bnd_%s' % (self.locus,self.namespace,self.count),r=True)
        cmds.parent(loc,'C_chest_bnd_0')
        cmds.parentConstraint(loc,'%s_%sClavicleFk_ctj_%s' % (self.locus,self.namespace,self.count),mo=True)
        cmds.setAttr('%s.v' % loc,0)
        
        # fix rotating feet/hands during stretch or bend
        src = cmds.listConnections('%s_%sElbowPart2_bnd_%s.scale' % (self.locus,self.namespace,self.count),s=True,d=False,p=True)[0]
        cmds.disconnectAttr(src,'%s_%sElbowPart2_bnd_%s.scale' % (self.locus,self.namespace,self.count))
        
        # add finger vis attribute to arm cross control
        cmds.addAttr(FKIKCtl,ln='fingerControls',at='double',min=0,max=1,dv=1)
        cmds.setAttr('%s.fingerControls' % FKIKCtl,e=True,k=True)
        cmds.connectAttr('%s.fingerControls' % FKIKCtl,'%s_to%sWristFk_jth_%s.v' % (self.locus,self.namespace,self.count),f=True)
        
        # add finger curl attributes to cross controls
        cmds.addAttr(FKIKCtl,ln='indexCurl',at='double',min=-1,max=1,dv=0)
        cmds.addAttr(FKIKCtl,ln='middleCurl',at='double',min=-1,max=1,dv=0)
        cmds.addAttr(FKIKCtl,ln='pinkyCurl',at='double',min=-1,max=1,dv=0)
        cmds.addAttr(FKIKCtl,ln='thumbCurl',at='double',min=-1,max=1,dv=0)
        cmds.addAttr(FKIKCtl,ln='thumbPan',at='double',min=-1,max=1,dv=0)
        cmds.addAttr(FKIKCtl,ln='spread',at='double',min=-1,max=1,dv=0)
        cmds.addAttr(FKIKCtl,ln='cup',at='double',min=0,max=1,dv=0)
        cmds.setAttr('%s.indexCurl' % FKIKCtl,e=True,k=True)
        cmds.setAttr('%s.middleCurl' % FKIKCtl,e=True,k=True)
        cmds.setAttr('%s.pinkyCurl' % FKIKCtl,e=True,k=True)
        cmds.setAttr('%s.thumbCurl' % FKIKCtl,e=True,k=True)
        cmds.setAttr('%s.thumbPan' % FKIKCtl,e=True,k=True)
        cmds.setAttr('%s.spread' % FKIKCtl,e=True,k=True)
        cmds.setAttr('%s.cup' % FKIKCtl,e=True,k=True)
        
        for finger in ['index','middle','pinky']:
            
            cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),
                                   '%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),
                                   '%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),
                                   '%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),
                                   '%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=0,itt='linear',ott='linear')
            if finger == 'pinky':
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=0.919,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=17.934,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-56.16,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-122,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-77,itt='linear',ott='linear')
                
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=0.715,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=-9.721,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=26.789,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=32.506,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=32.864,itt='linear',ott='linear')
            
            elif finger == 'middle':
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=0,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-0.461,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-57.014,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-122,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-68,itt='linear',ott='linear')
                
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=0,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=-0.461,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=23.728,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=32.733,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=31.802,itt='linear',ott='linear')
                
            elif finger == 'index':
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-3.142,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=1.128,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-49.665,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-122,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=1,v=-84,itt='linear',ott='linear')
                
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateX' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=0,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateY' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=17.337,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sAFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=22.78,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=33.324,itt='linear',ott='linear')
                cmds.setDrivenKeyframe('%s_%s%sCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,finger.title(),self.count),cd='%s.%sCurl' % (FKIKCtl,finger),dv=-1,v=30.626,itt='linear',ott='linear')
        
        cmds.setDrivenKeyframe('%s_%sThumbBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,self.count),
                               '%s_%sThumbCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.thumbCurl' % FKIKCtl,dv=0,itt='linear',ott='linear')
        
        cmds.setDrivenKeyframe('%s_%sThumbBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.thumbCurl' % FKIKCtl,dv=1,v=-75,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sThumbCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.thumbCurl' % FKIKCtl,dv=1,v=-105,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sThumbBFk_ctj_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.thumbCurl' % FKIKCtl,dv=-1,v=35,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sThumbCFk_ctj_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.thumbCurl' % FKIKCtl,dv=-1,v=35,itt='linear',ott='linear')
        
        cmds.setDrivenKeyframe('%s_%sThumbBFk_ctj_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.thumbPan' % FKIKCtl,dv=0,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sThumbBFk_ctj_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.thumbPan' % FKIKCtl,dv=1,v=-40,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sThumbBFk_ctj_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.thumbPan' % FKIKCtl,dv=-1,v=40,itt='linear',ott='linear')
        
        cmds.setDrivenKeyframe('%s_%sPinkyAFk_cth_%s.rotateY' % (self.locus,self.namespace,self.count),'%s_%sIndexAFk_cth_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.spread' % FKIKCtl,dv=0,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sPinkyAFk_cth_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.spread' % FKIKCtl,dv=1,v=-12,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sIndexAFk_cth_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.spread' % FKIKCtl,dv=1,v=12,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sPinkyAFk_cth_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.spread' % FKIKCtl,dv=-1,v=27,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sIndexAFk_cth_%s.rotateY' % (self.locus,self.namespace,self.count),cd='%s.spread' % FKIKCtl,dv=-1,v=-18.5,itt='linear',ott='linear')
        
        cmds.setDrivenKeyframe('%s_%sCupFk_cth_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.cup' % FKIKCtl,dv=1,v=-10,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sCupFk_cth_%s.rotateX' % (self.locus,self.namespace,self.count),cd='%s.cup' % FKIKCtl,dv=1,v=25,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sCupFk_cth_%s.rotateZ' % (self.locus,self.namespace,self.count),cd='%s.cup' % FKIKCtl,dv=0,v=0,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sCupFk_cth_%s.rotateX' % (self.locus,self.namespace,self.count),cd='%s.cup' % FKIKCtl,dv=0,v=0,itt='linear',ott='linear')
        
        # change shoulder FK rotation order
        cmds.setAttr('%s_%sShoulderFk_ctl_%s.rotateOrder' % (self.locus,self.namespace,self.count),0)
        
        # change thumb B rotation order
        cmds.setAttr('%s_%sThumbBFk_ctj_%s.rotateOrder' % (self.locus,self.namespace,self.count),1)
        
        # add offset value to wristFk control for FKIK matching
        off = cmds.xform('%s_%sWristFk_ctl_%s' % (self.locus,self.namespace,self.count),q=True,ws=True,ro=True)
        if self.locus == 'R':
            value = 180+(180-off[1])
        elif self.locus == 'L':
            value = off[1]
        cmds.addAttr('%s_%sWristFk_ctl_%s' % (self.locus,self.namespace,self.count),ln='offset',at='double',dv=value)
        cmds.setAttr('%s_%sWristFk_ctl_%s.offset' % (self.locus,self.namespace,self.count),l=True,k=False)
        
        # add additional twist joints to shoulder joints
        cmds.select(cl=True)
        mult = cmds.createNode('multiplyDivide')
        jnt  = cmds.joint(n='%s_%sShoulderTwistPart2_bnd_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(jnt,'%s_%sShoulderPart2_bnd_%s' % (self.locus,self.namespace,self.count),r=True)
        cmds.connectAttr('%s_%sElbowPart2_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s.outputX' % mult,'%s.rx' % jnt)
        cmds.setAttr('%s.input2X' % mult,2.5)
        
        cmds.select(cl=True)
        mult = cmds.createNode('multiplyDivide')
        jnt  = cmds.joint(n='%s_%sShoulderTwistPart1_bnd_%s' % (self.locus,self.namespace,self.count))
        cmds.parent(jnt,'%s_%sShoulderPart1_bnd_%s' % (self.locus,self.namespace,self.count),r=True)
        cmds.connectAttr('%s_%sElbowPart1_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s.outputX' % mult,'%s.rx' % jnt)
        cmds.setAttr('%s.input2X' % mult,1.25)
        
        # adjust elbow twist values
        cmds.setAttr('%s_%sElbowPart2_bnd_%s.twistAmount' % (self.locus,self.namespace,self.count),1)
        cmds.setAttr('%s_%sElbowPart1_bnd_%s.twistAmount' % (self.locus,self.namespace,self.count),.8)
        cmds.setAttr('%s_%sElbow_bnd_%s.twistAmount' % (self.locus,self.namespace,self.count),.6)
        
        # replace the ik control with split translational/rotational controls
#         cmds.delete('%s_%sWristIk_orc_%s' % (self.locus,self.namespace,self.count))
#         ctg = cmds.duplicate('%s_%sWristFk_cth_%s' % (self.locus,self.namespace,self.count),n='%s_%sWristIk_ctg_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         cth = cmds.duplicate('%s_%sWristFk_cth_%s' % (self.locus,self.namespace,self.count),n='%s_%sWristIk_cth_%s' % (self.locus,self.namespace,self.count),po=True)[0]
#         ctl = cmds.duplicate('%s_%sWristFk_ctl_%s' % (self.locus,self.namespace,self.count),n='%s_%sWristIk_ctl_%s' % (self.locus,self.namespace,self.count))[0]
#         cmds.delete(cmds.listRelatives(ctl,type='joint',f=True))
#         cmds.parent(ctl,cth)
#         cmds.parent(cth,ctg)
#         cmds.parent(ctg,'%s_armIk_ctl_%s' % (self.locus,self.count))
#         cmds.orientConstraint(ctl,'%s_%sWristIk_jnt_%s' % (self.locus,self.namespace,self.count),mo=False)
#         cmds.pointConstraint('%s_%sWristIk_jnt_%s' % (self.locus,self.namespace,self.count),ctg)
#         oConst = cmds.orientConstraint('%s_global%sWrist_tgt_%s' % (self.locus,self.namespace,self.count),'%s_%sElbowIk_jnt_%s' % (self.locus,self.namespace,self.count),ctg,mo=False)[0]
#         rev    = cmds.createNode('reverse')
#         cmds.connectAttr('%s.Global' % ctl,'%s.%s_global%sWrist_tgt_%sW0' % (oConst,self.locus,self.namespace,self.count))
#         cmds.connectAttr('%s.Global' % ctl,'%s.inputX' % rev)
#         cmds.connectAttr('%s.outputX' % rev,'%s.%s_%sElbowIk_jnt_%sW1' % (oConst,self.locus,self.namespace,self.count))
#         cmds.setAttr('%s.interpType' % oConst,2)
#         
        # lock attributes
        for attr in ['sx','sy','sz']:
            cmds.setAttr('%s_%sShoulderFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sElbowFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sWristFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            #cmds.setAttr('%s_%sWristIk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sClavicleFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sCupFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sPinkyAFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sPinkyBFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sPinkyCFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sMiddleAFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sMiddleBFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sMiddleCFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sIndexAFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sIndexBFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sIndexCFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sThumbAFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sThumbBFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_%sThumbCFk_ctl_%s.%s' % (self.locus,self.namespace,self.count,attr),l=True,k=False)
            
#         cmds.setAttr('%s_armIk_ctl_%s.rx' % (self.locus,self.count),l=True,k=False)
#         cmds.setAttr('%s_armIk_ctl_%s.ry' % (self.locus,self.count),l=True,k=False)
#         cmds.setAttr('%s_armIk_ctl_%s.rz' % (self.locus,self.count),l=True,k=False)
#         cmds.setAttr('%s_armIk_ctl_%s.stretchy' % (self.locus,self.count),l=True,k=False)
#         cmds.setAttr('%s_armIk_ctl_%s.antiPop' % (self.locus,self.count),l=True,k=False)
        
        self.addFiftyJoints()
        
    def addFiftyJoints(self):
        
        # 50/50 between wrist and elbow
        dup = cmds.duplicate('%s_%sWrist_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sWrist50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.002,0,dup,os=True,r=True)
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s_%sWrist_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s_%sWrist_bnd_%s.ry' % (self.locus,self.namespace,self.count),'%s.input1Y' % mult)
        cmds.connectAttr('%s_%sWrist_bnd_%s.rz' % (self.locus,self.namespace,self.count),'%s.input1Z' % mult)
        cmds.setAttr('%s.input2X' % mult,0.5)
        cmds.setAttr('%s.input2Y' % mult,0.5)
        cmds.setAttr('%s.input2Z' % mult,0.5)
        cmds.connectAttr('%s.output' % mult, '%s.rotate' % dup)
        cmds.pointConstraint('%s_%sWrist_bnd_%s' % (self.locus,self.namespace,self.count),dup,mo=True)
        
        # 50/50 between wrist and elbow plus scale in Y driven by wrist rotateZ
        dup = cmds.duplicate('%s_%sWrist_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sWristScale50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.004,0,dup,os=True,r=True)
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s_%sWrist_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s_%sWrist_bnd_%s.ry' % (self.locus,self.namespace,self.count),'%s.input1Y' % mult)
        cmds.connectAttr('%s_%sWrist_bnd_%s.rz' % (self.locus,self.namespace,self.count),'%s.input1Z' % mult)
        cmds.setAttr('%s.input2X' % mult,0.5)
        cmds.setAttr('%s.input2Y' % mult,0.5)
        cmds.setAttr('%s.input2Z' % mult,0.5)
        cmds.connectAttr('%s.output' % mult, '%s.rotate' % dup)
        cmds.pointConstraint('%s_%sWrist_bnd_%s' % (self.locus,self.namespace,self.count),dup,mo=True)
        
        cmds.setDrivenKeyframe('%s_%sWristScale50_bnd_%s.scaleY' % (self.locus,self.namespace,self.count),cd='%s_%sWrist_bnd_%s.rotateZ' % (self.locus,self.namespace,self.count),dv=0,v=1,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sWristScale50_bnd_%s.scaleY' % (self.locus,self.namespace,self.count),cd='%s_%sWrist_bnd_%s.rotateZ' % (self.locus,self.namespace,self.count),dv=90,v=1.5,itt='linear',ott='linear')
        cmds.setDrivenKeyframe('%s_%sWristScale50_bnd_%s.scaleY' % (self.locus,self.namespace,self.count),cd='%s_%sWrist_bnd_%s.rotateZ' % (self.locus,self.namespace,self.count),dv=-90,v=1.5,itt='linear',ott='linear')
        
        # 50/50 between index and wrist
        dup = cmds.duplicate('%s_%sIndexA_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sIndexA50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.005,0,dup,os=True,r=True)
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s_%sIndexA_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s_%sIndexA_bnd_%s.ry' % (self.locus,self.namespace,self.count),'%s.input1Y' % mult)
        cmds.connectAttr('%s_%sIndexA_bnd_%s.rz' % (self.locus,self.namespace,self.count),'%s.input1Z' % mult)
        cmds.setAttr('%s.input2X' % mult,0.5)
        cmds.setAttr('%s.input2Y' % mult,0.5)
        cmds.setAttr('%s.input2Z' % mult,0.5)
        cmds.connectAttr('%s.output' % mult, '%s.rotate' % dup)
        
        # 50/50 between middle and wrist
        dup = cmds.duplicate('%s_%sMiddleA_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sMiddleA50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.005,0,dup,os=True,r=True)
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s_%sMiddleA_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s_%sMiddleA_bnd_%s.ry' % (self.locus,self.namespace,self.count),'%s.input1Y' % mult)
        cmds.connectAttr('%s_%sMiddleA_bnd_%s.rz' % (self.locus,self.namespace,self.count),'%s.input1Z' % mult)
        cmds.setAttr('%s.input2X' % mult,0.5)
        cmds.setAttr('%s.input2Y' % mult,0.5)
        cmds.setAttr('%s.input2Z' % mult,0.5)
        cmds.connectAttr('%s.output' % mult, '%s.rotate' % dup)
        
        # 50/50 between pinky and cup
        dup = cmds.duplicate('%s_%sPinkyA_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sPinkyA50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.005,0,dup,os=True,r=True)
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s_%sPinkyA_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s_%sPinkyA_bnd_%s.ry' % (self.locus,self.namespace,self.count),'%s.input1Y' % mult)
        cmds.connectAttr('%s_%sPinkyA_bnd_%s.rz' % (self.locus,self.namespace,self.count),'%s.input1Z' % mult)
        cmds.setAttr('%s.input2X' % mult,0.5)
        cmds.setAttr('%s.input2Y' % mult,0.5)
        cmds.setAttr('%s.input2Z' % mult,0.5)
        cmds.connectAttr('%s.output' % mult, '%s.rotate' % dup)
        
        # 50/50 between thumb A and thumb B
        dup = cmds.duplicate('%s_%sThumbB_bnd_%s' % (self.locus,self.namespace,self.count),n='%s_%sThumbB50_bnd_%s' % (self.locus,self.namespace,self.count),po=True)[0]
        cmds.move(0,0.005,0,dup,os=True,r=True)
        mult = cmds.createNode('multiplyDivide')
        cmds.connectAttr('%s_%sThumbB_bnd_%s.rx' % (self.locus,self.namespace,self.count),'%s.input1X' % mult)
        cmds.connectAttr('%s_%sThumbB_bnd_%s.ry' % (self.locus,self.namespace,self.count),'%s.input1Y' % mult)
        cmds.connectAttr('%s_%sThumbB_bnd_%s.rz' % (self.locus,self.namespace,self.count),'%s.input1Z' % mult)
        cmds.setAttr('%s.input2X' % mult,0.5)
        cmds.setAttr('%s.input2Y' % mult,0.5)
        cmds.setAttr('%s.input2Z' % mult,0.5)
        cmds.connectAttr('%s.output' % mult, '%s.rotate' % dup)