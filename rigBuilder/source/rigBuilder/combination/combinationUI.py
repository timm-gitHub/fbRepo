import inspect
import os

from PyQt4 import QtGui, QtCore, uic
import sip

import maya.mel
import maya.cmds
import maya.OpenMayaUI

from rigBuilder import rigUtils
from rigBuilder.body import bodyUI
from rigBuilder.face import faceUI
from rigBuilder.face import facePublish
from rigBuilder.combination import combinationBuilder
from rigBuilder.combination import combinationPublish



RIG_COMBINATION_BUILDER_UI = None

def showRigCombinationBuilderUI():
    global RIG_COMBINATION_BUILDER_UI
    if RIG_COMBINATION_BUILDER_UI != None:
        RIG_COMBINATION_BUILDER_UI.show()
        return RIG_COMBINATION_BUILDER_UI

    qMainWindow = QMainWindow()
    RIG_COMBINATION_BUILDER_UI = RigCombinationBuilderUI(qMainWindow)
    RIG_COMBINATION_BUILDER_UI.show()
    return RIG_COMBINATION_BUILDER_UI


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
        # Populate the GUI
        #=======================================================================

        self._buildCharacterList()


        #=======================================================================
        # Hook up controls.
        #=======================================================================

        self.CharacterAssetListWidget.itemSelectionChanged.connect(
            self.__characterSelectionChange)

        self.RefreshButton.clicked.connect(self.__refereshGUI)

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

        # Look for a previous character in option vars.
#         prevChar = self._getPreviousCharacterOptionVar()
        prevChar = 'blinky'

        # Populate the list.
        for i, character in enumerate(facePublish.getCharacterAssetList()):
            self.CharacterAssetListWidget.insertItem(i, character)

        if prevChar:
            if prevChar in facePublish.getCharacterAssetList():
                index = facePublish.getCharacterAssetList().index(prevChar)
                self.CharacterAssetListWidget.setCurrentRow(index)
        else:
            self.CharacterAssetListWidget.setCurrentRow(0)

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

        ListWidget = self.CharacterAssetListWidget
        selectedCharacter = str(ListWidget.currentItem().text())
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

#         # Set an option variable so that the same character is selected next
#         # time we open the GUI.
#         maya.cmds.optionVar(sv=(OPTION_VARS['previousCharacter'], character))

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


    def __refereshGUI(self):
        return self._refreshVersions()


    def __openSelectedBodyRig(self):
        return self._assetOpenPushButtonClicked('BodyRig')


    def __openSelectedFaceRig(self):
        return self._assetOpenPushButtonClicked('FaceRig')


    def closeEvent(self, QCloseEvent):
        QCloseEvent.accept()


    def launchBodyRigBuilderUI(self):
        window = bodyUI.RigWindowUser()
        window.showWindow()


    def launchFaceBuilderUI(self):
        window = faceUI.FaceRigBuilderUI()
        window.show()


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

