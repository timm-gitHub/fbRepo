"""

    Methods for importing/exporting assets/data
    -------------------------------------------

    Author: Evan Jacobson

    This is a test

"""

import json, os, string, bodyPublish
import maya.cmds as cmds
import maya.mel as mel
from rigBuilder import rigUtils


def exportControlData(file):

    # store control shape info
    buffer = {}
    ctlbuffer = {}
    shapes = cmds.ls('*_ctl_*', type='nurbsCurve')
    for shp in shapes:

        shpbuffer = {}
        spans = cmds.getAttr('%s.spans' % shp)
        if not spans: continue
        
        deg = 0
        if not cmds.getAttr('%s.form' % shp): deg = 3

        for i, space in enumerate(['objectSpace', 'worldSpace']):

            shpbuffer[space] = {}

            for j in range(spans + deg):
                pos = cmds.xform('%s.cv[%s]' % (shp, j), q=True, ws=i, t=True)
                shpbuffer[space][j] = [pos[0], pos[1], pos[2]]

        ctlbuffer[shp] = shpbuffer

    if not ctlbuffer:
        rigUtils.log('Nothing to write', 'w')
        return

    buffer['**CONTROL_DATA**'] = ctlbuffer

    # dump
    j = json.dumps(buffer, sort_keys=True, indent=2)

    rigUtils.log('Writing file: %s' % file)

    f = open(file, 'w')
    f.write(j)
    f.close()


def exportSkinByObject(dagnode, file):
    """Export skin data for single object."""

    buffer = {}
    dict = rigUtils.getDefDictionary(dagnode)
    if dict: buffer[dagnode] = dict

    exportSkin(buffer, file)


def exportSkinByRef(ref, file):
    """Export skin data for all transforms nodes in reference."""

    buffer = {}

    if cmds.namespace(ex=ref):

        cmds.namespace(set=ref)
        dagnodes = cmds.namespaceInfo(lod=True)
        cmds.namespace(set=':')

        for dagnode in dagnodes:
            if not cmds.objectType(dagnode, isType='mesh'): continue
            dagnode = cmds.listRelatives(dagnode, p=True)[0]
            dict = rigUtils.getDefDictionary(dagnode)
            if dict: buffer[dagnode] = dict

    exportSkin(buffer, file)


def exportSkinBySel(file):
    """Export skin data for selection."""

    buffer = {}
    for dagnode in cmds.ls(sl=True):
        dict = rigUtils.getDefDictionary(dagnode)
        if dict: buffer[dagnode] = dict

    exportSkin(buffer, file)


def exportSkinByTag(file, tag='skinImportExport'):
    """Export skin data for all dag nodes tagged with the skinImportExport attr set to tag."""

    buffer = {}
    for dagnode in cmds.ls(dag=True, recursive=True):
        # bit of a hack. try/fail faster than attributeQuery
        try:
            cmds.getAttr('%s.%s' % (dagnode, tag))
        except:
            continue

        dict = rigUtils.getDefDictionary(dagnode)
        if dict: buffer[dagnode] = dict

    exportSkin(buffer, file)


def exportSkin(buffer, file):

    # dump
    j = json.dumps(buffer, sort_keys=True, indent=2)

    rigUtils.log('Writing file: %s' % file)

    f = open(file, 'w')
    f.write(j)
    f.close()


def importComponent(asset):

    path = bodyPublish.getComponentGuide(asset)

    if not path:
        rigUtils.log('Component not found: %s' % asset, 'e')
        return

    cmds.file(path, i=True, ra=False)

    rigUtils.log('Component imported: %s' % path)


def importControlData(file, selected=None, worldSpace=False):

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    if not '**CONTROL_DATA**' in j: return

    rigUtils.log('Updating control shapes')

    controlData = j['**CONTROL_DATA**']

    for shp in controlData:

        if not cmds.objExists(shp):
            rigUtils.log('Shape not found in Data. Skipping: %s' % shp)
            continue

        if selected:
            parent = cmds.listRelatives(shp, p=True)[0]
            if parent not in selected: continue

        pointData = None
        if not ('objectSpace' in controlData[shp].keys() and 'worldSpace' in controlData[shp].keys()):
            worldSpace = True
            pointData = controlData[shp]

        else:
            if not worldSpace:
                pointData = controlData[shp]['objectSpace']
            else:
                pointData = controlData[shp]['worldSpace']

        for cv in pointData:
            cmds.xform('%s.cv[%s]' % (shp, cv), t=pointData[cv], ws=worldSpace, os=abs(1 - worldSpace), a=True)


