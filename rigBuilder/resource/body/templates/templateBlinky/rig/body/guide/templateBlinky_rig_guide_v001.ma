//Maya ASCII 2013ff10 scene
//Name: tmpq0q8cy.ma
//Last modified: Wed, Oct 02, 2013 05:28:54 PM
//Codeset: 1252
file -rdi 1 -ns "comp_arm0" -rfn "comp_arm0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/arm/guide/arm_guide_v001.ma";
file -rdi 1 -ns "comp_leg0" -rfn "comp_leg0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/leg/guide/leg_guide_v001.ma";
file -rdi 1 -ns "comp_torso0" -rfn "comp_torso0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/torso5/guide/torso5_guide_v001.ma";
file -rdi 1 -ns "comp_head0" -rfn "comp_head0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/head/guide/head_guide_v001.ma";
file -rdi 1 -ns "comp_bigToe0" -rfn "comp_bigToe0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/toe/guide/toe_guide_v001.ma";
file -rdi 1 -ns "comp_middleToe0" -rfn "comp_middleToe0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/toe/guide/toe_guide_v001.ma";
file -rdi 1 -ns "comp_smallToe0" -rfn "comp_smallToe0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/toe/guide/toe_guide_v001.ma";
file -r -ns "comp_arm0" -dr 1 -rfn "comp_arm0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/arm/guide/arm_guide_v001.ma";
file -r -ns "comp_leg0" -dr 1 -rfn "comp_leg0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/leg/guide/leg_guide_v001.ma";
file -r -ns "comp_torso0" -dr 1 -rfn "comp_torso0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/torso5/guide/torso5_guide_v001.ma";
file -r -ns "comp_head0" -dr 1 -rfn "comp_head0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/head/guide/head_guide_v001.ma";
file -r -ns "comp_bigToe0" -dr 1 -rfn "comp_bigToe0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/toe/guide/toe_guide_v001.ma";
file -r -ns "comp_middleToe0" -dr 1 -rfn "comp_middleToe0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/toe/guide/toe_guide_v001.ma";
file -r -ns "comp_smallToe0" -dr 1 -rfn "comp_smallToe0RN" "P:/BLINKY BILL MOVIE/RIGGING/blinky/asset/component/toe/guide/toe_guide_v001.ma";
requires maya "2013ff10";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201209140124-844721";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -n "rig_guide";
createNode reference -n "comp_arm0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_arm0RN"
		"comp_arm0RN" 151
		0 "|comp_arm0:rig_arm_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		"comp_arm0RN" 42
		0 "|comp_arm0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbD_ctg_0|comp_arm0:R_thumbD_cth_0|comp_arm0:R_thumbD_ctl_0" 
		"translate" " -type \"double3\" 1.359217 -3.191592 1.527238"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateX" " -0.374017"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbC_ctg_0|comp_arm0:R_thumbC_cth_0|comp_arm0:R_thumbC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateX" " -0.380557"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbB_ctg_0|comp_arm0:R_thumbB_cth_0|comp_arm0:R_thumbB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_thumb_org_0|comp_arm0:R_thumbA_ctg_0|comp_arm0:R_thumbA_cth_0|comp_arm0:R_thumbA_ctl_0" 
		"translate" " -type \"double3\" 0.43518 -1.277967 -1.092616"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyD_ctg_0|comp_arm0:R_pinkyD_cth_0|comp_arm0:R_pinkyD_ctl_0" 
		"translate" " -type \"double3\" -0.236567 -3.578937 -2.563376"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateX" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyC_ctg_0|comp_arm0:R_pinkyC_cth_0|comp_arm0:R_pinkyC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateX" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyB_ctg_0|comp_arm0:R_pinkyB_cth_0|comp_arm0:R_pinkyB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_pinky_org_0|comp_arm0:R_pinkyA_ctg_0|comp_arm0:R_pinkyA_cth_0|comp_arm0:R_pinkyA_ctl_0" 
		"translate" " -type \"double3\" -0.287487 -2.313768 -0.982522"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleD_ctg_0|comp_arm0:R_middleD_cth_0|comp_arm0:R_middleD_ctl_0" 
		"translate" " -type \"double3\" -2.169625 -3.850788 -0.347897"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateX" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleC_ctg_0|comp_arm0:R_middleC_cth_0|comp_arm0:R_middleC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateX" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleB_ctg_0|comp_arm0:R_middleB_cth_0|comp_arm0:R_middleB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_middle_org_0|comp_arm0:R_middleA_ctg_0|comp_arm0:R_middleA_cth_0|comp_arm0:R_middleA_ctl_0" 
		"translate" " -type \"double3\" -0.856316 -2.403458 -0.224084"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0" 
		"translate" " -type \"double3\" -0.279012 -2.376974 0.88929"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateX" " 4.035109"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateY" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexA_ctg_0|comp_arm0:R_indexA_cth_0|comp_arm0:R_indexA_ctl_0|comp_arm0:R_indexOrient_ctg_0|comp_arm0:R_indexOrient_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateX" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexB_ctg_0|comp_arm0:R_indexB_cth_0|comp_arm0:R_indexB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateX" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexC_ctg_0|comp_arm0:R_indexC_cth_0|comp_arm0:R_indexC_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_index_org_0|comp_arm0:R_indexD_ctg_0|comp_arm0:R_indexD_cth_0|comp_arm0:R_indexD_ctl_0" 
		"translate" " -type \"double3\" -1.031141 -3.444515 2.962464"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_hand_org_0|comp_arm0:R_cup_ctg_0|comp_arm0:R_cup_cth_0|comp_arm0:R_cup_ctl_0" 
		"translate" " -type \"double3\" 0.626086 -0.680237 -0.345067"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_wrist_ctg_0|comp_arm0:R_wrist_cth_0|comp_arm0:R_wrist_ctl_0" 
		"translate" " -type \"double3\" -12.581212 22.384153 -1.679771"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_elbow_ctg_0|comp_arm0:R_elbow_cth_0|comp_arm0:R_elbow_ctl_0" 
		"translate" " -type \"double3\" -0.163653 0 -0.477035"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_shoulder_ctg_0|comp_arm0:R_shoulder_cth_0|comp_arm0:R_shoulder_ctl_0" 
		"translate" " -type \"double3\" -3.68037 30.233794 -1.310832"
		2 "|rig_guide|comp_arm0:rig_guide|comp_arm0:R_arm_org_0|comp_arm0:R_clavicle_ctg_0|comp_arm0:R_clavicle_cth_0|comp_arm0:R_clavicle_ctl_0" 
		"translate" " -type \"double3\" 0.771533 30.32578 1.27803"
		5 3 "comp_arm0RN" "comp_arm0:loc_set.message" "comp_arm0RN.placeHolderList[1]" 
		"";
