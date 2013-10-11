import re
import string
import sys

import maya.cmds
import pymel.core

from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.utils.attribute as attributeUtils
import rigBuilder.face.utils.dag as dagUtils
import rigBuilder.face.utils.name as nameUtils


def connectRigModulesToComponent():
    ''' This function looks for module interface and preference nodes (by tag)
    and copies the user defined attributes to the corresponding nodes on the rig
    component hierarchy (with a prefix constructed from the source node name),
    then connects the two attributes together. '''

    for nodeType in ['interface', 'preference']:

        try:
            destNode = pymel.core.PyNode('%s_grp' % nodeType)
        except:
            continue

        for node in sorted(pymel.core.ls('*.module%sNode' % nodeType.title(), o=True)):

            prefices = re.search('([A-Z])_(.*)%sNode_grp_0' % nodeType.title(), node.name())
            if not prefices:
                continue

            prefix = str()
            if prefices.groups()[0] == 'L':
                prefix += 'left' + prefices.groups()[1].title()
            elif prefices.groups()[0] == 'R':
                prefix += 'right' + prefices.groups()[1].title()
            else:
                prefix += prefices.groups()[1]

            # We don't need to do anything if there's no attributes to copy.
            attrs = node.listAttr(ud=True)
            if not attrs:
                continue

            # Add the marker attribute.
            destNode.addAttr('%sMarker' % prefix, nn=' ', at='enum',
                en=nameUtils.camelCaseToNiceString('%s%ss' % (prefix,
                nodeType.title())), k=True)
            destNode.attr('%sMarker' % prefix).lock()

            # Copy the attributes.
            [attributeUtils.CopyAttribute(attr, destNode, prefix) for attr in attrs]


