-- UC_AQD_Bonuses
-- Author: JNR
--------------------------------------------------------------

-- Building_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_YieldChanges
		(BuildingType,					YieldType,			YieldChange)
VALUES	('BUILDING_JNR_ORCHARD',		'YIELD_FOOD',		2),
		('BUILDING_JNR_HAMMER_WORKS',	'YIELD_SCIENCE',	2),
		('BUILDING_JNR_BATHHOUSE',		'YIELD_CULTURE',	2);
--------------------------------------------------------------

-- Building_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_CitizenYieldChanges
		(BuildingType,					YieldType,			YieldChange)
VALUES	('BUILDING_JNR_ORCHARD',		'YIELD_FOOD',		2),
		('BUILDING_JNR_ORCHARD',		'YIELD_GOLD',		2),
		('BUILDING_JNR_HAMMER_WORKS',	'YIELD_SCIENCE',	1),
		('BUILDING_JNR_HAMMER_WORKS',	'YIELD_PRODUCTION',	1),
		('BUILDING_JNR_BATHHOUSE',		'YIELD_CULTURE',	1),
		('BUILDING_JNR_BATHHOUSE',		'YIELD_FAITH',		1),
		('BUILDING_SEWER',				'YIELD_FOOD',		1);
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_JNR_PLAYER_CITY_DISTRICT_ADJACENCY',		'KIND_MODIFIER'),
		('MODIFIER_ADJUST_AMENITIES_IN_DISTRICT',			'KIND_MODIFIER'),
		('MODIFIER_JNR_PLAYER_CITY_ADJUST_WATER_HOUSING',	'KIND_MODIFIER'),
		('ABILITY_JNR_HARDENED_STEEL',						'KIND_ABILITY');
--------------------------------------------------------------

-- UnitAbilities
--------------------------------------------------------------
INSERT OR IGNORE INTO UnitAbilities
		(UnitAbilityType,				Name,									Description,									Inactive)
VALUES	('ABILITY_JNR_HARDENED_STEEL',	'LOC_ABILITY_JNR_HARDENED_STEEL_NAME',	'LOC_ABILITY_JNR_HARDENED_STEEL_DESCRIPTION',	1);
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,										CollectionType,				EffectType)
VALUES	('MODIFIER_JNR_PLAYER_CITY_DISTRICT_ADJACENCY',		'COLLECTION_OWNER_CITY',	'EFFECT_DISTRICT_ADJACENCY'),
		('MODIFIER_ADJUST_AMENITIES_IN_DISTRICT',			'COLLECTION_OWNER',			'EFFECT_ADJUST_DISTRICT_AMENITY'),
		('MODIFIER_JNR_PLAYER_CITY_ADJUST_WATER_HOUSING',	'COLLECTION_OWNER_CITY',	'EFFECT_ADJUST_WATER_HOUSING');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,											SubjectRequirementSetId)
