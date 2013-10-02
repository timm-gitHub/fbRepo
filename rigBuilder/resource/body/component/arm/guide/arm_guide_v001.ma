//Maya ASCII 2013ff10 scene
//Name: arm_guide_v001.ma
//Last modified: Wed, Sep 18, 2013 02:09:34 PM
//Codeset: 1252
requires maya "2013ff10";
requires "ikSpringSolver" "1.0";
requires "Mayatomr" "2013.0 - 3.10.1.11 ";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201209140124-844721";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.015946416145805387 12.558276828372591 23.689870466182203 ;
	setAttr ".r" -type "double3" -27.938352729602414 4.6000000000000334 5.982811390405938e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 26.231164731775117;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "rig_guide";
createNode transform -n "R_noTouch_org_0" -p "rig_guide";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode transform -n "R_middle_crv_0" -p "R_noTouch_org_0";
createNode nurbsCurve -n "R_middle_crv_0Shape" -p "R_middle_crv_0";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-9.0000000000000071 0 0
		-9.6800000000000104 0 2.2648549702353194e-016
		-10.320000000000011 0 4.3964831775156199e-016
		-11.000000000000012 0 6.6613381477509392e-016
		;
createNode transform -n "R_pinky_crv_0" -p "R_noTouch_org_0";
createNode nurbsCurve -n "R_pinky_crv_0Shape" -p "R_pinky_crv_0";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-9.0000000000000071 0 -1.0000000000000002
		-9.6800000000000104 0 -1.0000000000000002
		-10.320000000000011 0 -1.0000000000000002
		-11.000000000000012 0 -1.0000000000000002
		;
createNode transform -n "R_thumb_crv_0" -p "R_noTouch_org_0";
createNode nurbsCurve -n "R_thumb_crv_0Shape" -p "R_thumb_crv_0";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-8.0000000000000071 0 2.0000000000000004
		-8.0000000000000071 0 2.6800000000000006
		-8.0000000000000071 0 3.3200000000000007
		-8.0000000000000071 0 4.0000000000000009
		;
createNode transform -n "R_index_crv_0" -p "R_noTouch_org_0";
createNode nurbsCurve -n "R_index_crv_0Shape" -p "R_index_crv_0";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-9.0000000000000071 0 1.0000000000000002
		-9.6800000000000104 0 1.0000000000000002
		-10.320000000000011 0 1.0000000000000002
		-11.000000000000012 0 1.0000000000000002
		;
createNode transform -n "R_arm_crv_0" -p "R_noTouch_org_0";
createNode nurbsCurve -n "R_arm_crv_0Shape" -p "R_arm_crv_0";
	setAttr -k off ".v";
	setAttr -s 3 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 2 0 no 3
		3 0 1 2
		3
		-3 0 0
		-5 0 0
		-7 0 0
		;
createNode transform -n "R_xxNAMESPACExxClavicle_loc_X" -p "R_noTouch_org_0";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxClavicle_loc_XShape" -p "R_xxNAMESPACExxClavicle_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode pointConstraint -n "R_clavicle_loc_X_pointConstraint1" -p "R_xxNAMESPACExxClavicle_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "Clavicle_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -0.5 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxShoulder_loc_X" -p "R_xxNAMESPACExxClavicle_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
	setAttr ".label" 10;
	setAttr ".twist" 1;
	setAttr ".global" 1;
createNode locator -n "R_xxNAMESPACExxShoulder_loc_XShape" -p "R_xxNAMESPACExxShoulder_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode pointConstraint -n "R_shoulder_loc_X_pointConstraint1" -p "R_xxNAMESPACExxShoulder_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "Shoulder_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxElbow_loc_X" -p "R_xxNAMESPACExxShoulder_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "22";
	setAttr ".twist" 1;
createNode locator -n "R_xxNAMESPACExxElbow_loc_XShape" -p "R_xxNAMESPACExxElbow_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode pointConstraint -n "R_elbow_loc_X_pointConstraint1" -p "R_xxNAMESPACExxElbow_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "Elbow_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxWrist_loc_X" -p "R_xxNAMESPACExxElbow_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
	setAttr ".label" 12;
	setAttr ".global" 1;
createNode locator -n "R_xxNAMESPACExxWrist_loc_XShape" -p "R_xxNAMESPACExxWrist_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode pointConstraint -n "R_wrist_loc_X_pointConstraint1" -p "R_xxNAMESPACExxWrist_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "Wrist_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxCup_loc_X" -p "R_xxNAMESPACExxWrist_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxCup_loc_XShape" -p "R_xxNAMESPACExxCup_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_cup_loc_X_pointConstraint1" -p "R_xxNAMESPACExxCup_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "Cup_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.1176835624402353 3 -0.233 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxPinkyA_loc_X" -p "R_xxNAMESPACExxCup_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxPinkyA_loc_XShape" -p "R_xxNAMESPACExxPinkyA_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_pinkyA_loc_X_pointConstraint1" -p "R_xxNAMESPACExxPinkyA_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "PinkyA_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.25 3 -0.233 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxPinkyB_loc_X" -p "R_xxNAMESPACExxPinkyA_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxPinkyB_loc_XShape" -p "R_xxNAMESPACExxPinkyB_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_pinkyB_loc_X_pointConstraint1" -p "R_xxNAMESPACExxPinkyB_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "PinkyB_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.42 3 -0.23300000000000004 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxPinkyC_loc_X" -p "R_xxNAMESPACExxPinkyB_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxPinkyC_loc_XShape" -p "R_xxNAMESPACExxPinkyC_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_pinkyC_loc_X_pointConstraint1" -p "R_xxNAMESPACExxPinkyC_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "PinkyC_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.58 3 -0.23300000000000004 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxPinkyD_loc_X" -p "R_xxNAMESPACExxPinkyC_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxPinkyD_loc_XShape" -p "R_xxNAMESPACExxPinkyD_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_pinkyD_loc_X_pointConstraint1" -p "R_xxNAMESPACExxPinkyD_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "PinkyD_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.75 3 -0.233 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxMiddleA_loc_X" -p "R_xxNAMESPACExxWrist_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxMiddleA_loc_XShape" -p "R_xxNAMESPACExxMiddleA_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_middleA_loc_X_pointConstraint1" -p "R_xxNAMESPACExxMiddleA_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "MiddleA_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.25 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxMiddleB_loc_X" -p "R_xxNAMESPACExxMiddleA_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxMiddleB_loc_XShape" -p "R_xxNAMESPACExxMiddleB_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_middleB_loc_X_pointConstraint1" -p "R_xxNAMESPACExxMiddleB_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "MiddleB_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.42 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxMiddleC_loc_X" -p "R_xxNAMESPACExxMiddleB_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxMiddleC_loc_XShape" -p "R_xxNAMESPACExxMiddleC_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_middleC_loc_X_pointConstraint1" -p "R_xxNAMESPACExxMiddleC_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "MiddleC_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.58 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxMiddleD_loc_X" -p "R_xxNAMESPACExxMiddleC_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxMiddleD_loc_XShape" -p "R_xxNAMESPACExxMiddleD_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_middleD_loc_X_pointConstraint1" -p "R_xxNAMESPACExxMiddleD_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "MiddleD_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.75 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxIndexA_loc_X" -p "R_xxNAMESPACExxWrist_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxIndexA_loc_XShape" -p "R_xxNAMESPACExxIndexA_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_indexA_loc_X_pointConstraint1" -p "R_xxNAMESPACExxIndexA_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "IndexA_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.25 3 0.233 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxIndexB_loc_X" -p "R_xxNAMESPACExxIndexA_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxIndexB_loc_XShape" -p "R_xxNAMESPACExxIndexB_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_indexB_loc_X_pointConstraint1" -p "R_xxNAMESPACExxIndexB_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "IndexB_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.42 3 0.23300000000000004 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxIndexC_loc_X" -p "R_xxNAMESPACExxIndexB_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxIndexC_loc_XShape" -p "R_xxNAMESPACExxIndexC_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_indexC_loc_X_pointConstraint1" -p "R_xxNAMESPACExxIndexC_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "IndexC_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.58 3 0.23300000000000004 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxIndexD_loc_X" -p "R_xxNAMESPACExxIndexC_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "yup";
createNode locator -n "R_xxNAMESPACExxIndexD_loc_XShape" -p "R_xxNAMESPACExxIndexD_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_indexD_loc_X_pointConstraint1" -p "R_xxNAMESPACExxIndexD_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "IndexD_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.75 3 0.233 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxThumbA_loc_X" -p "R_xxNAMESPACExxWrist_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "zup";
createNode locator -n "R_xxNAMESPACExxThumbA_loc_XShape" -p "R_xxNAMESPACExxThumbA_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_thumbA_loc_X_pointConstraint1" -p "R_xxNAMESPACExxThumbA_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "ThumbA_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2.9989352354159893 3 0.45645359339744895 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxThumbB_loc_X" -p "R_xxNAMESPACExxThumbA_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "zup";
createNode locator -n "R_xxNAMESPACExxThumbB_loc_XShape" -p "R_xxNAMESPACExxThumbB_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_thumbB_loc_X_pointConstraint1" -p "R_xxNAMESPACExxThumbB_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "ThumbB_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.1689352354159892 3 0.45645359339744895 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxThumbC_loc_X" -p "R_xxNAMESPACExxThumbB_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "zup";
createNode locator -n "R_xxNAMESPACExxThumbC_loc_XShape" -p "R_xxNAMESPACExxThumbC_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_thumbC_loc_X_pointConstraint1" -p "R_xxNAMESPACExxThumbC_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "ThumbC_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.3289352354159893 3 0.45645359339744895 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxThumbD_loc_X" -p "R_xxNAMESPACExxThumbC_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "zup";
createNode locator -n "R_xxNAMESPACExxThumbD_loc_XShape" -p "R_xxNAMESPACExxThumbD_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode pointConstraint -n "R_thumbD_loc_X_pointConstraint1" -p "R_xxNAMESPACExxThumbD_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "ThumbD_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.4989352354159893 3 0.45645359339744895 ;
	setAttr -k on ".w0";
createNode transform -n "R_clavicle_crv_0" -p "R_noTouch_org_0";
createNode nurbsCurve -n "R_clavicle_crv_Shape0" -p "R_clavicle_crv_0";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 0 0
		-1 0 0
		;
createNode transform -n "curve2" -p "R_noTouch_org_0";
createNode nurbsCurve -n "curveShape2" -p "curve2";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-7 0 0
		-9.0000000000000071 0 1.0000000000000002
		-9.6800000000000104 0 1.0000000000000002
		-10.320000000000011 0 1.0000000000000002
		-11.000000000000012 0 1.0000000000000002
		;
createNode transform -n "curve1" -p "R_noTouch_org_0";
createNode nurbsCurve -n "curveShape1" -p "curve1";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-7 0 0
		-8.0000000000000071 0 2.0000000000000004
		-8.0000000000000071 0 2.6800000000000006
		-8.0000000000000071 0 3.3200000000000007
		-8.0000000000000071 0 4.0000000000000009
		;
createNode transform -n "curve3" -p "R_noTouch_org_0";
createNode nurbsCurve -n "curveShape3" -p "curve3";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-7 0 0
		-9.0000000000000071 0 0
		-9.6800000000000104 0 2.2648549702353194e-016
		-10.320000000000011 0 4.3964831775156199e-016
		-11.000000000000012 0 6.6613381477509392e-016
		;
