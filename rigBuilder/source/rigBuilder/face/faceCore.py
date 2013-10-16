'''
Created on 11/09/2013

@author: caleb.bell

faceCore.py is where everything comes together to build a face rig. The model,
skeleton guide, GUI guide, blend shapes, and driven key, preference and
weighting data come together and a rig is built and published if necessary.

'''

import maya.cmds
import pymel.core

from rigBuilder import rigUtils
import rigBuilder.body.bodyIO as bodyIO
from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.faceIO as faceIO
import rigBuilder.face.facePublish as facePublish
import rigBuilder.face.utils.blendShape as blendShapeUtils
import rigBuilder.face.utils.builder as builderUtils
import rigBuilder.face.utils.control as controlUtils
import rigBuilder.face.utils.name as nameUtils
from rigBuilder.face.modules import *
from rigBuilder.face.modules import eye, mouth, tongue


def faceRigBuilder(character, modelPath, skeletonGuidePath, guiGuidePath=None,
        blendShapesPath=None, drivenKeysPath=None, preferencesPath=None,
        weightingPath=None, publish=False, description=str()):

    BUILD_LAYERS = [
        ('skeleton', skeletonGuidePath),
        (FACE_MODEL_COMPONENT_BASE_NS, modelPath),
        (FACE_MODEL_COMPONENT_SHAPE_NS, blendShapesPath),
        ('gui', guiGuidePath),
        ('drivenKeys', drivenKeysPath),
        ('preferences', preferencesPath),
        ('weighting', weightingPath)
        ]

    # New Scene.
    maya.cmds.file(new=True, force=True)

    # Create the rig component hierarchy.
    rig = RigComponent()
    rig.buildRigHierarchy()

    #===========================================================================
    # Skeleton Guide / Model / Blend Shapes / GUI Guide.
    #===========================================================================

    for layer, filePath in BUILD_LAYERS[:4]:

        filePath = fileUtils.confirmFilePath(filePath)
        if not filePath:
            continue

        if layer is 'skeleton':
            rig.referenceRigComponentGuide(filePath=filePath)
            rig.buildRigComponentSkeleton()

            # Setup the transform.
            rig.transformNode.setTransformation(pymel.core.PyNode('C_head_jnt_0').getMatrix(worldSpace=True))

        elif layer in [FACE_MODEL_COMPONENT_BASE_NS, FACE_MODEL_COMPONENT_SHAPE_NS]:

            # Setup model.
            if layer == FACE_MODEL_COMPONENT_BASE_NS:
                # Import the model.
                rig.importModelComponent(filePath=filePath, namespace=layer)
                modelRoot = '%s:%s' % (layer, FACE_MODEL_COMPONENT_BASE_ROOT)

                # Constrain the model top group.
                pymel.core.parentConstraint(rig.transformNode, modelRoot, mo=True)

            # Setup blendShapes.
            elif layer == FACE_MODEL_COMPONENT_SHAPE_NS:
                
