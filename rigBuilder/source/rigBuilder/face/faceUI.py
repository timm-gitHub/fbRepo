'''
Created on 06/09/2013

@author: caleb.bell
'''

import maya.cmds
import maya.mel

import rigBuilder.rigUtils
import rigBuilder.sysUtils
from rigBuilder.body.bodyUI import *
from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.faceCore as faceCore
import rigBuilder.face.faceIO as faceIO
import rigBuilder.face.facePublish as facePublish
import rigBuilder.face.utils.name as nameUtils
import rigBuilder.face.utils.blendShape as blendShapeUtils
import rigBuilder.face.utils.control as controlUtils
import rigBuilder.face.utils.skeleton as skeletonUtils


ASSET_TYPES = [
    'SkeletonGuide',
    'GUIGuide',
    'BlendShapes',
    'DrivenKeys',
    'Preferences',
    'Weighting'
    ]


VAR_PREFIX                      = 'faceRigBuilder'
ASSET_COPY_PASTE_VAR            = '%sAssetCopyPaste' % VAR_PREFIX
PREV_CHAR_VAR                   = '%sPreviousCharacter' % VAR_PREFIX
PREV_MODEL_PATH_VAR             = '%sPreviousModelPath' % VAR_PREFIX
PREV_GUI_TEMPLATE_VAR           = '%sPreviousGUITemplate' % VAR_PREFIX
PREV_GUI_CTL_TYPE_VAR           = '%sPreviousControlType' % VAR_PREFIX
PREV_GUI_CTL_SHP_VAR            = '%sPreviousControlShape' % VAR_PREFIX
PREV_GUI_CTL_POS_VAR            = '%sPreviousControlPosition' % VAR_PREFIX
PREV_GUI_CTL_DESC_VAR           = '%sPreviousControlDescription' % VAR_PREFIX
PREV_GUI_CTL_INDEX_VAR          = '%sPreviousControlIndex' % VAR_PREFIX
PREV_GUI_CTL_MIRROR_VAR         = '%sPreviousControlAddMirrored' % VAR_PREFIX
PREV_GUI_CTL_MIRROR_MODE_VAR    = '%sPreviousControlMirrorMode' % VAR_PREFIX
PREV_GUI_CTL_FLIP_X_AXIS_VAR    = '%sPreviousControlFlipXAxis' % VAR_PREFIX



def assetPublishConfirmDialog(assetType):
    ''' Creates a standardized Maya confirmation dialog, confirming that the user
    wants to publish the asset type passed in as an argument. '''
    
    niceString = nameUtils.camelCaseToNiceString(assetType)

    result = maya.cmds.confirmDialog(
        title='%s Publish' % niceString,
        message='Are you sure you want to publish Face Rig %s?' % niceString,
        button=['Yes', 'No'],
        defaultButton='Yes',
        cancelButton='No',
        dismissString='No'
        )

    if not result == 'Yes':
        rigBuilder.rigUtils.log(msg='Face Rig %s publish cancelled.' % niceString)
        return False

    return True


def showFaceRigBuilderUI():
    qMainWindow = getMayaWindow()
    
    for child in qMainWindow.children():
        if not hasattr(child, 'isWindow'):
            continue
        
        if not child.isWindow():
            continue
        
        if child.windowTitle() == 'Face Rig Builder':
            if not child.isVisible():
                child.show()
            child.activateWindow()
            return True
            
    window = FaceRigBuilderUI()
    window.show()
    window.activateWindow()
    
    return True


def deleteAllFaceRigBuilderUIInstances():
    qMainWindow = getMayaWindow()
    
    for child in qMainWindow.children():
        if not hasattr(child, 'isWindow'):
            continue
        
        if not child.isWindow():
            continue
        
        if child.windowTitle() == 'Face Rig Builder':
            child.hide()
            child.setParent(None)
            del(child)

    return True


uiFile = os.path.join(FACE_RESOURCE_PATH, 'faceRigBuilder.ui')
uiFormClass, uiBaseClass = uic.loadUiType(uiFile)


