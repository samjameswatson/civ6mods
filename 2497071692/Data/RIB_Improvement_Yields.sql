-- RIB_Improvement_Bonuses
-- Author: JNR
--------------------------------------------------------------

-- Improvement_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_YieldChanges
		(ImprovementType,						YieldType,			YieldChange)
VALUES	('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'YIELD_FOOD',		1),
		('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'YIELD_PRODUCTION',	0),
		('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'YIELD_GOLD',		0),
		('IMPROVEMENT_FISHERY',					'YIELD_GOLD',		0),
		('IMPROVEMENT_JNR_WET_FARM',			'YIELD_FOOD',		1),
		('IMPROVEMENT_JNR_CLOTHIER',			'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_JNR_BREWERY',				'YIELD_FOOD',		1),
		('IMPROVEMENT_JNR_BREWERY',				'YIELD_PRODUCTION',	1);

UPDATE Improvement_YieldChanges SET YieldChange=0 WHERE ImprovementType='IMPROVEMENT_FISHERY' AND YieldType='YIELD_FOOD';
--------------------------------------------------------------

-- Improvement_BonusYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_BonusYieldChanges
		(Id,	ImprovementType,						YieldType,			BonusYieldChange,	PrereqTech,					PrereqCivic)
VALUES	(1331,	'IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'YIELD_PRODUCTION',	1,					NULL,						'CIVIC_FEUDALISM'),
		(1332,	'IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'YIELD_FOOD',		1,					'TECH_INDUSTRIALIZATION',	NULL),
		(1333,	'IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'YIELD_GOLD',		2,					NULL,						'CIVIC_ENVIRONMENTALISM');
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,											YieldType,			YieldChange,	TilesRequired,	AdjacentDistrict,						Description,	PrereqCivic)
VALUES	('JNR_Aqueduct_FoodAdjacency',					'YIELD_FOOD',		1,				1,				'DISTRICT_AQUEDUCT',					'Placeholder',	'CIVIC_FEUDALISM'),
		('JNR_Dam_FoodAdjacency',						'YIELD_FOOD',		1,				1,				'DISTRICT_DAM',							'Placeholder',	'CIVIC_FEUDALISM');

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,												 YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict,						Description,	PrereqCivic)
SELECT	'JNR_' || CivUniqueDistrictType || '_FoodAdjacency', 'YIELD_FOOD',	1,				1,				CivUniqueDistrictType,					'Placeholder',	'CIVIC_FEUDALISM'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_DAM');


INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,											YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,					Description)
VALUES	('JNR_Pasture_ProductionAdjacency',				'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_PASTURE',					'Placeholder'),
		('JNR_Farm_HalfProductionAdjacency',			'YIELD_PRODUCTION',	1,				2,				'IMPROVEMENT_FARM',						'Placeholder'),
		('JNR_WetFarm_MechanizedAdjacency',				'YIELD_FOOD',		1,				1,				'IMPROVEMENT_JNR_WET_FARM',				'Placeholder'),
		('JNR_Clothier_ProductionAdjacency',			'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_JNR_CLOTHIER',				'LOC_DISTRICT_JNR_CLOTHIER_PRODUCTION'),
		('JNR_Brewery_ProductionAdjacency',				'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_JNR_BREWERY',				'LOC_DISTRICT_JNR_BREWERY_PRODUCTION'),
		('JNR_Clothier_GoldAdjacency',					'YIELD_GOLD',		1,				1,				'IMPROVEMENT_JNR_CLOTHIER',				'LOC_DISTRICT_JNR_CLOTHIER_GOLD'),
		('JNR_Brewery_GoldAdjacency',					'YIELD_GOLD',		1,				1,				'IMPROVEMENT_JNR_BREWERY',				'LOC_DISTRICT_JNR_BREWERY_GOLD'),
		('JNR_JunglePlantation_ScienceAdjacency',		'YIELD_SCIENCE',	1,				1,				'IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'LOC_DISTRICT_JNR_JUNGLE_PLANTATION_SCIENCE');

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,											YieldType,			YieldChange,	TilesRequired,	AdjacentSeaResource,					Description,	PrereqTech)
VALUES	('Fishery_SeaResourceAdjacency_Plastics',		'YIELD_GOLD',		1,				1,				1,										'Placeholder',	'TECH_PLASTICS');

UPDATE Adjacency_YieldChanges SET PrereqTech='TECH_REPLACEABLE_PARTS' WHERE ID='JNR_WetFarm_MechanizedAdjacency';
--------------------------------------------------------------

-- Improvement_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,					YieldChangeId)
VALUES	('IMPROVEMENT_FISHERY',				'Fishery_SeaResourceAdjacency'),
		('IMPROVEMENT_FISHERY',				'Fishery_SeaResourceAdjacency_Plastics'),
		('IMPROVEMENT_JNR_WET_FARM',		'JNR_Aqueduct_FoodAdjacency'),
		('IMPROVEMENT_JNR_WET_FARM',		'JNR_Dam_FoodAdjacency'),
		('IMPROVEMENT_JNR_WET_FARM',		'JNR_WetFarm_MechanizedAdjacency'),
		('IMPROVEMENT_JNR_WET_FARM',		'Farms_MechanizedAdjacency'),
		('IMPROVEMENT_FARM',				'JNR_WetFarm_MechanizedAdjacency'),
		('IMPROVEMENT_JNR_CLOTHIER',		'JNR_Pasture_ProductionAdjacency'),
		('IMPROVEMENT_JNR_BREWERY',			'JNR_Farm_HalfProductionAdjacency');

INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,					YieldChangeId)
SELECT	'IMPROVEMENT_JNR_WET_FARM',			'JNR_' || CivUniqueDistrictType || '_FoodAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType IN ('DISTRICT_AQUEDUCT', 'DISTRICT_DAM');

INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,					YieldChangeId)
SELECT	'IMPROVEMENT_JNR_WET_FARM',			ID
FROM	Adjacency_YieldChanges
WHERE	ID='Flood_Farms_MechanizedAdjacency';

INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,					YieldChangeId)
SELECT	ImprovementType,					'JNR_WetFarm_MechanizedAdjacency'
FROM	Improvements
WHERE	ImprovementType='IMPROVEMENT_JNR_FLOOD_FARM';
--------------------------------------------------------------

-- District_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
VALUES	('DISTRICT_INDUSTRIAL_ZONE',	'JNR_Clothier_ProductionAdjacency'),
		('DISTRICT_INDUSTRIAL_ZONE',	'JNR_Brewery_ProductionAdjacency'),
		('DISTRICT_COMMERCIAL_HUB',		'JNR_Clothier_GoldAdjacency'),
		('DISTRICT_COMMERCIAL_HUB',		'JNR_Brewery_GoldAdjacency'),
		('DISTRICT_HARBOR',				'JNR_Clothier_GoldAdjacency'),
		('DISTRICT_HARBOR',				'JNR_Brewery_GoldAdjacency');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Clothier_ProductionAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_INDUSTRIAL_ZONE';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Brewery_ProductionAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_INDUSTRIAL_ZONE';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Clothier_GoldAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Brewery_GoldAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Clothier_GoldAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_HARBOR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Brewery_GoldAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_HARBOR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	DistrictType,					'JNR_JunglePlantation_ScienceAdjacency'
