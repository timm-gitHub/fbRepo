"""

    Methods for publishing new assets and working with existing published assets
    ----------------------------------------------------------------------------
    
    Author: Evan Jacobson
        
"""

import os, string, re, shutil, tempfile
import maya.cmds as cmds
from rigBuilder import rigUtils, rigEnv

def getLatestFile(path,pattern):
    """Return the latest asset as the base name."""
    
    if not os.path.isdir(path): return
    
    latest  = None
    version = 0
    
    for output in os.listdir(path):
        
        if not re.match(pattern,output): continue
        
        fileversion = int(re.search('v[0-9]{3}',output).group(0)[1:])
        
        if fileversion > version: 
            version = fileversion
            latest  = output
        
    return latest

def getVersionedFile(path,pattern,version):
    """Return the latest asset as the base name."""

    if not os.path.isdir(path): return
    
    f = None
    
    for output in os.listdir(path):
        
        if not re.match(pattern,output): continue
        
        fileversion = re.search('v[0-9]{3}',output).group(0)[1:]
        
        if fileversion == version: f = output
        
    return f

def getLatestVersion(path,pattern):
    """Return the latest asset version as a three digit string."""
    
    if not os.path.isdir(path): return
    
    latest  = None
    version = 0
    
    for output in os.listdir(path):
        
        if not re.match(pattern,output): continue
        
        fileversion = int(re.search('v[0-9]{3}',output).group(0)[1:])
        
        if fileversion > version: 
            version = fileversion
            latest  = str(version).zfill(3)
     
    return latest

def getNextFile(path,pattern):
    """Return the next asset as the base name."""
    
    latest = getLatestFile(path,pattern)
    
    if not latest:
        return string.replace(pattern,'[0-9]{3}','001')[:-1]
    
    version     = re.search('v[0-9]{3}',latest).group(0)[1:]
    nextversion = str(int(version)+1).zfill(3)
    
    return string.replace(latest,version,nextversion)

def getNextVersion(path,pattern):
    """Return the next asset as a three digit string."""
    
    latest = getLatestVersion(path,pattern)
    
    if not latest: 
        return '001'
    else:
        return str(int(latest)+1).zfill(3)
    
def getVersions(path,pattern):
    """Return all the versions of an asset as an array of 3 digit strings."""
    
    if not os.path.isdir(path): return
    
    versions = []
    
    for output in os.listdir(path):
        
        if not re.match(pattern,output): continue
        
        version = re.search('v[0-9]{3}',output).group(0)[1:]
        versions.append(version)
        
    versions.sort()
    
    return versions

def getComponent(component, typ='',relativepath=False):
    """Place holder for getting face component"""
    pass

def getComponentGuide(component, relativepath=False):
    """Return component guide."""

    path    = '%s/%s/guide/' % (rigEnv.ROOTCOMP, component)
    pattern = '[a-zA-Z0-9]+_guide_v[0-9]{3}.ma$'
    output  = getLatestFile(path,pattern)
    
    if not output: return
    
    return os.path.join(path,output)

def getComponentBuildScript(component, module, relativepath=False):
    """Return component prebuild or postbuild script."""

    path    = '%s/%s/%s/' % (rigEnv.ROOTCOMP, component, module)
    pattern = '[a-zA-Z0-9]+_%s_v[0-9]{3}.py$' % module
    output  = getLatestFile(path,pattern)
    
    if not output: return
    
    return os.path.join(path,output)

def getModel(character, lod, typ, relativepath=False):
    """Return character model."""
    
    path = '//bjserver3/Tank/blinky_bill_movie/assets/character/%s/Model/publish/maya' % character
    #path    = '%s/%s/model/%s/%s/mb' % (rigEnv.ROOTCHAR, character, lod, typ)
    #version = getLatestFile(path,'v[0-9]{3}')
    
    #if not version: return
    
    pattern = '[a-zA-Z0-9]+_model_100_base.v[0-9]{3}.ma$'
    #pattern = '[a-zA-Z0-9]+_model_%s_%s_v[0-9]{3}_[A-Z]{4}.mb$' % (lod, typ)
    #path    = os.path.join(path,version)
    output  = getLatestFile(path,pattern)
    
    if not output: return
    
    return os.path.join(path,output)    

def getPublishedAsset(path,pattern):
    """Retrieve the latest published asset from the server."""
    
    output = getLatestFile(path,pattern)
    
    if not output: return
    
    return os.path.join(path,output)

def getPublishedAssetVersion(path,pattern,version):
    """Retrieve the latest published asset from the server."""
    
    output = getVersionedFile(path,pattern,version)
    
    if not output: return
    
    return os.path.join(path,output)

def getPublishedAssetVersions(path,pattern):
    """Retrieve the asset versions from the server and return as an array of 3 digit numbers."""
    
    output = getVersions(path,pattern)
    
    if not output: return
    
    return output

