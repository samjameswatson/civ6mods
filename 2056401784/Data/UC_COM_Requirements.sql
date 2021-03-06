-- UC_COM_Requirements
-- Author: JNR
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('REQUIRES_CITY_HAS_MINT_JNR',				'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_WAYSTATION_JNR',		'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR',	'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_HAVEN_JNR',				'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_CONSULATE_JNR',			'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_CRUISE_TERMINANL_JNR',	'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY_JNR',	'REQUIREMENT_CITY_HAS_BUILDING');
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,								Name,			Value)
VALUES	('REQUIRES_CITY_HAS_MINT_JNR',				'BuildingType',	'BUILDING_JNR_MINT'),
		('REQUIRES_CITY_HAS_WAYSTATION_JNR',		'BuildingType',	'BUILDING_JNR_WAYSTATION'),
		('REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR',	'BuildingType',	'BUILDING_JNR_LIGHTHOUSE_TRADE'),
		('REQUIRES_CITY_HAS_HAVEN_JNR',				'BuildingType',	'BUILDING_JNR_HAVEN'),
		('REQUIRES_CITY_HAS_CONSULATE_JNR',			'BuildingType',	'BUILDING_JNR_CONSULATE'),
		('REQUIRES_CITY_HAS_CRUISE_TERMINANL_JNR',	'BuildingType',	'BUILDING_JNR_CRUISE_TERMINAL'),
		('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY_JNR',	'DistrictType',	'DISTRICT_HARBOR'),
		('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY_JNR',	'YieldType',	'YIELD_GOLD'),
		('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY_JNR',	'Amount',		6);

UPDATE RequirementArguments SET Value=5 WHERE RequirementId='REQUIRES_COMMERCIAL_HUB_HAS_HIGH_ADJACENCY' AND Name='Amount';
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('BUILDING_IS_COMMERCIAL_TIER1_JNR',	'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_HARBOR_TIER1_JNR',		'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_HARBOR_TIER2_JNR',		'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_HARBOR_TIER3_JNR',		'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_LIGHTHOUSE_TRADE_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('BUILDING_IS_HAVEN_JNR',				'REQUIREMENTSET_TEST_ALL'),
		('BUILDING_IS_CONSULATE_JNR',			'REQUIREMENTSET_TEST_ALL'),
		('BUILDING_IS_CRUISE_TERMINAL_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('HARBOR_HAS_HIGH_ADJACENCY_JNR',		'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('BUILDING_IS_COMMERCIAL_TIER1_JNR',	'REQUIRES_CITY_HAS_MARKET'),
		('BUILDING_IS_COMMERCIAL_TIER1_JNR',	'REQUIRES_CITY_HAS_MINT_JNR'),
		('BUILDING_IS_COMMERCIAL_TIER1_JNR',	'REQUIRES_CITY_HAS_WAYSTATION_JNR'),
		('BUILDING_IS_HARBOR_TIER1_JNR',		'REQUIRES_CITY_HAS_LIGHTHOUSE'),
		('BUILDING_IS_HARBOR_TIER1_JNR',		'REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR'),
		('BUILDING_IS_HARBOR_TIER2_JNR',		'REQUIRES_CITY_HAS_SHIPYARD'),
		('BUILDING_IS_HARBOR_TIER2_JNR',		'REQUIRES_CITY_HAS_HAVEN_JNR'),
		('BUILDING_IS_HARBOR_TIER2_JNR',		'REQUIRES_CITY_HAS_CONSULATE_JNR'),
		('BUILDING_IS_HARBOR_TIER3_JNR',		'REQUIRES_CITY_HAS_SEAPORT'),
		('BUILDING_IS_HARBOR_TIER3_JNR',		'REQUIRES_CITY_HAS_CRUISE_TERMINANL_JNR'),
		('BUILDING_IS_LIGHTHOUSE_TRADE_JNR',	'REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR'),
		('BUILDING_IS_HAVEN_JNR',				'REQUIRES_CITY_HAS_HAVEN_JNR'),
		('BUILDING_IS_CONSULATE_JNR',			'REQUIRES_CITY_HAS_CONSULATE_JNR'),
		('BUILDING_IS_CRUISE_TERMINAL_JNR',		'REQUIRES_CITY_HAS_CRUISE_TERMINANL_JNR'),
		('HARBOR_HAS_HIGH_ADJACENCY_JNR',		'REQUIRES_HARBOR_HAS_HIGH_ADJACENCY_JNR');
--------------------------------------------------------------