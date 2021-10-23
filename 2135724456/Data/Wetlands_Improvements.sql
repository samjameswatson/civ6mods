-- Wetlands_Improvements
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,							Kind)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	'KIND_IMPROVEMENT'),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'KIND_IMPROVEMENT'),
		('IMPROVEMENT_JNR_REED_HOME',	'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,
		Name,
		Description,
		Icon,
		PrereqTech,
		Buildable,
		PlunderType,
		PlunderAmount,
		Housing,
		TilesRequired)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',
		'LOC_IMPROVEMENT_JNR_OASIS_FARM_NAME',
		'LOC_IMPROVEMENT_JNR_OASIS_FARM_DESCRIPTION',
		'ICON_IMPROVEMENT_JNR_OASIS_FARM',
		'TECH_IRRIGATION',
		1,
		'PLUNDER_HEAL',
		50,
		1,
		1),
		('IMPROVEMENT_JNR_FLOOD_FARM',
		'LOC_IMPROVEMENT_JNR_FLOOD_FARM_NAME',
		'LOC_IMPROVEMENT_JNR_FLOOD_FARM_DESCRIPTION',
		'ICON_IMPROVEMENT_JNR_FLOOD_FARM',
		'TECH_IRRIGATION',
		1,
		'PLUNDER_HEAL',
		50,
		1,
		2),
		('IMPROVEMENT_JNR_REED_HOME',
		'LOC_IMPROVEMENT_JNR_REED_HOME_NAME',
		'LOC_IMPROVEMENT_JNR_REED_HOME_DESCRIPTION',
		'ICON_IMPROVEMENT_JNR_REED_HOME',
		'TECH_SAILING',
		1,
		'PLUNDER_HEAL',
		50,
		1,
		2);
--------------------------------------------------------------

-- Improvements_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements_XP2
		(ImprovementType,				PreventsDrought,	DisasterResistant)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	1,					0),
		('IMPROVEMENT_JNR_REED_HOME',	0,					1);
--------------------------------------------------------------

-- Improvement_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_YieldChanges
		(ImprovementType,				YieldType,			YieldChange)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	'YIELD_FOOD',		1),
		('IMPROVEMENT_JNR_OASIS_FARM',	'YIELD_PRODUCTION',	0),
		('IMPROVEMENT_JNR_OASIS_FARM',	'YIELD_GOLD',		0),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'YIELD_FOOD',		1),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'YIELD_GOLD',		0),
		('IMPROVEMENT_JNR_REED_HOME',	'YIELD_FOOD',		1),
		('IMPROVEMENT_JNR_REED_HOME',	'YIELD_PRODUCTION',	0);
--------------------------------------------------------------

-- Improvement_BonusYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_BonusYieldChanges
		(Id,	ImprovementType,				YieldType,			BonusYieldChange,	PrereqTech,					PrereqCivic)
VALUES	(1301,	'IMPROVEMENT_JNR_OASIS_FARM',	'YIELD_PRODUCTION',	1,					'TECH_MACHINERY',			NULL),
		(1302,	'IMPROVEMENT_JNR_OASIS_FARM',	'YIELD_FOOD',		1,					'TECH_SCIENTIFIC_THEORY',	NULL),
		(1303,	'IMPROVEMENT_JNR_OASIS_FARM',	'YIELD_GOLD',		2,					NULL,						'CIVIC_GLOBALIZATION'),
		(1304,	'IMPROVEMENT_JNR_FLOOD_FARM',	'YIELD_FOOD',		1,					NULL,						'CIVIC_FEUDALISM'),
		(1305,	'IMPROVEMENT_JNR_REED_HOME',	'YIELD_PRODUCTION',	1,					NULL,						'CIVIC_MERCANTILISM');
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,								Description,	YieldType,		YieldChange,	TilesRequired,	AdjacentImprovement,			PrereqTech)
VALUES	('Flood_Farms_MechanizedAdjacency',	'Placeholder',	'YIELD_FOOD',	1,				1,				'IMPROVEMENT_JNR_FLOOD_FARM',	'TECH_REPLACEABLE_PARTS');
--------------------------------------------------------------

-- Improvement_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,				YieldChangeId)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	'District_Gold'),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'District_Gold'),
		('IMPROVEMENT_FARM',			'Flood_Farms_MechanizedAdjacency'),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'Farms_MechanizedAdjacency'),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'Flood_Farms_MechanizedAdjacency');
--------------------------------------------------------------

-- Improvement_Tourism
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Tourism
		(ImprovementType,				TourismSource,			PrereqTech)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	'TOURISMSOURCE_GOLD',	'TECH_FLIGHT');
--------------------------------------------------------------

-- Improvement_ValidBuildUnits
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidBuildUnits
		(ImprovementType,				UnitType)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	'UNIT_BUILDER'),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'UNIT_BUILDER'),
		('IMPROVEMENT_JNR_REED_HOME',	'UNIT_BUILDER');
--------------------------------------------------------------

-- Improvement_ValidFeatures
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidFeatures
		(ImprovementType,				FeatureType)
VALUES	('IMPROVEMENT_JNR_OASIS_FARM',	'FEATURE_OASIS'),
		('IMPROVEMENT_JNR_FLOOD_FARM',	'FEATURE_FLOODPLAINS'),
		('IMPROVEMENT_JNR_REED_HOME',	'FEATURE_MARSH'),
		('IMPROVEMENT_JNR_REED_HOME',	'FEATURE_FLOODPLAINS_GRASSLAND'),
		('IMPROVEMENT_JNR_REED_HOME',	'FEATURE_FLOODPLAINS_PLAINS'),
		('IMPROVEMENT_JNR_REED_HOME',	'FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------

-- Improvement_ValidResources
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidResources
		(ImprovementType,				ResourceType,			MustRemoveFeature)
VALUES	('IMPROVEMENT_JNR_REED_HOME',	'RESOURCE_JNR_SWAMP',	0);
--------------------------------------------------------------

-- Technologies
-------------------------------------------------------------
UPDATE Technologies	SET Description='LOC_TECH_MACHINERY_DESCRIPTION'			WHERE TechnologyType='TECH_MACHINERY';
-------------------------------------------------------------