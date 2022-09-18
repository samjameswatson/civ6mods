-- UC_MIL_Bonuses_Promotions
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_JNR_CITY_TRAINED_UNITS_GRANT_PROMOTION',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,										CollectionType,						EffectType)
VALUES	('MODIFIER_JNR_CITY_TRAINED_UNITS_GRANT_PROMOTION',	'COLLECTION_CITY_TRAINED_UNITS',	'EFFECT_GRANT_PROMOTION');
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,						RequirementType)
VALUES	('REQUIRES_UNIT_IS_MONK_JNR',		'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES'),
		('REQUIRES_UNIT_IS_NAVMELEE_JNR',	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES'),
		('REQUIRES_UNIT_IS_NAVRANGED_JNR',	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES'),
		('REQUIRES_UNIT_IS_NAVRAIDER_JNR',	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES'),
		('REQUIRES_UNIT_IS_NAVCARRIER_JNR',	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES'),
		('REQUIRES_UNIT_IS_AIRFIGHTER_JNR',	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES'),
		('REQUIRES_UNIT_IS_AIRBOMBER_JNR',	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES');
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,						Name,					Value)
VALUES	('REQUIRES_UNIT_IS_MONK_JNR',		'UnitPromotionClass',	'PROMOTION_CLASS_MONK'),
		('REQUIRES_UNIT_IS_NAVMELEE_JNR',	'UnitPromotionClass',	'PROMOTION_CLASS_NAVAL_MELEE'),
		('REQUIRES_UNIT_IS_NAVRANGED_JNR',	'UnitPromotionClass',	'PROMOTION_CLASS_NAVAL_RANGED'),
		('REQUIRES_UNIT_IS_NAVRAIDER_JNR',	'UnitPromotionClass',	'PROMOTION_CLASS_NAVAL_RAIDER'),
		('REQUIRES_UNIT_IS_NAVCARRIER_JNR',	'UnitPromotionClass',	'PROMOTION_CLASS_NAVAL_CARRIER'),
		('REQUIRES_UNIT_IS_AIRFIGHTER_JNR',	'UnitPromotionClass',	'PROMOTION_CLASS_AIR_FIGHTER'),
		('REQUIRES_UNIT_IS_AIRBOMBER_JNR',	'UnitPromotionClass',	'PROMOTION_CLASS_AIR_BOMBER');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('MILITARY_ACADEMY_PROMOTION_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ANY'),
		('TARGET_RANGE_PROMOTION_REQUIREMENTS_JNR',		'REQUIREMENTSET_TEST_ANY'),
		('CAVALIER_PROMOTION_REQUIREMENTS_JNR',			'REQUIREMENTSET_TEST_ANY'),
		('DEPOT_PROMOTION_REQUIREMENTS_JNR',			'REQUIREMENTSET_TEST_ANY'),
		('NAVAL_BASE_PROMOTION_REQUIREMENTS_JNR',		'REQUIREMENTSET_TEST_ANY'),
		('AIRPORT_PROMOTION_REQUIREMENTS_JNR',			'REQUIREMENTSET_TEST_ANY');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('MILITARY_ACADEMY_PROMOTION_REQUIREMENTS_JNR',	'REQUIREMENT_UNIT_IS_MELEE'),
		('MILITARY_ACADEMY_PROMOTION_REQUIREMENTS_JNR',	'REQUIREMENT_UNIT_IS_RANGED'),
		('MILITARY_ACADEMY_PROMOTION_REQUIREMENTS_JNR',	'REQUIREMENT_UNIT_IS_ANTI_CAV'),
		('MILITARY_ACADEMY_PROMOTION_REQUIREMENTS_JNR',	'REQUIRES_UNIT_IS_MONK_JNR'),
		('TARGET_RANGE_PROMOTION_REQUIREMENTS_JNR',		'RECON_UNITS'),
		('CAVALIER_PROMOTION_REQUIREMENTS_JNR',			'REQUIREMENT_UNIT_IS_SIEGE'),
		('DEPOT_PROMOTION_REQUIREMENTS_JNR',			'UNIT_IS_LIGHT_CAVALRY'),
		('DEPOT_PROMOTION_REQUIREMENTS_JNR',			'UNIT_IS_HEAVY_CAVALRY'),
		('NAVAL_BASE_PROMOTION_REQUIREMENTS_JNR',		'REQUIRES_UNIT_IS_NAVMELEE_JNR'),
		('NAVAL_BASE_PROMOTION_REQUIREMENTS_JNR',		'REQUIRES_UNIT_IS_NAVRANGED_JNR'),
		('NAVAL_BASE_PROMOTION_REQUIREMENTS_JNR',		'REQUIRES_UNIT_IS_NAVRAIDER_JNR'),
		('NAVAL_BASE_PROMOTION_REQUIREMENTS_JNR',		'REQUIRES_UNIT_IS_NAVCARRIER_JNR'),
		('AIRPORT_PROMOTION_REQUIREMENTS_JNR',			'REQUIRES_UNIT_IS_AIRFIGHTER_JNR'),
		('AIRPORT_PROMOTION_REQUIREMENTS_JNR',			'REQUIRES_UNIT_IS_AIRBOMBER_JNR');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,							ModifierType,											SubjectRequirementSetId)
VALUES	('JNR_MILITARY_ACADEMY_PROMOTION',		'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',	'MILITARY_ACADEMY_PROMOTION_REQUIREMENTS_JNR'),
		('JNR_TARGET_RANGE_PROMOTION',			'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',	'TARGET_RANGE_PROMOTION_REQUIREMENTS_JNR'),
		('JNR_CAVALIER_PROMOTION',				'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',	'CAVALIER_PROMOTION_REQUIREMENTS_JNR'),
		('JNR_DEPOT_PROMOTION',					'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',	'DEPOT_PROMOTION_REQUIREMENTS_JNR'),
		('JNR_NAVAL_BASE_PROMOTION',			'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',	'NAVAL_BASE_PROMOTION_REQUIREMENTS_JNR'),
		('JNR_AIRPORT_PROMOTION',				'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',	'AIRPORT_PROMOTION_REQUIREMENTS_JNR'),
		('JNR_MILITARY_ACADEMY_RECON_AMBUSH',	'MODIFIER_JNR_CITY_TRAINED_UNITS_GRANT_PROMOTION',		'TARGET_RANGE_PROMOTION_REQUIREMENTS_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,							Name,				Value)
VALUES	('JNR_MILITARY_ACADEMY_PROMOTION',		'Amount',			-1),
		('JNR_TARGET_RANGE_PROMOTION',			'Amount',			-1),
		('JNR_CAVALIER_PROMOTION',				'Amount',			-1),
		('JNR_DEPOT_PROMOTION',					'Amount',			-1),
		('JNR_NAVAL_BASE_PROMOTION',			'Amount',			-1),
		('JNR_AIRPORT_PROMOTION',				'Amount',			-1),
		('JNR_MILITARY_ACADEMY_RECON_AMBUSH',	'PromotionType',	'PROMOTION_AMBUSH');
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
VALUES	('BUILDING_MILITARY_ACADEMY',	'JNR_MILITARY_ACADEMY_PROMOTION'),
		('BUILDING_JNR_TARGET_RANGE',	'JNR_TARGET_RANGE_PROMOTION'),
		('BUILDING_JNR_CAVALIER',		'JNR_CAVALIER_PROMOTION'),
		('BUILDING_JNR_DEPOT',			'JNR_DEPOT_PROMOTION'),
		('BUILDING_JNR_NAVAL_BASE',		'JNR_NAVAL_BASE_PROMOTION'),
		('BUILDING_AIRPORT',			'JNR_AIRPORT_PROMOTION'),
		('BUILDING_MILITARY_ACADEMY',	'JNR_MILITARY_ACADEMY_RECON_AMBUSH');
--------------------------------------------------------------