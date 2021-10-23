-- UC_REL_Bonuses_Yields
-- Author: JNR
--------------------------------------------------------------

-- Building_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_YieldChanges
		(BuildingType,				YieldType,		YieldChange)
VALUES	('BUILDING_JNR_ALTAR',		'YIELD_FAITH',	1),
		('BUILDING_JNR_MONASTERY',	'YIELD_FAITH',	1),
		('BUILDING_JNR_HOSPITIUM',	'YIELD_FAITH',	1),
		('BUILDING_JNR_GARDEN',		'YIELD_FAITH',	1);

UPDATE Building_YieldChanges SET YieldChange=1	WHERE BuildingType='BUILDING_SHRINE'		AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange=1	WHERE BuildingType='BUILDING_TEMPLE'		AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange=2	WHERE BuildingType='BUILDING_STAVE_CHURCH'	AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange=2	WHERE BuildingType='BUILDING_PRASAT'		AND YieldType='YIELD_FAITH';
--------------------------------------------------------------

-- Building_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_CitizenYieldChanges
		(BuildingType,				YieldType,		YieldChange)
VALUES	('BUILDING_SHRINE',			'YIELD_FAITH',	1),
		('BUILDING_JNR_HOSPITIUM',	'YIELD_FAITH',	1),
		('BUILDING_JNR_GARDEN',		'YIELD_FAITH',	1);
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('REQUIRES_CITY_HAS_1_TITLE_GOVERNOR_JNR',	'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES'),
		('REQUIRES_CITY_HAS_3_TITLE_GOVERNOR_JNR',	'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES'),
		('REQUIRES_CITY_HAS_4_TITLE_GOVERNOR_JNR',	'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES'),
		('REQUIRES_CITY_HAS_5_TITLE_GOVERNOR_JNR',	'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES'),
		('REQUIRES_CITY_HAS_6_TITLE_GOVERNOR_JNR',	'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES');
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,								Name,				Value)
VALUES	('REQUIRES_CITY_HAS_1_TITLE_GOVERNOR_JNR',	'Established',		1),
		('REQUIRES_CITY_HAS_1_TITLE_GOVERNOR_JNR',	'Amount',			1),
		('REQUIRES_CITY_HAS_3_TITLE_GOVERNOR_JNR',	'Established',		1),
		('REQUIRES_CITY_HAS_3_TITLE_GOVERNOR_JNR',	'Amount',			3),
		('REQUIRES_CITY_HAS_4_TITLE_GOVERNOR_JNR',	'Established',		1),
		('REQUIRES_CITY_HAS_4_TITLE_GOVERNOR_JNR',	'Amount',			4),
		('REQUIRES_CITY_HAS_5_TITLE_GOVERNOR_JNR',	'Established',		1),
		('REQUIRES_CITY_HAS_5_TITLE_GOVERNOR_JNR',	'Amount',			5),
		('REQUIRES_CITY_HAS_6_TITLE_GOVERNOR_JNR',	'Established',		1),
		('REQUIRES_CITY_HAS_6_TITLE_GOVERNOR_JNR',	'Amount',			6);
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('CITY_HAS_1_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('CITY_HAS_3_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('CITY_HAS_4_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('CITY_HAS_5_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('CITY_HAS_6_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_MOUNTAIN_ADJACENT_TO_OWNER_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('PLOT_IS_FEATURE_ADJACENT_TO_OWNER_JNR',		'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('CITY_HAS_1_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_1_TITLE_GOVERNOR_JNR'),
		('CITY_HAS_3_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_3_TITLE_GOVERNOR_JNR'),
		('CITY_HAS_4_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_4_TITLE_GOVERNOR_JNR'),
		('CITY_HAS_5_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_5_TITLE_GOVERNOR_JNR'),
		('CITY_HAS_6_TITLE_GOVERNOR_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_6_TITLE_GOVERNOR_JNR'),
		('PLOT_IS_MOUNTAIN_ADJACENT_TO_OWNER_JNR',		'ADJACENT_TO_OWNER'),
		('PLOT_IS_MOUNTAIN_ADJACENT_TO_OWNER_JNR',		'PLOT_IS_MOUNTAIN'),
		('PLOT_IS_FEATURE_ADJACENT_TO_OWNER_JNR',		'ADJACENT_TO_OWNER'),
		('PLOT_IS_FEATURE_ADJACENT_TO_OWNER_JNR',		'PLOT_HAS_ANY_FEATURE_REQUIREMENT');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,												SubjectRequirementSetId)
VALUES	('JNR_ALTAR_FAITH_1_TITLE',						'MODIFIER_BUILDING_YIELD_CHANGE',							'CITY_HAS_1_TITLE_GOVERNOR_REQUIREMENTS_JNR'),
		('JNR_ALTAR_FAITH_2_TITLE',						'MODIFIER_BUILDING_YIELD_CHANGE',							'CITY_HAS_2_TITLE_GOVERNOR_REQUIREMENTS'),
		('JNR_ALTAR_FAITH_3_TITLE',						'MODIFIER_BUILDING_YIELD_CHANGE',							'CITY_HAS_3_TITLE_GOVERNOR_REQUIREMENTS_JNR'),
		('JNR_ALTAR_FAITH_4_TITLE',						'MODIFIER_BUILDING_YIELD_CHANGE',							'CITY_HAS_4_TITLE_GOVERNOR_REQUIREMENTS_JNR'),
		('JNR_ALTAR_FAITH_5_TITLE',						'MODIFIER_BUILDING_YIELD_CHANGE',							'CITY_HAS_5_TITLE_GOVERNOR_REQUIREMENTS_JNR'),
		('JNR_ALTAR_FAITH_6_TITLE',						'MODIFIER_BUILDING_YIELD_CHANGE',							'CITY_HAS_6_TITLE_GOVERNOR_REQUIREMENTS_JNR'),
		('JNR_TEMPLE_FAITH_POPULATION',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL),
		('JNR_MONASTERY_MOUNTAIN_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'REQUIREMENTS_PLOT_IS_MOUNTAIN'),
		('JNR_MONASTERY_MOUNTAIN_FAITH',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'REQUIREMENTS_PLOT_IS_MOUNTAIN'),
		('JNR_MONASTERY_FAITH_ADJACENT_MOUNTAIN',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'PLOT_IS_MOUNTAIN_ADJACENT_TO_OWNER_JNR'),
		('JNR_MONASTERY_FAITH_ADJACENT_FEATURE',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'PLOT_IS_FEATURE_ADJACENT_TO_OWNER_JNR'),
		('JNR_WORSHIP_FAITH_PERCENTAGE',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			NULL),
		('JNR_GARDEN_FAITH_PERCENTAGE',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			NULL);

INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JNR_HOSPITIUM_FAITH_' || GreatWorkObjectType,	'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,					Value)
VALUES	('JNR_ALTAR_FAITH_1_TITLE',						'BuildingType',			'BUILDING_JNR_ALTAR'),
		('JNR_ALTAR_FAITH_1_TITLE',						'YieldType',			'YIELD_FAITH'),
		('JNR_ALTAR_FAITH_1_TITLE',						'Amount',				1),
		('JNR_ALTAR_FAITH_2_TITLE',						'BuildingType',			'BUILDING_JNR_ALTAR'),
		('JNR_ALTAR_FAITH_2_TITLE',						'YieldType',			'YIELD_FAITH'),
		('JNR_ALTAR_FAITH_2_TITLE',						'Amount',				1),
		('JNR_ALTAR_FAITH_3_TITLE',						'BuildingType',			'BUILDING_JNR_ALTAR'),
		('JNR_ALTAR_FAITH_3_TITLE',						'YieldType',			'YIELD_FAITH'),
		('JNR_ALTAR_FAITH_3_TITLE',						'Amount',				1),
		('JNR_ALTAR_FAITH_4_TITLE',						'BuildingType',			'BUILDING_JNR_ALTAR'),
		('JNR_ALTAR_FAITH_4_TITLE',						'YieldType',			'YIELD_FAITH'),
		('JNR_ALTAR_FAITH_4_TITLE',						'Amount',				1),
		('JNR_ALTAR_FAITH_5_TITLE',						'BuildingType',			'BUILDING_JNR_ALTAR'),
		('JNR_ALTAR_FAITH_5_TITLE',						'YieldType',			'YIELD_FAITH'),
		('JNR_ALTAR_FAITH_5_TITLE',						'Amount',				1),
		('JNR_ALTAR_FAITH_6_TITLE',						'BuildingType',			'BUILDING_JNR_ALTAR'),
		('JNR_ALTAR_FAITH_6_TITLE',						'YieldType',			'YIELD_FAITH'),
		('JNR_ALTAR_FAITH_6_TITLE',						'Amount',				1),
		('JNR_TEMPLE_FAITH_POPULATION',					'YieldType',			'YIELD_FAITH'),
		('JNR_TEMPLE_FAITH_POPULATION',					'Amount',				0.3),
		('JNR_MONASTERY_MOUNTAIN_FOOD',					'YieldType',			'YIELD_FOOD'),
		('JNR_MONASTERY_MOUNTAIN_FOOD',					'Amount',				1),
		('JNR_MONASTERY_MOUNTAIN_FAITH',				'YieldType',			'YIELD_FAITH'),
		('JNR_MONASTERY_MOUNTAIN_FAITH',				'Amount',				1),
		('JNR_MONASTERY_FAITH_ADJACENT_MOUNTAIN',		'YieldType',			'YIELD_FAITH'),
		('JNR_MONASTERY_FAITH_ADJACENT_MOUNTAIN',		'Amount',				1),
		('JNR_MONASTERY_FAITH_ADJACENT_FEATURE',		'YieldType',			'YIELD_FAITH'),
		('JNR_MONASTERY_FAITH_ADJACENT_FEATURE',		'Amount',				1),
		('JNR_WORSHIP_FAITH_PERCENTAGE',				'YieldType',			'YIELD_FAITH'),
		('JNR_WORSHIP_FAITH_PERCENTAGE',				'Amount',				5),
		('JNR_GARDEN_FAITH_PERCENTAGE',					'YieldType',			'YIELD_FAITH'),
		('JNR_GARDEN_FAITH_PERCENTAGE',					'Amount',				5);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,					Value)
SELECT	'JNR_HOSPITIUM_FAITH_' || GreatWorkObjectType,	'GreatWorkObjectType',	GreatWorkObjectType
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,					Value)
SELECT	'JNR_HOSPITIUM_FAITH_' || GreatWorkObjectType,	'YieldType',			'YIELD_FAITH'
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,					Value)
SELECT	'JNR_HOSPITIUM_FAITH_' || GreatWorkObjectType,	'YieldChange',			1
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
VALUES	('BUILDING_JNR_ALTAR',		'JNR_ALTAR_FAITH_1_TITLE'),
		('BUILDING_JNR_ALTAR',		'JNR_ALTAR_FAITH_2_TITLE'),
		('BUILDING_JNR_ALTAR',		'JNR_ALTAR_FAITH_3_TITLE'),
		('BUILDING_JNR_ALTAR',		'JNR_ALTAR_FAITH_4_TITLE'),
		('BUILDING_JNR_ALTAR',		'JNR_ALTAR_FAITH_5_TITLE'),
		('BUILDING_JNR_ALTAR',		'JNR_ALTAR_FAITH_6_TITLE'),
		('BUILDING_TEMPLE',			'JNR_TEMPLE_FAITH_POPULATION'),
		('BUILDING_JNR_MONASTERY',	'JNR_MONASTERY_MOUNTAIN_FOOD'),
		('BUILDING_JNR_MONASTERY',	'JNR_MONASTERY_MOUNTAIN_FAITH'),
		('BUILDING_JNR_MONASTERY',	'JNR_MONASTERY_FAITH_ADJACENT_MOUNTAIN'),
		('BUILDING_JNR_MONASTERY',	'JNR_MONASTERY_FAITH_ADJACENT_FEATURE'),
		('BUILDING_JNR_GARDEN',		'JNR_GARDEN_FAITH_PERCENTAGE');

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	'BUILDING_JNR_HOSPITIUM',	'JNR_HOSPITIUM_FAITH_' || GreatWorkObjectType
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

