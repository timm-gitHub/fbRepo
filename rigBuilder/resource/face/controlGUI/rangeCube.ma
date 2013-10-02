//Maya ASCII 2013ff10 scene
//Name: rangeCube.ma
//Last modified: Mon, Sep 16, 2013 02:42:21 PM
//Codeset: 1252
requires maya "2013ff10";
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
	setAttr ".t" -type "double3" 28.000000000000004 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-014 ;
	setAttr ".rp" -type "double3" 4.1188799879630795e-015 -9.1432395123802126e-016 0 ;
	setAttr ".rpt" -type "double3" -2.7596520160224314e-015 -9.2226806482062097e-016 
		-2.3502035217492079e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 -1.2621774483536194e-029 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.4210854715202004e-014 ;
	setAttr ".rpt" -type "double3" 0 -1.4210854715202007e-014 1.4210854715202019e-014 ;
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
	setAttr ".rp" -type "double3" 0 0 -1.4210854715202004e-014 ;
	setAttr ".rpt" -type "double3" -1.4210854715202007e-014 0 1.4210854715202007e-014 ;
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
createNode transform -n "DO_NOT_TOUCH";
	addAttr -ci true -sn "showFrame" -ln "showFrame" -dv 1 -min 0 -max 1 -at "long";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".mtxe" yes;
	setAttr -l on ".mtye" yes;
	setAttr -l on ".mtze" yes;
	setAttr -l on ".xtxe" yes;
	setAttr -l on ".xtye" yes;
	setAttr -l on ".xtze" yes;
	setAttr -l on ".mrxe" yes;
	setAttr -l on ".mrye" yes;
	setAttr -l on ".mrze" yes;
	setAttr -l on ".xrxe" yes;
	setAttr -l on ".xrye" yes;
	setAttr -l on ".xrze" yes;
createNode nurbsCurve -n "DO_NOT_TOUCH1ShapeOrig" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 1 -1.0000000000000002
		-1 1 1.0000000000000002
		1 1 1.0000000000000002
		1 1 -1.0000000000000002
		-1 1 -1.0000000000000002
		;
createNode nurbsCurve -n "DO_NOT_TOUCH3ShapeOrig" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		1 1 1.0000000000000009
		1 -1 1.0000000000000009
		1 -1 -1.0000000000000009
		1 1 -1.0000000000000009
		1 1 1.0000000000000009
		;
createNode nurbsCurve -n "DO_NOT_TOUCH5ShapeOrig" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 1 1
		-1 -1 1
		1 -1 1
		1 1 1
		-1 1 1
		;
createNode nurbsCurve -n "DO_NOT_TOUCH6ShapeOrig" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 1 -1
		-1 -1 -1
		1 -1 -1
		1 1 -1
		-1 1 -1
		;
createNode nurbsCurve -n "DO_NOT_TOUCH4ShapeOrig" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1.0000000000000004 1 1.0000000000000009
		-1.0000000000000004 -1 1.0000000000000009
		-0.99999999999999956 -1 -1.0000000000000009
		-0.99999999999999956 1 -1.0000000000000009
		-1.0000000000000004 1 1.0000000000000009
		;
createNode nurbsCurve -n "DO_NOT_TOUCH2ShapeOrig" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 -1 -1.0000000000000002
		-1 -1 1.0000000000000002
		1 -1 1.0000000000000002
		1 -1 -1.0000000000000002
		-1 -1 -1.0000000000000002
		;
createNode transform -n "locators_grp" -p "DO_NOT_TOUCH";
	setAttr -k off ".v" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "home_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "home_locator1Shape" -p "home_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.25 0 0
		0.25 0 0
		;
createNode nurbsCurve -n "home_locator2Shape" -p "home_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.25000000000000011 0
		0 0.25000000000000011 0
		;
createNode nurbsCurve -n "home_locator3Shape" -p "home_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.25
		0 0 0.25
		;
createNode transform -n "XPosYPosZPos_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XPosYPosZPos_locator1Shape" -p "XPosYPosZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XPosYPosZPos_locator2Shape" -p "XPosYPosZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XPosYPosZPos_locator3Shape" -p "XPosYPosZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XPosYPosZPos_clusterShape" -p "XPosYPosZPos_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XPosYPosZNeg_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XPosYPosZNeg_locator1Shape" -p "XPosYPosZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XPosYPosZNeg_locator2Shape" -p "XPosYPosZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XPosYPosZNeg_locator3Shape" -p "XPosYPosZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XPosYPosZNeg_clusterShape" -p "XPosYPosZNeg_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XNegYPosZPos_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XNegYPosZPos_locator1Shape" -p "XNegYPosZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XNegYPosZPos_locator2Shape" -p "XNegYPosZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XNegYPosZPos_locator3Shape" -p "XNegYPosZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XNegYPosZPos_clusterShape" -p "XNegYPosZPos_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XNegYPosZNeg_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XNegYPosZNeg_locator1Shape" -p "XNegYPosZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XNegYPosZNeg_locator2Shape" -p "XNegYPosZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XNegYPosZNeg_locator3Shape" -p "XNegYPosZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XNegYPosZNeg_clusterShape" -p "XNegYPosZNeg_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XPosYNegZPos_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".tx";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XPosYNegZPos_locator1Shape" -p "XPosYNegZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XPosYNegZPos_locator2Shape" -p "XPosYNegZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XPosYNegZPos_locator3Shape" -p "XPosYNegZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XPosYNegZPos_clusterShape" -p "XPosYNegZPos_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XPosYNegZNeg_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XPosYNegZNeg_locator1Shape" -p "XPosYNegZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XPosYNegZNeg_locator2Shape" -p "XPosYNegZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XPosYNegZNeg_locator3Shape" -p "XPosYNegZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XPosYNegZNeg_clusterShape" -p "XPosYNegZNeg_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XNegYNegZPos_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XNegYNegZPos_locator1Shape" -p "XNegYNegZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XNegYNegZPos_locator2Shape" -p "XNegYNegZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XNegYNegZPos_locator3Shape" -p "XNegYNegZPos_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XNegYNegZPos_clusterShape" -p "XNegYNegZPos_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "XNegYNegZNeg_locator" -p "locators_grp";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "XNegYNegZNeg_locator1Shape" -p "XNegYNegZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-0.10000000000000001 0 0
		0.10000000000000001 0 0
		;