createNode transform -n "curve4" -p "R_noTouch_org_0";
createNode nurbsCurve -n "curveShape4" -p "curve4";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		-7 0 0
		-8 0 -1
		-9.0000000000000071 0 -1.0000000000000002
		-9.6800000000000104 0 -1.0000000000000002
		-10.320000000000011 0 -1.0000000000000002
		-11.000000000000012 0 -1.0000000000000002
		;
createNode transform -n "R_arm_org_0" -p "rig_guide";
	setAttr ".ove" yes;
	setAttr ".ovc" 21;
createNode transform -n "R_hand_org_0" -p "R_arm_org_0";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
createNode transform -n "R_thumb_org_0" -p "R_hand_org_0";
	setAttr ".t" -type "double3" -1.0000000000000071 0 2.0000000000000004 ;
createNode transform -n "R_thumbD_ctg_0" -p "R_thumb_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 0 2.0000000000000004 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbD_cth_0" -p "R_thumbD_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbD_ctl_0" -p "R_thumbD_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_thumbD_ctl_0Shape" -p "R_thumbD_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_thumbC_ctg_0" -p "R_thumb_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbC_cth_0" -p "R_thumbC_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbC_ctl_0" -p "R_thumbC_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_thumbC_ctl_0Shape" -p "R_thumbC_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_thumbC_ctg_0_pointConstraint1" -p "R_thumbC_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "ThumbA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "ThumbD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.2489352354159893 3 0.49854794367031974 ;
	setAttr -k on ".w0" 0.34;
	setAttr -k on ".w1" 0.66;
createNode aimConstraint -n "R_thumbC_ctg_0_aimConstraint1" -p "R_thumbC_ctg_0";
	addAttr -ci true -sn "w0" -ln "ThumbA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 38.639924670766568 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_thumbB_ctg_0" -p "R_thumb_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbB_cth_0" -p "R_thumbB_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbB_ctl_0" -p "R_thumbB_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_thumbB_ctl_0Shape" -p "R_thumbB_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_thumbB_ctg_0_pointConstraint1" -p "R_thumbB_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "ThumbA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "ThumbD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.2489352354159893 3 0.49854794367031974 ;
	setAttr -k on ".w0" 0.66;
	setAttr -k on ".w1" 0.34;
createNode aimConstraint -n "R_thumbB_ctg_0_aimConstraint1" -p "R_thumbB_ctg_0";
	addAttr -ci true -sn "w0" -ln "ThumbA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 38.639924670766568 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_thumbA_ctg_0" -p "R_thumb_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbA_cth_0" -p "R_thumbA_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbA_ctl_0" -p "R_thumbA_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_thumbA_ctl_0Shape" -p "R_thumbA_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_thumbOrient_ctg_0" -p "R_thumbA_ctl_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_thumbOrient_ctl_0" -p "R_thumbOrient_ctg_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_thumbOrient_ctl_0Shape" -p "R_thumbOrient_ctl_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 20 0 no 3
		21 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
		21
		1.0208716308559207e-015 0.90949277821846364 0.52417935965447993
		7.6421688823816169e-016 0.67545949029663455 0.80308937132195668
		7.6421688823816169e-016 0.36014729445275273 0.98513495247119598
		7.6421688823816169e-016 0.0015874950179869556 1.0483587193089576
		7.6421688823816169e-016 -0.35697230441677774 0.98513495247119598
		7.6421688823816169e-016 -0.67228450026066011 0.80308937132195635
		1.0208716308559207e-015 -0.90631778818248832 0.52417935965447837
		1.0208716308559207e-015 -1.0308442996954219 0.18204558114923824
		7.6421688823816169e-016 -1.0308442996954217 -0.18204558114923647
		1.0208716308559207e-015 -0.90631778818248832 -0.52417935965447837
		7.6421688823816169e-016 -0.67228450026065922 -0.80308937132195557
		7.6421688823816169e-016 -0.35697230441677691 -0.98513495247119409
		1.0208716308559207e-015 0.0015874950179882094 -1.0483587193089567
		1.0208716308559207e-015 0.36014729445275273 -0.98513495247119409
		1.0208716308559207e-015 0.67545949029663488 -0.8030893713219549
		7.6421688823816169e-016 0.90949277821846652 -0.52417935965447704
		7.6421688823816169e-016 1.0340192897314024 -0.18204558114923597
		7.6421688823816169e-016 1.0340192897314024 0.18204558114923905
		7.6421688823816169e-016 1.155426351068692 0.064971320451800055
		7.6421688823816169e-016 1.0340192897314024 0.18204558114923905
		7.6421688823816169e-016 0.92142780595575091 0.047661593583038536
		;
createNode aimConstraint -n "R_thumbOrient_ctg_0_aimConstraint1" -p "R_thumbOrient_ctg_0";
	addAttr -ci true -sn "w0" -ln "ThumbD_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 180 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_pinky_org_0" -p "R_hand_org_0";
	setAttr ".t" -type "double3" -2.0000000000000071 0 -1.0000000000000002 ;
createNode transform -n "R_pinkyD_ctg_0" -p "R_pinky_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.0000000000000053 0 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyD_cth_0" -p "R_pinkyD_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyD_ctl_0" -p "R_pinkyD_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_pinkyD_ctl_0Shape" -p "R_pinkyD_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_pinkyC_ctg_0" -p "R_pinky_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyC_cth_0" -p "R_pinkyC_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyC_ctl_0" -p "R_pinkyC_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_pinkyC_ctl_0Shape" -p "R_pinkyC_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_pinkyC_ctg_0_pointConstraint1" -p "R_pinkyC_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "PinkyA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "PinkyD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.5 3 -0.49314815713265153 ;
	setAttr -k on ".w0" 0.34;
	setAttr -k on ".w1" 0.66;
createNode aimConstraint -n "R_pinkyC_ctg_0_aimConstraint1" -p "R_pinkyC_ctg_0";
	addAttr -ci true -sn "w0" -ln "PinkyA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -39.034022205165613 -1.0757400502583725e-015 -3.0349322574917972e-015 ;
	setAttr -k on ".w0";
createNode transform -n "R_pinkyB_ctg_0" -p "R_pinky_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyB_cth_0" -p "R_pinkyB_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyB_ctl_0" -p "R_pinkyB_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_pinkyB_ctl_0Shape" -p "R_pinkyB_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_pinkyB_ctg_0_pointConstraint1" -p "R_pinkyB_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "PinkyA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "PinkyD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.5 3 -0.49314815713265153 ;
	setAttr -k on ".w0" 0.66;
	setAttr -k on ".w1" 0.34;
createNode aimConstraint -n "R_pinkyB_ctg_0_aimConstraint1" -p "R_pinkyB_ctg_0";
	addAttr -ci true -sn "w0" -ln "PinkyA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -39.034022205165613 -2.0882012740309598e-015 -5.8913390880723144e-015 ;
	setAttr -k on ".w0";
createNode transform -n "R_pinkyA_ctg_0" -p "R_pinky_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyA_cth_0" -p "R_pinkyA_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyA_ctl_0" -p "R_pinkyA_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_pinkyA_ctl_0Shape" -p "R_pinkyA_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_pinkyOrient_ctg_0" -p "R_pinkyA_ctl_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_pinkyOrient_ctl_0" -p "R_pinkyOrient_ctg_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_pinkyOrient_ctl_0Shape" -p "R_pinkyOrient_ctl_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 20 0 no 3
		21 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
		21
		1.0105780490574192e-015 0.91011371637590011 0.52417935965447993
		8.0204607068049075e-016 0.6760804284540689 0.80308937132195668
		8.6620975633492933e-016 0.36076823261018814 0.98513495247119598
		8.3412791350771172e-016 0.0022084331754222918 1.0483587193089576
		8.0204607068049075e-016 -0.35635136625934172 0.98513495247119598
		8.8225067774853976e-016 -0.67166356210322387 0.80308937132195635
		9.7849620623019655e-016 -0.90569685002505307 0.52417935965447837
		9.1433252057575896e-016 -1.0302233615379881 0.18204558114923824
		8.5016883492131998e-016 -1.030223361537987 -0.18204558114923647
		9.7849620623019655e-016 -0.90569685002505307 -0.52417935965447837
		8.1808699209410168e-016 -0.67166356210322387 -0.80308937132195557
		8.1808699209410168e-016 -0.35635136625934166 -0.98513495247119409
		9.1433252057575896e-016 0.002208433175423543 -1.0483587193089567
		9.4641436340298061e-016 0.36076823261018831 -0.98513495247119409
		9.6245528481658779e-016 0.67608042845406957 -0.8030893713219549
		8.1808699209410168e-016 0.91011371637590222 -0.52417935965447704
		8.8225067774853976e-016 1.0346402278888376 -0.18204558114923597
		8.5016883492131998e-016 1.0346402278888374 0.18204558114923905
		7.2184146361244085e-016 1.1560472892261255 0.064971320451800055
		8.5016883492131998e-016 1.0346402278888374 0.18204558114923905
		6.5767777795800226e-016 0.9220487441131866 0.047661593583038536
		;
createNode aimConstraint -n "R_pinkyOrient_ctg_0_aimConstraint1" -p "R_pinkyOrient_ctg_0";
	addAttr -ci true -sn "w0" -ln "PinkyD_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 180 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_middle_org_0" -p "R_hand_org_0";
	setAttr ".t" -type "double3" -2.0000000000000071 0 0 ;
createNode transform -n "R_middleD_ctg_0" -p "R_middle_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.0000000000000053 0 6.6613381477509392e-016 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleD_cth_0" -p "R_middleD_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleD_ctl_0" -p "R_middleD_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_middleD_ctl_0Shape" -p "R_middleD_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_middleC_ctg_0" -p "R_middle_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleC_cth_0" -p "R_middleC_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleC_ctl_0" -p "R_middleC_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_middleC_ctl_0Shape" -p "R_middleC_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_middleC_ctg_0_pointConstraint1" -p "R_middleC_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "MiddleA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "MiddleD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.5 3 -0.16483597998071051 ;
	setAttr -k on ".w0" 0.34;
	setAttr -k on ".w1" 0.66;
createNode aimConstraint -n "R_middleC_ctg_0_aimConstraint1" -p "R_middleC_ctg_0";
	addAttr -ci true -sn "w0" -ln "MiddleA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -39.034022205165613 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_middleB_ctg_0" -p "R_middle_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleB_cth_0" -p "R_middleB_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleB_ctl_0" -p "R_middleB_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_middleB_ctl_0Shape" -p "R_middleB_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_middleB_ctg_0_pointConstraint1" -p "R_middleB_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "MiddleA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "MiddleD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.5 3 -0.16483597998071051 ;
	setAttr -k on ".w0" 0.66;
	setAttr -k on ".w1" 0.34;
