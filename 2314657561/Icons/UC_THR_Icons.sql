-- UC_THR_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_THR_BUILDINGS',		32,			4,				4,				'UC_THR_Buildings32.dds'),
		('ICON_ATLAS_JNR_UC_THR_BUILDINGS',		38,			4,				4,				'UC_THR_Buildings38.dds'),
		('ICON_ATLAS_JNR_UC_THR_BUILDINGS',		50,			4,				4,				'UC_THR_Buildings50.dds'),
		('ICON_ATLAS_JNR_UC_THR_BUILDINGS',		80,			4,				4,				'UC_THR_Buildings80.dds'),
		('ICON_ATLAS_JNR_UC_THR_BUILDINGS',		128,		4,				4,				'UC_THR_Buildings128.dds'),
		('ICON_ATLAS_JNR_UC_THR_BUILDINGS',		256,		4,				4,				'UC_THR_Buildings256.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,									Atlas,								'Index')
VALUES	('ICON_BUILDING_AMPHITHEATER',			'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	0),
		('ICON_BUILDING_JNR_ASSEMBLY',			'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	1),
		('ICON_BUILDING_JNR_MANSION',			'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	2),
		('ICON_BUILDING_JNR_CABINET',			'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	3),
		('ICON_BUILDING_JNR_OPERA',				'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	4),
		('ICON_BUILDING_JNR_GRAND_HOTEL',		'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	5),
		('ICON_BUILDING_JNR_MEDIA_CENTER',		'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	7),
		('ICON_BUILDING_MUSEUM_ART',			'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	8),
		('ICON_BUILDING_MUSEUM_ARTIFACT',		'ICON_ATLAS_JNR_UC_THR_BUILDINGS',	9),

		('ICON_BUILDING_AMPHITHEATER_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			16),
		('ICON_BUILDING_JNR_ASSEMBLY_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			16),
		('ICON_BUILDING_JNR_MANSION_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			25),
		('ICON_BUILDING_JNR_CABINET_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			25),
		('ICON_BUILDING_JNR_OPERA_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			25),
		('ICON_BUILDING_JNR_GRAND_HOTEL_FOW',	'ICON_ATLAS_BUILDINGS_FOW',			25),
		('ICON_JNR_MEDIA_CENTER_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			35),
		('ICON_BUILDING_MUSEUM_ART_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			25),
		('ICON_BUILDING_MUSEUM_ARTIFACT_FOW',	'ICON_ATLAS_BUILDINGS_FOW',			25);
--------------------------------------------------------------