createNode nurbsCurve -n "XNegYNegZNeg_locator2Shape" -p "XNegYNegZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.10000000000000003 0
		0 0.10000000000000003 0
		;
createNode nurbsCurve -n "XNegYNegZNeg_locator3Shape" -p "XNegYNegZNeg_locator";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 0 -0.10000000000000001
		0 0 0.10000000000000001
		;
createNode clusterHandle -n "XNegYNegZNeg_clusterShape" -p "XNegYNegZNeg_locator";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr ".io" yes;
createNode transform -n "cube_crv" -p "DO_NOT_TOUCH";
	setAttr -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".it" no;
createNode nurbsCurve -n "cube_crv1Shape" -p "cube_crv";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr -s 10 ".iog[0].og";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".tw" yes;
createNode nurbsCurve -n "cube_crv2Shape" -p "cube_crv";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr -s 10 ".iog[0].og";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".tw" yes;
createNode nurbsCurve -n "cube_crv3Shape" -p "cube_crv";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr -s 10 ".iog[0].og";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".tw" yes;
createNode nurbsCurve -n "cube_crv4Shape" -p "cube_crv";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr -s 10 ".iog[0].og";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".tw" yes;
createNode nurbsCurve -n "cube_crv5Shape" -p "cube_crv";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr -s 10 ".iog[0].og";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".tw" yes;
createNode nurbsCurve -n "cube_crv6Shape" -p "cube_crv";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
	setAttr -s 10 ".iog[0].og";
	setAttr ".ovdt" 1;
	setAttr ".ove" yes;
	setAttr ".tw" yes;
createNode nurbsCurve -n "cube_crv1ShapeOrig" -p "cube_crv";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 1 -1
		-1 1 1
		1 1 1
		1 1 -1
		-1 1 -1
		;
createNode nurbsCurve -n "cube_crv3ShapeOrig" -p "cube_crv";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		1 1 1.0000000000000009
		1 -1 1.0000000000000009
		1 -1 -1.0000000000000009
		1 1 -1.0000000000000009
		1 1 1.0000000000000009
		;
createNode nurbsCurve -n "cube_crv5ShapeOrig" -p "cube_crv";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 1 0.99999999999999989
		-1 -1 0.99999999999999989
		1 -1 0.99999999999999989
		1 1 0.99999999999999989
		-1 1 0.99999999999999989
		;
createNode nurbsCurve -n "cube_crv6ShapeOrig" -p "cube_crv";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 1 -0.99999999999999989
		-1 -1 -0.99999999999999989
		1 -1 -0.99999999999999989
		1 1 -0.99999999999999989
		-1 1 -0.99999999999999989
		;
createNode nurbsCurve -n "cube_crv4ShapeOrig" -p "cube_crv";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1.0000000000000004 1 1.0000000000000009
		-1.0000000000000004 -1 1.0000000000000009
		-0.99999999999999956 -1 -1.0000000000000009
		-0.99999999999999956 1 -1.0000000000000009
		-1.0000000000000004 1 1.0000000000000009
		;
createNode nurbsCurve -n "cube_crv2ShapeOrig" -p "cube_crv";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1.4142135623730947 2.8284271247461894 4.2426406871192848 5.6568542494923797
		
		5
		-1 -1 -1
		-1 -1 1
		1 -1 1
		1 -1 -1
		-1 -1 -1
		;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "controlShapes_uiConfigurationScriptNode";
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
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n"
		+ "                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n"
		+ "            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n"
		+ "            -clipGhosts 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 1\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n"
		+ "            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\toutlinerPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n"
		+ "                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n"
		+ "                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n"
		+ "                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n"
		+ "                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n"
		+ "                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n"
		+ "                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\n"
		+ "            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph InputOutput1\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 0.677504\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n"
		+ "                -showInvisible 0\n                -transitionFrames 5\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"largeIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph InputOutput1\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 0.677504\n                -animateTransition 0\n                -showRelationships 1\n"
		+ "                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 5\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"largeIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels yes -displayAxesBold yes -perspectiveLabelPosition edge -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "controlShapes_sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode cluster -n "XPosYPosZPos_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -1 -1 -1 1;
