import os
import string

import maya.cmds
import maya.mel

import rigBuilder.face.utils.file as fileUtils
from rigBuilder.combination import combinationPublish


def rigCombinationBuilder(character, bodyRigPath, faceRigPath=None,
        publish=False, description=str()):

    # Open the body rig.
    assert os.path.exists, "Body Rig Path '%s' does not exist..."
    maya.cmds.file(bodyRigPath, o=True, f=True)

    # Rename the file.
    tempPath = fileUtils.getTempFilePath([character, 'combined', 'rig', 'anim'], 'ma')
    maya.cmds.file(rename=tempPath)

    # Fix the view.
    maya.cmds.viewSet(home=True)

    # Face rig hook-up.
    if faceRigPath and os.path.exists(faceRigPath):

        switchCtl = 'C_mainA_ctl_0'

        maya.cmds.setAttr('%s.v' % switchCtl, l=False, k=True)
        maya.cmds.setAttr('%s.v' % switchCtl, 1)
        maya.cmds.setAttr('%s.v' % switchCtl, l=True, k=False)

        # add face attrs to head fkik control
        maya.cmds.addAttr('%s' % switchCtl, ln='face', nn=' ', at='enum', en='Face')
        maya.cmds.setAttr('%s.face' % switchCtl, cb=True)
        maya.cmds.addAttr('%s' % switchCtl, ln='faceControls', at='double', min=0, max=1, dv=1)
        maya.cmds.setAttr('%s.faceControls' % switchCtl, cb=True, k=False)
        maya.cmds.addAttr('%s' % switchCtl, ln='advFaceControls', at='double', min=0, max=1, dv=1)
        maya.cmds.setAttr('%s.advFaceControls' % switchCtl, cb=True, k=False)
        maya.cmds.addAttr('%s' % switchCtl, ln='tongueControls', at='double', min=0, max=1, dv=1)
        maya.cmds.setAttr('%s.tongueControls' % switchCtl, cb=True, k=False)
        maya.cmds.addAttr('%s' % switchCtl, ln='followHead', at='double', min=0, max=1, dv=0)
        maya.cmds.setAttr('%s.followHead' % switchCtl, cb=True)

        # reference into scene
        maya.cmds.file(faceRigPath, r=True, typ='mayaAscii', ns='FACE', f=True)

        # organize hierarchy
        grp = maya.cmds.group(n='C_face_org_0', em=True)
        maya.cmds.parent(grp, 'modules_grp')
        maya.cmds.parent('FACE:rig_face_anim', grp)
        maya.cmds.parentConstraint('C_head_bnd_0', 'FACE:transform_grp', mo=True)

        # get all geometry in model
        maya.cmds.namespace(set='GEO')
        dagnodes = maya.cmds.namespaceInfo(lod=True)
        maya.cmds.namespace(set=':')

        for geo in dagnodes:

            if not maya.cmds.objExists(geo): continue # groupId node disappears
            if not maya.cmds.objectType(geo, isType='transform'): continue
#             if 'antenna' in geo: continue

            # add facial geometry as blendshapes to model geometry
            shp = maya.cmds.listRelatives(geo, s=True)
            if not shp: continue

            blendGeo = 'FACE:model:%s' % string.split(geo, ':')[-1]

            if geo == 'GEO:C_body_geo_0':
                blendGeo = 'FACE:model:C_face_geo_0'

            # doesn't exist, move on
            if not maya.cmds.objExists(blendGeo): continue
            # doesn't have any deformers driving it, move on
            if not maya.mel.eval('findRelatedDeformer "%s"' % blendGeo): continue

            maya.cmds.setAttr('%s.v' % blendGeo, 0)

            # ensure geo is visible
            geosrc = maya.cmds.listConnections('%s.v' % geo, s=True, d=False, p=True)
            if geosrc:
                maya.cmds.disconnectAttr(geosrc[0], '%s.v' % geo)
                maya.cmds.setAttr('%s.v' % geo, 1)

            shpdict = {}
            for shp in maya.cmds.listRelatives(geo, s=True):
                shpsrc = maya.cmds.listConnections('%s.v' % shp, s=True, d=False, p=True)
                if shpsrc:
                    shpdict[shp] = shpsrc[0]
                    maya.cmds.disconnectAttr(shpsrc[0], '%s.v' % shp)
                    maya.cmds.setAttr('%s.v' % shp, 1)
            # check to see if there's an existing blendshape, and use it instead
            existingBlend = None
            deformers = maya.mel.eval('findRelatedDeformer %s' % geo)
            for deformer in deformers:
                if maya.cmds.objectType(deformer, i='blendShape'):
                    existingBlend = deformer
                    break
            if existingBlend:
                maya.cmds.blendShape(existingBlend, edit=True, t=[geo, 1, blend, 1])
                blend = existingBlend
            else:
                blend = maya.cmds.blendShape(blendGeo, geo, foc=True, tc=False)[0]

            # reconnect
            if geosrc: maya.cmds.connectAttr(geosrc[0], '%s.v' % geo)
            for shp in shpdict:
                shpsrc = shpdict[shp]
                maya.cmds.connectAttr(shpsrc, '%s.v' % shp)

            maya.cmds.setAttr('%s.%s' % (blend, string.split(blendGeo, ':')[-1]), 1)

        # connect control vis toggles
        for tongue in maya.cmds.ls('FACE:*tongue*'):
            if maya.cmds.objectType(tongue, isType='nurbsCurve'):
                maya.cmds.connectAttr('%s.tongueControls' % switchCtl, '%s.v' % tongue)

        maya.cmds.connectAttr('%s.faceControls' % switchCtl, 'FACE:C_faceGUI_cth_0.v')

        # connect eyeballs
        for locus in ['left', 'right']:
            src = '%s_eye_bnd_0.rotate' % locus[0].upper()
            dst = 'FACE:interface_grp.%sEyeBodyRig' % locus
            if not maya.cmds.objExists(src) or maya.cmds.objExtsts(dst):
                continue

            maya.cmds.connectAttr(src, dst, f=True)


        # hide face geometry
        maya.cmds.setAttr('FACE:visibility_grp.modelDisplayMeshes', 0)

#         maya.cmds.file(faceRigPath, ur='FACERN')
#         maya.cmds.parent('FACERNfosterParent1', 'C_face_org_0')


    maya.cmds.viewFit(all=True)
    maya.cmds.file(save=True, type='mayaAscii')
    if publish:
        combinationPublish.publishCombinedRig(character, tempPath)
    return True


