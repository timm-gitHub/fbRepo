//Maya ASCII 2013ff10 scene
//Name: foreleg_guide_v001.ma
//Last modified: Thu, Sep 26, 2013 03:51:00 PM
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
	setAttr ".t" -type "double3" -20.346816958276037 15.307347610337949 24.756607852572284 ;
	setAttr ".r" -type "double3" -21.338352729609223 -41.799999999999656 1.0666187385028353e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 32.888429241062504;
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
	setAttr ".t" -type "double3" 100.1 3.6315192239231022 -0.90512637949448171 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30.380918476326077;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "rig_guide";
createNode transform -n "R_noTouch_org_0" -p "rig_guide";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode transform -n "R_xxNAMESPACExxScapula_loc_X" -p "R_noTouch_org_0";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zdown";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "LegAimFront";
createNode locator -n "R_xxNAMESPACExxScapula_loc_XShape" -p "R_xxNAMESPACExxScapula_loc_X";
	setAttr -k off ".v";
createNode transform -n "R_xxNAMESPACExxShoulder_loc_X" -p "R_xxNAMESPACExxScapula_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zdown";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "HipFront";
	setAttr ".global" 1;
createNode locator -n "R_xxNAMESPACExxShoulder_loc_XShape" -p "R_xxNAMESPACExxShoulder_loc_X";
	setAttr -k off ".v";
createNode transform -n "R_xxNAMESPACExxElbow_loc_X" -p "R_xxNAMESPACExxShoulder_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zdown";
	setAttr ".otherType" -type "string" "";
	setAttr ".twist" 1;
createNode locator -n "R_xxNAMESPACExxElbow_loc_XShape" -p "R_xxNAMESPACExxElbow_loc_X";
	setAttr -k off ".v";
createNode transform -n "R_xxNAMESPACExxFoot_loc_X" -p "R_xxNAMESPACExxElbow_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "xzy";
	setAttr ".secondaryAxis" -type "string" "zdown";
	setAttr ".label" 4;
	setAttr ".global" 1;
createNode locator -n "R_xxNAMESPACExxFoot_loc_XShape" -p "R_xxNAMESPACExxFoot_loc_X";
	setAttr -k off ".v";
createNode transform -n "R_xxNAMESPACExxMidfoot_loc_X" -p "R_xxNAMESPACExxFoot_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "zyx";
	setAttr ".secondaryAxis" -type "string" "ydown";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "Ball";
createNode locator -n "R_xxNAMESPACExxMidfoot_loc_XShape" -p "R_xxNAMESPACExxMidfoot_loc_X";
	setAttr -k off ".v";
createNode pointConstraint -n "R_midfoot_loc_X_pointConstraint1" -p "R_xxNAMESPACExxMidfoot_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "midfoot_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0 0.5 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxToes_loc_X" -p "R_xxNAMESPACExxMidfoot_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "xyz";
	setAttr ".secondaryAxis" -type "string" "ydown";
createNode locator -n "R_xxNAMESPACExxToes_loc_XShape" -p "R_xxNAMESPACExxToes_loc_X";
	setAttr -k off ".v";
createNode pointConstraint -n "R_toes_loc_X_pointConstraint1" -p "R_xxNAMESPACExxToes_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "midfootXW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "toeXW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -0.1719297508509029 0.25 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "R_xxNAMESPACExxToesEnd_loc_X" -p "R_xxNAMESPACExxToes_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zup";
createNode locator -n "R_xxNAMESPACExxToesEnd_loc_XShape" -p "R_xxNAMESPACExxToesEnd_loc_X";
	setAttr -k off ".v";
createNode pointConstraint -n "R_toesEnd_loc_X_pointConstraint1" -p "R_xxNAMESPACExxToesEnd_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "toeXW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -0.1719297508509029 0.25 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxToe_loc_X" -p "R_xxNAMESPACExxMidfoot_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "xyz";
	setAttr ".secondaryAxis" -type "string" "ydown";
	setAttr ".label" 5;
createNode locator -n "R_xxNAMESPACExxToe_loc_XShape" -p "R_xxNAMESPACExxToe_loc_X";
	setAttr -k off ".v";
createNode pointConstraint -n "R_toe_loc_X_pointConstraint1" -p "R_xxNAMESPACExxToe_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "toe_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0 0.5 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxOuterfoot_loc_X" -p "R_xxNAMESPACExxMidfoot_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".v" no;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zup";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "PinkyToe";
createNode locator -n "R_xxNAMESPACExxOuterfoot_loc_XShape" -p "R_xxNAMESPACExxOuterfoot_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode pointConstraint -n "R_outerfoot_loc_X_pointConstraint1" -p "R_xxNAMESPACExxOuterfoot_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "outerfoot_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -0.19117967357767471 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxInnerfoot_loc_X" -p "R_xxNAMESPACExxMidfoot_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr -l on -k off ".v" no;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zup";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "BigToe";
createNode locator -n "R_xxNAMESPACExxInnerfoot_loc_XShape" -p "R_xxNAMESPACExxInnerfoot_loc_X";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.2 0.2 0.2 ;
createNode pointConstraint -n "R_innerfoot_loc_X_pointConstraint1" -p "R_xxNAMESPACExxInnerfoot_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "innerfoot_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -0.19117967357767471 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_xxNAMESPACExxHeel_loc_X" -p "R_xxNAMESPACExxFoot_loc_X";
	addAttr -ci true -sn "order" -ln "order" -dt "string";
	addAttr -ci true -sn "secondaryAxis" -ln "secondaryAxis" -dt "string";
	addAttr -ci true -sn "label" -ln "label" -min 0 -max 29 -en "none:root:hip:knee:foot:toe:spine:neck:head:collar:shoulder:elbow:hand:finger:thumb:propA:propB:propC:other:indexfinger:middlefinger:ringfinger:pinkyfinger:extrafinger:bigtoe:indextoe:middletoe:ringtoe:pinkytoe:extratoe" 
		-at "enum";
	addAttr -ci true -sn "otherType" -ln "otherType" -dt "string";
	addAttr -ci true -sn "twist" -ln "twist" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "bend" -ln "bend" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "global" -ln "global" -min 0 -max 1 -at "long";
	setAttr ".v" no;
	setAttr ".order" -type "string" "zxy";
	setAttr ".secondaryAxis" -type "string" "zup";
	setAttr ".label" 18;
	setAttr ".otherType" -type "string" "Heel";
