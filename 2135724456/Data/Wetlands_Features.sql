-- Wetlands_Tundra_Floods
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,							Kind)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA',	'KIND_FEATURE');
--------------------------------------------------------------

-- Features
--------------------------------------------------------------
INSERT OR IGNORE INTO Features
		(FeatureType,
		RequiresRiver,
		DefenseModifier,
		Appeal,
		AntiquityPriority,
		Name,
		Description)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA',
		1,
		-2,
		-1,
		1,
		'LOC_FEATURE_FLOODPLAINS_TUNDRA_NAME',
		'LOC_FEATURE_FLOODPLAINS_TUNDRA_DESCRIPTION');
--------------------------------------------------------------

-- TypeTags
--------------------------------------------------------------
INSERT OR IGNORE INTO TypeTags
		(Type,							Tag)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA',	'CLASS_FLOODPLAINS');
--------------------------------------------------------------

-- Features_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Features_XP2
		(FeatureType,					ValidWonderPlacement,	ValidDistrictPlacement,	ValidForReplacement)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA',	1,						1,						1);
--------------------------------------------------------------

-- Feature_ValidTerrains
--------------------------------------------------------------
INSERT OR IGNORE INTO Feature_ValidTerrains
		(FeatureType,					TerrainType)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA',	'TERRAIN_TUNDRA');
--------------------------------------------------------------

-- Feature_Floodplains
--------------------------------------------------------------
INSERT OR IGNORE INTO Feature_Floodplains
		(FeatureType)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------

-- Feature_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Feature_YieldChanges
		(FeatureType,					YieldType,		YieldChange)
VALUES	('FEATURE_FLOODPLAINS_TUNDRA',	'YIELD_FOOD',	1);
--------------------------------------------------------------

-- RandomEvent_Yields
--------------------------------------------------------------
INSERT OR IGNORE INTO RandomEvent_Yields
		(RandomEventType,					YieldType,			FeatureType,					Percentage,	ReplaceFeature)
VALUES	('RANDOM_EVENT_FLOOD_MODERATE',		'YIELD_FOOD',		'FEATURE_FLOODPLAINS_TUNDRA',	10,			0),
		('RANDOM_EVENT_FLOOD_MAJOR',		'YIELD_FOOD',		'FEATURE_FLOODPLAINS_TUNDRA',	20,			0),
		('RANDOM_EVENT_FLOOD_MAJOR',		'YIELD_PRODUCTION',	'FEATURE_FLOODPLAINS_TUNDRA',	30,			0),
		('RANDOM_EVENT_FLOOD_1000_YEAR',	'YIELD_FOOD',		'FEATURE_FLOODPLAINS_TUNDRA',	30,			0),
		('RANDOM_EVENT_FLOOD_1000_YEAR',	'YIELD_PRODUCTION',	'FEATURE_FLOODPLAINS_TUNDRA',	40,			0);
--------------------------------------------------------------

-- Building_RequiredFeatures
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_RequiredFeatures
		(BuildingType,				FeatureType)
VALUES	('BUILDING_MONT_ST_MICHEL',	'FEATURE_FLOODPLAINS_TUNDRA'),
		('BUILDING_GREAT_BATH',		'FEATURE_FLOODPLAINS_TUNDRA');
		
INSERT OR IGNORE INTO Building_RequiredFeatures
		(BuildingType,				FeatureType)		
SELECT	BuildingType,				'FEATURE_FLOODPLAINS_TUNDRA'
FROM	Buildings
WHERE	BuildingType='BUILDING_ETEMENANKI';
--------------------------------------------------------------

-- District_RequiredFeatures
--------------------------------------------------------------
INSERT OR IGNORE INTO District_RequiredFeatures
		(DistrictType,		FeatureType)
VALUES	('DISTRICT_DAM',	'FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------

-- Improvement_ValidFeatures
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidFeatures
		(ImprovementType,				FeatureType)
VALUES	('IMPROVEMENT_MOUND',			'FEATURE_FLOODPLAINS_TUNDRA'),
		('IMPROVEMENT_BARBARIAN_CAMP',	'FEATURE_FLOODPLAINS_TUNDRA'),
		('IMPROVEMENT_GOODY_HUT',		'FEATURE_FLOODPLAINS_TUNDRA'),
		('IMPROVEMENT_SPHINX',			'FEATURE_FLOODPLAINS_TUNDRA'),
		('IMPROVEMENT_CHATEAU',			'FEATURE_FLOODPLAINS_TUNDRA'),
		('IMPROVEMENT_ZIGGURAT',		'FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------

-- Etemenanki Yields
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='PLOT_FLOODPLAINS_REQUIREMENTS' WHERE ModifierId='ETEMENANKI_SCIENCE_FLOODPLAINS';
UPDATE Modifiers SET SubjectRequirementSetId='PLOT_FLOODPLAINS_REQUIREMENTS' WHERE ModifierId='ETEMENANKI_PRODUCTION_FLOODPLAINS';

DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_ETEMENANKI' AND ModifierId='ETEMENANKI_SCIENCE_GRASS_FLOODPLAINS';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_ETEMENANKI' AND ModifierId='ETEMENANKI_PRODUCTION_GRASS_FLOODPLAINS';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_ETEMENANKI' AND ModifierId='ETEMENANKI_SCIENCE_PLAINS_FLOODPLAINS';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_ETEMENANKI' AND ModifierId='ETEMENANKI_PRODUCTION_PLAINS_FLOODPLAINS';
--------------------------------------------------------------