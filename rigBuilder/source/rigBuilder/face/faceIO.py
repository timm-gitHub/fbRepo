'''
Created on 18/09/2013

@author: caleb.bell
'''

import json
import os
import re
import sys
import types

import maya.cmds
import maya.mel
import pymel.core

SDK_ANIMCURVE_TYPES = ['animCurveUA', 'animCurveUL', 'animCurveUT', 'animCurveUU']

#===============================================================================
# JSON import/export wrappers
#===============================================================================

def importJSON(filePath, verbose=True):

    if not os.path.exists(filePath):
        if verbose:
            sys.stdout.write("File path '%s' does not exist.\n" % filePath)
        return False

    f = open(filePath, 'r')

    if verbose:
        sys.stdout.write("Reading JSON data from file '%s'.\n" % filePath)

    data = json.load(f)

    f.close()

    return data


def exportJSON(data, filePath, verbose=True):

    f = file(filePath, 'w')
    json.dump(data, f, indent=4, sort_keys=True)

    if verbose:
        sys.stdout.write(">> Data written to '%s'.\n" % filePath)

    f.close()

    return filePath


#===============================================================================
# Attribute import/export wrappers (Preference Data).
#===============================================================================

def importAttributeData(node, filePath, verbose=True):
    return setAttributeData(importJSON(filePath, verbose), node, verbose)


def exportAttributeData(node, filePath, verbose=True, **kwargs):
    return exportJSON(getAttributeData(node, **kwargs), filePath, verbose)


#===============================================================================
# Attribute data getters/setters.
#===============================================================================

def getAttributeData(node, **kwargs):
    ''' This function will iterate over attributes on a node (based upon filters
    passed in as keyword arguments of maya's listAttr command) and export the
    numeric attribute values. '''

    if not maya.cmds.objExists(node):
        maya.cmds.select(node)

    data = dict()

    for attr in maya.cmds.listAttr(node, **kwargs):

        data[attr] = maya.cmds.getAttr('%s.%s' % (node, attr))

    return data


def setAttributeData(data, node, verbose=True):
    ''' This function will iterate over keys in a dictionary which correspond
    with attribute names and attempt to set the attribute values. '''

    if not maya.cmds.objExists(node):
        maya.cmds.select(node)

    if not isinstance(data, types.DictType):
        raise ValueError('Data must be a dictionary.')

    if verbose:
        sys.stdout.write("Setting attribute data on node '%s'...\n" % node)

    # Begin progress Bar
    gMainProgressBar = maya.mel.eval('$tmp = $gMainProgressBar')
    status = "Setting attribute data on node '%s'...\n" % node
    maya.cmds.progressBar(gMainProgressBar, edit=True, beginProgress=True,
        isInterruptable=False, status=status, maxValue=len(data))

    # Iterate.
    for attr, value in data.iteritems():
        # Progress bar step.
        maya.cmds.progressBar(gMainProgressBar, edit=True, step=1)

        # First check that the attribute exists.
        if not maya.cmds.attributeQuery(attr, n=node, ex=True):
            continue

        # Then see if it's locked.
        if maya.cmds.getAttr('%s.%s' % (node, attr), lock=True):
            continue

        # Check to see if it has a parent attribute, and if so if that attribute
        # has an incoming connection.
        parentAttr = maya.cmds.attributeQuery(attr, n=node, lp=True)
        if parentAttr:
            cons = maya.cmds.listConnections('%s.%s' % (node, parentAttr[0]),
                s=True, d=True, scn=True)

            # Skip if we find the parent attribute has connections.
            if cons:
                if verbose:
                    sys.stdout.write("Parent attribute of '%s' has an incoming "
                        "connection. Skipping...\n" % attr)
                continue

        # Check for input connections.
        cons = maya.cmds.listConnections('%s.%s' % (node, attr), s=True, d=False,
            p=False, scn=True)

        if cons:
            if verbose:
                sys.stdout.write("Attribute '%s' has an incoming connection."
                    " Skipping...\n" % attr)
            continue

        # Set the attribute value.
        maya.cmds.setAttr('%s.%s' % (node, attr), value)

    if verbose:
        sys.stdout.write("Set attribute data complete.\n")

    maya.cmds.progressBar(gMainProgressBar, edit=True, endProgress=True)

    return True


#===============================================================================
# Driven Key getters/setters.
#===============================================================================