createNode locator -n "R_xxNAMESPACExxHeel_loc_XShape" -p "R_xxNAMESPACExxHeel_loc_X";
	setAttr -k off ".v";
createNode pointConstraint -n "R_heel_loc_X_pointConstraint1" -p "R_xxNAMESPACExxHeel_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "heel_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0 -0.5 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "R_ankle_loc_X_pointConstraint1" -p "R_xxNAMESPACExxFoot_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "ankle_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -1.5 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "R_xxNAMESPACExxElbow_loc_X_pointConstraint1" -p "R_xxNAMESPACExxElbow_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "R_elbow_ctl_0W0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -2.9880000000000009 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "R_knee_loc_X_pointConstraint1" -p "R_xxNAMESPACExxShoulder_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "knee_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 -1.5 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "R_hip_loc_X_pointConstraint1" -p "R_xxNAMESPACExxScapula_loc_X";
	addAttr -ci true -k true -sn "w0" -ln "hip_ctl_RW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.8455791968419647 3 0 ;
	setAttr -k on ".w0";
createNode transform -n "curve1" -p "R_noTouch_org_0";
createNode nurbsCurve -n "curveShape1" -p "curve1";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 5 0 no 3
		6 0 1 2 3 4 5
		6
		0 9.0000000000000018 0
		0 5.9940000000000015 0
		0 3.0060000000000007 0
		0 0 0
		0 0 3
		0 0 6
		;
createNode transform -n "R_leg_org_0" -p "rig_guide";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
createNode transform -n "R_foot_ctg_0" -p "R_leg_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode pointConstraint -n "R_foot_ctg_0_pointConstraint1" -p "R_foot_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -min 0 -at "double";
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
createNode transform -n "R_foot_ctl_0" -p "R_foot_ctg_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_foot_ctl_0Shape" -p "R_foot_ctl_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 20 0 no 3
		21 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
		21
		1.6636175401319904e-016 -1.3023411601186308e-014 -2.3410256344813334
		0.80259205555861834 -1.3023411601186308e-014 -2.1995070005840769
		1.5083796642196547 -1.3023411601186308e-014 -1.7920203347329311
		2.0322344240628478 -1.3023411601186308e-014 -1.1677145426922204
		2.3109717197782702 -1.3023411601186308e-014 -0.40189011675426062
		2.3109717197782684 -1.3023411601186308e-014 0.41308321494804034
		2.032234424062846 -1.3023411601186308e-014 1.1789076408859984
		1.508379664219651 -1.3023411601186308e-014 1.8032134329267071
		0.80259205555861579 -1.3023411601186308e-014 2.2107000987778544
		-1.0526630267345228e-015 -1.3023411601186308e-014 2.3522187326751083
		-0.80259205555861712 -1.3023411601186308e-014 2.2107000987778544
		-1.5083796642196521 -1.3023411601186308e-014 1.8032134329267064
		-2.032234424062846 -1.3023411601186308e-014 1.1789076408859984
		-2.3109717197782684 -1.3023411601186308e-014 0.41308321494803873
		-2.3109717197782684 -1.3023411601186308e-014 -0.40189011675426289
		-2.032234424062846 -1.3023411601186308e-014 -1.167714542692224
		-1.508379664219651 -1.3023411601186308e-014 -1.7920203347329311
		-0.80259205555861646 -1.3023411601186308e-014 -2.199507000584076
		-1.1654169049578105 -1.3023411601186308e-014 -2.303825378177891
		-0.80259205555861646 -1.3023411601186308e-014 -2.199507000584076
		-0.93708316649519052 -1.3023411601186308e-014 -1.8308483485053144
		;
createNode transform -n "R_midfoot_ctg_0" -p "R_foot_ctl_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_midfoot_cth_0" -p "R_midfoot_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_midfoot_ctl_0" -p "R_midfoot_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_midfoot_ctl_0Shape" -p "R_midfoot_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_innerfoot_ctg_0" -p "R_midfoot_ctl_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 1 2.2204460492503126e-016 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_innerfoot_cth_0" -p "R_innerfoot_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_innerfoot_ctl_0" -p "R_innerfoot_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_innerfoot_ctl_0Shape" -p "R_innerfoot_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.3 0.3 0.3 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_midfoot_ctg_0_pointConstraint1" -p "R_innerfoot_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "toe_loc_RW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" -0.51515283954809221 0.27942433764281949 0 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".tg[1].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.51515283954809221 0.27942433764281949 1 1;
	setAttr ".cpim" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.51515283954809221 -0.27942433764281949 0 1;
	setAttr ".rst" -type "double3" 0 0 1 ;
