"""

    Models for managing content of character list and component table
    -----------------------------------------------------------------
    
    Author: Evan (The Man) Jacobson
        
"""

from PyQt4 import QtGui, QtCore
from rigBuilder import rigEnv
import os

class ComponentDelegate(QtGui.QItemDelegate):
    
    def __init__(self, parent):
        
        QtGui.QItemDelegate.__init__(self, parent)
        self.dropdown = None
        
    def createEditor(self, parent, option, index):
        
        self.dropdown = QtGui.QComboBox(parent)
        components    = []
        contents      = os.listdir(rigEnv.ROOTCOMP)
        contents.sort()
        for component in contents:
            if component[0] != '.': components.append(component) 
        
        self.dropdown.addItems(components)
        
        return self.dropdown
    
    
class CharModel(QtCore.QAbstractListModel):
    """
    Data Model for handling display of list data. For use in character list view.
    
    Methods:
      clear     - remove all rows
      data      - do stuff with data, display, edit, set etc..
      insertRow - add row and populate with data
      removeRow - remove row
      rowCount  - return number of rows
    
    Attributes:
      characters - list of QVariant objects
    
    """
    
    def __init__(self,characters=[],parent=None):
        
        QtCore.QAbstractListModel.__init__(self,parent)
        self.characters = characters
    
    
    def clear(self):
        """Remove all rows."""
        
        count = self.rowCount() - 1
        while True:
            if count < 0: break
            self.removeRow(count)
            count = count - 1
    
    
    def data(self,index,role):
        """Display data."""
        
        if role == QtCore.Qt.DisplayRole:
            
            row = index.row()
            return self.characters[row]
            
    
    def insertRow(self,text,parent=QtCore.QModelIndex()):
        """Add new row and populate with text."""
        
        row = self.rowCount()
        
        self.beginInsertRows(QtCore.QModelIndex(),row,row)
        
        label  = QtCore.QVariant(text)
        
        self.characters.insert(row,label)
        
        self.endInsertRows()
    
    
    def removeRow(self,row,parent=QtCore.QModelIndex()):
        """Remove specified row."""
        
        self.beginRemoveRows(QtCore.QModelIndex(),row,row)
        
        if len(self.characters):
            self.characters.pop(row)
        
        self.endRemoveRows()

    
    def rowCount(self,parent=QtCore.QModelIndex()):
        """Return number of rows."""
        
        return len(self.characters)
    

class CompModel(QtCore.QAbstractTableModel):
    """ 
    Data Model for handling display of table data. For use in component table view.
    
    Methods:
      clear       - remove all rows and columns
      columnCount - return number of columns
      data        - do stuff with data, display, edit, set etc..
      flags       - specify what table elemnts are selectable, enabled, editable
      headerData  - return header names
      insertRow   - add row and populate with data
      removeRow   - remove row
      rowCount    - return number of rows
      setData     - do stuff when editing table entry 
      
    Attributes:
      headerData - list of header names
      components - list of list of QVariants
      
    """
    
    def __init__(self, components=[[]], 
                       headerdata=['Component Name','Rig Component','mapping','def','sym','#'], parent=None):
        
        QtCore.QAbstractTableModel.__init__(self, parent)
        
        self.headerdata = headerdata
        self.components = components
        
    
    def clear(self):
        """Remove all rows from table."""
        
        count = self.rowCount() - 1
        while True:
            if count < 0: break
            self.removeRow(count)
            count = count - 1
    
    
    def columnCount(self,parent=QtCore.QModelIndex()):
        """Return number of columns."""
        
        return 6
    
    
    def data(self,index,role=QtCore.Qt.DisplayRole):
        """Do stuff with data."""
        
        if not index.isValid():
            return None
        
        if not self.components[0]:
            return None
        
        if index.column() == 4 or index.column() == 3:
            if role == QtCore.Qt.CheckStateRole:
                return self.components[index.row()][index.column()]
        
        else:
            if role == QtCore.Qt.DisplayRole or role == QtCore.Qt.EditRole:
                return self.components[index.row()][index.column()]
        
        if index.column() == 5:
            if role == QtCore.Qt.TextAlignmentRole:
                return QtCore.Qt.AlignHCenter
             
    
    def flags(self, index):
        """Set state of table elements."""
        
        if index.column() == 4 or index.column() == 3:
            return QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsUserCheckable
        else:
            return QtCore.Qt.ItemIsEditable | QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable
    
    
    def headerData(self, section, orientation, role):
        """Return header names."""
        
        if role == QtCore.Qt.DisplayRole:
            return self.headerdata[section]
    
    
    def insertRow(self,name,asset,mapping,symmetry=1,count=1,parent=QtCore.QModelIndex()):
        """Insert row in table."""
        
        row = self.rowCount()
        
        self.beginInsertRows(QtCore.QModelIndex(),row,row)
        
        labelA = QtCore.QVariant(name)
        labelB = QtCore.QVariant(asset)
        labelC = QtCore.QVariant(mapping)
        labelD = 0
        labelE = symmetry
        labelF = QtCore.QVariant(count)
        
        self.components.insert(row,[labelA,labelB,labelC,labelD,labelE,labelF])
        
        self.endInsertRows()
        
    
    def removeRow(self,row,parent=QtCore.QModelIndex()):
        """Remove specified row from table."""
        
        self.beginRemoveRows(QtCore.QModelIndex(),row,row)
        
        if len(self.components):
            self.components.pop(row)
    
        self.endRemoveRows()
    
    
    def rowCount(self,parent=QtCore.QModelIndex()):
        """Return number of rows."""
        
        return len(self.components)
    
    
    def setData(self, index, value, role = QtCore.Qt.EditRole):
        """Do stuff when changing table entry."""
        
        if index.column() == 4 or index.column() == 3:
            
            if role == QtCore.Qt.CheckStateRole:
                
                state = self.components[index.row()][index.column()]
                if state:
                    self.components[index.row()][index.column()] = 0
                else:
                    self.components[index.row()][index.column()] = 1
                self.dataChanged.emit(index, index)
                return True
        
        else:
            
            if role == QtCore.Qt.EditRole or role == QtCore.Qt.CheckStateRole:
                
                self.components[index.row()][index.column()] = value
                self.dataChanged.emit(index, index)
                return True
        
        if index.column() == 5:
            if role == QtCore.Qt.TextAlignmentRole:
                return QtCore.Qt.AlignHCenter
            
        return False