FROM	Districts
WHERE	DistrictType='DISTRICT_OBSERVATORY';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,								ModifierType,														SubjectRequirementSetId)
VALUES	('JNR_RIB_FISHERY_GOLD_CRABS',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',							'CITY_HAS_RIB_CRABS_REQUIREMENTS_JNR'),
		('JNR_RIB_FISHERY_FOOD_FISH',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',							'CITY_HAS_RIB_FISH_REQUIREMENTS_JNR'),
		('JNR_RIB_FISHERY_SEALS_PRODUCTION',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',							'CITY_HAS_RIB_SEALS_REQUIREMENTS_JNR'),
		('JNR_RIB_FISHERY_SQUID_FAITH',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',							'CITY_HAS_RIB_SQUID_REQUIREMENTS_JNR'),
		('JNR_RIB_WET_FARM_FOOD_RICE',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',							'CITY_HAS_RIB_RICE_REQUIREMENTS_JNR'),
		('JNR_RIB_WET_FARM_FOOD_FRESH_WATER',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',								'PLOT_HAS_WET_FARM_FRESH_WATER_JNR'),
		('JNR_RIB_CLOTHIER_GOLD_PASTURE',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_HAS_PASTURE_REQUIREMENTS'),
		('JNR_RIB_CLOTHIER_GOLD_PASTURE_ECONOMICS',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_HAS_PASTURE_INDUSTRIALIZATION_JNR'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER1',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	'BUILDING_IS_INDUSTRIAL_TIER1_JNR'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER2',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	'BUILDING_IS_INDUSTRIAL_TIER2_JNR'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER3',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	'BUILDING_IS_INDUSTRIAL_TIER3_JNR'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER4',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	'BUILDING_IS_INDUSTRIAL_TIER4_JNR'),
		('JNR_RIB_BREWERY_GOLD_FARM',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_HAS_RESOURCE_FARM_JNR'),
		('JNR_RIB_BREWERY_GOLD_FARM_ELECTRICITY',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',						'PLOT_HAS_RESOURCE_FARM_REFRIGERATION_JNR'),
		('JNR_RIB_BREWERY_AMENITY',					'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',					'CITY_HAS_RIB_WHEAT_REQUIREMENTS_JNR'),
		('JNR_RIB_CARAVANSERAI_TRADE_ROUTE',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',						'CITY_HAS_RIB_CAMEL_REQUIREMENTS_JNR');

UPDATE Modifiers SET OwnerRequirementSetId='CITY_HAS_RIB_SHEEP_REQUIREMENTS_JNR'		WHERE ModifierId='JNR_RIB_CLOTHIER_GOLD_TRADE_TIER1';
UPDATE Modifiers SET OwnerRequirementSetId='CITY_HAS_RIB_SHEEP_REQUIREMENTS_JNR'		WHERE ModifierId='JNR_RIB_CLOTHIER_GOLD_TRADE_TIER2';
UPDATE Modifiers SET OwnerRequirementSetId='CITY_HAS_RIB_SHEEP_REQUIREMENTS_JNR'		WHERE ModifierId='JNR_RIB_CLOTHIER_GOLD_TRADE_TIER3';
UPDATE Modifiers SET OwnerRequirementSetId='CITY_HAS_RIB_SHEEP_REQUIREMENTS_JNR'		WHERE ModifierId='JNR_RIB_CLOTHIER_GOLD_TRADE_TIER4';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('JNR_RIB_FISHERY_GOLD_CRABS',				'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_FISHERY_GOLD_CRABS',				'Amount',		2),
		('JNR_RIB_FISHERY_FOOD_FISH',				'YieldType',	'YIELD_FOOD'),
		('JNR_RIB_FISHERY_FOOD_FISH',				'Amount',		1),
		('JNR_RIB_FISHERY_SEALS_PRODUCTION',		'YieldType',	'YIELD_PRODUCTION'),
		('JNR_RIB_FISHERY_SEALS_PRODUCTION',		'Amount',		1),
		('JNR_RIB_FISHERY_SQUID_FAITH',				'YieldType',	'YIELD_FAITH'),
		('JNR_RIB_FISHERY_SQUID_FAITH',				'Amount',		1),
		
		('JNR_RIB_WET_FARM_FOOD_RICE',				'YieldType',	'YIELD_FOOD'),
		('JNR_RIB_WET_FARM_FOOD_RICE',				'Amount',		1),
		('JNR_RIB_WET_FARM_FOOD_FRESH_WATER',		'YieldType',	'YIELD_FOOD'),
		('JNR_RIB_WET_FARM_FOOD_FRESH_WATER',		'Amount',		1),

		('JNR_RIB_CLOTHIER_GOLD_PASTURE',			'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_CLOTHIER_GOLD_PASTURE',			'Amount',		1),
		('JNR_RIB_CLOTHIER_GOLD_PASTURE_ECONOMICS',	'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_CLOTHIER_GOLD_PASTURE_ECONOMICS',	'Amount',		1),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER1',		'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER1',		'Amount',		1),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER2',		'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER2',		'Amount',		1),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER3',		'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER3',		'Amount',		1),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER4',		'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_CLOTHIER_GOLD_TRADE_TIER4',		'Amount',		1),

		('JNR_RIB_BREWERY_GOLD_FARM',				'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_BREWERY_GOLD_FARM',				'Amount',		1),
		('JNR_RIB_BREWERY_GOLD_FARM_ELECTRICITY',	'YieldType',	'YIELD_GOLD'),
		('JNR_RIB_BREWERY_GOLD_FARM_ELECTRICITY',	'Amount',		1),
		('JNR_RIB_BREWERY_AMENITY',					'Amount',		1);
--------------------------------------------------------------

-- ImprovementModifiers
--------------------------------------------------------------
DELETE FROM ImprovementModifiers WHERE ImprovementType='IMPROVEMENT_FISHERY' AND ModifierId='FISHERY_GOVERNOR_PRODUCTION';

INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,					ModifierId)
VALUES	('IMPROVEMENT_FISHERY',				'JNR_RIB_FISHERY_GOLD_CRABS'),
		('IMPROVEMENT_FISHERY',				'JNR_RIB_FISHERY_FOOD_FISH'),
		('IMPROVEMENT_JNR_WET_FARM',		'JNR_RIB_WET_FARM_FOOD_RICE'),
		('IMPROVEMENT_JNR_CLOTHIER',		'JNR_RIB_CLOTHIER_GOLD_PASTURE'),
		('IMPROVEMENT_JNR_CLOTHIER',		'JNR_RIB_CLOTHIER_GOLD_PASTURE_ECONOMICS'),
		('IMPROVEMENT_JNR_CLOTHIER',		'JNR_RIB_CLOTHIER_GOLD_TRADE_TIER1'),
		('IMPROVEMENT_JNR_CLOTHIER',		'JNR_RIB_CLOTHIER_GOLD_TRADE_TIER2'),
		('IMPROVEMENT_JNR_CLOTHIER',		'JNR_RIB_CLOTHIER_GOLD_TRADE_TIER3'),
		('IMPROVEMENT_JNR_BREWERY',			'JNR_RIB_BREWERY_GOLD_FARM'),
		('IMPROVEMENT_JNR_BREWERY',			'JNR_RIB_BREWERY_GOLD_FARM_ELECTRICITY'),
		('IMPROVEMENT_JNR_BREWERY',			'JNR_RIB_BREWERY_AMENITY');

INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,					ModifierId)
SELECT	'IMPROVEMENT_JNR_CLOTHIER',			'JNR_RIB_CLOTHIER_GOLD_TRADE_TIER4'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_WIND_MILL';
--------------------------------------------------------------

-- CivicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO CivicModifiers
		(CivicType,			ModifierId)
VALUES	('CIVIC_FEUDALISM',	'JNR_RIB_WET_FARM_FOOD_FRESH_WATER');
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,										RequirementType)
VALUES	('REQUIRES_PLOT_HAS_WET_FARM_JNR',					'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'),
		('REQUIRES_PLAYER_HAS_TECH_INDUSTRIALIZATION_JNR',	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,										Name,				Value)
VALUES	('REQUIRES_PLOT_HAS_WET_FARM_JNR',					'ImprovementType',	'IMPROVEMENT_JNR_WET_FARM'),
		('REQUIRES_PLAYER_HAS_TECH_INDUSTRIALIZATION_JNR',	'TechnologyType',	'TECH_INDUSTRIALIZATION');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('PLOT_HAS_WET_FARM_FRESH_WATER_JNR',			'REQUIREMENTSET_TEST_ALL'),
		('PLOT_HAS_PASTURE_INDUSTRIALIZATION_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('PLOT_HAS_RESOURCE_FARM_JNR',					'REQUIREMENTSET_TEST_ALL'),
		('PLOT_HAS_RESOURCE_FARM_REFRIGERATION_JNR',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('PLOT_HAS_WET_FARM_FRESH_WATER_JNR',			'REQUIRES_PLOT_HAS_WET_FARM_JNR'),
		('PLOT_HAS_WET_FARM_FRESH_WATER_JNR',			'REQUIRES_PLOT_IS_FRESH_WATER'),
		('PLOT_HAS_PASTURE_INDUSTRIALIZATION_JNR',		'REQUIRES_PLOT_HAS_PASTURE'),
		('PLOT_HAS_PASTURE_INDUSTRIALIZATION_JNR',		'REQUIRES_PLAYER_HAS_TECH_INDUSTRIALIZATION_JNR'),
		('PLOT_HAS_RESOURCE_FARM_JNR',					'REQUIRES_PLOT_HAS_FARM'),
		('PLOT_HAS_RESOURCE_FARM_JNR',					'PLOT_HAS_RESOURCE_REQUIREMENTS'),
		('PLOT_HAS_RESOURCE_FARM_REFRIGERATION_JNR',	'REQUIRES_PLOT_HAS_FARM'),
		('PLOT_HAS_RESOURCE_FARM_REFRIGERATION_JNR',	'PLOT_HAS_RESOURCE_REQUIREMENTS'),
		('PLOT_HAS_RESOURCE_FARM_REFRIGERATION_JNR',	'REQUIRES_PLAYER_HAS_ELECTRICITYTECHNOLOGY');
--------------------------------------------------------------

-- Improvement_Tourism
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Tourism
		(ImprovementType,					TourismSource,				PrereqTech,		ScalingFactor)
VALUES	('IMPROVEMENT_JNR_BREWERY',			'TOURISMSOURCE_PRODUCTION',	'TECH_FLIGHT',	100);
--------------------------------------------------------------