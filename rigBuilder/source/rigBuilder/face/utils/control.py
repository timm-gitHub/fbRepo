'''
Created on 04/09/2013

@author: caleb.bell
'''

import os
import re
import sys

import maya.cmds
import maya.mel
import pymel.core

from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.utils.attribute as attributeUtils
import rigBuilder.face.utils.dag as dagUtils
import rigBuilder.face.utils.file as fileUtils
import rigBuilder.face.utils.name as nameUtils

OPPOSITE_CONTROL_MAPPING = {'C': None, 'L': 'R', 'R': 'L'}
FACE_FRAME_CONTROL = 'C_faceGUI_ctl_0'
CONTROL_GROUP_IDENTIFIER = 'ctg'
CONTROL_HOME_IDENTIFIER = 'cth'
CONTROL_IDENTIFIER = 'ctl'


def getFaceGUITemplateNames():

    result = list()

    for fileName in fileUtils.getFileNamesByExt(
            FACE_GUI_TEMPLATES_PATH, '.ma'):

        result.append(os.path.splitext(fileName)[0])

    return result


def getFaceGUIControlNames():

    result = list()

    for fileName in fileUtils.getFileNamesByExt(
            FACE_GUI_CONTROLS_PATH, '.ma'):

        result.append(os.path.splitext(fileName)[0])

    return result


def getFaceGUIControlShapeNames():

    result = list()

    if not os.path.exists(FACE_GUI_SHAPES_PATH):
        return result

    f = open(FACE_GUI_SHAPES_PATH, 'r')
    for line in f:
        # Look for transforms first.
        if not 'createNode transform' in line:
            continue

        # Check that they are parented to the controlShapes_grp node.
        if not '-p "controlShapes_grp"' in line:
            continue

        a = re.search("-n \"([a-zA-Z0-9]*)\"", line)
        if not a:
            continue

        result.append(a.group(1))

    f.close()

    return sorted(result)


def openFaceGUITemplate(templateName):

    path = os.path.join(FACE_GUI_TEMPLATES_PATH, templateName + '.ma')

    if not os.path.exists(path):
        return None

    maya.mel.eval('saveChanges("file -f -new;");')

    maya.cmds.file(path, i=True)


def addFaceGUIControl(ctlType, ctlShape, ctlPos, ctlDesc, ctlIndex, addOpposite=False):

    if not maya.cmds.objExists(FACE_GUI_CONTROLS_GROUP):
        raise Exception("You need a Face GUI Template in the scene.")

    path = os.path.join(FACE_GUI_CONTROLS_PATH, ctlType + '.ma')

    if not os.path.exists(path):
        return None

    # Create a result array.
    result = list()

    # Create a namespace bsed upon the inputs of the function.
    namespace = '%s%s%s%s' % (ctlType, ctlPos, ctlDesc, ctlIndex)

    # Import the control
    maya.cmds.file(path, i=True, ns=namespace)

    # Parent and Rename the control.
    ctl = maya.cmds.ls('%s:*' % namespace, assemblies=True)[0]
    maya.cmds.parent(ctl, FACE_GUI_CONTROLS_GROUP)
    newName = '%s:%s_%s_ctl_%s' % (ctl.rsplit(':', 1)[0], ctlPos, ctlDesc, str(ctlIndex))
    maya.cmds.rename(ctl, newName)

    # Remove the namespace.
    maya.cmds.namespace(mnp=True, rm=namespace)

    # Add the new control to the result list.
    result.append(newName.split(namespace + ':')[-1])

    # Replace the shape.
    replaceFaceGUIControlShape(result[0], ctlShape)

    # Set the color.
    setControlColor(result[0], CONTROL_COLOR[ctlPos])

    # Create opposite control if necessary.
    if addOpposite and ctlPos in ['L', 'R']:
        result.extend(
            addFaceGUIControl(
                ctlType=ctlType,
                ctlShape=ctlShape,
                ctlPos=OPPOSITE_CONTROL_MAPPING[ctlPos],
                ctlDesc=ctlDesc,
                ctlIndex=ctlIndex,
                addOpposite=False
                )
            )

    return result


