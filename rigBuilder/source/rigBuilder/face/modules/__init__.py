import maya.cmds
import pymel.core

import rigBuilder.face.utils.attribute as attributeUtils
import rigBuilder.face.utils.file as fileUtils
import rigBuilder.face.utils.skeleton as skeletonUtils
from rigBuilder.face.faceRigEnv import FACE_SKELETON_GUIDE_NS

TOP_NODE_NAME = 'C_rig_grp_0'
MODULE_NODE_NAME = '%s_%sModule_grp_0'

RIG_HIERARCHY = {"rig_face_anim":[
                    ("controls", "ctl"),
                    ("geometry", "geo"),
                    ("guide", "gui"),
                    ("interface", "int"),
                    ("modules", "mod"),
                    ("preference", "prf"),
                    ("skeleton", "skl"),
                    ("transform", "xfm"),
                    ("visibility", "vis")
                    ]
                 }

RIG_PREFIX = "fb"
RIG_HIERARCHY_SUFFIX = "grp"


class RigComponent(object):
    def __init__(self, name='face', LOD='anim'):
        super(RigComponent, self).__init__()

        self.name = name
        self.LOD = LOD

        self.topNode = None

        self.skeletonNode = None
        self.controlsNode = None
        self.geometryNode = None
        self.modulesNode = None
        self.interfaceNode = None
        self.preferenceNode = None
        self.transformNode = None
        self.visibilityNode = None


    def buildRigHierarchy(self):
        if not self.topNode:
            if pymel.core.objExists('rig_%s_%s' % (self.name, self.LOD)):
                self.topNode = pymel.core.PyNode('rig_%s_%s' % (self.name, self.LOD))

            else:
                self.topNode = pymel.core.createNode('transform', name='rig_%s_%s' % (
                    self.name, self.LOD))
                attributeUtils.lockAll(self.topNode)

        for value in RIG_HIERARCHY['rig_%s_%s' % (self.name, self.LOD)]:
            if pymel.core.objExists('%s_%s' % (value[0], RIG_HIERARCHY_SUFFIX)):
                self.__setattr__('%sNode' % value[0], '%s_%s' % (value[0], RIG_HIERARCHY_SUFFIX))

            else:
                rigNode = pymel.core.createNode('transform', name='%s_%s' % (value[0], RIG_HIERARCHY_SUFFIX))
                rigNode.setParent(self.topNode)

                if not value[0] == 'transform':
                    attributeUtils.lockAll(rigNode)

                self.__setattr__('%sNode' % value[0], rigNode)


    def importModelComponent(self, filePath, namespace):

        if not pymel.core.objExists(self.geometryNode):
            self.buildRigHierarchy()

        fileUtils.importUnderGroup(filePath, self.geometryNode.name(),
            namespace=namespace)

        return True


    def referenceRigComponentGuide(self, filePath, namespace=FACE_SKELETON_GUIDE_NS):

        if not pymel.core.objExists(self.guideNode):
            self.buildRigHierarchy()

        fileUtils.referenceUnderGroup(filePath, self.guideNode.name(),
            namespace=namespace)

        return True


    def removeRigComponentGuideReference(self, namespace=FACE_SKELETON_GUIDE_NS):

        try:
            a = pymel.core.system.FileReference(namespace=namespace)
            a.remove()
            return True

        except:
            return False


    def buildRigComponentSkeleton(self):

        root = skeletonUtils.FaceSkeletonBuilder(
            guideNamespace=FACE_SKELETON_GUIDE_NS).buildSkeleton()
        root.setParent(self.skeletonNode)



class RigModule(RigComponent):

    SETUP_ATTRS = [
        ['displayMeshes', [0, 1, 1]],
        ['meshDisplayMode', [0, 2, 2]],
        ['displayJoints', [0, 1, 0]],
        ['jointDisplayMode', [0, 2, 2]],
        ['displayPrimaryControls', [0, 1, 1]],
        ['displaySecondaryControls', [0, 1, 1]],
        ['displayTertiaryControls', [0, 1, 1]]
        ]

    _folderNames = ['control', 'setup', 'skeleton']

    def __init__(self, modulePosition='C', moduleName='body', **kwargs):
        super(RigModule, self).__init__()

        self.modulePosition = modulePosition
        self.moduleName = moduleName

        self.moduleTopNode = None

        self.controlGroup = None
        self.setupGroup = None
        self.skeletonGroup = None

        # Preferences / Interfaces
        self.interfaceNode = None
        self.preferencesNode = None

        self.drivers = list()
        self.driven = list()

        self.guidePath = None

        # Create a Rig Top Node if one doesn't already exist.
        try:
            self.topNode = pymel.core.PyNode(TOP_NODE_NAME)
        except:
            self.buildRigHierarchy()

        # Create the Module Node
        try:
            self.moduleTopNode = pymel.core.PyNode(MODULE_NODE_NAME % (
                modulePosition.upper(), moduleName))
        except:
            self.moduleTopNode = pymel.core.createNode('transform',
                name=MODULE_NODE_NAME % (modulePosition.upper(), moduleName))
            attributeUtils.lockAll(self.moduleTopNode)

            # Parent the Module Node to the Rig Top Node.
            self.moduleTopNode.setParent(self.modulesNode)

            # Add Switch Attrs to the Module Node.
            self.__addSwitchAttrs(self.moduleTopNode)

        self.__createModuleHierarchy()


    def __addSwitchAttrs(self, node):
        for a in self.SETUP_ATTRS:
            node.addAttr(a[0], at='long', min=a[1][0], max=a[1][1], dv=a[1][2])
            node.attr(a[0]).set(cb=True, k=False)


    def __createModuleHierarchy(self):
        for folderName in self._folderNames:
            folderNode = None
            try:
                folderNode = pymel.core.PyNode('%s_%s%s_grp_0' % (
                    self.modulePosition, self.moduleName, folderName.title()))

            except:
                folderNode = pymel.core.createNode('transform',
                    name='%s_%s%s_grp_0' % (self.modulePosition,
                    self.moduleName, folderName.title()))

                folderNode.setParent(self.moduleTopNode)
                attributeUtils.lockAll(folderNode)

            finally:
                setattr(self, '%sGroup' % folderName, folderNode)

        for ident in ['interface', 'preference', 'setup']:
            node = pymel.core.general.createNode('transform', name=('%s_%s%sNode'
                '_grp_0' % (self.modulePosition, self.moduleName, ident.title())))
            setattr(self, '%sNode' % ident, node)
            node.setParent(self.moduleTopNode)
            attributeUtils.lockAll(node)
            attributeUtils.addTag(node, name='module%sNode' % ident.title())

        return True


    def buildModule(self):
        pass

