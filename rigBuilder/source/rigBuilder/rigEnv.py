"""

    Environment variables for use in the rigging tool
    -------------------------------------------------
    
    Author: Evan (The Man) Jacobson
    
"""

import os

ROOT          = os.environ['RIG_BUILDER_PROJECT_ROOT']
PROJECT       = os.path.basename(ROOT)
ROOTCHAR      = '%s/asset/character' % ROOT
ROOTCOMP      = '%s/asset/component' % ROOT
#LOCALBUILDS   = '%s/%s/RB/build' % (os.environ['FB_STAFF'],os.environ['USERNAME'])
LOCALBUILDS   = ''
CONTROL_COLOR = {'C':17,'R':14,'L':13}