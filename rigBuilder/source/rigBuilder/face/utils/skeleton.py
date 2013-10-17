import string
import sys
import types

import maya.cmds
import pymel.core

import rigBuilder.face.utils as faceUtils
from rigBuilder.face.utils import dag as dagUtils
from rigBuilder.face.utils import name as nameUtils


def duplicateJointChain(jointChain, addDescription=None, world=True):
    if not isinstance(jointChain, list):
        return False

    result = list()

    for i in range(len(jointChain)):
        jointChain[i] = pymel.core.PyNode(jointChain[i])

        if not jointChain[i].type() == 'joint':
            return False

        if i and jointChain[i].getParent() != jointChain[i - 1]:
            return False

        result.extend(jointChain[i].duplicate(parentOnly=True))

        if not i and world:
            result[i].setParent(world=True)

        else:
            result[i].setParent(result[i - 1])

        if not addDescription:
            continue

        nameSplit = jointChain[i].split('_')
        result[i].rename('%s_%s%s%s_%s_%s' % (nameSplit[0], nameSplit[1],
            addDescription[0].upper(), addDescription[1:], nameSplit[2],
            nameSplit[3]))

    return result


def labelJoint(joint):
    ''' Sets joint labeling based upon the tokens in the name string. '''

    if not nameUtils.checkValidNameString(str(joint)):
        return False

    nameTokens = str(joint).rsplit(':', 1)[-1].split('_')

    loci = ['C', 'L', 'R']
    maya.cmds.setAttr('%s.side' % joint, loci.index(nameTokens[0]))
    maya.cmds.setAttr('%s.type' % joint, 18)
    maya.cmds.setAttr('%s.otherType' % joint, nameTokens[1], type='string')

    return True


def labelJoints(joints=list()):
    ''' Wrapper for renaming a list of joints. '''

    if not isinstance(joints, (types.ListType, types.TupleType)):
        return False

    for joint in joints:
        if not maya.cmds.objectType(joint, isType='joint'):
            continue

        labelJoint(joint)

    return True


def labelJointHierarchy(root):
    ''' Given a root joint, script will iterate through the hierarchy of joints,
    and label them, skipping any non-joints. '''

    hi = list()
    if maya.cmds.objectType(root, isType='joint'):
        hi.append(root)
    hi.extend(maya.cmds.listRelatives(root, ad=True, typ='joint') or list())

    return labelJoints(hi)