def importDeformersBySel(file):

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    for dagnode in cmds.ls(sl=True):
        importDeformer(dagnode, j)


def importDeformersByObject(dagnode, file):

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    importDeformer(dagnode, j)


def importDeformersByMirroredObject(dagnode, file):

    # look for the mapping
    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    # get the mirrored object
    buffer = dagnode.split('_')
    locus = buffer[0][-1]

    if locus == 'R':
        buffer[0] = '%sL' % buffer[0][:-1]
        mirror = string.join(buffer, '_')
    elif locus == 'L':
        buffer[0] = '%sR' % buffer[0][:-1]
        mirror = string.join(buffer, '_')
    else:
        rigUtils.log('Select a valid mesh')
        return

    if mirror not in j:
        rigUtils.log('Mirror object not found in json file: %s' % mirror)
        return

    # get the skin cluster on the target object
    skincluster = rigUtils.findSkinClusterOnNode(dagnode)

    # step through the deformers of the mirrored object
    dict = j[mirror]
    for mirrorDeformer in dict:

        if mirrorDeformer == 'skinCluster': continue
        if not cmds.objExists(mirrorDeformer): continue

        # get the corresponding deformer on the target object
        buffer = mirrorDeformer.split('_')
        locus = buffer[0][-1]

        if locus == 'R':
            buffer[0] = '%sL' % buffer[0][:-1]
            deformer = string.join(buffer, '_')
        elif locus == 'L':
            buffer[0] = '%sR' % buffer[0][:-1]
            deformer = string.join(buffer, '_')
        else:
            deformer = mirrorDeformer

        pointdata = dict[mirrorDeformer]
        set = '%sSet' % deformer

        # ffd
        if cmds.objectType(deformer, isType='ffd'):
            i = 0
            while(True):
                if i == len(pointdata): break
                if pointdata[i] == '1' and cmds.objExists(set):
                    cmds.sets('%s.vtx[%s]' % (dagnode, i), add=set)
                i = i + 1
            continue

        # if the corresponding deformer isn't influencing the target object, make it so
        existingdeformers = mel.eval('findRelatedDeformer "%s"' % dagnode)
        if not deformer in existingdeformers:
            if cmds.objExists(set): cmds.sets(dagnode, add=set)

        # step through each vert and update the weights for the target objects deformer
        i = 0
        while(True):
            if i == len(pointdata): break
            value = pointdata[i]
            cmds.percent(deformer, '%s.vtx[%s]' % (dagnode, i), v=float(value))
            i = i + 1

        # rearrange the deformers to come before any skincluster
        if skincluster: cmds.reorderDeformers(skincluster, deformer, dagnode)

        rigUtils.log('Deformer weighting updated: %s' % deformer)


def importDeformers(file, skip=[]):

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    for dagnode in j:

        if dagnode == '**CONTROL_DATA**':
            continue
        if not cmds.objExists(dagnode):
            continue
        if dagnode in skip:
            continue
        importDeformer(dagnode, j)


def importDeformer(dagnode, j):

    if dagnode not in j:
        rigUtils.log('Dagnode not found in json file: %s' % dagnode)
        return

    # temporarily disable deleteComponent nodes
    for delComp in cmds.ls('deleteComponent*'):
        cmds.setAttr('%s.nodeState' % delComp, 1)

    skincluster = rigUtils.findSkinClusterOnNode(dagnode)
    dict = j[dagnode]

    for deformer in dict:

        if deformer == 'skinCluster': continue
        if not cmds.objExists(deformer): continue

        pointdata = dict[deformer]
        set = '%sSet' % deformer
        existingdeformers = mel.eval('findRelatedDeformer "%s"' % dagnode)

        # ffd
        if cmds.objectType(deformer, isType='ffd'):
            i = 0
            while(True):
                if i == len(pointdata): break
                if pointdata[i] == '1' and cmds.objExists(set):
                    cmds.sets('%s.vtx[%s]' % (dagnode, i), add=set)
                i = i + 1
            
            if skincluster: cmds.reorderDeformers(skincluster,deformer,dagnode)
                
            continue

        # all other deformers
        if not deformer in existingdeformers:
            if cmds.objExists(set): cmds.sets(dagnode, add=set)

        i = 0
        while(True):
            if i == len(pointdata): break
            value = pointdata[i]
            cmds.percent(deformer, '%s.vtx[%s]' % (dagnode, i), v=float(value))
            i = i + 1

        if skincluster: cmds.reorderDeformers(skincluster, deformer, dagnode)

        rigUtils.log('Deformer weighting updated: %s' % deformer)

    # turn deleteComponent nodes back on
    for delComp in cmds.ls('deleteComponent*'):
        cmds.setAttr('%s.nodeState' % delComp, 0)


