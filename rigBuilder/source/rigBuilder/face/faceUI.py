'''
Created on 06/09/2013

@author: caleb.bell
'''

import maya.cmds
import maya.mel

import rigBuilder.rigUtils
from rigBuilder.body.bodyUI import *

from rigBuilder.face.faceRigEnv import *
import rigBuilder.face.faceCore as faceCore
import rigBuilder.face.faceIO as faceIO
import rigBuilder.face.facePublish as facePublish
import rigBuilder.face.utils.name as nameUtils
import rigBuilder.face.utils.blendShape as blendShapeUtils
import rigBuilder.face.utils.control as controlUtils
import rigBuilder.face.utils.skeleton as skeletonUtils


uiFile = os.path.join(FACE_RESOURCE_PATH, 'faceRigBuilder.ui')
uiFormClass, uiBaseClass = uic.loadUiType(uiFile)

OPTION_VARS = {
    'previousCharacter': 'frbPreviousCharacter',
    'previousModelPath': 'frbPreviousModelPath'
    }





class FaceRigBuilderUI(uiFormClass, uiBaseClass):

    ASSET_TYPES = [
        'SkeletonGuide',
        'GUIGuide',
        'BlendShapes',
        'DrivenKeys',
        'Preferences',
        'Weighting'
        ]

    FIELD_PREFIX = 'frb'

    def __init__(self, parent=getMayaWindow()):
        ''' Builds the GUI '''
        super(FaceRigBuilderUI, self).__init__(parent)
        self.setupUi(self)

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

        for assetType in self.ASSET_TYPES:
            self._updateVersionComboBoxes(assetType)

        # Tools:
        self._buildFaceGUIGuideTools()


    #===========================================================================
    # GUI Build / Update Methods
    #===========================================================================

    def _buildCharacterList(self):

        # Look for a previous character in option vars.
        prevChar = self._getPreviousCharacterOptionVar()

        # Populate the list.
        for i, character in enumerate(facePublish.getCharacterAssetList()):
            self.frbCharacterAssetListWidget.insertItem(i, character)

        if prevChar:
            if prevChar in facePublish.getCharacterAssetList():
                index = facePublish.getCharacterAssetList().index(prevChar)
                self.frbCharacterAssetListWidget.setCurrentRow(index)
        else:
            self.frbCharacterAssetListWidget.setCurrentRow(0)

        # Update the character header.
        self._updateCharacterHeader(self._getSelectedCharacter())

        # Set the built var.
        self._characterListBuilt = True

        return True


    def _buildFaceGUIGuideTools(self):

        # Templates.
        for templateName in controlUtils.getFaceGUITemplateNames():
            self.frbToolsFaceGUITemplateComboBox.addItem(templateName)

        # Control Types.
        for controlType in controlUtils.getFaceGUIControlNames():
            self.frbToolsFaceGUIControlTypeComboBox.addItem(controlType)

        # Control Shapes.
        for controlShape in controlUtils.getFaceGUIControlShapeNames():
            self.frbToolsFaceGUIControlShapeComboBox.addItem(controlShape)

        return True


    def _refreshVersions(self, assetTypes=list()):
        ''' This method refreshes the version data stored in the class, then
        triggers the combo box update, which triggers the rest of the GUI to
        update. If no asset types are passed in the method defaults to all asset
        types in self.ASSET_TYPES. '''

        print assetTypes

        if not assetTypes:
            assetTypes = self.ASSET_TYPES

        print assetTypes

        # Reset the revision dictionaries.
        self._getAssetVersions(self._getSelectedCharacter(), assetTypes)

        for assetType in assetTypes:
            # Catch in case something stupid happens.
            if not assetType in self.ASSET_TYPES:
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
        self.frbCharacterHeaderLabel.setText(character)
        return True


    def _updateModelFilePath(self, character):

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

        ListWidget = self.frbCharacterAssetListWidget
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

            self._assetVersions[assetType] = getattr(facePublish,
                'get%sVersions' % assetType)(character)

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

        previousCharacter = maya.cmds.optionVar(q=var)

        # Double Check that the character still exists in the character list
        # widget, otherwise we'll set it back to None and remove the option var.
        if not self._getCharacterIndexFromListWidget(previousCharacter):
            maya.cmds.optionVar(rm=var)
            return result

        result = previousCharacter
        return result


    def _getPreviousModelPathOptionVar(self, character):
        var = OPTION_VARS['previousModelPath']

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


    def _setPreviousCharacterOptionVar(self, character):

        var = OPTION_VARS['previousCharacter']
        maya.cmds.optionVar(sv=[var, character])
        return True


    def _setPreviousModelPathOptionVar(self, character, filePath):
        var = OPTION_VARS['previousModelPath']

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
        maya.cmds.optionVar(sv=(OPTION_VARS['previousCharacter'], character))

        # Update the header.
        self._updateCharacterHeader(character)
        self._updateModelFilePath(character)
        self._getAssetVersions(character)

        [self._updateVersionComboBoxes(assetType) for assetType in self.ASSET_TYPES]

        return True


    def on_actionGUIRefreshPushButtonClicked_triggered(self, *args):
        if not args: return None

        return self._refreshVersions


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


    def _assetPublishConfirm(self, assetType):

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

        if not self._assetPublishConfirm('BlendShapes'):
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

        if not self._assetPublishConfirm('DrivenKeys'):
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

        if not self._assetPublishConfirm('GUIGuide'):
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

        if not self._assetPublishConfirm('Preferences'):
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

        if not self._assetPublishConfirm('SkeletonGuide'):
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

        if not self._assetPublishConfirm('Weighting'):
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
        ctlIndex = str(self.frbToolsFaceGUIControlDescripitionSpinBox.value())
        addMirrored = self.frbToolsFaceGUIAddMirroredControlCheckBox.checkState()

        return controlUtils.addFaceGUIControl(
            ctlType, ctlShape, ctlPos, ctlDesc, ctlIndex, addMirrored
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

