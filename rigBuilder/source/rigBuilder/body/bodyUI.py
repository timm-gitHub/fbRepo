"""

    User interface for rigging tool
    -------------------------------
    
    Author: Evan (The Man) Jacobson
    
"""

import sip, sys, os, time, re, inspect, tempfile, shutil, bodyModel, bodyClasses, bodyPublish, bodyIO, logging
import maya.OpenMayaUI as apiUI
import maya.cmds as cmds
import maya.mel as mel
from PyQt4 import QtGui, QtCore, uic
from xml.dom import minidom
from rigBuilder import rigUtils, rigEnv, sysUtils

uic.properties.logger.setLevel(logging.WARNING)
uic.uiparser.logger.setLevel(logging.WARNING)

initfile                        = inspect.getfile(inspect.currentframe())
initdir                         = os.path.dirname(initfile)
riguiuser                       = '%s/ui/rigWinUser.ui' % initdir
form_class_user,base_class_user = uic.loadUiType(riguiuser)

reload(rigUtils)
reload(bodyModel)
reload(bodyClasses)
reload(bodyIO)
reload(bodyPublish)
reload(rigEnv)

def confirmDialog(msg='Confirm?',buttons=2,submit=False):
    """For convenience - Simple Qt Dialog with message and two push buttons."""
    
    dialog  = QtGui.QDialog(None, QtCore.Qt.CustomizeWindowHint | QtCore.Qt.WindowTitleHint)
    text    = QtGui.QLabel(msg)
    
    # do the buttons
    if buttons == 2:
        btnBox  = QtGui.QDialogButtonBox(QtGui.QDialogButtonBox.Cancel | QtGui.QDialogButtonBox.Ok)
        QtCore.QObject.connect(btnBox, QtCore.SIGNAL('rejected()'), dialog,QtCore.SLOT('reject()'))
    
    elif buttons == 1:
        btnBox  = QtGui.QDialogButtonBox(QtGui.QDialogButtonBox.Ok)
    
    QtCore.QObject.connect(btnBox, QtCore.SIGNAL('accepted()'), dialog,QtCore.SLOT('accept()'))
    
    # do the checkbox
    if submit:
        submitCB = QtGui.QCheckBox('Submit for Approval')
    
    # add to layout
    layout = QtGui.QVBoxLayout()
    layout.addWidget(text)
    layout.addWidget(btnBox)
    if submit: layout.addWidget(submitCB)
    text.setAlignment(QtCore.Qt.AlignHCenter)
    btnBox.setCenterButtons(True)
    dialog.setLayout(layout)
    dialog.setWindowTitle('Confirm')
    
    linecount = msg.count('\n')
    height = 110 + (13*linecount)
    dialog.setFixedSize(400,height)
    
    dialog.exec_()
    
    if submit: return dialog.result(), submitCB.checkState()
    
    return dialog.result()


def getMayaWindow():
    """Retrieve Mayas' main window for use with PyQt"""
    
    ptr = apiUI.MQtUtil.mainWindow()

    if ptr is not None:
        return sip.wrapinstance(long(ptr),QtCore.QObject)


def toQtObject(mayaname):
    """Retrieve Maya UI object for use with PyQt"""
    
    ptr = apiUI.MQtUtil.findControl(mayaname)

    if ptr is None:
        ptr = apiUI.MQtUtil.findLayout(mayaname)
    if ptr is None:
        ptr = apiUI.MQtUtil.findMenuItem(mayaname)
    if ptr is not None:
        return sip.wrapinstance(long(ptr),QtCore.QObject)