createNode aimConstraint -n "R_midfoot_ctg_0_aimConstraint1" -p "R_innerfoot_ctg_0";
	addAttr -ci true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" -0.51515283954809221 0.27942433764281949 0 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".cpim" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.51515283954809221 -0.27942433764281949 0 1;
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr ".ct" -type "double3" 0 0 0.5 ;
	setAttr ".rsrr" -type "double3" 0 89.999999999999986 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_outerfoot_ctg_0" -p "R_midfoot_ctl_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1 0 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_outerfoot_cth_0" -p "R_outerfoot_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_outerfoot_ctl_0" -p "R_outerfoot_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_outerfoot_ctl_0Shape" -p "R_outerfoot_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.3 0.3 0.3 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode pointConstraint -n "R_midfoot_ctg_0_pointConstraint1" -p "R_outerfoot_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "toe_loc_RW1" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" -0.51515283954809221 0.27942433764281949 0 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".tg[1].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.51515283954809221 0.27942433764281949 1 1;
	setAttr ".cpim" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.51515283954809221 -0.27942433764281949 0 1;
	setAttr ".rst" -type "double3" 0 0 1 ;
createNode aimConstraint -n "R_midfoot_ctg_0_aimConstraint1" -p "R_outerfoot_ctg_0";
	addAttr -ci true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -at "double";
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
	setAttr ".tg[0].tt" -type "double3" -0.51515283954809221 0.27942433764281949 0 ;
	setAttr ".tg[0].tpm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".cpim" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.51515283954809221 -0.27942433764281949 0 1;
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr ".ct" -type "double3" 0 0 0.5 ;
	setAttr ".rsrr" -type "double3" 0 89.999999999999986 0 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "R_midfoot_ctg_0_pointConstraint1" -p "R_midfoot_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "toe_loc_RW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 0 1 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode aimConstraint -n "R_midfoot_ctg_0_aimConstraint1" -p "R_midfoot_ctg_0";
	addAttr -ci true -sn "w0" -ln "ankle_loc_RW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr ".rsrr" -type "double3" 0 89.999999999999986 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_toe_ctg_0" -p "R_foot_ctl_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 0 0 6 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_toe_cth_0" -p "R_toe_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_toe_ctl_0" -p "R_toe_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_toe_ctl_0Shape" -p "R_toe_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_heel_ctg_0" -p "R_foot_ctl_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" 0 0 -3 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_heel_cth_0" -p "R_heel_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_heel_ctl_0" -p "R_heel_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_heel_ctl_0Shape" -p "R_heel_ctl_0";
	setAttr -k off ".v";
	setAttr -l on -cb off ".lpx";
	setAttr -l on -cb off ".lpy";
	setAttr -l on -cb off ".lpz";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
	setAttr -l on -cb off ".lsx";
	setAttr -l on -cb off ".lsy";
	setAttr -l on -cb off ".lsz";
createNode transform -n "R_scap_ctg_0" -p "R_leg_org_0";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 9.0000000000000018 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_scap_cth_0" -p "R_scap_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_scap_ctl_0" -p "R_scap_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_scap_ctl_0Shape" -p "R_scap_ctl_0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 2 2 2 ;
	setAttr -l on ".lsx";
	setAttr -l on ".lsy";
	setAttr -l on ".lsz";
createNode transform -n "R_scapOrient_ctg_0" -p "R_scap_ctl_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_scapOrient_ctl_0" -p "R_scapOrient_ctg_0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 12;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "R_scapOrient_ctl_0Shape" -p "R_scapOrient_ctl_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 20 0 no 3
		21 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
		21
		-0.40983548648545454 1.438319019453843e-016 -2.312923710600856
		0.4059471166144602 1.3515777689168031e-016 -2.3136093351200886
		1.1727665063093036 1.1018162922849566e-016 -2.0352395285866214
		1.7981329471529841 7.1915950972692177e-017 -1.5113897979691877
		2.2066180169540512 2.4976147663184545e-017 -0.80524415197887822
		2.3489523876969285 2.4976147663184545e-017 -0.0019741771219304502
		2.2079684336384391 -7.1915950972692325e-017 0.8015339126316734
		1.8006709003395922 -7.1915950972692325e-017 1.5083651831412133
		1.1761858813876278 -1.3515777689168031e-016 2.033265351464689
		0.40983548648545381 -1.438319019453843e-016 2.3129237106008564
		-0.40594711661445981 -1.3515777689168031e-016 2.3136093351200886
		-1.1727665063093029 -1.1018162922849566e-016 2.0352395285866214
		-1.7981329471529832 -7.1915950972692177e-017 1.5113897979691882
		-2.2066180169540472 -2.4976147663184653e-017 0.80524415197887844
		-2.3489523876969276 2.4976147663184708e-017 0.0019741771219320384
		-2.2079684336384391 7.1915950972692177e-017 -0.80153391263167195
		-1.800670900339592 1.1018162922849566e-016 -1.5083651831412117
		-1.1761858813876291 1.3515777689168014e-016 -2.033265351464689
		-1.552019526945472 1.3515777689168014e-016 -2.0727186349857813
		-1.1761858813876291 1.3515777689168014e-016 -2.033265351464689
		-1.2443597367479069 1.3515777689168014e-016 -1.6464120379050535
		;
createNode aimConstraint -n "R_scapOrient_ctg_0_aimConstraint1" -p "R_scapOrient_ctg_0";
	addAttr -ci true -sn "w0" -ln "ankle_ctl_XW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wut" 1;
	setAttr ".rsrr" -type "double3" 165.12451893315932 49.845090598869753 -6.9426666704937601 ;
	setAttr -k on ".w0";