-- Worship Buildings
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	BuildingType,				'JNR_WORSHIP_FAITH_PERCENTAGE'
FROM	Buildings
WHERE	EnabledByReligion=1;

-- Uniques
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	BuildingType,				'JNR_MONASTERY_MOUNTAIN_FOOD'
FROM	Buildings
WHERE	BuildingType='BUILDING_STAVE_CHURCH';

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	BuildingType,				'JNR_MONASTERY_MOUNTAIN_FAITH'
FROM	Buildings
WHERE	BuildingType='BUILDING_STAVE_CHURCH';

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	BuildingType,				'JNR_MONASTERY_FAITH_ADJACENT_MOUNTAIN'
FROM	Buildings
WHERE	BuildingType='BUILDING_STAVE_CHURCH';

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	BuildingType,				'JNR_MONASTERY_FAITH_ADJACENT_FEATURE'
FROM	Buildings
WHERE	BuildingType='BUILDING_STAVE_CHURCH';

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
SELECT	BuildingType,				'JNR_TEMPLE_FAITH_POPULATION'
FROM	Buildings
WHERE	BuildingType='BUILDING_PRASAT';
--------------------------------------------------------------

-- Enables working Mountains for everyone
-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,					ModifierId)
VALUES	('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_WORK_GRASS_MOUNTAIN'),
		('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_WORK_PLAINS_MOUNTAIN'),
		('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_WORK_DESERT_MOUNTAIN'),
		('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_WORK_TUNDRA_MOUNTAIN'),
		('TRAIT_LEADER_MAJOR_CIV', 'TRAIT_WORK_SNOW_MOUNTAIN');
--------------------------------------------------------------