class BaseRigWindow(object):
    

    def charClicked(self):
        """Update component table view currently selected characters component info."""
        
        char = self.currentCharacter()
        data = char.getLayoutData()
        
        self.btnComponentAdd.setDisabled(False)
        self.btnComponentRemove.setDisabled(False)
        self.btnGuideBuild.setDisabled(False)
        self.btnRigBuild.setDisabled(False)
        self.btnScriptBuild.setDisabled(False)
        self.btnOpenLatest.setDisabled(False)
        self.checkBoxDebug.setDisabled(False)
        self.checkBoxDebug.setChecked(False)
        self.checkBoxPublish.setDisabled(False)
        self.checkBoxPublish.setChecked(False)
        self.checkBoxPublishEnableBuild.setDisabled(False)
        self.checkBoxPublishEnableBuild.setChecked(False)
        self.checkBoxPublishEnableLayout.setDisabled(False)
        self.checkBoxPublishEnableLayout.setChecked(False)
        self.checkBoxPublishEnableGuide.setDisabled(False)
        self.checkBoxPublishEnableGuide.setChecked(False)
        self.checkBoxReferenceGeo.setDisabled(False)
        self.checkBoxReferenceGeo.setChecked(False)
        self.checkBoxCombined.setDisabled(False)
        self.checkBoxCombined.setChecked(False)
        self.checkBoxKeepGuide.setDisabled(False)
        self.checkBoxKeepGuide.setChecked(False)
        self.checkBoxDeformers.setChecked(True)
        self.checkBoxDeformers.setDisabled(False)
        self.checkBoxControlData.setChecked(True)
        self.checkBoxControlData.setDisabled(False)
        
        self.refreshComponents()
        
        if len(self.currentCharacters()) > 1:
            self.labelChar.setText('%s et al' % char.name)
        else:
            self.labelChar.setText(char.name)
        
        if not data: return
        
        for namespace,asset,mapping,symmetry,count in data:
            self.modelComp.insertRow(namespace,asset,mapping,symmetry,count)
        
        self.tableViewComponent.setFocus()
            
    
    def characterMenu(self):
        """Menu displayed when right clicking on the character table view."""
        
        posX  = QtGui.QCursor().pos().x() - self.pos().x()
        posY  = QtGui.QCursor().pos().y() - self.pos().y() - 20
        menu  = QtGui.QMenu()
        importaction = menu.addAction("Import mapping onto Selected Geo")
        mirroraction = menu.addAction("Import mirrored objects mapping onto Selected Geo")
        
        action = menu.exec_(self.mapToGlobal(QtCore.QPoint(posX,posY)))
        
        if action == importaction:
            # import skin onto geo
            sel = self.listViewCharacter.selectionModel()
            try : index = sel.selectedIndexes()[0]
            except: return
            
            asset = str(self.modelChar.characters[index.row()].toString())
            file  = bodyPublish.getRigMapping(asset)
            for geo in cmds.ls(sl=True):
                # import deformers
                bodyIO.importDeformersByObject(geo,file)
                # import skin
                if rigUtils.findSkinClusterOnNode(geo): continue
                bodyIO.importSkinByObject(geo,file)
        
        if action == mirroraction:
            # import skin onto geo
            sel = self.listViewCharacter.selectionModel()
            try : index = sel.selectedIndexes()[0]
            except: return
            
            asset = str(self.modelChar.characters[index.row()].toString())
            file  = bodyPublish.getRigMapping(asset)
            for geo in cmds.ls(sl=True):
                # import deformers
                bodyIO.importDeformersByMirroredObject(geo,file)
                # import skin
                if rigUtils.findSkinClusterOnNode(geo): continue
                bodyIO.importSkinByMirroredObject(geo,file)
            
                
            
    
    def componentMenu(self):
        """Menu displayed when right clicking on the component table view.
        For importing and publishing of individual component guide rigs.
        """
        
        sel = self.tableViewComponent.selectionModel()
        try : index = sel.selectedIndexes()[0]
        except: return
        
        asset = str(self.modelComp.components[index.row()][1].toString())
        map   = str(self.modelComp.components[index.row()][2].toString())
        file  = os.path.join(rigEnv.ROOTCOMP,asset,'mapping',map,'%s_%s.skin' % (asset,map))
        posX  = QtGui.QCursor().pos().x() - self.pos().x()
        posY  = QtGui.QCursor().pos().y() - self.pos().y() - 20
        
        menu              = QtGui.QMenu()
        importaction      = menu.addAction("Import  Component")
        publishaction     = menu.addAction("Publish Component")
        publishskinaction = menu.addAction("Publish Default Skin from Selected Geo")
        importskinaction  = menu.addAction("Import  Default Skin onto Selected Geo")
        prebuildaction    = menu.addAction("Publish Component Prebuild File")
        postbuildaction   = menu.addAction("Publish Component Postbuild File")
        
        action = menu.exec_(self.mapToGlobal(QtCore.QPoint(posX,posY)))
        
        if action == importaction:
            # import components latest version
            bodyIO.importComponent(asset)
        
        elif action == publishaction:
            # publish a component
            bodyPublish.publishComponent(asset)
            
        elif action == publishskinaction:
            # publish a components default mapping from selected geo
            bodyPublish.publishSkin(asset,map)
            
        elif action == importskinaction:
            # import default mapping onto selected geo
            
            if not cmds.ls(sl=True):
                rigUtils.log('Nothing selected.','e')
                return
            
            path = bodyPublish.getComponentMapping(asset,map,'100')
            
            if path: bodyIO.importSkinBySel(path)
        
        elif action == prebuildaction:
            # publish prebuild module
            bodyPublish.publishPrebuild(asset)
            
        elif action == postbuildaction:
            # publish postbuild module
            bodyPublish.publishPostbuild(asset)
    
    
    def currentCharacter(self):
        """Return a Rig object corresponding the currently selected character."""
        
        sel = self.listViewCharacter.selectedIndexes()
        if not len(sel):
            return
        return self.characters[sel[0].row()]
    
    def currentCharacters(self):
        """Return a list of Rig objects corresponding the currently selected characters."""
        
        sel = self.listViewCharacter.selectedIndexes()
        if not len(sel):
            return
        
        currentChars = []
        for index in sel:
            currentChars.append(self.characters[index.row()])
        
        return currentChars
    
    
    def refreshCharacters(self):
        """Update the contents of the character list view."""
        
        self.modelChar.clear()
        del(self.characters[:])
        
        if not os.path.isdir(rigEnv.ROOTCHAR): return
        
        chars = os.listdir(rigEnv.ROOTCHAR)
        chars.sort()
        for char in chars:
            
            # skip invalid files
            if char[0] == '.': continue
            
            self.modelChar.insertRow(char)
            rig = bodyClasses.Rig(char)
            self.characters.append(rig)
        
        
    def refreshComponents(self):
        """Clear the contents of the component table view."""
        
        self.modelComp.clear()
        self.labelChar.setText('')
    
    
    def showWindow(self):
        """Display the rigging window."""
        
        self.show()
        self.refreshComponents()
        self.refreshCharacters()
        
        return True
    
    
    def toggleStatePublishBuild(self):
        """Enable the functionality to commit changes to the selected characters' rig."""
        
        state = self.checkBoxPublishEnableBuild.isChecked()
        
        if not state:
            self.btnPublishRig.setDisabled(True)
        else:
            self.btnPublishRig.setDisabled(False)
    
    
    def toggleStatePublishBuildMapping(self):
        """Enable the functionality to commit changes to the selected characters' rig."""
        
        state = self.checkBoxPublishEnableBuild.isChecked()
        
        if not state:
            self.btnPublishRig.setDisabled(True)
            self.btnPublishMapping.setDisabled(True)
        else:
            self.btnPublishRig.setDisabled(False)
            self.btnPublishMapping.setDisabled(False)
    
    
    def toggleStatePublishGuide(self):
        """Enable the functionality to commit changes to the selected characters' guide."""
        
        state = self.checkBoxPublishEnableGuide.isChecked()
        
        if not state:
            self.btnPublishGuide.setDisabled(True)
        else:
            self.btnPublishGuide.setDisabled(False)
    
    
    def toggleStatePublishLayout(self):
        """Enable the functionality to commit changes to the selected characters' layout files."""
        
        state = self.checkBoxPublishEnableLayout.isChecked()
        
        if not state:
            self.btnPublishLayout.setDisabled(True)
        else:
            self.btnPublishLayout.setDisabled(False)
    
    
    def toggleStatePublishMapping(self):
        """Enable the functionality to commit changes to the selected characters' mapping."""
        
        state = self.checkBoxPublishEnableMapping.isChecked()
        
        if not state:
            self.btnPublishMapping.setDisabled(True)
        else:
            self.btnPublishMapping.setDisabled(False)
                    
    
    def on_actionBuildRig_triggered(self,checked=None):
        """Create advanced skeleton rig."""
        
        if checked is None: return
        
        if not confirmDialog('Building creates a new scene file. Continue?'): return
        
        chars = self.currentCharacters()
        
        defaultmaps = []
        for i in range(self.modelComp.rowCount()):
            if self.modelComp.components[i][3]: # use default weight mapping
                
                component = str(self.modelComp.components[i][1].toString())
                map       = str(self.modelComp.components[i][2].toString())
                path      = bodyPublish.getComponentMapping(component,map,'100')
                
                defaultmaps.append(path)
        
        comment           = ''
        debug             = self.checkBoxDebug.isChecked()
        combine           = self.checkBoxCombined.isChecked()
        publish           = self.checkBoxPublishRig.isChecked()
        keepGuide         = self.checkBoxKeepGuide.isChecked()
        importDeformers   = self.checkBoxDeformers.isChecked()
        importControlData = self.checkBoxControlData.isChecked()
        
        if publish:
            prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
            if prompt == 'Cancel': return
            comment = cmds.promptDialog(q=True,tx=True)
        
        for char in chars:
            char.buildRig(defaultmaps,debug,combine,publish,keepGuide,importDeformers,importControlData,comment)
    
    
    def on_actionComponentAdd_triggered(self,checked=None):
        """Add another row to the component table for entering new component data."""
        
        if checked is None:
            return
        
        char = self.currentCharacter()
        
        if not char:
            rigUtils.log('Select a character.','e')
            return
        
        self.modelComp.insertRow('','','',)
        
        rigUtils.log('New component added.')
        
    
    def on_actionComponentRemove_triggered(self,checked=None):
        """Remove selected row from component table."""
        
        if checked is None:
            return
        
        sel = self.tableViewComponent.selectionModel()
        
        rows = []
        for index in sel.selectedIndexes():
            if index.row() not in rows: rows.append(index.row())
        rows.sort()
        
        if not confirmDialog('Removing selected components from layout.\n\nProceed?'):
            return
        
        i = len(rows) - 1
        while i >= 0:
            self.modelComp.removeRow(rows[i])
            i = i - 1
        
        rigUtils.log('Selected components removed.')
        
    
    
    def on_actionGuideBuild_triggered(self,checked=None):
        """Open selected characters' guide rig. Check and replace components."""
        
        if checked is None: return
        
        if not confirmDialog('Creating new scene. Continue?'): return
        
        refgeo = self.checkBoxReferenceGeo.isChecked()
        char   = self.currentCharacter()
        char.buildGuide(refgeo)
    
    
    def on_actionImportControlData_triggered(self,checked=None):
        """Import shapes for selected controls."""
        
        if checked is None: return
        
        char = self.currentCharacter()
        
        if not confirmDialog('Importing control shape data for \n\n%s' % char.name): return
        
        selection = cmds.ls(sl=True)
        char.getControlData(selection)
        
    
    def on_actionMirrorControls_triggered(self,checked=None):
        
        if checked is None: return
        
        rigUtils.mirrorShapes()
    
    
    def on_actionOpenLatest_triggered(self,checked=None):
        
        if checked is None: return
        
        if not confirmDialog('Any unsaved work will be lost.\n\nOpen latest rig?'): return
        
        char = self.currentCharacter()
        path = bodyPublish.getRig(char.name)
        
        if not path:
            rigUtils.log('Error getting path to: %s' % char.name) 
            return
        
        cmds.file(path,o=True,f=True)
    
    
    def on_actionPublishCharPostBuild_triggered(self,checked=None):
        
        if checked is None: return
    
        path = cmds.fileDialog2(ff='*.py',fm=1)
        if path:
            
            prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
            if prompt == 'Cancel': return
            comment = cmds.promptDialog(q=True,tx=True)
            
            for char in self.currentCharacters():
                tmp = tempfile.mkstemp('.py')[1]
                rigUtils.log('Saving temp file for publishing %s: %s' % (char.name,tmp))
                shutil.copyfile(path[0],tmp)
                bodyPublish.publishRigPostBuild(char.name,tmp,comment)
                    
    
    def on_actionPublishCharPreBuild_triggered(self,checked=None):
        
        if checked is None: return
    
        path = cmds.fileDialog2(ff='*.py',fm=1)
        if path:
            
            prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
            if prompt == 'Cancel': return
            comment = cmds.promptDialog(q=True,tx=True)
            
            for char in self.currentCharacters():
                tmp = tempfile.mkstemp('.py')[1]
                rigUtils.log('Saving temp file for publishing %s: %s' % (char.name,tmp))
                shutil.copyfile(path[0],tmp)
                bodyPublish.publishRigPreBuild(char.name,tmp,comment)
        
    
    def on_actionPublishGuide_triggered(self,checked=None):
        """Export referenced components and loc_sets as all selected characters' guide rigs."""
        
        if checked is None: return
        
        chars = self.currentCharacters()
        
        if not len(chars):
            rigUtils.log('No characters selected.','e') 
            return
        
        msg   = 'Publishing guides for:\n'
        for char in chars:
            msg = msg + '\n%s' % char.name
        msg = msg + '\n\nProceed?'
        
        if not confirmDialog(msg): return
        
        prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
        if prompt == 'Cancel': return
        comment = cmds.promptDialog(q=True,tx=True)
        
        for char in chars:
            
            char.publishGuide(comment)
    
    
    def on_actionPublishLayout_triggered(self,checked=None):
        """Create layout file for all selected characters based on contents of component table."""
        
        if checked is None:
            return
        
        chars = self.currentCharacters()
        
        if not len(chars):
            rigUtils.log('No characters selected.','e') 
            return
        
        msg   = 'Committing changes for:\n'
        for char in chars:
            msg = msg + '\n%s' % char.name
        msg = msg + '\n\nEnter Comment:'
        
        prompt = cmds.promptDialog(m=msg,b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
        if prompt == 'Cancel': return
        comment = cmds.promptDialog(q=True,tx=True)
            
        doc     = minidom.Document()
        elemRig = doc.createElement('rig')
        
        i = 0
        while True:
            if i == self.modelComp.rowCount(): break
            
            name     = str(self.modelComp.components[i][0].toString())
            asset    = str(self.modelComp.components[i][1].toString())
            mapping  = str(self.modelComp.components[i][2].toString())
            symmetry = str(self.modelComp.components[i][4])
            count    = str(self.modelComp.components[i][5].toString())
            
            x = [len(name),len(asset),len(symmetry),len(mapping)]
            
            if 0 in x:
                rigUtils.log('Empty string found - exiting','e')
                return
                
            elemComp       = doc.createElement('comp')
            elemCompName   = doc.createElement('namespace')
            elemCompAsset  = doc.createElement('asset')
            elemCompMap    = doc.createElement('mapping')
            elemCompSym    = doc.createElement('symmetry')
            elemCompCnt    = doc.createElement('count')
            
            elemCompName.appendChild(doc.createTextNode(name))
            elemCompAsset.appendChild(doc.createTextNode(asset))
            elemCompMap.appendChild(doc.createTextNode(mapping))
            elemCompSym.appendChild(doc.createTextNode(symmetry))
            elemCompCnt.appendChild(doc.createTextNode(count))
            
            elemComp.appendChild(elemCompName)
            elemComp.appendChild(elemCompAsset)
            elemComp.appendChild(elemCompMap)
            elemComp.appendChild(elemCompSym)
            elemComp.appendChild(elemCompCnt)
            
            elemRig.appendChild(elemComp)
            
            i = i + 1
        
        elemRig.setAttribute('name',char.name)
        doc.appendChild(elemRig)
        
        tmp = tempfile.mkstemp('.xml')[1]
        rigUtils.log('Saving temp layout file for %s: %s' % (char.name,tmp))
        
        f = open(tmp,'w')
        doc.writexml(f,'','','')
        f.close()
            
        for char in chars:
            
            bodyPublish.publishRigLayout(char.name,tmp,description=comment)
            
        self.on_actionRefresh_triggered()
        
        rigUtils.log('Changes committed.')
        
    
    def on_actionPublishMapping_triggered(self,checked=None):
        
        if checked is None: return
        
        chars = self.currentCharacters()
        
        if not confirmDialog('Publishing mapping. Continue?'): return
        
        prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
        if prompt == 'Cancel': return
        comment = cmds.promptDialog(q=True,tx=True)
        
        for char in chars:
            
            char.publishMapping(comment)
        
    
    def on_actionPublishRig_triggered(self,checked=None):
        """Publish the current maya scene as the rig for each selected character."""
        
        if checked is None: return
        
        chars = self.currentCharacters()
        msg = 'Publishing:\n\n'
        for char in chars:
            msg = msg + char.name + '\n'
        msg = msg + '\nContinue?'
        publish,submit = confirmDialog(msg,submit=True)
        
        if not publish: return
        
        prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
        if prompt == 'Cancel': return
        comment = cmds.promptDialog(q=True,tx=True)
    
        for char in chars:
            
            char.publishRig(comment,submit=False)
            
    
    def on_actionRefresh_triggered(self,checked=None):
        """Refresh contents of character list, component table and build/publish buttons in UI."""
        
        if checked is None: return
        
        self.btnComponentAdd.setDisabled(True)
        self.btnComponentRemove.setDisabled(True)
        self.btnPublishLayout.setDisabled(True)
        self.btnGuideBuild.setDisabled(True)
        self.btnPublishGuide.setDisabled(True)
        self.btnRigBuild.setDisabled(True)
        self.btnScriptBuild.setDisabled(True)
        self.btnPublishRig.setDisabled(True)
        self.btnPublishMapping.setDisabled(True)
        self.btnOpenLatest.setDisabled(True)
        self.checkBoxDebug.setDisabled(True)
        self.checkBoxDebug.setChecked(False)
        self.checkBoxPublish.setDisabled(True)
        self.checkBoxPublish.setChecked(False)
        self.checkBoxPublishEnableBuild.setDisabled(True)
        self.checkBoxPublishEnableBuild.setChecked(False)
        self.checkBoxPublishEnableLayout.setDisabled(True)
        self.checkBoxPublishEnableLayout.setChecked(False)
        self.checkBoxPublishEnableGuide.setDisabled(True)
        self.checkBoxPublishEnableGuide.setChecked(False)
        self.checkBoxReferenceGeo.setDisabled(True)
        self.checkBoxReferenceGeo.setChecked(False)
        self.checkBoxCombined.setDisabled(True)
        self.checkBoxCombined.setChecked(False)
        self.checkBoxKeepGuide.setDisabled(True)
        self.checkBoxKeepGuide.setChecked(False)
        self.checkBoxDeformers.setChecked(True)
        self.checkBoxDeformers.setDisabled(True)
        self.checkBoxControlData.setChecked(True)
        self.checkBoxControlData.setDisabled(True)
        
        self.refreshComponents()
        self.refreshCharacters()
        
        self.labelChar.setText('')
        
        self.listViewCharacter.setFocus()
    
    
    def on_actionSelectCharFile_triggered(self,checked=None):
        """Select all characters that have published mb files."""
        
        if checked is None: return
        
        sel = self.listViewCharacter.selectionModel()
        sel.clear()
        
        for char in self.characters:
            if os.path.isdir('T://jobs//%s//asset//character//%s//rig//anim//combined//mb' % (rigEnv.PROJECT,char.name)):
                
                index = self.modelChar.index(self.characters.index(char),0)
                sel.select(index,QtGui.QItemSelectionModel.Select)
            
            self.listViewCharacter.setFocus()
                
        
    def on_actionSelectCharAll_triggered(self,checked=None):
        """Select all characters in the character list view."""
        
        if checked is None: return
        
        sel = self.listViewCharacter.selectionModel()
            
        for i in range(0,self.modelChar.rowCount()):
            index = self.modelChar.index(i,0)
            sel.select(index,QtGui.QItemSelectionModel.Select)
        
        self.listViewCharacter.setFocus()
        
    
    def on_actionSelectCharInvert_triggered(self,checked=None):
        """Invert the current selection of characters in the character list view."""
        
        if checked is None: return
        
        sel = self.listViewCharacter.selectionModel()
            
        for i in range(0,self.modelChar.rowCount()):
            index = self.modelChar.index(i,0)
            if sel.isSelected(index):
                sel.select(index,QtGui.QItemSelectionModel.Deselect)
            else:
                sel.select(index,QtGui.QItemSelectionModel.Select)
    
    
    def on_actionToggleGeoSelect_triggered(self,checked=None):
        """Toggle the selectability of the base geo."""
        
        if checked is None: return
        
        cmds.namespace(set='GEO')
        dagnodes = cmds.namespaceInfo(lod=True)
        cmds.namespace(set=':')
        
        for dagnode in dagnodes:
            
            if not cmds.objectType(dagnode,isType='mesh'): continue
            if 'ShapeOrig' in dagnode: continue
            
            parent = cmds.listRelatives(dagnode,p=True)[0]
            state  = cmds.getAttr('%s.overrideEnabled' % parent)
        
            if state: cmds.setAttr('%s.overrideEnabled' % parent,0)
            else: cmds.setAttr('%s.overrideEnabled' % parent,1)
        

class RigWindowUser(BaseRigWindow,form_class_user,base_class_user):
    """User interface for character rigging."""
    
    def __init__(self,rootparent=getMayaWindow()):
        
        super(RigWindowUser,self).__init__(rootparent)
        
        self.setupUi(self)
        self.copy       = None
        self.characters = []
        self.modelChar  = bodyModel.CharModel()
        self.modelComp  = bodyModel.CompUserModel()
        self.listViewCharacter.setModel(self.modelChar)
        self.tableViewComponent.setModel(self.modelComp)
        self.listViewCharacter.clicked.connect(self.charClicked)
        self.checkBoxPublishEnableLayout.stateChanged.connect(self.toggleStatePublishLayout)
        self.checkBoxPublishEnableGuide.stateChanged.connect(self.toggleStatePublishGuide)
        self.checkBoxPublishEnableBuild.stateChanged.connect(self.toggleStatePublishBuild)
        self.checkBoxPublishEnableMapping.stateChanged.connect(self.toggleStatePublishMapping)
        self.checkBoxPublishEnableControls.stateChanged.connect(self.toggleStatePublishControls)
        self.statusBar().showMessage('Flying Bark Rigging Tool')
        self.tableViewComponent.setColumnWidth(0,142)
        self.tableViewComponent.setColumnWidth(1,142)
        self.tableViewComponent.setColumnWidth(2,30)
        self.tableViewComponent.setColumnWidth(3,20)
        
        header = self.tableViewComponent.horizontalHeader()
        header.setMovable(False)
        header.setClickable(False)
        header.setResizeMode(QtGui.QHeaderView.Fixed)
        
        # add popup menu to character list
        self.PopupMenu = sysUtils.CreateCharacterPopUpMenu(parent=self.listViewCharacter)

        self.listViewCharacter.customContextMenuRequested.connect(self.PopupMenu._buildMenu)
        self.PopupMenu._characterNamePromptDialogCallback = self.on_actionRefresh_triggered
            
    
    def charClicked(self):
        """Update the component table view with the currently selected character's component info.
           Update the contents of the guide, mapping, control data and rig drop downs.
        """
        
        char = self.currentCharacter()
        data = char.getLayoutData()
        
        self.btnComponentAdd.setDisabled(False)
        self.btnComponentRemove.setDisabled(False)
        self.btnGuideBuild.setDisabled(False)
        self.btnRigBuild.setDisabled(False)
        self.btnOpenLatest.setDisabled(False)
        self.btnImportMappingAll.setDisabled(False)
        self.btnImportMappingSelected.setDisabled(False)
        self.btnImportControlsAll.setDisabled(False)
        self.btnImportControlsSelected.setDisabled(False)
        self.btnImportGeoBuild.setDisabled(False)
        self.btnImportGeoGuide.setDisabled(False)
        self.btnFinalise.setDisabled(False)
        self.checkBoxDebug.setDisabled(False)
        self.checkBoxDebug.setChecked(False)
        self.checkBoxPublishEnableBuild.setDisabled(False)
        self.checkBoxPublishEnableBuild.setChecked(False)
        self.checkBoxPublishEnableLayout.setDisabled(False)
        self.checkBoxPublishEnableLayout.setChecked(False)
        self.checkBoxPublishEnableGuide.setDisabled(False)
        self.checkBoxPublishEnableGuide.setChecked(False)
        self.checkBoxPublishEnableMapping.setDisabled(False)
        self.checkBoxPublishEnableMapping.setChecked(False)
        self.checkBoxPublishEnableControls.setDisabled(False)
        self.checkBoxPublishEnableControls.setChecked(False)
        self.checkBoxReferenceGeo.setDisabled(False)
        self.checkBoxReferenceGeo.setChecked(False)
        self.checkBoxKeepGuide.setDisabled(False)
        self.checkBoxKeepGuide.setChecked(False)
        
        self.refreshComponents()
        
        self.labelChar.setText(char.name)
        
        self.statusBar().showMessage('Flying Bark Rigging Tool')
        
        self.comboBoxGuide.clear()
        versions = bodyPublish.getRigGuideVersions(char.name)
        if versions:
            for version in versions:
                self.comboBoxGuide.addItem(version)
            self.comboBoxGuide.setCurrentIndex(self.comboBoxGuide.count()-1)
        
        self.comboBoxMapping.clear()
        versions = bodyPublish.getRigMappingVersions(char.name)
        if versions:
            for version in versions:
                self.comboBoxMapping.addItem(version)
            self.comboBoxMapping.setCurrentIndex(self.comboBoxMapping.count()-1)
        
        self.comboBoxControls.clear()
        versions = bodyPublish.getRigDataVersions(char.name)
        if versions:
            for version in versions:
                self.comboBoxControls.addItem(version)
            self.comboBoxControls.setCurrentIndex(self.comboBoxControls.count()-1)
        
        self.comboBoxRig.clear()
        versions = bodyPublish.getRigVersions(char.name)
        if versions:
            for version in versions:
                self.comboBoxRig.addItem(version)
            self.comboBoxRig.setCurrentIndex(self.comboBoxRig.count()-1)
        
        if not data: return
        
        for namespace,asset,mapping,symmetry,count in data:
            namespace         = QtCore.QVariant(namespace)
            componentDelegate = bodyModel.ComponentDelegate(self,self.modelComp.rowCount())
            symmetry          = int(symmetry)
            count             = int(count)
            
            self.modelComp.insertRow(namespace,componentDelegate,symmetry,count)
            self.tableViewComponent.setItemDelegateForColumn(1,componentDelegate)
            self.tableViewComponent.openPersistentEditor(self.modelComp.index(self.modelComp.rowCount()-1,1))
            
            componentDelegate.dropdown.setCurrentIndex(componentDelegate.dropdown.findText(asset))
            
            # reset first entry
            self.modelComp.components[self.modelComp.rowCount()-1][0] = namespace
            
        self.tableViewComponent.setFocus()
    
    def componentChanged(self,namespace,row):
        
        self.modelComp.components[row][0] = namespace
        self.tableViewComponent.update()
        
    def toggleStatePublishControls(self):
        
        state = self.checkBoxPublishEnableControls.isChecked()
        
        if not state:
            self.btnPublishControls.setDisabled(True)
        else:
            self.btnPublishControls.setDisabled(False)
        
    def on_actionBuildRig_triggered(self,checked=None):
        """Create advanced skeleton rig."""
        
        if checked is None: return
        
        if not confirmDialog('Building creates a new scene file. Continue?'): return
        
        char              = self.currentCharacter()
        debug             = self.checkBoxDebug.isChecked()
        keep              = self.checkBoxKeepGuide.isChecked()
        
        char.buildRig(debug=debug,keepGuide=keep,importDeformers=False,importControlData=False)
    
    def on_actionComponentAdd_triggered(self,checked=None):
        """Add another row to the component table for entering new component data."""
        
        if checked is None:
            return
        
        componentDelegate = bodyModel.ComponentDelegate(self,self.modelComp.rowCount())
        self.modelComp.insertRow(QtCore.QVariant(''),componentDelegate)
        self.tableViewComponent.setItemDelegateForColumn(1,componentDelegate)
        self.tableViewComponent.openPersistentEditor(self.modelComp.index(self.modelComp.rowCount()-1,1))
        
        componentDelegate.dropdown.setCurrentIndex(1)
        componentDelegate.dropdown.setCurrentIndex(0)
        
        rigUtils.log('New component added.')
    
    def on_actionCreateGuideLocator_triggered(self,checked=None):
        """Add another row to the component table for entering new component data."""
        
        if checked is None:
            return
        
        rigUtils.createGuideLoc()
    
    def on_actionCreateGuideLocatorSet_triggered(self,checked=None):
        """Add another row to the component table for entering new component data."""
        
        if checked is None:
            return
        
        rigUtils.createGuideLocSet()
        
    def on_actionAddGuideAttributesToLocator_triggered(self,checked=None):
        """Add another row to the component table for entering new component data."""
        
        if checked is None:
            return
        
        for node in cmds.ls(sl=True):
            rigUtils.addGuideAttrs(node)
        
    def on_actionFinaliseRig_triggered(self,checked=None):
        
        if checked is None: return
        
        char = self.currentCharacter()
        
        if not char:
            rigUtils.log('Select a character.','e')
            return
        
        if not confirmDialog('Finalising the rig can\'t be undone.\n\nProceed?'): return
        
        char.finalise()
    
    def on_actionGuideBuild_triggered(self,checked=None):
        """Open selected characters' guide rig. Check and replace components."""
        
        if checked is None: return
        
        if not confirmDialog('Creating new scene. Continue?'): return
        
        refgeo  = self.checkBoxReferenceGeo.isChecked()
        char    = self.currentCharacter()
        version = self.comboBoxGuide.currentText()
        char.buildGuide(refgeo,version=version)
        
    def on_actionRefresh_triggered(self,checked=None):
        """Refresh contents of character list, component table and build/publish buttons in UI."""
        
        if checked is None: return
        
        self.btnGuideBuild.setDisabled(True)
        self.btnPublishGuide.setDisabled(True)
        self.btnRigBuild.setDisabled(True)
        self.btnPublishRig.setDisabled(True)
        self.btnPublishMapping.setDisabled(True)
        self.btnImportMappingAll.setDisabled(True)
        self.btnImportMappingSelected.setDisabled(True)
        self.btnImportControlsAll.setDisabled(True)
        self.btnImportControlsSelected.setDisabled(True)
        self.btnImportGeoBuild.setDisabled(True)
        self.btnImportGeoGuide.setDisabled(True)
        self.btnOpenLatest.setDisabled(True)
        self.btnComponentAdd.setDisabled(True)
        self.btnComponentRemove.setDisabled(True)
        self.btnFinalise.setDisabled(True)
        self.checkBoxDebug.setDisabled(True)
        self.checkBoxDebug.setChecked(False)
        self.checkBoxPublishEnableLayout.setDisabled(True)
        self.checkBoxPublishEnableLayout.setChecked(False)
        self.checkBoxPublishEnableBuild.setDisabled(True)
        self.checkBoxPublishEnableBuild.setChecked(False)
        self.checkBoxPublishEnableGuide.setDisabled(True)
        self.checkBoxPublishEnableGuide.setChecked(False)
        self.checkBoxPublishEnableMapping.setDisabled(True)
        self.checkBoxPublishEnableMapping.setChecked(False)
        self.checkBoxPublishEnableControls.setDisabled(True)
        self.checkBoxPublishEnableControls.setChecked(False)
        self.checkBoxReferenceGeo.setDisabled(True)
        self.checkBoxReferenceGeo.setChecked(False)
        self.checkBoxKeepGuide.setDisabled(True)
        self.checkBoxKeepGuide.setChecked(False)
        self.refreshComponents()
        self.refreshCharacters()
        self.labelChar.setText('')
        self.listViewCharacter.setFocus()
        self.statusBar().showMessage('Flying Bark Rigging Tool')
        self.comboBoxGuide.clear()
        self.comboBoxMapping.clear()
        self.comboBoxControls.clear()
        self.comboBoxRig.clear()
        self.copy = None
    
    
    def on_actionPublishGuide_triggered(self,checked=None):
        """Export referenced components and loc_sets as all selected characters' guide rigs."""
        
        if checked is None: return
        
        char = self.currentCharacter()
        if not char: 
            rigUtils.log('No characters selected.','e')
            return
        
        if not char.testGuide(): return
        
        msg  = 'Publishing guides for:\n\n%s\n\nProceed?' % char.name
        
        if not confirmDialog(msg): return
        
#         prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
#         if prompt == 'Cancel': return
#         comment = cmds.promptDialog(q=True,tx=True)
        
        char.publishGuide('')
        
        self.checkBoxPublishEnableGuide.setChecked(False)
        
        rigUtils.log('Guide committed.')
        
    
    def on_actionPublishLayout_triggered(self,checked=None):
        """Create layout file for all selected characters based on contents of component table."""
        
        if checked is None:
            return
        
        # must have a character selected
        char = self.currentCharacter()
        if not char:
            rigUtils.log('No character selected.','e') 
            return
        
        if not confirmDialog('Publishing layout data. Continue?'): return
        
        # confirmation dialog
#         msg    = 'Committing changes for:\n\n%s\n\nEnter Comment:' % char.name
#         prompt = cmds.(m=msg,b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
#         if prompt == 'Cancel': return
#         comment = cmds.promptDialog(q=True,tx=True)
            
        # new xml document
        doc     = minidom.Document()
        elemRig = doc.createElement('rig')
        
        # get the values to store
        for component in self.modelComp.components:
            
            name     = str(component[0].toString())
            asset    = str(component[1].dropdown.currentText())
            mapping  = 'none'
            symmetry = str(component[2])
            count    = str(component[3])
            
            if not len(name):
                rigUtils.log('Empty Component Name - exiting','e')
                return
            
            if int(count) < 1:
                rigUtils.log('Component count needs to be greater than zero','e')
                return
                
            elemComp       = doc.createElement('comp')
            elemCompName   = doc.createElement('namespace')
            elemCompAsset  = doc.createElement('asset')
            elemCompMap    = doc.createElement('mapping')
            elemCompSym    = doc.createElement('symmetry')
            elemCompCnt    = doc.createElement('count')
            
            elemCompName.appendChild(doc.createTextNode(name))
            elemCompAsset.appendChild(doc.createTextNode(asset))
            elemCompMap.appendChild(doc.createTextNode(mapping))
            elemCompSym.appendChild(doc.createTextNode(symmetry))
            elemCompCnt.appendChild(doc.createTextNode(count))
            
            elemComp.appendChild(elemCompName)
            elemComp.appendChild(elemCompAsset)
            elemComp.appendChild(elemCompMap)
            elemComp.appendChild(elemCompSym)
            elemComp.appendChild(elemCompCnt)
            
            elemRig.appendChild(elemComp)
        
        elemRig.setAttribute('name',char.name)
        doc.appendChild(elemRig)
        
        tmp = tempfile.mkstemp('.xml')[1]
        rigUtils.log('Saving temp layout file for %s: %s' % (char.name,tmp))
        
        f = open(tmp,'w')
        doc.writexml(f,'','','')
        f.close()
            
        bodyPublish.publishRigLayout(char.name,tmp,description='')
        
        self.checkBoxPublishEnableLayout.setChecked(False)
        
        rigUtils.log('Changes committed.')
        
    
    def on_actionPublishControls_triggered(self,checked=None):
        
        if checked is None: return
        
        char = self.currentCharacter()

        if not confirmDialog('Publish control data. Continue?'): return
        
#         prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
#         if prompt == 'Cancel': return
#         comment = cmds.promptDialog(q=True,tx=True)
        
        char.publishControlData('')
        
        self.checkBoxPublishEnableControls.setChecked(False)
    
    
    def on_actionPublishMapping_triggered(self,checked=None):
        
        if checked is None: return
        
        char = self.currentCharacter()
        
        if not confirmDialog('Publish mapping. Continue?'): return
        
#         prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
#         if prompt == 'Cancel': return
#         comment = cmds.promptDialog(q=True,tx=True)
        
        char.publishMapping('')
        
        self.checkBoxPublishEnableMapping.setChecked(False)
        
            
    def on_actionPublishRig_triggered(self,checked=None):
        """Publish the current maya scene as the rig for each selected character."""
        
        if checked is None: return
        
        char    = self.currentCharacter()
        msg     = 'Publishing:\n\n%s\n\nContinue?' % char.name
        publish = confirmDialog(msg)
        
        if not publish: return
        
#         prompt = cmds.promptDialog(m='Enter comment',b=['OK','Cancel'],cb='Cancel',db='OK',t='Enter Comment')
#         if prompt == 'Cancel': return
#         comment = cmds.promptDialog(q=True,tx=True)
        
        char.publishRig(comment='')
            
        self.checkBoxPublishEnableBuild.setChecked(False)
    
    def on_actionImportGeo_triggered(self,checked=None):
        
        if checked is None: return
        
        if cmds.namespace(ex='GEO'):
            if not confirmDialog('Namespace exists: GEO\n\n** Importing will DELETE the existing GEO namespace and its contents!**\n\nProceed?'): return
            
        path = cmds.fileDialog2(ff='*.mb',fm=1,dir=rigEnv.ROOTCHAR)
        if path:
            
            if cmds.namespace(ex='GEO'):
                cmds.namespace(set='GEO')
                for node in cmds.namespaceInfo(ls=True):
                    if cmds.objExists(node): cmds.delete(node)
                cmds.namespace(set=':')
                cmds.namespace(rm='GEO',f=True)
            
            rigUtils.log('Importing Geo: %s' % path[0])
            try: 
                cmds.file(path[0],ns='GEO',i=True,f=True)
            except:
                rigUtils.log('Error importing file: %s' % path[0],'e')
        
    
    def on_actionImportControls_triggered(self,checked=None):
        
        if checked is None: return
        
        if not confirmDialog('Importing Control Data. Continue?'): return
        
        char    = self.currentCharacter()
        version = self.comboBoxControls.currentText()
        char.importControlData(version)
    
        
    def on_actionImportSelectedControls_triggered(self,checked=None):
        
        if checked is None: return
        
        if not confirmDialog('Importing Control Data. Continue?'): return
        
        char    = self.currentCharacter()
        version = self.comboBoxControls.currentText()
        char.importControlDataSelected(version)
        
        
    def on_actionImportMapping_triggered(self,checked=None):
        
        if checked is None: return
        
        if not confirmDialog('Importing Mapping. Continue?'): return
        
        char    = self.currentCharacter()
        version = self.comboBoxMapping.currentText()
        char.importSkin(None,version)
        
        
    def on_actionImportSelectedMapping_triggered(self,checked=None):
        
        if checked is None: return
        
        if not confirmDialog('Importing Mapping for Selected. Continue?'): return
        
        char    = self.currentCharacter()
        version = self.comboBoxMapping.currentText()
        char.importSkinSelected(None,version)
        
    def on_actionCopyLayout_triggered(self,checked=None):
        
        if checked is None: return
        
        char = self.currentCharacter()
        path = bodyPublish.getRigLayout(char.name)
        if not path:
            rigUtils.log('Error copying layout','e')
            self.copy = None
        else:
            self.copy = path
            self.statusBar().showMessage('Copied Layout: %s' % os.path.basename(path))
        
    def on_actionCopyGuide_triggered(self,checked=None):
         
        if checked is None: return
        
        char = self.currentCharacter()
        path = bodyPublish.getRigGuide(char.name)
        if not path:
            rigUtils.log('Error copying guide','e')
            self.copy = None
        else:
            self.copy = path
            self.statusBar().showMessage('Copied Guide: %s' % os.path.basename(path))
        
    def on_actionCopyMapping_triggered(self,checked=None):
        
        if checked is None: return    
        
        char = self.currentCharacter()
        path = bodyPublish.getRigMapping(char.name,'100')
        if not path:
            rigUtils.log('Error copying mapping','e')
            self.copy = None
        else:
            self.copy = path
            self.statusBar().showMessage('Copied Mapping: %s' % os.path.basename(path))
        
    def on_actionCopyControlData_triggered(self,checked=None):
        
        if checked is None: return

        char = self.currentCharacter()
        path = bodyPublish.getRigData(char.name)
        if not path:
            rigUtils.log('Error copying data','e')
            self.copy = None
        else:
            self.copy = path
            self.statusBar().showMessage('Copied Control Data: %s' % os.path.basename(path))
        
    def on_actionOpenLatest_triggered(self,checked=None):
        
        if checked is None: return
        
        if not confirmDialog('Any unsaved work will be lost.\n\nProceed?'): return
        
        char    = self.currentCharacter()
        version = self.comboBoxRig.currentText()
        path    = bodyPublish.getRigVersion(char.name,version)
        
        if not path:
            rigUtils.log('Error getting path to: %s' % char.name) 
            return
        
        cmds.file(path,o=True,f=True)
        
    def on_actionPasteLayout_triggered(self,checked=None):
        
        if checked is None: return
        
        if not self.copy: 
            confirmDialog('\nNothing to copy.',1)
            return
        if not re.match('[a-zA-Z0-9]+_rig_layout_v[0-9]{3}.xml$',os.path.basename(self.copy)):
            confirmDialog('\nInvalid source file.',1)
            return
        if not confirmDialog('Copying layout from\n\n%s\n\nContinue?' % os.path.basename(self.copy)): return
        
        char = self.currentCharacter()
        done = bodyPublish.publishRigLayout(char.name,self.copy,'Copied from %s' % self.copy)
        
        if done:
            self.statusBar().showMessage('Copied Layout from: %s' % os.path.basename(self.copy))
        else:
            self.statusBar().showMessage('Error Copying Layout from: %s' % os.path.basename(self.copy))
            
        self.refreshComponents()
        data = char.getLayoutData()
        
        if not data: return
        
        for namespace,asset,mapping,symmetry,count in data:
            namespace         = QtCore.QVariant(namespace)
            componentDelegate = bodyModel.ComponentDelegate(self,self.modelComp.rowCount())
            symmetry          = int(symmetry)
            count             = int(count)
            
            self.modelComp.insertRow(namespace,componentDelegate,symmetry,count)
            self.tableViewComponent.setItemDelegateForColumn(1,componentDelegate)
            self.tableViewComponent.openPersistentEditor(self.modelComp.index(self.modelComp.rowCount()-1,1))
            
            componentDelegate.dropdown.setCurrentIndex(componentDelegate.dropdown.findText(asset))
            
            # reset first entry
            self.modelComp.components[self.modelComp.rowCount()-1][0] = namespace
            
        self.tableViewComponent.setFocus()
        
    def on_actionPasteGuide_triggered(self,checked=None):
        
        if checked is None: return
        
        if not self.copy: 
            confirmDialog('\nNothing to copy.',1)
            return
        if not re.match('[a-zA-Z0-9]+_rig_guide_v[0-9]{3}.ma$',os.path.basename(self.copy)):
            confirmDialog('\nInvalid source file.',1)
            return
        if not confirmDialog('Copying guide from\n\n%s\n\nContinue?' % os.path.basename(self.copy)): return
        
        char = self.currentCharacter()
        done = bodyPublish.publishRigGuide(char.name,self.copy,'Copied from %s' % self.copy)
        
        if done:
            self.statusBar().showMessage('Copied Guide from: %s' % os.path.basename(self.copy))
        else:
            self.statusBar().showMessage('Error Copying Guide from: %s' % os.path.basename(self.copy))
        
        
    def on_actionPasteMapping_triggered(self,checked=None):
        
        if checked is None: return    
        
        if not self.copy: 
            confirmDialog('\nNothing to copy.',1)
            return
        if not re.match('[a-zA-Z0-9]+_rig_mapping_v[0-9]{3}.json$',os.path.basename(self.copy)):
            confirmDialog('\nInvalid source file.',1)
            return
        if not confirmDialog('Copying mapping from\n\n%s\n\nContinue?' % os.path.basename(self.copy)): return
        
        char = self.currentCharacter()
        done = bodyPublish.publishRigMapping(char.name,self.copy,'100','Copied from %s' % self.copy)
        
        if done:
            self.statusBar().showMessage('Copied Mapping from: %s' % os.path.basename(self.copy))
        else:
            self.statusBar().showMessage('Error Copying Mapping from: %s' % os.path.basename(self.copy))
        
        
    def on_actionPasteControlData_triggered(self,checked=None):
        
        if checked is None: return
        
        if not self.copy: 
            confirmDialog('\nNothing to copy.',1)
            return
        if not re.match('[a-zA-Z0-9]+_rig_data_v[0-9]{3}.json$',os.path.basename(self.copy)):
            confirmDialog('\nInvalid source file.',1)
            return
        if not confirmDialog('Copying control data from\n\n%s\n\nContinue?' % os.path.basename(self.copy)): return
        
        char = self.currentCharacter()
        done = bodyPublish.publishRigData(char.name,self.copy,'Copied from %s' % self.copy)
        
        if done:
            self.statusBar().showMessage('Copied Control Data from: %s' % os.path.basename(self.copy))
        else:
            self.statusBar().showMessage('Error Copying Control Data from: %s' % os.path.basename(self.copy))



def showBodyRigBuilderUI():
    
    qMainWindow = getMayaWindow()
    
    for child in qMainWindow.children():
        if not hasattr(child, 'isWindow'):
            continue
        
        if not child.isWindow():
            continue
        
        if child.windowTitle() == 'Body Builder':
            if not child.isVisible():
                child.show()
            child.activateWindow()
            return True
            
    window = RigWindowUser(qMainWindow)
    window.showWindow()
    window.activateWindow()
    
    return True