def getRig(character, typ='anim', relativepath=False):
    """Return the latest character rig."""
    
    path    = '%s/%s/rig/body/%s' % (rigEnv.ROOTCHAR, character, typ)
    pattern = '[a-zA-Z0-9]+_body_rig_%s_v[0-9]{3}.ma$' % typ
    return getPublishedAsset(path,pattern)

def getRigVersion(character, version, typ='anim', relativepath=False):
    """Return specified version of character rig."""
    
    path    = '%s/%s/rig/body/%s' % (rigEnv.ROOTCHAR, character, typ)
    pattern = '[a-zA-Z0-9]+_body_rig_%s_v[0-9]{3}.ma$' % typ
    return getPublishedAssetVersion(path,pattern,version)

def getRigVersions(character, typ='anim', relativepath=False):
    """Return all the versions of a character rig as an array of 3 digit strings."""
    
    path    = '%s/%s/rig/body/%s' % (rigEnv.ROOTCHAR, character, typ)
    pattern = '[a-zA-Z0-9]+_body_rig_%s_v[0-9]{3}.ma$' % typ
    return getPublishedAssetVersions(path,pattern)

def getRigBuildScript(character, module, relativepath=False):
    """Return the latest character prebuild or postbuild script."""
    
    path    = '%s/%s/rig/body/%s' % (rigEnv.ROOTCHAR, character, module)
    pattern = '[a-zA-Z0-9]+_rig_%s_v[0-9]{3}.py$' % module
    return getPublishedAsset(path,pattern)

def getRigData(character, relativepath=False):
    """Return the latest character rig data."""
    
    path    = '%s/%s/rig/body/data' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_data_v[0-9]{3}.json$'
    return getPublishedAsset(path,pattern)

def getRigDataVersion(character, version, relativepath=False):
    """Return the specified version of character rig data."""
    
    path    = '%s/%s/rig/body/data' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_data_v[0-9]{3}.json$'
    return getPublishedAssetVersion(path,pattern,version)

def getRigDataVersions(character, relativepath=False):
    """Return all the versions of character rig data as an array of 3 digit strings."""
    
    path    = '%s/%s/rig/body/data' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_data_v[0-9]{3}.json$'
    return getPublishedAssetVersions(path,pattern)
    
def getRigGuide(character, relativepath=False):
    """Return the latest character guide rig."""
    
    path    = '%s/%s/rig/body/guide' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_guide_v[0-9]{3}.ma$'
    return getPublishedAsset(path,pattern)

def getRigGuideVersion(character, version, relativepath=False):
    """Return the specified version of a character guide rig."""
    
    path    = '%s/%s/rig/body/guide' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_guide_v[0-9]{3}.ma$'
    return getPublishedAssetVersion(path,pattern,version)

def getRigGuideVersions(character, relativepath=False):
    """Return all versions of a character guide rig as an array of 3 digit strings."""
    
    path    = '%s/%s/rig/body/guide' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_guide_v[0-9]{3}.ma$'
    return getPublishedAssetVersions(path,pattern)
    
def getRigLayout(character, relativepath=False):
    """Return the latest character rig layout."""
    
    path    = '%s/%s/rig/body/layout' % (rigEnv.ROOTCHAR, character)
    pattern = '[a-zA-Z0-9]+_rig_layout_v[0-9]{3}.xml$'
    return getPublishedAsset(path,pattern)

def getRigMapping(character, lod='100', relativepath=False):
    """Return the latest character rig mapping."""
    
    path    = '%s/%s/rig/body/mapping/%s' % (rigEnv.ROOTCHAR, character, lod)
    pattern = '[a-zA-Z0-9]+_rig_mapping_v[0-9]{3}.json$'
    return getPublishedAsset(path,pattern)

def getRigMappingVersion(character, version, lod='100', relativepath=False):
    """Return the latest character rig mapping."""
    
    path    = '%s/%s/rig/body/mapping/%s' % (rigEnv.ROOTCHAR, character, lod)
    pattern = '[a-zA-Z0-9]+_rig_mapping_v[0-9]{3}.json$'
    return getPublishedAssetVersion(path,pattern,version)

def getRigMappingVersions(character, lod='100', relativepath=False):
    """Return all versions of character rig mapping as an array of 3 digit strings."""
    
    path    = '%s/%s/rig/body/mapping/%s' % (rigEnv.ROOTCHAR, character, lod)
    pattern = '[a-zA-Z0-9]+_rig_mapping_v[0-9]{3}.json$'
    return getPublishedAssetVersions(path,pattern)

def publishComponentGuide(component, source, description=""):
    """Save a guide comonent on the server."""

    path    = '%s/%s/guide/' % (rigEnv.ROOTCOMP, component)
    pattern = '%s_guide_v[0-9]{3}.ma$' % component
    return publishToServer(source,path,pattern)

