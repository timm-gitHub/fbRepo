import math
import re
import string
import sys

import maya.mel
import pymel.core

import rigBuilder.face.utils.attribute as attributeUtils
import rigBuilder.face.utils.dag as dagUtils
import rigBuilder.face.utils.name as nameUtils
import rigBuilder.face.modules

DRIVER_ATTRS = ['blink', 'bias', 'biasMult', 'upperLid', 'lowerLid']
DRIVER_RANGES = [[-1, 1, 0], [-1, 1, 0], [0, 1, 0], [-1, 1, 0], [-1, 1, 0]]
RANGE_ATTRS = ['blink', 'wide', 'biasUpperLimit', 'biasLowerLimit']

LID_JOINT_CONV = '%s_eyeLid%s*_jnt_%d'

class EyeModule(rigBuilder.face.modules.RigModule):

    SETUP_ATTRS = [
        ['displayPrimaryCurves', [0, 1, 0]],
        ['displaySecondaryCurves', [0, 1, 0]],
        ['displayIkHandles', [0, 1, 0]]
        ]

    _eyeJointPosition = list()
    _tearDuctJointPosition = list()
    _upperLidJointPositions = list()
    _lowerLidJointPositions = list()

    _upperLidJointChains = dict()
    _lowerLidJointChains = dict()
    _innerLidJointChains = dict()
    _outerLidJointChains = dict()

    _upperLidPrimaryCurve = None
    _lowerLidPrimaryCurve = None
    _upperLidSecondaryCurve = None
    _lowerLidSecondaryCurve = None
    _curveParent = None

    _upperPrimaryClusterParent = None
    _upperPrimaryClusters = list()
    _lowerPrimaryClusterParent = None
    _lowerPrimaryClusters = list()
    _primaryClusterParent = None

    _upperSecondaryClusters = list()
    _lowerSecondaryClusters = list()
    _secondaryClusterParent = None


    def __init__(self, modulePosition, moduleName='eye'):
        super(EyeModule, self).__init__(modulePosition, moduleName)

        self.localSetupGroup = None
        self.globalSetupGroup = None


    def _createAdditionalSetupGroups(self):
        ''' Creates additional setup structure to separate things that need to
        be in local space, from those that need to be in world space. '''

        self.localSetupGroup = pymel.core.createNode('transform',
            n='%s_%sLocalSetup_grp_0' % (self.modulePosition, self.moduleName))
        self.localSetupGroup.setParent(self.setupGroup)
        attributeUtils.lockAll(self.localSetupGroup)

        self.globalSetupGroup = pymel.core.createNode('transform',
            n='%s_%sGlobalSetup_grp_0' % (self.modulePosition, self.moduleName))
        self.globalSetupGroup.setParent(self.setupGroup)

        self.driven.append(self.globalSetupGroup)


    def _createPrimaryCurves(self):
        sys.stdout.write('### BUILD PRIMARY CURVES ###\n')

        # Create the Curve Parent.
        self._curveParent = pymel.core.createNode('transform',
            name='%s_eyeLidCurves_grp_0' % self.modulePosition)
        self._curveParent.setParent(self.localSetupGroup)

        for vPos in ['upper', 'lower']:

            # Gather the point positions based upon joint placement.
            pnts = list()

            # Inner.
            if pymel.core.general.objExists(
                    '%s_eyeLidInner_jnt_3' % self.modulePosition):
                pnts.append(pymel.core.PyNode('%s_eyeLidInner_jnt_3'
                    % self.modulePosition).getTranslation(worldSpace=True))

            # Upper / Lower.
            pnts.extend([joint.getTranslation(worldSpace=True) for joint in
                pymel.core.ls(LID_JOINT_CONV % (self.modulePosition,
                vPos.title(), 3))])

            # Outer.
            if pymel.core.general.objExists(
                    '%s_eyeLidOuter_jnt_3' % self.modulePosition):
                pnts.append(pymel.core.PyNode('%s_eyeLidOuter_jnt_3'
                    % self.modulePosition).getTranslation(worldSpace=True))

            # Create Curve
            crv = pymel.core.curve(p=pnts, degree=2,
                name='%s_eyeLid%sPrimary_crv_0' % (self.modulePosition,
                vPos.title()))
            crv.getChildren(shapes=True)[0].rename(
                name='%s_eyeLid%sPrimary_crv_0Shape' % (self.modulePosition,
                vPos.title()))
            crv.setParent(self._curveParent)

            setattr(self, '_%sLidPrimaryCurve' % vPos, crv)

        return True


    def _simplifyPrimaryCurves(self, v=9):
        sys.stdout.write('### SIMPLIFY CURVES ###\n')

        for vPos in ['upper', 'lower']:
            crv = dagUtils.TransformAndShapes(
                getattr(self, '_%sLidPrimaryCurve' % vPos))

            params = list()
            pnts = list()

            crvLen = crv.shapes[0].length()
            crvSeg = crvLen / (v - 1)

            for i in range(v):
                params.append((1.0 / (v - 1)) * i)
                pnts.append(crv.shapes[0].getPointAtParam(crv.shapes[0].findParamFromLength(crvSeg * i)))

            new = pymel.core.duplicate(crv.transform)[0]
            pymel.core.rebuildCurve(new, rt=0, s=v - 2, kr=0, d=2)
            lsm = pymel.core.createNode('leastSquaresModifier')
            new.getShapes()[0].worldSpace[0] >> lsm.ino
            new.getShapes()[0].worldSpace[0] // lsm.ino
            lsm.ono >> new.getShapes()[0].create
            for i in range(v):
                lsm.setAttr('pc[%d].pcu' % i, params[i])
                lsm.setAttr('pc[%d].ppx' % i, pnts[i][0])
                lsm.setAttr('pc[%d].ppy' % i, pnts[i][1])
                lsm.setAttr('pc[%d].ppz' % i, pnts[i][2])
                lsm.setAttr('pc[%d].pw' % i, 1)

            lsm.ono // new.getShapes()[0].create

            newName = crv.transform.name()
            pymel.core.delete(lsm)
            pymel.core.delete(crv.transform)
            new.rename(newName)
            new.setParent(self._curveParent)

            setattr(self, '_%sLidPrimaryCurve' % vPos, new)


    def _createSecondaryCurves(self):
        sys.stdout.write('### CREATE SECONDARY CURVES ###\n')

        for vPos in ['upper', 'lower']:
            primaryCurve = getattr(self, '_%sLidPrimaryCurve' % vPos)

            secondaryCurve = primaryCurve.duplicate(
                name=primaryCurve.name().replace('Primary', 'Secondary'),
                inputConnections=True)[0]

            primaryCurve.getChildren()[0].worldSpace[0] >> secondaryCurve.getChildren()[0].create

            setattr(self, '_%sLidSecondaryCurve' % vPos, secondaryCurve)


    def _clusterPrimaryCurves(self):
        sys.stdout.write('### CLUSTER PRIMARY CURVES ###\n')

        self._primaryClusterParent = pymel.core.createNode('transform',
            name='%s_eyeLidPrimaryClusters_grp_0' % self.modulePosition)
        self._primaryClusterParent.setParent(self.localSetupGroup)

        par = pymel.core.PyNode('%s_eyeLidParent_jnt_0' % self.modulePosition)

        for vPos in ['upper', 'lower']:

            crv = dagUtils.TransformAndShapes(
                getattr(self, '_%sLidPrimaryCurve' % vPos))

            clsPar = None
            cls = list()

            clsPar = pymel.core.createNode('transform',
                name='%s_%sEyeLidClusters_grp_0' % (self.modulePosition, vPos))
            clsPar.setTransformation(par.getMatrix(worldSpace=True))
            clsPar.setParent(par)

            for i in range(len(crv.shapes[0].getCVs())):

                clusterName = str()

                if i == 0 or i == (len(crv.shapes[0].getCVs()) - 1):
                    if not i:
                        clusterName = '%s_%sEyeClusterInner_grp_0' % (
                            self.modulePosition, vPos)
                    else:
                        clusterName = '%s_%sEyeClusterOuter_grp_0' % (
                            self.modulePosition, vPos)

                else:
                    clusterName = '%s_%sEyeCluster%s_grp_0' % (
                        self.modulePosition, vPos, string.ascii_uppercase[i - 1])

                # Create the cluster
                cv = pymel.core.PyNode('%s.cv[%d]' % (crv.transform.name(), i))
                cls.append(pymel.core.duplicate(clsPar, parentOnly=True,
                    name=clusterName)[0])
                cls[-1].setParent(clsPar)
                tmp = pymel.core.cluster(cv.name(), wn=(cls[-1].name(), cls[-1].name()))
                tmp[1].getChildren(shapes=True)[0].rename('%sShape' % clusterName)
                tmp[0].rename(nameUtils.subNodeType(clusterName, 'cls'))
                clsPar.parentInverseMatrix >> tmp[0].bindPreMatrix
                clsPar.parentInverseMatrix // tmp[0].bindPreMatrix

                # We don't put the inner or outer cluster in the list
                # because once we've made them we don't need them anymore/
                if i == 0 or i == (len(crv.shapes[0].getCVs()) - 1):
                    attributeUtils.lockAll(cls[-1])

            clsPar.setParent(self._primaryClusterParent)
            pymel.core.parentConstraint(par, clsPar, name=clsPar.name().replace('_grp_', '_pac_'))
            attributeUtils.lockAll(clsPar)

            setattr(self, '_%sPrimaryClusterParent' % vPos, clsPar)
            setattr(self, '_%sPrimaryClusters' % vPos, cls[1:-1])

        return True


    def _clusterSecondaryCurves(self, v=9):
        sys.stdout.write('### CLUSTER SECONDARY CURVES ###\n')

        self._secondaryClusterParent = pymel.core.createNode('transform',
            name='%s_eyeLidSecondaryClusters_grp_0' % self.modulePosition)
        self._secondaryClusterParent.setParent(self.localSetupGroup)
        attributeUtils.lockAll(self._secondaryClusterParent)

        par = pymel.core.PyNode('%s_eyeLidParent_jnt_0' % self.modulePosition)

        upperClusters = list()
        lowerClusters = list()

        for relativePos in ['inner', 'outer']:
            offset = par.duplicate(name=par.name().replace('Parent_jnt_',
                '%sCornerOffset_grp_' % relativePos.title()), po=True)[0]
            offset.setParent(self._secondaryClusterParent)
            for vPos in ['upper', 'lower']:
                locals()['%sClusters' % vPos].append(offset)

        for vPos in ['upper', 'lower']:
            clusters = locals()['%sClusters' % vPos]

            offset = par.duplicate(name=par.name().replace('Parent_jnt_',
                '%sOffset_grp_' % vPos.title()), po=True)[0]
            offset.setParent(self._secondaryClusterParent)
            clusters.insert(1, offset)
            for cluster in clusters:
                cluster.overrideEnabled.set(True)
                cluster.overrideLevelOfDetail.set(1)

            setattr(self, '_%sSecondaryClusters' % vPos, clusters)

            crv = dagUtils.TransformAndShapes(
                getattr(self, '_%sLidSecondaryCurve' % vPos))

            skn = pymel.core.skinCluster(clusters, crv.transform,
                name=crv.transform.name().replace('crv', 'skn'),
                skinMethod=1, mi=3, omi=False, tsb=True)

            for i in range(v):

                skinValues = list()

                innerVal = maya.mel.eval('hermite(1, 0, -3.1, 0, %f);' % ((1.0 / (v - 1)) * i))
                outerVal = maya.mel.eval('hermite(0, 1, 0, 3.1, %f);' % ((1.0 / (v - 1)) * i))
                middleVal = 1.0 - (innerVal + outerVal)

                skinValues = innerVal, middleVal, outerVal

                pymel.core.skinPercent(skn, '%s.cv[%d]' % (
                    crv.transform.name(), i), tv=zip(clusters, skinValues))

        return True


    def _connectCurveVizSwitches(self):
        sys.stdout.write('### CONNECT CURVE VISIBILITY SWITCHES ###\n')

        for priority in ['primary', 'secondary']:
            for locus in ['upper', 'lower']:
                crv = dagUtils.TransformAndShapes(
                    getattr(self, '_%sLid%sCurve' % (locus, priority.title())))

                # Connect the curves to the visibility switch.
                self.moduleTopNode.attr('display%sCurves' % priority.title()) >> crv.transform.visibility

                # Lock the curves.
                attributeUtils.lockAll(node=crv.transform)
                [attributeUtils.lockAll(node=shape) for shape in crv.shapes]

        return True


    def _setupIKHandles(self):
        sys.stdout.write('### SETUP IK HANDLES ###\n')

        # Load closestPointOnCurve Plug-in.
        if not pymel.core.system.pluginInfo("closestPointOnCurve", q=True, l=True):
            pymel.core.system.loadPlugin("closestPointOnCurve")

        for vPos in ['upper', 'lower']:
            crv = dagUtils.TransformAndShapes(
                getattr(self, '_%sLidSecondaryCurve' % vPos))

            joints = pymel.core.ls(LID_JOINT_CONV % (self.modulePosition, vPos.title(), 2))
            # We'll control the inner and outer joints with the upper curve.
            if vPos == 'upper':
                joints.insert(0, pymel.core.ls(LID_JOINT_CONV % (self.modulePosition, 'Inner', 2))[0])
                joints.append(pymel.core.ls(LID_JOINT_CONV % (self.modulePosition, 'Outer', 2))[0])

            for joint in joints:
                offset = joint.getParent()
                end = joint.getChildren()[0]

                # setup the curve based driving.
                a = pymel.core.createNode('closestPointOnCurve')
                crv.shapes[0].worldSpace[0] >> a.inCurve
                a.inPosition.set(end.getTranslation(worldSpace=True))
                uValue = a.paramU.get()
                pymel.core.delete(a)

                pci = pymel.core.createNode('pointOnCurveInfo',
                    name='%s_%s_pci_0' % (self.modulePosition,
                    nameUtils.getDescription(joint.name())))

                crv.shapes[0].worldSpace[0] >> pci.inputCurve
                pci.parameter.set(uValue)

                # Create the IK Handle and its parent.
                ikParent = pymel.core.createNode('transform',
                    name='%s_%sIK_grp_0' % (self.modulePosition,
                    nameUtils.getDescription(joint.name())))

                ikParent.setTranslation(pci.result.position.get())
                ikParent.setParent(offset)

                ikh = pymel.core.ikHandle(sj=joint, ee=end, sol='ikSCsolver',
                    name=joint.name().rsplit('_', 2)[0] + '_ikh_0')

                ikh[0].setParent(ikParent)
                ikh[1].rename(joint.name().rsplit('_', 2)[0] + '_eff_0')

                mm = pymel.core.createNode('multMatrix',
                    name='%s_%s_mmx_0' % (self.modulePosition,
                    nameUtils.getDescription(joint.name())))

                pmm = pymel.core.createNode('pointMatrixMult',
                    name='%s_%s_pmm_0' % (self.modulePosition,
                    nameUtils.getDescription(joint.name())))

                ikParent.parentInverseMatrix >> mm.matrixIn[0]
                offset.matrix >> mm.matrixIn[1]

                pci.result.position >> pmm.ip
                mm.matrixSum >> pmm.inMatrix

                pmm.output >> ikParent.t

                self.moduleTopNode.displayIkHandles >> ikParent.visibility
                attributeUtils.lockAll(ikParent)

        return True


    def _primaryClusterDriverSetup(self):
        ''' Sets up the driving of the primary eye clusters. '''

        sys.stdout.write('### PRIMARY CLUSTER DRIVER SETUP ###\n')

        for vPos in ['upper', 'lower']:

            clusterParent = getattr(self, '_%sPrimaryClusterParent' % vPos)
            # Add the main driver values.
            for attr, vals in zip(DRIVER_ATTRS[:-2], DRIVER_RANGES[:-2]):
                minVal, maxVal, defVal = vals
                clusterParent.addAttr(attr, min=minVal, max=maxVal, dv=defVal)
                clusterParent.attr(attr).set(k=True)

            # Shaping Values.
            for hPos in ['Inner', 'Outer']:
                clusterParent.addAttr('shape%s' % hPos, min=-1.0, max=1.0, dv=0.0)
                clusterParent.attr('shape%s' % hPos).set(k=True)
            clusterParent.addAttr('shapeWeight', min=0, max=1, dv=0, k=True)

            # Some generic nodes for the eye shaping.
            posBlinkClamp = pymel.core.createNode('clamp',
                name='%s_%sBlinkPos_clp_0' % (self.modulePosition, vPos))

            posBlinkRev = pymel.core.createNode('reverse',
                name='%s_%sBlink_rev_0' % (self.modulePosition, vPos))

            clusterParent.blink >> posBlinkClamp.inputR
            posBlinkClamp.minR.set(0)
            posBlinkClamp.maxR.set(1)
            posBlinkClamp.outputR >> posBlinkRev.inputX

            # Something to make shaping work better across the whole blink range.
            negBlinkPMA = pymel.core.createNode('plusMinusAverage',
                name='%s_%sBlinkNegShape_pma_0' % (self.modulePosition, vPos))

            negBlinkPMA.operation.set(2)

            negBlinkCnd = pymel.core.createNode('condition',
                name='%s_%sBlinkNegShape_cnd_0' % (self.modulePosition, vPos))

            clusterParent.blink >> negBlinkCnd.firstTerm
            negBlinkCnd.secondTerm.set(0.0)
            negBlinkCnd.operation.set(4)

            negBlinkMult = pymel.core.createNode('multiplyDivide',
                name='%s_%sBlinkNegShape_mdn_0' % (self.modulePosition, vPos))

            for hPos, axis, channel in zip(['Inner', 'Outer'], ['X', 'Y'], ['R', 'G']):
                negBlinkPMA.attr('input2D[0].input2D%s' % (axis.lower())).set(1.0)
                clusterParent.blink >> negBlinkPMA.attr('input2D[1].input2D%s' % (axis.lower()))
                negBlinkPMA.attr('output2D%s' % (axis.lower())) >> negBlinkCnd.attr('colorIfTrue%s' % channel)
                negBlinkCnd.attr('colorIfFalse%s' % channel).set(1.0)
                clusterParent.attr('shape%s' % hPos) >> negBlinkMult.attr('input1%s' % axis)
                negBlinkCnd.attr('outColor%s' % channel) >> negBlinkMult.attr('input2%s' % axis)

            ''' Split the clusters into three groups based upon the mid
            index for the purpose of setting up the eye shaping. '''

            clusters = getattr(self, '_%sPrimaryClusters' % vPos)
            midClusterIndex = int(round(len(clusters) / 2))

            for i, cls in enumerate(clusters):
                clsIndex = cls.rsplit('_', 2)[0][-1]

                blinkDriver = clusterParent.blink

                eyeShapeMult = pymel.core.createNode('multiplyDivide',
                    name='%s_eye%sLidShape%s_mdn_0' % (self.modulePosition,
                    vPos.title(), clsIndex))

                eyeShapeWeightSR = None

                shapeValue = (1.0 - ((1.0 / (len(clusters) - 1)) * i))

                if (i and i < midClusterIndex) or (i > midClusterIndex and i != (len(clusters) - 1)):

                    eyeShapeWeightSR = pymel.core.createNode('setRange',
                        name='%s_eye%sLidShapeWeight%s_str_0' % (
                        self.modulePosition, vPos.title(), clsIndex))

                    clusterParent.shapeWeight >> eyeShapeWeightSR.valueX
                    clusterParent.shapeWeight >> eyeShapeWeightSR.valueY

                    eyeShapeWeightSR.minX.set(shapeValue)
                    eyeShapeWeightSR.minY.set(abs(1.0 - shapeValue))
                    eyeShapeWeightSR.maxX.set(round(shapeValue))
                    eyeShapeWeightSR.maxY.set(round(abs(1.0 - shapeValue)))
                    eyeShapeWeightSR.oldMinX.set(0.0)
                    eyeShapeWeightSR.oldMinY.set(0.0)
                    eyeShapeWeightSR.oldMaxX.set(1.0)
                    eyeShapeWeightSR.oldMaxY.set(1.0)

                clusterParent.attr('shapeInner') >> eyeShapeMult.input1X
                clusterParent.attr('shapeOuter') >> eyeShapeMult.input1Y

                if eyeShapeWeightSR:
                    eyeShapeWeightSR.outValueX >> eyeShapeMult.input2X
                    eyeShapeWeightSR.outValueY >> eyeShapeMult.input2Y

                else:
                    eyeShapeMult.input2X.set(shapeValue)
                    eyeShapeMult.input2Y.set(abs(1.0 - shapeValue))

                eyeShapeADL1 = pymel.core.createNode('addDoubleLinear',
                    name='%s_eyeLid%sShapeResult%s_adl_0' % (
                    self.modulePosition, vPos.title(), clsIndex))

                eyeShapeMult.outputX >> eyeShapeADL1.input1
                eyeShapeMult.outputY >> eyeShapeADL1.input2

                eyeShapeMDL = pymel.core.createNode('multDoubleLinear',
                    name='%s_eyeLid%sShapeClamped%s_mdl_0' % (
                    self.modulePosition, vPos.title(), clsIndex))

                eyeShapeADL1.output >> eyeShapeMDL.input1
                posBlinkRev.outputX >> eyeShapeMDL.input2

                eyeShapeADL2 = pymel.core.createNode('addDoubleLinear',
                    name='%s_eye%sEyeBlinkResult%s_adl_0' % (
                    self.modulePosition, vPos.title(), clsIndex))

                clusterParent.blink >> eyeShapeADL2.input1
                eyeShapeMDL.output >> eyeShapeADL2.input2

                blinkDriver = eyeShapeADL2.output

                [clusterParent.addAttr('%sValue%s' % (a, clsIndex), k=True) for a in RANGE_ATTRS[:-1]]

                if cls.getChildren(type='orientConstraint'):
                    [clusterParent.setAttr('%sValue%s' % (a, clsIndex), l=True) for a in RANGE_ATTRS[:-1]]
                    continue

                #-------------------------------------------------------
                # BIAS
                #
                #    Bias shifts the eye lid's collision position
                #    a user defined range.
                #
                #-------------------------------------------------------

                biasDriver = clusterParent.attr('bias')
                if vPos == 'lower':
                    biasInvertMDL = pymel.core.createNode('multDoubleLinear',
                        name='%s_%sEyeLidClusterBiasInvert%s_mdl_0' % (
                        self.modulePosition, vPos, clsIndex))

                    biasDriver >> biasInvertMDL.input1
                    biasInvertMDL.input2.set(-1)
                    biasDriver = biasInvertMDL.output

                # CALCULATE THE DIFFERENCE BETWEEN THE BLINK VALUE AND
                # THE REST POSITION.
                biasClosePMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sEyeLidClusterBiasClose%s_pma_0' % (
                    self.modulePosition, vPos, clsIndex))

                biasClosePMA.operation.set(2)
                biasClosePMA.input1D[0].set(0)
                clusterParent.attr('blinkValue%s' % (clsIndex)) >> biasClosePMA.input1D[1]

                # CALCULATE THE DIFFERENCE BETWEEN THE BIAS UPPER LIMIT
                # AND THE BLINK VALUE.
                biasOpenPMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sEyeLidClusterBiasOpen%s_pma_0' % (
                    self.modulePosition, vPos, clsIndex))

                biasOpenPMA.operation.set(2)
                clusterParent.attr('biasUpperLimitValue%s' % (clsIndex)) >> biasOpenPMA.input1D[0]
                clusterParent.attr('blinkValue%s' % (clsIndex)) >> biasOpenPMA.input1D[1]

                # NORMALIZE THE RANGES
                biasNormSR = pymel.core.createNode('setRange',
                    name='%s_%sEyeLidClusterBiasNorm%s_str_0' % (
                    self.modulePosition, vPos, clsIndex))

                biasDriver >> biasNormSR.valueX
                biasNormSR.oldMinX.set(-1)
                biasClosePMA.output1D >> biasNormSR.minX
                biasNormSR.oldMaxX.set(0)
                biasNormSR.maxX.set(0)

                biasDriver >> biasNormSR.valueY
                biasNormSR.oldMinY.set(0)
                biasNormSR.minY.set(0)
                biasNormSR.oldMaxY.set(1)
                biasOpenPMA.output1D >> biasNormSR.maxY

                # ADD THE TWO RANGES TOGETHER TO COVER THE UPPER AND LOWER RANGE IN ONE ATTRIBUTE
                biasResultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sEyeLidClusterBiasResult%s_adl_0' % (
                    self.modulePosition, vPos, clsIndex))

                biasNormSR.outValueX >> biasResultADL.input1
                biasNormSR.outValueY >> biasResultADL.input2

                # PIPE THE RESULT THROUGH A MULT FOR ART DIRECTION.
                biasMult = pymel.core.createNode('multDoubleLinear',
                    name='%s_%sEyeLidClusterBiasMult%s_mdl_0' % (
                    self.modulePosition, vPos, clsIndex))

                biasResultADL.output >> biasMult.input1
                clusterParent.biasMult >> biasMult.input2

                # ADD THE MULTIPLIED RESULT TO THE BLINK VALUE.
                eyeBiasResultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sEyeLidClusterBiasResult%s_adl_0' % (
                    self.modulePosition, vPos, clsIndex))

                clusterParent.attr('blinkValue%s' % (clsIndex)) >> eyeBiasResultADL.input1
                biasMult.output >> eyeBiasResultADL.input2

                #------------------------
                # BLINK AND EYE SHAPING.
                # RANGE SETUP FOR 0 to 1 COMPONENT OF THE BLINK
                blinkOpenSR = pymel.core.createNode('setRange',
                    name='%s_%sEyeLidClusterBlinkOpen%s_str_0' % (
                    self.modulePosition, vPos, clsIndex))

                blinkDriver >> blinkOpenSR.valueX
                blinkOpenSR.oldMinX.set(0)
                blinkOpenSR.minX.set(0)
                blinkOpenSR.oldMaxX.set(1)
                eyeBiasResultADL.output >> blinkOpenSR.maxX

                # RANGE SETUP FOR -1 to 0 COMPONENT OF THE BLINK
                blinkCloseSR = pymel.core.createNode('setRange',
                    name='%s_%sEyeLidClusterBlinkClose%s_str_0' % (
                    self.modulePosition, vPos, clsIndex))

                blinkDriver >> blinkCloseSR.valueX
                blinkCloseSR.oldMinX.set(-1)
                clusterParent.attr('wideValue%s' % (clsIndex)) >> blinkCloseSR.minX
                blinkCloseSR.oldMaxX.set(0)
                blinkCloseSR.maxX.set(0)

                # ADD THE TWO RANGES TOGETHER TO COVER THE UPPER AND LOWER RANGE IN ONE ATTRIBUTE
                blinkResultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sEyeLidClusterBlinkResult%s_adl_0' % (
                    self.modulePosition, vPos, clsIndex))

                blinkOpenSR.outValueX >> blinkResultADL.i1
                blinkCloseSR.outValueX >> blinkResultADL.i2

                # CLAMP IT SO WE DON'T GO TOO FAR.
                eyeResultClamp = pymel.core.createNode('remapValue',
                    name='%s_%sEyeLidClusterResult%s_rmv_0' % (
                    self.modulePosition, vPos, clsIndex))

                blinkResultADL.output >> eyeResultClamp.inputValue
                clusterParent.attr('wideValue%s' % (clsIndex)) >> eyeResultClamp.inputMin
                clusterParent.attr('wideValue%s' % (clsIndex)) >> eyeResultClamp.outputMin
                clusterParent.attr('biasUpperLimitValue%s' % (clsIndex)) >> eyeResultClamp.inputMax
                clusterParent.attr('biasUpperLimitValue%s' % (clsIndex)) >> eyeResultClamp.outputMax

                # CONENCT IT TO THE CLUSTER ROTATION.
                eyeResultClamp.outValue >> cls.rz

        return True


    def _offsetDriverSetup(self):
        sys.stdout.write('### OFFSET DRIVER SETUP ###\n')

        for vPos in ['upper', 'lower']:
            for offset in pymel.core.ls(LID_JOINT_CONV % (self.modulePosition, vPos.title(), 1)):
                i = int(offset.name().rsplit('_')[-1])