def getDrivenKeysData(attribute):

    def doIt(attribute):
        result = dict()

        # Get the name of the driver attribute. It will be the key for the driven
        # key data, so that in the event there is multiple drivers things will nest
        # nicely.
        currentDriver = maya.cmds.setDrivenKeyframe(attribute, q=True, cd=True)[0]
        result[currentDriver] = dict()

        # Get the keyframe count. This will be stored as well as used as the range
        # value for the iterator when capturing driven key data.
        keyframeCount = maya.cmds.keyframe(attribute, q=True, kc=True)
        result[currentDriver]['keyframeCount'] = keyframeCount

        # Get pre-infinity status.
        result[currentDriver]['preInfinity'] = maya.cmds.setInfinity(
            attribute, q=True, pri=True)[0]

        # Get the post-Infinity status.
        result[currentDriver]['postInfinity'] = maya.cmds.setInfinity(
            attribute, q=True, poi=True)[0]

        # Get the rest of the data. Note that I am grabbing this based upon the
        # alpha-numeric order of the dictionary keys only.
        result[currentDriver]['drivenValue'] = [maya.cmds.keyframe(
            attribute, q=True, index=(j, j), vc=True)[0] for j in range(keyframeCount)]

        # Get the driver values.
        result[currentDriver]['driverValue'] = [maya.cmds.keyframe(
            attribute, q=True, index=(j, j), fc=True)[0] for j in range(keyframeCount)]

        # Get the in angles.
        result[currentDriver]['inAngle'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), ia=True)[0] for j in range(keyframeCount)]

        # Get the in tangent types.
        result[currentDriver]['inTangentType'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), itt=True)[0] for j in range(keyframeCount)]

        # Get the in weight values.
        result[currentDriver]['inWeight'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), iw=True)[0] for j in range(keyframeCount)]

        # Get the tangent lock status
        result[currentDriver]['lock'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), l=True)[0] for j in range(keyframeCount)]

        # Get the out angle values.
        result[currentDriver]['outAngle'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), oa=True)[0] for j in range(keyframeCount)]

        # Get the out tangent types.
        result[currentDriver]['outTangentType'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), ott=True)[0] for j in range(keyframeCount)]

        # Get the out weight values.
        result[currentDriver]['outWeight'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), ow=True)[0] for j in range(keyframeCount)]

        # Get the weight lock status
        result[currentDriver]['weightLock'] = [maya.cmds.keyTangent(
            attribute, q=True, index=(j, j), wl=True)[0] for j in range(keyframeCount)]

        # See if the animation curve has weighted tangents.
        result[currentDriver]['weightedTangents'] = maya.cmds.keyTangent(
            attribute, q=True, wt=True)[0]

        return result

    # Declare the variable we'll return.
    data = list()

    # Check that the attribute exists.
    if not maya.cmds.objExists(attribute):
        return data

    # Check and see if the attribute is driven by animCurves.
    drivers = maya.cmds.setDrivenKeyframe(attribute, q=True, dr=True)

    if drivers == [u'No drivers.']: # Ugliest code ever.
        return data()

    else:
        if len(drivers) == 1: # This should be just an animCurve.
            data.append(doIt(attribute))

        else: # This is blendWeighted option.
            bwNode = maya.cmds.listConnections(attribute,
                s=True, d=False, p=False, scn=True, t='blendWeighted')

            if not bwNode: # Huh? This pretty much can't happen.
                return data()

            # Get ALL the source connections to the blendWeighted node.
            cons = maya.cmds.listConnections(bwNode[0], s=True, d=False,
                p=False, scn=True)

            for con in cons:
                if not maya.cmds.nodeType(con) in SDK_ANIMCURVE_TYPES:
                    return data()

            # Iterate over the inputs of the blendWeighted node.
            for i in range(maya.cmds.getAttr('%s.input' % bwNode[0], size=True)):
                data.append(doIt('%s.input[%d]' % (bwNode[0], i)))

    return data



