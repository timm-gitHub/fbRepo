'''
Created on 10/09/2013

@author: caleb.bell
'''

import traceback

import maya.cmds
import pymel.core

from rigBuilder.face.utils import name as faceRigNameUtils


def addParent(node, suffix='Parent'):
    ''' Adds a transform above. '''

    if not maya.cmds.objExists(node):
        maya.cmds.select(node)

    # Get the existing parent if one exists.
    oldParent = maya.cmds.listRelatives(node, parent=True)

    # Construct a name.
    parent = str()
    if faceRigNameUtils.checkValidNameString(node):
        parent = faceRigNameUtils.addDescription(node, 'Parent')
    else:
        parent = node + suffix

    # Make the parent.
    parent = maya.cmds.createNode('transform', name=parent)

    # Match transforms.
    maya.cmds.delete(maya.cmds.parentConstraint(node, parent))
    maya.cmds.delete(maya.cmds.scaleConstraint(node, parent))

    # Parent.
    maya.cmds.parent(node, parent)
    if oldParent:
        maya.cmds.parent(parent, oldParent)

    return parent


def conformShapeNames(node):

    result = list()

    if not maya.cmds.objExists(node):
        return result

    shapes = sorted(maya.cmds.listRelatives(node, ni=True, s=True) or list())

    if not shapes:
        pass

    elif len(shapes) == 1 and shapes[0] != (node + 'Shape'):
        result.append(maya.cmds.rename(shapes[0], node + 'Shape'))

    else:
        for i, shape in enumerate(shapes):
            result.append(maya.cmds.rename(shape, node + 'Shape' + str(i + 1)))

    return result


def rotationToJointOrient(joint):
    joint = pymel.core.PyNode(joint)
    loc = pymel.core.general.spaceLocator()
    loc.setMatrix(joint.getMatrix(worldSpace=True))
    con = pymel.core.animation.orientConstraint(loc, joint)
    joint.jo.set([0.0, 0.0, 0.0])
    pymel.core.delete(con)
    joint.jo.set(joint.r.get())
    joint.r.set([0.0, 0.0, 0.0])
    pymel.core.general.delete(loc)
    return True


class TransformAndShapes(object):
    def __init__(self, node, skipIntermediates=True):

        self.transform = None
        self.shapes = list()

        if not isinstance(node, pymel.core.PyNode):
            try:
                node = pymel.core.PyNode(node)
            except Exception:
                traceback.print_exc()

        if isinstance(node, pymel.core.nodetypes.Transform):
            self.transform = node
            shapes = node.getChildren(shapes=True, f=True)
            if not skipIntermediates:
                self.shapes = shapes
            else:
                for shape in shapes:
                    if shape.intermediateObject.get():
                        continue
                    self.shapes.append(shape)

        elif isinstance(node, (pymel.core.nodetypes.GeometryShape, pymel.core.nodetypes.Shape)):
            self.shapes = [node]
            self.transform = node.listRelatives(parent=True)[0]

