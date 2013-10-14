import re

import maya.cmds
import pymel.core

from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.faceIO as faceIO
import rigBuilder.face.utils.dag as dagUtils
import rigBuilder.face.utils.name as nameUtils


BLENDSHAPE_NODE_SUFFIX = 'bsp'
BLENDSHAPE_TARGET_SUFFIX = 'shp'

def connectBlendShapeTargets(mesh, shapes, blendShape=None, autoInBetween=False, verbose=True):

    # If there's an existing blendShape node:
    if not blendShape:

        blendShape = pymel.core.animation.blendShape(shapes, mesh,
            frontOfChain=True, topologyCheck=False,
            name=nameUtils.subNodeType(str(mesh).split(':')[-1],
            BLENDSHAPE_NODE_SUFFIX))[0]

    # Otherwise a new setup.
    else:
        if not pymel.core.objExists(blendShape):
            return None

        blendShape = pymel.core.PyNode(blendShape)

        for shape in shapes:
            wil = blendShape.weightIndexList()
            nextIndex = 0
            if wil:
                nextIndex = int(wil[-1]) + 1

            pymel.core.animation.blendShape(blendShape, edit=True,
                target=[mesh, nextIndex, shape, 1.0])

    if autoInBetween:
        for shape in shapes:
            # See if it has the in-between naming convention.
            description = nameUtils.getDescription(str(shape))
            a = re.match('^(.*)([0-9]{3})$', description)
            if not a:
                continue

            # If it is an in-between then we need to make sure there is a main
            # shape to drive it.
            mainShape = nameUtils.subDescription(shape, a.groups()[0])
            if not ((mainShape in shapes) or (pymel.core.PyNode(mainShape) in shapes)):
                continue

            # Go ahead and hook up the auto driving.            
            src = blendShape.attr(mainShape.split(':')[-1])
            dst = blendShape.attr(shape.split(':')[-1])
            
            pymel.core.animation.setDrivenKeyframe(dst, cd=src, dv=0.0, v=0.0)
            
            pymel.core.animation.setDrivenKeyframe(dst, cd=src,
                dv=int(a.groups()[-1]) / 100.0, v=1.0)
            
            pymel.core.animation.setDrivenKeyframe(dst, cd=src, dv=1.0, v=0.0)
            
    return blendShape


def createStandardShapeLayout(annotate=False):

    MAX_LAYOUT_HEIGHT = 6

    createdShapes = dict()

    # Check for the model root in the scene.
    if not maya.cmds.objExists(FACE_MODEL_COMPONENT_BASE_ROOT):
        raise ValueError('KNOB!')

    # Gather a list of the base meshes.
    temp = maya.cmds.listRelatives(FACE_MODEL_COMPONENT_BASE_ROOT,
        ad=True, type='mesh') or list()
    baseMeshes = [maya.cmds.listRelatives(t, p=True)[0] for t in temp]
    if not baseMeshes:
        return createdShapes

    # Get the bounding box of the combined base meshes.
    boundingBox = pymel.core.general.exactWorldBoundingBox(baseMeshes)
    bbWidth = boundingBox[3] - boundingBox[0]
    bbHeight = boundingBox[4] - boundingBox[1]

    xBuffer = bbWidth * 0.2
    yBuffer = bbHeight * 0.2

    # Load the layout JSON.
    shapeList = sorted(faceIO.importJSON(filePath=BLEND_SHAPE_LAYOUT_JSON))

    # Create a shape root transform.
    shapeRoot = FACE_MODEL_COMPONENT_SHAPE_ROOT
    if not maya.cmds.objExists(shapeRoot):
        pymel.core.createNode('transform', n=shapeRoot)

    columnCount = 0
    rowCount = 0

    for shapeName in shapeList:

        if rowCount == MAX_LAYOUT_HEIGHT:
            columnCount += 1
            rowCount = 0

        # Create the layout headers (if they don't already exist).
        for i, mesh in enumerate(baseMeshes):

            # Get the meshes initial position.
            initPos = maya.cmds.xform(mesh, q=True, t=True, ws=True)

            # Look for shape parents. Create if they don't already exist.
            shapeParent = nameUtils.subNodeType(mesh, 'grp')
            shapeParents = maya.cmds.listRelatives(shapeRoot, c=True) or list()
            if not shapeParent in shapeParents:
                maya.cmds.createNode('transform', n=shapeParent, p=shapeRoot)

            # Create the shape, parent it and rename it.
            newShape = maya.cmds.duplicate(mesh, rr=True)[0]
            maya.cmds.parent(newShape, '|%s|%s' % (shapeRoot, shapeParent))
            newShape = maya.cmds.rename(newShape, shapeName)

            # Move it.
            xValue = bbWidth * columnCount
            yValue = (bbHeight * (rowCount + 1)) + yBuffer

            if rowCount:
                yValue += yBuffer * rowCount
            if columnCount:
                xValue += xBuffer * columnCount

            tValue = [xValue + initPos[0], yValue + initPos[1], 0.0 + initPos[2]]

            maya.cmds.xform(newShape, t=tValue)

            if i == 0 and annotate:
                #===============================================================
                # Annotation
                #===============================================================

                tValue = [tValue[0], tValue[1] + boundingBox[1], tValue[2]]

                # Create the annotation.
                ann = dagUtils.TransformAndShapes(maya.cmds.annotate(
                    newShape, p=tValue, tx=shapeName)).transform.name()

                # Rename and parent.
                ann = maya.cmds.rename(ann, nameUtils.subNodeType(shapeName, 'ann'))
                annShape = maya.cmds.listRelatives(ann, s=True)[0]
                annShape = maya.cmds.rename(annShape, '%sShape' % ann)
                maya.cmds.parent(ann, newShape)

                # Set the display overrides.
                maya.cmds.setAttr('%s.displayArrow' % annShape, False)
                maya.cmds.setAttr('%s.overrideEnabled' % annShape, True)
                maya.cmds.setAttr('%s.overrideDisplayType' % annShape, 2)

        # Add to the row count.
        rowCount += 1

    return True


def getRelatedBlendShapeForSelection():
    sel = maya.cmds.ls(sl=True)
    if not sel:
        return

    blendShapeNodeList = list()
    for obj in sel:
        if maya.cmds.objectType(obj) == "blendShape":
            if obj not in blendShapeNodeList:
                blendShapeNodeList.append(obj)

        else:
            history = maya.cmds.listHistory(obj)
            if history:
                for h in history:
                    if maya.cmds.objectType(h) == "blendShape":
                        if h not in blendShapeNodeList:
                            blendShapeNodeList.append(h)

    return blendShapeNodeList
