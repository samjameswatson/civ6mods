-- UC_REL_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_REL_BUILDINGS',		32,			4,				2,				'UC_REL_Buildings32.dds'),
		('ICON_ATLAS_JNR_UC_REL_BUILDINGS',		38,			4,				2,				'UC_REL_Buildings38.dds'),
		('ICON_ATLAS_JNR_UC_REL_BUILDINGS',		50,			4,				2,				'UC_REL_Buildings50.dds'),
		('ICON_ATLAS_JNR_UC_REL_BUILDINGS',		80,			4,				2,				'UC_REL_Buildings80.dds'),
		('ICON_ATLAS_JNR_UC_REL_BUILDINGS',		128,		4,				2,				'UC_REL_Buildings128.dds'),
		('ICON_ATLAS_JNR_UC_REL_BUILDINGS',		256,		4,				2,				'UC_REL_Buildings256.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,								Atlas,								'Index')
VALUES	('ICON_BUILDING_JNR_ALTAR',			'ICON_ATLAS_JNR_UC_REL_BUILDINGS',	1),
		('ICON_BUILDING_TEMPLE',			'ICON_ATLAS_JNR_UC_REL_BUILDINGS',	2),
		('ICON_BUILDING_JNR_MONASTERY',		'ICON_ATLAS_JNR_UC_REL_BUILDINGS',	3),
		('ICON_BUILDING_JNR_HOSPITIUM',		'ICON_ATLAS_JNR_UC_REL_BUILDINGS',	4),
		('ICON_BUILDING_JNR_GARDEN',		'ICON_ATLAS_JNR_UC_REL_BUILDINGS',	5),

		('ICON_BUILDING_JNR_ALTAR_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			5),
		('ICON_BUILDING_JNR_MONASTERY_FOW',	'ICON_ATLAS_BUILDINGS_FOW',			14),
		('ICON_BUILDING_JNR_HOSPITIUM_FOW',	'ICON_ATLAS_BUILDINGS_FOW',			14),
		('ICON_BUILDING_JNR_GARDEN_FOW',	'ICON_ATLAS_BUILDINGS_FOW',			14);
--------------------------------------------------------------