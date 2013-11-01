import re
import sys

import maya.cmds
import pymel.core

from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.faceIO as faceIO
import rigBuilder.face.utils as faceUtils
import rigBuilder.face.utils.dag as dagUtils
import rigBuilder.face.utils.name as nameUtils


BLENDSHAPE_NODE_SUFFIX = 'bsp'
BLENDSHAPE_TARGET_SUFFIX = 'shp'


def connectAllBlendShapeTargets(modelNamespace, shapeGroup,
    useExistingBlendShapeNodes=True, autoInBetween=False, verbose=True):
    ''' '''

    assert maya.cmds.objExists(shapeGroup), "Cannot find shape group '%s'..." % str(shapeGroup)

    result = list()

    # Collate the shapes to connect.
    shapes = list()
    for child in maya.cmds.listRelatives(shapeGroup, c=True) or list():

        ''' From the hierarchy of the shape group, figure out what the target
        mesh name is; ie. If there is a group named C_face_grp_0 parented to
        the shape group, then the child meshes would be connected to
        'C_face_geo_0' in the model namespace. '''

        if not nameUtils.checkValidNameString(child):
            continue

        target = '%s:%s' % (modelNamespace, nameUtils.subNodeType(
            child.rsplit(':')[-1], 'geo'))

        if not maya.cmds.objExists(target):
            continue

        ''' Get a list of shapes to connect. To be safe we use full paths, and
        we look for meshes and then get the parent of each mesh. '''

        shapes = maya.cmds.listRelatives(child, ad=True, f=True,
            ni=True, typ='mesh')

        if not shapes:
            continue

        transforms = list()
        for shape in shapes:
            transforms.extend(maya.cmds.listRelatives(shape, p=True,
                f=True) or list())

        exisitingBlendShapeNode = None
        if useExistingBlendShapeNodes:
            temp = getRelatedBlendShapeForNode(target)
            if temp:
                exisitingBlendShapeNode = temp[0]

        # Connect Shapes.
        result.append(connectBlendShapeTargets(target, transforms,
            blendShape=exisitingBlendShapeNode, autoInBetween=autoInBetween))

    return result


def connectBlendShapeTargets(mesh, shapes, blendShape=None, autoInBetween=False,
        verbose=True):
    ''' '''
    assert maya.cmds.objExists(mesh), 'Mesh object %s does not exist...' % str(mesh)

    # If there's an existing blendShape node:
    if not blendShape:

        blendShape = pymel.core.animation.blendShape(shapes, mesh,
            frontOfChain=True, topologyCheck=False,
            name=nameUtils.subNodeType(str(mesh).split(':')[-1],
            BLENDSHAPE_NODE_SUFFIX))[0]

    # Otherwise a new setup.
    else:
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
            path, shapeShortName = str(shape).rsplit('|', 1)
            description = nameUtils.getDescription(shapeShortName)
            print '*' * 5, description, type(description), '*' * 5
            a = re.match('^(.*)([0-9]{3})$', description)
            if not a:
                continue

            # If it is an in-between then we need to make sure there is a main
            # shape to drive it.
            driverShortName = nameUtils.subDescription(shapeShortName, a.groups()[0])
            driverShape = '%s|%s' % (path, driverShortName)
            if not ((driverShape in shapes) or (pymel.core.PyNode(driverShape) in shapes)):
                continue

            # Go ahead and hook up the auto driving.
            src = blendShape.attr(driverShortName.split(':')[-1])
            dst = blendShape.attr(shapeShortName.split(':')[-1])

            pymel.core.animation.setDrivenKeyframe(dst, cd=src, dv=0.0, v=0.0)

            pymel.core.animation.setDrivenKeyframe(dst, cd=src,
                dv=int(a.groups()[-1]) / 100.0, v=1.0)

            pymel.core.animation.setDrivenKeyframe(dst, cd=src, dv=1.0, v=0.0)

    return blendShape


@faceUtils.restoreSelectionDecorator
def createStandardShapeLayout(annotate=False):

    MAX_LAYOUT_HEIGHT = 6

    createdShapes = dict()

    # Check for the model root in the scene.
    assert maya.cmds.objExists(FACE_MODEL_COMPONENT_BASE_ROOT), ('You need the '
        'face model in the scene to create the standard shape layout...')

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
            newShape = '|%s|%s|%s' % (shapeRoot, shapeParent, shapeName)
            if not maya.cmds.objExists(newShape):
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


@faceUtils.restoreSelectionDecorator
def createTaperShapes(blendShape, envelope=False):
    blendShape = pymel.core.PyNode(blendShape)

    # Get the outputMesh.
    outputMesh = None
    for mesh in faceUtils.listHistoryByType(node=blendShape.outputGeometry[0],
            nodeType='mesh', future=True):
        if mesh.intermediateObject.get():
            continue
        outputMesh = dagUtils.TransformAndShapes(mesh)

    assert outputMesh, 'No output mesh...'

    # Get the indices that are actually switched on.
    indices = getActiveTargets(blendShape)
    assert indices, 'No indices...'

    # Now switch all targets off.
    for index in blendShape.weightIndexList():
        blendShape.setWeight(index, 0.0)

    # Now lets do it!
    for index in indices:
        name = blendShape.getTarget()[index]
        blendShape.setWeight(index, 1.0)
        for i, v in enumerate(['A', 'B']):
            if i:
                invertBlendShapeWeights(blendShape, envelope=envelope)
            outputMesh.transform.duplicate(name='%s_taperShape%s' % (name, v))
            if i:
                invertBlendShapeWeights(blendShape, envelope=envelope)
        blendShape.setWeight(index, 0.0)

    return True


