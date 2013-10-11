import datetime
import os
import shutil
import tempfile
import types

import maya.cmds

TEMP_GROUP_NAME = 'tempGroup'
TEMP_NAMESPACE = 'tempNamespace'


def cleanMayaAsciiFile(filePath):

    temp = tempfile.mkstemp('.ma')[1]
    fin = open(filePath, 'r')
    fout = open(temp, 'w')

    # remove lockNode commands from ma file
    for line in fin.readlines():
        if 'lockNode' in line: continue
        fout.write(line)

    fin.close()
    fout.close()

    shutil.copyfile(temp, filePath)
    
    return True


def confirmFilePath(filePath):
    if isinstance(filePath, basestring):
        if not os.path.exists(os.path.expandvars(filePath).replace('\\', '/')):
            return None

    elif isinstance(filePath, list):
        for i, v in enumerate(filePath):
            if not os.path.exists(os.path.expandvars(v).replace('\\', '/')):
                filePath[i] = None

    else:
        return None

    return filePath


def getFileNamesByExt(path, ext):

    result = list()

    if not os.path.exists(path):
        return result

    for entry in os.listdir(path):

        fullPath = os.path.join(path, entry)

        if not os.path.isfile(fullPath):
            continue

        if ext != os.path.splitext(entry)[-1]:
            continue

        result.append(entry)

    return sorted(result)


def getTempFilePath(tokens=['temp'], extension='ma'):

    # We need to do this to prevent namespace errors.
    allTokens = list()
    allTokens.extend(tokens)

    # Get temp directory path.
    tempDir = os.getenv('TEMP')

    # Get date/time.
    dto = datetime.datetime.now()
    allTokens.append(dto.strftime('%Y%m%d'))
    allTokens.append(dto.strftime('%H%M%S'))

    # Append the file extension.
    allTokens.append(extension)

    # Construct the file name.
    fileName = str()
    for i, token in enumerate(allTokens):
        fileName += '%s' % str(token)
        if not i == (len(allTokens) - 1):
            fileName += '.'

    return os.path.join(tempDir, fileName)


def importUnderGroup(filePath, group, namespace=None):

    if not os.path.exists(filePath):
        return None

    maya.cmds.file(filePath, i=True, ns=TEMP_NAMESPACE, gn=TEMP_GROUP_NAME, gr=True)

    # Reparent
    if not maya.cmds.objExists(group):
        maya.cmds.createNode('transform', name=group)
    else:
        maya.cmds.parent(maya.cmds.listRelatives(TEMP_GROUP_NAME, c=True), group)
        maya.cmds.delete(TEMP_GROUP_NAME)

    # Namespace
    if isinstance(namespace, types.NoneType):
        namespace = ':'

    if not maya.cmds.namespace(ex=namespace):
        maya.cmds.namespace(add=namespace)

    maya.cmds.namespace(mv=[TEMP_NAMESPACE, namespace])
    maya.cmds.namespace(rm=TEMP_NAMESPACE)

    return True


def referenceUnderGroup(filePath, group, namespace):

    if not os.path.exists(filePath):
        return None

    maya.cmds.file(filePath, r=True, ns=namespace, gn=TEMP_GROUP_NAME, gr=True)

    # Reparent
    if not maya.cmds.objExists(group):
        maya.cmds.createNode('transform', name=group)
    else:
        maya.cmds.parent(maya.cmds.listRelatives(TEMP_GROUP_NAME, c=True), group)
        maya.cmds.delete(TEMP_GROUP_NAME)

    return True
