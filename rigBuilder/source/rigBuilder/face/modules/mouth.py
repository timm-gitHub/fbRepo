import pymel.core

import rigBuilder.face.utils.attribute as attributeUtils
import rigBuilder.face.utils.name as nameUtils
import rigBuilder.face.modules
from pymel.mayautils import source


class MouthModule(rigBuilder.face.modules.RigModule):

    def __init__(self, modulePosition='C', moduleName='mouth'):
        super(MouthModule, self).__init__(modulePosition, moduleName)

    def buildModule(self):

        self._mouthJoints = pymel.core.ls('C_mouth_jnt_*', type='joint')
        self._jawLowerJoints = pymel.core.ls('C_jawLower_jnt_*', type='joint')
        self._jawUpperJoints = pymel.core.ls('C_jawUpper_jnt_*', type='joint')

        self._jawLowerTranslateOffset = None
        self._jawUpperTranslateOffset = None
        self._mouthTranslateOffset = None

        #=======================================================================
        # Create the interface and preference attributes on the respective nodes.
        #=======================================================================

        rAliases = ['Roll', 'Yaw', 'Pitch']
        tAliases = ['ForwardBack', 'UpDown', 'SideToSide']

        for locus in ['jawUpper', 'jawLower', 'mouth']:

            # Add a marker attribute.
            for node in [self.interfaceNode, self.preferenceNode]:
                node.addAttr('%sMarker' % locus, at='enum',
                    nn=' ', en='%sJoint' % nameUtils.camelCaseToNiceString(locus))
                node.attr('%sMarker' % locus).set(cb=True, lock=True)

            # Add the attributes.
            for i, attr in enumerate(rAliases + tAliases):
                # Interface.
                self.interfaceNode.addAttr('%s%s' % (locus, attr), at='double',
                    nn=nameUtils.camelCaseToNiceString(attr), k=True,
                    min=-1.0, max=1.0, dv=0.0)

                # Preference.
                multValue = [45.0, 45.0, 45.0, 1.0, 1.0, 1.0]
                self.preferenceNode.addAttr('%s%sMult' % (locus, attr),
                    at='double', nn=nameUtils.camelCaseToNiceString('%sMult' % attr))
                self.preferenceNode.attr('%s%sMult' % (locus, attr)).set(cb=True, k=False)
                self.preferenceNode.attr('%s%sMult' % (locus, attr)).set(multValue[i])


        #=======================================================================
        # Create the translation offsets.
        #=======================================================================
        for locus in ['jawUpper', 'jawLower', 'mouth']:

            hook = pymel.core.general.createNode('transform', n='%s_%s'
                'TranslateHook_grp_0' % (self.modulePosition, locus))
            hook.setParent(self.setupGroup)

            offset = pymel.core.general.createNode('transform', n='%s_%s'
                'TranslateOffset_grp_0' % (self.modulePosition, locus))
            offset.setParent(hook)

            joints = getattr(self, '_%sJoints' % locus)

            hook.setTranslation(joints[0].getTranslation(worldSpace=True))
            hook.rotate.set([0.0, -90.0, 0.0])

            pymel.core.animation.parentConstraint(joints[0].getParent(),
                hook, mo=True, n=nameUtils.subNodeType(hook.name(), 'pac'))

            pymel.core.animation.parentConstraint(offset, joints[0],
                mo=True, n=nameUtils.subNodeType(joints[0], 'pac'),
                sr=['x', 'y', 'z'])

            setattr(self, '_%sTranslateOffset' % locus, offset)


        #=======================================================================
        # Hook the interfaces and preferences to the joints.
        #=======================================================================
        for locus in ['jawUpper', 'jawLower', 'mouth']:

            for attr, aliases in zip(['translate', 'rotate'], [tAliases, rAliases]):

                mult = pymel.core.general.createNode('multiplyDivide', n='%s_%s'
                    '%sJoint%sDriverMult_mdn_0' % (self.modulePosition,
                    locus[0].upper(), locus[1:], attr.title()))

                for axis, alias in zip(['X', 'Y', 'Z'], aliases):
                    self.interfaceNode.attr('%s%s' % (locus, alias)) >> mult.attr('input1%s' % axis)
                    self.preferenceNode.attr('%s%sMult' % (locus, alias)) >> mult.attr('input2%s' % axis)

                src = mult.output
                dest = getattr(self, '_%sJoints' % locus)[0]

                if attr == 'translate':
                    dest = getattr(self, '_%sTranslateOffset' % locus)

                src >> dest.attr(attr)

        return True