createNode transform -n "R_scapAim_loc_0" -p "R_scap_ctl_0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 5.1903214627028751 ;
createNode locator -n "R_scapAim_loc_0Shape" -p "R_scapAim_loc_0";
	setAttr -k off ".v";
createNode annotationShape -n "R_scap_ctl_0AnnShape" -p "R_scap_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "scapula";
	setAttr -l on -k off ".daro" no;
createNode transform -n "R_ankle_ctg_0" -p "R_leg_org_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_ankle_cth_0" -p "R_ankle_ctg_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "R_ankle_ctl_0" -p "R_ankle_cth_0";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_ankle_ctl_0Shape" -p "R_ankle_ctl_0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 2 2 2 ;
	setAttr -l on ".lsx";
	setAttr -l on ".lsy";
	setAttr -l on ".lsz";
createNode annotationShape -n "R_ankle_ctl_0AnnShape" -p "R_ankle_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "ankle";
	setAttr -l on -k off ".daro" no;
createNode transform -n "R_shoulder_ctg_0" -p "R_leg_org_0";
	setAttr -l on -k off ".v";
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
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_shoulder_ctl_0Shape" -p "R_shoulder_ctl_0";
	setAttr -k off ".v";
	setAttr -l on ".lsx";
	setAttr -l on ".lsy";
	setAttr -l on ".lsz";
createNode annotationShape -n "R_shoulder_ctl_0AnnShape" -p "R_shoulder_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "shoulder";
	setAttr -l on -k off ".daro" no;
createNode pointConstraint -n "R_shoulder_ctg_0_pointConstraint1" -p "R_shoulder_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "hip_ctl_XW0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "ankle_ctl_XW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" -0.50839347887356712 1.5 0 ;
	setAttr -k on ".w0" 0.666;
	setAttr -k on ".w1" 0.334;
createNode aimConstraint -n "R_shoulder_ctg_0_aimConstraint1" -p "R_shoulder_ctg_0";
	addAttr -ci true -sn "w0" -ln "hip_ctl_XW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "R_elbow_ctg_0" -p "R_leg_org_0";
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
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode locator -n "R_elbow_ctl_0Shape" -p "R_elbow_ctl_0";
	setAttr -k off ".v";
	setAttr -l on ".lsx";
	setAttr -l on ".lsy";
	setAttr -l on ".lsz";
createNode annotationShape -n "R_elbow_ctl_0AnnShape" -p "R_elbow_ctl_0";
	setAttr -k off ".v";
	setAttr ".txt" -type "string" "elbow";
	setAttr -l on -k off ".daro" no;
createNode pointConstraint -n "R_elbow_ctg_0_pointConstraint1" -p "R_elbow_ctg_0";
	addAttr -ci true -k true -sn "w0" -ln "R_ankle_ctl_0W0" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "w1" -ln "R_scap_ctl_0W1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 4.5000000000000009 0 ;
	setAttr -k on ".w0" 0.666;
	setAttr -k on ".w1" 0.334;
createNode aimConstraint -n "R_elbow_ctg_0_aimConstraint1" -p "R_elbow_ctg_0";
	addAttr -ci true -sn "w0" -ln "R_scap_ctl_0W0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 1 0 0 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 0 89.999999999999986 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode objectSet -n "loc_set";
	setAttr ".ihi" 0;
	setAttr -s 11 ".dsm";
createNode hyperGraphInfo -n "nodeEditorPanel2Info";
createNode hyperView -n "hyperView1";
	setAttr ".vl" -type "double2" -505.76279391719567 -326.06909380058704 ;
	setAttr ".vh" -type "double2" 548.49642182825312 372.80513948624093 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	setAttr ".ihi" 0;
	setAttr -s 12 ".hyp";
	setAttr ".hyp[0].x" 24.34074592590332;
	setAttr ".hyp[0].y" 20.39409065246582;
	setAttr ".hyp[0].nvs" 1920;
	setAttr ".hyp[1].x" -159.94496154785156;
	setAttr ".hyp[1].y" 127.98303985595703;
	setAttr ".hyp[1].nvs" 1696;
	setAttr ".hyp[2].x" -159.94496154785156;
	setAttr ".hyp[2].y" 220.84017944335937;
	setAttr ".hyp[2].nvs" 1856;
	setAttr ".hyp[3].x" -159.94496154785156;
	setAttr ".hyp[3].y" -150.58839416503906;
	setAttr ".hyp[3].nvs" 1696;
	setAttr ".hyp[4].x" -159.94496154785156;
	setAttr ".hyp[4].y" 35.125896453857422;
	setAttr ".hyp[4].nvs" 1664;
	setAttr ".hyp[5].x" 24.34074592590332;
	setAttr ".hyp[5].y" -75.320198059082031;
	setAttr ".hyp[5].nvs" 1696;
	setAttr ".hyp[6].x" -159.94496154785156;
	setAttr ".hyp[6].y" -243.44552612304688;
	setAttr ".hyp[6].nvs" 1808;
	setAttr ".hyp[7].x" 24.34074592590332;
	setAttr ".hyp[7].y" -171.03448486328125;
	setAttr ".hyp[7].nvs" 1696;
	setAttr ".hyp[8].x" -159.94496154785156;
	setAttr ".hyp[8].y" -57.731246948242188;
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
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\n"
		+ "string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n"
		+ "                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n"
		+ "                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph InputOutput1\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 0.64061\n                -animateTransition 0\n                -showRelationships 1\n"
		+ "                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 5\n                -currentNode \"R_armShoulderIk_jnt_0\" \n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"largeIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n"
		+ "                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 0.64061\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 5\n                -currentNode \"R_armShoulderIk_jnt_0\" \n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"largeIcons\" \n                -showCachedConnections 0\n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 47 100 -ps 2 53 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n"
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
	setAttr -s 3 ".hyp";
	setAttr ".hyp[0].nvs" 2368;
	setAttr ".hyp[1].nvs" 2368;
	setAttr ".hyp[2].nvs" 2368;
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
connectAttr "R_hip_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxScapula_loc_X.tx";
connectAttr "R_hip_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxScapula_loc_X.ty"
		;
