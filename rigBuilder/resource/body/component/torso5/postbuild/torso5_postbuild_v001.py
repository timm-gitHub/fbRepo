import rigBuilder.body.bodyClasses as classes
import maya.cmds as cmds
import rigBuilder.rigEnv as rigEnv
import string

class RigBuild(classes.RigComponent):
    """
    Module containing processes to run prior to Advanced Skeleton generation,
    after setting up the guide rig.
    
    """
    def build(self):
        
        # constrain to the rig
        cmds.connectAttr('C_main_loc_0Shape.worldPosition','%s_%s_mod_%s.translate' % (self.locus,self.namespace,self.count))
        cmds.orientConstraint('C_main_loc_0','%s_%s_mod_%s' % (self.locus,self.namespace,self.count),mo=True)
        
        # add torso attributes to centerA control
        cmds.addAttr('C_center_ctl_0',ln='spine',nn='   ',at='enum',en='Torso')
        cmds.setAttr('C_center_ctl_0.spine',cb=True)
        cmds.addAttr('C_center_ctl_0',ln='spineFKIKBlend',at='double',min=0,max=1,dv=0)
        cmds.setAttr('C_center_ctl_0.spineFKIKBlend',e=True,k=True)
        cmds.addAttr('C_center_ctl_0',ln='spineautoVis',at='bool')
        cmds.setAttr('C_center_ctl_0.spineautoVis',1,e=True,cb=True)
        cmds.addAttr('C_center_ctl_0',ln='spineFKVis',at='bool')
        cmds.setAttr('C_center_ctl_0.spineFKVis',e=True,cb=True)
        cmds.addAttr('C_center_ctl_0',ln='spineIKVis',at='bool')
        cmds.setAttr('C_center_ctl_0.spineIKVis',e=True,cb=True)
        
        # fix middle torso IK control positioning
        cmds.delete('%s_spine2Ik_prc_%s' % (self.locus,self.count))
        cmds.pointConstraint('%s_spine4Ik_ctl_%s' % (self.locus,self.count),'%s_spine0Ik_ctl_%s' % (self.locus,self.count),'%s_spine2Ik_org_%s' % (self.locus,self.count),mo=True)
        oConst = cmds.orientConstraint('%s_spine4Ik_ctl_%s' % (self.locus,self.count),'%s_spine0Ik_ctl_%s' % (self.locus,self.count),'%s_spine2Ik_org_%s' % (self.locus,self.count),mo=True)
        cmds.setAttr('%s.interpType' % oConst[0],2)
        cmds.setAttr('%s_spine2Ik_ctl_%s.rx' % (self.locus,self.count),l=True,k=False)
        cmds.setAttr('%s_spine2Ik_ctl_%s.ry' % (self.locus,self.count),l=True,k=False)
        cmds.setAttr('%s_spine2Ik_ctl_%s.rz' % (self.locus,self.count),l=True,k=False)
        cmds.setAttr('%s_spine2Ik_ctl_%s.stiff' % (self.locus,self.count),l=True,k=False)
        
        # replace ik controls with nurbs circles
        crv = cmds.circle(d=3,ch=False,nr=[0,1,0])
        shp = cmds.listRelatives('%s_spine4Ik_ctl_%s' % (self.locus,self.count),s=True)[0]
        cmds.delete(shp)
        cmds.parent(crv,'%s_spine4Ik_ctl_%s' % (self.locus,self.count),r=True)
        shp = cmds.listRelatives(crv,s=True)[0]
        cmds.parent(shp,'%s_spine4Ik_ctl_%s' % (self.locus,self.count),r=True,s=True)
        cmds.delete(crv)
        cmds.setAttr('%s.overrideEnabled' % shp,1)
        cmds.setAttr('%s.overrideColor' % shp,rigEnv.CONTROL_COLOR['C'])
        cmds.rename(shp,'%s_spine4Ik_ctl_%sShape' % (self.locus,self.count))
        
        crv = cmds.circle(d=3,ch=False,nr=[0,1,0])
        shp = cmds.listRelatives('%s_spine2Ik_ctl_%s' % (self.locus,self.count),s=True)[0]
        cmds.delete(shp)
        cmds.parent(crv,'%s_spine2Ik_ctl_%s' % (self.locus,self.count),r=True)
        shp = cmds.listRelatives(crv,s=True)[0]
        cmds.parent(shp,'%s_spine2Ik_ctl_%s' % (self.locus,self.count),r=True,s=True)
        cmds.delete(crv)
        cmds.setAttr('%s.overrideEnabled' % shp,1)
        cmds.setAttr('%s.overrideColor' % shp,rigEnv.CONTROL_COLOR['C'])
        cmds.rename(shp,'%s_spine2Ik_ctl_%sShape' % (self.locus,self.count))
        cmds.setAttr('%s_spine2Ik_ctl_%s.sx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_spine2Ik_ctl_%s.sy' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_spine2Ik_ctl_%s.sz' % (self.locus,self.count),l=False,k=True)
        cmds.connectAttr('%s_spine2Ik_ctl_%s.sx' % (self.locus,self.count),'%s_scaleBlendbackA_bcl_%s.color1B' % (self.locus,self.count))
        cmds.connectAttr('%s_spine2Ik_ctl_%s.sy' % (self.locus,self.count),'%s_scaleBlendbackA_bcl_%s.color1R' % (self.locus,self.count))
        cmds.connectAttr('%s_spine2Ik_ctl_%s.sz' % (self.locus,self.count),'%s_scaleBlendbackA_bcl_%s.color1G' % (self.locus,self.count))
        cmds.connectAttr('%s_spine2Ik_ctl_%s.sx' % (self.locus,self.count),'%s_scaleBlendbackB_bcl_%s.color1B' % (self.locus,self.count))
        cmds.connectAttr('%s_spine2Ik_ctl_%s.sy' % (self.locus,self.count),'%s_scaleBlendbackB_bcl_%s.color1R' % (self.locus,self.count))
        cmds.connectAttr('%s_spine2Ik_ctl_%s.sz' % (self.locus,self.count),'%s_scaleBlendbackB_bcl_%s.color1G' % (self.locus,self.count))
        
        crv = cmds.circle(d=3,ch=False,nr=[0,1,0])
        shp = cmds.listRelatives('%s_spine0Ik_ctl_%s' % (self.locus,self.count),s=True)[0]
        cmds.delete(shp)
        cmds.parent(crv,'%s_spine0Ik_ctl_%s' % (self.locus,self.count),r=True)
        shp = cmds.listRelatives(crv,s=True)[0]
        cmds.parent(shp,'%s_spine0Ik_ctl_%s' % (self.locus,self.count),r=True,s=True)
        cmds.delete(crv)
        cmds.setAttr('%s.overrideEnabled' % shp,1)
        cmds.setAttr('%s.overrideColor' % shp,rigEnv.CONTROL_COLOR['C'])
        cmds.rename(shp,'%s_spine0Ik_ctl_%sShape' % (self.locus,self.count))
        
        # add extra cogs
        c = 'C_center_ctl_0'
        a = cmds.duplicate(c,n='%s_centerA_ctl_%s' % (self.locus,self.count),rc=True)[0]
        b = cmds.duplicate(c,n='%s_centerB_ctl_%s' % (self.locus,self.count),rc=True)[0]
        c = cmds.rename(c,'%s_centerC_ctl_%s' % (self.locus,self.count))
        
        for x in cmds.listRelatives(a,c=True):
            if cmds.objectType(x,isType='nurbsCurve'): continue 
            cmds.delete(x)
        for x in cmds.listRelatives(b,c=True):
            if cmds.objectType(x,isType='nurbsCurve'): continue
            cmds.delete(x)
            
        cmds.scale(1.25,1.25,1.25,'%s.cv[0:7]' % b,r=True,ocp=True)
        cmds.scale(1.5,1.5,1.5,'%s.cv[0:7]' % a,r=True,ocp=True)
        cmds.parent(c,b)
        cmds.parent(b,a)
        a = cmds.listRelatives(a,s=True)[0]
        b = cmds.listRelatives(b,s=True)[0]
        c = cmds.listRelatives(c,s=True)[0]
        cmds.setAttr('%s.overrideEnabled' % a,1)
        cmds.setAttr('%s.overrideColor' % a,15)
        cmds.setAttr('%s.overrideEnabled' % b,1)
        cmds.setAttr('%s.overrideColor' % b,29)
        cmds.setAttr('%s.overrideEnabled' % c,1)
        cmds.setAttr('%s.overrideColor' % c,18)
        cmds.addAttr('%s_centerA_ctl_%s' % (self.locus,self.count),ln='secondaryCOGs',at='double',min=0,max=1,dv=0)
        cmds.setAttr('%s_centerA_ctl_%s.secondaryCOGs' % (self.locus,self.count),e=True,k=True)
        cmds.connectAttr('%s_centerA_ctl_%s.secondaryCOGs' % (self.locus,self.count),'%s.v' % b)
        cmds.connectAttr('%s_centerA_ctl_%s.secondaryCOGs' % (self.locus,self.count),'%s.v' % c)
        
        # fix hip swinger root orientation
        cmds.delete('%s_hipSwingerGrouproot_orc_%s' % (self.locus,self.count))
        cmds.parent('%s_hipSwingerroot_org_%s' % (self.locus,self.count),'%s_rootFk_ctj_%s' % (self.locus,self.count),r=True)
        cmds.setAttr('%s_hipSwingerroot_org_%s.translate' % (self.locus,self.count),0,0,0)
        cmds.setAttr('%s_hipSwingerroot_org_%s.rotate' % (self.locus,self.count),0,0,0)
        org = cmds.duplicate('%s_hipSwingerroot_org_%s' % (self.locus,self.count),n='%s_hipSwingerrootDriven_org_%s' % (self.locus,self.count),po=True)[0]
        off = cmds.duplicate('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),n='%s_hipSwingerrootDriven_off_%s' % (self.locus,self.count),po=True)[0]
        drv = cmds.duplicate('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),n='%s_hipSwingerrootDriven_drv_%s' % (self.locus,self.count),po=True)[0]
        posA = cmds.xform('%s_backA_bnd_%s' % (self.locus,self.count),q=True,ws=True,t=True)
        posB = cmds.xform('%s_root_bnd_%s' % (self.locus,self.count),q=True,ws=True,t=True)
        cmds.select(cl=True)
        cmds.joint(n='%s_hipSwingA_jnt_%s' % (self.locus,self.count),p=[posA[0],posA[1],posA[2]])
        cmds.joint(n='%s_hipSwingB_jnt_%s' % (self.locus,self.count),p=[posB[0],posB[1],posB[2]])
        hdl = cmds.ikHandle(sj='%s_hipSwingA_jnt_%s' % (self.locus,self.count),ee='%s_hipSwingB_jnt_%s' % (self.locus,self.count))[0]
        cmds.move(posA[0],posA[1],posA[2],'%s_hipSwingerrootDriven_org_%s' % (self.locus,self.count),ws=True)
        cmds.parent(off,org)
        cmds.parent(drv,off)
        cmds.parent(hdl,drv)
        cmds.parent('%s_hipSwingA_jnt_%s' % (self.locus,self.count),'%s_rootFk_ctj_%s' % (self.locus,self.count))
        cmds.connectAttr('%s_hipSwingerroot_ctl_%s.translate' % (self.locus,self.count),'%s.translate' % drv)
        cmds.connectAttr('%s_hipSwingerroot_ctl_%s.rotate' % (self.locus,self.count),'%s.rotate' % org)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.tx' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.ty' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.tz' % (self.locus,self.count),l=False,k=True)
        cmds.setAttr('%s.v' % hdl,0)
        cmds.setAttr('%s_hipSwingA_jnt_%s.v' % (self.locus,self.count),0)
        cmds.orientConstraint('%s_hipSwingA_jnt_%s' % (self.locus,self.count),'%s_hipSwingerGrouproot_org_%s' % (self.locus,self.count),mo=True)
        
        # reconnect spine attrs to centerA attrs
        attrs = cmds.listAttr('%s_spineFkIk_ctl_%s' % (self.locus,self.count),cb=True) + cmds.listAttr('%s_spineFkIk_ctl_%s' % (self.locus,self.count),k=True)
        for attr in attrs:
            newattr = 'spine%s' % attr
            for plug in cmds.listConnections('%s_spineFkIk_ctl_%s.%s' % (self.locus,self.count,attr),s=False,d=True,p=True):
                cmds.connectAttr('C_centerA_ctl_0.%s' % newattr,plug,f=True)
                
        cmds.delete('%s_spineFkIk_org_%s' % (self.locus,self.count))
        
        # reorient the spine, head and neck controls
        backA   = cmds.circle(ch=False)[0]
        backB   = cmds.circle(ch=False)[0]
        chest   = cmds.circle(ch=False)[0]
        neck    = cmds.circle(ch=False)[0]
        new     = [neck,chest,backA,backB]
        old     = ['%s_neckFk_ctl_%s' % (self.locus,self.count),'%s_chestFk_ctl_%s' % (self.locus,self.count),'%s_backAFk_ctl_%s' % (self.locus,self.count),'%s_backBFk_ctl_%s' % (self.locus,self.count)]
        
        # spine
        i = 0
        while True:
            if i == len(new): break
            
            ctlOriWorld = new[i]
            ctlOriginal = old[i]
            cthOriginal = cmds.listRelatives(ctlOriginal,p=True)[0]
            ctgOriginal = cmds.listRelatives(cthOriginal,p=True)[0]
            
            cmds.parent(ctlOriginal,w=True)
            cmds.setAttr('%s.rotate' % cthOriginal,0,-90,-90)
            cmds.parent(ctlOriWorld,cthOriginal,r=True)
            cmds.parent(ctlOriginal,ctlOriWorld)
            
            shpA = cmds.listRelatives(ctlOriWorld,s=True)[0]
            cmds.setAttr('%s.overrideEnabled' % shpA,1)
            shpB = cmds.listRelatives(ctlOriginal,s=True)[0]
            plg = cmds.listConnections('%s.v' % shpB,s=True,d=False,p=True)
            if plg:
                cmds.disconnectAttr(plg[0],'%s.v' % shpB)
                cmds.connectAttr(plg[0],'%s.v' % shpA)
            cmds.setAttr('%s.v' % shpB,0)
            cmds.setAttr('%s.v' % ctlOriWorld,l=True,k=False)
            cmds.connectAttr('%s.sx' % ctlOriWorld, '%s.sz' % ctlOriginal)
            cmds.connectAttr('%s.sy' % ctlOriWorld, '%s.sx' % ctlOriginal)
            cmds.connectAttr('%s.sz' % ctlOriWorld, '%s.sy' % ctlOriginal)
            cmds.rename(ctlOriginal,string.replace(ctlOriginal,'_ctl_','_dmy_'))
            cmds.rename(shpA,'%sShape' % ctlOriginal)
            cmds.rename(ctlOriWorld,ctlOriginal)
            i = i + 1
        
        # hip
        hipCrv = cmds.circle(ch=False)[0]
        
        grp = cmds.group(em=True)
        cmds.parent(hipCrv,grp)
        pos = cmds.xform('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),q=True,ws=True,t=True)
        cmds.move(pos[0],pos[1],pos[2],grp,ws=True)
        cmds.rename('%s_hipSwingerroot_org_%s' % (self.locus,self.count),'%s_hipSwingerroot_dmo_%s' % (self.locus,self.count))
        cmds.rename('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),'%s_hipSwingerroot_dmy_%s' % (self.locus,self.count))
        cmds.parent(grp,'%s_rootFk_ctj_%s' % (self.locus,self.count))
        cmds.rename(grp,'%s_hipSwingerroot_org_%s' % (self.locus,self.count))
        cmds.rename(hipCrv,'%s_hipSwingerroot_ctl_%s' % (self.locus,self.count))
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.v' % (self.locus,self.count),l=True,k=False)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.sx' % (self.locus,self.count),l=True,k=False)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.sy' % (self.locus,self.count),l=True,k=False)
        cmds.setAttr('%s_hipSwingerroot_ctl_%s.sz' % (self.locus,self.count),l=True,k=False)
        cmds.parentConstraint('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),'%s_hipSwingerroot_dmy_%s' % (self.locus,self.count),mo=True)
        shp = cmds.listRelatives('%s_hipSwingerroot_ctl_%s' % (self.locus,self.count),s=True)[0]
        cmds.setAttr('%s.overrideEnabled' % shp,1)
        cmds.rename(shp,'%s_hipSwingerroot_ctl_%sShape' % (self.locus,self.count))
        shp = cmds.listRelatives('%s_hipSwingerroot_dmy_%s' % (self.locus,self.count),s=True)[0]
        cmds.setAttr('%s.v' % shp,0)
        
        # turn off transform inheritance of IK group
        cmds.setAttr('%s_%sIK_org_%s.inheritsTransform' % (self.locus,self.namespace,self.count),0)
        
        # lock attributes
        for attr in ['sx','sy','sz']:
            cmds.setAttr('%s_backAFk_ctl_%s.%s' % (self.locus,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_backBFk_ctl_%s.%s' % (self.locus,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_chestFk_ctl_%s.%s' % (self.locus,self.count,attr),l=True,k=False)
            cmds.setAttr('%s_neckFk_ctl_%s.%s' % (self.locus,self.count,attr),l=True,k=False)