createNode tweak -n "tweak1";
createNode tweak -n "tweak2";
createNode tweak -n "tweak3";
createNode objectSet -n "XPosYPosZPos_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XPosYPosZPos_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYPosZPos_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode groupId -n "XPosYPosZPos_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYPosZPos_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "cv[0]" "cv[4]";
createNode groupId -n "XPosYPosZPos_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYPosZPos_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode objectSet -n "tweakSet2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode objectSet -n "tweakSet3";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode cluster -n "XPosYPosZNeg_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -1 -1 1 1;
createNode tweak -n "tweak4";
createNode objectSet -n "XPosYPosZNeg_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XPosYPosZNeg_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYPosZNeg_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3]";
createNode groupId -n "XPosYPosZNeg_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYPosZNeg_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3]";
createNode groupId -n "XPosYPosZNeg_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYPosZNeg_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3]";
createNode objectSet -n "tweakSet4";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId10";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode cluster -n "XNegYPosZPos_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1 -1 -1 1;
createNode tweak -n "tweak5";
createNode objectSet -n "XNegYPosZPos_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XNegYPosZPos_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYPosZPos_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[1]";
createNode groupId -n "XNegYPosZPos_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYPosZPos_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "cv[0]" "cv[4]";
createNode groupId -n "XNegYPosZPos_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYPosZPos_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "cv[0]" "cv[4]";
createNode objectSet -n "tweakSet5";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts14";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode cluster -n "XNegYPosZNeg_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1 -1 1 1;
createNode objectSet -n "XNegYPosZNeg_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XNegYPosZNeg_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYPosZNeg_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "cv[0]" "cv[4]";
createNode groupId -n "XNegYPosZNeg_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYPosZNeg_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3]";
createNode groupId -n "XNegYPosZNeg_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYPosZNeg_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "cv[0]" "cv[4]";
createNode cluster -n "XPosYNegZPos_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -1 1 -1 1;
createNode tweak -n "tweak6";
createNode objectSet -n "XPosYNegZPos_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XPosYNegZPos_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYNegZPos_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode groupId -n "XPosYNegZPos_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYNegZPos_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[1]";
createNode groupId -n "XPosYNegZPos_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYNegZPos_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode objectSet -n "tweakSet6";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId18";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts18";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[*]";
createNode cluster -n "XPosYNegZNeg_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -1 1 1 1;
createNode objectSet -n "XPosYNegZNeg_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XPosYNegZNeg_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYNegZNeg_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[3]";
createNode groupId -n "XPosYNegZNeg_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYNegZNeg_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode groupId -n "XPosYNegZNeg_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XPosYNegZNeg_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode cluster -n "XNegYNegZPos_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1 1 -1 1;
createNode objectSet -n "XNegYNegZPos_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XNegYNegZPos_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYNegZPos_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[1]";
createNode groupId -n "XNegYNegZPos_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYNegZPos_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[1]";
createNode groupId -n "XNegYNegZPos_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYNegZPos_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[1]";
createNode cluster -n "XNegYNegZNeg_cluster";
	setAttr ".ihi" 0;
	setAttr -s 3 ".ip";
	setAttr -s 3 ".og";
	setAttr -s 3 ".gm";
	setAttr ".gm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".gm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1 1 1 1;
createNode objectSet -n "XNegYNegZNeg_clusterSet";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".vo" yes;
	setAttr -s 3 ".gn";