connectAttr "R_hip_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxScapula_loc_X.tz"
		;
connectAttr "R_knee_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxShoulder_loc_X.tx"
		;
connectAttr "R_knee_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxShoulder_loc_X.ty"
		;
connectAttr "R_knee_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxShoulder_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxElbow_loc_X.tx"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxElbow_loc_X.ty"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxElbow_loc_X.tz"
		;
connectAttr "R_ankle_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxFoot_loc_X.tx";
connectAttr "R_ankle_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxFoot_loc_X.ty";
connectAttr "R_ankle_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxFoot_loc_X.tz";
connectAttr "R_midfoot_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxMidfoot_loc_X.tx"
		;
connectAttr "R_midfoot_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxMidfoot_loc_X.ty"
		;
connectAttr "R_midfoot_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxMidfoot_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.pim" "R_midfoot_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.rp" "R_midfoot_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.rpt" "R_midfoot_loc_X_pointConstraint1.crt"
		;
connectAttr "R_midfoot_ctl_0.t" "R_midfoot_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_midfoot_ctl_0.rp" "R_midfoot_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_midfoot_ctl_0.rpt" "R_midfoot_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_midfoot_ctl_0.pm" "R_midfoot_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_midfoot_loc_X_pointConstraint1.w0" "R_midfoot_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_toes_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxToes_loc_X.tx";
connectAttr "R_toes_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxToes_loc_X.ty";
connectAttr "R_toes_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxToes_loc_X.tz";
connectAttr "R_xxNAMESPACExxToes_loc_X.pim" "R_toes_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxToes_loc_X.rp" "R_toes_loc_X_pointConstraint1.crp";
connectAttr "R_xxNAMESPACExxToes_loc_X.rpt" "R_toes_loc_X_pointConstraint1.crt";
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.t" "R_toes_loc_X_pointConstraint1.tg[0].tt"
		;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.rp" "R_toes_loc_X_pointConstraint1.tg[0].trp"
		;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.rpt" "R_toes_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.pm" "R_toes_loc_X_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_toes_loc_X_pointConstraint1.w0" "R_toes_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.t" "R_toes_loc_X_pointConstraint1.tg[1].tt"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.rp" "R_toes_loc_X_pointConstraint1.tg[1].trp"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.rpt" "R_toes_loc_X_pointConstraint1.tg[1].trt"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.pm" "R_toes_loc_X_pointConstraint1.tg[1].tpm"
		;
connectAttr "R_toes_loc_X_pointConstraint1.w1" "R_toes_loc_X_pointConstraint1.tg[1].tw"
		;
connectAttr "R_toesEnd_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxToesEnd_loc_X.tx"
		;
connectAttr "R_toesEnd_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxToesEnd_loc_X.ty"
		;
connectAttr "R_toesEnd_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxToesEnd_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxToesEnd_loc_X.pim" "R_toesEnd_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxToesEnd_loc_X.rp" "R_toesEnd_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxToesEnd_loc_X.rpt" "R_toesEnd_loc_X_pointConstraint1.crt"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.t" "R_toesEnd_loc_X_pointConstraint1.tg[0].tt"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.rp" "R_toesEnd_loc_X_pointConstraint1.tg[0].trp"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.rpt" "R_toesEnd_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_xxNAMESPACExxToe_loc_X.pm" "R_toesEnd_loc_X_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_toesEnd_loc_X_pointConstraint1.w0" "R_toesEnd_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_toe_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxToe_loc_X.tz";
connectAttr "R_toe_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxToe_loc_X.tx";
connectAttr "R_toe_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxToe_loc_X.ty";
connectAttr "R_xxNAMESPACExxToe_loc_X.pim" "R_toe_loc_X_pointConstraint1.cpim";
connectAttr "R_xxNAMESPACExxToe_loc_X.rp" "R_toe_loc_X_pointConstraint1.crp";
connectAttr "R_xxNAMESPACExxToe_loc_X.rpt" "R_toe_loc_X_pointConstraint1.crt";
connectAttr "R_toe_ctl_0.t" "R_toe_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_toe_ctl_0.rp" "R_toe_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_toe_ctl_0.rpt" "R_toe_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_toe_ctl_0.pm" "R_toe_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_toe_loc_X_pointConstraint1.w0" "R_toe_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_outerfoot_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxOuterfoot_loc_X.tx"
		;
connectAttr "R_outerfoot_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxOuterfoot_loc_X.ty"
		;
connectAttr "R_outerfoot_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxOuterfoot_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxOuterfoot_loc_X.pim" "R_outerfoot_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxOuterfoot_loc_X.rp" "R_outerfoot_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxOuterfoot_loc_X.rpt" "R_outerfoot_loc_X_pointConstraint1.crt"
		;
connectAttr "R_outerfoot_ctl_0.t" "R_outerfoot_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_outerfoot_ctl_0.rp" "R_outerfoot_loc_X_pointConstraint1.tg[0].trp"
		;
connectAttr "R_outerfoot_ctl_0.rpt" "R_outerfoot_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_outerfoot_ctl_0.pm" "R_outerfoot_loc_X_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_outerfoot_loc_X_pointConstraint1.w0" "R_outerfoot_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_innerfoot_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxInnerfoot_loc_X.tx"
		;