def replaceFaceGUIControlShape(controlName, shapeType=None):

    if not maya.cmds.objExists(controlName):
        maya.cmds.select(controlName)

    if isinstance(shapeType, basestring) and (getFaceGUIControlShapeNames().count(shapeType) == 0):
        raise ValueError('Shape type "' + shapeType + '" does not exist within '
            'the control shapes scene: ' + FACE_GUI_SHAPES_PATH)

    oldShapes = maya.cmds.listRelatives(controlName, shapes=True, type='nurbsCurve')
    if oldShapes: maya.cmds.delete(oldShapes)

    if not shapeType:
        return True

    namespace = 'controlShapes'

    try:
        namepace = maya.cmds.referenceQuery(FACE_GUI_SHAPES_PATH, namespace=True)
    except:
        maya.cmds.file(FACE_GUI_SHAPES_PATH, ns=namespace, r=True)

    # We need to duplicate the transform so the shapes stick around when we
    # unload the control shapes reference scene.
    temp = maya.cmds.duplicate('%s:%s' % (namespace, shapeType), rr=True)[0]

    newShapes = list()
    for shape in maya.cmds.listRelatives(temp, shapes=True, type='nurbsCurve') or list():
        newShapes.append(maya.cmds.parent(shape, controlName, add=True, shape=True))

    # Clean up the temp transform.
    maya.cmds.delete(temp)

    # Rename the shapes appropriately.
    if len(newShapes) == 1:
        maya.cmds.rename(shape, '%sShape' % (controlName))
    else:
        for i, shape in enumerate(newShapes):
            maya.cmds.rename(shape, '%sShape%d' % (controlName, i + 1))

    maya.cmds.file(FACE_GUI_SHAPES_PATH, rr=True)

    return True


def setControlColor(controlName, colorIndex):

    if not maya.cmds.objExists(controlName):
        maya.cmds.select(controlName)

    for shape in maya.cmds.listRelatives(controlName, shapes=True,
            type='nurbsCurve') or list():

        maya.cmds.setAttr('%s.overrideEnabled' % shape, 1)
        maya.cmds.setAttr('%s.overrideColor' % shape, colorIndex)

    return True





# def mirrorFaceGUIControlPosition(controlName):
#
#     if not maya.cmds.objExists(controlName):
#         maya.cmds.select(controlName)
#
#     oppPos = OPPOSITE_CONTROL_MAPPING[nameUtils.getPosition(controlName)]
#
#     if not oppositeSide:
#         return None
#
#     oppCtl = nameUtils.subPosition(controlName, oppPos)
#     if not maya.cmds.objExists(oppCtl):
#         return None(oppCtl)
#
#     # Get the position of the original control.
#     ctlWSP =  maya.cmds.xform(FACE_FRAME_CONTROL, q=True, t=True, ws=True)
#
#
#
#     if not maya.cmds.objExists(nameUtils.)
#
#     if 'L' in nameUtils.getPosition(controlName):
#         # Left to right mirror.
#         oppositeControl = name
#         if not maya.cmds.objExists(name)
#
#     elif 'R' in nameUtils.getPosition(controlName):
#         # Right to left mirror.
#
#     else:
#         return None