#                    RANGE_ATTRS = ['blink', 'wide', 'biasUpperLimit']

                [offset.addAttr(a, min=b[0], max=b[1], dv=b[2], k=True) for a, b in zip(DRIVER_ATTRS[:-2], DRIVER_RANGES[:-2])]

                [offset.addAttr('%sValue' % a, k=True) for a in RANGE_ATTRS[:-1]]

                # Bias Shizz
                biasDriver = offset.attr('bias')
                if vPos == 'lower':
                    biasInvertMDL = pymel.core.createNode('multDoubleLinear',
                        name='%s_%sEyeLidOffsetBiasInvert_mdl_%d' % (
                        self.modulePosition, vPos, i + 1))

                    biasDriver >> biasInvertMDL.input1
                    biasInvertMDL.input2.set(-1)
                    biasDriver = biasInvertMDL.output

                # CALCULATE THE DIFFERENCE BETWEEN THE BLINK VALUE AND
                # THE REST POSITION.
                biasClosePMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sEyeLidOffsetBiasClose_pma_%d' % (
                    self.modulePosition, vPos, i + 1))

                biasClosePMA.operation.set(2)
                biasClosePMA.input1D[0].set(0)
                offset.attr('blinkValue') >> biasClosePMA.input1D[1]

                # CALCULATE THE DIFFERENCE BETWEEN THE BIAS UPPER LIMIT
                # AND THE BLINK VALUE.
                biasOpenPMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sEyeLidOffsetBiasOpen_pma_%d' % (
                    self.modulePosition, vPos, i + 1))

                biasOpenPMA.operation.set(2)
                offset.attr('biasUpperLimitValue') >> biasOpenPMA.input1D[0]
                offset.attr('blinkValue') >> biasOpenPMA.input1D[1]

                # NORMALIZE THE RANGES
                biasNormSR = pymel.core.createNode('setRange',
                    name='%s_%sEyeLidOffsetBiasNorm_str_%d' % (
                    self.modulePosition, vPos, i + 1))

                biasDriver >> biasNormSR.valueX
                biasNormSR.oldMinX.set(-1)
                biasClosePMA.output1D >> biasNormSR.minX
                biasNormSR.oldMaxX.set(0)
                biasNormSR.maxX.set(0)

                biasDriver >> biasNormSR.valueY
                biasNormSR.oldMinY.set(0)
                biasNormSR.minY.set(0)
                biasNormSR.oldMaxY.set(1)
                biasOpenPMA.output1D >> biasNormSR.maxY


                # ADD THE TWO RANGES TOGETHER TO COVER THE UPPER AND LOWER RANGE IN ONE ATTRIBUTE
                biasResultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sEyeLidOffsetBiasResult_adl_%d' % (
                    self.modulePosition, vPos, i + 1))

                biasNormSR.outValueX >> biasResultADL.input1
                biasNormSR.outValueY >> biasResultADL.input2

                # PIPE THE RESULT THROUGH A MULT FOR ART DIRECTION.
                biasMult = pymel.core.createNode('multDoubleLinear',
                    name='%s_%sEyeLidOffsetBiasMult_mdl_%d' % (
                    self.modulePosition, vPos, i + 1))

                biasResultADL.output >> biasMult.input1
                offset.biasMult >> biasMult.input2

                # ADD THE MULTIPLIED RESULT TO THE BLINK VALUE.
                offsetBiasResultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sEyeLidOffsetBiasResult_adl_%d' % (
                    self.modulePosition, vPos, i + 1))

                offset.blinkValue >> offsetBiasResultADL.input1
                biasMult.output >> offsetBiasResultADL.input2

                # Blink Shiz
                blinkOpenSR = pymel.core.createNode('setRange',
                    name='%s_%sEyeLidOffsetBlinkOpen_str_%d' % (
                    self.modulePosition, vPos, i + 1))

                offset.blink >> blinkOpenSR.valueX
                blinkOpenSR.oldMinX.set(0)
                blinkOpenSR.minX.set(0)
                blinkOpenSR.oldMaxX.set(1)
                offsetBiasResultADL.output >> blinkOpenSR.maxX

                blinkCloseSR = pymel.core.createNode('setRange',
                    name='%s_%sEyeLidOffsetBlinkClose_str_%d' % (
                    self.modulePosition, vPos, i + 1))

                offset.blink >> blinkCloseSR.valueX
                blinkCloseSR.oldMinX.set(-1)
                offset.attr('wideValue') >> blinkCloseSR.minX
                blinkCloseSR.oldMaxX.set(0)
                blinkCloseSR.maxX.set(0)

                blinkResultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sEyeLidOffsetBlinkResult_adl_%d' % (
                    self.modulePosition, vPos, i + 1))

                blinkOpenSR.outValueX >> blinkResultADL.i1
                blinkCloseSR.outValueX >> blinkResultADL.i2

                # CLAMP IT SO WE DON'T GO TOO FAR.
                eyeResultClamp = pymel.core.createNode('remapValue',
                    name='%s_%sEyeLidOffsetResult_rmv_%d' % (
                    self.modulePosition, vPos, i + 1))

                blinkResultADL.output >> eyeResultClamp.inputValue
                offset.wideValue >> eyeResultClamp.inputMin
                offset.wideValue >> eyeResultClamp.outputMin
                offset.biasUpperLimitValue >> eyeResultClamp.inputMax
                offset.biasUpperLimitValue >> eyeResultClamp.outputMax

                eyeResultClamp.outValue >> offset.rz


        # INNER/OUTER OFFSET CONTROL FOR BIAS SOFTENING.
        for hPos in ['inner', 'outer']:
            for offset in pymel.core.ls(LID_JOINT_CONV % (self.modulePosition, hPos.title(), 1)):

                for a, b in zip(DRIVER_ATTRS, DRIVER_RANGES):
                    offset.addAttr(a, min=b[0], max=b[1], dv=b[2], k=True)
                    if not a == 'bias':
                        continue
                    offset.addAttr('biasMultOverride', min=0.0, max=1.0,
                        dv=1.0, k=True)

                [offset.addAttr('%sValue' % a, k=True) for a in RANGE_ATTRS[-2:]]

                # Normalize the bias range.
                biasSR = pymel.core.createNode('setRange',
                    name='%s_eyeLid%sBias_str_0' % (self.modulePosition,
                    hPos.title()))

                offset.attr(DRIVER_ATTRS[1]) >> biasSR.valueX
                offset.attr(DRIVER_ATTRS[1]) >> biasSR.valueY

                biasMultOverride = pymel.core.createNode('multiplyDivide',
                    name='%s_eyeLid%sBiasMultOveride_0' % (
                    self.modulePosition, hPos.title()))

                offset.attr('%sValue' % RANGE_ATTRS[-2:][0]) >> biasMultOverride.input1X
                offset.attr('%sValue' % RANGE_ATTRS[-2:][1]) >> biasMultOverride.input1Y
                offset.biasMultOverride >> biasMultOverride.input2X
                offset.biasMultOverride >> biasMultOverride.input2Y

                biasSR.oldMinX.set(-1)
                biasSR.oldMaxX.set(0)
                biasMultOverride.outputX >> biasSR.minX
                biasSR.maxX.set(0)

                biasSR.oldMinY.set(0)
                biasSR.oldMaxY.set(1)
                biasSR.minY.set(0)
                biasMultOverride.outputY >> biasSR.maxY

                resultADL = pymel.core.createNode('addDoubleLinear',
                    name='%s_eyeLid%sBiasRangeResult' % (self.modulePosition,
                    hPos.title()))

                biasSR.outValueX >> resultADL.input1
                biasSR.outValueY >> resultADL.input2

                # multiply by the bias mult.
                mult0 = pymel.core.createNode('multDoubleLinear',
                    name='%s_eyeLid%sBiasMult_mdl_1' % (self.modulePosition,
                    hPos.title()))

                resultADL.output >> mult0.input1
                offset.attr(DRIVER_ATTRS[1:][1]) >> mult0.input2

                # Multiply by the average of the clamped upper and lower lid
                # values added to the blink value.
                clamp1 = pymel.core.createNode('clamp',
                    name='%s_eyeLid%sBias_clp_1' % (self.modulePosition,
                    hPos.title()))

                for i, j in enumerate(zip(['blink', 'upperLid', 'lowerLid'], ['R', 'G', 'B'])):
                    offset.attr(j[0]) >> clamp1.attr('input%s' % j[1])
                    clamp1.attr('min%s' % j[1]).set(0.0)
                    clamp1.attr('max%s' % j[1]).set(1.0)

                pma = pymel.core.createNode('plusMinusAverage',
                    name='%s_eyeLid%sLidDriverAverage_pma_0' % (
                    self.modulePosition, hPos.title()))

                for i, j in enumerate(['R', 'G', 'B']):
                    clamp1.attr('output%s' % j) >> pma.attr('input1D[%d]' % i)

