-- UC_ENT_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_ENT_BUILDINGS',		32,			3,				2,				'UC_ENT_Buildings32.dds'),
		('ICON_ATLAS_JNR_UC_ENT_BUILDINGS',		38,			3,				2,				'UC_ENT_Buildings38.dds'),
		('ICON_ATLAS_JNR_UC_ENT_BUILDINGS',		50,			3,				2,				'UC_ENT_Buildings50.dds'),
		('ICON_ATLAS_JNR_UC_ENT_BUILDINGS',		80,			3,				2,				'UC_ENT_Buildings80.dds'),
		('ICON_ATLAS_JNR_UC_ENT_BUILDINGS',		128,		3,				2,				'UC_ENT_Buildings128.dds'),
		('ICON_ATLAS_JNR_UC_ENT_BUILDINGS',		256,		3,				2,				'UC_ENT_Buildings256.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,										Atlas,												'Index')
VALUES	('ICON_BUILDING_ARENA',						'ICON_ATLAS_JNR_UC_ENT_BUILDINGS',					0),
		('ICON_BUILDING_JNR_TOURNEY',				'ICON_ATLAS_BUILDINGS',								8),
		('ICON_BUILDING_JNR_BOTANICAL_GARDEN',		'ICON_ATLAS_JNR_UC_ENT_BUILDINGS',					1),
		('ICON_BUILDING_JNR_THEME_PARK',			'ICON_ATLAS_JNR_UC_ENT_BUILDINGS',					2),
		('ICON_BUILDING_JNR_MARINA',				'ICON_ATLAS_JNR_UC_ENT_BUILDINGS',					3),
		('ICON_BUILDING_JNR_CASINO',				'ICON_ATLAS_JNR_UC_ENT_BUILDINGS',					4),
		('ICON_BUILDING_JNR_FOOD_COURT',			'ICON_ATLAS_JNR_UC_ENT_BUILDINGS',					5),

		('ICON_BUILDING_ARENA_FOW',					'ICON_ATLAS_BUILDINGS_FOW',							8),
		('ICON_BUILDING_JNR_TOURNEY_FOW',			'ICON_ATLAS_BUILDINGS_FOW',							8),
		('ICON_BUILDING_JNR_BOTANICAL_GARDEN_FOW',	'ICON_ATLAS_BUILDINGS_FOW',							31),
		('ICON_BUILDING_JNR_THEME_PARK_FOW',		'ICON_ATLAS_BUILDINGS_FOW',							39),
		('ICON_BUILDING_JNR_MARINA_FOW',			'ICON_ATLAS_EXPANSION_1_DISTRICT_BUILDINGS_FOW',	11),
		('ICON_BUILDING_JNR_CASINO_FOW',			'ICON_ATLAS_EXPANSION_1_DISTRICT_BUILDINGS_FOW',	9),
		('ICON_BUILDING_JNR_FOOD_COURT_FOW',		'ICON_ATLAS_EXPANSION_1_DISTRICT_BUILDINGS_FOW',	10);
--------------------------------------------------------------