def importSkinByObject(dagnode, file):
    """Import skin for specific dagnode."""

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    skinned = []

    if dagnode in j:
        dict = j[dagnode]
        skindict = dict['skinCluster']
        importSkin(skindict, dagnode)
        skinned.append(dagnode)

    return skinned

def importSkinByMirroredObject(dagnode, file):
    """Import skin for specific dagnode."""

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    skinned = []
    buffer = dagnode.split('_')
    locus = buffer[0][-1]

    if locus == 'R':
        buffer[0] = '%sL' % buffer[0][:-1]
        mirror = string.join(buffer, '_')
    elif locus == 'L':
        buffer[0] = '%sR' % buffer[0][:-1]
        mirror = string.join(buffer, '_')
    else:
        rigUtils.log('Select a valid mesh')
        return

    if mirror in j:
        dict = j[mirror]
        skindict = dict['skinCluster']
        importSkin(skindict, dagnode, mirrored=True)
        skinned.append(dagnode)

    return skinned

def importSkinByRef(ref, file, skip=[], **kwargs):
    """Import skin for every dag node in reference."""

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    cmds.namespace(set=ref)
    dagnodes = cmds.namespaceInfo(lod=True)
    cmds.namespace(set=':')

    skinned = []

    for dagnode in dagnodes:
        if skip:
            if dagnode in skip:
                continue
        if dagnode in j:
            dict = j[dagnode]
            try: skindict = dict['skinCluster']
            except: continue
            importSkin(skindict, dagnode, **kwargs)
            skinned.append(dagnode)

    return skinned


def importSkinBySel(file):
    """Import skin for all selected dag nodes."""

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    skinned = []

    for dagnode in cmds.ls(sl=True):
        # if ('%s0' % dagnode[:-1]) in j:
        if dagnode in j:
            # dict = j[('%s0' % dagnode[:-1])]
            dict = j[dagnode]
            skindict = dict['skinCluster']
            importSkin(skindict, dagnode)
            skinned.append(dagnode)
        else:
            rigUtils.log('Dagnode not found in json: %s' % dagnode)

    return skinned


def importSkinBySkin(file, **kwargs):
    """Import skin and apply to all geometry in skin file."""

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    skinned = []

    for dagnode in j:

        if dagnode == '**CONTROL_DATA**': continue

        if not cmds.objExists(dagnode):
            rigUtils.log('Searching for object from Skin. Not Found: %s' % dagnode)
            continue

        dict = j[dagnode]
        skindict = dict['skinCluster']
        importSkin(skindict, dagnode, **kwargs)
        skinned.append(dagnode)

    return skinned


def importSkinByTag(tag, file):
    """Import skin for all objects with specific tag under skinImportExport attribute."""

    if not os.path.exists(file):
        rigUtils.log('Skin file not found - skipping: %s' % file)
        return

    rigUtils.log('Reading file: %s' % file)

    f = open(file, 'r')
    j = json.loads(f.read())
    f.close()

    skinned = []

    for dagnode in cmds.ls('*.%s' % tag, o=True, r=True):
        if dagnode not in j: continue

        dict = j[dagnode]
        skindict = dict['skinCluster']
        importSkin(skindict, dagnode)
        skinned.append(dagnode)

    return skinned