#                 import pprint
#                 
#                 # Import the shapes.
#                 rig.importModelComponent(filePath=filePath, namespace=None)
# 
#                 # Do the magic.
#                 shapeRoot = FACE_MODEL_COMPONENT_SHAPE_ROOT
# 
#                 if not maya.cmds.objExists(shapeRoot):
#                     continue
# 
#                 for child in maya.cmds.listRelatives(shapeRoot, c=True) or list():
# 
#                     target = '%s:%s' % (FACE_MODEL_COMPONENT_BASE_NS,
#                         nameUtils.subNodeType(child.rsplit(':')[-1], 'geo'))
# 
#                     if not maya.cmds.objExists(target):
#                         continue
# 
#                     shapes = maya.cmds.listRelatives(child, ad=True, f=True,
#                         ni=True, typ='mesh')
# 
#                     print 'shapes'
#                     pprint.pprint(shapes)
# 
#                     if not shapes:
#                         continue
# 
#                     transforms = list()
#                     for shape in shapes:
#                         transforms.extend(maya.cmds.listRelatives(shape, p=True,
#                             f=True) or list())
# 
#                     print 'transforms'
#                     pprint.pprint(transforms)
# 
#                     blendShapeUtils.connectBlendShapeTargets(target, transforms,
#                         autoInBetween=True)

                blendShapeUtils.connectAllBlendShapeTargets(autoInBetween=True)


        # Face Control GUI Layer.
        elif layer == 'gui':
            fileUtils.importUnderGroup(
                filePath=filePath, group='controls_grp', namespace=None
                )

            controlUtils.finalizeFaceControlGUI()

        else:
            continue


    #=======================================================================
    # Modules.
    #=======================================================================

    # Eye.
    for position in ['L', 'R']:
        a = eye.EyeModule(position)
        a.buildModule()

    # Mouth.
    b = mouth.MouthModule()
    b.buildModule()
    
    # Tongue.
    c = tongue.TongueModule()
    c.buildModule()
    pymel.core.animation.parentConstraint(rig.transformNode, c.driven[0],
        mo=True, n=nameUtils.subNodeType(c.driven[0], 'pac'))

    # Connect modules to preference node.
    builderUtils.connectRigModulesToComponent()


    #===========================================================================
    # Driven Keys / Attributes / Weighting.
    #===========================================================================

    for layer, filePath in BUILD_LAYERS[4:]:

        filePath = fileUtils.confirmFilePath(filePath)

        if layer is 'drivenKeys':
            if filePath:
                rigUtils.log(msg='Loading Face Rig Driven Keys...')
                faceIO.importSceneDrivenKeysData(drivenKeysPath, verbose=True)
            else:
                rigUtils.log(msg='Skipping Face Rig Driven Keys...', type='warning')

        elif layer is 'preferences':
            if filePath:
                rigUtils.log(msg='Loading Face Rig Preferences...')
                faceIO.importAttributeData(FACE_PREFERENCE_GRP, filePath, verbose=True)
            else:
                rigUtils.log(msg='Slipping Face Rig Preferences...', type='warning')

        elif layer is 'weighting' and filePath:
            if filePath:
                rigUtils.log(msg='Loading Face Rig Weighting...')
                bodyIO.importSkinBySkin(filePath, after=True)
            else:
                rigUtils.log(msg='Skipping Face Rig Weighting...', type='warning')

        else:
            continue


    #===========================================================================
    # Visibility Switches.
    #===========================================================================

    builderUtils.SetupVisibilitySwitches.guideSwitches()
    builderUtils.SetupVisibilitySwitches.skeletonSwitches()
    builderUtils.SetupVisibilitySwitches.modelSwitches()
    builderUtils.SetupVisibilitySwitches.shapeSwitches()


    #===========================================================================
    # Finish Up
    #===========================================================================

    # Position the face controls.
    if pymel.core.general.objExists('C_faceGUI_ctg_0'):

        faceCtlGrp = pymel.core.PyNode('C_faceGUI_ctg_0')
        modelBB = pymel.core.general.exactWorldBoundingBox(
            pymel.core.ls('model:*', ni=True, typ='mesh'))

        faceCtlPos = [
            (modelBB[3] + faceCtlGrp.getBoundingBox().max()[0]) * 1.1,
             modelBB[1] + ((modelBB[4] - modelBB[1]) / 2.0),
            0.0
            ]

        faceCtlGrp.translate.set(faceCtlPos)
        pymel.core.animation.parentConstraint([rig.transformNode], faceCtlGrp, mo=True)

    # Fit the view
    pymel.core.rendering.viewFit(all=True, f=0.5)


    #===========================================================================
    # Publish if applicable.
    #===========================================================================

    if not publish:
        return True

    # Remove the guide.
    rig.removeRigComponentGuideReference()

    # Delete the shapes.
    pymel.core.delete(pymel.core.ls('%s:*' % FACE_MODEL_COMPONENT_SHAPE_NS))

    # Publish.
    return facePublish.publishFaceRigFromScene(character, description)