def setDrivenKeysData(attribute, data, verbose=True):

    if not isinstance(data, types.ListType):
        raise ValueError('Data must be a list.')

    # Run some checks on the driven attribute.
    if not maya.cmds.objExists(attribute):
        if verbose:
            sys.stdout.write(
                "Attribute '%s' does not exist. Skipping...\n" % attribute
                )
        return False

    # Check to see if the driven attribute has a parent attribute, and if so
    # if that attribute has an incoming connection.
    parentAttr = maya.cmds.attributeQuery(attribute.split('.', 1)[-1],
        n=attribute.split('.', 1)[0], lp=True)
    if parentAttr:
        cons = maya.cmds.listConnections('%s.%s' % (attribute.split('.', 1)[0],
            parentAttr[0]), s=True, d=True, scn=True)

        # Skip if we find the parent attribute has connections.
        if cons:
            if verbose:
                sys.stdout.write(
                    "Parent attribute of '%s' has an incoming connection."
                    " Skipping...\n" % attribute
                    )
            return False

    # Check for pre-existing connections to the driven attr.
    if maya.cmds.listConnections(attribute, s=True, d=False):

        # Check and see if it's driven keys.
        drivers = maya.cmds.setDrivenKeyframe(attribute, q=True, dr=True)

        if drivers == [u'No drivers.']: # Ugliest code ever.
            if verbose:
                sys.stdout.write(
                    "Attribute '%s' has an incoming connection."
                    " Skipping...\n" % attribute
                    )

            return False

        # If it is driven keys we need to kill them so that they can be
        # rebuilt from the data.
        else:
            if len(drivers) == 1: # This should be just an animCurve.
                maya.cmds.delete(maya.cmds.listConnections(attribute,
                    s=True, d=False, p=False, scn=True, t='animCurve'))

            else: # This is blendWeighted option.
                bwNode = maya.cmds.listConnections(attribute,
                    s=True, d=False, p=False, scn=True, t='blendWeighted')

                if not bwNode: # Huh? This pretty much can't happen.
                    if verbose:
                        sys.stdout.write(
                            "A pre-condition of this function rebuilding SDK"
                            " data has failed on attribute '%s'."
                            " Skipping...\n" % attribute
                            )
                    return False

                # Get ALL the source connections to the blendWeighted node.
                cons = maya.cmds.listConnections(bwNode, s=True, d=False,
                    p=False, scn=True)

                for con in cons:

                    if not maya.cmds.nodeType(con) in SDK_ANIMCURVE_TYPES:
                        if verbose:
                            sys.stdout.write(
                                "A pre-condition of this function rebuilding SDK"
                                " data has failed on attribute '%s'."
                                " Skipping...\n" % attribute
                                )
                        return False

                # Delete the animCurves.
                maya.cmds.delete(cons)


    # Now we can build the SDK's
    for item in data:

        driverAttr = item.keys()[0]

        if not maya.cmds.objExists(driverAttr):
            if verbose:
                sys.stdout.write(
                    "Driver attribute '%s' does not exist. Skipping...\n" % (
                        driverAttr)
                    )
            continue

        animCurveData = item.values()[0]

        for i in range(animCurveData['keyframeCount']):
            # Create the driven keyframe.
            maya.cmds.setDrivenKeyframe(attribute, cd=driverAttr,
                dv=animCurveData['driverValue'][i],
                v=animCurveData['drivenValue'][i],)

            # Set tangent information.
            maya.cmds.keyTangent(attribute, edit=True, index=(i, i),
                ia=animCurveData['inAngle'][i],
                itt=animCurveData['inTangentType'][i],
                oa=animCurveData['outAngle'][i],
                ott=animCurveData['outTangentType'][i],
                l=animCurveData['lock'][i])

            # Set tangent weights (if applicable).
            if animCurveData['weightedTangents']:
                # Set the weighted tangents status (This only needs doing once).
                if not i:
                    maya.cmds.keyTangent(attribute, edit=True, wt=True)

                # Set the weight lock status and the in and out weights.
                maya.cmds.keyTangent(attribute, edit=True, index=(i, i),
                    wl=animCurveData['weightLock'][i],
                    iw=animCurveData['inWeight'][i],
                    ow=animCurveData['outWeight'][i])

    return True


def getSceneDrivenKeysData():

    data = dict()

    # Iterate over all the driven key anim curve types in the scene.
    for animCurve in maya.cmds.ls(typ=SDK_ANIMCURVE_TYPES):

        drivenAttr = maya.cmds.listConnections('%s.o' % animCurve, s=False,
            d=True, p=True, scn=False)

        # This should never trigger, but just in case...
        if not drivenAttr:
            continue

        # Blend-weighted SDKS need an extra step to find the driven attribute.
        if maya.cmds.objectType(drivenAttr[0].split('.', 1)[0], i='blendWeighted'):
            drivenAttr = maya.cmds.listConnections('%s.o' %
                drivenAttr[0].split('.', 1)[0], s=False, d=True, p=True, scn=False)

            # This should never trigger, but just in case...
            if not drivenAttr:
                continue

        # We need to check that we aren't doubling up the data capture,
        # because the basis for our data capture is EVERY SDK animCurve,
        # so there is a chance we could look at the same blendWeighted
        # node multiple times.
        if drivenAttr[0] in data:
            continue

        # Capture the data from the drivenAttr.
        data[drivenAttr[0]] = getDrivenKeysData(drivenAttr[0])

    return data


def setSceneDrivenKeyData(data, verbose=True):

    if not isinstance(data, types.DictType):
        raise ValueError('Data must be a dictionary.')

    # Iterate over all the keys in the data, which correspond to driven attributes.
    for attribute in data:
        setDrivenKeysData(attribute, data[attribute], verbose)

    return True


#===============================================================================
# SDK import/export wrappers.
#===============================================================================

def importSceneDrivenKeysData(filePath, verbose=True):
    return setSceneDrivenKeyData(importJSON(filePath, verbose), verbose)


def exportSceneDrivenKeysData(filePath, verbose=True):
    return exportJSON(getSceneDrivenKeysData(), filePath, verbose)

