//Maya ASCII 2013ff10 scene
//Name: blinky.skeletonGuide.20130920.145303.ma
//Last modified: Fri, Sep 20, 2013 02:53:03 PM
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
createNode transform -n "faceSkeletonGuide_grp";
createNode transform -n "C_head_gui_0" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" -4.9097879250861383e-016 34.5 -0.2 ;
	setAttr ".r" -type "double3" 90 0 90 ;
createNode locator -n "C_head_gui_Shape0" -p "C_head_gui_0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_jaw_gui_1" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 38.5 0 ;
	setAttr ".r" -type "double3" 89.999999999999872 -80 -89.999999999999872 ;
createNode locator -n "C_jaw_gui_Shape1" -p "C_jaw_gui_1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_jaw_gui_2" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 7.7715611723760958e-015 36.763518223330706 9.8480775301220813 ;
	setAttr ".r" -type "double3" 89.999999999999744 -80 -89.999999999999744 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
createNode locator -n "C_jaw_gui_Shape2" -p "C_jaw_gui_2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_mouth_gui_0" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 42 2 ;
	setAttr ".r" -type "double3" 89.999999999999872 -90 -89.999999999999872 ;
createNode locator -n "C_mouth_gui_Shape0" -p "C_mouth_gui_0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue_gui_1" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 35.687512177468378 3.4570514189976227 ;
	setAttr ".r" -type "double3" -90 -67.184926350128165 89.999999999999986 ;
createNode locator -n "C_tongue_gui_1Shape" -p "C_tongue_gui_1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue_gui_2" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 36.026098037387428 4.2619225421540321 ;
	setAttr ".r" -type "double3" -89.999999999999957 -74.444380938369733 89.999999999999957 ;
createNode locator -n "C_tongue_gui_2Shape" -p "C_tongue_gui_2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue_gui_3" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 36.26017657614517 5.1028118401158737 ;
	setAttr ".r" -type "double3" -90 -83.75774392527272 90 ;
createNode locator -n "C_tongue_gui_3Shape" -p "C_tongue_gui_3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue_gui_4" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 36.355068176176616 5.9703443103754363 ;
	setAttr ".r" -type "double3" 89.999999999999829 -87.900107868712297 -90 ;
createNode locator -n "C_tongue_gui_4Shape" -p "C_tongue_gui_4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue_gui_5" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 36.323073323216605 6.8429363609103788 ;
	setAttr ".r" -type "double3" 90 -83.966760099645953 -89.999999999999929 ;
createNode locator -n "C_tongue_gui_5Shape" -p "C_tongue_gui_5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue_gui_6" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 0 36.231259647488557 7.711636886179118 ;
	setAttr ".r" -type "double3" 90 -83.966760099645953 -89.999999999999929 ;
createNode locator -n "C_tongue_gui_6Shape" -p "C_tongue_gui_6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_eye_gui_0" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" 3.3131451606750488 42.640581130981445 3.2348023653030396 ;
	setAttr ".r" -type "double3" 0 -71.999999999999986 0 ;
createNode locator -n "L_eye_gui_Shape0" -p "L_eye_gui_0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_eyeLidLower_gui_0" -p "faceSkeletonGuide_grp";
createNode nurbsCurve -n "L_eyeLidLower_gui_Shape0" -p "L_eyeLidLower_gui_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 18 0 no 3
		23 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 18 18
		21
		3.2675399780273429 42.659278869628899 8.6096382141113263
		3.272334231345976 42.64559997831941 8.6098507957483505
		3.2819227366578225 42.618242188210367 8.6102759578774641
		3.3139327411128203 42.565315548915947 8.6070872390467024
		3.4086201026018408 42.412571726965759 8.5954464360333951
		3.5861899673762965 42.173008383064698 8.5693469264876647
		3.8615110801390657 41.880776820853555 8.518776957259103
		4.2216109269111914 41.628339594751552 8.4290964224544478
		4.6460271458099154 41.449225701019088 8.3015118524348228
		5.1010645474663399 41.352810884863509 8.1368936739097766
		5.5544548071469961 41.317890744878369 7.94297048927959
		5.9978543526077788 41.349503088747944 7.7131602133932367
		6.4063715873535134 41.433182898664967 7.4669609456606318
		6.776965999638314 41.589205441103921 7.2124101198699924
		7.0834511816713404 41.833149023442779 6.9715941849057703
		7.2945332287544513 42.090596231238258 6.7863058757974573
		7.4522602026272526 42.37506846859624 6.6292960890650354
		7.5234630090763916 42.545490062833842 6.5505451454448602
		7.5440672044264963 42.596619656532965 6.5268979247975691
		7.546535432672659 42.634379406237407 6.5222986602713133
		7.5477695465088175 42.653259277343913 6.5199990272522221
		;