def importSkin(skindict, geo, count=0, mirrored=False, **kwargs):
    """Import and apply skin weighting from json file."""

    influences = skindict['influences']
    pointdata  = skindict['pointdata']
    notfound   = []
    tmp        = []
    
    for inf in influences:
        if mirrored:
            if inf[0] == 'R':
                inf = 'L%s' % inf[1:]
            elif inf[0] == 'L':
                inf = 'R%s' % inf[1:]
            tmp.append(inf)

        if not cmds.objExists(inf): notfound.append(inf)

    # switch around the influences
    if mirrored: influences = tmp

    # test influence existence
    if notfound:
        msg = 'Influences Not Found For: %s\n' % geo
        for nf in notfound:
            msg = '%s%s\n' % (msg, nf)

        rigUtils.log(msg, 'e')
        return False

    # test skin cluster existence
    skincluster = rigUtils.findSkinClusterOnNode(geo)
    
    if skincluster: cmds.delete(skincluster)
    #if not skincluster:
        
    # ensure geo is visible
    shps   = cmds.listRelatives(geo, s=True)
    geosrc = cmds.listConnections('%s.v' % geo, s=True, d=False, p=True)

    if geosrc:
        cmds.disconnectAttr(geosrc[0], '%s.v' % geo)
        cmds.setAttr('%s.v' % geo, 1)
    for shp in shps:
        shpsrc = cmds.listConnections('%s.v' % shp, s=True, d=False, p=True)
        if shpsrc:
            cmds.disconnectAttr(shpsrc[0], '%s.v' % shp)
            cmds.setAttr('%s.v' % shp, 1)
    # apply
    ###################################################################
    # hack - need to replace with storing of skin position in JSON file
    ###################################################################

    bShapes = None
    shape = cmds.listRelatives(geo, ad=True, s=True)
    if shape:
        bShapes = cmds.listConnections(shape[0], s=True, d=False, p=False, type='blendShape')

#         if 'jacket' in geo:
#             skincluster = cmds.skinCluster(influences, geo, sm=2, foc=False, tsb=True, nw=2)[0]
#         elif bShapes and cmds.objExists('%s.frontOfChain' % bShapes[0]): # frontOfChain tag for corrective blendShapes
#             skincluster = cmds.skinCluster(influences, geo, sm=2, foc=False, tsb=True, nw=2)[0]
#         else:
#             skincluster = cmds.skinCluster(influences, geo, sm=2, foc=True, tsb=True, nw=2)[0]

    VALID_ARGS = [
        ('af', 'after'),
        ('ar', 'afterReference'),
        ('bf', 'before'),
        ('ex', 'exclusive'),
        ('foc', 'frontOfChain'),
        ('par', 'parallel')
        ]

    skinArgs = dict()

    if not kwargs:
        skinArgs['foc'] = True
    else:
        for item in VALID_ARGS:
            for i in item:
                if i in kwargs:
                    skinArgs[i] = kwargs[i]
                    break

    skincluster = cmds.skinCluster(influences, geo, sm=2, tsb=True, nw=1, **skinArgs)[0]

    # reconnect
    if geosrc: cmds.connectAttr(geosrc[0], '%s.v' % geo)
    if shpsrc: cmds.connectAttr(shpsrc[0], '%s.v' % shp)
    
    # Check to see that the influences are actually attached to the skinCluster.
    invalidInfs = list()
    skinInfluences = cmds.skinCluster(skincluster, q=True, inf=True)

    for influence in influences:
        if not influence in skinInfluences: invalidInfs.append(influence)

    if invalidInfs:
        msg = str()
        for inf in invalidInfs:
            msg += '%s is not an influence object for skinCluster %s\n' % (inf, skincluster)

        rigUtils.log(msg, 'e')
        return False

    # We need to know what we're applying the weights too so we can get the
    # component identifier correct.
    cidDict = {
        'lattice':'pt',
        'mesh':'vtx',
        'nurbsCurve':'cv',
        'nurbsSurface':'cv'
        }

    cid = cidDict[cmds.objectType(cmds.skinCluster(skincluster, q=True, g=True)[0])]

    rigUtils.log('Applying skin: %s' % geo)

    # Get the size of the weight array.
    arraySize = cmds.getAttr('%s.weightList' % skincluster, size=True)

    # Start the progress bar.
    gMainProgressBar = mel.eval('$tmp = $gMainProgressBar')
    cmds.progressBar(gMainProgressBar, e=True, bp=True, ii=True, st='Applying weights to %s' % geo, max=arraySize)

    # Apply the weights.
    for i in range(arraySize):
        #  Increase the progress bar.
        if cmds.progressBar(gMainProgressBar, q=True, ic=True): break
        cmds.progressBar(gMainProgressBar, e=True, s=1)

        try: point = pointdata[unicode(i)]
        except KeyError:
            rigUtils.log('Mismatching number of verts for %s' % geo, 'w')
            break

        weights = point['skinweights']
        blendweight = point['blendweight']

        for j, value in enumerate(weights):
            cmds.setAttr('%s.weightList[%d].weights[%d]' % (skincluster, i, j), value)

        cmds.setAttr('%s.blendWeights[%d]' % (skincluster, i), blendweight)

    # Stop the progress bar.
    cmds.progressBar(gMainProgressBar, e=True, ep=True)

    rigUtils.log('Skin applied: %s' % geo)