#                     adl = pymel.core.createNode('addDoubleLinear',
#                         name='%s_eyeLid%sLidDriverAverage_adl_0' %(
#                         self.modulePosition, hPos.title()))

                mult1 = pymel.core.createNode('multDoubleLinear',
                    name='%s_eyeLid%sBias_mdl_2' % (self.modulePosition,
                    hPos.title()))

#                    clamp1.outputR >> adl.input1
#                    clamp1.outputG >> adl.input2

                clamp2 = pymel.core.createNode('clamp',
                    name='%s_eyeLid%sBias_clp_2' % (self.modulePosition,
                    hPos.title()))

                pma.output1D >> clamp2.inputR
                clamp2.minR.set(0.0)
                clamp2.maxR.set(1.0)

                clamp2.outputR >> mult1.input1

                mult0.output >> mult1.input2

                mult1.output >> offset.rz

        return True


    def _setupInterfacesAndPreferences(self):
        ''' Adds the driver attributes to the module interface node, and
        range/multiplier attributes to the module preference node. '''

        #=======================================================================
        # Eye Ball Interfaces.
        #=======================================================================

        # Add the marker:
        self.interfaceNode.addAttr('eyeBallInterfacesMarker', nn=' ', at='enum',
            en='Eye Ball Interfaces', k=True)
        self.interfaceNode.eyeBallInterfacesMarker.set(lock=True)

        # Face Control
        for prefix in ['primary', 'secondary']:
            # Add the attribute.
            self.interfaceNode.addAttr('%sFaceControl' % prefix, at='double2')
            for axis in ['X', 'Y']:
                self.interfaceNode.addAttr('%sFaceControl%s' % (prefix, axis),
                    at='double', dv=0.0, min=-1.0, max=1.0, k=True)

        # Body Rig.
        self.interfaceNode.addAttr('bodyRig', at='double3')
        for axis in ['X', 'Y', 'Z']:
            self.interfaceNode.addAttr('bodyRig%s' % axis, at='double',
                p='bodyRig', k=True)


        #===================================================================
        # Eye Ball Range Preferences.
        #===================================================================

        # Add the marker:
        self.preferenceNode.addAttr('eyeBallPreferencesMarker', nn=' ',
            at='enum', en='Eye Ball Preferences', k=True)
        self.preferenceNode.eyeBallPreferencesMarker.set(lock=True)

        # Add the attributes.
        for suffix in ['Min', 'Max']:
            self.preferenceNode.addAttr('eyeRange%s' % suffix, at='double3')
            for axis in ['X', 'Y', 'Z']:
                self.preferenceNode.addAttr('eyeRange%s%s' % (suffix, axis),
                    p='eyeRange%s' % suffix)

        # Set some default values.
        for suffix, value in zip(['Min', 'Max'], [-45.0, 45.0]):
            for axis in ['X', 'Y', 'Z']:
                self.preferenceNode.attr('eyeRange%s%s' % (suffix, axis)).set(
                    value, cb=True)


        #===================================================================
        # Lid Follow Preferences
        #===================================================================

        # Add the lid follow multipliers marker.
        self.preferenceNode.addAttr('lidFollowMultipliersMarker', nn=' ',
            at='enum', en='Lid Follow Multipliers')
        self.preferenceNode.lidFollowMultipliersMarker.set(cb=True, l=True)

        # Add the mult attributes.
        for locus in ['upper', 'lower']:
            for suffix in ['VPosMult', 'VNegMult', 'ShapingMult']:
                self.preferenceNode.addAttr('%sLidFollow%s' % (locus, suffix),
                    at='double', min=0, max=1, dv=0)
                self.preferenceNode.attr('%sLidFollow%s' % (locus, suffix)).set(
                    1.0, cb=True)

        for item in ['Pos', 'Neg']:
            self.preferenceNode.addAttr('eyeFollowH%sMult' % item,
                min=0.0, max=1.0, dv=0.0)
            self.preferenceNode.attr('eyeFollowH%sMult' % item).set(1.0, cb=True)


        #=======================================================================
        # Primary Eye Lid Drivers.
        #=======================================================================

        attrs = ['blink', 'bias', 'biasMult']
        limits = [
            {'min':-1.0, 'max':1.0, 'dv':0.0},
            {'min':-1.0, 'max':1.0, 'dv':0.0},
            {'min': 0.0, 'max':1.0, 'dv':1.0}
            ]

        # Upper / Lower, Inner/ Outer, Lid / Shaping
        for vPos in ['upper', 'lower']:
            attrs.append('%sLid' % vPos)
            limits.append({'min':-1.0, 'max':1.0, 'dv':0.0})

            for hPos in ['Inner', 'Outer']:
                attrs.append('%sLidShape%s' % (vPos, hPos))
                limits.append({'min':-1.0, 'max':1.0, 'dv':0.0})

            attrs.append('%sLidShapeWeight' % vPos)
            limits.append({'min': 0.0, 'max':1.0, 'dv':0.0})

        # Tear Duct.
        attrs.append('tearDuct')
        limits.append({'min':-1.0, 'max':1.0, 'dv':0.0})

        # Add the marker:
        self.interfaceNode.addAttr('primaryEyeLidControlsMarker', nn=' ',
            at='enum', en='Primary Eye Lid Controls', k=True)
        self.interfaceNode.primaryEyeLidControlsMarker.set(lock=True)

        # And the attrs.
        for attr, limit in zip(attrs, limits):
            self.interfaceNode.addAttr(attr, at='double', dv=limit['dv'],
                min=limit['min'], max=limit['max'], k=True)


        #===================================================================
        # Primary Cluster and Offset Range Preferences.
        #===================================================================

        # Primary Clusters.
        for locus in ['upper', 'lower']:
            # Get the primary cluster parent.
            clusterParent = getattr(self, '_%sPrimaryClusterParent' % locus)

            # Add the Upper/Lower Clusters Marker Attribute.
            self.preferenceNode.addAttr('%sPrimaryClustersMarker' % locus,
                nn=' ', at='enum', en='%s Primary Clusters' % locus.title(),
                k=True)
            self.preferenceNode.attr('%sPrimaryClustersMarker' % locus).lock()

            for a in clusterParent.listAttr(ud=True):
                for i, b in enumerate(RANGE_ATTRS[:-1]):
                    c = re.search('(%s)(Value)([A-Z])' % b, a.name(includeNode=False))
                    if not c:
                        continue

                    if not i:
                        # Add the marker attribute to make things more readable.
                        self.preferenceNode.addAttr('%sCluster%sMarker' % (locus, c.group()[-1]),
                            nn=' ', at='enum', en='Cluster %s' % c.group()[-1])
                        self.preferenceNode.attr('%sCluster%sMarker' % (locus,
                            c.group()[-1])).set(cb=True, l=True)

                    # Add the range attributes.
                    attrName = '%sLidCluster%s%s' % (locus,
                        c.group()[0].upper(), c.group()[1:])
                    niceAttrName = nameUtils.camelCaseToNiceString(c.group()[:-1])

                    self.preferenceNode.addAttr(attrName, at='double',
                        nn=niceAttrName)
                    self.preferenceNode.attr(attrName).set(cb=True)


        # Offsets.
        # Upper / Lower.
        for locus in ['upper', 'lower']:

            # Add the Upper/Lower Offsets Marker Attribute.
            self.preferenceNode.addAttr('%sOffsetsMarker' % locus, nn=' ',
                at='enum', en='%s Offsets' % locus.title())
            self.preferenceNode.attr('%sOffsetsMarker' % locus).set(
                cb=True, lock=True)

            # Iterate over the offsets.
            for i, offset in enumerate(pymel.core.ls(LID_JOINT_CONV % (
                    self.modulePosition, locus.title(), 1))):

                suffix = 'Offset%s' % string.ascii_uppercase[i]

                # Add the marker attribute to make things more readable.
                self.preferenceNode.addAttr('%s%sMarker' % (locus, suffix),
                    nn=' ', at='enum', en=nameUtils.camelCaseToNiceString(suffix))
                self.preferenceNode.attr('%s%sMarker' % (locus, suffix)).set(
                    cb=True, l=True)

                # Add the range attributes.
                for a in offset.listAttr(ud=True):
                    for b in RANGE_ATTRS[:-1]:
                        if not '%sValue' % b in a.name(includeNode=False):
                            continue

                        attrName = '%sLidOffset%s%sValue%s' % (locus,
                            b[0].upper(), b[1:], string.ascii_uppercase[i])
                        niceAttrName = '%s Value' % nameUtils.camelCaseToNiceString(b)

                        self.preferenceNode.addAttr(attrName, at='double',
                            nn=niceAttrName)
                        self.preferenceNode.attr(attrName).set(cb=True)


        # Inner / Outer Bias Offsets
        for locus in ['inner', 'outer']:

            # Add the Inner / Outer Offsets Marker Attribute.
            self.preferenceNode.addAttr('%sOffsetsMarker' % locus, nn=' ',
                at='enum', en='%s Offsets' % locus.title())
            self.preferenceNode.attr('%sOffsetsMarker' % locus).set(
                cb=True, l=True)

            for i, offset in enumerate(pymel.core.ls(LID_JOINT_CONV % (
                    self.modulePosition, locus.title(), 1))):

                # Add the marker attribute to make things more readable.
                self.preferenceNode.addAttr('%sOffsetMarker' % locus, nn=' ',
                    at='enum', en='%s Offset' % locus.title())
                self.preferenceNode.attr('%sOffsetMarker' % locus).set(
                    cb=True, l=True)

                # Add the range attributes.
                for a in offset.listAttr(ud=True):
                    for b in RANGE_ATTRS[-2:]:
                        if not '%sValue' % b in a.name(includeNode=False):
                            continue

                        attrName = '%sLidOffset%s%sValue' % (locus,
                            b[0].upper(), b[1:])
                        niceAttrName = '%s Value' % nameUtils.camelCaseToNiceString(b)

                        self.preferenceNode.addAttr(attrName, at='double',
                            nn=niceAttrName)
                        self.preferenceNode.attr(attrName).set(cb=True)

                # Add the bias multiplier override.
                self.preferenceNode.addAttr('%sLidBiasMultOverride' % locus,
                    nn='Bias Mult Override', min=0.0, max=1.0, dv=1.0)
                self.preferenceNode.attr('%sLidBiasMultOverride' % locus).set(
                    cb=True)


        #=======================================================================
        # Secondary Eye Lid Drivers.
        #=======================================================================

        # Add the marker:
        self.interfaceNode.addAttr('secondaryEyeLidInterfacesMarker', nn=' ', at='enum',
            en='Secondary Eye Lid Interfaces', k=True)
        self.interfaceNode.secondaryEyeLidInterfacesMarker.set(lock=True)

        for locus in ['inner', 'outer', 'upper', 'lower']:

            # Add a marker attribute.
            self.interfaceNode.addAttr('%sSecondaryClusterMarker' % locus, at='enum',
                nn=' ', en='%s Cluster' % locus.title())
            self.interfaceNode.attr('%sSecondaryClusterMarker' % locus).set(cb=True, lock=True)

            # Add the attributes.
            for alias in ['Roll', 'Yaw', 'Pitch']:
                # Interface.
                self.interfaceNode.addAttr('%sSecondaryCluster%s' % (locus,
                    alias), at='double', nn=nameUtils.camelCaseToNiceString(
                    alias), k=True, min=-1.0, max=1.0, dv=0.0)


        #=======================================================================
        # Secondary Eye Lid Preferences.
        #=======================================================================

        # Add the marker:
        self.preferenceNode.addAttr('secondaryEyeLidPrefsMarker', nn=' ',
            at='enum', en='Secondary Eye Lid Prefs', k=True)
        self.preferenceNode.secondaryEyeLidPrefsMarker.set(lock=True)

        for locus in ['inner', 'outer', 'upper', 'lower']:

            # Add a marker attribute.
            self.preferenceNode.addAttr('%sSecondaryClusterMarker' % locus, at='enum',
                nn=' ', en='%s Cluster' % locus.title())
            self.preferenceNode.attr('%sSecondaryClusterMarker' % locus).set(cb=True, lock=True)

            # Add the attributes.
            for alias in ['Roll', 'Yaw', 'Pitch']:
                # Interface.
                self.preferenceNode.addAttr('%sSecondaryCluster%sMult' % (
                    locus, alias), nn=nameUtils.camelCaseToNiceString(
                    '%sMult' % alias), at='double')
                self.preferenceNode.attr('%sSecondaryCluster%sMult' % (
                    locus, alias)).set(45.0, cb=True)


        #===================================================================
        # Tear Duct Preferences.
        #===================================================================

        # Add the marker.
        self.preferenceNode.addAttr('tearDuctPrefsMarker', nn=' ', at='enum',
            en='Tear Duct Prefs')
        self.preferenceNode.tearDuctPrefsMarker.set(cb=True, lock=True)

        for suffix, value in zip(['Min', 'Max'], [-45.0, 45.0]):
            for alias in ['Roll', 'Yaw', 'Pitch']:
                self.preferenceNode.addAttr('tearDuct%s%s' % (alias, suffix),
                    at='double', nn='%s %s' % (alias, suffix))
                self.preferenceNode.attr('tearDuct%s%s' % (alias, suffix)).set(
                    value, cb=True)


        #=======================================================================
        # Eye Offset Interfaces.
        #=======================================================================

        # Add the marker:
        self.interfaceNode.addAttr('eyeOffsetInterfacesMarker', nn=' ', at='enum',
            en='Eye Offset Interfaces', k=True)
        self.interfaceNode.eyeOffsetInterfacesMarker.set(lock=True)

        rAliases = ['Roll', 'Yaw', 'Pitch']
        tAliases = ['ForwardBack', 'UpDown', 'SideToSide']

        # Add the attributes.
        for i, attr in enumerate(rAliases + tAliases):
            # Interface.
            self.interfaceNode.addAttr('eyeOffset%s' % attr, at='double',
                nn=nameUtils.camelCaseToNiceString(attr), k=True,
                min=-1.0, max=1.0, dv=0.0)


        #===================================================================
        # Eye Offset Preferences.
        #===================================================================

        # Add the marker:
        self.preferenceNode.addAttr('eyeOffsetPrefsMarker', nn=' ', at='enum',
            en='Eye Offset Prefs', k=True)
        self.preferenceNode.eyeOffsetPrefsMarker.set(lock=True)

        rAliases = ['Roll', 'Yaw', 'Pitch']
        tAliases = ['ForwardBack', 'UpDown', 'SideToSide']
        values = [45.0, 45.0, 45.0, 1.0, 1.0, 1.0]

        # Add the attributes.
        for i, attr in enumerate(rAliases + tAliases):
            self.preferenceNode.addAttr('eyeOffset%sMult' % attr, at='double',
                nn=nameUtils.camelCaseToNiceString('%sMult' % attr))
            self.preferenceNode.attr('eyeOffset%sMult' % attr).set(values[i], cb=True)

        return True




    def buildModule(self):

        def _secondaryClusterDriverSetup():
            sys.stdout.write('### SECONDARY CLUSTER DRIVER SETUP ###\n')

            upperClusters = self._upperSecondaryClusters
            lowerClusters = self._lowerSecondaryClusters

            ''' NOTE: The first and last values of the upperCluster and
            lowerCluster lists are identical. '''

            for locus, cluster in zip(['inner', 'upper', 'outer', 'lower'],
                    upperClusters + lowerClusters[1:2]):

                mult = pymel.core.general.createNode('multiplyDivide',
                    n='%s_%sSecondaryClusterRotateMult_mdn_0' % (
                    self.modulePosition, locus))

                for axis, alias in zip(['X', 'Y', 'Z'], ['Roll', 'Yaw', 'Pitch']):
                    (self.interfaceNode.attr('%sSecondaryCluster%s' % (locus,
                        alias)) >> mult.attr('input1%s' % axis))

                    (self.preferenceNode.attr('%sSecondaryCluster%sMult' % (
                        locus, alias)) >> mult.attr('input2%s' % axis))

                mult.output >> cluster.rotate

            return True


        def _createEyeLidDriver():
            sys.stdout.write('### CREATE EYE LID DRIVER ###\n')

            eyeDriver = pymel.core.createNode('script',
                name='%s_%sOutput_scr_0' % (self.modulePosition,
                self.moduleName))

            #===================================================================
            # Eye Offset.
            #===================================================================

            lidDriver1 = pymel.core.PyNode('%s_eyeLidDriver_jnt_1' % self.modulePosition)

            tAliases = ['ForwardBack', 'UpDown', 'SideToSide']
            rAliases = ['Roll', 'Yaw', 'Pitch']

            for attr, aliases in zip(['translate', 'rotate'], [tAliases, rAliases]):
                mult = pymel.core.createNode('multiplyDivide', n='%s_eyeOffset'
                    'TranslateResult_mdn_0' % self.modulePosition)

                for axis, alias in zip(['X', 'Y', 'Z'], aliases):
                    (self.interfaceNode.attr('eyeOffset%s' % alias) >>
                        mult.attr('input1%s' % axis))
                    (self.preferenceNode.attr('eyeOffset%sMult' % alias) >>
                        mult.attr('input2%s' % axis))

                mult.output >> lidDriver1.attr(attr)


            #===================================================================
            # Tear Duct.
            #===================================================================

            tdJoint = pymel.core.PyNode('%s_eyeTearDuct_jnt_0' % self.modulePosition)

            pma = pymel.core.createNode('plusMinusAverage',
                n='%s_tearDuctResult_pma_0' % self.modulePosition)

            suffices = ['Min', 'Max']
            values = [[-1.0, 0.0], [0.0, 1.0]]

            for i in range(2):

                # Create set range node.
                sr = pymel.core.createNode('setRange', n='%s_tearDuct%sRange'
                    '_str_0' % (self.modulePosition, suffices[i]))

                for axis, alias in zip(['X', 'Y', 'Z'], ['Roll', 'Yaw', 'Pitch']):
                    # Connect the interface node which drives.
                    self.interfaceNode.tearDuct >> sr.attr('value%s' % axis)

                    # Connect the preference node for range information.
                    (self.preferenceNode.attr('tearDuct%s%s' % (alias, suffices[i]))
                        >> sr.attr('%s%s' % (suffices[i].lower(), axis)))

                    # Set the static values for the rest.
                    sr.attr('%s%s' % (suffices[abs(i - 1)].lower(), axis)).set(0.0)
                    sr.attr('oldMin%s' % axis).set(values[i][0])
                    sr.attr('oldMax%s' % axis).set(values[i][1])

                sr.outValue >> pma.input3D[i]

            pma.output3D >> tdJoint.rotate


            #===================================================================
            # Lid Follow.
            #===================================================================

            # SPECIAL VOODOO FOR THE Y-AXIS TO STOP THE EYES MOVING AT
            # DIFFERENT RATES, WHILE STILL ACCOMMODATING A MIN/MAX RANGE FOR
            # THE EYE FOLLOW. OSCAR WINNING STUFF RIGHT HERE.

            iterDict = {'axis':['X', 'Y'], 'channel':['R', 'G'],
                'value':['Min', 'Max']}

            resultCond = pymel.core.createNode('condition',
                name='%s_eyeRangeMagic_cnd_0' % self.modulePosition)
            resultCond.operation.set(2)

            invertMult = pymel.core.createNode('multiplyDivide',
                name='%s_eyeRangeMagic_mdn_0' % self.modulePosition)
            invertMult.input2.set([-1.0, -1.0, -1.0])

            # We need absolute eye values so this next bit will give us that.
            absMult = pymel.core.createNode('multiplyDivide', n='%s_%sRangeAbs'
                'Value_cnd_0' % (self.modulePosition, self.moduleName))
            absMult.input2.set([1.0, -1.0, 0.0])

            for i, position in enumerate(['first', 'second']):

                axis = iterDict['axis'][i]
                channel = iterDict['channel'][i]
                value = iterDict['value'][i]

                cond = pymel.core.createNode('condition', n='%s_eyeRangeAbs%s'
                    'Value_cnd_0' % (self.modulePosition, value))

                # Terms.
                cond.operation.set(4) # Less than.
                self.preferenceNode.attr('eyeRange%sY' % value) >> cond.firstTerm
                cond.secondTerm.set(0.0)

                # Results.
                (self.preferenceNode.attr('eyeRange%sY' % value) >>
                    absMult.attr('input1%s' % axis))
                (absMult.attr('output%s' % axis) >>
                    cond.attr('colorIfTrue%s' % channel))
                (self.preferenceNode.attr('eyeRange%sY' % value) >>
                    cond.attr('colorIfFalse%s' % channel))

                # Hook to the result condition, and the invert mult.
                cond.attr('outColor%s' % channel) >> resultCond.attr('%sTerm' % position)
                cond.attr('outColor%s' % channel) >> invertMult.attr('input1%s' % axis)

                # We need an absolute value for min and max to decide which is
                # the bigger and what should be the range master.
                parent = 'colorIf%s' % str(bool(abs(i - 1)))

                (self.preferenceNode.attr('eyeRange%sY' % value) >>
                    resultCond.attr('%s%s' % (parent, channel)))

                (invertMult.attr('output%s' % axis) >>
                    resultCond.attr('%s%s' % (parent, iterDict['channel'][abs(i - 1)])))

            # Face control in Eye Rotation.
            faceControlRangeResults = [pymel.core.createNode('plusMinusAverage',
                name='%s_faceControlRangeResult_pma_0' % self.modulePosition)]

            # We have 2 eye controls on the face panel for each eye so that we
            # can drive the eye either in a pair, or as an individual, so this
            # is why we are iterating here.

            suffices = ['min', 'max']
            values = [-1.0, 1.0]
            axes = ['X', 'Y', 'Z']
            channels = ['R', 'G']

            for i, priority in enumerate(['primary', 'secondary']):

                faceControlRangeResults.append(
                    pymel.core.createNode('plusMinusAverage',
                        n='%s_%s%sFaceCtlRangeResult_pma_0' % (
                        self.modulePosition, self.moduleName, priority.title())
                        )
                    )

                for j in range(2):

                    # Create a min/max setRange self.preferenceNode, which we will add back
                    # together later to get a total range.
                    setRange = pymel.core.createNode('setRange',
                        n='%s_%s%sFaceCtl%sRange_str_0' % (self.modulePosition,
                        self.moduleName, priority.title(), suffices[j].title()))

                    # Hook up the range values. Note that we are remapping the
                    # X and Y values of the face controls to the Y and Z axes of
                    # the eye drivers respectively.
                    for k in range(2):
                        (self.interfaceNode.attr('%sFaceControl%s' % (priority, axes[k])) >>
                            setRange.attr('value%s' % axes[k + 1]))

                        # If its the X range of the face control we need to use
                        # the special Caleb magic range, otherwise we just use
                        # the values set on the master self.preferenceNode.
                        if not k:
                            (resultCond.attr('outColor%s' % channels[j]) >>
                                setRange.attr('%s%s' % (suffices[j], axes[k + 1])))
                        else:
                            (self.preferenceNode.attr('eyeRange%s%s' % (suffices[j].title(),
                                axes[k + 1])) >> setRange.attr('%s%s' % (suffices[j],
                                axes[k + 1])))

                        # Set the min/max limit/floor at 0.0
                        setRange.attr('%s%s' % (suffices[abs(j - 1)],
                            axes[k + 1])).set(0.0)

                        # Set the old min/max floor/limit to -1.0/1.0
                        setRange.attr('old%s%s' % (suffices[j].title(),
                            axes[k + 1])).set(values[j])

                        # Set the old min/max limit/floor at 0.0
                        setRange.attr('old%s%s' % (suffices[abs(j - 1)].title(),
                            axes[k + 1])).set(0.0)

                    setRange.outValue >> faceControlRangeResults[i + 1].attr('input3D[%d]' % j)

                faceControlRangeResults[i + 1].output3D >> faceControlRangeResults[0].input3D[i]

                # End Face control setup.

                eyeResultPMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sResult_pma_0' % (self.modulePosition,
                    self.moduleName))

                eyeResultClamp = pymel.core.createNode('clamp',
                    name='%s_%sResult_clp_0' % (self.modulePosition,
                    self.moduleName))

            self.interfaceNode.bodyRig >> eyeResultPMA.input3D[0]
            faceControlRangeResults[0].output3D >> eyeResultPMA.input3D[1]

            eyeResultPMA.output3D >> eyeResultClamp.input
            for plug, value in zip(['R', 'G'], ['Min', 'Max']):
                for axis, channel in zip(['X', 'Y', 'Z'], ['R', 'G', 'B']):
                    if axis in ['X', 'Z']:
                        self.preferenceNode.attr('eyeRange%s%s' % (value, axis)) >> eyeResultClamp.attr('%s%s' % (value.lower(), channel))
                    elif axis is 'Y':
                        resultCond.attr('outColor%s' % plug) >> eyeResultClamp.attr('%s%s' % (value.lower(), channel))


            ### SETUP THE EYE DRIVER ###
            eyeDriver.addAttr('eyeRotateOut', at='double3')
            for axis in ['X', 'Y', 'Z']:
                eyeDriver.addAttr('eyeRotateOut' + axis, p='eyeRotateOut', k=True)

            eyeResultClamp.output >> eyeDriver.eyeRotateOut
            eyeDriver.eyeRotateOut >> pymel.core.PyNode('%s_eyeBallDriver_jnt_0.rotate' % self.modulePosition)

            # Add the Lid Follow Driver Attributes.
            axes = ['h', 'v']
            axesDict = {'h': 'Y', 'v': 'Z'}
            values = ['Pos', 'Neg']
            valuesDict = {'Pos': 'Max', 'Neg': 'Min'}

            for axis in axes:
                eyeDriver.addAttr('%sRange' % axis, min=-1, max=1, dv=0, k=True)

            for axis in axes:
                adl = pymel.core.createNode('addDoubleLinear')
                for i, value in enumerate(values):
                    eyeDriver.addAttr(axis + value, min=0, max=1, dv=0, k=True)
                    rmv = pymel.core.createNode('remapValue')
                    eyeDriver.attr('eyeRotateOut%s' % axesDict[axis]) >> rmv.inputValue
                    rmv.inputMin.set(0)
                    self.preferenceNode.attr('eyeRange%s%s' % (valuesDict[value], axesDict[axis])) >> rmv.inputMax
                    rmv.outputMin.set(0)
                    rmv.outputMax.set(1)
                    out = rmv.outValue
                    out >> eyeDriver.attr(axis + value)
                    if value is 'Neg':
                        mdl = pymel.core.createNode('multDoubleLinear')
                        out >> mdl.input1
                        mdl.input2.set(-1.0)
                        out = mdl.output
                    out >> adl.attr('input%d' % (i + 1))
                adl.output >> eyeDriver.attr('%sRange' % axis)

            for v1 in values: # Pos, Neg
                mult = pymel.core.createNode('multiplyDivide')
                for axis in ['X', 'Y']:
                    eyeDriver.attr('h%s' % v1) >> mult.attr('input1%s' % axis)
                for v2, axis in zip(values, ['X', 'Y']):
                    eyeDriver.attr('v%s' % v2) >> mult.attr('input2%s' % axis)
                    eyeDriver.addAttr(axes[0] + v1 + axes[1].upper() + v2, min=0, max=1,
                        dv=0, k=True)
                    mult.attr('output%s' % axis) >> eyeDriver.attr('h%sV%s' % (v1, v2))