createNode reference -n "comp_leg0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_leg0RN"
		"comp_leg0RN" 89
		0 "|comp_leg0:rig_leg_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		"comp_leg0RN" 21
		0 "|comp_leg0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateY" " 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0" 
		"rotateZ" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateY" " -1.205534"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0" 
		"translateZ" " -0.984543"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0|comp_leg0:R_innerfoot_ctg_0|comp_leg0:R_innerfoot_cth_0|comp_leg0:R_innerfoot_ctl_0" 
		"translate" " -type \"double3\" 1.542224 -0.949717 0.313109"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_midfoot_ctg_0|comp_leg0:R_midfoot_cth_0|comp_leg0:R_midfoot_ctl_0|comp_leg0:R_outerfoot_ctg_0|comp_leg0:R_outerfoot_cth_0|comp_leg0:R_outerfoot_ctl_0" 
		"translate" " -type \"double3\" -1.452707 -0.949717 0.313109"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateY" " 1"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_toe_ctg_0|comp_leg0:R_toe_cth_0|comp_leg0:R_toe_ctl_0" 
		"translateZ" " -0.924585"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateY" " 1"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_foot_ctg_0|comp_leg0:R_foot_ctl_0|comp_leg0:R_heel_ctg_0|comp_leg0:R_heel_cth_0|comp_leg0:R_heel_ctl_0" 
		"translateZ" " 0.864547"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_hip_ctg_0|comp_leg0:R_hip_cth_0|comp_leg0:R_hip_ctl_0" 
		"translate" " -type \"double3\" -4.117479 7.745437 0.290514"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_ankle_ctg_0|comp_leg0:R_ankle_cth_0|comp_leg0:R_ankle_ctl_0" 
		"translate" " -type \"double3\" -4.792606 2.673295 0.0175514"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateY" " -0.243164"
		2 "|rig_guide|comp_leg0:rig_guide|comp_leg0:R_leg_org_0|comp_leg0:R_knee_ctg_0|comp_leg0:R_knee_cth_0|comp_leg0:R_knee_ctl_0" 
		"translateZ" " 0.0568763"
		5 3 "comp_leg0RN" "comp_leg0:loc_set.message" "comp_leg0RN.placeHolderList[1]" 
		"";
createNode reference -n "comp_torso0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_torso0RN"
		"comp_torso0RN" 89
		0 "|comp_torso0:rig_torso5_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		"comp_torso0RN" 17
		0 "|comp_torso0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoB_ctg_0|comp_torso0:C_midTorsoB_cth_0|comp_torso0:C_midTorsoB_ctl_0" 
		"translateZ" " 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_midTorsoA_ctg_0|comp_torso0:C_midTorsoA_cth_0|comp_torso0:C_midTorsoA_ctl_0" 
		"translateZ" " 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateY" " 16.12234"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_chest_ctg_0|comp_torso0:C_chest_cth_0|comp_torso0:C_chest_ctl_0" 
		"translateZ" " 0.280933"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateY" " 15.159087"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_root_ctg_0|comp_torso0:C_root_cth_0|comp_torso0:C_root_ctl_0" 
		"translateZ" " 0.280933"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateY" " 20.405736"
		2 "|rig_guide|comp_torso0:rig_guide|comp_torso0:C_torso_org_0|comp_torso0:C_neck_cth_0|comp_torso0:C_neck_ctl_0" 
		"translateZ" " 0.0329711"
		5 3 "comp_torso0RN" "comp_torso0:loc_set.message" "comp_torso0RN.placeHolderList[1]" 
		"";