createNode transform -n "L_eyeLidUpper_gui_0" -p "faceSkeletonGuide_grp";
createNode nurbsCurve -n "L_eyeLidUpper_gui_Shape0" -p "L_eyeLidUpper_gui_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 18 0 no 3
		23 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 18 18
		21
		3.2675399780273429 42.659278869628899 8.6096382141113263
		3.2659024880928502 42.6742289847626 8.609902187875548
		3.2626275068984461 42.704129207539935 8.6104301342590599
		3.2610858891542343 42.806285904214874 8.6055778943601648
		3.2944922543557182 43.097521609194423 8.5776975888374078
		3.4192596075830459 43.585190464183199 8.5036871396944917
		3.6872522742964753 44.16026542323295 8.3683692820721216
		4.0719275232584007 44.606969278431869 8.1909303670267928
		4.5114000899453108 44.867790080227003 7.9975212188148417
		4.9498549294603604 44.994921853296844 7.806736718468243
		5.4337022869398108 45.0246004484802 7.5911857082765488
		5.7930390172628154 44.98239046411048 7.4104553773196002
		6.2012095151026729 44.847145373300542 7.2039205778551905
		6.7189831213010907 44.591277798546784 6.940573164836298
		7.0648410319195127 44.190575463762315 6.7639036069768554
		7.3355756331009427 43.70925603976341 6.6219469058524796
		7.4963522242509262 43.156497667223022 6.5418621219691708
		7.5466531041727105 42.812733027672671 6.5200213772059046
		7.5489956556890387 42.708582795328141 6.5203682337701494
		7.5481782497601726 42.671700452502463 6.5201220965955091
		7.5477695465088175 42.653259277343913 6.5199990272522221
		;
createNode transform -n "R_eye_gui_0" -p "faceSkeletonGuide_grp";
	setAttr ".t" -type "double3" -3.31315 42.6406 3.2348 ;
	setAttr ".r" -type "double3" 179.99999999999997 -72 180.00000000000003 ;
createNode locator -n "R_eye_gui_Shape0" -p "R_eye_gui_0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_eyeLidLower_gui_0" -p "faceSkeletonGuide_grp";
createNode nurbsCurve -n "R_eyeLidLower_gui_Shape0" -p "R_eyeLidLower_gui_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 18 0 no 3
		23 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 18 18
		21
		-3.2675399780273429 42.659278869628899 8.6096382141113263
		-3.272334231345976 42.64559997831941 8.6098507957483505
		-3.2819227366578225 42.618242188210367 8.6102759578774641
		-3.3139327411128203 42.565315548915947 8.6070872390467024
		-3.4086201026018408 42.412571726965759 8.5954464360333951
		-3.5861899673762965 42.173008383064698 8.5693469264876647
		-3.8615110801390657 41.880776820853555 8.518776957259103
		-4.2216109269111906 41.628339594751552 8.4290964224544478
		-4.6460271458099154 41.449225701019088 8.3015118524348228
		-5.1010645474663407 41.352810884863509 8.1368936739097766
		-5.554454807146997 41.317890744878369 7.94297048927959
		-5.9978543526077779 41.349503088747944 7.7131602133932367
		-6.4063715873535134 41.433182898664967 7.4669609456606318
		-6.7769659996383131 41.589205441103921 7.2124101198699924
		-7.0834511816713404 41.833149023442779 6.9715941849057703
		-7.2945332287544513 42.090596231238258 6.7863058757974573
		-7.4522602026272526 42.37506846859624 6.6292960890650354
		-7.5234630090763916 42.545490062833842 6.5505451454448602
		-7.5440672044264945 42.596619656532965 6.5268979247975691
		-7.546535432672659 42.634379406237407 6.5222986602713133
		-7.5477695465088175 42.653259277343913 6.5199990272522221
		;
createNode transform -n "R_eyeLidUpper_gui_0" -p "faceSkeletonGuide_grp";
createNode nurbsCurve -n "R_eyeLidUpper_gui_Shape0" -p "R_eyeLidUpper_gui_0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 18 0 no 3
		23 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 18 18
		21
		-3.2675399780273429 42.659278869628899 8.6096382141113263
		-3.2659024880928502 42.6742289847626 8.609902187875548
		-3.2626275068984461 42.704129207539935 8.6104301342590599
		-3.2610858891542343 42.806285904214874 8.6055778943601648
		-3.2944922543557182 43.097521609194423 8.5776975888374078
		-3.4192596075830455 43.585190464183199 8.5036871396944917
		-3.6872522742964753 44.16026542323295 8.3683692820721216
		-4.0719275232584016 44.606969278431869 8.1909303670267928
		-4.5114000899453108 44.867790080227003 7.9975212188148417
		-4.9498549294603604 44.994921853296844 7.806736718468243
		-5.4337022869398108 45.0246004484802 7.5911857082765488
		-5.7930390172628154 44.98239046411048 7.4104553773196002
		-6.2012095151026738 44.847145373300542 7.2039205778551905
		-6.7189831213010907 44.591277798546784 6.940573164836298
		-7.0648410319195127 44.190575463762315 6.7639036069768554
		-7.3355756331009427 43.70925603976341 6.6219469058524796
		-7.4963522242509262 43.156497667223022 6.5418621219691708
		-7.5466531041727087 42.812733027672671 6.5200213772059046
		-7.5489956556890387 42.708582795328141 6.5203682337701494
		-7.5481782497601726 42.671700452502463 6.5201220965955091
		-7.5477695465088175 42.653259277343913 6.5199990272522221
		;
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
// End of blinky.skeletonGuide.20130920.145303.ma