connectAttr "R_innerfoot_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxInnerfoot_loc_X.ty"
		;
connectAttr "R_innerfoot_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxInnerfoot_loc_X.tz"
		;
connectAttr "R_xxNAMESPACExxInnerfoot_loc_X.pim" "R_innerfoot_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxInnerfoot_loc_X.rp" "R_innerfoot_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxInnerfoot_loc_X.rpt" "R_innerfoot_loc_X_pointConstraint1.crt"
		;
connectAttr "R_innerfoot_ctl_0.t" "R_innerfoot_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_innerfoot_ctl_0.rp" "R_innerfoot_loc_X_pointConstraint1.tg[0].trp"
		;
connectAttr "R_innerfoot_ctl_0.rpt" "R_innerfoot_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_innerfoot_ctl_0.pm" "R_innerfoot_loc_X_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_innerfoot_loc_X_pointConstraint1.w0" "R_innerfoot_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_heel_loc_X_pointConstraint1.ctx" "R_xxNAMESPACExxHeel_loc_X.tx";
connectAttr "R_heel_loc_X_pointConstraint1.cty" "R_xxNAMESPACExxHeel_loc_X.ty";
connectAttr "R_heel_loc_X_pointConstraint1.ctz" "R_xxNAMESPACExxHeel_loc_X.tz";
connectAttr "R_xxNAMESPACExxHeel_loc_X.pim" "R_heel_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxHeel_loc_X.rp" "R_heel_loc_X_pointConstraint1.crp";
connectAttr "R_xxNAMESPACExxHeel_loc_X.rpt" "R_heel_loc_X_pointConstraint1.crt";
connectAttr "R_heel_ctl_0.t" "R_heel_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_heel_ctl_0.rp" "R_heel_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_heel_ctl_0.rpt" "R_heel_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_heel_ctl_0.pm" "R_heel_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_heel_loc_X_pointConstraint1.w0" "R_heel_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_xxNAMESPACExxFoot_loc_X.pim" "R_ankle_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxFoot_loc_X.rp" "R_ankle_loc_X_pointConstraint1.crp";
connectAttr "R_xxNAMESPACExxFoot_loc_X.rpt" "R_ankle_loc_X_pointConstraint1.crt"
		;
connectAttr "R_ankle_ctl_0.t" "R_ankle_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_ankle_ctl_0.rp" "R_ankle_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_ankle_ctl_0.rpt" "R_ankle_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_ankle_ctl_0.pm" "R_ankle_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_ankle_loc_X_pointConstraint1.w0" "R_ankle_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X.pim" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X.rp" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X.rpt" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.crt"
		;
connectAttr "R_elbow_ctl_0.t" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.tg[0].tt"
		;
connectAttr "R_elbow_ctl_0.rp" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.tg[0].trp"
		;
connectAttr "R_elbow_ctl_0.rpt" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.tg[0].trt"
		;
connectAttr "R_elbow_ctl_0.pm" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.w0" "R_xxNAMESPACExxElbow_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.pim" "R_knee_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.rp" "R_knee_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.rpt" "R_knee_loc_X_pointConstraint1.crt"
		;
connectAttr "R_shoulder_ctl_0.t" "R_knee_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_shoulder_ctl_0.rp" "R_knee_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_shoulder_ctl_0.rpt" "R_knee_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_shoulder_ctl_0.pm" "R_knee_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_knee_loc_X_pointConstraint1.w0" "R_knee_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_xxNAMESPACExxScapula_loc_X.pim" "R_hip_loc_X_pointConstraint1.cpim"
		;
connectAttr "R_xxNAMESPACExxScapula_loc_X.rp" "R_hip_loc_X_pointConstraint1.crp"
		;
connectAttr "R_xxNAMESPACExxScapula_loc_X.rpt" "R_hip_loc_X_pointConstraint1.crt"
		;
connectAttr "R_scap_ctl_0.t" "R_hip_loc_X_pointConstraint1.tg[0].tt";
connectAttr "R_scap_ctl_0.rp" "R_hip_loc_X_pointConstraint1.tg[0].trp";
connectAttr "R_scap_ctl_0.rpt" "R_hip_loc_X_pointConstraint1.tg[0].trt";
connectAttr "R_scap_ctl_0.pm" "R_hip_loc_X_pointConstraint1.tg[0].tpm";
connectAttr "R_hip_loc_X_pointConstraint1.w0" "R_hip_loc_X_pointConstraint1.tg[0].tw"
		;
connectAttr "R_scap_ctl_0Shape.wp" "curveShape1.cp[0]";
connectAttr "R_shoulder_ctl_0Shape.wp" "curveShape1.cp[1]";
connectAttr "R_elbow_ctl_0Shape.wp" "curveShape1.cp[2]";
connectAttr "R_ankle_ctl_0Shape.wp" "curveShape1.cp[3]";
connectAttr "R_midfoot_ctl_0Shape.wp" "curveShape1.cp[4]";
connectAttr "R_toe_ctl_0Shape.wp" "curveShape1.cp[5]";
connectAttr "R_foot_ctg_0_pointConstraint1.ctx" "R_foot_ctg_0.tx" -l on;
connectAttr "R_foot_ctg_0_pointConstraint1.ctz" "R_foot_ctg_0.tz" -l on;
connectAttr "R_foot_ctg_0.pim" "R_foot_ctg_0_pointConstraint1.cpim";
connectAttr "R_foot_ctg_0.rp" "R_foot_ctg_0_pointConstraint1.crp";
connectAttr "R_foot_ctg_0.rpt" "R_foot_ctg_0_pointConstraint1.crt";
connectAttr "R_ankle_ctl_0.t" "R_foot_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_ankle_ctl_0.rp" "R_foot_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_ankle_ctl_0.rpt" "R_foot_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_ankle_ctl_0.pm" "R_foot_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_foot_ctg_0_pointConstraint1.w0" "R_foot_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.crx" "R_midfoot_ctg_0.rx"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.cry" "R_midfoot_ctg_0.ry"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.crz" "R_midfoot_ctg_0.rz"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.ctx" "R_midfoot_ctg_0.tx"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.cty" "R_midfoot_ctg_0.ty"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.ctz" "R_midfoot_ctg_0.tz"
		;