#             # Add the lid follow multiply marker.
#             self.preferenceNode.addAttr('lidFollowMultiplyMarker', nn=' ', at='enum', en='Lid Follow Multiply', k=True)
#             self.preferenceNode.lidFollowMultiplyMarker.lock()


            lidDict = {'v':[['upper', 'lower'], ['pos', 'neg']],
                'h':[['inner', 'outer'], ['neg', 'pos'], ['x', 'y'], ['R', 'G']]}

            if self.modulePosition == 'R':

                lidDict = {'v':[['upper', 'lower'], ['pos', 'neg']],
                    'h':[['inner', 'outer'], ['pos', 'neg'], ['x', 'y'], ['R', 'G']]}

#             # Add the Follow Multiplier Attributes first because they will be the
#             # most useful to the setup
#             for lid in lidDict['v'][0]:
#                 for suffix in ['LidFollowVPosMult', 'LidFollowVNegMult', 'LidFollowShapingMult']:
#                     self.preferenceNode.addAttr(lid + suffix, at='double', min=0, max=1, dv=0, k=True)

            for i, v in enumerate(zip(*lidDict['v'])): # UPPER LID IS VPOS, LOWER LID IS VNEG FOR NEGATIVE RANGE OF FOLLOW
                clusterParent = getattr(self, '_%sPrimaryClusterParent' % v[0])

                # SUBTRACT HORIZONTAL VALUES AWAY FROM THE VERTICAL
                pma0 = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sLidFollowNeg_pma_0' % (self.modulePosition, v[0]))
                pma0.operation.set(2)

                # SET RANGE FOR SHAPING MULT
                setr = pymel.core.createNode('setRange',
                    name='%s_%sLidFollowNegShape_str_0' % (self.modulePosition, v[0]))

                # CLAMP IT SO WE GET NO LESS THAN 0
                clamp = pymel.core.createNode('clamp',
                    name='%s_%sLidFollowNeg_clp_0' % (self.modulePosition, v[0]))

                # THEN WE ADD THE CORNER VALUES IN, AND HOPEFULLY GET A NICE SMOOTH TRANSITION.
                # INVERT IT
                invMult = pymel.core.createNode('multiplyDivide',
                    name='%s_%sLidFollowNeg_mdn_0' % (self.modulePosition, v[0]))

                mult0 = pymel.core.createNode('multiplyDivide')
                mult1 = pymel.core.createNode('multiplyDivide')

                # THE RESULT PMA IS FOR ADDING THE POSITIVE AND NEGATIVE RANGES TOGETHER
                resultPMA0 = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sLidFollowResult_pma_0' % (self.modulePosition, v[0]))

                resultPMA1 = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sLidFollowResult_pma_1' % (self.modulePosition, v[0]))

                resultClamp = pymel.core.createNode('clamp',
                    name='%s_%sLidFollowResult_clp_0' % (self.modulePosition, v[0]))

                for axis, color in zip(['x', 'y'], ['R', 'G']):
                    eyeDriver.attr('v%s' % v[1].title()) >> pma0.attr('input2D[0].input2D%s' % axis)
                    setr.attr('outValue%s' % axis.title()) >> pma0.attr('input2D[1].input2D%s' % axis)
                    [setr.attr('%s%s' % (at, axis.upper())).set(val) for at, val in zip(['min', 'oldMin', 'max', 'oldMax'], [0.0, 0.0, 1.0, 1.0])]
                    # Connect the shaping mult.
                    self.preferenceNode.attr('%sLidFollowShapingMult' % v[0]) >> setr.attr('max%s' % axis.upper())
                    pma0.attr('output2D%s' % axis) >> clamp.attr('input%s' % color)
                    [clamp.attr('%s%s' % (at, color)).set(val) for at, val in zip(['min', 'max'], [0.0, 1.0])]
                    clamp.attr('output%s' % color) >> invMult.attr('input1%s' % axis.upper())
                    invMult.attr('input2%s' % axis.upper()).set(-1.0)
                    invMult.attr('output%s' % axis.upper()) >> mult0.attr('input1%s' % axis.upper())
                    self.preferenceNode.attr('%sLidFollowV%sMult' % (v[0], lidDict['v'][1][0].title())) >> mult0.attr('input2%s' % axis.upper())
                    mult0.attr('output%s' % axis.upper()) >> resultPMA0.attr('input2D[0].input2D%s' % axis)
                    eyeDriver.attr('v%s' % lidDict['v'][1][abs(i - 1)].title()) >> mult1.attr('input1%s' % axis.upper())
                    self.preferenceNode.attr('%sLidFollowV%sMult' % (v[0], lidDict['v'][1][abs(i - 1)].title())) >> mult1.attr('input2%s' % axis.upper())
                    mult1.attr('output%s' % axis.upper()) >> resultPMA0.attr('input2D[1].input2D%s' % axis)

                for j, h in enumerate(zip(*lidDict['h'])): # OUTER LID IS HPOS, INNER LID IS HNEG FOR NEGATIVE RANGE OF FOLLOW
                    eyeDriver.attr('h%s' % lidDict['h'][1][abs(j - 1)].title()) >> setr.attr('value%s' % (h[2].upper()))
                    resultPMA0.attr('output2D%s' % h[2]) >> resultPMA1.attr('input2D[0].input2D%s' % h[2])
                    self.interfaceNode.attr('%sLidShape%s' % (v[0], h[0].title())) >> resultPMA1.attr('input2D[1].input2D%s' % h[2])
                    resultPMA1.attr('output2D%s' % h[2]) >> resultClamp.attr('input%s' % h[3])
                    resultClamp.attr('min%s' % h[3]).set(-1.0)
                    resultClamp.attr('max%s' % h[3]).set(1.0)
                    resultClamp.attr('output%s' % h[3]) >> clusterParent.attr('shape%s' % h[0].title())

                self.interfaceNode.attr('%sLidShapeWeight' % v[0]) >> clusterParent.shapeWeight

            lidParent = pymel.core.PyNode('%s_eyeLidParent_jnt_0' % self.modulePosition)
            a = pymel.core.createNode('multiplyDivide',
                    name='%s_eyeFollowH_mdn_0' % self.modulePosition)

            b = pymel.core.createNode('multiplyDivide',
                    name='%s_eyeFollowH_mdn_1' % self.modulePosition)

            c = pymel.core.createNode('addDoubleLinear',
                    name='%s_eyeFollowH_adl_0' % self.modulePosition)

            for i, v in enumerate(zip(values, ['X', 'Y'])):
                self.preferenceNode.attr('eyeRange%sY' % valuesDict[v[0]]) >> a.attr('input1%s' % v[1])
                eyeDriver.attr('h%s' % v[0]) >> a.attr('input2%s' % v[1])
