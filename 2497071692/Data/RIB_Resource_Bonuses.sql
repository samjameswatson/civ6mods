-- RIB_Resource_Bonuses
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,														SubjectRequirementSetId)
VALUES	('JNR_RIB_CATTLE_PRODUCTION_FARMS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_CATTLE_REQUIREMENTS_JNR'),
		('JNR_RIB_COPPER_UNIT_PRODUCTION',				'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION_MODIFIER',			'CITY_HAS_RIB_COPPER_REQUIREMENTS_JNR'),
		('JNR_RIB_COPPER_PROJECT_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_ALL_PROJECTS_PRODUCTION',			'CITY_HAS_RIB_COPPER_REQUIREMENTS_JNR'),
		('JNR_RIB_STONE_BUILDING_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION_MODIFIER',		'CITY_HAS_RIB_STONE_REQUIREMENTS_JNR'),
		('JNR_RIB_MAIZE_FOOD_FOREST_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_MAIZE_REQUIREMENTS_JNR'),
		('JNR_RIB_MAIZE_FOOD_JUNGLE_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_MAIZE_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_FOOD_PLAINS_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_FOOD_PLAINS_HILLS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_PRODUCTION_GRASS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_PRODUCTION_GRASS_HILLS_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_GOLD_PLAINS_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_GOLD_PLAINS_HILLS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_GOLD_GRASS_ATTACH',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),
		('JNR_RIB_BISON_GOLD_GRASS_HILLS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'CITY_HAS_RIB_BISON_REQUIREMENTS_JNR'),

		('JNR_RIB_CATTLE_PRODUCTION_FARMS',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_FARM_ADJACENT_TO_PASTURE_JNR'),
		('JNR_RIB_MAIZE_FOOD_FOREST',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_FOREST_ADJACENT_TO_FARM_JNR'),
		('JNR_RIB_MAIZE_FOOD_JUNGLE',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_JUNGLE_ADJACENT_TO_FARM_JNR'),
		('JNR_RIB_PEAT_IRON',							'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION',			'PEAT_IRON_REQUIREMENT_JNR'),
		('JNR_RIB_PEAT_COAL',							'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION',			'PEAT_COAL_REQUIREMENT_JNR'),
		('JNR_RIB_BISON_FOOD_PLAINS',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_JNR'),
		('JNR_RIB_BISON_FOOD_PLAINS_HILLS',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_HILLS_JNR'),
		('JNR_RIB_BISON_PRODUCTION_GRASS',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_JNR'),
		('JNR_RIB_BISON_PRODUCTION_GRASS_HILLS',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_HILLS_JNR'),
		('JNR_RIB_BISON_GOLD_PLAINS',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_JNR'),
		('JNR_RIB_BISON_GOLD_PLAINS_HILLS',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_HILLS_JNR'),
		('JNR_RIB_BISON_GOLD_GRASS',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_JNR'),
		('JNR_RIB_BISON_GOLD_GRASS_HILLS',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_HILLS_JNR');

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,												SubjectRequirementSetId)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || DistrictType,			'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS',	'CITY_HAS_RIB_DEER_REQUIREMENTS_JNR'
FROM	Districts
WHERE	RequiresPopulation=1;

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,												SubjectRequirementSetId)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || DistrictType,			'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS',	'CITY_HAS_RIB_DEER_REQUIREMENTS_JNR'
FROM	Districts
WHERE	DistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_NEIGHBORHOOD');

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,												SubjectRequirementSetId)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || CivUniqueDistrictType,	'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS',	'CITY_HAS_RIB_DEER_REQUIREMENTS_JNR'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_NEIGHBORHOOD');

UPDATE Modifiers SET OwnerRequirementSetId='CITY_HAS_INDUSTRIAL_ZONE_JNR' WHERE ModifierId='JNR_RIB_PEAT_COAL';
-------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
VALUES	('JNR_RIB_CATTLE_PRODUCTION_FARMS_ATTACH',		'ModifierId',		'JNR_RIB_CATTLE_PRODUCTION_FARMS'),
		('JNR_RIB_MAIZE_FOOD_FOREST_ATTACH',			'ModifierId',		'JNR_RIB_MAIZE_FOOD_FOREST'),
		('JNR_RIB_MAIZE_FOOD_JUNGLE_ATTACH',			'ModifierId',		'JNR_RIB_MAIZE_FOOD_JUNGLE'),
		('JNR_RIB_BISON_FOOD_PLAINS_ATTACH',			'ModifierId',		'JNR_RIB_BISON_FOOD_PLAINS'),
		('JNR_RIB_BISON_FOOD_PLAINS_HILLS_ATTACH',		'ModifierId',		'JNR_RIB_BISON_FOOD_PLAINS_HILLS'),
		('JNR_RIB_BISON_PRODUCTION_GRASS_ATTACH',		'ModifierId',		'JNR_RIB_BISON_PRODUCTION_GRASS'),
		('JNR_RIB_BISON_PRODUCTION_GRASS_HILLS_ATTACH',	'ModifierId',		'JNR_RIB_BISON_PRODUCTION_GRASS_HILLS'),
		('JNR_RIB_BISON_GOLD_PLAINS_ATTACH',			'ModifierId',		'JNR_RIB_BISON_GOLD_PLAINS'),
		('JNR_RIB_BISON_GOLD_PLAINS_HILLS_ATTACH',		'ModifierId',		'JNR_RIB_BISON_GOLD_PLAINS_HILLS'),
		('JNR_RIB_BISON_GOLD_GRASS_ATTACH',				'ModifierId',		'JNR_RIB_BISON_GOLD_GRASS'),
		('JNR_RIB_BISON_GOLD_GRASS_HILLS_ATTACH',		'ModifierId',		'JNR_RIB_BISON_GOLD_GRASS_HILLS'),
		
		('JNR_RIB_CATTLE_PRODUCTION_FARMS',				'YieldType',		'YIELD_PRODUCTION'),
		('JNR_RIB_CATTLE_PRODUCTION_FARMS',				'Amount',			1),
		('JNR_RIB_COPPER_UNIT_PRODUCTION',				'Amount',			15),
		('JNR_RIB_COPPER_PROJECT_PRODUCTION',			'Amount',			15),
		('JNR_RIB_STONE_BUILDING_PRODUCTION',			'Amount',			10),
		('JNR_RIB_MAIZE_FOOD_FOREST',					'YieldType',		'YIELD_FOOD'),
		('JNR_RIB_MAIZE_FOOD_FOREST',					'Amount',			1),
		('JNR_RIB_MAIZE_FOOD_JUNGLE',					'YieldType',		'YIELD_FOOD'),
		('JNR_RIB_MAIZE_FOOD_JUNGLE',					'Amount',			1),
		('JNR_RIB_PEAT_IRON',							'ResourceType',		'RESOURCE_IRON'),
		('JNR_RIB_PEAT_IRON',							'Amount',			1),
		('JNR_RIB_PEAT_COAL',							'ResourceType',		'RESOURCE_COAL'),
		('JNR_RIB_PEAT_COAL',							'Amount',			1),
		('JNR_RIB_BISON_FOOD_PLAINS',					'YieldType',		'YIELD_FOOD'),
		('JNR_RIB_BISON_FOOD_PLAINS',					'Amount',			1),
		('JNR_RIB_BISON_FOOD_PLAINS_HILLS',				'YieldType',		'YIELD_FOOD'),
		('JNR_RIB_BISON_FOOD_PLAINS_HILLS',				'Amount',			1),
		('JNR_RIB_BISON_PRODUCTION_GRASS',				'YieldType',		'YIELD_PRODUCTION'),
		('JNR_RIB_BISON_PRODUCTION_GRASS',				'Amount',			1),
		('JNR_RIB_BISON_PRODUCTION_GRASS_HILLS',		'YieldType',		'YIELD_PRODUCTION'),
		('JNR_RIB_BISON_PRODUCTION_GRASS_HILLS',		'Amount',			1),
		('JNR_RIB_BISON_GOLD_PLAINS',					'YieldType',		'YIELD_GOLD'),
		('JNR_RIB_BISON_GOLD_PLAINS',					'Amount',			1),
		('JNR_RIB_BISON_GOLD_PLAINS_HILLS',				'YieldType',		'YIELD_GOLD'),
		('JNR_RIB_BISON_GOLD_PLAINS_HILLS',				'Amount',			1),
		('JNR_RIB_BISON_GOLD_GRASS',					'YieldType',		'YIELD_GOLD'),
		('JNR_RIB_BISON_GOLD_GRASS',					'Amount',			1),
		('JNR_RIB_BISON_GOLD_GRASS_HILLS',				'YieldType',		'YIELD_GOLD'),
		('JNR_RIB_BISON_GOLD_GRASS_HILLS',				'Amount',			1);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || DistrictType,			'FeatureType',	'FEATURE_FOREST'
FROM	Districts
WHERE	RequiresPopulation=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || DistrictType,			'FeatureType',	'FEATURE_FOREST'
FROM	Districts
WHERE	DistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_NEIGHBORHOOD');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || CivUniqueDistrictType,	'FeatureType',	'FEATURE_FOREST'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_NEIGHBORHOOD');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || DistrictType,			'DistrictType',	DistrictType
FROM	Districts
WHERE	RequiresPopulation=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || DistrictType,			'DistrictType',	DistrictType
FROM	Districts
WHERE	DistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_NEIGHBORHOOD');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)	
SELECT	'JNR_RIB_DEER_FOREST_VALID_' || CivUniqueDistrictType,	'DistrictType',	CivUniqueDistrictType
FROM	DistrictReplaces
WHERE	ReplacesDistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_NEIGHBORHOOD');
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,									RequirementType)
VALUES	('REQUIRES_PLOT_ADJACENT_TO_PASTURE_JNR',		'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES'),
		('REQUIRES_PLOT_HAS_NO_FEATURE_JNR',			'REQUIREMENT_PLOT_HAS_ANY_FEATURE'),
		('REQUIRES_PLOT_IS_PLAINS_FLAT_TERRAIN_JNR',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES'),
		('REQUIRES_PLOT_IS_GRASS_FLAT_TERRAIN_JNR',		'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES');

UPDATE Requirements SET Inverse=1 WHERE RequirementId='REQUIRES_PLOT_HAS_NO_FEATURE_JNR';
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,									Name,				Value)
VALUES	('REQUIRES_PLOT_ADJACENT_TO_PASTURE_JNR',		'ImprovementType',	'IMPROVEMENT_PASTURE'),
		('REQUIRES_PLOT_IS_PLAINS_FLAT_TERRAIN_JNR',	'TerrainType',		'TERRAIN_PLAINS'),
		('REQUIRES_PLOT_IS_GRASS_FLAT_TERRAIN_JNR',		'TerrainType',		'TERRAIN_GRASS');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('PLOT_IS_FARM_ADJACENT_TO_PASTURE_JNR',			'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_FOREST_ADJACENT_TO_FARM_JNR',				'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_JUNGLE_ADJACENT_TO_FARM_JNR',				'REQUIREMENTSET_TEST_ALL'),
		('PEAT_IRON_REQUIREMENT_JNR',						'REQUIREMENTSET_TEST_ALL'),
		('PEAT_COAL_REQUIREMENT_JNR',						'REQUIREMENTSET_TEST_ALL'),
		('CITY_HAS_INDUSTRIAL_ZONE_JNR',					'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_HILLS_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_HILLS_JNR',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('PLOT_IS_FARM_ADJACENT_TO_PASTURE_JNR',			'REQUIRES_PLOT_HAS_FARM'),
		('PLOT_IS_FARM_ADJACENT_TO_PASTURE_JNR',			'REQUIRES_PLOT_ADJACENT_TO_PASTURE_JNR'),
		('PLOT_IS_FOREST_ADJACENT_TO_FARM_JNR',				'PLOT_IS_FOREST_REQUIREMENT'),
		('PLOT_IS_FOREST_ADJACENT_TO_FARM_JNR',				'REQUIRES_PLOT_ADJACENT_TO_FARM'),
		('PLOT_IS_JUNGLE_ADJACENT_TO_FARM_JNR',				'PLOT_IS_JUNGLE_REQUIREMENT'),
		('PLOT_IS_JUNGLE_ADJACENT_TO_FARM_JNR',				'REQUIRES_PLOT_ADJACENT_TO_FARM'),
		('PEAT_IRON_REQUIREMENT_JNR',						'REQUIRES_PLAYER_CAN_SEE_IRON'),
		('PEAT_COAL_REQUIREMENT_JNR',						'REQUIRES_PLAYER_CAN_SEE_COAL'),
		('CITY_HAS_INDUSTRIAL_ZONE_JNR',					'REQUIRES_CITY_HAS_INDUSTRIAL_ZONE'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_JNR',		'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_JNR',		'REQUIRES_PLOT_HAS_NO_FEATURE_JNR'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_JNR',		'REQUIRES_PLOT_IS_PLAINS_FLAT_TERRAIN_JNR'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_HILLS_JNR',	'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_HILLS_JNR',	'REQUIRES_PLOT_HAS_NO_FEATURE_JNR'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_PLAINS_HILLS_JNR',	'PLOT_IS_PLAINS_HILLS_TERRAIN_REQUIREMENT'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_JNR',		'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_JNR',		'REQUIRES_PLOT_HAS_NO_FEATURE_JNR'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_JNR',		'REQUIRES_PLOT_IS_GRASS_FLAT_TERRAIN_JNR'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_HILLS_JNR',	'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_HILLS_JNR',	'REQUIRES_PLOT_HAS_NO_FEATURE_JNR'),
		('PLOT_IS_UNIMPROVED_FEATURELESS_GRASS_HILLS_JNR',	'PLOT_IS_GRASS_HILLS_TERRAIN_REQUIREMENT');
--------------------------------------------------------------