def finalizeFaceControlGUI(guideNamespace=str()):

    # Tests:
    if not maya.cmds.objExists(FACE_GUI_GUIDE_ROOT):
        maya.cmds.select(FACE_GUI_GUIDE_ROOT)

    if not maya.cmds.objExists(FACE_GUI_LAYOUT_GROUP):
        maya.cmds.select(FACE_GUI_LAYOUT_GROUP)

    if not maya.cmds.objExists(FACE_GUI_CONTROLS_GROUP):
        maya.cmds.select(FACE_GUI_CONTROLS_GROUP)

    frameCtl = 'C_faceGUI_ctl_0'
    frameHome = maya.cmds.rename(dagUtils.addParent(frameCtl),
        nameUtils.subNodeType(frameCtl, CONTROL_HOME_IDENTIFIER))
    frameGrp = maya.cmds.rename(FACE_GUI_GUIDE_ROOT, nameUtils.subNodeType(
        frameCtl, CONTROL_GROUP_IDENTIFIER))

    #
    for shape in maya.cmds.listRelatives(frameCtl, s=True) or list():
        maya.cmds.setAttr('%s.overrideEnabled' % shape, True)
        maya.cmds.setAttr('%s.overrideColor' % shape, CONTROL_COLOR['C'])

    # Lock up the layout group.
    for child in maya.cmds.listRelatives(FACE_GUI_LAYOUT_GROUP, c=True, typ='transform') or list():
        maya.cmds.setAttr('%s.overrideEnabled' % child, 1)
        maya.cmds.setAttr('%s.overrideDisplayType' % child, 2)

    # Now work over the controls.
    for child in maya.cmds.listRelatives(FACE_GUI_CONTROLS_GROUP, c=True, typ='transform') or list():

        validName = nameUtils.checkValidNameString(child)
        validType = (nameUtils.getNodeType(child) != 'ctl')

        if not validName or validType:
            continue


        #=======================================================================
        # Create the control hierarchy.
        #=======================================================================

        node = child
        for i, newType in enumerate([CONTROL_GROUP_IDENTIFIER, CONTROL_HOME_IDENTIFIER]):
            node = dagUtils.addParent(node)
            pos = nameUtils.getPosition(child)
            desc = nameUtils.getDescription(child)
            index = nameUtils.getIndex(child)
            node = maya.cmds.rename(node, '%s_%s_%s_%s' % (pos, desc, newType, index))

        # Lock and hide scale.
        attributeUtils.lockAndHide(node=child, attrs=['s'], verbose=False)

        # Hide the Limits
        for action in ['Trans', 'Rot']:
            for axis in ['X', 'Y', 'Z']:

                lockAndHide = True

                for limit in ['min', 'max']:
                    maya.cmds.setAttr('%s.%s%s%sLimit' % (child, limit, action, axis), cb=False)
                    maya.cmds.setAttr('%s.%s%s%sLimitEnable' % (child, limit, action, axis), True, lock=True)

                    if maya.cmds.getAttr('%s.%s%s%sLimit' % (child, limit, action, axis)):
                        lockAndHide = False

                if not lockAndHide:
                    continue

                # Lock and Hide if the min and max limits are set to 0.
                maya.cmds.setAttr('%s.%s%s' % (child, action[0].lower(),
                    axis.lower()), k=False, l=True)


        # Hide showFrame.
        maya.cmds.setAttr('%s.showFrame' % child, cb=False)


        #=======================================================================
        # Re-parent the frame shapes.
        #=======================================================================

        for node in maya.cmds.listRelatives(child, c=True) or list():

            if not 'DO_NOT_TOUCH' in node:
                continue

            cube = '%s:cube_crv' % node.rsplit(':', 1)[0]
            if not maya.cmds.objExists(cube):
                continue

            # We need to freeze the transforms and delete history prior to re-
            # parenting so that the shape transformation is maintained.
            maya.cmds.parent(node, world=True)
            attributeUtils.lockAndHide(node, unlock=True)
            maya.cmds.makeIdentity(t=1, r=1, s=1)
            maya.cmds.delete(cube, ch=1)

            # Re-parent.
            for crv in sorted(maya.cmds.listRelatives(cube, ni=True, s=True, typ='nurbsCurve') or list()):
                maya.cmds.parent(crv, child.replace('_ctl_', '_%s_' % CONTROL_HOME_IDENTIFIER), add=True, s=True)
                maya.cmds.setAttr('%s.overrideEnabled' % crv, True)
                maya.cmds.connectAttr('%s.showFrame' % child, '%s.overrideVisibility' % crv)


            # Delete the old parent.
            maya.cmds.delete(node)

            # Rename the shape nodes so they conform to convention.
            dagUtils.conformShapeNames(child.replace('_ctl_', '_%s_' % CONTROL_HOME_IDENTIFIER))

            # Make them historically boring.
            [maya.cmds.setAttr('%s.ihi' % crv, 0) for crv in (maya.cmds.listRelatives(
                child, ni=True, s=True, typ='nurbsCurve') or list())]

    return True