#                 self.preferenceNode.addAttr('eyeFollowH%sMult' % v[0], min=0.0, max=1.0, dv=0.0, k=True)
                a.attr('output%s' % v[1]) >> b.attr('input1%s' % v[1])
                self.preferenceNode.attr('eyeFollowH%sMult' % v[0]) >> b.attr('input2%s' % v[1])
                b.attr('output%s' % v[1]) >> c.attr('input%d' % (i + 1))

            c.output >> pymel.core.PyNode('%s_eyeLidDriver_jnt_2' % self.modulePosition).rotateY

#             self.preferenceNode.upperLidFollowVPosMult.set(1.0)
#             self.preferenceNode.upperLidFollowVNegMult.set(1.0)
#             self.preferenceNode.upperLidFollowShapingMult.set(1.0)
#             self.preferenceNode.lowerLidFollowVPosMult.set(1.0)
#             self.preferenceNode.lowerLidFollowVNegMult.set(1.0)
#             self.preferenceNode.lowerLidFollowShapingMult.set(1.0)
#             self.preferenceNode.eyeFollowHPosMult.set(1.0)
#             self.preferenceNode.eyeFollowHNegMult.set(1.0)

            ########################
            # LID / BLINK CONTROLS #
            ########################

            # Bias Should not go past 0.
            # Bias Should utilize the blink range before it goes into the bias.

            for vPos in ['upper', 'lower']:
                #===============================================================
                # Connect Primary Clusters
                #===============================================================

                # Get the cluster parent self.preferenceNode.
                clusterParent = getattr(self, '_%sPrimaryClusterParent' % vPos)

                # Here we are setting up a network so that the blink and *Lid
                # controls can co-exist together.
                blinkRangePMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sBlinkRange_pma_0' % (self.modulePosition, vPos))

                blinkRangePMA.operation.set(2)
                blinkRangePMA.input1D[0].set(1.0)
                self.interfaceNode.attr('%sLid' % vPos) >> blinkRangePMA.input1D[1]

                blinkSR = pymel.core.createNode('setRange',
                    name='%s_%sBlinkRange_str_0' % (self.modulePosition, vPos))

                self.interfaceNode.blink >> blinkSR.valueX
                self.interfaceNode.blink >> blinkSR.valueY
                blinkSR.minX.set(-1.0)
                blinkSR.maxX.set(0.0)
                blinkSR.oldMinX.set(-1.0)
                blinkSR.oldMaxX.set(0.0)
                blinkSR.minY.set(0.0)
                blinkRangePMA.output1D >> blinkSR.maxY
                blinkSR.oldMinY.set(0.0)
                blinkSR.oldMaxY.set(1.0)

                blinkResultPMA = pymel.core.createNode('plusMinusAverage',
                    name='%s_%sBlinkResult_pma_0' % (self.modulePosition, vPos))

                blinkSR.outValueX >> blinkResultPMA.input2D[0].input2Dx
                blinkSR.outValueY >> blinkResultPMA.input2D[1].input2Dx
                self.interfaceNode.attr('%sLid' % vPos) >> blinkResultPMA.input2D[0].input2Dy
                blinkResultPMA.output2Dx >> blinkResultPMA.input2D[1].input2Dy

                # Setup the Blink.
                a = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sBlinkRange_adl_0' % (self.modulePosition, vPos))

                b = pymel.core.createNode('addDoubleLinear',
                    name='%s_%sBlinkResult_adl_0' % (self.modulePosition, vPos))

                blinkSR.outValueX >> a.input1
                blinkSR.outValueY >> a.input2

                self.interfaceNode.attr('%sLid' % vPos) >> b.input1
                a.output >> b.input2

                blinkResult = pymel.core.createNode('clamp',
                    name='%s_%sBlinkResult_clp_0' % (self.modulePosition, vPos))

                b.output >> blinkResult.inputR
                blinkResult.minR.set(-1)
                blinkResult.maxR.set(1)

                blinkResult.outputR >> clusterParent.blink

                # Connect the Bias.
                for a in ['bias', 'biasMult']:
                    self.interfaceNode.attr(a) >> clusterParent.attr(a)

                for a in clusterParent.listAttr(ud=True):
                    for b in RANGE_ATTRS[:-1]:
                        c = re.search('(%s)(Value)([A-Z])' % b, a.name(includeNode=False))
                        if not c:
                            continue

                        if not self.preferenceNode.hasAttr('%sLidCluster%s%s' % (
                                vPos, c.group()[0].upper(), c.group()[1:])):
                            continue

                        self.preferenceNode.attr('%sLidCluster%s%s' % (
                                vPos, c.group()[0].upper(), c.group()[1:])) >> a


                #===============================================================
                # Connect Offsets.
                #===============================================================
                for i, offset in enumerate(pymel.core.ls(LID_JOINT_CONV % (
                        self.modulePosition, vPos.title(), 1))):

                    # Connect Interfaces.
                    for a in DRIVER_ATTRS[:-2]:
                        if a == 'blink':
                            blinkResult.outputR >> offset.attr(a)
                        else:
                            self.interfaceNode.attr(a) >> offset.attr(a)

                    # Connect Preferences.
                    for a in offset.listAttr(ud=True):
                        for b in RANGE_ATTRS:
                            if not '%sValue' % b in a.name(includeNode=False):
                                continue

                            self.preferenceNode.attr('%sLidOffset%s%sValue%s' % (vPos,
                                b[0].upper(), b[1:], string.ascii_uppercase[i])) >> a


            #===================================================================
            # Connect corner bias offsets.
            #===================================================================
            for locus in ['inner', 'outer']:

                for i, offset in enumerate(pymel.core.ls(LID_JOINT_CONV % (
                        self.modulePosition, locus.title(), 1))):

                    # Connect Interfaces.
                    for a in DRIVER_ATTRS:
                        self.interfaceNode.attr(a) >> offset.attr(a)

                        if a != 'bias':
                            continue

                        self.preferenceNode.attr('%sLidBiasMultOverride' % locus) >> offset.biasMultOverride

                    # Connect Preferences.
                    for a in offset.listAttr(ud=True):
                        for b in RANGE_ATTRS[-2:]:
                            if not '%sValue' % b in a.name(includeNode=False):
                                continue

                            self.preferenceNode.attr('%sLidOffset%s%sValue' % (
                                locus, b[0].upper(), b[1:])) >> a


        sys.stdout.write('### MEGA EYE BUILDER ###\n')

        self._createAdditionalSetupGroups()
        self._createPrimaryCurves()
        self._simplifyPrimaryCurves()
        self._createSecondaryCurves()
        self._clusterPrimaryCurves()
        self._clusterSecondaryCurves()
        self._connectCurveVizSwitches()
        self._setupIKHandles()

        self._primaryClusterDriverSetup()
        self._offsetDriverSetup()

        self._setupInterfacesAndPreferences()

        _secondaryClusterDriverSetup()
        _createEyeLidDriver()

