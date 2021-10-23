-- RIB_Improvement_Bonuses
-- Author: JNR
--------------------------------------------------------------

-- Improvement_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_YieldChanges
		(ImprovementType,						YieldType,			YieldChange)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',		'YIELD_GOLD',		2);
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,											YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,					Description)
VALUES	('JNR_Caravanserai_GoldAdjacency',				'YIELD_GOLD',		1,				1,				'IMPROVEMENT_JNR_CARAVANSERAI',			'LOC_DISTRICT_JNR_CARAVANSERAI_GOLD');

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,											YieldType,			YieldChange,	TilesRequired,	AdjacentFeature,						Description)
VALUES	('JNR_UC_Oasis_Gold',							'YIELD_GOLD',		2,				1,				'FEATURE_OASIS',						'LOC_DISTRICT_JNR_UC_OASIS_GOLD');
--------------------------------------------------------------

-- Improvement_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,					YieldChangeId)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',	'JNR_UC_Oasis_Gold');
--------------------------------------------------------------

-- District_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
VALUES	('DISTRICT_COMMERCIAL_HUB',		'JNR_Caravanserai_GoldAdjacency'),
		('DISTRICT_HARBOR',				'JNR_Caravanserai_GoldAdjacency');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Caravanserai_GoldAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_Caravanserai_GoldAdjacency'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_HARBOR';
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_JNR_SINGLE_CITY_GRANT_ROAD_TO_CAPITAL',	'KIND_MODIFIER'),
		('MODIFIER_JNR_SINGLE_CITY_GRANT_TRADING_POST',		'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,										CollectionType,				EffectType)
VALUES	('MODIFIER_JNR_SINGLE_CITY_GRANT_ROAD_TO_CAPITAL',	'COLLECTION_OWNER_CITY',	'EFFECT_GRANT_CITY_ROAD_TO_CAPITAL'),
		('MODIFIER_JNR_SINGLE_CITY_GRANT_TRADING_POST',		'COLLECTION_OWNER_CITY',	'EFFECT_GRANT_CITY_TRADING_POST');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,								ModifierType,										SubjectRequirementSetId)
VALUES	('JNR_RIB_CARAVANSERAI_TRADE_ROUTE',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',		'CITY_HAS_RIB_CAMEL_REQUIREMENTS_JNR'),
		('JNR_RIB_CARAVANSERAI_ROAD_TO_CAPITAL',	'MODIFIER_JNR_SINGLE_CITY_GRANT_ROAD_TO_CAPITAL',	NULL),
		('JNR_RIB_CARAVANSERAI_TRADE_POST',			'MODIFIER_JNR_SINGLE_CITY_GRANT_TRADING_POST',		NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,								Name,		Value)
VALUES	('JNR_RIB_CARAVANSERAI_TRADE_ROUTE',		'Amount',	1);
--------------------------------------------------------------

-- ImprovementModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,					ModifierId)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',	'JNR_RIB_CARAVANSERAI_TRADE_ROUTE'),
		('IMPROVEMENT_JNR_CARAVANSERAI',	'JNR_RIB_CARAVANSERAI_ROAD_TO_CAPITAL'),
		('IMPROVEMENT_JNR_CARAVANSERAI',	'JNR_RIB_CARAVANSERAI_TRADE_POST');

INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,					ModifierId)
SELECT	'IMPROVEMENT_JNR_CLOTHIER',			'JNR_RIB_CLOTHIER_GOLD_TRADE_TIER4'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_WIND_MILL';
--------------------------------------------------------------

-- Improvement_Tourism
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Tourism
		(ImprovementType,					TourismSource,			PrereqTech,		ScalingFactor)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',	'TOURISMSOURCE_GOLD',	'TECH_FLIGHT',	100);
--------------------------------------------------------------