createNode groupId -n "XNegYNegZNeg_clusterGroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYNegZNeg_clusterGroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "cv[0]" "cv[4]";
createNode groupId -n "XNegYNegZNeg_clusterGroupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYNegZNeg_clusterGroupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[2]";
createNode groupId -n "XNegYNegZNeg_clusterGroupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "XNegYNegZNeg_clusterGroupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "cv[1]";
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
lockNode -l 1 ;
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
lockNode -l 1 ;
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
lockNode -l 1 ;
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".s";
lockNode -l 1 ;
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
lockNode -l 1 ;
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
lockNode -l 1 ;
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
lockNode -l 1 ;
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
lockNode -l 1 ;
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
lockNode -l 1 ;
connectAttr "DO_NOT_TOUCH.xtxl" "XPosYPosZPos_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.xtyl" "XPosYPosZPos_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.xtzl" "XPosYPosZPos_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.xtxl" "XPosYPosZNeg_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.xtyl" "XPosYPosZNeg_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.mtzl" "XPosYPosZNeg_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.mtxl" "XNegYPosZPos_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.xtyl" "XNegYPosZPos_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.xtzl" "XNegYPosZPos_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.mtxl" "XNegYPosZNeg_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.xtyl" "XNegYPosZNeg_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.mtzl" "XNegYPosZNeg_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.mtyl" "XPosYNegZPos_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.xtzl" "XPosYNegZPos_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.xtxl" "XPosYNegZPos_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.xtxl" "XPosYNegZNeg_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.mtyl" "XPosYNegZNeg_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.mtzl" "XPosYNegZNeg_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.mtxl" "XNegYNegZPos_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.mtyl" "XNegYNegZPos_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.xtzl" "XNegYNegZPos_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.mtxl" "XNegYNegZNeg_locator.tx" -l on;
connectAttr "DO_NOT_TOUCH.mtyl" "XNegYNegZNeg_locator.ty" -l on;
connectAttr "DO_NOT_TOUCH.mtzl" "XNegYNegZNeg_locator.tz" -l on;
connectAttr "DO_NOT_TOUCH.showFrame" "cube_crv.v" -l on;
connectAttr "XPosYPosZPos_clusterGroupId.id" "cube_crv1Shape.iog.og[0].gid";
connectAttr "XPosYPosZPos_clusterSet.mwc" "cube_crv1Shape.iog.og[0].gco";
connectAttr "groupId4.id" "cube_crv1Shape.iog.og[1].gid";
connectAttr "tweakSet1.mwc" "cube_crv1Shape.iog.og[1].gco";
connectAttr "XPosYPosZNeg_clusterGroupId.id" "cube_crv1Shape.iog.og[2].gid";
connectAttr "XPosYPosZNeg_clusterSet.mwc" "cube_crv1Shape.iog.og[2].gco";
connectAttr "XNegYPosZPos_clusterGroupId.id" "cube_crv1Shape.iog.og[3].gid";
connectAttr "XNegYPosZPos_clusterSet.mwc" "cube_crv1Shape.iog.og[3].gco";
connectAttr "XNegYPosZNeg_clusterGroupId.id" "cube_crv1Shape.iog.og[4].gid";
connectAttr "XNegYPosZNeg_clusterSet.mwc" "cube_crv1Shape.iog.og[4].gco";
connectAttr "XNegYPosZNeg_cluster.og[0]" "cube_crv1Shape.cr";
connectAttr "tweak1.pl[0].cp[0]" "cube_crv1Shape.twl";
connectAttr "XPosYNegZPos_clusterGroupId.id" "cube_crv2Shape.iog.og[0].gid";
connectAttr "XPosYNegZPos_clusterSet.mwc" "cube_crv2Shape.iog.og[0].gco";
connectAttr "groupId18.id" "cube_crv2Shape.iog.og[1].gid";
connectAttr "tweakSet6.mwc" "cube_crv2Shape.iog.og[1].gco";
connectAttr "XPosYNegZNeg_clusterGroupId.id" "cube_crv2Shape.iog.og[2].gid";
connectAttr "XPosYNegZNeg_clusterSet.mwc" "cube_crv2Shape.iog.og[2].gco";
connectAttr "XNegYNegZPos_clusterGroupId.id" "cube_crv2Shape.iog.og[3].gid";
connectAttr "XNegYNegZPos_clusterSet.mwc" "cube_crv2Shape.iog.og[3].gco";
connectAttr "XNegYNegZNeg_clusterGroupId.id" "cube_crv2Shape.iog.og[4].gid";
connectAttr "XNegYNegZNeg_clusterSet.mwc" "cube_crv2Shape.iog.og[4].gco";
connectAttr "XNegYNegZNeg_cluster.og[0]" "cube_crv2Shape.cr";
connectAttr "tweak6.pl[0].cp[0]" "cube_crv2Shape.twl";
connectAttr "XPosYNegZNeg_cluster.og[1]" "cube_crv3Shape.cr";
connectAttr "tweak2.pl[0].cp[0]" "cube_crv3Shape.twl";
connectAttr "XPosYPosZPos_clusterGroupId1.id" "cube_crv3Shape.iog.og[0].gid";
connectAttr "XPosYPosZPos_clusterSet.mwc" "cube_crv3Shape.iog.og[0].gco";
connectAttr "groupId5.id" "cube_crv3Shape.iog.og[1].gid";
connectAttr "tweakSet2.mwc" "cube_crv3Shape.iog.og[1].gco";
connectAttr "XPosYPosZNeg_clusterGroupId1.id" "cube_crv3Shape.iog.og[2].gid";
connectAttr "XPosYPosZNeg_clusterSet.mwc" "cube_crv3Shape.iog.og[2].gco";
connectAttr "XPosYNegZPos_clusterGroupId1.id" "cube_crv3Shape.iog.og[3].gid";
connectAttr "XPosYNegZPos_clusterSet.mwc" "cube_crv3Shape.iog.og[3].gco";
connectAttr "XPosYNegZNeg_clusterGroupId1.id" "cube_crv3Shape.iog.og[4].gid";
connectAttr "XPosYNegZNeg_clusterSet.mwc" "cube_crv3Shape.iog.og[4].gco";
connectAttr "XNegYNegZNeg_cluster.og[1]" "cube_crv4Shape.cr";
connectAttr "tweak5.pl[0].cp[0]" "cube_crv4Shape.twl";
connectAttr "XNegYPosZPos_clusterGroupId1.id" "cube_crv4Shape.iog.og[0].gid";
connectAttr "XNegYPosZPos_clusterSet.mwc" "cube_crv4Shape.iog.og[0].gco";
connectAttr "groupId14.id" "cube_crv4Shape.iog.og[1].gid";
connectAttr "tweakSet5.mwc" "cube_crv4Shape.iog.og[1].gco";
connectAttr "XNegYPosZNeg_clusterGroupId1.id" "cube_crv4Shape.iog.og[2].gid";
connectAttr "XNegYPosZNeg_clusterSet.mwc" "cube_crv4Shape.iog.og[2].gco";
connectAttr "XNegYNegZPos_clusterGroupId1.id" "cube_crv4Shape.iog.og[3].gid";
connectAttr "XNegYNegZPos_clusterSet.mwc" "cube_crv4Shape.iog.og[3].gco";
connectAttr "XNegYNegZNeg_clusterGroupId1.id" "cube_crv4Shape.iog.og[4].gid";
connectAttr "XNegYNegZNeg_clusterSet.mwc" "cube_crv4Shape.iog.og[4].gco";
connectAttr "XNegYNegZPos_cluster.og[2]" "cube_crv5Shape.cr";
connectAttr "tweak3.pl[0].cp[0]" "cube_crv5Shape.twl";
connectAttr "XPosYPosZPos_clusterGroupId2.id" "cube_crv5Shape.iog.og[0].gid";
connectAttr "XPosYPosZPos_clusterSet.mwc" "cube_crv5Shape.iog.og[0].gco";
connectAttr "groupId6.id" "cube_crv5Shape.iog.og[1].gid";
connectAttr "tweakSet3.mwc" "cube_crv5Shape.iog.og[1].gco";
connectAttr "XNegYPosZPos_clusterGroupId2.id" "cube_crv5Shape.iog.og[2].gid";
connectAttr "XNegYPosZPos_clusterSet.mwc" "cube_crv5Shape.iog.og[2].gco";
connectAttr "XPosYNegZPos_clusterGroupId2.id" "cube_crv5Shape.iog.og[3].gid";
connectAttr "XPosYNegZPos_clusterSet.mwc" "cube_crv5Shape.iog.og[3].gco";
connectAttr "XNegYNegZPos_clusterGroupId2.id" "cube_crv5Shape.iog.og[4].gid";
connectAttr "XNegYNegZPos_clusterSet.mwc" "cube_crv5Shape.iog.og[4].gco";
connectAttr "XNegYNegZNeg_cluster.og[2]" "cube_crv6Shape.cr";
connectAttr "tweak4.pl[0].cp[0]" "cube_crv6Shape.twl";
connectAttr "XPosYPosZNeg_clusterGroupId2.id" "cube_crv6Shape.iog.og[0].gid";
connectAttr "XPosYPosZNeg_clusterSet.mwc" "cube_crv6Shape.iog.og[0].gco";
connectAttr "groupId10.id" "cube_crv6Shape.iog.og[1].gid";
connectAttr "tweakSet4.mwc" "cube_crv6Shape.iog.og[1].gco";
connectAttr "XNegYPosZNeg_clusterGroupId2.id" "cube_crv6Shape.iog.og[2].gid";
connectAttr "XNegYPosZNeg_clusterSet.mwc" "cube_crv6Shape.iog.og[2].gco";
connectAttr "XPosYNegZNeg_clusterGroupId2.id" "cube_crv6Shape.iog.og[3].gid";
connectAttr "XPosYNegZNeg_clusterSet.mwc" "cube_crv6Shape.iog.og[3].gco";
connectAttr "XNegYNegZNeg_clusterGroupId2.id" "cube_crv6Shape.iog.og[4].gid";
connectAttr "XNegYNegZNeg_clusterSet.mwc" "cube_crv6Shape.iog.og[4].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "XPosYPosZPos_clusterGroupParts.og" "XPosYPosZPos_cluster.ip[0].ig";
connectAttr "XPosYPosZPos_clusterGroupId.id" "XPosYPosZPos_cluster.ip[0].gi";
connectAttr "XPosYPosZPos_clusterGroupParts1.og" "XPosYPosZPos_cluster.ip[1].ig"
		;