createNode aimConstraint -n "R_middleB_ctg_0_aimConstraint1" -p "R_middleB_ctg_0";
	addAttr -ci true -sn "w0" -ln "MiddleA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -39.034022205165613 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_middleA_ctg_0" -p "R_middle_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleA_cth_0" -p "R_middleA_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleA_ctl_0" -p "R_middleA_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_middleA_ctl_0Shape" -p "R_middleA_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_middleOrient_ctg_0" -p "R_middleA_ctl_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_middleOrient_ctl_0" -p "R_middleOrient_ctg_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_middleOrient_ctl_0Shape" -p "R_middleOrient_ctl_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 20 0 no 3
		21 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
		21
		1.0105780490574192e-015 0.91011371637590011 0.52417935965447993
		8.0204607068049075e-016 0.6760804284540689 0.80308937132195668
		8.6620975633492933e-016 0.36076823261018814 0.98513495247119598
		8.3412791350771172e-016 0.0022084331754222918 1.0483587193089576
		8.0204607068049075e-016 -0.35635136625934172 0.98513495247119598
		8.8225067774853976e-016 -0.67166356210322387 0.80308937132195635
		9.7849620623019655e-016 -0.90569685002505307 0.52417935965447837
		9.1433252057575896e-016 -1.0302233615379881 0.18204558114923824
		8.5016883492131998e-016 -1.030223361537987 -0.18204558114923647
		9.7849620623019655e-016 -0.90569685002505307 -0.52417935965447837
		8.1808699209410168e-016 -0.67166356210322387 -0.80308937132195557
		8.1808699209410168e-016 -0.35635136625934166 -0.98513495247119409
		9.1433252057575896e-016 0.002208433175423543 -1.0483587193089567
		9.4641436340298061e-016 0.36076823261018831 -0.98513495247119409
		9.6245528481658779e-016 0.67608042845406957 -0.8030893713219549
		8.1808699209410168e-016 0.91011371637590222 -0.52417935965447704
		8.8225067774853976e-016 1.0346402278888376 -0.18204558114923597
		8.5016883492131998e-016 1.0346402278888374 0.18204558114923905
		7.2184146361244085e-016 1.1560472892261255 0.064971320451800055
		8.5016883492131998e-016 1.0346402278888374 0.18204558114923905
		6.5767777795800226e-016 0.9220487441131866 0.047661593583038536
		;
createNode aimConstraint -n "R_middleOrient_ctg_0_aimConstraint1" -p "R_middleOrient_ctg_0";
	addAttr -ci true -sn "w0" -ln "MiddleD_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 180 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_index_org_0" -p "R_hand_org_0";
	setAttr ".t" -type "double3" -2.0000000000000071 0 1.0000000000000002 ;
createNode transform -n "R_indexA_ctg_0" -p "R_index_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexA_cth_0" -p "R_indexA_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexA_ctl_0" -p "R_indexA_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_indexA_ctl_0Shape" -p "R_indexA_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_indexOrient_ctg_0" -p "R_indexA_ctl_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexOrient_ctl_0" -p "R_indexOrient_ctg_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_indexOrient_ctl_0Shape" -p "R_indexOrient_ctl_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 20 0 no 3
		21 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
		21
		1.026618970471028e-015 0.91011371637590011 0.52417935965447993
		7.6996422785327027e-016 0.6760804284540689 0.80308937132195668
		7.6996422785327027e-016 0.36076823261018814 0.98513495247119598
		7.6996422785327027e-016 0.0022084331754222918 1.0483587193089576
		7.6996422785327027e-016 -0.35635136625934172 0.98513495247119598
		7.6996422785327027e-016 -0.67166356210322387 0.80308937132195635
		1.026618970471028e-015 -0.90569685002505307 0.52417935965447837
		1.026618970471028e-015 -1.0302233615379881 0.18204558114923824
		7.6996422785327027e-016 -1.030223361537987 -0.18204558114923647
		1.026618970471028e-015 -0.90569685002505307 -0.52417935965447837
		7.6996422785327027e-016 -0.67166356210322387 -0.80308937132195557
		7.6996422785327027e-016 -0.35635136625934166 -0.98513495247119409
		1.026618970471028e-015 0.002208433175423543 -1.0483587193089567
		1.026618970471028e-015 0.36076823261018831 -0.98513495247119409
		1.026618970471028e-015 0.67608042845406957 -0.8030893713219549
		7.6996422785327027e-016 0.91011371637590222 -0.52417935965447704
		7.6996422785327027e-016 1.0346402278888376 -0.18204558114923597
		7.6996422785327027e-016 1.0346402278888374 0.18204558114923905
		7.6996422785327027e-016 1.1560472892261255 0.064971320451800055
		7.6996422785327027e-016 1.0346402278888374 0.18204558114923905
		7.6996422785327027e-016 0.9220487441131866 0.047661593583038536
		;
createNode aimConstraint -n "R_indexOrient_ctg_0_aimConstraint1" -p "R_indexOrient_ctg_0";
	addAttr -ci true -sn "w0" -ln "IndexD_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 180 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_indexB_ctg_0" -p "R_index_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexB_cth_0" -p "R_indexB_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexB_ctl_0" -p "R_indexB_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_indexB_ctl_0Shape" -p "R_indexB_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_indexB_ctg_0_pointConstraint1" -p "R_indexB_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "IndexD_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "IndexA_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.5 3 0.12053725631107516 ;
	setAttr -k on ".w0" 0.34;
	setAttr -k on ".w1" 0.66;
createNode aimConstraint -n "R_indexB_ctg_0_aimConstraint1" -p "R_indexB_ctg_0";
	addAttr -ci true -sn "w0" -ln "IndexA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -39.034022205165613 2.0882012740309598e-015 5.8913390880723144e-015 ;
	setAttr -k on ".w0";
createNode transform -n "R_indexC_ctg_0" -p "R_index_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexC_cth_0" -p "R_indexC_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexC_ctl_0" -p "R_indexC_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_indexC_ctl_0Shape" -p "R_indexC_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_indexC_ctg_0_pointConstraint1" -p "R_indexC_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "IndexA_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "IndexD_ctl_XW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -3.5 3 0.12053725631107516 ;
	setAttr -k on ".w0" 0.34;
	setAttr -k on ".w1" 0.66;
createNode aimConstraint -n "R_indexC_ctg_0_aimConstraint1" -p "R_indexC_ctg_0";
	addAttr -ci true -sn "w0" -ln "IndexA_ctl_XW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -39.034022205165613 1.0757400502583725e-015 3.0349322574917972e-015 ;
	setAttr -k on ".w0";
createNode transform -n "R_indexD_ctg_0" -p "R_index_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.0000000000000053 0 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexD_cth_0" -p "R_indexD_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_indexD_ctl_0" -p "R_indexD_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_indexD_ctl_0Shape" -p "R_indexD_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_Hand_org_0_pointConstraint1" -p "R_hand_org_0";
	addAttr -ci true -k true -sn "w0" -ln "Wrist_ctl_XW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_cup_ctg_0" -p "R_hand_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1 0 -1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_cup_cth_0" -p "R_cup_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_cup_ctl_0" -p "R_cup_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_cup_ctl_0Shape" -p "R_cup_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_wrist_ctg_0" -p "R_arm_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -7 0 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_wrist_cth_0" -p "R_wrist_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_wrist_ctl_0" -p "R_wrist_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_wrist_ctl_0Shape" -p "R_wrist_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 2 2 2 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode annotationShape -n "R_wrist_ctl_0AnnShape" -p "R_wrist_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" " wrist";
	setAttr -l on -k off ".daro" no;
createNode transform -n "R_elbow_ctg_0" -p "R_arm_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_elbow_cth_0" -p "R_elbow_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_elbow_ctl_0" -p "R_elbow_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_elbow_ctl_0Shape" -p "R_elbow_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 2 2 2 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode annotationShape -n "R_elbow_ctl_0AnnShape" -p "R_elbow_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "elbow";
	setAttr -l on -k off ".daro" no;
createNode pointConstraint -n "R_elbow_ctg_0_pointConstraint1" -p "R_elbow_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "R_shoulder_ctl_0W0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "R_wrist_ctl_0W1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" -5 0 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode aimConstraint -n "R_elbow_ctg_0_aimConstraint1" -p "R_elbow_ctg_0";
	addAttr -ci true -sn "w0" -ln "R_shoulder_ctl_0W0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "armUp_org" -p "R_elbow_ctg_0";
createNode aimConstraint -n "null1_aimConstraint1" -p "armUp_org";
	addAttr -ci true -sn "w0" -ln "R_shoulder_ctl_0W0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".u" -type "double3" 0 0 -1 ;
	setAttr ".wut" 1;
	setAttr -k on ".w0";
createNode transform -n "armUp_off" -p "armUp_org";
	setAttr ".t" -type "double3" 0 0 -4 ;
createNode transform -n "armUp" -p "armUp_off";
	setAttr ".t" -type "double3" 4.4408920985006262e-016 8.8817841970012523e-016 0 ;
	setAttr ".r" -type "double3" 0 1.5902773407317584e-015 -5.963540027744093e-016 ;
	setAttr ".s" -type "double3" 1 1.0000000000000002 1 ;
createNode locator -n "armUpShape" -p "armUp";
	setAttr -k off ".v";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".los" -type "double3" 0.1 0.1 0.1 ;
createNode transform -n "R_shoulder_ctg_0" -p "R_arm_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -3 0 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_shoulder_cth_0" -p "R_shoulder_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_shoulder_ctl_0" -p "R_shoulder_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_shoulder_ctl_0Shape" -p "R_shoulder_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 2 2 2 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode annotationShape -n "R_shoulder_ctl_0AnnShape" -p "R_shoulder_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "shoulder";
	setAttr -l on -k off ".daro" no;
createNode transform -n "R_clavicle_ctg_0" -p "R_arm_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_clavicle_cth_0" -p "R_clavicle_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_clavicle_ctl_0" -p "R_clavicle_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_clavicle_ctl_0Shape" -p "R_clavicle_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 2 2 2 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode annotationShape -n "R_clavicle_ctl_0AnnShape" -p "R_clavicle_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "clavicle";
	setAttr -l on -k off ".daro" no;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode mentalrayItemsList -s -n "mentalrayItemsList";
createNode objectSet -n "loc_set";
	setAttr ".ihi" 0;
	setAttr -s 21 ".dsm";
createNode hyperGraphInfo -n "nodeEditorPanel2Info";
createNode hyperView -n "hyperView1";
	setAttr ".vl" -type "double2" -505.76279391719567 -326.06909380058704 ;
	setAttr ".vh" -type "double2" 548.49642182825312 372.80513948624093 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	setAttr ".ihi" 0;
	setAttr -s 12 ".hyp";
	setAttr ".hyp[0].x" 191.54762268066406;
	setAttr ".hyp[0].y" -195.95237731933594;
	setAttr ".hyp[0].nvs" 1920;
	setAttr ".hyp[1].x" -174.16667175292969;
	setAttr ".hyp[1].y" 276.19049072265625;
	setAttr ".hyp[1].nvs" 1696;
	setAttr ".hyp[2].x" 2.9761905670166016;
	setAttr ".hyp[2].y" -2.3809523582458496;
	setAttr ".hyp[2].nvs" 1856;
	setAttr ".hyp[3].x" 2.9761905670166016;
	setAttr ".hyp[3].y" -98.095237731933594;
	setAttr ".hyp[3].nvs" 1696;
	setAttr ".hyp[4].x" -174.16667175292969;
	setAttr ".hyp[4].y" 371.90475463867187;
	setAttr ".hyp[4].nvs" 1664;
	setAttr ".hyp[5].x" -174.16667175292969;
	setAttr ".hyp[5].y" 183.33332824707031;
	setAttr ".hyp[5].nvs" 1696;
	setAttr ".hyp[6].x" -174.16667175292969;
	setAttr ".hyp[6].y" 90.476188659667969;
	setAttr ".hyp[6].nvs" 1808;
	setAttr ".hyp[7].x" -174.16667175292969;
	setAttr ".hyp[7].y" -195.95237731933594;
	setAttr ".hyp[7].nvs" 1696;
	setAttr ".hyp[8].x" 2.9761905670166016;
	setAttr ".hyp[8].y" -193.80952453613281;
	setAttr ".hyp[8].nvs" 1728;
	setAttr ".hyp[9].nvs" 2528;
	setAttr ".hyp[10].nvs" 1952;
	setAttr ".hyp[11].nvs" 2528;
	setAttr ".anf" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n"
		+ "                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n"
		+ "                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n"
		+ "            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n"
		+ "                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n"
		+ "            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n"
		+ "                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n"
		+ "                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t\tif (`objExists nodeEditorPanel1Info`) nodeEditor -e -restoreInfo nodeEditorPanel1Info $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n"
		+ "                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t\tif (`objExists nodeEditorPanel1Info`) nodeEditor -e -restoreInfo nodeEditorPanel1Info $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\n"
		+ "string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n"
		+ "                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n"
		+ "                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 23 100 -ps 2 77 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode hyperGraphInfo -n "nodeEditorPanel1Info";
