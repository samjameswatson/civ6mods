-- UC_AQD_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_AQD_BUILDINGS',		32,			2,				2,				'UC_AQD_Buildings32.dds'),
		('ICON_ATLAS_JNR_UC_AQD_BUILDINGS',		38,			2,				2,				'UC_AQD_Buildings38.dds'),
		('ICON_ATLAS_JNR_UC_AQD_BUILDINGS',		50,			2,				2,				'UC_AQD_Buildings50.dds'),
		('ICON_ATLAS_JNR_UC_AQD_BUILDINGS',		80,			2,				2,				'UC_AQD_Buildings80.dds'),
		('ICON_ATLAS_JNR_UC_AQD_BUILDINGS',		128,		2,				2,				'UC_AQD_Buildings128.dds'),
		('ICON_ATLAS_JNR_UC_AQD_BUILDINGS',		256,		2,				2,				'UC_AQD_Buildings256.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,										Atlas,								'Index')
VALUES	('ICON_BUILDING_JNR_ORCHARD',				'ICON_ATLAS_JNR_UC_AQD_BUILDINGS',	0),
		('ICON_BUILDING_JNR_HAMMER_WORKS',			'ICON_ATLAS_JNR_UC_AQD_BUILDINGS',	1),
		('ICON_BUILDING_JNR_BATHHOUSE',				'ICON_ATLAS_JNR_UC_AQD_BUILDINGS',	2),

		('ICON_BUILDING_JNR_ORCHARD_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			7),
		('ICON_BUILDING_JNR_HAMMER_WORKS_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			7),
		('ICON_BUILDING_JNR_BATHHOUSE_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			7),

		('ICON_POLICY_JNR_RESERVOIRS',				'ICON_ATLAS_POLICIES',				0);
--------------------------------------------------------------