connectAttr "XPosYPosZPos_clusterGroupId1.id" "XPosYPosZPos_cluster.ip[1].gi";
connectAttr "XPosYPosZPos_clusterGroupParts2.og" "XPosYPosZPos_cluster.ip[2].ig"
		;
connectAttr "XPosYPosZPos_clusterGroupId2.id" "XPosYPosZPos_cluster.ip[2].gi";
connectAttr "XPosYPosZPos_locator.wm" "XPosYPosZPos_cluster.ma";
connectAttr "XPosYPosZPos_clusterShape.x" "XPosYPosZPos_cluster.x";
connectAttr "groupParts4.og" "tweak1.ip[0].ig";
connectAttr "groupId4.id" "tweak1.ip[0].gi";
connectAttr "groupParts5.og" "tweak2.ip[0].ig";
connectAttr "groupId5.id" "tweak2.ip[0].gi";
connectAttr "groupParts6.og" "tweak3.ip[0].ig";
connectAttr "groupId6.id" "tweak3.ip[0].gi";
connectAttr "XPosYPosZPos_clusterGroupId.msg" "XPosYPosZPos_clusterSet.gn" -na;
connectAttr "XPosYPosZPos_clusterGroupId1.msg" "XPosYPosZPos_clusterSet.gn" -na;
connectAttr "XPosYPosZPos_clusterGroupId2.msg" "XPosYPosZPos_clusterSet.gn" -na;
connectAttr "cube_crv1Shape.iog.og[0]" "XPosYPosZPos_clusterSet.dsm" -na;
connectAttr "cube_crv3Shape.iog.og[0]" "XPosYPosZPos_clusterSet.dsm" -na;
connectAttr "cube_crv5Shape.iog.og[0]" "XPosYPosZPos_clusterSet.dsm" -na;
connectAttr "XPosYPosZPos_cluster.msg" "XPosYPosZPos_clusterSet.ub[0]";
connectAttr "tweak1.og[0]" "XPosYPosZPos_clusterGroupParts.ig";
connectAttr "XPosYPosZPos_clusterGroupId.id" "XPosYPosZPos_clusterGroupParts.gi"
		;
connectAttr "tweak2.og[0]" "XPosYPosZPos_clusterGroupParts1.ig";
connectAttr "XPosYPosZPos_clusterGroupId1.id" "XPosYPosZPos_clusterGroupParts1.gi"
		;
connectAttr "tweak3.og[0]" "XPosYPosZPos_clusterGroupParts2.ig";
connectAttr "XPosYPosZPos_clusterGroupId2.id" "XPosYPosZPos_clusterGroupParts2.gi"
		;
connectAttr "groupId4.msg" "tweakSet1.gn" -na;
connectAttr "cube_crv1Shape.iog.og[1]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "cube_crv1ShapeOrig.ws" "groupParts4.ig";
connectAttr "groupId4.id" "groupParts4.gi";
connectAttr "groupId5.msg" "tweakSet2.gn" -na;
connectAttr "cube_crv3Shape.iog.og[1]" "tweakSet2.dsm" -na;
connectAttr "tweak2.msg" "tweakSet2.ub[0]";
connectAttr "cube_crv3ShapeOrig.ws" "groupParts5.ig";
connectAttr "groupId5.id" "groupParts5.gi";
connectAttr "groupId6.msg" "tweakSet3.gn" -na;
connectAttr "cube_crv5Shape.iog.og[1]" "tweakSet3.dsm" -na;
connectAttr "tweak3.msg" "tweakSet3.ub[0]";
connectAttr "cube_crv5ShapeOrig.ws" "groupParts6.ig";
connectAttr "groupId6.id" "groupParts6.gi";
connectAttr "XPosYPosZNeg_clusterGroupParts.og" "XPosYPosZNeg_cluster.ip[0].ig";
connectAttr "XPosYPosZNeg_clusterGroupId.id" "XPosYPosZNeg_cluster.ip[0].gi";
connectAttr "XPosYPosZNeg_clusterGroupParts1.og" "XPosYPosZNeg_cluster.ip[1].ig"
		;
connectAttr "XPosYPosZNeg_clusterGroupId1.id" "XPosYPosZNeg_cluster.ip[1].gi";
connectAttr "XPosYPosZNeg_clusterGroupParts2.og" "XPosYPosZNeg_cluster.ip[2].ig"
		;
connectAttr "XPosYPosZNeg_clusterGroupId2.id" "XPosYPosZNeg_cluster.ip[2].gi";
connectAttr "XPosYPosZNeg_locator.wm" "XPosYPosZNeg_cluster.ma";
connectAttr "XPosYPosZNeg_clusterShape.x" "XPosYPosZNeg_cluster.x";
connectAttr "groupParts10.og" "tweak4.ip[0].ig";
connectAttr "groupId10.id" "tweak4.ip[0].gi";
connectAttr "XPosYPosZNeg_clusterGroupId.msg" "XPosYPosZNeg_clusterSet.gn" -na;
connectAttr "XPosYPosZNeg_clusterGroupId1.msg" "XPosYPosZNeg_clusterSet.gn" -na;
connectAttr "XPosYPosZNeg_clusterGroupId2.msg" "XPosYPosZNeg_clusterSet.gn" -na;
connectAttr "cube_crv1Shape.iog.og[2]" "XPosYPosZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv3Shape.iog.og[2]" "XPosYPosZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv6Shape.iog.og[0]" "XPosYPosZNeg_clusterSet.dsm" -na;
connectAttr "XPosYPosZNeg_cluster.msg" "XPosYPosZNeg_clusterSet.ub[0]";
connectAttr "XPosYPosZPos_cluster.og[0]" "XPosYPosZNeg_clusterGroupParts.ig";
connectAttr "XPosYPosZNeg_clusterGroupId.id" "XPosYPosZNeg_clusterGroupParts.gi"
		;