class SetupVisibilitySwitches(object):

    switchNodeName = 'visibility_grp'

    guideNamespace = FACE_SKELETON_GUIDE_NS
    guideTopGroup = guideNamespace + ':' + FACE_SKELETON_GUIDE_ROOT

    modelNamespace = FACE_MODEL_COMPONENT_BASE_NS
    modelTopGroup = modelNamespace + ':' + FACE_MODEL_COMPONENT_BASE_ROOT

    shapeTopGroup = FACE_MODEL_COMPONENT_SHAPE_ROOT

    @classmethod
    def guideSwitches(cls, default=False):

        switchNode = pymel.core.PyNode(cls.switchNodeName)
        switchNode.addAttr('guideDisplayMarker', nn=' ', at='enum', en='Guide', k=True)
        switchNode.guideDisplayMarker.lock()

        switchNode.addAttr('displayGuides', at='bool', k=False)
        switchNode.displayGuides.set(cb=True)
        switchNode.displayGuides.set(False)

        switchNode.addAttr('guideDisplayMode', at='long', min=0, max=2, dv=2, k=False)
        switchNode.guideDisplayMode.set(cb=True)

        # Connect the meshes to the switches.
        for child in pymel.core.PyNode('guide_grp').getChildren(ad=True):
            
            if not child.type() in ['locator', 'nurbsCurve']:
                continue

            switchNode.displayGuides >> child.overrideVisibility
            try:
                child.overrideVisibility.lock()
            except:
                pass

            child.overrideEnabled.set(True)
            try:
                child.overrideEnabled.set(lock=True)
            except:
                pass

            switchNode.guideDisplayMode >> child.overrideDisplayType
            try:
                child.overrideDisplayType.lock()
            except:
                pass


    @classmethod
    def skeletonSwitches(cls):

        switchNode = pymel.core.PyNode(cls.switchNodeName)
        switchNode.addAttr('skeletonDisplayMarker', nn=' ', at='enum', en='Skeleton', k=True)
        switchNode.skeletonDisplayMarker.lock()

        switchNode.addAttr('displayJoints', at='bool', k=False)
        switchNode.displayJoints.set(cb=True)
        switchNode.displayJoints.set(False)

        switchNode.addAttr('jointDisplayMode', at='long', min=0, max=2, dv=2, k=False)
        switchNode.jointDisplayMode.set(cb=True)


        # Connect the meshes to the switches.
        reverse = pymel.core.createNode('reverse', name='C_jointVisibilityMaster_rev_0')
        switchNode.displayJoints >> reverse.inputX

        for child in pymel.core.PyNode('skeleton_grp').getChildren(ad=True, typ='joint'):

            child = pymel.core.PyNode(child)
            reverse.outputX >> child.overrideLevelOfDetail
            try:
                child.overrideLevelOfDetail.lock()
            except:
                pass

            child.overrideEnabled.set(True)
            child.overrideEnabled.set(lock=True)
            switchNode.jointDisplayMode >> child.overrideDisplayType
            try:
                child.overrideDisplayType.lock()
            except:
                pass

        # Lock the reverse
        reverse.ihi.set(False)
        attributeUtils.lockAll(reverse)


    @classmethod
    def modelSwitches(cls):

        prefix = 'model'

        switchNode = pymel.core.PyNode(cls.switchNodeName)
        switchNode.addAttr('%sDisplayMarker' % prefix, nn=' ',
            at='enum', en='%s Display' % prefix.title(), k=True)
        switchNode.attr('%sDisplayMarker' % prefix).lock()

        switchNode.addAttr('%sDisplayMeshes' % prefix, at='bool', k=False,
            nn='Display Meshes')
        switchNode.attr('%sDisplayMeshes' % prefix).set(cb=True)
        switchNode.attr('%sDisplayMeshes' % prefix).set(True)

        switchNode.addAttr('%sMeshDisplayMode' % prefix, at='long',
            nn='Mesh Display Mode', min=0, max=2, dv=2, k=False)
        switchNode.attr('%sMeshDisplayMode' % prefix).set(cb=True)

        modelTopNode = cls.modelTopGroup

        try:
            modelTopNode = pymel.core.PyNode(modelTopNode)
        except:
            return None

        # Connect the meshes to the switches.
        for child in modelTopNode.getChildren(ad=True, ni=True, typ='mesh'):

            child = dagUtils.TransformAndShapes(child)
            switchNode.attr('%sDisplayMeshes' % prefix) >> child.shapes[0].overrideVisibility

            child.shapes[0].overrideEnabled.set(True)
            switchNode.attr('%sMeshDisplayMode' % prefix) >> child.shapes[0].overrideDisplayType

        return True


    @classmethod
    def shapeSwitches(cls):

        prefix = 'blendShape'

        switchNode = pymel.core.PyNode(cls.switchNodeName)
        switchNode.addAttr('%sDisplayMarker' % prefix, nn=' ',
            at='enum', en=nameUtils.camelCaseToNiceString(prefix), k=True)
        switchNode.attr('%sDisplayMarker' % prefix).lock()

        switchNode.addAttr('%sDisplayMeshes' % prefix, at='bool', k=False,
            nn='Display Meshes')
        switchNode.attr('%sDisplayMeshes' % prefix).set(cb=True)
        switchNode.attr('%sDisplayMeshes' % prefix).set(False)

        switchNode.addAttr('%sMeshDisplayMode' % prefix, at='long',
            nn='Mesh Display Mode', min=0, max=2, dv=2, k=False)
        switchNode.attr('%sMeshDisplayMode' % prefix).set(cb=True)

        shapeTopGroup = cls.shapeTopGroup

        try:
            shapeTopGroup = pymel.core.PyNode(shapeTopGroup)
        except:
            return None

        # Connect the top node to the switches.
        switchNode.attr('%sDisplayMeshes' % prefix) >> shapeTopGroup.visibility
        shapeTopGroup.overrideEnabled.set(True)
        switchNode.attr('%sMeshDisplayMode' % prefix) >> shapeTopGroup.overrideDisplayType

        return True


    @classmethod
    def stickyControlSwitches(cls):

        prefix = 'stickyControls'

        switchNode = pymel.core.PyNode(cls.switchNodeName)
        switchNode.addAttr('%sDisplayMarker' % prefix, nn=' ',
            at='enum', en=nameUtils.camelCaseToNiceString(prefix), k=True)
        switchNode.stickyControlsDisplayMarker.lock()

        switchNode.addAttr('%sDisplayControls' % prefix, at='bool', k=False,
            nn='Display Controls')
        switchNode.attr('%sDisplayControls' % prefix).set(cb=True)
        switchNode.attr('%sDisplayControls' % prefix).set(False)

        for control in pymel.core.ls('*_*Sticky_ctl_*', type='transform'):
            for child in control.getChildren(shapes=True):

                child.overrideEnabled.unlock()
                child.overrideEnabled.set(True)
                child.overrideEnabled.lock()

                child.overrideVisibility.unlock()
                switchNode.attr('%sDisplayControls' % prefix) >> child.overrideVisibility
                child.overrideVisibility.lock()

