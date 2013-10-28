'''
Created on  11/09/2013

@author: caleb.bell
'''

import sys
import types

import maya.mel
import pymel.core


def clampValue(value, minValue=0.0, maxValue=1.0):
    return min([maxValue, max(value, minValue)])


def createFourByFourFromMatrix(matrix):
    if not isinstance(matrix, (pymel.core.datatypes.Matrix, types.ListType)):
        return False
    a = pymel.core.createNode('fourByFourMatrix')
    count = 0
    for i in range(4):
        for j in range(4):
            if isinstance(matrix, pymel.core.datatypes.Matrix):
                a.attr('in%d%d' % (i, j)).set(matrix[i][j])
            elif isinstance(matrix, types.ListType):
                a.attr('in%d%d' % (i, j)).set(matrix[count])
            count += 1
    return a


def functionDebugDecorator(fn):

    def wrapped(*args, **kwargs):
        try:
            return fn(*args, **kwargs)

        finally:
            sys.stdout.write(
                'Debug Decorator:\nFucntion:%s\n*args:%s\n**kwargs:%s\n' % (
                    fn, args, kwargs)
            )

    wrapped.__name__ = fn.__name__
    wrapped.__doc__ = fn.__doc__

    return wrapped


def layoutGuidesOnCurve(curve, namePrefix='C_tongue', num=6):
    curve = pymel.core.PyNode(curve)
    guides = list()

    for i in range(num):
        uVal = maya.mel.eval('linstep(0, 1, %f);' % ((1.0 / (num - 1)) * i))

        guideName = '%s_gui_%d' % (namePrefix, i + 1)

        if not pymel.core.objExists(guideName):
            guides.append(pymel.core.general.spaceLocator(name=guideName))
        else:
            guides.append(pymel.core.PyNode(guideName))

        pci = pymel.core.createNode('pointOnCurveInfo')

        curve.getChildren(shapes=True)[0].worldSpace >> pci.inputCurve

        pci.top.set(True)
        pci.parameter.set(uVal)

        pci.result.position >> guides[-1].translate
        pci.result.position // guides[-1].translate

        pymel.core.delete(pci)

    for i in range(len(guides)):
        if i != (len(guides) - 1):
            pymel.core.delete(pymel.core.animation.aimConstraint(
                guides[i + 1], guides[i], aim=[1.0, 0.0, 0.0],
                u=[0.0, 1.0, 0.0], wut='scene'))
        else:
            pymel.core.delete(pymel.core.animation.aimConstraint(
                guides[i - 1], guides[i], aim=[-1.0, 0.0, 0.0],
                u=[0.0, 1.0, 0.0], wut='scene'))

    return guides


def layoutGuidesOnSelectedCurve(namePrefix='C_tongue', num=6):

    curve = pymel.core.general.ls(sl=1)
    if not curve:
        return False

    if not curve[0].getChildren(s=True, ni=True, typ='nurbsCurve'):
        return False

    return layoutGuidesOnCurve(curve[0], namePrefix, num)


def listHistoryByType(node, nodeType, **kwargs):
    ''' A wrapper for Maya's listHistory Command that lets me easily filter
    particular node types. '''
    
    result = list()
    
    for item in pymel.core.listHistory(node, **kwargs):
        if not item.type() == nodeType:
            continue
            
        result.append(item)
        
    return result


def restoreSelectionDecorator(fn):

    def wrapped(*args, **kwargs):

        try:
            sel = maya.cmds.ls(sl=True) or None
            return fn(*args, **kwargs)

        finally:
            maya.cmds.select(sel)

    wrapped.__name__ = fn.__name__
    wrapped.__doc__ = fn.__doc__

    return wrapped