connectAttr "XPosYPosZPos_cluster.og[1]" "XPosYPosZNeg_clusterGroupParts1.ig";
connectAttr "XPosYPosZNeg_clusterGroupId1.id" "XPosYPosZNeg_clusterGroupParts1.gi"
		;
connectAttr "tweak4.og[0]" "XPosYPosZNeg_clusterGroupParts2.ig";
connectAttr "XPosYPosZNeg_clusterGroupId2.id" "XPosYPosZNeg_clusterGroupParts2.gi"
		;
connectAttr "groupId10.msg" "tweakSet4.gn" -na;
connectAttr "cube_crv6Shape.iog.og[1]" "tweakSet4.dsm" -na;
connectAttr "tweak4.msg" "tweakSet4.ub[0]";
connectAttr "cube_crv6ShapeOrig.ws" "groupParts10.ig";
connectAttr "groupId10.id" "groupParts10.gi";
connectAttr "XNegYPosZPos_clusterGroupParts.og" "XNegYPosZPos_cluster.ip[0].ig";
connectAttr "XNegYPosZPos_clusterGroupId.id" "XNegYPosZPos_cluster.ip[0].gi";
connectAttr "XNegYPosZPos_clusterGroupParts1.og" "XNegYPosZPos_cluster.ip[1].ig"
		;
connectAttr "XNegYPosZPos_clusterGroupId1.id" "XNegYPosZPos_cluster.ip[1].gi";
connectAttr "XNegYPosZPos_clusterGroupParts2.og" "XNegYPosZPos_cluster.ip[2].ig"
		;
connectAttr "XNegYPosZPos_clusterGroupId2.id" "XNegYPosZPos_cluster.ip[2].gi";
connectAttr "XNegYPosZPos_locator.wm" "XNegYPosZPos_cluster.ma";
connectAttr "XNegYPosZPos_clusterShape.x" "XNegYPosZPos_cluster.x";
connectAttr "groupParts14.og" "tweak5.ip[0].ig";
connectAttr "groupId14.id" "tweak5.ip[0].gi";
connectAttr "XNegYPosZPos_clusterGroupId.msg" "XNegYPosZPos_clusterSet.gn" -na;
connectAttr "XNegYPosZPos_clusterGroupId1.msg" "XNegYPosZPos_clusterSet.gn" -na;
connectAttr "XNegYPosZPos_clusterGroupId2.msg" "XNegYPosZPos_clusterSet.gn" -na;
connectAttr "cube_crv1Shape.iog.og[3]" "XNegYPosZPos_clusterSet.dsm" -na;
connectAttr "cube_crv4Shape.iog.og[0]" "XNegYPosZPos_clusterSet.dsm" -na;
connectAttr "cube_crv5Shape.iog.og[2]" "XNegYPosZPos_clusterSet.dsm" -na;
connectAttr "XNegYPosZPos_cluster.msg" "XNegYPosZPos_clusterSet.ub[0]";
connectAttr "XPosYPosZNeg_cluster.og[0]" "XNegYPosZPos_clusterGroupParts.ig";
connectAttr "XNegYPosZPos_clusterGroupId.id" "XNegYPosZPos_clusterGroupParts.gi"
		;
connectAttr "tweak5.og[0]" "XNegYPosZPos_clusterGroupParts1.ig";
connectAttr "XNegYPosZPos_clusterGroupId1.id" "XNegYPosZPos_clusterGroupParts1.gi"
		;
connectAttr "XPosYPosZPos_cluster.og[2]" "XNegYPosZPos_clusterGroupParts2.ig";
connectAttr "XNegYPosZPos_clusterGroupId2.id" "XNegYPosZPos_clusterGroupParts2.gi"
		;
connectAttr "groupId14.msg" "tweakSet5.gn" -na;
connectAttr "cube_crv4Shape.iog.og[1]" "tweakSet5.dsm" -na;
connectAttr "tweak5.msg" "tweakSet5.ub[0]";
connectAttr "cube_crv4ShapeOrig.ws" "groupParts14.ig";
connectAttr "groupId14.id" "groupParts14.gi";
connectAttr "XNegYPosZNeg_clusterGroupParts.og" "XNegYPosZNeg_cluster.ip[0].ig";
connectAttr "XNegYPosZNeg_clusterGroupId.id" "XNegYPosZNeg_cluster.ip[0].gi";
connectAttr "XNegYPosZNeg_clusterGroupParts1.og" "XNegYPosZNeg_cluster.ip[1].ig"
		;
connectAttr "XNegYPosZNeg_clusterGroupId1.id" "XNegYPosZNeg_cluster.ip[1].gi";
connectAttr "XNegYPosZNeg_clusterGroupParts2.og" "XNegYPosZNeg_cluster.ip[2].ig"
		;
connectAttr "XNegYPosZNeg_clusterGroupId2.id" "XNegYPosZNeg_cluster.ip[2].gi";
connectAttr "XNegYPosZNeg_locator.wm" "XNegYPosZNeg_cluster.ma";
connectAttr "XNegYPosZNeg_clusterShape.x" "XNegYPosZNeg_cluster.x";
connectAttr "XNegYPosZNeg_clusterGroupId.msg" "XNegYPosZNeg_clusterSet.gn" -na;
connectAttr "XNegYPosZNeg_clusterGroupId1.msg" "XNegYPosZNeg_clusterSet.gn" -na;
connectAttr "XNegYPosZNeg_clusterGroupId2.msg" "XNegYPosZNeg_clusterSet.gn" -na;
connectAttr "cube_crv1Shape.iog.og[4]" "XNegYPosZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv4Shape.iog.og[2]" "XNegYPosZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv6Shape.iog.og[2]" "XNegYPosZNeg_clusterSet.dsm" -na;
connectAttr "XNegYPosZNeg_cluster.msg" "XNegYPosZNeg_clusterSet.ub[0]";
connectAttr "XNegYPosZPos_cluster.og[0]" "XNegYPosZNeg_clusterGroupParts.ig";
connectAttr "XNegYPosZNeg_clusterGroupId.id" "XNegYPosZNeg_clusterGroupParts.gi"
		;
