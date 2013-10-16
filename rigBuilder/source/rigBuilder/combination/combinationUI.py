import inspect
import os

from PyQt4 import QtGui, QtCore, uic
import sip

import maya.mel
import maya.cmds
import maya.OpenMayaUI


from rigBuilder import rigUtils
from rigBuilder import sysUtils
from rigBuilder.body import bodyUI
from rigBuilder.face import faceUI
from rigBuilder.combination import combinationBuilder
from rigBuilder.combination import combinationPublish


OPTION_VARS = {'previousCharacter': 'rcbPreviousCharacter'}


def showRigCombinationBuilderUI():
    
    qMainWindow = QMainWindow()
    
    for child in qMainWindow.children():
        if not hasattr(child, 'isWindow'):
            continue
        
        if not child.isWindow():
            continue
            
        if child.windowTitle() == 'Rig Combination Builder':
            if not child.isVisible():
                child.show()
            child.activateWindow()
            return True
            
    window = RigCombinationBuilderUI(qMainWindow)
    window.show()
    window.activateWindow()
    
    return True
    

class RigCombinationBuilderUI(QtGui.QWidget):
    """Combination Builder UI.
    This is where you launch the body and face building UI's.
    This is also where you can combine the facial rig and the body rig to make the combination rig."""

    ASSET_TYPES = ['BodyRig', 'FaceRig']
    ASSET_VERSIONS = dict()
    FIELD_PREFIX = ''


    def __init__(self, parent=None):
        super(RigCombinationBuilderUI, self).__init__(parent=parent)
        
        self.setWindowTitle("Rig Combination Builder")
        self.setWindowFlags(QtCore.Qt.Window)
        self.loadUI()

        #=======================================================================
        # Add the Character List Context Menu.
        #=======================================================================

        self.CharacterAssetListWidget.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)

        self.PopupMenu = sysUtils.CreateCharacterPopUpMenu(
            parent=self.CharacterAssetListWidget)

        self.CharacterAssetListWidget.customContextMenuRequested.connect(self.PopupMenu._buildMenu)
        self.PopupMenu._characterNamePromptDialogCallback = self.__refreshGUI

        #=======================================================================
        # Populate the GUI
        #=======================================================================

        self._buildCharacterList()


        #=======================================================================
        # Hook up controls.
        #=======================================================================

        self.CharacterAssetListWidget.itemSelectionChanged.connect(
            self.__characterSelectionChange)

        self.RefreshButton.clicked.connect(self.__refreshGUI)

        self.BodyRigVersionComboBox.currentIndexChanged.connect(
            self.__bodyRigVersionComboBoxSelectionChange)

        self.FaceRigVersionComboBox.currentIndexChanged.connect(
            self.__faceRigVersionComboBoxSelectionChange)

        self.OpenBodyRigButton.clicked.connect(self.__openSelectedBodyRig)
        self.LaunchBodyRiggerUIButton.clicked.connect(self.launchBodyRigBuilderUI)

        self.OpenFaceRigButton.clicked.connect(self.__openSelectedFaceRig)
        self.LaunchFaceRiggerUIButton.clicked.connect(self.launchFaceBuilderUI)

        self.BuildCombinedRigButton.clicked.connect(self.__buildCombinedRig)


        #=======================================================================
        # Fill the versions fields
        #=======================================================================

        # We need these to stop things firing at the wrong time.
        self._BodyRigVersionComboBoxBuilt = True
        self._FaceRigVersionComboBoxBuilt = True

        # Look up the asset versions in the file system.
        self._getAssetVersions(self._getSelectedCharacter())

        for assetType in self.ASSET_TYPES:
            self._updateVersionComboBoxes(assetType)


    #===========================================================================
    # GUI Build / Update Methods
    #===========================================================================

    def _buildCharacterList(self):

        self._characterListBuilt = False
        
        # Clear the list.
        self.CharacterAssetListWidget.clear()

        # Get the list of character assets.
        charAssets = sysUtils.getCharacterAssetList()

        # Look for a previous character in option vars.
        prevChar = self._getPreviousCharacterOptionVar()

        # Populate the list.
        for i, character in enumerate(charAssets):
            self.CharacterAssetListWidget.insertItem(i, character)

        # Set the index.
        index = 0
        if prevChar and (prevChar in charAssets):
            index = charAssets.index(prevChar)
        else:
            self._removePreviousCharacterOptionVar()

        self.CharacterAssetListWidget.setCurrentRow(index)

        # Update the character header.
        self._updateCharacterHeader(self._getSelectedCharacter())

        # Set the built var.
        self._characterListBuilt = True

        return True


    def _refreshVersions(self, assetTypes=list()):
        ''' This method refreshes the version data stored in the class, then
        triggers the combo box update, which triggers the rest of the GUI to
        update. If no asset types are passed in the method defaults to all asset
        types in self.ASSET_TYPES. '''

        if not assetTypes:
            assetTypes = self.ASSET_TYPES

        # Reset the revision dictionaries.
        self._getAssetVersions(self._getSelectedCharacter(), assetTypes)

        for assetType in assetTypes:
            # Catch in case something stupid happens.
            if not assetType in self.ASSET_TYPES:
                continue
            # Update the Combo Boxes.
            self._updateVersionComboBoxes(assetType)

        return True


    def _resetVersionFields(self, assetType):

        for field in ['ComboBox', 'PathLineEdit']:
            field = getattr(self, '%sVersion%s' % (assetType, field))

            # Combo Box/
            if isinstance(field, QtGui.QComboBox): field.clear()

            # Line Edit.
            elif isinstance(field, QtGui.QLineEdit): field.setText(str())

            else: continue

        return True


    def _updateCharacterHeader(self, character):
        if not character:
            character = str()
        self.CharacterHeaderLabel.setText(character)
        return True


    def _updateVersionComboBoxes(self, assetType):

        setattr(self, '_%sVersionComboBoxBuilt' % assetType, False)

        versions = self.ASSET_VERSIONS[assetType]

        comboBox = getattr(self, '%sVersionComboBox' % assetType)

        self._resetVersionFields(assetType)

        [comboBox.addItem(version) for version in sorted(versions.keys())]

        setattr(self, '_%sVersionComboBoxBuilt' % assetType, True)

        # Set to latest.
        # Set to latest.
        if comboBox.count() > 1:
            comboBox.setCurrentIndex(comboBox.count() - 1)
        elif comboBox.count() == 1:
            # Needed this option because things wouldn't update.
            self._updateVersionFields(assetType)
        else:
            pass

        return True


    def _updateVersionFields(self, assetType):

        versionComboBox = getattr(self, '%sVersionComboBox' % assetType)
        pathLineEdit = getattr(self, '%sVersionPathLineEdit' % assetType)

        versions = self.ASSET_VERSIONS[assetType]

        if not versions.keys():
            self._resetVersionFields(assetType)
            return True

        # Get the version id from the combo box.
        vid = str(versionComboBox.currentText())
        if not vid in versions:
            raise Exception('Something has gone horribly wrong...')

        pathLineEdit.setText(versions[vid])

        return True


    #===========================================================================
    # Option Variable Getters / Setters
    #===========================================================================

    def _getPreviousCharacterOptionVar(self):
        ''' Look for a previously selected character in option vars. '''

        result = None
        var = OPTION_VARS['previousCharacter']

        if not maya.cmds.optionVar(exists=var):
            return result

        result = maya.cmds.optionVar(q=var)
        return result


    def _removePreviousCharacterOptionVar(self):
        var = OPTION_VARS['previousCharacter']
        return maya.cmds.optionVar(rm=var)


    def _setPreviousCharacterOptionVar(self, character):
        var = OPTION_VARS['previousCharacter']
        maya.cmds.optionVar(sv=[var, character])
        return True


    #===========================================================================
    # Methods for harvesting GUI info
    #===========================================================================

    def _getCharacterIndexFromListWidget(self, character):
        ''' Iterates through the items in the Character List, and returns the
        index of the item with the matching text passed in. '''

        ListWidget = self.CharacterAssetListWidget

        for i in range(ListWidget.count()):
            if not ListWidget.item(i).text() == character: continue
            return i

        return None


    def _getSelectedCharacter(self):
        ''' Returns the currently selected character as a string. '''

        selectedCharacter = None
        ListWidget = self.CharacterAssetListWidget
        CurrentItem = ListWidget.currentItem()
        if not CurrentItem:
            return selectedCharacter
        selectedCharacter = str(CurrentItem.text())
        return selectedCharacter


    def _getAssetVersions(self, character, assetTypes=list()):
        ''' Iterates over the supplied asset types, and gets the publish version
        data which is used to populate the GUI. If no asset types are passed in
        the method defaults to all asset types in self.ASSET_TYPES. '''

        if not assetTypes:
            assetTypes = self.ASSET_TYPES

        for assetType in assetTypes:
            # Catch just in case something stupid happens.
            if not assetType in self.ASSET_TYPES:
                continue
            
            # Catch for situation where there are no characters yet.
            if not character:
                self.ASSET_VERSIONS[assetType] = dict()
                continue
            
            self.ASSET_VERSIONS[assetType] = getattr(combinationPublish,
                'get%sVersions' % assetType)(character)

        return True


    #===========================================================================
    # Generic Field GUI Actions
    #===========================================================================

    def _assetOpenPushButtonClicked(self, assetType):
        if not assetType in ['BodyRig', 'FaceRig']:
            return None

        PathLineEdit = getattr(self, '%sVersionPathLineEdit' % assetType)

        filePath = str(PathLineEdit.text())

        if not os.path.exists(os.path.expandvars(filePath)):
            return None

        return maya.mel.eval('saveChanges("file -f -o \\"' + os.path.expandvars(
            filePath).replace('\\', '\\' * 4) + '\\"");')


    def __buildCombinedRig(self):

        # Character:
        character = self._getSelectedCharacter()

        # Get the paths:
        bodyRigPath = str(self.BodyRigVersionPathLineEdit.text())
        faceRigPath = str(self.FaceRigVersionPathLineEdit.text())

        # Check that we have the minimum requirements to run a build.
        if not bodyRigPath:

            message = ('You need at least a body rig to run a combined rig build.')

            rigUtils.log(msg=message, type='e')
            return False

        publish = self.PublishCombinedRigCheckBox.checkState()

        # Double check that's what the user wants to do.
        adj = 'build'
        if publish:
            adj += ' and publish'

        result = maya.cmds.confirmDialog(
            title='Combined Rig Build',
            message='Are you sure you want to %s a Combined Rig?' % adj,
            button=['Yes', 'No'],
            defaultButton='Yes',
            cancelButton='No',
            dismissString='No'
            )

        if not result == 'Yes':
            rigUtils.log(msg='Combined Rig %s cancelled.' % adj)
            return False

        # See if there are any changes that need saving.
        maya.mel.eval('saveChanges("file -f -new;");')

        # Lets build.
        return combinationBuilder.rigCombinationBuilder(
            character, bodyRigPath, faceRigPath, publish)



    def __characterSelectionChange(self):

        # Get the selected Character.
        character = str(self.CharacterAssetListWidget.currentItem().text())

        # Set an option variable so that the same character is selected next
        # time we open the GUI.
        self._setPreviousCharacterOptionVar(character)

        # Update the header.
        self._updateCharacterHeader(character)
        self._getAssetVersions(character)

        [self._updateVersionComboBoxes(assetType) for assetType in self.ASSET_TYPES]

        return True


    def __bodyRigVersionComboBoxSelectionChange(self):
        if not self._BodyRigVersionComboBoxBuilt: return None
        return self._updateVersionFields('BodyRig')


    def __faceRigVersionComboBoxSelectionChange(self):
        if not self._FaceRigVersionComboBoxBuilt: return None
        return self._updateVersionFields('FaceRig')


    def __refreshGUI(self):
        self._buildCharacterList()
        return self._refreshVersions()


    def __openSelectedBodyRig(self):
        return self._assetOpenPushButtonClicked('BodyRig')


    def __openSelectedFaceRig(self):
        return self._assetOpenPushButtonClicked('FaceRig')


    def closeEvent(self, QCloseEvent):
        QCloseEvent.accept()


    def launchBodyRigBuilderUI(self):
        return bodyUI.showBodyRigBuilderUI()


    def launchFaceBuilderUI(self):
        return faceUI.showFaceRigBuilderUI()


    def loadUI(self):
        thisFile = inspect.getfile(inspect.currentframe())
        thisDir = os.path.dirname(thisFile)
        uic.loadUi(os.path.join(thisDir, "resource", "rigCombinationBuilderUI.ui"),
                    self)


def QMainWindow():
    qMainWindow = maya.OpenMayaUI.MQtUtil.mainWindow()
    if qMainWindow == None:
        return None
    return sip.wrapinstance(long(qMainWindow), QtCore.QObject)

