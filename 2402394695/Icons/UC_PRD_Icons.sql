-- UC_PRD_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_PRD_BUILDINGS',		32,			4,				4,				'UC_PRD_Buildings32.dds'),
		('ICON_ATLAS_JNR_UC_PRD_BUILDINGS',		38,			4,				4,				'UC_PRD_Buildings38.dds'),
		('ICON_ATLAS_JNR_UC_PRD_BUILDINGS',		50,			4,				4,				'UC_PRD_Buildings50.dds'),
		('ICON_ATLAS_JNR_UC_PRD_BUILDINGS',		80,			4,				4,				'UC_PRD_Buildings80.dds'),
		('ICON_ATLAS_JNR_UC_PRD_BUILDINGS',		128,		4,				4,				'UC_PRD_Buildings128.dds'),
		('ICON_ATLAS_JNR_UC_PRD_BUILDINGS',		256,		4,				4,				'UC_PRD_Buildings256.dds');

		INSERT INTO IconTextureAtlases
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_UC_PRD_PROJECTS',		30,			1,				1,				'UC_PRD_Projects30.dds'),
		('ICON_ATLAS_JNR_UC_PRD_PROJECTS',		32,			1,				1,				'UC_PRD_Projects32.dds'),
		('ICON_ATLAS_JNR_UC_PRD_PROJECTS',		38,			1,				1,				'UC_PRD_Projects38.dds'),
		('ICON_ATLAS_JNR_UC_PRD_PROJECTS',		50,			1,				1,				'UC_PRD_Projects50.dds'),
		('ICON_ATLAS_JNR_UC_PRD_PROJECTS',		80,			1,				1,				'UC_PRD_Projects80.dds'),
		('ICON_ATLAS_JNR_UC_PRD_PROJECTS',		256,		1,				1,				'UC_PRD_Projects256.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,											Atlas,								'Index')
VALUES	('ICON_BUILDING_JNR_MILL_RACE',					'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	7),
		('ICON_BUILDING_WATER_MILL',					'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	0),
		('ICON_BUILDING_JNR_WIND_MILL',					'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	1),
		('ICON_BUILDING_WORKSHOP',						'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	2),
		('ICON_BUILDING_JNR_MANUFACTURY',				'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	3),
		('ICON_BUILDING_FACTORY',						'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	4),
		('ICON_BUILDING_JNR_CHEMICAL',					'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	5),
		('ICON_BUILDING_JNR_FREIGHT_YARD',				'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	6),
		('ICON_BUILDING_JNR_MODE_MACHINES',				'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	8),
		('ICON_BUILDING_JNR_MODE_FERTILIZERS',			'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	9),
		('ICON_BUILDING_JNR_MODE_ELECTRONICS',			'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	10),
		('ICON_BUILDING_JNR_MODE_SOUVENIRS',			'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	11),
		('ICON_BUILDING_JNR_MODE_PHARMA',				'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	12),
		('ICON_BUILDING_JNR_MODE_PLASTICS',				'ICON_ATLAS_JNR_UC_PRD_BUILDINGS',	13),

		('ICON_BUILDING_JNR_MILL_RACE_FOW',				'ICON_ATLAS_BUILDINGS_FOW',			7),
		('ICON_BUILDING_WATER_MILL_FOW',				'ICON_ATLAS_BUILDINGS_FOW',			7),
		('ICON_BUILDING_JNR_WIND_MILL_FOW',				'ICON_ATLAS_BUILDINGS_FOW',			7),
		('ICON_BUILDING_JNR_MANUFACTURY_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			20),
		('ICON_BUILDING_FACTORY_FOW',					'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_CHEMICAL_FOW',				'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_FREIGHT_YARD_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			32),
		('ICON_BUILDING_JNR_MODE_MACHINES_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_MODE_FERTILIZERS_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_MODE_ELECTRONICS_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_MODE_SOUVENIRS_FOW',		'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_MODE_PHARMA_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			26),
		('ICON_BUILDING_JNR_MODE_PLASTICS_FOW',			'ICON_ATLAS_BUILDINGS_FOW',			26),

		('ICON_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	'ICON_ATLAS_JNR_UC_PRD_PROJECTS',	0);
--------------------------------------------------------------