class FaceRigBuilderUI(uiFormClass, uiBaseClass):


    FIELD_PREFIX = 'frb'

    def __init__(self, parent=getMayaWindow()):
        
        ''' Builds the GUI '''
        super(FaceRigBuilderUI, self).__init__(parent)
        self.setupUi(self)

        # Add the Character List Context Menu.
        self.frbCharacterAssetListWidget.setContextMenuPolicy(
            QtCore.Qt.CustomContextMenu)

        self.PopupMenu = rigBuilder.sysUtils.CreateCharacterPopUpMenu(
            parent=self.frbCharacterAssetListWidget)

        self.frbCharacterAssetListWidget.customContextMenuRequested.connect(
            self.PopupMenu._buildMenu)

        self.PopupMenu._characterNamePromptDialogCallback = self._refreshGUI


        # Add the Version Combo Box Context Menus
        for assetType in ASSET_TYPES:
            
            comboBox = getattr(self, '%s%sVersionComboBox' %(self.FIELD_PREFIX,
                assetType))
            pathField = getattr(self, '%s%sVersionPathLineEdit' %(self.FIELD_PREFIX,
                assetType))

            comboBox.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)

            contextMenu = CreateVersionCopyPastePopUpMenu(assetType,
                character = self._getSelectedCharacter, parent=comboBox,
                pathField=pathField)
            contextMenu._guiRefreshCallback = self._refreshGUI
            comboBox.customContextMenuRequested.connect(contextMenu._buildMenu)

            setattr(self, '%s%sVersionComboContextMenu' %(self.FIELD_PREFIX,
                assetType), contextMenu)
                

        # Get all the asset versions.
        self._assetVersions = dict()

        # Putting these in to make sure things don't fire at the wrong time.
        self._characterListBuilt = False

        self._SkeletonGuideVersionComboBoxBuilt = False
        self._GUIGuideVersionComboBoxBuilt = False
        self._BlendShapesVersionComboBoxBuilt = False
        self._DrivenKeysVersionComboBoxBuilt = False
        self._PreferencesVersionComboBoxBuilt = False
        self._WeightingVersionComboBoxBuilt = False

        # Populate the character list.
        self._buildCharacterList()

        # Look up the asset versions in the file system.
        self._getAssetVersions(self._getSelectedCharacter())

        self._updateModelFilePath(self._getSelectedCharacter())

        for assetType in ASSET_TYPES:
            self._updateVersionComboBoxes(assetType)

        # Tools:
        self._buildFaceGUIGuideTools()


    #===========================================================================
    # GUI Build / Update Methods
    #===========================================================================

    def _buildCharacterList(self):

        self._characterListBuilt = False
        
        # Clear the list.
        self.frbCharacterAssetListWidget.clear()

        # Get the list of character assets.
        charAssets = rigBuilder.sysUtils.getCharacterAssetList()

        # Look for a previous character in option vars.
        prevChar = self._getPreviousCharacterOptionVar()

        # Populate the list.
        for i, character in enumerate(charAssets):
            self.frbCharacterAssetListWidget.insertItem(i, character)

        # Set the index.
        index = 0
        if prevChar and (prevChar in charAssets):
            index = charAssets.index(prevChar)
        else:
            self._removePreviousCharacterOptionVar()

        self.frbCharacterAssetListWidget.setCurrentRow(index)

        # Update the character header.
        self._updateCharacterHeader(self._getSelectedCharacter())

        # Set the built var.
        self._characterListBuilt = True

        return True


    def _buildFaceGUIGuideTools(self):

        #=======================================================================
        # Setup the Option Var setters.
        #=======================================================================
        
        # GUI Template.
        self.frbToolsFaceGUITemplateComboBox.currentIndexChanged['QString'].connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_TEMPLATE_VAR, str(x)]))
        
        # Control Type.
        self.frbToolsFaceGUIControlTypeComboBox.currentIndexChanged['QString'].connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_TYPE_VAR, str(x)]))
            
        # Control Shape.
        self.frbToolsFaceGUIControlShapeComboBox.currentIndexChanged['QString'].connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_SHP_VAR, str(x)]))
            
        # Control Position.
        self.frbToolsFaceGUIControlPositionComboBox.currentIndexChanged['QString'].connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_POS_VAR, str(x)]))
        
        # Control Description.
        self.frbToolsFaceGUIControlDescriptionLineEdit.textEdited.connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_DESC_VAR, str(x)]))
        
        # Control Index.
        self.frbToolsFaceGUIControlIndexSpinBox.valueChanged['QString'].connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_INDEX_VAR, str(x)]))
        
        # Add Mirrored Control CB.
        self.frbToolsFaceGUIAddMirroredControlCheckBox.stateChanged.connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_MIRROR_VAR, x]))
        
        # Mirror Mode Radio.
        self.frbToolsFaceGUIControlMirrorDirectionRadio0.clicked.connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_MIRROR_MODE_VAR, 0]))
        self.frbToolsFaceGUIControlMirrorDirectionRadio1.clicked.connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_MIRROR_MODE_VAR, 1]))
        
        # Flip X Axis CB.
        self.frbToolsFaceGUIControlMirrorFlipXAxisCheckBox.stateChanged.connect(
            lambda x: maya.cmds.optionVar(sv=[PREV_GUI_CTL_FLIP_X_AXIS_VAR, x]))
        
        
        #=======================================================================
        # Populate the combo boxes.
        #=======================================================================

        # Templates.
        templateNames = controlUtils.getFaceGUITemplateNames()
        prevTemplate = maya.cmds.optionVar(q=PREV_GUI_TEMPLATE_VAR)
        
        for templateName in templateNames:
            self.frbToolsFaceGUITemplateComboBox.addItem(templateName)
        
        if prevTemplate in templateNames:
            self.frbToolsFaceGUITemplateComboBox.setCurrentIndex(
                templateNames.index(prevTemplate))


        # Control Types.
        ctlTypes = controlUtils.getFaceGUIControlNames()
        prevCtlType = maya.cmds.optionVar(q=PREV_GUI_CTL_TYPE_VAR)
        
        for ctlType in ctlTypes:
            self.frbToolsFaceGUIControlTypeComboBox.addItem(ctlType)

        if prevCtlType in ctlTypes:
            self.frbToolsFaceGUIControlTypeComboBox.setCurrentIndex(
                ctlTypes.index(prevCtlType))


        # Control Shapes.
        ctlShapes = controlUtils.getFaceGUIControlShapeNames()
        prevCtlShape = maya.cmds.optionVar(q=PREV_GUI_CTL_SHP_VAR)
        
        for ctlShape in ctlShapes:
            self.frbToolsFaceGUIControlShapeComboBox.addItem(ctlShape)

        if prevCtlShape in ctlShapes:
            self.frbToolsFaceGUIControlTypeComboBox.setCurrentIndex(
                ctlShapes.index(prevCtlShape))


        # Control Position
        prevCtlPos = maya.cmds.optionVar(q=PREV_GUI_CTL_POS_VAR)
        if prevCtlPos:
            self.frbToolsFaceGUIControlPositionComboBox.setCurrentIndex(
                ['C', 'L', 'R'].index(prevCtlPos))
        
        # Control Description
        prevCtlDesc = maya.cmds.optionVar(q=PREV_GUI_CTL_DESC_VAR)
        if prevCtlDesc:
            self.frbToolsFaceGUIControlDescriptionLineEdit.setText(prevCtlDesc)
        
        # Control Index
        prevCtlIndex = maya.cmds.optionVar(q=PREV_GUI_CTL_INDEX_VAR)
        self.frbToolsFaceGUIControlIndexSpinBox.setValue(int(prevCtlIndex))
        
        # Add Mirrored Control
        prevAddMirrored = maya.cmds.optionVar(q=PREV_GUI_CTL_MIRROR_VAR)
        self.frbToolsFaceGUIAddMirroredControlCheckBox.setCheckState(int(prevAddMirrored))

        # Mirror Mode
        prevMirrorMode = maya.cmds.optionVar(q=PREV_GUI_CTL_MIRROR_MODE_VAR)
        getattr(self, '%sToolsFaceGUIControlMirrorDirectionRadio%s' %(
            self.FIELD_PREFIX, str(prevMirrorMode))).setChecked(True)

        # Flip X Axis
        prevFlipX = maya.cmds.optionVar(q=PREV_GUI_CTL_FLIP_X_AXIS_VAR)
        self.frbToolsFaceGUIControlMirrorFlipXAxisCheckBox.setCheckState(int(prevFlipX))

        return True


    def _refreshGUI(self):
        self._buildCharacterList()
        self._refreshVersions()
        self._updateModelFilePath(self._getSelectedCharacter())
        

    def _refreshVersions(self, assetTypes=list()):
        ''' This method refreshes the version data stored in the class, then
        triggers the combo box update, which triggers the rest of the GUI to
        update. If no asset types are passed in the method defaults to all asset
        types in ASSET_TYPES. '''

        if not assetTypes:
            assetTypes = ASSET_TYPES

        # Reset the revision dictionaries.
        self._getAssetVersions(self._getSelectedCharacter(), assetTypes)

        for assetType in assetTypes:
            # Catch in case something stupid happens.
            if not assetType in ASSET_TYPES:
                continue
            # Update the Combo Boxes.
            self._updateVersionComboBoxes(assetType)

        return True


    def _resetBuildVersionCombos(self, assetType):

        return getattr(self, '%sBuild%sVersionComboBox' % (self.FIELD_PREFIX,
            assetType)).clear()


    def _resetVersionFields(self, assetType):

        for field in ['ComboBox', 'PathLineEdit']:
            field = getattr(self, '%s%sVersion%s' % (self.FIELD_PREFIX,
                assetType, field))

            # Combo Box/
            if isinstance(field, QtGui.QComboBox): field.clear()

            # Line Edit.
            elif isinstance(field, QtGui.QLineEdit): field.setText(str())

            else: continue

        return True


    def _updateCharacterHeader(self, character):
        if not character:
            character = str()
        self.frbCharacterHeaderLabel.setText(character)
        return True


    def _updateModelFilePath(self, character):
        if not character:
            return False

        modelFilePath = self._getPreviousModelPathOptionVar(character)

        if modelFilePath:
            self.frbBuildFaceModelPathLineEdit.setText(modelFilePath)
        else:
            self.frbBuildFaceModelPathLineEdit.clear()

        return True


    def _updateVersionComboBoxes(self, assetType):

        setattr(self, '_%sVersionComboBoxBuilt' % assetType, False)

        versions = self._assetVersions[assetType]

        for i, comboBox in enumerate(['%s%s', '%sBuild%s']):

            comboBox = getattr(self, '%sVersionComboBox' % comboBox % (
                self.FIELD_PREFIX, assetType))

            if not i:
                self._resetVersionFields(assetType)
            else:
                self._resetBuildVersionCombos(assetType)

            if not versions.keys():
                continue

            [comboBox.addItem(version) for version in sorted(versions.keys())]

        setattr(self, '_%sVersionComboBoxBuilt' % assetType, True)

        comboBox = getattr(self, '%s%sVersionComboBox' % (self.FIELD_PREFIX,
            assetType))

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

        versionComboBox = getattr(self, '%s%sVersionComboBox' % (
            self.FIELD_PREFIX, assetType))
        pathLineEdit = getattr(self, '%s%sVersionPathLineEdit' % (
            self.FIELD_PREFIX, assetType))

        versions = self._assetVersions[assetType]

        if not versions.keys():
            self._resetVersionFields(assetType)
            self._resetBuildVersionCombos(assetType)
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

        ListWidget = self.frbCharacterAssetListWidget

        for i in range(ListWidget.count()):
            if not ListWidget.item(i).text() == character: continue
            return i

        return None


    def _getSelectedCharacter(self):
        ''' Returns the currently selected character as a string. '''

        selectedCharacter = None
        ListWidget = self.frbCharacterAssetListWidget
        CurrentItem = ListWidget.currentItem()
        if not CurrentItem:
            return selectedCharacter
        selectedCharacter = str(CurrentItem.text())
        return selectedCharacter


    def _getAssetVersions(self, character, assetTypes=list()):
        ''' Iterates over the supplied asset types, and gets the publish version
        data which is used to populate the GUI. If no asset types are passed in
        the method defaults to all asset types in ASSET_TYPES. '''

        if not assetTypes:
            assetTypes = ASSET_TYPES

        for assetType in assetTypes:
            # Catch just in case something stupid happens.
            if not assetType in ASSET_TYPES:
                continue

            # Catch for situation where there are no characters yet.
            if not character:
                self._assetVersions[assetType] = dict()
                continue
            
            self._assetVersions[assetType] = getattr(facePublish,
                'get%sVersions' % assetType)(character)

        return True


    #===========================================================================
    # Option Variable Getters / Setters
    #===========================================================================

    def _getPreviousCharacterOptionVar(self):
        ''' Look for a previously selected character in option vars. '''

        result = None
        var = PREV_CHAR_VAR

        if not maya.cmds.optionVar(exists=var):
            return result

        result = maya.cmds.optionVar(q=var)
        return result


    def _getPreviousModelPathOptionVar(self, character):
        var = PREV_MODEL_PATH_VAR

        filePath = None

        if not maya.cmds.optionVar(ex=var):
            return filePath

        for i, v in enumerate(maya.cmds.optionVar(q=var)):
            value = eval(v)

            # If it's not the right character, keep going.
            if not value[0] == character:
                continue

            # If it is the right character, but the path doesn't exist, remove
            # the value from the optionVar array.
            if not os.path.exists(value[1]):
                maya.cmds.optionVar(rfa=[var, i])

            # Success! Set the file Path variable.
            else:
                filePath = value[1]

        return filePath


    def _removePreviousCharacterOptionVar(self):
        var = PREV_CHAR_VAR
        return maya.cmds.optionVar(rm=var)


    def _setPreviousCharacterOptionVar(self, character):

        var = PREV_CHAR_VAR
        maya.cmds.optionVar(sv=[var, character])
        return True


    def _setPreviousModelPathOptionVar(self, character, filePath):
        var = PREV_MODEL_PATH_VAR

        # First check the file path is valid.
        if not os.path.exists(filePath):
            return False

        # Then check if the optionVar exists already.
        if maya.cmds.optionVar(ex=var):
            # We need to trim it if it's too big. We pop them off the front
            # because those are the oldest. Currently I'm storing face model
            # paths for 5 characters.
            arraySize = maya.cmds.optionVar(arraySize=var)
            for i in range(4, arraySize):
                maya.cmds.optionVar(rfa=[var, 0])

        # Set the variable.
        maya.cmds.optionVar(sva=[var, str((character, filePath))])

        return True


    #===========================================================================
    # GUI Update Actions
    #===========================================================================

    def on_actionCharacterSelectionChange_triggered(self, *args):
        if not args or not self._characterListBuilt: return None

        # Get the selected Character.
        character = str(self.frbCharacterAssetListWidget.currentItem().text())

        # Set an option variable so that the same character is selected next
        # time we open the GUI.
        self._setPreviousCharacterOptionVar(character)

        # Update the header.
        self._updateCharacterHeader(character)
        self._updateModelFilePath(character)
        self._getAssetVersions(character)

        [self._updateVersionComboBoxes(assetType) for assetType in ASSET_TYPES]

        return True


    def on_actionGUIRefreshPushButtonClicked_triggered(self, *args):
        if not args: return None
        return self._refreshGUI()


    #===========================================================================
    # Generic Field GUI Actions
    #===========================================================================

    def _assetOpenPushButtonClicked(self, assetType):
        if not assetType in ['SkeletonGuide', 'GUIGuide', 'BlendShapes']:
            return None

        PathLineEdit = getattr(self, '%s%sVersionPathLineEdit' % (
            self.FIELD_PREFIX, assetType))

        filePath = str(PathLineEdit.text())

        if not os.path.exists(os.path.expandvars(filePath)):
            return None

        return maya.mel.eval('saveChanges("file -f -o \\"' + os.path.expandvars(
            filePath).replace('\\', '\\' * 4) + '\\"");')


    #===========================================================================
    # BlendShapes Field GUI Actions
    #===========================================================================

    def on_actionBlendShapesComboBoxSelectionChange_triggered(self, *args):
        if not args or not self._BlendShapesVersionComboBoxBuilt: return None
        return self._updateVersionFields('BlendShapes')


    def on_actionBlendShapesOpenPushButtonClicked_triggered(self, *args):
        if not args: return None
        return self._assetOpenPushButtonClicked('BlendShapes')


    def on_actionBlendShapesPublishPushButtonClicked_triggered(self, *args):
        if not args: return None

        if not assetPublishConfirmDialog('BlendShapes'):
            return False

        facePublish.publishBlendShapesFromScene(
            character=self._getSelectedCharacter(),
            description=str()
            )

        self._refreshVersions(['BlendShapes'])
        return True


    #===========================================================================
    # Driven Keys Field GUI Actions
    #===========================================================================

    def on_actionDrivenKeysComboBoxSelectionChange_triggered(self, *args):
        if not args or not self._DrivenKeysVersionComboBoxBuilt: return None
        return self._updateVersionFields('DrivenKeys')


    def on_actionDrivenKeysLoadPushButtonClicked_triggered(self, *args):
        if not args: return None

        filePath = str(self.frbDrivenKeysVersionPathLineEdit.text())
        if not os.path.exists(os.path.expandvars(filePath)):
            return None

        faceIO.importSceneDrivenKeysData(filePath, verbose=True)


    def on_actionDrivenKeysPublishPushButtonClicked_triggered(self, *args):
        if not args: return None

        if not assetPublishConfirmDialog('DrivenKeys'):
            return False

        facePublish.publishDrivenKeysDataFromScene(
            character=self._getSelectedCharacter(),
            description=str()
            )

        self._refreshVersions(['DrivenKeys'])
        return True


    #===========================================================================
    # GUI Guide Field GUI Actions
    #===========================================================================

    def on_actionGUIGuideComboBoxSelectionChange_triggered(self, *args):
        if not args or not self._GUIGuideVersionComboBoxBuilt: return None
        return self._updateVersionFields('GUIGuide')


    def on_actionGUIGuideOpenPushButtonClicked_triggered(self, *args):
        if not args: return None
        return self._assetOpenPushButtonClicked('GUIGuide')


    def on_actionGUIGuidePublishPushButtonClicked_triggered(self, *args):
        if not args: return None

        if not assetPublishConfirmDialog('GUIGuide'):
            return False

        facePublish.publishGuideFromScene(
            character=self._getSelectedCharacter(),
            guideType='gui',
            description=str()
            )

        self._refreshVersions(['GUIGuide'])
        return True


    #===========================================================================
    # Preferences Field GUI Actions
    #===========================================================================

    def on_actionPreferencesComboBoxSelectionChange_triggered(self, *args):
        if not args or not self._PreferencesVersionComboBoxBuilt: return None
        return self._updateVersionFields('Preferences')


    def on_actionPreferencesLoadPushButtonClicked_triggered(self, *args):
        if not args: return None

        filePath = str(self.frbPreferencesVersionPathLineEdit.text())
        if not os.path.exists(os.path.expandvars(filePath)):
            return None

        return faceIO.importAttributeData(FACE_PREFERENCE_GRP, filePath, verbose=True)


    def on_actionPreferencesPublishPushButtonClicked_triggered(self, *args):
        if not args: return None

        if not assetPublishConfirmDialog('Preferences'):
            return False

        facePublish.publishPreferenceDataFromScene(
            character=self._getSelectedCharacter(),
            description=str()
            )

        self._refreshVersions(['Preferences'])
        return True


    #===========================================================================
    # Skeleton Field GUI Actions
    #===========================================================================

    def on_actionSkeletonGuideComboBoxSelectionChange_triggered(self, *args):
        if not args or not self._SkeletonGuideVersionComboBoxBuilt: return None

        return self._updateVersionFields('SkeletonGuide')


    def on_actionSkeletonGuideOpenPushButtonClicked_triggered(self, *args):
        if not args: return None
        return self._assetOpenPushButtonClicked('SkeletonGuide')


    def on_actionSkeletonGuidePublishPushButtonClicked_triggered(self, *args):
        if not args: return None

        if not assetPublishConfirmDialog('SkeletonGuide'):
            return False

        facePublish.publishGuideFromScene(
            character=self._getSelectedCharacter(),
            guideType='skeleton',
            description=str()
            )

        self._refreshVersions(['SkeletonGuide'])
        return True


    #===========================================================================
    # Weighting Field GUI Actions
    #===========================================================================

    def on_actionWeightingComboBoxSelectionChange_triggered(self, *args):
        if not args or not self._WeightingVersionComboBoxBuilt: return None
        return self._updateVersionFields('Weighting')


    def on_actionWeightingLoadPushButtonClicked_triggered(self, *args):
        if not args: return None

        filePath = str(self.frbWeightingVersionPathLineEdit.text())
        if not os.path.exists(os.path.expandvars(filePath)):
            return None

        return bodyIO.importSkinBySkin(filePath, after=True)


    def on_actionWeightingPublishPushButtonClicked_triggered(self, *args):
        if not args: return None

        if not assetPublishConfirmDialog('Weighting'):
            return False

        facePublish.publishWeightingDataFromScene(
            character=self._getSelectedCharacter(),
            description=str()
            )

        self._refreshVersions(['Weighting'])
        return True


    #===========================================================================
    # Tools Actions
    #===========================================================================

    def on_actionToolsFaceGUITemplateOpenPushButtonClicked_triggered(self, *args):
        if not args: return None

        return controlUtils.openFaceGUITemplate(
            str(self.frbToolsFaceGUITemplateComboBox.currentText())
            )


    def on_actionToolsFaceGUIAddControlPushButtonClicked_triggered(self, *args):
        if not args: return None

        ctlType = str(self.frbToolsFaceGUIControlTypeComboBox.currentText())
        ctlShape = str(self.frbToolsFaceGUIControlShapeComboBox.currentText())
        ctlPos = str(self.frbToolsFaceGUIControlPositionComboBox.currentText())
        ctlDesc = str(self.frbToolsFaceGUIControlDescriptionLineEdit.text())
        ctlIndex = str(self.frbToolsFaceGUIControlIndexSpinBox.value())
        addMirrored = self.frbToolsFaceGUIAddMirroredControlCheckBox.checkState()

        return controlUtils.addFaceGUIControl(
            ctlType, ctlShape, ctlPos, ctlDesc, ctlIndex, addMirrored
            )


    def on_actionToolsFaceGUIControlMirrorSelectedButtonClicked_triggered(self, *args):
        if not args: return None
        return controlUtils.mirrorSelectedGUIControls(flipXAxis=
            self.frbToolsFaceGUIControlMirrorFlipXAxisCheckBox.checkState())
        
        
    def on_actionToolsFaceGUIControlMirrorAllButtonClicked_triggered(self, *args):
        if not args: return None
        return controlUtils.mirrorAllGUIControls(
            mode=abs(1 - self.frbToolsFaceGUIControlMirrorDirectionRadio0.isChecked()),
            flipXAxis=self.frbToolsFaceGUIControlMirrorFlipXAxisCheckBox.checkState()
            )


    def on_actionToolsSkeletonGuideBuildSkeletonPushButtonClicked_triggered(self, *args):
        if not args: return None
        return skeletonUtils.FaceSkeletonBuilder().buildSkeleton()


    def on_actionToolsBlendShapeLayoutPushButtonClicked_triggered(self, *args):
        if not args: return None
        return blendShapeUtils.createStandardShapeLayout()


    def on_actionBuildFaceModelPathBrowseToolButtonClicked_triggered(self, *args):
        if not args: return None

        filters = ("Maya Files (*.ma *.mb);;Maya ASCII (*.ma);;"
            "Maya Binary (*.mb)")

        filePath = maya.cmds.fileDialog2(cap='Browse...', dir=rigEnv.ROOTCHAR, fm=1, ff=filters)

        if filePath and os.path.exists(filePath[0]):
            # Set the field text.
            self.frbBuildFaceModelPathLineEdit.setText(filePath[0])
            # And the option var.
            self._setPreviousModelPathOptionVar(self._getSelectedCharacter(), filePath[0])

        return True


    def on_actionBuildFaceRigPushButtonClicked_triggered(self, *args):
        if not args: return None

        # Character:
        character = self._getSelectedCharacter()

        # Get the paths:
        modelPath = str(self.frbBuildFaceModelPathLineEdit.text())
        skeletonGuidePath = str(self.frbBuildSkeletonGuideVersionPathLineEdit.text())
        guiGuidePath = str(self.frbBuildGUIGuideVersionPathLineEdit.text())
        blendShapesPath = str(self.frbBuildBlendShapesVersionPathLineEdit.text())
        drivenKeysPath = str(self.frbBuildDrivenKeysVersionPathLineEdit.text())
        attributesPath = str(self.frbBuildPreferencesVersionPathLineEdit.text())
        weightingPath = str(self.frbBuildWeightingVersionPathLineEdit.text())

        # Check that we have the minimum requirements to run a build.
        if not (modelPath and skeletonGuidePath):

            message = ('You need at least a model and a guide to run a face'
                ' rig build.')

            rigBuilder.rigUtils.log(msg=message, type='e')
            return False

        publish = self.frbBuildPublishFaceRigCheckBox.checkState()

        # Double check that's what the user wants to do.
        adj = 'build'
        if publish:
            adj += ' and publish'

        result = maya.cmds.confirmDialog(
            title='Face Rig Build',
            message='Are you sure you want to %s a Face Rig?' % adj,
            button=['Yes', 'No'],
            defaultButton='Yes',
            cancelButton='No',
            dismissString='No'
            )

        if not result == 'Yes':
            rigBuilder.rigUtils.log(msg='Face Rig %s cancelled.' % adj)
            return False

        # See if there are any changes that need saving.
        maya.mel.eval('saveChanges("file -f -new;");')

        # Lets build.
        return faceCore.faceRigBuilder(character, modelPath, skeletonGuidePath,
            guiGuidePath, blendShapesPath, drivenKeysPath, attributesPath,
            weightingPath, publish)


    def on_actionToolsBlendShapeChannelBoxPushButtonClicked_triggered(self, *args):
        if not args: return None
        assert maya.cmds.ls(sl=True), 'Nothing is selected...'
        bsList = blendShapeUtils.getRelatedBlendShapeForSelection()
        assert bsList, 'No blendShape(s) related to selection...'
        for bs in bsList:
            createChannelBoxForNode(bs)
        return True


    def on_actionToolsInterfaceNodeChannelBoxPushButtonClicked_triggered(self, *args):
        if not args: return None
        node = 'interface_grp'
        assert maya.cmds.objExists(node), "Can't find node '%s'..." % node
        return createChannelBoxForNode(node)


    def on_actionToolsPreferenceNodeChannelBoxPushButtonClicked_triggered(self, *args):
        if not args: return None
        node = 'preference_grp'
        assert maya.cmds.objExists(node), "Can't find node '%s'..." % node
        return createChannelBoxForNode(node)


    def on_actionBuildFaceModelPathOpenPushButtonClicked_triggered(self, *args):
        if not args: return None

        filePath = str(self.frbBuildFaceModelPathLineEdit.text())
        if not os.path.exists(os.path.expandvars(filePath)):
            return None

        return maya.mel.eval('saveChanges("file -f -o \\"' + os.path.expandvars(
            filePath).replace('\\', '\\' * 4) + '\\"");')


