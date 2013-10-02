import sys

import pymel.core

import rigBuilder.face.utils.attribute as attributeUtils
import rigBuilder.face.utils.dag as dagUtils
import rigBuilder.face.utils.name as nameUtils
import rigBuilder.face.modules
import rigBuilder.face.utils as faceUtils
import rigBuilder.face.utils.control as controlUtils
import rigBuilder.face.utils.skeleton as skeletonUtils


class TongueModule(rigBuilder.face.modules.RigModule):

    def __init__(self, modulePosition='C', moduleName='tongue'):
        super(TongueModule, self).__init__(modulePosition, moduleName)

    def buildModule(self):
        sys.stdout.write('>> Building Tongue Module...\n')

        # Get the Tongue Joints.
        joints = pymel.core.ls('C_tongue*_jnt_*', type='joint')
        if not joints:
            return None

        #=======================================================================
        # Create the interface and preference attributes on the respective nodes.
        #=======================================================================

        rAliases = ['Roll', 'Yaw', 'Pitch']
        tAliases = ['ForwardBack', 'UpDown', 'SideToSide']

        # Add a marker attribute.
        for node in [self.interfaceNode, self.preferenceNode]:
            node.addAttr('tongueBaseMarker', at='enum', nn=' ', en='Tongue Base')
            node.tongueBaseMarker.set(cb=True, lock=True)

        # Add the attributes.
        for i, attr in enumerate(rAliases + tAliases):
            # Interface.
            self.interfaceNode.addAttr('tongueBase%s' % attr, at='double',
                nn=nameUtils.camelCaseToNiceString(attr), k=True,
                min=-1.0, max=1.0, dv=0.0)

            # Preference.
            multValue = [45.0, 45.0, 45.0, 1.0, 1.0, 1.0]
            self.preferenceNode.addAttr('tongueBase%sMult' % attr, at='double',
                nn=nameUtils.camelCaseToNiceString('%sMult' % attr))
            self.preferenceNode.attr('tongueBase%sMult' % attr).set(cb=True, k=False)
            self.preferenceNode.attr('tongueBase%sMult' % attr).set(multValue[i])


        #=======================================================================
        # Create the Tongue Base translation offsets.
        #=======================================================================

        # We need two hooks to put the offsets in the right space.
        hook = list()
        for i in range(1, 3):
            hook.append(pymel.core.general.createNode('joint', n='%s_%sBaseHook'
                '_grp_%d' % (self.modulePosition, self.moduleName, i)))

            hook[-1].overrideEnabled.set(True)
            hook[-1].overrideLevelOfDetail.set(1)

        if joints[0].getParent():
            pymel.core.animation.parentConstraint(joints[0].getParent(), hook[0],
                n=nameUtils.subNodeType(hook[0], 'pac'))
            hook[0].jo.set([0.0, 0.0, 0.0])
            hook[0].jo.set(hook[0].r.get())

        else:
            hook[0].setTransformation(joints[0].getMatrix(worldSpace=True))
            dagUtils.rotationToJointOrient(hook[0])

        hook[0].setParent(self.setupGroup)

        hook[1].setTranslation(joints[0].getTranslation(worldSpace=True))
        hook[1].r.set([0.0, -90.0, 0.0])
        hook[1].setParent(hook[0])
        dagUtils.rotationToJointOrient(hook[1])


        # And two offsets. One for translate and one for rotate.
        offset = pymel.core.general.duplicate(hook[1], n='%s_%sBaseTranslate'
            'Offset_grp_0' % (self.modulePosition, self.moduleName))

        offset.append(
            pymel.core.general.createNode('joint', n='%s_%sBaseRotateOffset'
                    '_grp_0' % (self.modulePosition, self.moduleName)))

        offset[0].setParent(hook[1])

        offset[1].overrideEnabled.set(True)
        offset[1].overrideLevelOfDetail.set(1)

        offset[1].setTransformation(joints[0].getMatrix(worldSpace=True))
        offset[1].setParent(offset[0])
        dagUtils.rotationToJointOrient(offset[1])

        pymel.core.parentConstraint(offset[1], joints[0], mo=True,
            name=nameUtils.subNodeType(joints[0], 'pac'))

        self._tongueBaseTranslateOffset = offset[0]
        self._tongueBaseRotateOffset = offset[1]


        #=======================================================================
        # Hook the interface and preference nodes to the tongue base offsets.
        #=======================================================================

        for attr, aliases in zip(['translate', 'rotate'], [tAliases, rAliases]):

            mult = pymel.core.general.createNode('multiplyDivide', n='%s_tongue'
                'Base%sOffset_mdn_0' % (self.modulePosition, attr.title()))

            for axis, alias in zip(['X', 'Y', 'Z'], aliases):
                self.interfaceNode.attr('tongueBase%s' % alias) >> mult.attr('input1%s' % axis)
                self.preferenceNode.attr('tongueBase%sMult' % alias) >> mult.attr('input2%s' % axis)

            src = mult.output
            dest = getattr(self, '_tongueBase%sOffset' % attr.title()).attr(attr)

            if attr is 'translate':

                pma = pymel.core.general.createNode('plusMinusAverage',
                    n='%s_tongueBase%sOffset_pma_0' % (self.modulePosition,
                    attr.title()))

                src >> pma.input3D[0]
                pma.input3D[1].set(dest.get())

                src = pma.output3D

            src >> dest


        #=======================================================================
        # Create the controls.
        #=======================================================================

        # Create a master tongue control so that the Tongue Controls can be
        # moved away from the face if the animator desires.
        master = controlUtils.RigControl(position=self.modulePosition,
            description='%sMaster' % (self.moduleName), index=0,
            shapeType='tongueMaster')

        master.controlHome.setTranslation(joints[0].getTranslation(worldSpace=True))
        master.controlGroup.setParent(self.controlGroup)

        self.driven.append(master.controlGroup)


        # Duplicate the tongue joint chain (less the tongue base joint).
        jointChain = skeletonUtils.duplicateJointChain(
            jointChain=joints[1:], addDescription='FK', world=True)

        # Remove the duplicated joints from any object set they may be connected
        # to (like the face bind joints one).
        for joint in jointChain:
            for conn in joint.listConnections(t='objectSet'):
                conn.remove(joint)

        # Tongue FK Controls.
        ctls = controlUtils.RigFKControlChain(
            jointChain=jointChain[:-1],
            addDescription='')

        ctls.chain[0].controlGroup.setParent(self.controlGroup)


        #=======================================================================
        # Connect the controls to the tongue chain.
        #=======================================================================

        for i, ctl in enumerate(ctls.chain):
            ctl.control.rotate >> joints[i + 1].rotate
            ctl.control.scale >> joints[i + 1].scale

            if not i:
                continue

            # Disconnect inverse scale.
            joints[i].scale // joints[i + 1].inverseScale


        # Constrain the control chain to the tongue base.
        pac = pymel.core.parentConstraint([joints[0]], ctls.chain[0].controlHome,
            name=nameUtils.subNodeType(ctls.chain[0].controlHome.name(), 'pac'),
            mo=True)


        #=======================================================================
        # Setup the tongue master control to allow offsetting of the FK controls.
        #=======================================================================

        wim = faceUtils.createFourByFourFromMatrix(
            master.control.getMatrix(worldSpace=True).inverse())
        wim.rename('%s_%sMasterControlWorldInverseMatrix_fbf_0' % (
            self.modulePosition, self.moduleName))
        attributeUtils.lockAll(wim)

        mm1 = pymel.core.general.createNode('multMatrix', n='%s_%sMaster'
            'NormalizedMatrix_mmx_0' % (self.modulePosition, self.moduleName))
        wim.output >> mm1.matrixIn[0]
        master.control.worldMatrix >> mm1.matrixIn[1]

        mm2 = pymel.core.general.createNode('multMatrix', n='%s_%sMaster'
            'NormalizedParentMatrix_mmx_0' % (self.modulePosition, self.moduleName))
        joints[0].parentMatrix[0] >> mm2.matrixIn[0]
        mm1.matrixSum >> mm2.matrixIn[1]

        mm2.matrixSum >> pac.target[0].targetParentMatrix


        sys.stdout.write('>> Tongue Module Build Complete.\n')
        return True
