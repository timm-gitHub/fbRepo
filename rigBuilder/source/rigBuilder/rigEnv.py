"""

    Environment variables for use in the rigging tool
    -------------------------------------------------
    
    Author: Evan (The Woman) Jacobson
    
"""

import os
import inspect

ROOT          = os.environ['RIG_BUILDER_PROJECT_ROOT']
PROJECT       = os.path.basename(ROOT)
ROOTCHAR      = '%s/asset/character' % ROOT
ROOTCOMP      = '%s/asset/component' % ROOT
#LOCALBUILDS   = '%s/%s/RB/build' % (os.environ['FB_STAFF'],os.environ['USERNAME'])
LOCALBUILDS   = ''
CONTROL_COLOR = {'C':17,'R':14,'L':13}


def getRigBuilderPath():
    file = inspect.getfile(inspect.currentframe())
    for i in range(3):
        file = os.path.dirname( file )
    return file