createNode hyperView -n "hyperView2";
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout2";
	setAttr ".ihi" 0;
	setAttr -s 18 ".hyp";
	setAttr ".hyp[0].nvs" 3600;
	setAttr ".hyp[1].nvs" 3488;
	setAttr ".hyp[2].nvs" 1696;
	setAttr ".hyp[3].nvs" 1968;
	setAttr ".hyp[4].nvs" 1696;
	setAttr ".hyp[5].nvs" 1968;
	setAttr ".hyp[6].nvs" 1696;
	setAttr ".hyp[7].nvs" 1968;
	setAttr ".hyp[8].nvs" 1696;
	setAttr ".hyp[9].nvs" 1968;
	setAttr ".hyp[10].nvs" 2368;
	setAttr ".hyp[11].nvs" 1792;
	setAttr ".hyp[12].nvs" 1808;
	setAttr ".hyp[13].nvs" 2080;
	setAttr ".hyp[14].nvs" 1696;
	setAttr ".hyp[15].nvs" 2368;
	setAttr ".hyp[16].nvs" 2368;
	setAttr ".hyp[17].nvs" 2368;
	setAttr ".anf" yes;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";

select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";

select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -av -cb on ".micw";
	setAttr -cb on ".mirw";

select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".s";

select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";

select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";

select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;

select -ne :defaultObjectSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k off ".ctrs" 256;
	setAttr -av -k off ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";

select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 1 0 1 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".rp";
	setAttr -k on ".cai";
	setAttr -k on ".coi";
	setAttr -cb on ".bc";
	setAttr -av -k on ".bcb";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcr";
	setAttr -k on ".ei";
	setAttr -k on ".ex";
	setAttr -av -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bf";
	setAttr -k on ".fii";
	setAttr -av -k on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr -k on ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr -k on ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -k on ".fir";
	setAttr -k on ".aap";
	setAttr -k on ".gh";
	setAttr -cb on ".sd";

select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "R_middleA_ctl_0Shape.wp" "R_middle_crv_0Shape.cp[0]";
connectAttr "R_middleB_ctl_0Shape.wp" "R_middle_crv_0Shape.cp[1]";
connectAttr "R_middleC_ctl_0Shape.wp" "R_middle_crv_0Shape.cp[2]";
connectAttr "R_middleD_ctl_0Shape.wp" "R_middle_crv_0Shape.cp[3]";
connectAttr "R_pinkyA_ctl_0Shape.wp" "R_pinky_crv_0Shape.cp[0]";
connectAttr "R_pinkyB_ctl_0Shape.wp" "R_pinky_crv_0Shape.cp[1]";
connectAttr "R_pinkyC_ctl_0Shape.wp" "R_pinky_crv_0Shape.cp[2]";
connectAttr "R_pinkyD_ctl_0Shape.wp" "R_pinky_crv_0Shape.cp[3]";
connectAttr "R_thumbA_ctl_0Shape.wp" "R_thumb_crv_0Shape.cp[0]";
connectAttr "R_thumbB_ctl_0Shape.wp" "R_thumb_crv_0Shape.cp[1]";
connectAttr "R_thumbC_ctl_0Shape.wp" "R_thumb_crv_0Shape.cp[2]";
connectAttr "R_thumbD_ctl_0Shape.wp" "R_thumb_crv_0Shape.cp[3]";
connectAttr "R_indexA_ctl_0Shape.wp" "R_index_crv_0Shape.cp[0]";
connectAttr "R_indexB_ctl_0Shape.wp" "R_index_crv_0Shape.cp[1]";
connectAttr "R_indexC_ctl_0Shape.wp" "R_index_crv_0Shape.cp[2]";
connectAttr "R_indexD_ctl_0Shape.wp" "R_index_crv_0Shape.cp[3]";
connectAttr "R_shoulder_ctl_0Shape.wp" "R_arm_crv_0Shape.cp[0]";
connectAttr "R_elbow_ctl_0Shape.wp" "R_arm_crv_0Shape.cp[1]";
connectAttr "R_wrist_ctl_0Shape.wp" "R_arm_crv_0Shape.cp[2]";
connectAttr "R_clavicle_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxClavicle_loc_X.tx"
		;
connectAttr "R_clavicle_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxClavicle_loc_X.ty"
		;
connectAttr "R_clavicle_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxClavicle_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxClavicle_loc_X.pim" "R_clavicle_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxClavicle_loc_X.rp" "R_clavicle_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxClavicle_loc_X.rpt" "R_clavicle_loc_X_pointConstraint1.crt"
		;
connectAttr "R_clavicle_ctl_0.t" "R_clavicle_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_clavicle_ctl_0.rp" "R_clavicle_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_clavicle_ctl_0.rpt" "R_clavicle_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_clavicle_ctl_0.pm" "R_clavicle_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_clavicle_loc_X_pointConstraint1.w0" "R_clavicle_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_shoulder_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxShoulder_loc_X.tx"
		;
connectAttr "R_shoulder_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxShoulder_loc_X.ty"
		;
connectAttr "R_shoulder_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxShoulder_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.pim" "R_shoulder_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.rp" "R_shoulder_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.rpt" "R_shoulder_loc_X_pointConstraint1.crt"
		;
connectAttr "R_shoulder_ctl_0.t" "R_shoulder_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_shoulder_ctl_0.rp" "R_shoulder_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_shoulder_ctl_0.rpt" "R_shoulder_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_shoulder_ctl_0.pm" "R_shoulder_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_shoulder_loc_X_pointConstraint1.w0" "R_shoulder_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_elbow_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxElbow_loc_X.tx"
		;
connectAttr "R_elbow_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxElbow_loc_X.ty"
		;
connectAttr "R_elbow_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxElbow_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X.pim" "R_elbow_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X.rp" "R_elbow_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X.rpt" "R_elbow_loc_X_pointConstraint1.crt"
		;
connectAttr "R_elbow_ctl_0.t" "R_elbow_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_elbow_ctl_0.rp" "R_elbow_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_elbow_ctl_0.rpt" "R_elbow_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_elbow_ctl_0.pm" "R_elbow_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_elbow_loc_X_pointConstraint1.w0" "R_elbow_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_wrist_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxWrist_loc_X.tx"
		;
connectAttr "R_wrist_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxWrist_loc_X.ty"
		;
connectAttr "R_wrist_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxWrist_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxWrist_loc_X.pim" "R_wrist_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxWrist_loc_X.rp" "R_wrist_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxWrist_loc_X.rpt" "R_wrist_loc_X_pointConstraint1.crt"
		;
connectAttr "R_wrist_ctl_0.t" "R_wrist_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_wrist_ctl_0.rp" "R_wrist_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_wrist_ctl_0.rpt" "R_wrist_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_wrist_ctl_0.pm" "R_wrist_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_wrist_loc_X_pointConstraint1.w0" "R_wrist_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_cup_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxCup_loc_X.tx";
connectAttr "R_cup_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxCup_loc_X.ty";
connectAttr "R_cup_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxCup_loc_X.tz";
connectAttr "R_xxNAMESPACExxCup_loc_X.pim" "R_cup_loc_X_pointConstraint1.cpim";
connectAttr "R_xxNAMESPACExxCup_loc_X.rp" "R_cup_loc_X_pointConstraint1.crp";
connectAttr "R_xxNAMESPACExxCup_loc_X.rpt" "R_cup_loc_X_pointConstraint1.crt";
connectAttr "R_cup_ctl_0.t" "R_cup_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_cup_ctl_0.rp" "R_cup_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_cup_ctl_0.rpt" "R_cup_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_cup_ctl_0.pm" "R_cup_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_cup_loc_X_pointConstraint1.w0" "R_cup_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyA_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxPinkyA_loc_X.tx"
		;
connectAttr "R_pinkyA_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxPinkyA_loc_X.ty"
		;
connectAttr "R_pinkyA_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxPinkyA_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxPinkyA_loc_X.pim" "R_pinkyA_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxPinkyA_loc_X.rp" "R_pinkyA_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxPinkyA_loc_X.rpt" "R_pinkyA_loc_X_pointConstraint1.crt"
		;
connectAttr "R_pinkyA_ctl_0.t" "R_pinkyA_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_pinkyA_ctl_0.rp" "R_pinkyA_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_pinkyA_ctl_0.rpt" "R_pinkyA_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_pinkyA_ctl_0.pm" "R_pinkyA_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_pinkyA_loc_X_pointConstraint1.w0" "R_pinkyA_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyB_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxPinkyB_loc_X.tz"
		;
connectAttr "R_pinkyB_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxPinkyB_loc_X.tx"
		;
connectAttr "R_pinkyB_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxPinkyB_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxPinkyB_loc_X.pim" "R_pinkyB_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxPinkyB_loc_X.rp" "R_pinkyB_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxPinkyB_loc_X.rpt" "R_pinkyB_loc_X_pointConstraint1.crt"
		;
connectAttr "R_pinkyB_ctl_0.t" "R_pinkyB_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_pinkyB_ctl_0.rp" "R_pinkyB_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_pinkyB_ctl_0.rpt" "R_pinkyB_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_pinkyB_ctl_0.pm" "R_pinkyB_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_pinkyB_loc_X_pointConstraint1.w0" "R_pinkyB_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyC_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxPinkyC_loc_X.tz"
		;
connectAttr "R_pinkyC_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxPinkyC_loc_X.tx"
		;
connectAttr "R_pinkyC_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxPinkyC_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxPinkyC_loc_X.pim" "R_pinkyC_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxPinkyC_loc_X.rp" "R_pinkyC_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxPinkyC_loc_X.rpt" "R_pinkyC_loc_X_pointConstraint1.crt"
		;
connectAttr "R_pinkyC_ctl_0.t" "R_pinkyC_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_pinkyC_ctl_0.rp" "R_pinkyC_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_pinkyC_ctl_0.rpt" "R_pinkyC_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_pinkyC_ctl_0.pm" "R_pinkyC_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_pinkyC_loc_X_pointConstraint1.w0" "R_pinkyC_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyD_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxPinkyD_loc_X.tx"
		;
connectAttr "R_pinkyD_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxPinkyD_loc_X.ty"
		;
connectAttr "R_pinkyD_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxPinkyD_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxPinkyD_loc_X.pim" "R_pinkyD_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxPinkyD_loc_X.rp" "R_pinkyD_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxPinkyD_loc_X.rpt" "R_pinkyD_loc_X_pointConstraint1.crt"
		;