connectAttr "XNegYPosZPos_cluster.og[1]" "XNegYPosZNeg_clusterGroupParts1.ig";
connectAttr "XNegYPosZNeg_clusterGroupId1.id" "XNegYPosZNeg_clusterGroupParts1.gi"
		;
connectAttr "XPosYPosZNeg_cluster.og[2]" "XNegYPosZNeg_clusterGroupParts2.ig";
connectAttr "XNegYPosZNeg_clusterGroupId2.id" "XNegYPosZNeg_clusterGroupParts2.gi"
		;
connectAttr "XPosYNegZPos_clusterGroupParts.og" "XPosYNegZPos_cluster.ip[0].ig";
connectAttr "XPosYNegZPos_clusterGroupId.id" "XPosYNegZPos_cluster.ip[0].gi";
connectAttr "XPosYNegZPos_clusterGroupParts1.og" "XPosYNegZPos_cluster.ip[1].ig"
		;
connectAttr "XPosYNegZPos_clusterGroupId1.id" "XPosYNegZPos_cluster.ip[1].gi";
connectAttr "XPosYNegZPos_clusterGroupParts2.og" "XPosYNegZPos_cluster.ip[2].ig"
		;
connectAttr "XPosYNegZPos_clusterGroupId2.id" "XPosYNegZPos_cluster.ip[2].gi";
connectAttr "XPosYNegZPos_locator.wm" "XPosYNegZPos_cluster.ma";
connectAttr "XPosYNegZPos_clusterShape.x" "XPosYNegZPos_cluster.x";
connectAttr "groupParts18.og" "tweak6.ip[0].ig";
connectAttr "groupId18.id" "tweak6.ip[0].gi";
connectAttr "XPosYNegZPos_clusterGroupId.msg" "XPosYNegZPos_clusterSet.gn" -na;
connectAttr "XPosYNegZPos_clusterGroupId1.msg" "XPosYNegZPos_clusterSet.gn" -na;
connectAttr "XPosYNegZPos_clusterGroupId2.msg" "XPosYNegZPos_clusterSet.gn" -na;
connectAttr "cube_crv2Shape.iog.og[0]" "XPosYNegZPos_clusterSet.dsm" -na;
connectAttr "cube_crv3Shape.iog.og[3]" "XPosYNegZPos_clusterSet.dsm" -na;
connectAttr "cube_crv5Shape.iog.og[3]" "XPosYNegZPos_clusterSet.dsm" -na;
connectAttr "XPosYNegZPos_cluster.msg" "XPosYNegZPos_clusterSet.ub[0]";
connectAttr "tweak6.og[0]" "XPosYNegZPos_clusterGroupParts.ig";
connectAttr "XPosYNegZPos_clusterGroupId.id" "XPosYNegZPos_clusterGroupParts.gi"
		;
connectAttr "XPosYPosZNeg_cluster.og[1]" "XPosYNegZPos_clusterGroupParts1.ig";
connectAttr "XPosYNegZPos_clusterGroupId1.id" "XPosYNegZPos_clusterGroupParts1.gi"
		;
connectAttr "XNegYPosZPos_cluster.og[2]" "XPosYNegZPos_clusterGroupParts2.ig";
connectAttr "XPosYNegZPos_clusterGroupId2.id" "XPosYNegZPos_clusterGroupParts2.gi"
		;
connectAttr "groupId18.msg" "tweakSet6.gn" -na;
connectAttr "cube_crv2Shape.iog.og[1]" "tweakSet6.dsm" -na;
connectAttr "tweak6.msg" "tweakSet6.ub[0]";
connectAttr "cube_crv2ShapeOrig.ws" "groupParts18.ig";
connectAttr "groupId18.id" "groupParts18.gi";
connectAttr "XPosYNegZNeg_clusterGroupParts.og" "XPosYNegZNeg_cluster.ip[0].ig";
connectAttr "XPosYNegZNeg_clusterGroupId.id" "XPosYNegZNeg_cluster.ip[0].gi";
connectAttr "XPosYNegZNeg_clusterGroupParts1.og" "XPosYNegZNeg_cluster.ip[1].ig"
		;
connectAttr "XPosYNegZNeg_clusterGroupId1.id" "XPosYNegZNeg_cluster.ip[1].gi";
connectAttr "XPosYNegZNeg_clusterGroupParts2.og" "XPosYNegZNeg_cluster.ip[2].ig"
		;
connectAttr "XPosYNegZNeg_clusterGroupId2.id" "XPosYNegZNeg_cluster.ip[2].gi";
connectAttr "XPosYNegZNeg_locator.wm" "XPosYNegZNeg_cluster.ma";
connectAttr "XPosYNegZNeg_clusterShape.x" "XPosYNegZNeg_cluster.x";
connectAttr "XPosYNegZNeg_clusterGroupId.msg" "XPosYNegZNeg_clusterSet.gn" -na;
connectAttr "XPosYNegZNeg_clusterGroupId1.msg" "XPosYNegZNeg_clusterSet.gn" -na;
connectAttr "XPosYNegZNeg_clusterGroupId2.msg" "XPosYNegZNeg_clusterSet.gn" -na;
connectAttr "cube_crv2Shape.iog.og[2]" "XPosYNegZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv3Shape.iog.og[4]" "XPosYNegZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv6Shape.iog.og[3]" "XPosYNegZNeg_clusterSet.dsm" -na;
connectAttr "XPosYNegZNeg_cluster.msg" "XPosYNegZNeg_clusterSet.ub[0]";
connectAttr "XPosYNegZPos_cluster.og[0]" "XPosYNegZNeg_clusterGroupParts.ig";
connectAttr "XPosYNegZNeg_clusterGroupId.id" "XPosYNegZNeg_clusterGroupParts.gi"
		;