connectAttr "R_midfoot_ctg_0.pim" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.cpim"
		;
connectAttr "R_midfoot_ctg_0.rp" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.crp"
		;
connectAttr "R_midfoot_ctg_0.rpt" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.crt"
		;
connectAttr "R_ankle_ctl_0.t" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[0].tt"
		;
connectAttr "R_ankle_ctl_0.rp" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[0].trp"
		;
connectAttr "R_ankle_ctl_0.rpt" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[0].trt"
		;
connectAttr "R_ankle_ctl_0.pm" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[0].tpm"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.w0" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_toe_ctl_0.t" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[1].tt"
		;
connectAttr "R_toe_ctl_0.rp" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[1].trp"
		;
connectAttr "R_toe_ctl_0.rpt" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[1].trt"
		;
connectAttr "R_toe_ctl_0.pm" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[1].tpm"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.w1" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_midfoot_ctg_0.pim" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.cpim"
		;
connectAttr "R_midfoot_ctg_0.t" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.ct"
		;
connectAttr "R_midfoot_ctg_0.rp" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.crp"
		;
connectAttr "R_midfoot_ctg_0.rpt" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.crt"
		;
connectAttr "R_midfoot_ctg_0.ro" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.cro"
		;
connectAttr "R_ankle_ctl_0.t" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.tg[0].tt"
		;
connectAttr "R_ankle_ctl_0.rp" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.tg[0].trp"
		;
connectAttr "R_ankle_ctl_0.rpt" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.tg[0].trt"
		;
connectAttr "R_ankle_ctl_0.pm" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.tg[0].tpm"
		;
connectAttr "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.w0" "|rig_guide|R_leg_org_0|R_foot_ctg_0|R_foot_ctl_0|R_midfoot_ctg_0|R_midfoot_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_scapOrient_ctg_0_aimConstraint1.crx" "R_scapOrient_ctg_0.rx";
connectAttr "R_scapOrient_ctg_0_aimConstraint1.cry" "R_scapOrient_ctg_0.ry";
connectAttr "R_scapOrient_ctg_0_aimConstraint1.crz" "R_scapOrient_ctg_0.rz";
connectAttr "R_scapOrient_ctg_0.pim" "R_scapOrient_ctg_0_aimConstraint1.cpim";
connectAttr "R_scapOrient_ctg_0.t" "R_scapOrient_ctg_0_aimConstraint1.ct";
connectAttr "R_scapOrient_ctg_0.rp" "R_scapOrient_ctg_0_aimConstraint1.crp";
connectAttr "R_scapOrient_ctg_0.rpt" "R_scapOrient_ctg_0_aimConstraint1.crt";
connectAttr "R_scapOrient_ctg_0.ro" "R_scapOrient_ctg_0_aimConstraint1.cro";
connectAttr "R_ankle_ctl_0.t" "R_scapOrient_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_ankle_ctl_0.rp" "R_scapOrient_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_ankle_ctl_0.rpt" "R_scapOrient_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_ankle_ctl_0.pm" "R_scapOrient_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_scapOrient_ctg_0_aimConstraint1.w0" "R_scapOrient_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_scapAim_loc_0.wm" "R_scapOrient_ctg_0_aimConstraint1.wum";
connectAttr "R_shoulder_ctg_0_pointConstraint1.ctx" "R_shoulder_ctg_0.tx";
connectAttr "R_shoulder_ctg_0_pointConstraint1.cty" "R_shoulder_ctg_0.ty";
connectAttr "R_shoulder_ctg_0_pointConstraint1.ctz" "R_shoulder_ctg_0.tz";
connectAttr "R_shoulder_ctg_0_aimConstraint1.crx" "R_shoulder_ctg_0.rx";
connectAttr "R_shoulder_ctg_0_aimConstraint1.cry" "R_shoulder_ctg_0.ry";
connectAttr "R_shoulder_ctg_0_aimConstraint1.crz" "R_shoulder_ctg_0.rz";
connectAttr "R_shoulder_ctg_0.pim" "R_shoulder_ctg_0_pointConstraint1.cpim";
connectAttr "R_shoulder_ctg_0.rp" "R_shoulder_ctg_0_pointConstraint1.crp";
connectAttr "R_shoulder_ctg_0.rpt" "R_shoulder_ctg_0_pointConstraint1.crt";
connectAttr "R_scap_ctl_0.t" "R_shoulder_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_scap_ctl_0.rp" "R_shoulder_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_scap_ctl_0.rpt" "R_shoulder_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_scap_ctl_0.pm" "R_shoulder_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_shoulder_ctg_0_pointConstraint1.w0" "R_shoulder_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_ankle_ctl_0.t" "R_shoulder_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_ankle_ctl_0.rp" "R_shoulder_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_ankle_ctl_0.rpt" "R_shoulder_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_ankle_ctl_0.pm" "R_shoulder_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_shoulder_ctg_0_pointConstraint1.w1" "R_shoulder_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_shoulder_ctg_0.pim" "R_shoulder_ctg_0_aimConstraint1.cpim";
connectAttr "R_shoulder_ctg_0.t" "R_shoulder_ctg_0_aimConstraint1.ct";
connectAttr "R_shoulder_ctg_0.rp" "R_shoulder_ctg_0_aimConstraint1.crp";
connectAttr "R_shoulder_ctg_0.rpt" "R_shoulder_ctg_0_aimConstraint1.crt";
connectAttr "R_shoulder_ctg_0.ro" "R_shoulder_ctg_0_aimConstraint1.cro";
connectAttr "R_scap_ctl_0.t" "R_shoulder_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_scap_ctl_0.rp" "R_shoulder_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_scap_ctl_0.rpt" "R_shoulder_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_scap_ctl_0.pm" "R_shoulder_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_shoulder_ctg_0_aimConstraint1.w0" "R_shoulder_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_scapOrient_ctl_0.wm" "R_shoulder_ctg_0_aimConstraint1.wum";
connectAttr "R_elbow_ctg_0_pointConstraint1.ctx" "R_elbow_ctg_0.tx";
connectAttr "R_elbow_ctg_0_pointConstraint1.cty" "R_elbow_ctg_0.ty";
connectAttr "R_elbow_ctg_0_pointConstraint1.ctz" "R_elbow_ctg_0.tz";
connectAttr "R_elbow_ctg_0_aimConstraint1.crx" "R_elbow_ctg_0.rx";
connectAttr "R_elbow_ctg_0_aimConstraint1.cry" "R_elbow_ctg_0.ry";
connectAttr "R_elbow_ctg_0_aimConstraint1.crz" "R_elbow_ctg_0.rz";
connectAttr "R_elbow_ctg_0.pim" "R_elbow_ctg_0_pointConstraint1.cpim";
connectAttr "R_elbow_ctg_0.rp" "R_elbow_ctg_0_pointConstraint1.crp";
connectAttr "R_elbow_ctg_0.rpt" "R_elbow_ctg_0_pointConstraint1.crt";
connectAttr "R_ankle_ctl_0.t" "R_elbow_ctg_0_pointConstraint1.tg[0].tt";
connectAttr "R_ankle_ctl_0.rp" "R_elbow_ctg_0_pointConstraint1.tg[0].trp";
connectAttr "R_ankle_ctl_0.rpt" "R_elbow_ctg_0_pointConstraint1.tg[0].trt";
connectAttr "R_ankle_ctl_0.pm" "R_elbow_ctg_0_pointConstraint1.tg[0].tpm";
connectAttr "R_elbow_ctg_0_pointConstraint1.w0" "R_elbow_ctg_0_pointConstraint1.tg[0].tw"
		;