connectAttr "R_pinkyD_ctl_0.t" "R_pinkyD_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_pinkyD_ctl_0.rp" "R_pinkyD_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_pinkyD_ctl_0.rpt" "R_pinkyD_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_pinkyD_ctl_0.pm" "R_pinkyD_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_pinkyD_loc_X_pointConstraint1.w0" "R_pinkyD_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middleA_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxMiddleA_loc_X.tx"
		;
connectAttr "R_middleA_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxMiddleA_loc_X.ty"
		;
connectAttr "R_middleA_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxMiddleA_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxMiddleA_loc_X.pim" "R_middleA_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxMiddleA_loc_X.rp" "R_middleA_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxMiddleA_loc_X.rpt" "R_middleA_loc_X_pointConstraint1.crt"
		;
connectAttr "R_middleA_ctl_0.t" "R_middleA_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_middleA_ctl_0.rp" "R_middleA_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_middleA_ctl_0.rpt" "R_middleA_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_middleA_ctl_0.pm" "R_middleA_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_middleA_loc_X_pointConstraint1.w0" "R_middleA_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middleB_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxMiddleB_loc_X.tz"
		;
connectAttr "R_middleB_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxMiddleB_loc_X.tx"
		;
connectAttr "R_middleB_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxMiddleB_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxMiddleB_loc_X.pim" "R_middleB_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxMiddleB_loc_X.rp" "R_middleB_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxMiddleB_loc_X.rpt" "R_middleB_loc_X_pointConstraint1.crt"
		;
connectAttr "R_middleB_ctl_0.t" "R_middleB_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_middleB_ctl_0.rp" "R_middleB_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_middleB_ctl_0.rpt" "R_middleB_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_middleB_ctl_0.pm" "R_middleB_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_middleB_loc_X_pointConstraint1.w0" "R_middleB_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middleC_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxMiddleC_loc_X.tz"
		;
connectAttr "R_middleC_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxMiddleC_loc_X.tx"
		;
connectAttr "R_middleC_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxMiddleC_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxMiddleC_loc_X.pim" "R_middleC_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxMiddleC_loc_X.rp" "R_middleC_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxMiddleC_loc_X.rpt" "R_middleC_loc_X_pointConstraint1.crt"
		;
connectAttr "R_middleC_ctl_0.t" "R_middleC_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_middleC_ctl_0.rp" "R_middleC_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_middleC_ctl_0.rpt" "R_middleC_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_middleC_ctl_0.pm" "R_middleC_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_middleC_loc_X_pointConstraint1.w0" "R_middleC_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middleD_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxMiddleD_loc_X.tx"
		;
connectAttr "R_middleD_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxMiddleD_loc_X.ty"
		;
connectAttr "R_middleD_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxMiddleD_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxMiddleD_loc_X.pim" "R_middleD_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxMiddleD_loc_X.rp" "R_middleD_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxMiddleD_loc_X.rpt" "R_middleD_loc_X_pointConstraint1.crt"
		;
connectAttr "R_middleD_ctl_0.t" "R_middleD_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_middleD_ctl_0.rp" "R_middleD_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_middleD_ctl_0.rpt" "R_middleD_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_middleD_ctl_0.pm" "R_middleD_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_middleD_loc_X_pointConstraint1.w0" "R_middleD_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_indexA_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxIndexA_loc_X.tx"
		;
connectAttr "R_indexA_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxIndexA_loc_X.ty"
		;
connectAttr "R_indexA_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxIndexA_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxIndexA_loc_X.pim" "R_indexA_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxIndexA_loc_X.rp" "R_indexA_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxIndexA_loc_X.rpt" "R_indexA_loc_X_pointConstraint1.crt"
		;
connectAttr "R_indexA_ctl_0.t" "R_indexA_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_indexA_ctl_0.rp" "R_indexA_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_indexA_ctl_0.rpt" "R_indexA_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_indexA_ctl_0.pm" "R_indexA_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_indexA_loc_X_pointConstraint1.w0" "R_indexA_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_indexB_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxIndexB_loc_X.tz"
		;
connectAttr "R_indexB_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxIndexB_loc_X.tx"
		;
connectAttr "R_indexB_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxIndexB_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxIndexB_loc_X.pim" "R_indexB_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxIndexB_loc_X.rp" "R_indexB_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxIndexB_loc_X.rpt" "R_indexB_loc_X_pointConstraint1.crt"
		;
connectAttr "R_indexB_ctl_0.t" "R_indexB_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_indexB_ctl_0.rp" "R_indexB_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_indexB_ctl_0.rpt" "R_indexB_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_indexB_ctl_0.pm" "R_indexB_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_indexB_loc_X_pointConstraint1.w0" "R_indexB_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_indexC_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxIndexC_loc_X.tz"
		;
connectAttr "R_indexC_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxIndexC_loc_X.tx"
		;
connectAttr "R_indexC_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxIndexC_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxIndexC_loc_X.pim" "R_indexC_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxIndexC_loc_X.rp" "R_indexC_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxIndexC_loc_X.rpt" "R_indexC_loc_X_pointConstraint1.crt"
		;
connectAttr "R_indexC_ctl_0.t" "R_indexC_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_indexC_ctl_0.rp" "R_indexC_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_indexC_ctl_0.rpt" "R_indexC_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_indexC_ctl_0.pm" "R_indexC_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_indexC_loc_X_pointConstraint1.w0" "R_indexC_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_indexD_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxIndexD_loc_X.tx"
		;
connectAttr "R_indexD_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxIndexD_loc_X.ty"
		;
connectAttr "R_indexD_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxIndexD_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxIndexD_loc_X.pim" "R_indexD_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxIndexD_loc_X.rp" "R_indexD_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxIndexD_loc_X.rpt" "R_indexD_loc_X_pointConstraint1.crt"
		;
connectAttr "R_indexD_ctl_0.t" "R_indexD_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_indexD_ctl_0.rp" "R_indexD_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_indexD_ctl_0.rpt" "R_indexD_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_indexD_ctl_0.pm" "R_indexD_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_indexD_loc_X_pointConstraint1.w0" "R_indexD_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumbA_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxThumbA_loc_X.tx"
		;
connectAttr "R_thumbA_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxThumbA_loc_X.ty"
		;
connectAttr "R_thumbA_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxThumbA_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxThumbA_loc_X.pim" "R_thumbA_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxThumbA_loc_X.rp" "R_thumbA_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxThumbA_loc_X.rpt" "R_thumbA_loc_X_pointConstraint1.crt"
		;
connectAttr "R_thumbA_ctl_0.t" "R_thumbA_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_thumbA_ctl_0.rp" "R_thumbA_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_thumbA_ctl_0.rpt" "R_thumbA_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_thumbA_ctl_0.pm" "R_thumbA_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_thumbA_loc_X_pointConstraint1.w0" "R_thumbA_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumbB_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxThumbB_loc_X.tz"
		;
connectAttr "R_thumbB_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxThumbB_loc_X.tx"
		;
connectAttr "R_thumbB_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxThumbB_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxThumbB_loc_X.pim" "R_thumbB_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxThumbB_loc_X.rp" "R_thumbB_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxThumbB_loc_X.rpt" "R_thumbB_loc_X_pointConstraint1.crt"
		;
connectAttr "R_thumbB_ctl_0.t" "R_thumbB_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_thumbB_ctl_0.rp" "R_thumbB_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_thumbB_ctl_0.rpt" "R_thumbB_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_thumbB_ctl_0.pm" "R_thumbB_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_thumbB_loc_X_pointConstraint1.w0" "R_thumbB_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumbC_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxThumbC_loc_X.tz"
		;
connectAttr "R_thumbC_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxThumbC_loc_X.tx"
		;
connectAttr "R_thumbC_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxThumbC_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxThumbC_loc_X.pim" "R_thumbC_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxThumbC_loc_X.rp" "R_thumbC_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxThumbC_loc_X.rpt" "R_thumbC_loc_X_pointConstraint1.crt"
		;
connectAttr "R_thumbC_ctl_0.t" "R_thumbC_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_thumbC_ctl_0.rp" "R_thumbC_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_thumbC_ctl_0.rpt" "R_thumbC_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_thumbC_ctl_0.pm" "R_thumbC_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_thumbC_loc_X_pointConstraint1.w0" "R_thumbC_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumbD_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxThumbD_loc_X.tx"
		;
connectAttr "R_thumbD_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxThumbD_loc_X.ty"
		;
connectAttr "R_thumbD_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxThumbD_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxThumbD_loc_X.pim" "R_thumbD_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxThumbD_loc_X.rp" "R_thumbD_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxThumbD_loc_X.rpt" "R_thumbD_loc_X_pointConstraint1.crt"
		;