connectAttr "XPosYNegZPos_cluster.og[1]" "XPosYNegZNeg_clusterGroupParts1.ig";
connectAttr "XPosYNegZNeg_clusterGroupId1.id" "XPosYNegZNeg_clusterGroupParts1.gi"
		;
connectAttr "XNegYPosZNeg_cluster.og[2]" "XPosYNegZNeg_clusterGroupParts2.ig";
connectAttr "XPosYNegZNeg_clusterGroupId2.id" "XPosYNegZNeg_clusterGroupParts2.gi"
		;
connectAttr "XNegYNegZPos_clusterGroupParts.og" "XNegYNegZPos_cluster.ip[0].ig";
connectAttr "XNegYNegZPos_clusterGroupId.id" "XNegYNegZPos_cluster.ip[0].gi";
connectAttr "XNegYNegZPos_clusterGroupParts1.og" "XNegYNegZPos_cluster.ip[1].ig"
		;
connectAttr "XNegYNegZPos_clusterGroupId1.id" "XNegYNegZPos_cluster.ip[1].gi";
connectAttr "XNegYNegZPos_clusterGroupParts2.og" "XNegYNegZPos_cluster.ip[2].ig"
		;
connectAttr "XNegYNegZPos_clusterGroupId2.id" "XNegYNegZPos_cluster.ip[2].gi";
connectAttr "XNegYNegZPos_locator.wm" "XNegYNegZPos_cluster.ma";
connectAttr "XNegYNegZPos_clusterShape.x" "XNegYNegZPos_cluster.x";
connectAttr "XNegYNegZPos_clusterGroupId.msg" "XNegYNegZPos_clusterSet.gn" -na;
connectAttr "XNegYNegZPos_clusterGroupId1.msg" "XNegYNegZPos_clusterSet.gn" -na;
connectAttr "XNegYNegZPos_clusterGroupId2.msg" "XNegYNegZPos_clusterSet.gn" -na;
connectAttr "cube_crv2Shape.iog.og[3]" "XNegYNegZPos_clusterSet.dsm" -na;
connectAttr "cube_crv4Shape.iog.og[3]" "XNegYNegZPos_clusterSet.dsm" -na;
connectAttr "cube_crv5Shape.iog.og[4]" "XNegYNegZPos_clusterSet.dsm" -na;
connectAttr "XNegYNegZPos_cluster.msg" "XNegYNegZPos_clusterSet.ub[0]";
connectAttr "XPosYNegZNeg_cluster.og[0]" "XNegYNegZPos_clusterGroupParts.ig";
connectAttr "XNegYNegZPos_clusterGroupId.id" "XNegYNegZPos_clusterGroupParts.gi"
		;
connectAttr "XNegYPosZNeg_cluster.og[1]" "XNegYNegZPos_clusterGroupParts1.ig";
connectAttr "XNegYNegZPos_clusterGroupId1.id" "XNegYNegZPos_clusterGroupParts1.gi"
		;
connectAttr "XPosYNegZPos_cluster.og[2]" "XNegYNegZPos_clusterGroupParts2.ig";
connectAttr "XNegYNegZPos_clusterGroupId2.id" "XNegYNegZPos_clusterGroupParts2.gi"
		;
connectAttr "XNegYNegZNeg_clusterGroupParts.og" "XNegYNegZNeg_cluster.ip[0].ig";
connectAttr "XNegYNegZNeg_clusterGroupId.id" "XNegYNegZNeg_cluster.ip[0].gi";
connectAttr "XNegYNegZNeg_clusterGroupParts1.og" "XNegYNegZNeg_cluster.ip[1].ig"
		;
connectAttr "XNegYNegZNeg_clusterGroupId1.id" "XNegYNegZNeg_cluster.ip[1].gi";
connectAttr "XNegYNegZNeg_clusterGroupParts2.og" "XNegYNegZNeg_cluster.ip[2].ig"
		;
connectAttr "XNegYNegZNeg_clusterGroupId2.id" "XNegYNegZNeg_cluster.ip[2].gi";
connectAttr "XNegYNegZNeg_locator.wm" "XNegYNegZNeg_cluster.ma";
connectAttr "XNegYNegZNeg_clusterShape.x" "XNegYNegZNeg_cluster.x";
connectAttr "XNegYNegZNeg_clusterGroupId.msg" "XNegYNegZNeg_clusterSet.gn" -na;
connectAttr "XNegYNegZNeg_clusterGroupId1.msg" "XNegYNegZNeg_clusterSet.gn" -na;
connectAttr "XNegYNegZNeg_clusterGroupId2.msg" "XNegYNegZNeg_clusterSet.gn" -na;
connectAttr "cube_crv2Shape.iog.og[4]" "XNegYNegZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv4Shape.iog.og[4]" "XNegYNegZNeg_clusterSet.dsm" -na;
connectAttr "cube_crv6Shape.iog.og[4]" "XNegYNegZNeg_clusterSet.dsm" -na;
connectAttr "XNegYNegZNeg_cluster.msg" "XNegYNegZNeg_clusterSet.ub[0]";
connectAttr "XNegYNegZPos_cluster.og[0]" "XNegYNegZNeg_clusterGroupParts.ig";
connectAttr "XNegYNegZNeg_clusterGroupId.id" "XNegYNegZNeg_clusterGroupParts.gi"
		;
connectAttr "XNegYNegZPos_cluster.og[1]" "XNegYNegZNeg_clusterGroupParts1.ig";
connectAttr "XNegYNegZNeg_clusterGroupId1.id" "XNegYNegZNeg_clusterGroupParts1.gi"
		;
connectAttr "XPosYNegZNeg_cluster.og[2]" "XNegYNegZNeg_clusterGroupParts2.ig";
connectAttr "XNegYNegZNeg_clusterGroupId2.id" "XNegYNegZNeg_clusterGroupParts2.gi"
		;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of rangeCube.ma
