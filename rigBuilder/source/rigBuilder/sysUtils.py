import os

import maya.cmds
from PyQt4 import QtCore, QtGui

from rigBuilder.rigEnv import *


def createAssetHierarchy():
    ''' Creates the directory structure between ROOT and ROOTCHAR variables set
    in rigEnv.py '''

    if not os.path.exists(ROOTCHAR):
        # What about the project root?
        if not os.path.exists(ROOT):
            try:
                os.makedirs(ROOTCHAR)
            except:
                return False
    
    return True



def createCharacterAssetHierarchy(character):
    
    if not os.path.exists(ROOTCHAR):
        createAssetHierarchy()

    if not os.path.exists(os.path.join(ROOTCHAR, character)):
        os.mkdir(os.path.join(os.path.join(ROOTCHAR, character)))
        
    return True  


    
def getCharacterAssetList():
    ''' This looks at the directory structure of the rig builder project to find
    character names. '''

    characterAssets = list()

    # If the ROOTCHAR folder doesn't exist:
    if not os.path.exists(ROOTCHAR):
        createAssetHierarchy()

    for item in os.listdir(ROOTCHAR):
        if os.path.isfile(os.path.join(ROOTCHAR, item)):
            continue

        characterAssets.append(item)

    return characterAssets



class CreateCharacterPopUpMenu(QtGui.QMenu):
    ''' This is a generic pop-up menu that will be used across all rigging guis
    character lists to allow for adding a new character easily. '''
    
    
    def __init__(self, parent=None):
        super(CreateCharacterPopUpMenu, self).__init__(parent)

        action = self.addAction('Create character asset...')
        action.triggered.connect(self._characterNamePromptDialog)


    def _buildMenu(self):
         
        posX  = QtGui.QCursor().pos().x() - self.pos().x()
        posY  = QtGui.QCursor().pos().y() - self.pos().y() - 20
 
        self.exec_(self.mapToGlobal(QtCore.QPoint(posX, posY)))

        return True


    def _characterNamePromptDialog(self):

        dialogArgs = {
            'title' : 'Create character asset',
            'message' : 'Enter new character asset name:',
            'button' : ['OK', 'Cancel'],
            'defaultButton' : 'OK',
            'cancelButton' : 'Cancel',
            'dismissString' : 'Cancel',
            }
        
        prompt = maya.cmds.promptDialog(**dialogArgs)
        if not prompt == 'OK':
            return False
        
        character = maya.cmds.promptDialog(query=True, text=True)
        createCharacterAssetHierarchy(character)
        self._characterNamePromptDialogCallback()


    def _characterNamePromptDialogCallback(self):
        ''' The callback exists so we can easily refresh the parent character
        list. '''
        
        return True

