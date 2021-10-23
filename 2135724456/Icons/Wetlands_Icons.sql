-- Wetlands_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------	
INSERT INTO IconTextureAtlases	
		(Name,										IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_WETLANDS_FEATURES',		256,	 	1,				1,				'Wetlands_Features256.dds'),
		('ICON_ATLAS_JNR_WETLANDS_FEATURES',		64,			1,				1,				'Wetlands_Features64.dds'),
		('ICON_ATLAS_JNR_WETLANDS_FEATURES',		50,	 		1,				1,				'Wetlands_Features50.dds'),
		('ICON_ATLAS_JNR_WETLANDS_RESOURCES',		256,	 	2,				2,				'Wetlands_Resources256.dds'),
		('ICON_ATLAS_JNR_WETLANDS_RESOURCES_FOW',	256,		2,				2,				'Wetlands_Resources256_FOW.dds'),
		('ICON_ATLAS_JNR_WETLANDS_RESOURCES',		64,	 		2,				2,				'Wetlands_Resources64.dds'),
		('ICON_ATLAS_JNR_WETLANDS_RESOURCES',		50,	 		2,				2,				'Wetlands_Resources50.dds'),
		('ICON_ATLAS_JNR_WETLANDS_RESOURCES',		38,	 		2,				2,				'Wetlands_Resources38.dds'),
		('ICON_ATLAS_JNR_WETLANDS_UNITACTIONS',		256,	 	1,				1,				'Wetlands_UnitActions256.dds'),
		('ICON_ATLAS_JNR_WETLANDS_UNITACTIONS',		80,	 		1,				1,				'Wetlands_UnitActions80.dds'),
		('ICON_ATLAS_JNR_WETLANDS_UNITACTIONS',		50,	 		1,				1,				'Wetlands_UnitActions50.dds'),
		('ICON_ATLAS_JNR_WETLANDS_UNITACTIONS',		38,	 		1,				1,				'Wetlands_UnitActions38.dds');

INSERT INTO IconTextureAtlases	
		(Name,										IconSize,	IconsPerRow,	IconsPerColumn,	Filename,					Baseline)
VALUES  ('ICON_ATLAS_JNR_WETLANDS_RESOURCES',		22,	 		2,				2,				'Wetlands_Resources22.dds',	6);
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------	
INSERT INTO IconDefinitions	
		(Name,								Atlas, 										'Index')
VALUES 	('ICON_FEATURE_FLOODPLAINS_TUNDRA',	'ICON_ATLAS_JNR_WETLANDS_FEATURES',			0),

		('ICON_RESOURCE_JNR_PEAT',			'ICON_ATLAS_JNR_WETLANDS_RESOURCES',		0),
		('RESOURCE_JNR_PEAT',				'ICON_ATLAS_JNR_WETLANDS_RESOURCES',		0),
		('ICON_RESOURCE_JNR_PEAT_FOW',		'ICON_ATLAS_JNR_WETLANDS_RESOURCES_FOW',	0),

		('ICON_RESOURCE_JNR_SWAMP',			'ICON_ATLAS_JNR_WETLANDS_RESOURCES',		1),
		('RESOURCE_JNR_SWAMP',				'ICON_ATLAS_JNR_WETLANDS_RESOURCES',		1),
		('ICON_RESOURCE_JNR_SWAMP_FOW',		'ICON_ATLAS_JNR_WETLANDS_RESOURCES_FOW',	1),
		
		('ICON_IMPROVEMENT_JNR_OASIS_FARM',	'ICON_ATLAS_JNR_WETLANDS_UNITACTIONS',		0),
		('ICON_IMPROVEMENT_JNR_FLOOD_FARM',	'ICON_ATLAS_JNR_WETLANDS_UNITACTIONS',		0),
		('ICON_IMPROVEMENT_JNR_REED_HOME',	'ICON_ATLAS_UNIT_ACTIONS',					7);
--------------------------------------------------------------