-- UC_REL_Requirements
-- Author: JNR
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('REQUIRES_CITY_HAS_ALTAR_JNR',				'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_MONASTERY_JNR',			'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_HOSPITIUM_JNR',			'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_GARDEN_JNR',			'REQUIREMENT_CITY_HAS_BUILDING'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER1_JNR',	'REQUIREMENT_REQUIREMENTSET_IS_MET'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER2_JNR',	'REQUIREMENT_REQUIREMENTSET_IS_MET'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER3_JNR',	'REQUIREMENT_REQUIREMENTSET_IS_MET'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER4_JNR',	'REQUIREMENT_REQUIREMENTSET_IS_MET');
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,								Name,				Value)
VALUES	('REQUIRES_CITY_HAS_ALTAR_JNR',				'BuildingType',		'BUILDING_JNR_ALTAR'),
		('REQUIRES_CITY_HAS_MONASTERY_JNR',			'BuildingType',		'BUILDING_JNR_MONASTERY'),
		('REQUIRES_CITY_HAS_HOSPITIUM_JNR',			'BuildingType',		'BUILDING_JNR_HOSPITIUM'),
		('REQUIRES_CITY_HAS_GARDEN_JNR',			'BuildingType',		'BUILDING_JNR_GARDEN'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER1_JNR',	'RequirementSetId',	'BUILDING_IS_HOLY_SITE_TIER1_JNR'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER2_JNR',	'RequirementSetId',	'BUILDING_IS_HOLY_SITE_TIER2_JNR'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER3_JNR',	'RequirementSetId',	'BUILDING_IS_TIER3_HOLY_SITE'),
		('REQUIRES_CITY_HAS_HOLY_SITE_TIER4_JNR',	'RequirementSetId',	'BUILDING_IS_HOLY_SITE_TIER4_JNR');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('BUILDING_IS_HOLY_SITE_TIER1_JNR',					'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_HOLY_SITE_TIER2_JNR',					'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_HOLY_SITE_TIER4_JNR',					'REQUIREMENTSET_TEST_ANY'),
		('BUILDING_IS_ALTAR_JNR',							'REQUIREMENTSET_TEST_ALL'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER1_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER2_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER4_JNR',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('BUILDING_IS_HOLY_SITE_TIER1_JNR',					'REQUIRES_CITY_HAS_SHRINE'),
		('BUILDING_IS_HOLY_SITE_TIER1_JNR',					'REQUIRES_CITY_HAS_ALTAR_JNR'),
		('BUILDING_IS_HOLY_SITE_TIER2_JNR',					'REQUIRES_CITY_HAS_TEMPLE'),
		('BUILDING_IS_HOLY_SITE_TIER2_JNR',					'REQUIRES_CITY_HAS_MONASTERY_JNR'),
		('BUILDING_IS_HOLY_SITE_TIER4_JNR',					'REQUIRES_CITY_HAS_HOSPITIUM_JNR'),
		('BUILDING_IS_HOLY_SITE_TIER4_JNR',					'REQUIRES_CITY_HAS_GARDEN_JNR'),
		('BUILDING_IS_ALTAR_JNR',							'REQUIRES_CITY_HAS_ALTAR_JNR'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER1_JNR',	'REQUIRES_CITY_FOLLOWS_RELIGION'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER1_JNR',	'REQUIRES_CITY_HAS_HOLY_SITE_TIER1_JNR'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER2_JNR',	'REQUIRES_CITY_FOLLOWS_RELIGION'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER2_JNR',	'REQUIRES_CITY_HAS_HOLY_SITE_TIER2_JNR'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER4_JNR',	'REQUIRES_CITY_FOLLOWS_RELIGION'),
		('CITY_FOLLOWS_RELIGION_HAS_HOLY_SITE_TIER4_JNR',	'REQUIRES_CITY_HAS_HOLY_SITE_TIER4_JNR');
--------------------------------------------------------------