connectAttr "R_scap_ctl_0.t" "R_elbow_ctg_0_pointConstraint1.tg[1].tt";
connectAttr "R_scap_ctl_0.rp" "R_elbow_ctg_0_pointConstraint1.tg[1].trp";
connectAttr "R_scap_ctl_0.rpt" "R_elbow_ctg_0_pointConstraint1.tg[1].trt";
connectAttr "R_scap_ctl_0.pm" "R_elbow_ctg_0_pointConstraint1.tg[1].tpm";
connectAttr "R_elbow_ctg_0_pointConstraint1.w1" "R_elbow_ctg_0_pointConstraint1.tg[1].tw"
		;
connectAttr "R_elbow_ctg_0.pim" "R_elbow_ctg_0_aimConstraint1.cpim";
connectAttr "R_elbow_ctg_0.t" "R_elbow_ctg_0_aimConstraint1.ct";
connectAttr "R_elbow_ctg_0.rp" "R_elbow_ctg_0_aimConstraint1.crp";
connectAttr "R_elbow_ctg_0.rpt" "R_elbow_ctg_0_aimConstraint1.crt";
connectAttr "R_elbow_ctg_0.ro" "R_elbow_ctg_0_aimConstraint1.cro";
connectAttr "R_scap_ctl_0.t" "R_elbow_ctg_0_aimConstraint1.tg[0].tt";
connectAttr "R_scap_ctl_0.rp" "R_elbow_ctg_0_aimConstraint1.tg[0].trp";
connectAttr "R_scap_ctl_0.rpt" "R_elbow_ctg_0_aimConstraint1.tg[0].trt";
connectAttr "R_scap_ctl_0.pm" "R_elbow_ctg_0_aimConstraint1.tg[0].tpm";
connectAttr "R_elbow_ctg_0_aimConstraint1.w0" "R_elbow_ctg_0_aimConstraint1.tg[0].tw"
		;
connectAttr "R_scapOrient_ctl_0.wm" "R_elbow_ctg_0_aimConstraint1.wum";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "R_xxNAMESPACExxScapula_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxShoulder_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxFoot_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxMidfoot_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxToe_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxHeel_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxOuterfoot_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxInnerfoot_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxToes_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxToesEnd_loc_X.iog" "loc_set.dsm" -na;
connectAttr "R_xxNAMESPACExxElbow_loc_X.iog" "loc_set.dsm" -na;
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
connectAttr "R_scap_ctl_0AnnShape.msg" "hyperLayout2.hyp[0].dn";
connectAttr "R_shoulder_ctl_0AnnShape.msg" "hyperLayout2.hyp[1].dn";
connectAttr "R_ankle_ctl_0AnnShape.msg" "hyperLayout2.hyp[2].dn";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
// End of foreleg_guide_v001.ma