class RigControl(object):
    def __init__(self, position='C', description='top', index=0,
        aim=[1.0, 0.0, 0.0], aimAxis=[1.0, 0.0, 0.0], up=[0.0, 1.0, 0.0],
        upAxis=[0.0, 1.0, 0.0], shapeType='circle', color=22,
        tagPrefix='faceRigControl'):

        self.controlGroup = None
        self.controlHome = None
        self.control = None
        self.shape = list()


        #=======================================================================
        # Offsets.
        #=======================================================================

        for i, v in enumerate(zip(['Group', 'Home'],
                [CONTROL_GROUP_IDENTIFIER, CONTROL_HOME_IDENTIFIER])):

            # Create offsets as joints.
            offset = pymel.core.general.createNode('joint', n='%s_%s_%s_%d' % (
                position, description, v[1], int(index)))

            offset.overrideEnabled.set(True)
            offset.overrideLevelOfDetail.set(1)

            attributeUtils.addTag(offset, '%s%s' % (tagPrefix, v[0]))

            setattr(self, 'control%s' % v[0], offset)

            if not i:
                continue

            self.controlHome.setParent(self.controlGroup)


        #=======================================================================
        # Controls.
        #=======================================================================

        self.control = pymel.core.general.createNode('transform',
            n='%s_%s_%s_%s' % (position, description, CONTROL_IDENTIFIER,
            str(index)))
        attributeUtils.addTag(self.control, tagPrefix)

        self.control.setParent(self.controlHome)


        #=======================================================================
        # Shapes.
        #=======================================================================

        if shapeType:
            self.shape = setShape(self.control, shapeType, tagPrefix)
            for shape in self.shape:
                shape.overrideEnabled.set(True)
                shape.overrideEnabled.set(lock=True)
                shape.overrideColor.set(color)
                shape.ihi.set(False)


        # Orient the control.
        null = [pymel.core.general.createNode('transform') for i in range(3)]
        null[1].setTranslation(aim)
        null[2].setTranslation(up)

        acn = pymel.core.aimConstraint(null[1], null[0], aimVector=aimAxis,
            upVector=upAxis, worldUpType='object', worldUpObject=null[2])

        self.controlGroup.setAttr('jointOrient', null[0].getAttr('rotate'))

        # Clean up.
        pymel.core.delete(null, acn)


class RigFKControlChain(object):
    def __init__(self, jointChain, addDescription='FK', aim=[1.0, 0.0, 0.0],
        aimAxis=[1.0, 0.0, 0.0], up=[0.0, 1.0, 0.0], upAxis=[0.0, 1.0, 0.0],
        shapeType='circle', color=22):

        self.chain = list()

        for i in range(len(jointChain)):
            jointChain[i] = pymel.core.PyNode(jointChain[i])

            position = nameUtils.getPosition(jointChain[i])
            description = nameUtils.getDescription(jointChain[i])
            index = nameUtils.getIndex(jointChain[i])

            self.chain.append(
                RigControl(
                    position=position, description=description + addDescription,
                    index=index, aim=aim, aimAxis=aimAxis, up=up, upAxis=upAxis,
                    shapeType=shapeType, color=color
                    )
                )

            # Match the transformation of the control group to the joint.
            self.chain[i].controlGroup.setTransformation(
                jointChain[i].getMatrix(worldSpace=True))

            # Parent the joint to the control.
            jointChain[i].setParent(self.chain[i].control)
            jointChain[i].setAttr('visibility', False)

            if not i:
                continue

            # Parent to the previous control in the chain.
            self.chain[i].controlGroup.setParent(self.chain[i - 1].control)