def publishComponentBuildScript(component, source, module, description=""):
    """Save a component prebuild or postbuild script on the server."""
    
    path    = '%s/%s/%s/' % (rigEnv.ROOTCOMP, component, module)
    pattern = '%s_%s_v[0-9]{3}.py$' % (component,module) 
    return publishToServer(source,path,pattern)

def publishRig(character, source, typ, description=''):
    """Save a character rig on the server."""

    path    = '%s/%s/rig/body/%s' % (rigEnv.ROOTCHAR, character, typ)
    pattern = '%s_body_rig_%s_v[0-9]{3}.ma$' % (character,typ)
    return publishToServer(source,path,pattern)

def publishRigData(character, source, description=''):
    """Save a character rig data on the server."""
    
    path    = '%s/%s/rig/body/data' % (rigEnv.ROOTCHAR, character)
    pattern = '%s_rig_data_v[0-9]{3}.json$' % character
    return publishToServer(source,path,pattern)

def publishRigGuide(character, source, description=''):
    """Save a character rig guide on the server."""

    path    = '%s/%s/rig/body/guide' % (rigEnv.ROOTCHAR, character)
    pattern = '%s_rig_guide_v[0-9]{3}.ma$' % character
    return publishToServer(source,path,pattern)

def publishRigLayout(character, source, description=''):
    """Save a character rig layout on the server."""

    path    = '%s/%s/rig/body/layout' % (rigEnv.ROOTCHAR, character)
    pattern = '%s_rig_layout_v[0-9]{3}.xml$' % character
    return publishToServer(source,path,pattern)

def publishRigMapping(character, source, lod, description=''):
    """Save a character rig mapping on the server."""

    path    = '%s/%s/rig/body/mapping/%s' % (rigEnv.ROOTCHAR, character, lod)
    pattern = '%s_rig_mapping_v[0-9]{3}.json$' % character
    return publishToServer(source,path,pattern)

def publishRigBuildScript(character, source, module, description=''):
    """Save a character rig prebuild or postbuild script on the server."""

    path    = '%s/%s/rig/body/%s' % (rigEnv.ROOTCHAR, character, module)
    pattern = '%s_rig_%s_v[0-9]{3}.py$' % (character, module)
    return publishToServer(source,path,pattern)

def publishToServer(source, path, pattern):
    """Save an asset to the server."""
    
    output = getNextFile(path,pattern)
    
    try:
        if not os.path.isdir(path): os.makedirs(path)
    except:
        rigUtils.log('Error making directories: %s' % path,'e')
        return 
    
    try:
        shutil.copy(source,os.path.join(path,output))
        rigUtils.log('Published: %s' % os.path.join(path,output))
    except:
        rigUtils.log('Error publishing to server: %s' % os.path.join(path,output),'e')
        return
    
    return True

def SelectAndPublishComponentBuild(component, module):
    """Save a character prebuild or postbuild script on the server."""

    path = cmds.fileDialog2(ff='*.py', fm=1, cap='Select %s file' % module)

    if not path: return

    prompt = cmds.promptDialog(m='Enter comment', b=['OK', 'Cancel'], cb='Cancel', db='OK', t='Enter Comment')
    if prompt == 'Cancel': return
    comment = cmds.promptDialog(q=True, tx=True)

    tmp = tempfile.mkstemp('.py')[1]
    rigUtils.log('Saving temp python file for %s: %s' % (component, tmp))
    shutil.copy(path[0], tmp)

    publishComponentBuildScript(component, tmp, module, comment)
    
def StripAndPublishComponent(component):
    """Prior to publishing a guide component, save a temp version and strip it of locked nodes."""
    
    if not cmds.objExists('rig_%s_guide' % component):
        rigUtils.log('Object not found: rig_%s_guide' % component, 'e')
        return

    prompt = cmds.promptDialog(m='Enter comment', b=['OK', 'Cancel'], cb='Cancel', db='OK', t='Enter Comment')
    if prompt == 'Cancel': return
    comment = cmds.promptDialog(q=True, tx=True)

    tmp = tempfile.mkstemp('.ma')[1]
    rigUtils.log('Saving temp file for %s: %s' % (component, tmp))
    cmds.file(rn=tmp)
    cmds.file(s=True, f=True, typ='mayaAscii')

    rigUtils.log('Removing lockNode commands from temp file: %s' % tmp)

    tmp2    = tempfile.mkstemp('.ma')[1]
    fin     = open(tmp, 'r')
    fout    = open(tmp2, 'w')

    # remove lockNode commands from ma file
    for line in fin.readlines():
        if 'lockNode' in line: continue
        fout.write(line)

    fin.close()
    fout.close()

    publishComponentGuide(component, tmp2, comment)