connectAttr "R_thumbD_ctl_0.t" "R_thumbD_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_thumbD_ctl_0.rp" "R_thumbD_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_thumbD_ctl_0.rpt" "R_thumbD_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_thumbD_ctl_0.pm" "R_thumbD_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_thumbD_loc_X_pointConstraint1.w0" "R_thumbD_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_shoulder_ctl_0Shape.wp" "R_clavicle_crv_Shape0.cp[0]";
connectAttr "R_clavicle_ctl_0Shape.wp" "R_clavicle_crv_Shape0.cp[1]";
connectAttr "R_wrist_ctl_0Shape.wp" "curveShape2.cp[0]";
connectAttr "R_indexA_ctl_0Shape.wp" "curveShape2.cp[1]";
connectAttr "R_indexB_ctl_0Shape.wp" "curveShape2.cp[2]";
connectAttr "R_indexC_ctl_0Shape.wp" "curveShape2.cp[3]";
connectAttr "R_indexD_ctl_0Shape.wp" "curveShape2.cp[4]";
connectAttr "R_wrist_ctl_0Shape.wp" "curveShape1.cp[0]";
connectAttr "R_thumbA_ctl_0Shape.wp" "curveShape1.cp[1]";
connectAttr "R_thumbB_ctl_0Shape.wp" "curveShape1.cp[2]";
connectAttr "R_thumbC_ctl_0Shape.wp" "curveShape1.cp[3]";
connectAttr "R_thumbD_ctl_0Shape.wp" "curveShape1.cp[4]";
connectAttr "R_wrist_ctl_0Shape.wp" "curveShape3.cp[0]";
connectAttr "R_middleA_ctl_0Shape.wp" "curveShape3.cp[1]";
connectAttr "R_middleB_ctl_0Shape.wp" "curveShape3.cp[2]";
connectAttr "R_middleC_ctl_0Shape.wp" "curveShape3.cp[3]";
connectAttr "R_middleD_ctl_0Shape.wp" "curveShape3.cp[4]";
connectAttr "R_wrist_ctl_0Shape.wp" "curveShape4.cp[0]";
connectAttr "R_cup_ctl_0Shape.wp" "curveShape4.cp[1]";
connectAttr "R_pinkyA_ctl_0Shape.wp" "curveShape4.cp[2]";
connectAttr "R_pinkyB_ctl_0Shape.wp" "curveShape4.cp[3]";
connectAttr "R_pinkyC_ctl_0Shape.wp" "curveShape4.cp[4]";
connectAttr "R_pinkyD_ctl_0Shape.wp" "curveShape4.cp[5]";
connectAttr "R_Hand_org_0_pointConstraint1.ctx" "R_hand_org_0.tx";
connectAttr "R_Hand_org_0_pointConstraint1.cty" "R_hand_org_0.ty";
connectAttr "R_Hand_org_0_pointConstraint1.ctz" "R_hand_org_0.tz";
connectAttr "R_thumbC_ctg_0_pointConstraint1.ctx" "R_thumbC_ctg_0.tx";
connectAttr "R_thumbC_ctg_0_pointConstraint1.cty" "R_thumbC_ctg_0.ty";
connectAttr "R_thumbC_ctg_0_pointConstraint1.ctz" "R_thumbC_ctg_0.tz";
connectAttr "R_thumbC_ctg_0_aimConstraint1.crx" "R_thumbC_ctg_0.rx";
connectAttr "R_thumbC_ctg_0_aimConstraint1.cry" "R_thumbC_ctg_0.ry";
connectAttr "R_thumbC_ctg_0_aimConstraint1.crz" "R_thumbC_ctg_0.rz";
connectAttr "R_thumbC_ctg_0.pim" "R_thumbC_ctg_0_pointConstraint1.cpim";
connectAttr "R_thumbC_ctg_0.rp" "R_thumbC_ctg_0_pointConstraint1.crp";
connectAttr "R_thumbC_ctg_0.rpt" "R_thumbC_ctg_0_pointConstraint1.crt";
connectAttr "R_thumbA_ctl_0.t" "R_thumbC_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_thumbA_ctl_0.rp" "R_thumbC_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_thumbA_ctl_0.rpt" "R_thumbC_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_thumbA_ctl_0.pm" "R_thumbC_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_thumbC_ctg_0_pointConstraint1.w0" "R_thumbC_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumbD_ctl_0.t" "R_thumbC_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_thumbD_ctl_0.rp" "R_thumbC_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_thumbD_ctl_0.rpt" "R_thumbC_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_thumbD_ctl_0.pm" "R_thumbC_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_thumbC_ctg_0_pointConstraint1.w1" "R_thumbC_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_thumbC_ctg_0.pim" "R_thumbC_ctg_0_aimConstraint1.cpim";
connectAttr "R_thumbC_ctg_0.t" "R_thumbC_ctg_0_aimConstraint1.ct";
connectAttr "R_thumbC_ctg_0.rp" "R_thumbC_ctg_0_aimConstraint1.crp";
connectAttr "R_thumbC_ctg_0.rpt" "R_thumbC_ctg_0_aimConstraint1.crt";
connectAttr "R_thumbC_ctg_0.ro" "R_thumbC_ctg_0_aimConstraint1.cro";
connectAttr "R_thumbA_ctl_0.t" "R_thumbC_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_thumbA_ctl_0.rp" "R_thumbC_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_thumbA_ctl_0.rpt" "R_thumbC_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_thumbA_ctl_0.pm" "R_thumbC_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_thumbC_ctg_0_aimConstraint1.w0" "R_thumbC_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_thumbOrient_ctl_0.wm" "R_thumbC_ctg_0_aimConstraint1.wum";
connectAttr "R_thumbB_ctg_0_pointConstraint1.ctx" "R_thumbB_ctg_0.tx";
connectAttr "R_thumbB_ctg_0_pointConstraint1.cty" "R_thumbB_ctg_0.ty";
connectAttr "R_thumbB_ctg_0_pointConstraint1.ctz" "R_thumbB_ctg_0.tz";
connectAttr "R_thumbB_ctg_0_aimConstraint1.crx" "R_thumbB_ctg_0.rx";
connectAttr "R_thumbB_ctg_0_aimConstraint1.cry" "R_thumbB_ctg_0.ry";
connectAttr "R_thumbB_ctg_0_aimConstraint1.crz" "R_thumbB_ctg_0.rz";
connectAttr "R_thumbB_ctg_0.pim" "R_thumbB_ctg_0_pointConstraint1.cpim";
connectAttr "R_thumbB_ctg_0.rp" "R_thumbB_ctg_0_pointConstraint1.crp";
connectAttr "R_thumbB_ctg_0.rpt" "R_thumbB_ctg_0_pointConstraint1.crt";
connectAttr "R_thumbA_ctl_0.t" "R_thumbB_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_thumbA_ctl_0.rp" "R_thumbB_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_thumbA_ctl_0.rpt" "R_thumbB_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_thumbA_ctl_0.pm" "R_thumbB_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_thumbB_ctg_0_pointConstraint1.w0" "R_thumbB_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumbD_ctl_0.t" "R_thumbB_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_thumbD_ctl_0.rp" "R_thumbB_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_thumbD_ctl_0.rpt" "R_thumbB_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_thumbD_ctl_0.pm" "R_thumbB_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_thumbB_ctg_0_pointConstraint1.w1" "R_thumbB_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_thumbB_ctg_0.pim" "R_thumbB_ctg_0_aimConstraint1.cpim";
connectAttr "R_thumbB_ctg_0.t" "R_thumbB_ctg_0_aimConstraint1.ct";
connectAttr "R_thumbB_ctg_0.rp" "R_thumbB_ctg_0_aimConstraint1.crp";
connectAttr "R_thumbB_ctg_0.rpt" "R_thumbB_ctg_0_aimConstraint1.crt";
connectAttr "R_thumbB_ctg_0.ro" "R_thumbB_ctg_0_aimConstraint1.cro";
connectAttr "R_thumbA_ctl_0.t" "R_thumbB_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_thumbA_ctl_0.rp" "R_thumbB_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_thumbA_ctl_0.rpt" "R_thumbB_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_thumbA_ctl_0.pm" "R_thumbB_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_thumbB_ctg_0_aimConstraint1.w0" "R_thumbB_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_thumbOrient_ctl_0.wm" "R_thumbB_ctg_0_aimConstraint1.wum";
connectAttr "R_thumbOrient_ctg_0_aimConstraint1.crx" "R_thumbOrient_ctg_0.rx";
connectAttr "R_thumbOrient_ctg_0_aimConstraint1.cry" "R_thumbOrient_ctg_0.ry";
connectAttr "R_thumbOrient_ctg_0_aimConstraint1.crz" "R_thumbOrient_ctg_0.rz";
connectAttr "R_thumbOrient_ctg_0.pim" "R_thumbOrient_ctg_0_aimConstraint1.cpim";
connectAttr "R_thumbOrient_ctg_0.t" "R_thumbOrient_ctg_0_aimConstraint1.ct";
connectAttr "R_thumbOrient_ctg_0.rp" "R_thumbOrient_ctg_0_aimConstraint1.crp";
connectAttr "R_thumbOrient_ctg_0.rpt" "R_thumbOrient_ctg_0_aimConstraint1.crt";
connectAttr "R_thumbOrient_ctg_0.ro" "R_thumbOrient_ctg_0_aimConstraint1.cro";
connectAttr "R_thumbD_ctl_0.t" "R_thumbOrient_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_thumbD_ctl_0.rp" "R_thumbOrient_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_thumbD_ctl_0.rpt" "R_thumbOrient_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_thumbD_ctl_0.pm" "R_thumbOrient_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_thumbOrient_ctg_0_aimConstraint1.w0" "R_thumbOrient_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_hand_org_0.wm" "R_thumbOrient_ctg_0_aimConstraint1.wum";
connectAttr "R_pinkyC_ctg_0_pointConstraint1.ctx" "R_pinkyC_ctg_0.tx";
connectAttr "R_pinkyC_ctg_0_pointConstraint1.cty" "R_pinkyC_ctg_0.ty";
connectAttr "R_pinkyC_ctg_0_pointConstraint1.ctz" "R_pinkyC_ctg_0.tz";
connectAttr "R_pinkyC_ctg_0_aimConstraint1.crx" "R_pinkyC_ctg_0.rx";
connectAttr "R_pinkyC_ctg_0_aimConstraint1.cry" "R_pinkyC_ctg_0.ry";
connectAttr "R_pinkyC_ctg_0_aimConstraint1.crz" "R_pinkyC_ctg_0.rz";
connectAttr "R_pinkyC_ctg_0.pim" "R_pinkyC_ctg_0_pointConstraint1.cpim";
connectAttr "R_pinkyC_ctg_0.rp" "R_pinkyC_ctg_0_pointConstraint1.crp";
connectAttr "R_pinkyC_ctg_0.rpt" "R_pinkyC_ctg_0_pointConstraint1.crt";
connectAttr "R_pinkyA_ctl_0.t" "R_pinkyC_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_pinkyA_ctl_0.rp" "R_pinkyC_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_pinkyA_ctl_0.rpt" "R_pinkyC_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_pinkyA_ctl_0.pm" "R_pinkyC_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_pinkyC_ctg_0_pointConstraint1.w0" "R_pinkyC_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyD_ctl_0.t" "R_pinkyC_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_pinkyD_ctl_0.rp" "R_pinkyC_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_pinkyD_ctl_0.rpt" "R_pinkyC_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_pinkyD_ctl_0.pm" "R_pinkyC_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_pinkyC_ctg_0_pointConstraint1.w1" "R_pinkyC_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_pinkyC_ctg_0.pim" "R_pinkyC_ctg_0_aimConstraint1.cpim";
connectAttr "R_pinkyC_ctg_0.t" "R_pinkyC_ctg_0_aimConstraint1.ct";
connectAttr "R_pinkyC_ctg_0.rp" "R_pinkyC_ctg_0_aimConstraint1.crp";
connectAttr "R_pinkyC_ctg_0.rpt" "R_pinkyC_ctg_0_aimConstraint1.crt";
connectAttr "R_pinkyC_ctg_0.ro" "R_pinkyC_ctg_0_aimConstraint1.cro";
connectAttr "R_pinkyA_ctl_0.t" "R_pinkyC_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_pinkyA_ctl_0.rp" "R_pinkyC_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_pinkyA_ctl_0.rpt" "R_pinkyC_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_pinkyA_ctl_0.pm" "R_pinkyC_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_pinkyC_ctg_0_aimConstraint1.w0" "R_pinkyC_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyOrient_ctl_0.wm" "R_pinkyC_ctg_0_aimConstraint1.wum";
connectAttr "R_pinkyB_ctg_0_pointConstraint1.ctx" "R_pinkyB_ctg_0.tx";
connectAttr "R_pinkyB_ctg_0_pointConstraint1.cty" "R_pinkyB_ctg_0.ty";
connectAttr "R_pinkyB_ctg_0_pointConstraint1.ctz" "R_pinkyB_ctg_0.tz";
connectAttr "R_pinkyB_ctg_0_aimConstraint1.crx" "R_pinkyB_ctg_0.rx";
connectAttr "R_pinkyB_ctg_0_aimConstraint1.cry" "R_pinkyB_ctg_0.ry";
connectAttr "R_pinkyB_ctg_0_aimConstraint1.crz" "R_pinkyB_ctg_0.rz";
connectAttr "R_pinkyB_ctg_0.pim" "R_pinkyB_ctg_0_pointConstraint1.cpim";
connectAttr "R_pinkyB_ctg_0.rp" "R_pinkyB_ctg_0_pointConstraint1.crp";
connectAttr "R_pinkyB_ctg_0.rpt" "R_pinkyB_ctg_0_pointConstraint1.crt";
connectAttr "R_pinkyA_ctl_0.t" "R_pinkyB_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_pinkyA_ctl_0.rp" "R_pinkyB_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_pinkyA_ctl_0.rpt" "R_pinkyB_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_pinkyA_ctl_0.pm" "R_pinkyB_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_pinkyB_ctg_0_pointConstraint1.w0" "R_pinkyB_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyD_ctl_0.t" "R_pinkyB_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_pinkyD_ctl_0.rp" "R_pinkyB_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_pinkyD_ctl_0.rpt" "R_pinkyB_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_pinkyD_ctl_0.pm" "R_pinkyB_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_pinkyB_ctg_0_pointConstraint1.w1" "R_pinkyB_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_pinkyB_ctg_0.pim" "R_pinkyB_ctg_0_aimConstraint1.cpim";
connectAttr "R_pinkyB_ctg_0.t" "R_pinkyB_ctg_0_aimConstraint1.ct";
connectAttr "R_pinkyB_ctg_0.rp" "R_pinkyB_ctg_0_aimConstraint1.crp";
connectAttr "R_pinkyB_ctg_0.rpt" "R_pinkyB_ctg_0_aimConstraint1.crt";
connectAttr "R_pinkyB_ctg_0.ro" "R_pinkyB_ctg_0_aimConstraint1.cro";
connectAttr "R_pinkyA_ctl_0.t" "R_pinkyB_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_pinkyA_ctl_0.rp" "R_pinkyB_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_pinkyA_ctl_0.rpt" "R_pinkyB_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_pinkyA_ctl_0.pm" "R_pinkyB_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_pinkyB_ctg_0_aimConstraint1.w0" "R_pinkyB_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_pinkyOrient_ctl_0.wm" "R_pinkyB_ctg_0_aimConstraint1.wum";
connectAttr "R_pinkyOrient_ctg_0_aimConstraint1.crx" "R_pinkyOrient_ctg_0.rx";
connectAttr "R_pinkyOrient_ctg_0_aimConstraint1.cry" "R_pinkyOrient_ctg_0.ry";
connectAttr "R_pinkyOrient_ctg_0_aimConstraint1.crz" "R_pinkyOrient_ctg_0.rz";
connectAttr "R_pinkyOrient_ctg_0.pim" "R_pinkyOrient_ctg_0_aimConstraint1.cpim";
connectAttr "R_pinkyOrient_ctg_0.t" "R_pinkyOrient_ctg_0_aimConstraint1.ct";
connectAttr "R_pinkyOrient_ctg_0.rp" "R_pinkyOrient_ctg_0_aimConstraint1.crp";
connectAttr "R_pinkyOrient_ctg_0.rpt" "R_pinkyOrient_ctg_0_aimConstraint1.crt";
connectAttr "R_pinkyOrient_ctg_0.ro" "R_pinkyOrient_ctg_0_aimConstraint1.cro";
connectAttr "R_pinkyD_ctl_0.t" "R_pinkyOrient_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_pinkyD_ctl_0.rp" "R_pinkyOrient_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_pinkyD_ctl_0.rpt" "R_pinkyOrient_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_pinkyD_ctl_0.pm" "R_pinkyOrient_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_pinkyOrient_ctg_0_aimConstraint1.w0" "R_pinkyOrient_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_hand_org_0.wm" "R_pinkyOrient_ctg_0_aimConstraint1.wum";
connectAttr "R_middleC_ctg_0_pointConstraint1.ctx" "R_middleC_ctg_0.tx";
connectAttr "R_middleC_ctg_0_pointConstraint1.cty" "R_middleC_ctg_0.ty";
connectAttr "R_middleC_ctg_0_pointConstraint1.ctz" "R_middleC_ctg_0.tz";
connectAttr "R_middleC_ctg_0_aimConstraint1.crx" "R_middleC_ctg_0.rx";
connectAttr "R_middleC_ctg_0_aimConstraint1.cry" "R_middleC_ctg_0.ry";
connectAttr "R_middleC_ctg_0_aimConstraint1.crz" "R_middleC_ctg_0.rz";
connectAttr "R_middleC_ctg_0.pim" "R_middleC_ctg_0_pointConstraint1.cpim";
connectAttr "R_middleC_ctg_0.rp" "R_middleC_ctg_0_pointConstraint1.crp";
connectAttr "R_middleC_ctg_0.rpt" "R_middleC_ctg_0_pointConstraint1.crt";
connectAttr "R_middleA_ctl_0.t" "R_middleC_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_middleA_ctl_0.rp" "R_middleC_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_middleA_ctl_0.rpt" "R_middleC_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_middleA_ctl_0.pm" "R_middleC_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_middleC_ctg_0_pointConstraint1.w0" "R_middleC_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middleD_ctl_0.t" "R_middleC_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_middleD_ctl_0.rp" "R_middleC_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_middleD_ctl_0.rpt" "R_middleC_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_middleD_ctl_0.pm" "R_middleC_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_middleC_ctg_0_pointConstraint1.w1" "R_middleC_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_middleC_ctg_0.pim" "R_middleC_ctg_0_aimConstraint1.cpim";
connectAttr "R_middleC_ctg_0.t" "R_middleC_ctg_0_aimConstraint1.ct";
connectAttr "R_middleC_ctg_0.rp" "R_middleC_ctg_0_aimConstraint1.crp";
connectAttr "R_middleC_ctg_0.rpt" "R_middleC_ctg_0_aimConstraint1.crt";
connectAttr "R_middleC_ctg_0.ro" "R_middleC_ctg_0_aimConstraint1.cro";
connectAttr "R_middleA_ctl_0.t" "R_middleC_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_middleA_ctl_0.rp" "R_middleC_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_middleA_ctl_0.rpt" "R_middleC_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_middleA_ctl_0.pm" "R_middleC_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_middleC_ctg_0_aimConstraint1.w0" "R_middleC_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_middleOrient_ctl_0.wm" "R_middleC_ctg_0_aimConstraint1.wum";
connectAttr "R_middleB_ctg_0_pointConstraint1.ctx" "R_middleB_ctg_0.tx";
connectAttr "R_middleB_ctg_0_pointConstraint1.cty" "R_middleB_ctg_0.ty";
connectAttr "R_middleB_ctg_0_pointConstraint1.ctz" "R_middleB_ctg_0.tz";
connectAttr "R_middleB_ctg_0_aimConstraint1.crx" "R_middleB_ctg_0.rx";
connectAttr "R_middleB_ctg_0_aimConstraint1.cry" "R_middleB_ctg_0.ry";
connectAttr "R_middleB_ctg_0_aimConstraint1.crz" "R_middleB_ctg_0.rz";
connectAttr "R_middleB_ctg_0.pim" "R_middleB_ctg_0_pointConstraint1.cpim";
connectAttr "R_middleB_ctg_0.rp" "R_middleB_ctg_0_pointConstraint1.crp";
connectAttr "R_middleB_ctg_0.rpt" "R_middleB_ctg_0_pointConstraint1.crt";
connectAttr "R_middleA_ctl_0.t" "R_middleB_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_middleA_ctl_0.rp" "R_middleB_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_middleA_ctl_0.rpt" "R_middleB_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_middleA_ctl_0.pm" "R_middleB_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_middleB_ctg_0_pointConstraint1.w0" "R_middleB_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middleD_ctl_0.t" "R_middleB_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_middleD_ctl_0.rp" "R_middleB_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_middleD_ctl_0.rpt" "R_middleB_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_middleD_ctl_0.pm" "R_middleB_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_middleB_ctg_0_pointConstraint1.w1" "R_middleB_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_middleB_ctg_0.pim" "R_middleB_ctg_0_aimConstraint1.cpim";
connectAttr "R_middleB_ctg_0.t" "R_middleB_ctg_0_aimConstraint1.ct";
connectAttr "R_middleB_ctg_0.rp" "R_middleB_ctg_0_aimConstraint1.crp";
connectAttr "R_middleB_ctg_0.rpt" "R_middleB_ctg_0_aimConstraint1.crt";
connectAttr "R_middleB_ctg_0.ro" "R_middleB_ctg_0_aimConstraint1.cro";
connectAttr "R_middleA_ctl_0.t" "R_middleB_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_middleA_ctl_0.rp" "R_middleB_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_middleA_ctl_0.rpt" "R_middleB_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_middleA_ctl_0.pm" "R_middleB_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_middleB_ctg_0_aimConstraint1.w0" "R_middleB_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_middleOrient_ctl_0.wm" "R_middleB_ctg_0_aimConstraint1.wum";
connectAttr "R_middleOrient_ctg_0_aimConstraint1.crx" "R_middleOrient_ctg_0.rx";
connectAttr "R_middleOrient_ctg_0_aimConstraint1.cry" "R_middleOrient_ctg_0.ry";
connectAttr "R_middleOrient_ctg_0_aimConstraint1.crz" "R_middleOrient_ctg_0.rz";
connectAttr "R_middleOrient_ctg_0.pim" "R_middleOrient_ctg_0_aimConstraint1.cpim"
		;
