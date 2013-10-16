'''
Created on 02/09/2013

@author: caleb.bell
'''

import inspect
import os

from rigBuilder.rigEnv import ROOT, ROOTCHAR, PROJECT, CONTROL_COLOR
from rigBuilder import rigEnv

# Resource Paths.
FACE_RESOURCE_PATH = os.path.join(rigEnv.getRigBuilderPath(), 'resource', 'face')

FACE_GUI_TEMPLATES_PATH = os.path.join(FACE_RESOURCE_PATH, 'controlGUI',
    'templates')
FACE_GUI_CONTROLS_PATH = os.path.join(FACE_RESOURCE_PATH, 'controlGUI',
    'controls')
FACE_GUI_SHAPES_PATH = os.path.join(FACE_RESOURCE_PATH, 'controlGUI',
    'controlShapes.ma')

BLEND_SHAPE_LAYOUT_JSON = os.path.join(FACE_RESOURCE_PATH, 'blendShapeLayout.json')

# Hierarchical Conventions.
FACE_RIG_ROOT = 'rig_face_anim'

FACE_SKELETON_GUIDE_ROOT = 'faceSkeletonGuide_grp'
FACE_SKELETON_GUIDE_NS = 'guide'

FACE_GUI_GUIDE_ROOT = 'faceGUI_grp'
FACE_GUI_LAYOUT_GROUP = 'faceGUILayout_grp'
FACE_GUI_CONTROLS_GROUP = 'faceGUIControls_grp'

FACE_MODEL_COMPONENT_BASE_ROOT = 'model_face_100_base'
FACE_MODEL_COMPONENT_BASE_NS = 'model'

FACE_MODEL_COMPONENT_SHAPE_ROOT = 'model_face_100_shape'
FACE_MODEL_COMPONENT_SHAPE_NS = 'shape'

FACE_INTERFACE_GRP = 'interface_grp'
FACE_PREFERENCE_GRP = 'preference_grp'

# ROOT_VAR = '${PROJECT_ROOT}'
# PROJECT_VAR = '${PROJECT}'