def setShape(control, shapeType=None, tagPrefix='faceRigControl', *kwargs):
    control = dagUtils.TransformAndShapes(control)

    # Delete Existing shapes if applicable.
    if shapeType is None or 'replace' in kwargs:
        for shape in control.shapes:
            if not shape.type() is 'nurbsCurve':
                continue

            pymel.core.delete(shape)

    if not shapeType:
        return None

    # Create new shapes if applicable.
    tempShapes = list()
    cleanShapes = list()

    if shapeType == 'circle':
        tempShapes.append(pymel.core.circle(nr=[1, 0, 0], ch=False)[0])
    elif shapeType == 'tongueMaster':
        tempGrp = pymel.core.textCurves(ch=False, font='Times New Roman', text='T')
        tempShapes = [pymel.core.ls(sl=1, dag=1, type='nurbsCurve')[0].getParent()]
        tempShapes[0].setParent(None)
        pymel.core.delete(tempGrp)
        pymel.core.xform(tempShapes[0], cp=True)
        offset = [val * -1.0 for val in pymel.core.xform(tempShapes[0], query=1,
            rotatePivot=True)]
        pymel.core.move(offset[0], offset[1], offset[2], tempShapes[0], r=True)
        pymel.core.makeIdentity(tempShapes[0], a=1, t=1, r=1, s=1, jo=0)
        pymel.core.closeCurve(tempShapes[0], ch=1, ps=0, rpo=1)
    else:
        return None

    # Parent.
    for tempShape in tempShapes:
        tempShape = dagUtils.TransformAndShapes(tempShape)
        for shape in tempShape.shapes:
            cleanShapes.append(shape.setParent(control.transform, addObject=True, shape=True))

        # Cleanup.
        pymel.core.delete(tempShape.transform)

    # Rename.
    for i, shape in enumerate(cleanShapes):
        shapeName = '%sShape' % control.transform.name()
        if len(cleanShapes) > 1:
            shapeName += str(i + 1)
        shape.rename(shapeName)
        attributeUtils.addTag(shape, '%sShape' % tagPrefix)

    return cleanShapes


def printShape(nurbsCurve):
    ROUND_VAR = 6

    nurbsCurve = dagUtils.TransformAndShapes(nurbsCurve)
    for shape in nurbsCurve.shapes:
        if not shape.type() == 'nurbsCurve':
            continue

        cmdString = 'pymel.core.curve(p=['

        # CV's
        cvs = pymel.core.ls('%s.cv[*]' % shape.name(), flatten=True)
        for i, cv in enumerate(cvs):
            pos = cv.getPosition()
            cmdString += '(%s, %s, %s)' % (str(round(pos[0], ROUND_VAR)),
                str(round(pos[1], ROUND_VAR)), str(round(pos[2], ROUND_VAR)))

            if not i == (len(cvs) - 1):
                cmdString += ', '

            else:
                cmdString += '], '

        # Degree.
        degree = shape.degree()
        cmdString += 'd=%s, ' % str(degree)

        # Knots.
        cmdString += 'k=['
        if degree > 1:
            for i in range(degree - 1):
                cmdString += '%s, ' % str(i - (degree - 1))

        for i in range(len(cvs)):
            cmdString += str(i)

            if not i == (len(cvs) - 1):
                cmdString += ', '

            else:
                cmdString += ']'

        # Close the string.
        cmdString += ')'

        sys.stdout.write(cmdString)

    return None