def createTaperShapesFromSelection(envelope=False):
    return [createTaperShapes(blendShape, envelope) for blendShape in getRelatedBlendShapeForSelection()]


def getActiveTargets(blendShape):
    blendShape = pymel.core.PyNode(blendShape)

    indices = list()

    for index in blendShape.weightIndexList():
        if blendShape.getWeight(index) != 1.0:
            continue
        indices.append(index)

    return indices


def getOutputMesh(blendShape):
    ''' Returns the mesh object connected to the output of a blendShape node. '''
    return blendShape.outputGeometry[0].outputs(type='mesh')


def getRelatedBlendShapeForNode(node):

    assert maya.cmds.objExists(str(node)), 'Node %s does not exist...' % node

    blendShapeNodeList = list()

    if maya.cmds.objectType(node, isType='blendShape'):
        if node not in blendShapeNodeList:
            blendShapeNodeList.append(node)

    else:
        for h in (maya.cmds.listHistory(node) or list()):
            if not maya.cmds.objectType(h, isType='blendShape'):
                continue

            if h in blendShapeNodeList:
                continue

            blendShapeNodeList.append(h)

    return blendShapeNodeList


def getRelatedBlendShapeForSelection():

    blendShapeNodeList = list()

    for obj in maya.cmds.ls(sl=True):
        blendShapeNodeList.extend(getRelatedBlendShapeForNode(obj))

    return blendShapeNodeList


def getWeightAliasList(blendShape):
    return [blendShape.weight[i].getAlias() for i in blendShape.weightIndexList()]

@faceUtils.functionDebugDecorator
def invertBlendShapeWeights(blendShape, envelope=False):
    blendShape = pymel.core.PyNode(blendShape)

    # Get the number of verts in the input mesh.
    vertCount = int()
    for mesh in faceUtils.listHistoryByType(blendShape.input[0].inputGeometry, 'mesh'):
        if mesh.intermediateObject.get():
            continue
        vertCount = mesh.numVertices()

    if not vertCount:
        return False

    if envelope:
        # Invert the weights on the envelope.
        envelopeWeights = list()

        for i in range(vertCount):
            envelopeWeights.append(faceUtils.clampValue(blendShape.inputTarget[0].baseWeights[i].get()))
            blendShape.inputTarget[0].baseWeights[i].set(abs(1 - envelopeWeights[i]))

    else:
        # Get the indices that are actually switched on.
        indices = getActiveTargets(blendShape)
        if not indices:
            return False

        # Invert the weights on active targets.
        for index in indices:
            targetWeights = list()

            for i in range(vertCount):
                targetWeights.append(faceUtils.clampValue(blendShape.inputTarget[0].inputTargetGroup[index].targetWeights[i].get()))
                blendShape.inputTarget[0].inputTargetGroup[index].targetWeights[i].set(abs(1 - targetWeights[i]))

    return True


def invertBlendShapeWeightsOnSelection(envelope=False):
    print 'Hello World!', envelope
    return [invertBlendShapeWeights(blendShape, envelope) for blendShape in getRelatedBlendShapeForSelection()]


def resetTargetWeights(blendShape):
    return [blendShape.weight[i].set(0.0) for i in blendShape.weightIndexList()]


def splitTargetsXYZ(blendShape):
    blendShape = pymel.core.PyNode(blendShape)

    indices = list()

    for index in blendShape.weightIndexList():
        if blendShape.getWeight(index) != 1.0:
            continue
        indices.append(index)

    assert indices, ('You must set blendShape target weights to 1.0 to split '
        'into component axes...')

    resetTargetWeights(blendShape)
    geo = dagUtils.TransformAndShapes(blendShape.getGeometry()[0])

    for index in indices:
        for i, axis in enumerate(['X', 'Y', 'Z']):

            # Get the original point locations.
            newMesh = dagUtils.TransformAndShapes(geo.transform.duplicate(n='%s_%s' % (axis, getWeightAliasList(blendShape)[index]))[0])
            newMeshPoints = newMesh.shapes[0].getPoints(space='object')

            # Get the target point locations.
            targetMesh = blendShape.inputTarget[0].inputTargetGroup[index].inputTargetItem[6000].inputGeomTarget.inputs()
            targetPoints = targetMesh[0].getPoints(space='object')

            resultPoints = newMeshPoints

            for j in range(len(resultPoints)):
                for k in range(3):
                    if not i == k:
                        continue

                    resultPoints[j][k] = targetPoints[j][k]

            newMesh.shapes[0].setPoints(resultPoints, space='object')

    return True


def splitTargetsXYZOnSelection():
    return [splitTargetsXYZ(blendShape) for blendShape in getRelatedBlendShapeForSelection()]
