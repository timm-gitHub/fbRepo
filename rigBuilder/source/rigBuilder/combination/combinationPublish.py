'''
Created on 01/10/2013

@author: caleb.bell
'''

from rigBuilder.body.bodyPublish import *
from rigBuilder.face.facePublish import *


#===============================================================================
# Getters
#===============================================================================

def getBodyRigVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'body',
        'anim'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_body_rig_anim_v[0-9]{3}.ma$' % character

    return getAllVersions(path, pattern)


def getFaceRigVersions(character):

    pathTokens = [
        ROOT,
        'asset',
        'character',
        character,
        'rig',
        'face',
        'anim'
        ]

    path = os.path.join(*pathTokens)
    pattern = '%s_face_rig_anim_v[0-9]{3}.ma$' % character

    return getAllVersions(path, pattern)


#===============================================================================
# Publishers
#===============================================================================

def publishCombinedRig(character, source, description=str()):
    """ Save character face rig on the server.  """

    path = '%s/%s/rig/combined/anim' % (ROOTCHAR, character)
    pattern = '%s_combined_rig_anim_v[0-9]{3}.ma$' % character
    return publishToServer(source, path, pattern)


def publishCombinedRigFromScene(character, description=str()):

    rootNode = 'rig_anim_combined'

    maya.cmds.select(rootNode)

    tempPath = fileUtils.getTempFilePath([character, 'combined', 'rig', 'anim'], 'ma')
    maya.cmds.file(tempPath, typ='mayaAscii', es=True, ch=True, con=True, exp=True, sh=True)

    return publishCombinedRig(character, tempPath, description)

