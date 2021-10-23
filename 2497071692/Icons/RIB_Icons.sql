-- RIB_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------	
INSERT INTO IconTextureAtlases	
		(Name,										IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		256,	 	2,				2,				'UC_RIB_UnitActions256.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		80,	 		2,				2,				'UC_RIB_UnitActions80.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		50,	 		2,				2,				'UC_RIB_UnitActions50.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		38,	 		2,				2,				'UC_RIB_UnitActions38.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS_RICE',	256,	 	1,				1,				'UC_RIB_UnitActions256_Rice.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS_RICE',	80,	 		1,				1,				'UC_RIB_UnitActions80_Rice.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS_RICE',	50,	 		1,				1,				'UC_RIB_UnitActions50_Rice.dds'),
		('ICON_ATLAS_JNR_UC_RIB_UNITACTIONS_RICE',	38,	 		1,				1,				'UC_RIB_UnitActions38_Rice.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------	
INSERT INTO IconDefinitions	
		(Name,										Atlas, 										'Index')
VALUES	('ICON_IMPROVEMENT_JNR_WET_FARM',			'ICON_ATLAS_JNR_UC_RIB_UNITACTIONS_RICE',	0),
	 	('ICON_IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		0),
		('ICON_IMPROVEMENT_JNR_CLOTHIER',			'ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		1),
		('ICON_IMPROVEMENT_JNR_BREWERY',			'ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		2),
		('ICON_IMPROVEMENT_JNR_CARAVANSERAI',		'ICON_ATLAS_JNR_UC_RIB_UNITACTIONS',		3);
--------------------------------------------------------------