createNode reference -n "comp_head0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_head0RN"
		"comp_head0RN" 44
		0 "|comp_head0:rig_head_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		"comp_head0RN" 8
		0 "|comp_head0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateY" " 34.921115"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0" 
		"translateZ" " -0.0142314"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateX" " -k 0 0"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateY" " 12.302166"
		2 "|rig_guide|comp_head0:rig_guide|comp_head0:C_head_ctg_0|comp_head0:C_head_cth_0|comp_head0:C_head_ctl_0|comp_head0:C_skull_ctg_0|comp_head0:C_skull_cth_0|comp_head0:C_skull_ctl_0" 
		"translateZ" " -k 0 0"
		5 3 "comp_head0RN" "comp_head0:loc_set.message" "comp_head0RN.placeHolderList[1]" 
		"";
createNode reference -n "comp_bigToe0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_bigToe0RN"
		"comp_bigToe0RN" 9
		0 "|comp_bigToe0:rig_toe_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		"comp_bigToe0RN" 7
		0 "|comp_bigToe0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeC_ctg_0|comp_bigToe0:R_toeC_cth_0|comp_bigToe0:R_toeC_ctl_0" 
		"translate" " -type \"double3\" -3.061486 0.710763 10.843267"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateX" " 0.15182"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeB_ctg_0|comp_bigToe0:R_toeB_cth_0|comp_bigToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_bigToe0:rig_guide|comp_bigToe0:R_toe_org_0|comp_bigToe0:R_toeA_ctg_0|comp_bigToe0:R_toeA_cth_0|comp_bigToe0:R_toeA_ctl_0" 
		"translate" " -type \"double3\" -3.061486 0.995068 3.356277"
		5 3 "comp_bigToe0RN" "comp_bigToe0:loc_set.message" "comp_bigToe0RN.placeHolderList[1]" 
		"";
createNode reference -n "comp_middleToe0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_middleToe0RN"
		"comp_middleToe0RN" 7
		0 "|comp_middleToe0:rig_toe_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		"comp_middleToe0RN" 7
		0 "|comp_middleToe0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeC_ctg_0|comp_middleToe0:R_toeC_cth_0|comp_middleToe0:R_toeC_ctl_0" 
		"translate" " -type \"double3\" -4.794296 0.648806 11.17"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateX" " 0.0405133"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeB_ctg_0|comp_middleToe0:R_toeB_cth_0|comp_middleToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_middleToe0:rig_guide|comp_middleToe0:R_toe_org_0|comp_middleToe0:R_toeA_ctg_0|comp_middleToe0:R_toeA_cth_0|comp_middleToe0:R_toeA_ctl_0" 
		"translate" " -type \"double3\" -4.794296 1.045836 3.410712"
		5 3 "comp_middleToe0RN" "comp_middleToe0:loc_set.message" "comp_middleToe0RN.placeHolderList[1]" 
		"";
createNode reference -n "comp_smallToe0RN";
	setAttr ".phl[1]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"comp_smallToe0RN"
		"comp_smallToe0RN" 7
		0 "|comp_smallToe0:rig_toe_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		"comp_smallToe0RN" 7
		0 "|comp_smallToe0:rig_guide" "|rig_guide" "-s -r "
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeC_ctg_0|comp_smallToe0:R_toeC_cth_0|comp_smallToe0:R_toeC_ctl_0" 
		"translate" " -type \"double3\" -6.529302 0.648806 11.17"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateX" " 0.295851"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateY" " 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeB_ctg_0|comp_smallToe0:R_toeB_cth_0|comp_smallToe0:R_toeB_ctl_0" 
		"translateZ" " -k 0 0"
		2 "|rig_guide|comp_smallToe0:rig_guide|comp_smallToe0:R_toe_org_0|comp_smallToe0:R_toeA_ctg_0|comp_smallToe0:R_toeA_cth_0|comp_smallToe0:R_toeA_ctl_0" 
		"translate" " -type \"double3\" -6.529302 1.045836 3.270677"
		5 3 "comp_smallToe0RN" "comp_smallToe0:loc_set.message" "comp_smallToe0RN.placeHolderList[1]" 
		"";
createNode objectSet -n "guide_loc_set";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dnsm";
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
	setAttr -s 28 ".dsm";
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
	setAttr -s 8 ".r";
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
connectAttr "comp_arm0RN.phl[1]" "guide_loc_set.dnsm" -na;
connectAttr "comp_leg0RN.phl[1]" "guide_loc_set.dnsm" -na;
connectAttr "comp_torso0RN.phl[1]" "guide_loc_set.dnsm" -na;
connectAttr "comp_head0RN.phl[1]" "guide_loc_set.dnsm" -na;
connectAttr "comp_bigToe0RN.phl[1]" "guide_loc_set.dnsm" -na;
connectAttr "comp_middleToe0RN.phl[1]" "guide_loc_set.dnsm" -na;
connectAttr "comp_smallToe0RN.phl[1]" "guide_loc_set.dnsm" -na;
// End of tmpq0q8cy.ma