VALUES	('JNR_AQUEDUCT_CONSTRUCTION_COST_ORCHARD',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION',		'AQUEDUCT_DISCOUNT_ORCHARD_REQUIREMENTS_JNR'),			-- District
		('JNR_AQUEDUCT_CONSTRUCTION_COST_HAMMER_WORKS',	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION',		'AQUEDUCT_DISCOUNT_HAMMER_WORKS_REQUIREMENTS_JNR'),		-- District
		('JNR_AQUEDUCT_CONSTRUCTION_COST_BATHHOUSE',	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION',		'AQUEDUCT_DISCOUNT_BATHHOUSE_REQUIREMENTS_JNR'),		-- District
		('JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'ADJACENT_PLOT_HAS_FOOD_IMPROVEMENT_JNR'),				-- District
		('JNR_HAMMER_WORKS_PRODUCTION_DEFAULT',			'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',	'BUILDING_IS_HAMMER_WORKS_JNR'),						-- District
		('JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY',		'MODIFIER_JNR_PLAYER_CITY_DISTRICT_ADJACENCY',			NULL),													-- Building
		('JNR_HAMMER_WORKS_ENABLE_HARDENED_STEEL',		'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	NULL),													-- Building
		('JNR_HAMMER_WORKS_POWER_MODERN',				'MODIFIER_SINGLE_CITY_ADJUST_FREE_POWER',				'PLAYER_IS_MODERN_ERA_JNR'),							-- Building
		('JNR_HARDENED_STEEL_COMBAT_STRENGTH',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',					NULL),													-- Ability
		('JNR_BATHHOUSE_FAITH_POPULATION_5',			'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_5_JNR'),							-- Building
		('JNR_BATHHOUSE_FAITH_POPULATION_10',			'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_10_JNR'),							-- Building
		('JNR_BATHHOUSE_FAITH_POPULATION_15',			'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_15_JNR'),							-- Building
		('JNR_BATHHOUSE_FAITH_POPULATION_20',			'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_20_JNR'),							-- Building
		('JNR_BATHHOUSE_FAITH_POPULATION_25',			'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_25_JNR'),							-- Building
		('JNR_BATHHOUSE_FAITH_POPULATION_30',			'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_30_JNR'),							-- Building
		('JNR_BATHHOUSE_FAITH_GEOTHERMAL_FISSURE',		'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_30_JNR'),							-- Building
		('JNR_BATHHOUSE_GOLD_GEOTHERMAL_FISSURE',		'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_30_JNR'),							-- Building
		('JNR_BATHHOUSE_CULTURE_GEOTHERMAL_FISSURE',	'MODIFIER_BUILDING_YIELD_CHANGE',						'REQUIRES_POPULATION_30_JNR'),							-- Building
		('JNR_SEWER_GOLD_PENALTY_DISTRICTS',			'MODIFIER_BUILDING_YIELD_CHANGE',						NULL),													-- District
		('JNR_SEWER_HOUSING_DISTRICTS',					'MODIFIER_JNR_PLAYER_CITY_ADJUST_WATER_HOUSING',		'BUILDING_IS_AQUEDUCT_TIER2_JNR'),						-- District
		('JNR_ORCHARD_POWER_FUTURE',					'MODIFIER_SINGLE_CITY_ADJUST_FREE_POWER',				'PLAYER_IS_FUTURE_ERA_JNR'),							-- Building
		('JNR_HAMMER_WORKS_POWER_FUTURE',				'MODIFIER_SINGLE_CITY_ADJUST_FREE_POWER',				'PLAYER_IS_FUTURE_ERA_JNR'),							-- Building
		('JNR_BATHHOUSE_POWER_FUTURE',					'MODIFIER_SINGLE_CITY_ADJUST_FREE_POWER',				'PLAYER_IS_FUTURE_ERA_JNR'),							-- Building
		('JNR_SEWER_POWER_FUTURE',						'MODIFIER_SINGLE_CITY_ADJUST_FREE_POWER',				'PLAYER_IS_FUTURE_ERA_JNR');							-- Building

UPDATE Modifiers SET OwnerRequirementSetId='BUILDING_IS_ORCHARD_JNR'	WHERE ModifierId='JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE';
UPDATE Modifiers SET Permanent=1										WHERE ModifierId='JNR_HAMMER_WORKS_ENABLE_HARDENED_STEEL';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
VALUES	('JNR_AQUEDUCT_CONSTRUCTION_COST_ORCHARD',		'BuildingType',		'BUILDING_JNR_ORCHARD'),
		('JNR_AQUEDUCT_CONSTRUCTION_COST_ORCHARD',		'Amount',			50),
		('JNR_AQUEDUCT_CONSTRUCTION_COST_HAMMER_WORKS',	'BuildingType',		'BUILDING_JNR_HAMMER_WORKS'),
		('JNR_AQUEDUCT_CONSTRUCTION_COST_HAMMER_WORKS',	'Amount',			50),
		('JNR_AQUEDUCT_CONSTRUCTION_COST_BATHHOUSE',	'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_AQUEDUCT_CONSTRUCTION_COST_BATHHOUSE',	'Amount',			50),
		('JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE',		'YieldType',		'YIELD_GOLD'),
		('JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE',		'Amount',			1),
		('JNR_HAMMER_WORKS_PRODUCTION_DEFAULT',			'YieldType',		'YIELD_PRODUCTION'),
		('JNR_HAMMER_WORKS_PRODUCTION_DEFAULT',			'Amount',			1),
		('JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY',		'DistrictType',		'DISTRICT_AQUEDUCT'),
		('JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY',		'YieldType',		'YIELD_PRODUCTION'),
		('JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY',		'Amount',			1),
		('JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY',		'TilesRequired',	2),
		('JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY',		'Description',		'LOC_DISTRICT_DISTRICT_1_PRODUCTION'),
		('JNR_HAMMER_WORKS_POWER_MODERN',				'SourceType',		'FREE_POWER_SOURCE_WATER'),
		('JNR_HAMMER_WORKS_POWER_MODERN',				'Amount',			1),
		('JNR_HAMMER_WORKS_ENABLE_HARDENED_STEEL',		'AbilityType',		'ABILITY_JNR_HARDENED_STEEL'),
		('JNR_HARDENED_STEEL_COMBAT_STRENGTH',			'Amount',			2),
		('JNR_BATHHOUSE_FAITH_POPULATION_5',			'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_BATHHOUSE_FAITH_POPULATION_5',			'YieldType',		'YIELD_FAITH'),
		('JNR_BATHHOUSE_FAITH_POPULATION_5',			'Amount',			1),
		('JNR_BATHHOUSE_FAITH_POPULATION_10',			'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_BATHHOUSE_FAITH_POPULATION_10',			'YieldType',		'YIELD_FAITH'),
		('JNR_BATHHOUSE_FAITH_POPULATION_10',			'Amount',			1),
		('JNR_BATHHOUSE_FAITH_POPULATION_15',			'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_BATHHOUSE_FAITH_POPULATION_15',			'YieldType',		'YIELD_FAITH'),
		('JNR_BATHHOUSE_FAITH_POPULATION_15',			'Amount',			1),
		('JNR_BATHHOUSE_FAITH_POPULATION_20',			'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_BATHHOUSE_FAITH_POPULATION_20',			'YieldType',		'YIELD_FAITH'),
		('JNR_BATHHOUSE_FAITH_POPULATION_20',			'Amount',			1),
		('JNR_BATHHOUSE_FAITH_POPULATION_25',			'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_BATHHOUSE_FAITH_POPULATION_25',			'YieldType',		'YIELD_FAITH'),
		('JNR_BATHHOUSE_FAITH_POPULATION_25',			'Amount',			1),
		('JNR_BATHHOUSE_FAITH_POPULATION_30',			'BuildingType',		'BUILDING_JNR_BATHHOUSE'),
		('JNR_BATHHOUSE_FAITH_POPULATION_30',			'YieldType',		'YIELD_FAITH'),
		('JNR_BATHHOUSE_FAITH_POPULATION_30',			'Amount',			1),
		('JNR_SEWER_GOLD_PENALTY_DISTRICTS',			'BuildingType',		'BUILDING_SEWER'),
		('JNR_SEWER_GOLD_PENALTY_DISTRICTS',			'YieldType',		'YIELD_GOLD'),
		('JNR_SEWER_GOLD_PENALTY_DISTRICTS',			'Amount',			-1),
		('JNR_SEWER_HOUSING_DISTRICTS',					'Amount',			1),
		('JNR_ORCHARD_POWER_FUTURE',					'SourceType',		'FREE_POWER_SOURCE_SOLAR'),
		('JNR_ORCHARD_POWER_FUTURE',					'Amount',			1),
		('JNR_HAMMER_WORKS_POWER_FUTURE',				'SourceType',		'FREE_POWER_SOURCE_WATER'),
		('JNR_HAMMER_WORKS_POWER_FUTURE',				'Amount',			1),
		('JNR_BATHHOUSE_POWER_FUTURE',					'SourceType',		'FREE_POWER_SOURCE_GEOTHERMAL'),
		('JNR_BATHHOUSE_POWER_FUTURE',					'Amount',			1),
		('JNR_SEWER_POWER_FUTURE',						'SourceType',		'FREE_POWER_SOURCE_GEOTHERMAL'),
		('JNR_SEWER_POWER_FUTURE',						'Amount',			1);
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
VALUES	('DISTRICT_AQUEDUCT',	'JNR_AQUEDUCT_CONSTRUCTION_COST_ORCHARD'),
		('DISTRICT_AQUEDUCT',	'JNR_AQUEDUCT_CONSTRUCTION_COST_HAMMER_WORKS'),
		('DISTRICT_AQUEDUCT',	'JNR_AQUEDUCT_CONSTRUCTION_COST_BATHHOUSE'),
		('DISTRICT_AQUEDUCT',	'JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE'),
		('DISTRICT_AQUEDUCT',	'JNR_HAMMER_WORKS_PRODUCTION_DEFAULT');

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	DistrictType,			'JNR_SEWER_GOLD_PENALTY_DISTRICTS'
FROM	Districts
WHERE	RequiresPopulation=1;

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	DistrictType,			'JNR_SEWER_HOUSING_DISTRICTS'
FROM	Districts
WHERE	RequiresPopulation=1;

-- Uniques

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'JNR_AQUEDUCT_CONSTRUCTION_COST_ORCHARD'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'JNR_AQUEDUCT_CONSTRUCTION_COST_HAMMER_WORKS'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'JNR_AQUEDUCT_CONSTRUCTION_COST_BATHHOUSE'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'JNR_HAMMER_WORKS_PRODUCTION_DEFAULT'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
VALUES	('BUILDING_JNR_HAMMER_WORKS',	'JNR_HAMMER_WORKS_PRODUCTION_ADJACENCY'),
		('BUILDING_JNR_HAMMER_WORKS',	'JNR_HAMMER_WORKS_ENABLE_HARDENED_STEEL'),
		('BUILDING_JNR_HAMMER_WORKS',	'JNR_HAMMER_WORKS_POWER_MODERN'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_FAITH_POPULATION_5'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_FAITH_POPULATION_10'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_FAITH_POPULATION_15'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_FAITH_POPULATION_20'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_FAITH_POPULATION_25'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_FAITH_POPULATION_30'),
		('BUILDING_JNR_ORCHARD',		'JNR_ORCHARD_POWER_FUTURE'),
		('BUILDING_JNR_HAMMER_WORKS',	'JNR_HAMMER_WORKS_POWER_FUTURE'),
		('BUILDING_JNR_BATHHOUSE',		'JNR_BATHHOUSE_POWER_FUTURE'),
		('BUILDING_SEWER',				'JNR_SEWER_POWER_FUTURE');
--------------------------------------------------------------

-- UnitAbilityModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO UnitAbilityModifiers
		(UnitAbilityType,				ModifierId)
VALUES	('ABILITY_JNR_HARDENED_STEEL',	'JNR_HARDENED_STEEL_COMBAT_STRENGTH');
--------------------------------------------------------------

-- TypeTags
--------------------------------------------------------------
INSERT OR IGNORE INTO TypeTags
		(Type,							Tag)
SELECT	'ABILITY_JNR_HARDENED_STEEL',	Tag
FROM	TypeTags
WHERE	Type='ABILITY_FASCISM_ATTACK_BUFF';
--------------------------------------------------------------