connectAttr "R_middleOrient_ctg_0.t" "R_middleOrient_ctg_0_aimConstraint1.ct";
connectAttr "R_middleOrient_ctg_0.rp" "R_middleOrient_ctg_0_aimConstraint1.crp";
connectAttr "R_middleOrient_ctg_0.rpt" "R_middleOrient_ctg_0_aimConstraint1.crt"
		;
connectAttr "R_middleOrient_ctg_0.ro" "R_middleOrient_ctg_0_aimConstraint1.cro";
connectAttr "R_middleD_ctl_0.t" "R_middleOrient_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_middleD_ctl_0.rp" "R_middleOrient_ctg_0_aimConstraint1.tg[0].trp"
		;
connectAttr "R_middleD_ctl_0.rpt" "R_middleOrient_ctg_0_aimConstraint1.tg[0].trt"
		;
connectAttr "R_middleD_ctl_0.pm" "R_middleOrient_ctg_0_aimConstraint1.tg[0].tpm"
		;
connectAttr "R_middleOrient_ctg_0_aimConstraint1.w0" "R_middleOrient_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_hand_org_0.wm" "R_middleOrient_ctg_0_aimConstraint1.wum";
connectAttr "R_indexOrient_ctg_0_aimConstraint1.crx" "R_indexOrient_ctg_0.rx";
connectAttr "R_indexOrient_ctg_0_aimConstraint1.cry" "R_indexOrient_ctg_0.ry";
connectAttr "R_indexOrient_ctg_0_aimConstraint1.crz" "R_indexOrient_ctg_0.rz";
connectAttr "R_indexOrient_ctg_0.pim" "R_indexOrient_ctg_0_aimConstraint1.cpim";
connectAttr "R_indexOrient_ctg_0.t" "R_indexOrient_ctg_0_aimConstraint1.ct";
connectAttr "R_indexOrient_ctg_0.rp" "R_indexOrient_ctg_0_aimConstraint1.crp";
connectAttr "R_indexOrient_ctg_0.rpt" "R_indexOrient_ctg_0_aimConstraint1.crt";
connectAttr "R_indexOrient_ctg_0.ro" "R_indexOrient_ctg_0_aimConstraint1.cro";
connectAttr "R_indexD_ctl_0.t" "R_indexOrient_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_indexD_ctl_0.rp" "R_indexOrient_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_indexD_ctl_0.rpt" "R_indexOrient_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_indexD_ctl_0.pm" "R_indexOrient_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_indexOrient_ctg_0_aimConstraint1.w0" "R_indexOrient_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_hand_org_0.wm" "R_indexOrient_ctg_0_aimConstraint1.wum";
connectAttr "R_indexB_ctg_0_pointConstraint1.ctx" "R_indexB_ctg_0.tx";
connectAttr "R_indexB_ctg_0_pointConstraint1.cty" "R_indexB_ctg_0.ty";
connectAttr "R_indexB_ctg_0_pointConstraint1.ctz" "R_indexB_ctg_0.tz";
connectAttr "R_indexB_ctg_0_aimConstraint1.crx" "R_indexB_ctg_0.rx";
connectAttr "R_indexB_ctg_0_aimConstraint1.cry" "R_indexB_ctg_0.ry";
connectAttr "R_indexB_ctg_0_aimConstraint1.crz" "R_indexB_ctg_0.rz";
connectAttr "R_indexB_ctg_0.pim" "R_indexB_ctg_0_pointConstraint1.cpim";
connectAttr "R_indexB_ctg_0.rp" "R_indexB_ctg_0_pointConstraint1.crp";
connectAttr "R_indexB_ctg_0.rpt" "R_indexB_ctg_0_pointConstraint1.crt";
connectAttr "R_indexD_ctl_0.t" "R_indexB_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_indexD_ctl_0.rp" "R_indexB_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_indexD_ctl_0.rpt" "R_indexB_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_indexD_ctl_0.pm" "R_indexB_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_indexB_ctg_0_pointConstraint1.w0" "R_indexB_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_indexA_ctl_0.t" "R_indexB_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_indexA_ctl_0.rp" "R_indexB_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_indexA_ctl_0.rpt" "R_indexB_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_indexA_ctl_0.pm" "R_indexB_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_indexB_ctg_0_pointConstraint1.w1" "R_indexB_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_indexB_ctg_0.pim" "R_indexB_ctg_0_aimConstraint1.cpim";
connectAttr "R_indexB_ctg_0.t" "R_indexB_ctg_0_aimConstraint1.ct";
connectAttr "R_indexB_ctg_0.rp" "R_indexB_ctg_0_aimConstraint1.crp";
connectAttr "R_indexB_ctg_0.rpt" "R_indexB_ctg_0_aimConstraint1.crt";
connectAttr "R_indexB_ctg_0.ro" "R_indexB_ctg_0_aimConstraint1.cro";
connectAttr "R_indexA_ctl_0.t" "R_indexB_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_indexA_ctl_0.rp" "R_indexB_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_indexA_ctl_0.rpt" "R_indexB_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_indexA_ctl_0.pm" "R_indexB_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_indexB_ctg_0_aimConstraint1.w0" "R_indexB_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_indexOrient_ctl_0.wm" "R_indexB_ctg_0_aimConstraint1.wum";
connectAttr "R_indexC_ctg_0_pointConstraint1.ctx" "R_indexC_ctg_0.tx";
connectAttr "R_indexC_ctg_0_pointConstraint1.cty" "R_indexC_ctg_0.ty";
connectAttr "R_indexC_ctg_0_pointConstraint1.ctz" "R_indexC_ctg_0.tz";
connectAttr "R_indexC_ctg_0_aimConstraint1.crx" "R_indexC_ctg_0.rx";
connectAttr "R_indexC_ctg_0_aimConstraint1.cry" "R_indexC_ctg_0.ry";
connectAttr "R_indexC_ctg_0_aimConstraint1.crz" "R_indexC_ctg_0.rz";
connectAttr "R_indexC_ctg_0.pim" "R_indexC_ctg_0_pointConstraint1.cpim";
connectAttr "R_indexC_ctg_0.rp" "R_indexC_ctg_0_pointConstraint1.crp";
connectAttr "R_indexC_ctg_0.rpt" "R_indexC_ctg_0_pointConstraint1.crt";
connectAttr "R_indexA_ctl_0.t" "R_indexC_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_indexA_ctl_0.rp" "R_indexC_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_indexA_ctl_0.rpt" "R_indexC_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_indexA_ctl_0.pm" "R_indexC_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_indexC_ctg_0_pointConstraint1.w0" "R_indexC_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_indexD_ctl_0.t" "R_indexC_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_indexD_ctl_0.rp" "R_indexC_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_indexD_ctl_0.rpt" "R_indexC_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_indexD_ctl_0.pm" "R_indexC_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_indexC_ctg_0_pointConstraint1.w1" "R_indexC_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_indexC_ctg_0.pim" "R_indexC_ctg_0_aimConstraint1.cpim";
connectAttr "R_indexC_ctg_0.t" "R_indexC_ctg_0_aimConstraint1.ct";
connectAttr "R_indexC_ctg_0.rp" "R_indexC_ctg_0_aimConstraint1.crp";
connectAttr "R_indexC_ctg_0.rpt" "R_indexC_ctg_0_aimConstraint1.crt";
connectAttr "R_indexC_ctg_0.ro" "R_indexC_ctg_0_aimConstraint1.cro";
connectAttr "R_indexA_ctl_0.t" "R_indexC_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_indexA_ctl_0.rp" "R_indexC_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_indexA_ctl_0.rpt" "R_indexC_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_indexA_ctl_0.pm" "R_indexC_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_indexC_ctg_0_aimConstraint1.w0" "R_indexC_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_indexOrient_ctl_0.wm" "R_indexC_ctg_0_aimConstraint1.wum";
connectAttr "R_hand_org_0.pim" "R_Hand_org_0_pointConstraint1.cpim";
connectAttr "R_hand_org_0.rp" "R_Hand_org_0_pointConstraint1.crp";
connectAttr "R_hand_org_0.rpt" "R_Hand_org_0_pointConstraint1.crt";
connectAttr "R_wrist_ctl_0.t" "R_Hand_org_0_pointConstraint1.tg[0].tt";
connectAttr "R_wrist_ctl_0.rp" "R_Hand_org_0_pointConstraint1.tg[0].trp";
connectAttr "R_wrist_ctl_0.rpt" "R_Hand_org_0_pointConstraint1.tg[0].trt";
connectAttr "R_wrist_ctl_0.pm" "R_Hand_org_0_pointConstraint1.tg[0].tpm";
connectAttr "R_Hand_org_0_pointConstraint1.w0" "R_Hand_org_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_elbow_ctg_0_pointConstraint1.ctx" "R_elbow_ctg_0.tx";
connectAttr "R_elbow_ctg_0_pointConstraint1.cty" "R_elbow_ctg_0.ty";
connectAttr "R_elbow_ctg_0_pointConstraint1.ctz" "R_elbow_ctg_0.tz";
connectAttr "R_elbow_ctg_0_aimConstraint1.crx" "R_elbow_ctg_0.rx";
connectAttr "R_elbow_ctg_0_aimConstraint1.cry" "R_elbow_ctg_0.ry";
connectAttr "R_elbow_ctg_0_aimConstraint1.crz" "R_elbow_ctg_0.rz";
connectAttr "R_elbow_ctg_0.pim" "R_elbow_ctg_0_pointConstraint1.cpim";
connectAttr "R_elbow_ctg_0.rp" "R_elbow_ctg_0_pointConstraint1.crp";
connectAttr "R_elbow_ctg_0.rpt" "R_elbow_ctg_0_pointConstraint1.crt";
connectAttr "R_shoulder_ctl_0.t" "R_elbow_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_shoulder_ctl_0.rp" "R_elbow_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_shoulder_ctl_0.rpt" "R_elbow_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_shoulder_ctl_0.pm" "R_elbow_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_elbow_ctg_0_pointConstraint1.w0" "R_elbow_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_wrist_ctl_0.t" "R_elbow_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_wrist_ctl_0.rp" "R_elbow_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_wrist_ctl_0.rpt" "R_elbow_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_wrist_ctl_0.pm" "R_elbow_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_elbow_ctg_0_pointConstraint1.w1" "R_elbow_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_elbow_ctg_0.pim" "R_elbow_ctg_0_aimConstraint1.cpim";
connectAttr "R_elbow_ctg_0.t" "R_elbow_ctg_0_aimConstraint1.ct";
connectAttr "R_elbow_ctg_0.rp" "R_elbow_ctg_0_aimConstraint1.crp";
connectAttr "R_elbow_ctg_0.rpt" "R_elbow_ctg_0_aimConstraint1.crt";
connectAttr "R_elbow_ctg_0.ro" "R_elbow_ctg_0_aimConstraint1.cro";
connectAttr "R_shoulder_ctl_0.t" "R_elbow_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_shoulder_ctl_0.rp" "R_elbow_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_shoulder_ctl_0.rpt" "R_elbow_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_shoulder_ctl_0.pm" "R_elbow_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_elbow_ctg_0_aimConstraint1.w0" "R_elbow_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "null1_aimConstraint1.crx" "armUp_org.rx";
connectAttr "null1_aimConstraint1.cry" "armUp_org.ry";
connectAttr "null1_aimConstraint1.crz" "armUp_org.rz";
connectAttr "armUp_org.pim" "null1_aimConstraint1.cpim";
connectAttr "armUp_org.t" "null1_aimConstraint1.ct";
connectAttr "armUp_org.rp" "null1_aimConstraint1.crp";
connectAttr "armUp_org.rpt" "null1_aimConstraint1.crt";
connectAttr "armUp_org.ro" "null1_aimConstraint1.cro";
connectAttr "R_shoulder_ctl_0.t" "null1_aimConstraint1.tg[0].tt";
connectAttr "R_shoulder_ctl_0.rp" "null1_aimConstraint1.tg[0].trp";
connectAttr "R_shoulder_ctl_0.rpt" "null1_aimConstraint1.tg[0].trt";
connectAttr "R_shoulder_ctl_0.pm" "null1_aimConstraint1.tg[0].tpm";
connectAttr "null1_aimConstraint1.w0" "null1_aimConstraint1.tg[0].tw";
connectAttr "R_elbow_ctl_0.wm" "null1_aimConstraint1.wum";
connectAttr "R_elbow_ctl_0.tz" "armUp.tz";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "R_xxNAMESPACExxClavicle_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxElbow_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxWrist_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxCup_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxPinkyA_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxPinkyB_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxPinkyC_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxPinkyD_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxMiddleA_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxMiddleB_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxMiddleC_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxMiddleD_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxIndexA_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxIndexB_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxIndexC_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxIndexD_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxThumbA_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxThumbB_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxThumbC_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxThumbD_loc_X.iog" "loc_set.dsm" -na;
connectAttr "hyperView1.msg" "nodeEditorPanel2Info.b[0]";
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr ":lightLinker1.msg" "hyperLayout1.hyp[0].dn";
connectAttr ":persp.msg" "hyperLayout1.hyp[1].dn";
connectAttr ":perspShape.msg" "hyperLayout1.hyp[2].dn";
connectAttr ":top.msg" "hyperLayout1.hyp[3].dn";
connectAttr ":topShape.msg" "hyperLayout1.hyp[4].dn";
connectAttr ":front.msg" "hyperLayout1.hyp[5].dn";
connectAttr ":frontShape.msg" "hyperLayout1.hyp[6].dn";
connectAttr ":side.msg" "hyperLayout1.hyp[7].dn";
connectAttr ":sideShape.msg" "hyperLayout1.hyp[8].dn";
connectAttr "hyperView2.msg" "nodeEditorPanel1Info.b[0]";
connectAttr "hyperLayout2.msg" "hyperView2.hl";
connectAttr "R_elbow_ctg_0_pointConstraint1.msg" "hyperLayout2.hyp[0].dn";
connectAttr "R_elbow_ctg_0_aimConstraint1.msg" "hyperLayout2.hyp[1].dn";
connectAttr "R_shoulder_ctl_0AnnShape.msg" "hyperLayout2.hyp[15].dn";
connectAttr "R_elbow_ctl_0AnnShape.msg" "hyperLayout2.hyp[16].dn";
connectAttr "R_wrist_ctl_0AnnShape.msg" "hyperLayout2.hyp[17].dn";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
// End of arm_guide_v001.ma
