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
            
        # add head squash
        cmds.setAttr('C_headDyn_org_0.inheritsTransform',0)
        
        # create the lattice
        cmds.select(cl=True)
        ffd, latt, base = cmds.lattice(n='C_headSquash_ffd_0',dv=[2,4,2],oc=True,ldv=[10,10,10],ol=2,ofd=0.1)
        
        cmds.setAttr('%s.v' % latt,0)
        cmds.setAttr('%s.v' % base,0)
        
        # position lattice
        cmds.delete(cmds.parentConstraint('comp_head0:C_headSquash_ctl_0',latt,mo=False))
        cmds.delete(cmds.parentConstraint('comp_head0:C_headSquash_ctl_0',base,mo=False))
        cmds.delete(cmds.scaleConstraint('comp_head0:C_headSquash_ctl_0',latt,mo=False))
        cmds.delete(cmds.scaleConstraint('comp_head0:C_headSquash_ctl_0',base,mo=False))
        
        cmds.parent(latt,base,'C_headDyn_org_0')
        
        # create joints to drive lattice
        cmds.select(cl=True)
        
        jntA = 'C_headSquashA_jnt_0'
        jntB = 'C_headSquashB_jnt_0'
        jntC = 'C_headSquashC_jnt_0'
        jntD = 'C_headSquashD_jnt_0'
        cmds.joint(n=jntA)
        cmds.joint(n=jntB)
        cmds.joint(n=jntC)
        cmds.joint(n=jntD)
        
        cmds.connectAttr('controlJointLayer.drawInfo','%s.drawOverride' % jntA)
        cmds.connectAttr('controlJointLayer.drawInfo','%s.drawOverride' % jntB)
        cmds.connectAttr('controlJointLayer.drawInfo','%s.drawOverride' % jntC)
        cmds.connectAttr('controlJointLayer.drawInfo','%s.drawOverride' % jntD)
        
        # position joints
        cmds.delete(cmds.parentConstraint('comp_head0:C_headSquashA_loc_0',jntA,mo=False))
        cmds.delete(cmds.parentConstraint('comp_head0:C_headSquashB_loc_0',jntB,mo=False))
        cmds.delete(cmds.parentConstraint('comp_head0:C_headSquashC_loc_0',jntC,mo=False))
        cmds.delete(cmds.parentConstraint('comp_head0:C_headSquashD_loc_0',jntD,mo=False))
        cmds.makeIdentity(jntA,a=True,r=True)
        cmds.parent(jntA,'C_headFk_jnt_0')
        
        # create dummy joints
        headDmy = cmds.duplicate('C_head_bnd_0',n='C_head_dmy_0',po=True)[0]
        dmyA = cmds.duplicate(jntA,n='C_headSquashA_dmy_0',po=True)[0]
        dmyB = cmds.duplicate(jntB,n='C_headSquashB_dmy_0',po=True)[0]
        dmyC = cmds.duplicate(jntC,n='C_headSquashC_dmy_0',po=True)[0]
        dmyD = cmds.duplicate(jntD,n='C_headSquashD_dmy_0',po=True)[0]
        
        cmds.parent(headDmy,'C_headDyn_org_0')
        cmds.parent(dmyA,headDmy)
        cmds.parent(dmyB,dmyA)
        cmds.parent(dmyC,dmyB)
        cmds.parent(dmyD,dmyC)
        
        for a,b in [[jntA,dmyA],[jntB,dmyB],[jntC,dmyC],[jntD,dmyD]]:
            cmds.connectAttr('%s.translate' % a,'%s.translate' % b)
            cmds.connectAttr('%s.rotate' % a,'%s.rotate' % b)
            cmds.connectAttr('%s.scale' % a,'%s.scale' % b)
        
        cmds.connectAttr('%s.scale' % dmyC,'%s.inverseScale' % dmyD)
        cmds.connectAttr('%s.scale' % dmyB,'%s.inverseScale' % dmyC)
        cmds.connectAttr('%s.scale' % dmyA,'%s.inverseScale' % dmyB)
        cmds.connectAttr('%s.scale' % headDmy,'%s.inverseScale' % dmyA)
        
        # bind lattice to joints
        skinCluster = cmds.skinCluster([dmyA,dmyB,dmyC,dmyD], latt, sm=2, foc=True, tsb=True, nw=1)[0]
        for x in range(4):
            a = 1 if x == 0 else 0
            b = 1 if x == 1 else 0
            c = 1 if x == 2 else 0
            d = 1 if x == 3 else 0
            for i in range(2):
                cmds.setAttr('%s.weightList[%s].weights[0]' % (skinCluster,(i + (2*x))), a)
                cmds.setAttr('%s.weightList[%s].weights[1]' % (skinCluster,(i + (2*x))), b)
                cmds.setAttr('%s.weightList[%s].weights[2]' % (skinCluster,(i + (2*x))), c)
                cmds.setAttr('%s.weightList[%s].weights[3]' % (skinCluster,(i + (2*x))), d)
                cmds.setAttr('%s.weightList[%s].weights[0]' % (skinCluster,(i + (2*x) + 8)), a)
                cmds.setAttr('%s.weightList[%s].weights[1]' % (skinCluster,(i + (2*x) + 8)), b)
                cmds.setAttr('%s.weightList[%s].weights[2]' % (skinCluster,(i + (2*x) + 8)), c)
                cmds.setAttr('%s.weightList[%s].weights[3]' % (skinCluster,(i + (2*x) + 8)), d)
        
        # create squash control
        ctl = cmds.curve(n='C_headSquash_ctl_0',d=1,p=[[0,1,0],[0,-1,0],[0,0,0],[1,0,0],[-1,0,0],[0,0,0],[0,0,1],[0,0,-1]])
        cth = cmds.group(n='C_headSquash_cth_0')
        ctg = cmds.group(n='C_headSquash_ctg_0')
        shp = cmds.listRelatives(ctl,s=True)[0]
        cmds.rename(shp,'C_headSquash_ctl_0Shape')
        cmds.setAttr('%s.rx' % ctl,l=True,k=False)
        cmds.setAttr('%s.ry' % ctl,l=True,k=False)
        cmds.setAttr('%s.rz' % ctl,l=True,k=False)
        cmds.setAttr('%s.sx' % ctl,l=True,k=False)
        cmds.setAttr('%s.sy' % ctl,l=True,k=False)
        cmds.setAttr('%s.sz' % ctl,l=True,k=False)
        cmds.setAttr('%s.v' % ctl,l=True,k=False)
        
        # position control
        cmds.delete(cmds.parentConstraint('comp_head0:C_skull_ctl_0',ctg,mo=False))
        
        cmds.parent(ctg,'C_headFk_jnt_0')
        
        # connect control to joints
        mult  = cmds.createNode('multiplyDivide')
        mult2 = cmds.createNode('multiplyDivide')
        mult3 = cmds.createNode('multiplyDivide')
        mult4 = cmds.createNode('multiplyDivide')
        avg   = cmds.createNode('plusMinusAverage')
        avg2  = cmds.createNode('plusMinusAverage')
        avg3  = cmds.createNode('plusMinusAverage')
        avg4  = cmds.createNode('plusMinusAverage')
        avg5  = cmds.createNode('plusMinusAverage')
        y     = cmds.getAttr('%s.ty' % jntB)
        cmds.connectAttr('%s.tx' % ctl, '%s.input1X' % mult)
        cmds.setAttr('%s.input2X' % mult,-1)
        cmds.setAttr('%s.input1D[0]' % avg, y)
        cmds.connectAttr('%s.ty' % ctl, '%s.input1X' % mult3)
        cmds.setAttr('%s.input2X' % mult3,0.25)
        cmds.connectAttr('%s.outputX' % mult3, '%s.input1D[1]' % avg)
        for jnt in [jntB,jntC,jntD]:
            cmds.connectAttr('%s.tz' % ctl,'%s.rx' % jnt)
            cmds.connectAttr('%s.outputX' % mult,'%s.rz' % jnt)
            cmds.connectAttr('%s.output1D' % avg,'%s.ty' % jnt)
            
        cmds.setAttr('%s.input1D[0]' % avg2,3 * y)
        cmds.connectAttr('%s.ty' % jntB,'%s.input1D[0]' % avg3)
        cmds.connectAttr('%s.ty' % jntC,'%s.input1D[1]' % avg3)
        cmds.connectAttr('%s.ty' % jntD,'%s.input1D[2]' % avg3)
        cmds.connectAttr('%s.output1D' % avg3,'%s.input1D[1]' % avg2)
        cmds.setAttr('%s.operation' % avg2,2)
        cmds.connectAttr('%s.output1D' % avg2,'%s.input1X' % mult2)
        cmds.connectAttr('%s.output1D' % avg2,'%s.input1X' % mult4)
        cmds.setAttr('%s.input2X' % mult2,0.5)
        cmds.setAttr('%s.input2X' % mult4,0.1)
        cmds.setAttr('%s.input3D[0]' % avg4,1,1,1)
        cmds.setAttr('%s.input3D[0]' % avg5,1,1,1)
        cmds.connectAttr('%s.outputX' % mult2,'%s.input3D[1].input3Dx' % avg4)
        cmds.connectAttr('%s.outputX' % mult2,'%s.input3D[1].input3Dz' % avg4)
        cmds.connectAttr('%s.outputX' % mult4,'%s.input3D[1].input3Dx' % avg5)
        cmds.connectAttr('%s.outputX' % mult4,'%s.input3D[1].input3Dz' % avg5)
        cmds.connectAttr('%s.output3D' % avg4,'%s.scale' % jntB)
        cmds.connectAttr('%s.output3D' % avg4,'%s.scale' % jntC)
        cmds.connectAttr('%s.output3D' % avg5,'%s.scale' % jntD)