class CreateVersionCopyPastePopUpMenu(QtGui.QMenu):
    ''' This is a generic pop-up menu that will be used across all rigging guis
    character lists to allow for adding a new character easily. '''
    
    PUBLISH_FUNCTIONS = {
        'SkeletonGuide' : facePublish.publishGuide,
        'GUIGuide'      : facePublish.publishGuide,
        'BlendShapes'   : facePublish.publishBlendShapes,
        'DrivenKeys'    : facePublish.publishDrivenKeysData,
        'Preferences'   : facePublish.publishPreferenceData,
        'Weighting'     : facePublish.publishWeightingData
    }
    
    def __init__(self, assetType, character=None, parent=None, pathField=None):
        super(CreateVersionCopyPastePopUpMenu, self).__init__(parent)
        
        self._character = character
        self._assetType = assetType
        self._pathField = pathField

        # Make a nice name for the menu text.        
        if not assetType is 'GUIGuide':
            self._assetTypeNice = nameUtils.camelCaseToNiceString(assetType)
        else: # Mundge
            self._assetTypeNice = 'GUI Guide'

        copyAction  = self.addAction('Copy %s Version' % self._assetTypeNice)
        pasteAction = self.addAction('Paste %s Version' % self._assetTypeNice)
        
        copyAction.triggered.connect(self._copyAssetVersion)
        pasteAction.triggered.connect(self._pasteAssetVersion)
        

    def _buildMenu(self):
         
        posX  = QtGui.QCursor().pos().x() - self.pos().x()
        posY  = QtGui.QCursor().pos().y() - self.pos().y() - 20
 
        self.exec_(self.mapToGlobal(QtCore.QPoint(posX, posY)))

        return True


    def _createDefaultBuffer(self):
        ''' Create a default buffer '''
        cpBuffer = dict()
        for assetType in ASSET_TYPES:
            cpBuffer[assetType] = None
        return cpBuffer

    def _copyAssetVersion(self):
        ''' Copies the path (if valid) into an option variable that can be called
        upon to paste into another character. '''
        
        # Create a default buffer.
        cpBuffer = self._createDefaultBuffer()
        
        # Overwrite it with anything that might already be stored in option vars.
        if maya.cmds.optionVar(ex=ASSET_COPY_PASTE_VAR):
            cpBuffer = eval(maya.cmds.optionVar(q=ASSET_COPY_PASTE_VAR))
        
        # Query the path field.
        path = self._pathField.text()
        if os.path.exists(path):
            cpBuffer[self._assetType] = str(path)
        
        return maya.cmds.optionVar(sv=[ASSET_COPY_PASTE_VAR, str(cpBuffer)])
        

    def _pasteAssetVersion(self):
        ''' Does lookup on option variable and "pastes" a publish to the new
        destination. '''
        
        # Create a default buffer.
        cpBuffer = self._createDefaultBuffer()
                
        # Overwrite it with anything that might already be stored in option vars.
        if maya.cmds.optionVar(ex=ASSET_COPY_PASTE_VAR):
            cpBuffer = eval(maya.cmds.optionVar(q=ASSET_COPY_PASTE_VAR))

        # Confirm that there is something in the buffer for that asset type.
        if not cpBuffer[self._assetType]: return False
        
        # Confirm that the path exists.
        if not os.path.exists(cpBuffer[self._assetType]): return False

        # Confirm that the user wants to publish.
        if not assetPublishConfirmDialog(self._assetType) : return False

        # Construct Keyword Arguments.
        kwargs = {
            'character' : self._character(),
            'source'    : cpBuffer[self._assetType]
        }
        if 'Guide' in self._assetType:
            kwargs['guideType'] = self._assetType[:-5].lower()
        
        # Publish.
        self.PUBLISH_FUNCTIONS[self._assetType](**kwargs)

        # Refresh Callback.
        return self._guiRefreshCallback()


    def _guiRefreshCallback(self):
        return True


def createChannelBoxForNode(node):
    assert cmds.objExists(node), "Node %s does not exist!!!" % node

    selectionConnectionName = ("%s_rigBuilderSelectionConnection" % node)
    selectionConnection = None
    if cmds.selectionConnection(selectionConnectionName, ex=True):
        selectionConnection = selectionConnectionName
    else:
        selectionConnection = cmds.selectionConnection(selectionConnectionName)

    cmds.selectionConnection(selectionConnectionName, e=True, obj=node)

    channelBoxWindow = cmds.window(t=node)
    formLayout = cmds.formLayout(p=channelBoxWindow)
    channelBox = cmds.channelBox(p=formLayout, mlc=selectionConnection)

    cmds.formLayout(formLayout,
                     e=True,
                     af=[(channelBox, "top", 0),
                         (channelBox, "bottom", 0),
                         (channelBox, "left", 0),
                         (channelBox, "right", 0)])

    return cmds.showWindow(channelBoxWindow)