class CompUserModel(QtCore.QAbstractTableModel):
    
    def __init__(self, components=[[]], 
                       headerdata=['Name in Scene','Name on Server','sym','#'], parent=None):
        
        QtCore.QAbstractTableModel.__init__(self, parent)
        
        self.headerdata = headerdata
        self.components = components
        
    
    def clear(self):
        """Remove all rows from table."""
        
        count = self.rowCount() - 1
        while True:
            if count < 0: break
            self.removeRow(count)
            count = count - 1
    
    
    def columnCount(self,parent=QtCore.QModelIndex()):
        """Return number of columns."""
        
        return 4
    
    
    def data(self,index,role=QtCore.Qt.DisplayRole):
        """Return the data for the given index."""
        
        if not index.isValid() or not self.components[0]:
            return None
        
        if index.column() == 2:
            if role == QtCore.Qt.CheckStateRole:
                return self.components[index.row()][index.column()]
        
        else:
            if role == QtCore.Qt.DisplayRole or role == QtCore.Qt.EditRole:
                return self.components[index.row()][index.column()]
        
        if index.column() == 3:
            if role == QtCore.Qt.TextAlignmentRole:
                return QtCore.Qt.AlignHCenter
             
    
    def flags(self, index):
        """Set state of table elements."""
        
        if index.column() == 2:
            return QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsUserCheckable
        else:
            return QtCore.Qt.ItemIsEditable | QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable
    
    
    def headerData(self, section, orientation, role):
        """Return header names."""
        
        if role == QtCore.Qt.DisplayRole:
            return self.headerdata[section]
    
    
    def insertRow(self,name,asset,symmetry=1,count=1,parent=QtCore.QModelIndex()):
        """Insert row in table."""
        
        row = self.rowCount()
        
        self.beginInsertRows(QtCore.QModelIndex(),row,row)
        self.components.insert(row,[name,asset,symmetry,count])
        self.endInsertRows()
        
    
    def removeRow(self,row,parent=QtCore.QModelIndex()):
        """Remove specified row from table."""
        
        self.beginRemoveRows(QtCore.QModelIndex(),row,row)
        
        if len(self.components): self.components.pop(row)
    
        self.endRemoveRows()
    
    
    def rowCount(self,parent=QtCore.QModelIndex()):
        """Return number of rows."""
        
        return len(self.components)
    
    
    def setData(self, index, value, role = QtCore.Qt.EditRole):
        """Do stuff when changing table entry."""
        
        if index.column() == 2:
            
            if role == QtCore.Qt.CheckStateRole:
                
                state = self.components[index.row()][index.column()]
                if state:
                    self.components[index.row()][index.column()] = 0
                else:
                    self.components[index.row()][index.column()] = 1
                self.dataChanged.emit(index, index)
                
                return True
        
        elif index.column() == 3:
            
            if role == QtCore.Qt.TextAlignmentRole:
                return QtCore.Qt.AlignHCenter
            
            if role == QtCore.Qt.EditRole:
                
                self.components[index.row()][index.column()] = int(value.toString())
                self.dataChanged.emit(index, index)
                
                return True
        
        elif index.column() == 0:
            
            if role == QtCore.Qt.EditRole:
                
                self.components[index.row()][index.column()] = value
                self.dataChanged.emit(index, index)
                
                return True
            
        return False