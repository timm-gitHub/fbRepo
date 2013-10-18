'''

Created on 05/09/2013

@author: caleb.bell

facePublish.py is home to functions which handle the saving of face rig assets,
and the dependencies which they are created from. It is a direct extension of
rigBuilder.body.bodyPublish, and borrows a lot of it's core functionality.

'''

import os
import re

import maya.cmds

import rigBuilder.body.bodyIO as bodyIO
import rigBuilder.body.bodyPublish as bodyPublish

from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.faceIO as faceIO
import rigBuilder.face.utils as faceUtils
import rigBuilder.face.utils.file as fileUtils


#===============================================================================
# Getters
#===============================================================================

def getAllVersions(path, pattern):
    """ Returns a dictionary of the asset versions, with three digit string key
    values. """

    versions = dict()

    if not os.path.isdir(os.path.expandvars(path)):
        return versions

    for item in os.listdir(os.path.expandvars(path)):

        if not re.match(pattern, item):
            continue

        version = int(re.search('[0-9]{3}', item).group(0))

        versions['%03d' % version] = os.path.join(os.path.expandvars(path), item)

    return versions


def getPreferencesVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'preferences'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_preferences_v[0-9]{3}.json$' % character

    return getAllVersions(path, pattern)


def getBlendShapesVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'blendShapes'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_blendShapes_v[0-9]{3}.ma$' % character

    return getAllVersions(path, pattern)


def getGUIGuideVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'guiGuide'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_guiGuide_v[0-9]{3}.ma$' % character

    return getAllVersions(path, pattern)


def getDrivenKeysVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'drivenKeys'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_drivenKeys_v[0-9]{3}.json$' % character

    return getAllVersions(path, pattern)


def getSkeletonGuideVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'skeletonGuide'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_skeletonGuide_v[0-9]{3}.ma$' % character

    return getAllVersions(path, pattern)


def getWeightingVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'weighting'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_weighting_v[0-9]{3}.json$' % character

    return getAllVersions(path, pattern)


#===============================================================================
# Publishers
#===============================================================================

def publishBlendShapes(character, source, description=str()):
    """ Save face rig blend shapes on the server.  """

    path = '%s/%s/rig/face/blendShapes' % (ROOTCHAR, character)
    pattern = '%s_face_rig_blendShapes_v[0-9]{3}.ma$' % character
    fileUtils.cleanMayaAsciiFile(source)
    fileUtils.cleanMayaAsciiBlendShapeScene(source)
    return bodyPublish.publishToServer(source, path, pattern)


@faceUtils.restoreSelectionDecorator
def publishBlendShapesFromScene(character, description=str()):

    rootNode = FACE_MODEL_COMPONENT_SHAPE_ROOT

    maya.cmds.select(rootNode)

    tempPath = fileUtils.getTempFilePath([character, 'blendShapes'], 'ma')
    maya.cmds.file(tempPath, typ='mayaAscii', es=True, ch=False, con=False,
        exp=False, sh=False)

    return publishBlendShapes(character, tempPath, description)


def publishGuide(character, source, guideType='gui', description=str()):
    """ Save a character face rig guide on the server.  """

    path = '%s/%s/rig/face/%sGuide' % (ROOTCHAR, character, guideType)
    pattern = '%s_face_rig_%sGuide_v[0-9]{3}.ma$' % (character, guideType)
    fileUtils.cleanMayaAsciiFile(source)
    return bodyPublish.publishToServer(source, path, pattern)


@faceUtils.restoreSelectionDecorator
def publishGuideFromScene(character, guideType='gui', description=str()):

    rootNode = globals()['FACE_%s_GUIDE_ROOT' % guideType.upper()]

    maya.cmds.select(rootNode)

    tempPath = fileUtils.getTempFilePath([character, '%sGuide' % guideType], 'ma')
    maya.cmds.file(tempPath, typ='mayaAscii', es=True, ch=True, con=True,
        exp=True, sh=False)

    return publishGuide(character, tempPath, guideType, description)


def publishDrivenKeysData(character, source, description=str()):
    """ Save character face rig driven keyframe data on the server.  """

    path = '%s/%s/rig/face/drivenKeys' % (ROOTCHAR, character)
    pattern = '%s_face_rig_drivenKeys_v[0-9]{3}.json$' % character
    return bodyPublish.publishToServer(source, path, pattern)


def publishDrivenKeysDataFromScene(character, description=str()):

    tempPath = fileUtils.getTempFilePath([character, 'drivenKeys'], 'json')
    faceIO.exportSceneDrivenKeysData(tempPath, verbose=True)

    return publishDrivenKeysData(character, tempPath, description)


def publishFaceRig(character, source, description=str()):
    """ Save character face rig on the server.  """

    path = '%s/%s/rig/face/anim' % (ROOTCHAR, character)
    pattern = '%s_face_rig_anim_v[0-9]{3}.ma$' % character
    fileUtils.cleanMayaAsciiFile(source)
    return bodyPublish.publishToServer(source, path, pattern)


@faceUtils.restoreSelectionDecorator
def publishFaceRigFromScene(character, description=str()):

    rootNode = FACE_RIG_ROOT

    maya.cmds.select(rootNode)

    tempPath = fileUtils.getTempFilePath([character, 'anim'], 'ma')
    maya.cmds.file(tempPath, typ='mayaAscii', es=True, ch=True, con=True,
        exp=True, sh=True)

    return publishFaceRig(character, tempPath, description)


def publishPreferenceData(character, source, description=str()):
    """ Save face rig preference data on the server.  """

    path = '%s/%s/rig/face/preferences' % (ROOTCHAR, character)
    pattern = '%s_face_rig_preferences_v[0-9]{3}.json$' % (character)
    return bodyPublish.publishToServer(source, path, pattern)


def publishPreferenceDataFromScene(character, description=str()):

    tempPath = fileUtils.getTempFilePath([character, 'preferences'], 'json')
    faceIO.exportAttributeData(FACE_PREFERENCE_GRP, tempPath, verbose=True,
        ud=True, sa=True)

    return publishPreferenceData(character, tempPath, description)


def publishWeightingData(character, source, description=str()):
    """ Save face rig weighting data on the server.  """

    path = '%s/%s/rig/face/weighting' % (ROOTCHAR, character)
    pattern = '%s_face_rig_weighting_v[0-9]{3}.json$' % (character)
    return bodyPublish.publishToServer(source, path, pattern)


def publishWeightingDataFromScene(character, description=str()):

    tempPath = fileUtils.getTempFilePath([character, 'weighting'], 'json')
    bodyIO.exportSkinByRef(FACE_MODEL_COMPONENT_BASE_NS, tempPath)

    return publishWeightingData(character, tempPath, description)