class FaceSkeletonBuilder(object):

    def __init__(self, guideNamespace=str()):

        self._guideNamespace = guideNamespace
        self.skeletonRoot = None
        self.bindJointsSet = None


    def buildSkeleton(self):

        # Setup the bind joints set.
        try:
            self.bindJointsSet = pymel.core.PyNode('faceBindJoints')
        except:
            pymel.core.general.select(cl=True)
            self.bindJointsSet = pymel.core.general.sets(
                name='faceBindJoints', em=True)


        # Build the skeleton.
        self.skeletonRoot = self._buildSkeletonRoot()

        mouthJoint = self._buildMouthSkeleton(parent=self.skeletonRoot)
        self._buildTongueSkeleton(parent=mouthJoint)

        for side in ['L', 'R']:
            self._buildEyeSkeleton(side=side, parent=self.skeletonRoot)


        return self.skeletonRoot


    def __matchJointToGuide(self, guide, joint):
        pymel.core.general.delete(pymel.core.animation.parentConstraint(
            guide, joint))

        dagUtils.rotationToJointOrient(joint)
        return True


    def _buildEyeSkeleton(self, side, parent=None): # Eye Skeleton.

        EYE_GUIDE = '%s:%s_eye_gui_0' # %(guideNamespace, side)
        EYE_LID_CURVE = '%s:%s_eyeLid%s_gui_0' # %(guideNamespace, side, locus[1].title())

        # Look for the locator that defines the centre of the eye.
        try:
            eyeGuide = pymel.core.PyNode(EYE_GUIDE % (self._guideNamespace, side))
        except:
            sys.stdout.write("Can't find eye guide...")
            return False

        # Create the basic set of eye joints.
        eyeJoint = pymel.core.general.createNode('joint', name='%s_eye_jnt_0' % side)
        eyeJoint.setTransformation(eyeGuide.getTransformation())
        if parent:
            eyeJoint.setParent(parent)
        dagUtils.rotationToJointOrient(eyeJoint)

        eyeBallDriver = pymel.core.general.duplicate(eyeJoint,
            n='%s_eyeBallDriver_jnt_0' % side, po=True, rr=True)[0]
        eyeBallDriver.setParent(eyeJoint)

        eyeLidDriver1 = pymel.core.general.duplicate(eyeJoint,
            n='%s_eyeLidDriver_jnt_1' % side, po=True, rr=True)[0]
        eyeLidDriver1.setParent(eyeJoint)

        # First create the eye lid tip joints.
        eyeLidTipJoints = dict()

        for i, locus in enumerate(zip(['inner', 'outer'], ['upper', 'lower'])):

            # Look for the curve that defines the eye lid.
            try:
                eyeLidCurve = pymel.core.PyNode(EYE_LID_CURVE % (
                    self._guideNamespace, side, locus[1].title()))
            except:
                sys.stdout.write("Can't find eye lid guide curve...")
                continue

            eyeLidTipJoints[locus[0]], eyeLidTipJoints[locus[1]] = list(), list()

            # Inner / Outer.
            eyeLidTipJoints[locus[0]].append(pymel.core.createNode('joint',
                name='%s_eyeLid%s_jnt_3' % (side, locus[0].title())))
            eyeLidTipJoints[locus[0]][-1].setTranslation(pymel.core.general.xform(
                    eyeLidCurve.ep[i * -1], q=1, t=1, ws=1))

            # Upper / Lower.
            for i in range(1, eyeLidCurve.numEPs() - 1):
                eyeLidTipJoints[locus[1]].append(pymel.core.createNode('joint',
                    name='%s_eyeLid%s%s_jnt_3' % (side, locus[1].title(),
                    string.ascii_uppercase[i - 1])))
                eyeLidTipJoints[locus[1]][-1].setTranslation(pymel.core.general.xform(
                    eyeLidCurve.ep[i], q=1, t=1, ws=1))


        # Create a temporary locator to aim at.
        tempCentre = pymel.core.general.spaceLocator()
        # Position it midway between the inner and outer eye lid joints.
        pymel.core.general.delete(pymel.core.animation.pointConstraint(
            [eyeLidTipJoints['inner'][0], eyeLidTipJoints['outer'][0]], tempCentre))

        # Orient the eye lid driver.
        pymel.core.general.delete(pymel.core.animation.aimConstraint(
            tempCentre, eyeLidDriver1, aim=[1, 0, 0], u=[0, 1, 0], wu=[0, 1, 0],
            wut='objectRotation', wuo=eyeJoint))
        dagUtils.rotationToJointOrient(eyeLidDriver1)

        # Create the secondary eye lid driver.
        eyeLidDriver2 = pymel.core.general.duplicate(eyeJoint,
            n='%s_eyeLidDriver_jnt_2' % side, po=True, rr=True)[0]
        eyeLidDriver2.setParent(eyeLidDriver1)

        # Create the tear duct joint.
        eyeTearDuct = pymel.core.general.duplicate(eyeLidDriver1,
            n='%s_eyeTearDuct_jnt_0' % side, po=True, rr=True)[0]
        eyeTearDuct.setParent(eyeLidDriver2)
        eyeTearDuct.setTranslation(eyeLidTipJoints['inner'][0].getTranslation(
            worldSpace=True), worldSpace=True)

        # Add the tear duct joint to the bind joints set.
        self.bindJointsSet.addMembers([eyeTearDuct])

        # Create the eye lid parent.
        eyeLidParent = pymel.core.general.duplicate(eyeLidDriver1,
            n='%s_eyeLidParent_jnt_0' % side, po=True, rr=True)[0]
        eyeLidParent.setParent(eyeTearDuct)

        # Now construct all the other stuff in-between.
        for locus in ['upper', 'lower', 'inner', 'outer']:
            for joint in eyeLidTipJoints[locus]:

                # Match the orientation of the lid tip joints to the eye lid parent.
                pymel.core.general.delete(pymel.core.animation.orientConstraint(
                    eyeLidParent, joint))

                eyeLidOffsetJoint = eyeLidParent.duplicate(
                    name=joint.name().replace('_3', '_1'), po=True, rr=True)[0]
                eyeLidOffsetJoint.setParent(eyeLidParent)

                eyeLidJoint = joint.duplicate(
                    name=joint.name().replace('_3', '_2'), po=True, rr=True)[0]
                eyeLidJoint.setParent(eyeLidOffsetJoint)


                diff = eyeLidParent.worldMatrix.get() * eyeLidJoint.worldMatrix.get().inverse()
                eyeLidJoint.translateBy([diff[3][0], diff[3][1], 0.0], space='object')

                # Orient the Lid Joint.
                aimVec = [1.0, 0.0, 0.0]
                if diff[3][0] > 1:
                    aimVec = [-1.0, 0.0, 0.0]

                pymel.core.general.delete(pymel.core.animation.aimConstraint(
                    joint, eyeLidJoint, aim=aimVec, u=[0.0, 1.0, 0.0],
                    wut='objectRotation', wuo=eyeLidParent))
                dagUtils.rotationToJointOrient(eyeLidJoint)

                joint.setParent(eyeLidJoint)
                joint.r.set([0.0, 0.0, 0.0])
                joint.jo.set([0.0, 0.0, 0.0])

                # Add the tip joints to the bind joints set.
                self.bindJointsSet.addMembers([joint])

        pymel.core.general.delete(tempCentre)
        return True


    def _buildMouthSkeleton(self, parent=None):

        # Mouth joints.
        mouthGuides = pymel.core.ls('%s:C_mouth_gui_*' % self._guideNamespace, typ='transform')
        mouthJoints = list()

        # Now the rest.
        for i, guide in enumerate(mouthGuides):

            jointName = nameUtils.subNodeType(guide.name().split(':')[-1], 'jnt')
            mouthJoints.append(pymel.core.createNode('joint', name=jointName))

            # Parenting.
            if not i:
                if not isinstance(parent, types.NoneType):
                    mouthJoints[i].setParent(parent)

            else:
                mouthJoints[i].setParent(mouthJoints[i - 1])

            self.__matchJointToGuide(guide, mouthJoints[i])


        # Jaw Joints.
        jawGuides = pymel.core.ls('%s:C_jaw_gui_*' % self._guideNamespace, typ='transform')
        jawJoints = dict()

        for suffix in ['Lower', 'Upper']:
            jawJoints[suffix] = list()

            for i, guide in enumerate(jawGuides):

                # Creation.
                jointName = nameUtils.subNodeType(nameUtils.addDescription(
                    guide.name().split(':')[-1], suffix), 'jnt')

                jawJoints[suffix].append(pymel.core.createNode('joint', name=jointName))

                # Parenting.
                if not i:
                    jawJoints[suffix][i].setParent(mouthJoints[0])

                else:
                    jawJoints[suffix][i].setParent(jawJoints[suffix][i - 1])

                self.__matchJointToGuide(guide, jawJoints[suffix][i])


        # Add relevant joints to the bind set.
        self.bindJointsSet.addMembers([mouthJoints[0], jawJoints['Upper'][0],
            jawJoints['Lower'][0]])

        return mouthJoints[0]


    def _buildSkeletonRoot(self, parent=None):

        rootGuides = ['C_head_gui_0']
        rootJoints = list()

        for i, guide in enumerate(rootGuides):

            guidePyNode = pymel.core.PyNode('%s:%s' % (self._guideNamespace, guide))

            # Creation.
            rootJoints.append(pymel.core.createNode('joint', name=guide.replace('_gui_', '_jnt_')))

            # Parenting.
            if not i:
                if not isinstance(parent, types.NoneType):
                    rootJoints[i].setParent(parent)

            else:
                rootJoints[i].setParent(rootJoints[i - 1])

            pymel.core.general.delete(
                pymel.core.animation.parentConstraint(
                    guidePyNode, rootJoints[i]
                    )
                )

            dagUtils.rotationToJointOrient(rootJoints[i])

        # Add the root joint to the bind set.
        self.bindJointsSet.addMembers(rootJoints)

        return rootJoints[-1]


    def _buildTongueSkeleton(self, parent=None):

        tongueGuides = pymel.core.ls('%s:C_tongue_gui_*' % self._guideNamespace, typ='transform')
        tongueJoints = list()

        # Tongue base first.
        tongueJoints.append(pymel.core.createNode('joint', name='C_tongueBase_jnt_0'))

        if not isinstance(parent, types.NoneType):
            tongueJoints[0].setParent(parent)

        self.__matchJointToGuide(tongueGuides[0], tongueJoints[0])

        # Now the rest.
        for i, guide in enumerate(tongueGuides):

            jointName = nameUtils.subNodeType(guide.name().split(':')[-1], 'jnt')
            tongueJoints.append(pymel.core.createNode('joint', name=jointName))

            tongueJoints[i + 1].setParent(tongueJoints[i])

            self.__matchJointToGuide(guide, tongueJoints[i + 1])


        # Add all but the tongue base joint to the bind set.
        self.bindJointsSet.addMembers(tongueJoints[1:])

        return True

