'''
Created on 11/09/2013

@author: caleb.bell
'''

import re
import sys
import traceback

import maya.cmds
import pymel.core

import rigBuilder.face.utils.name as nameUtils


def addTag(node, name, value=True, **kwargs):
    if not isinstance(node, pymel.core.PyNode):
        try:
            node = pymel.core.PyNode(str(node))
        except Exception:
            traceback.print_exc()

    node.addAttr(name, at='bool', k=False, **kwargs)
    try:
        node.setAttr(name, value, l=True)
    except:
        pass

    return True


def lockAll(node, unlock=False, skipList=list()):
    if not isinstance(node, pymel.core.PyNode):
        try:
            node = pymel.core.PyNode(str(node))
        except Exception:
            traceback.print_exc()

    attrs = node.listAttr(connectable=True)

    for attr in attrs:
        skip = False
        for item in skipList:
            if re.search(item, attr.name()):
                skip = True

        if skip:
            continue

        childAttrs = None
        try:
            childAttrs = attr.getChildren()
        except:
            pass

        if childAttrs:
            for childAttr in childAttrs:

                skip = False
                for item in skipList:
                    if re.search(item, childAttr.name()):
                        skip = True

                    if skip:
                        continue

                if not childAttr in attrs:
                    try:
                        childAttr.set(keyable=unlock, lock=(1 - unlock),
                            channelBox=unlock)
                    except:
                        pass

            continue

        try:
            attr.set(keyable=unlock, lock=(1 - unlock), channelBox=unlock)
        except:
            pass

    return True


def lockAndHide(node, attrs=['t', 'r', 's', 'v'], unlock=False, verbose=True):
    if not isinstance(node, pymel.core.PyNode):
        try:
            node = pymel.core.PyNode(str(node))
        except Exception:
            traceback.print_exc()

    for at in attrs:
        if at in ['t', 'r', 's', 'translate', 'rotate', 'scale']:
            suffices = list()
            if at in ['t', 'r', 's']:
                suffices = ['x', 'y', 'z']
            elif at in ['translate', 'rotate', 'scale']:
                suffices = ['X', 'Y', 'Z']
            # Now go.
            for suffix in suffices:
                node.attr('%s%s' % (at, suffix)).set(keyable=unlock,
                    lock=1 - unlock)
        else:
            if not node.hasAttr:
                if verbose:
                    sys.stderr.write("Attribute '%s' does not exist on Node '%s'"
                        ". Skipping..." % (at, node.name()))
                continue

            node.attr(at).set(keyable=unlock, lock=1 - unlock)

    return True


class CopyAttribute(object):
    def __init__(self, attribute, node, prefix=None):
        ''' Copies an attribute from one node to another, and connects it. '''
        ''' If it's a Multi then we need to add the parent first, then the children. '''

        self.__attribute = pymel.core.PyNode(attribute)
        self.__node = pymel.core.PyNode(node)
        self.__prefix = prefix

        self.__copy(self.__attribute)
        self.__connect(self.__attribute)


    def __copy(self, attribute):

        # Attribute Type.
        attrType = attribute.type()
        parentAttribute = attribute.getParent()
        if parentAttribute:
            parentAttribute = parentAttribute.name(includeNode=False)

        # Long / Nice Name
        longName = attribute.name(includeNode=False)
        niceName = maya.cmds.addAttr(attribute.name(), query=True, niceName=True)

        # Enum Names
        enumName = str()
        if attrType == 'enum':
            enumName = ':'.join([attribute.getEnums()[i] for i in range(len(attribute.getEnums()))])

        # Min, Max, Default Values.
        minValue = attribute.getMin()
        maxValue = attribute.getMax()
        defaultValue = maya.cmds.addAttr(attribute.name(), query=True, defaultValue=True)

        # Keyable, Channel Box, Lock
        keyable = attribute.isKeyable()
        channelBox = attribute.isInChannelBox()
        lock = attribute.isLocked()

        # Adjust the names if there is a prefix.
        if self.__prefix:
            if not niceName:
                niceName = nameUtils.camelCaseToNiceString(longName).replace('_', ' ')

            longName = self.__prefix + longName[0].upper() + longName[1:]

            if parentAttribute:
                parentAttribute = self.__prefix + str(parentAttribute).split('.')[-1][0].upper() + str(parentAttribute).split('.')[-1][1:]

        # Add Attribute.
        if not self.__node.hasAttr(longName):
            kwargs = dict()
            if niceName:
                kwargs['niceName'] = niceName
            if minValue:
                kwargs['minValue'] = minValue
            if maxValue:
                kwargs['maxValue'] = maxValue
            if defaultValue:
                kwargs['defaultValue'] = defaultValue
            if keyable:
                kwargs['keyable'] = keyable
            if enumName:
                kwargs['enumName'] = enumName
            if parentAttribute:
                kwargs['parent'] = parentAttribute

            self.__node.addAttr(longName, at=attrType, **kwargs)

        # Recurse on compounds.
        if attribute.isCompound():
            [self.__copy(childAttribute) for childAttribute in attribute.getChildren()]

        return True


    def __connect(self, attribute):

        # Recurse on compounds.
        if attribute.isCompound():
            [self.__connect(childAttribute) for childAttribute in attribute.getChildren()]
            return

        longName = attribute.name(includeNode=False)

        # Keyable, Channel Box, Lock
        keyable = attribute.isKeyable()
        channelBox = attribute.isInChannelBox()
        lock = attribute.isLocked()

        # Adjust the names if there is a prefix.
        if self.__prefix:
            longName = self.__prefix + longName[0].upper() + longName[1:]

        # Check in case we hooked up on the compunds.
        if self.__node.attr(longName).isConnectedTo(attribute, ignoreUnitConversion=True):
            return

        # Connect.
        inputs = attribute.inputs(plugs=True, scn=True)
        value = None
        if not inputs:
            value = attribute.get()

        if lock:
            attribute.unlock()
        self.__node.attr(longName) >> attribute
        if inputs:
            inputs[0] >> self.__node.attr(longName)
        if not inputs:
            self.__node.attr(longName).set(value)

        attribute.lock()

        # Set Channel Box / Lock State.
        kwargs = dict()
        if keyable:
            kwargs['keyable'] = True
        elif channelBox:
            kwargs['channelBox'] = True
        if lock:
            kwargs['lock'] = True

        self.__node.attr(longName).set(**kwargs)
