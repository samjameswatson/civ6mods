--=============================================================================================================
-- RELIGION EXPANDED: ENHANCER BELIEFS
--=============================================================================================================
-- Types
---------------------------------------------------------------------------------------------------------------
INSERT INTO Types 
		(Type,								Kind)
VALUES	('BELIEF_P0K_SACRAL_ARCHITECTURE',	'KIND_BELIEF'),
		('BELIEF_P0K_WITCHCRAFT_TRIALS',	'KIND_BELIEF'),
		('BELIEF_P0K_LAYING_ON_OF_HANDS',	'KIND_BELIEF'),
		('BELIEF_P0K_PIOUS_MERCHANTS',		'KIND_BELIEF'),
		('BELIEF_P0K_CANONIZATION',			'KIND_BELIEF'),
		('BELIEF_P0K_MILITARISTIC_SECT',	'KIND_BELIEF'),
		('BELIEF_P0K_BY_THE_SWORD',			'KIND_BELIEF');
---------------------------------------------------------------------------------------------------------------
-- Beliefs
---------------------------------------------------------------------------------------------------------------
INSERT INTO Beliefs		
		(BeliefType,						Name,										Description,										BeliefClassType) 
VALUES	('BELIEF_P0K_SACRAL_ARCHITECTURE',	'LOC_BELIEF_P0K_SACRAL_ARCHITECTURE_NAME',	'LOC_BELIEF_P0K_SACRAL_ARCHITECTURE_DESCRIPTION',	'BELIEF_CLASS_ENHANCER'),
		('BELIEF_P0K_WITCHCRAFT_TRIALS',	'LOC_BELIEF_P0K_WITCHCRAFT_TRIALS_NAME',	'LOC_BELIEF_P0K_WITCHCRAFT_TRIALS_DESCRIPTION',		'BELIEF_CLASS_ENHANCER'),
		('BELIEF_P0K_LAYING_ON_OF_HANDS',	'LOC_BELIEF_P0K_LAYING_ON_OF_HANDS_NAME',	'LOC_BELIEF_P0K_LAYING_ON_OF_HANDS_DESCRIPTION',	'BELIEF_CLASS_ENHANCER'),	
		('BELIEF_P0K_PIOUS_MERCHANTS',		'LOC_BELIEF_P0K_PIOUS_MERCHANTS_NAME',		'LOC_BELIEF_P0K_PIOUS_MERCHANTS_DESCRIPTION',		'BELIEF_CLASS_ENHANCER'),	
		('BELIEF_P0K_CANONIZATION',			'LOC_BELIEF_P0K_CANONIZATION_NAME',			'LOC_BELIEF_P0K_CANONIZATION_DESCRIPTION',			'BELIEF_CLASS_ENHANCER'),
		('BELIEF_P0K_MILITARISTIC_SECT',	'LOC_BELIEF_P0K_MILITARISTIC_SECT_NAME',	'LOC_BELIEF_P0K_MILITARISTIC_SECT_DESCRIPTION',		'BELIEF_CLASS_ENHANCER'),
		('BELIEF_P0K_BY_THE_SWORD',			'LOC_BELIEF_P0K_BY_THE_SWORD_NAME',			'LOC_BELIEF_P0K_BY_THE_SWORD_DESCRIPTION',			'BELIEF_CLASS_ENHANCER');
---------------------------------------------------------------------------------------------------------------
-- BeliefModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO BeliefModifiers 
		(BeliefType,						ModifierId)
VALUES	('BELIEF_P0K_SACRAL_ARCHITECTURE',	'P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST'),
		('BELIEF_P0K_SACRAL_ARCHITECTURE',	'P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST'),
		('BELIEF_P0K_WITCHCRAFT_TRIALS',	'P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT'),
		('BELIEF_P0K_WITCHCRAFT_TRIALS',	'P0K_WITCHCRAFT_TRIALS_ADJUST_INQUISITOR_CHARGES'),
		('BELIEF_P0K_LAYING_ON_OF_HANDS',	'P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT'),
		('BELIEF_P0K_LAYING_ON_OF_HANDS',	'P0K_LAYING_ON_OF_HANDS_ADJUST_GURU_CHARGES'),
		('BELIEF_P0K_PIOUS_MERCHANTS',		'P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE'),
		('BELIEF_P0K_CANONIZATION',			'P0K_CANONIZATION_GREAT_PERSON_RELIGIOUS_PRESSURE'),
		('BELIEF_P0K_MILITARISTIC_SECT',	'P0K_MILITARISTIC_SECT_RELIGIOUS_UNIT_COMBAT'),
		('BELIEF_P0K_BY_THE_SWORD',			'P0K_BY_THE_SWORD_CAPTURED_CITY_MAJORITY_RELIGION');
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO Requirements
		(RequirementId,							RequirementType)
VALUES	('P0K_RELIGION_REQUIRES_UNIT_IS_GURU',	'REQUIREMENT_UNIT_TYPE_MATCHES');
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,							Name,		Value)
VALUES	('P0K_RELIGION_REQUIRES_UNIT_IS_GURU',	'UnitType',	'UNIT_GURU');
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,				RequirementSetType)
VALUES	('P0K_RELIGION_UNIT_IS_GURU',	'REQUIREMENTSET_TEST_ALL'),
		('P0K_RELIGION_RELIGIOUS_UNIT',	'REQUIREMENTSET_TEST_ALL'),
		('P0K_RELIGION_MELEE_UNIT',		'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId)
VALUES	('P0K_RELIGION_UNIT_IS_GURU',	'P0K_RELIGION_REQUIRES_UNIT_IS_GURU'),
		('P0K_RELIGION_RELIGIOUS_UNIT',	'REQUIRES_UNIT_IS_RELIGIOUS_ALL'),
		('P0K_RELIGION_MELEE_UNIT',		'REQUIREMENT_UNIT_IS_MELEE');
---------------------------------------------------------------------------------------------------------------
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers 
		(ModifierId,													ModifierType,														SubjectRequirementSetId) 
VALUES	('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST_MODIFIER',	'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',				NULL),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST_MODIFIER',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',				NULL),
		('P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT_MODIFIER',			'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',					NULL),
		('P0K_WITCHCRAFT_TRIALS_ADJUST_INQUISITOR_CHARGES',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_WITCHCRAFT_TRIALS_ADJUST_INQUISITOR_CHARGES_MODIFIER',	'MODIFIER_PLAYER_UNITS_ADJUST_SPREAD_CHARGES',						'UNIT_IS_INQUISITOR'),
		('P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT_MODIFIER',				'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',					NULL),
		('P0K_LAYING_ON_OF_HANDS_ADJUST_GURU_CHARGES',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_LAYING_ON_OF_HANDS_ADJUST_GURU_CHARGES_MODIFIER',			'MODIFIER_PLAYER_UNITS_ADJUST_SPREAD_CHARGES',						'P0K_RELIGION_UNIT_IS_GURU'),
		('P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE_MODIFIER',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_RELIGIOUS_PRESSURE',			NULL),
		('P0K_CANONIZATION_GREAT_PERSON_RELIGIOUS_PRESSURE',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_CANONIZATION_GREAT_PERSON_RELIGIOUS_PRESSURE_MODIFIER',	'MODIFIER_PLAYER_GRANT_RELIGIOUS_PRESSURE_GREAT_PERSON_ACTIVATED',	NULL),
		('P0K_MILITARISTIC_SECT_RELIGIOUS_UNIT_COMBAT',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_MILITARISTIC_SECT_RELIGIOUS_UNIT_COMBAT_MODIFIER',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',								'P0K_RELIGION_RELIGIOUS_UNIT'),
		('P0K_BY_THE_SWORD_CAPTURED_CITY_MAJORITY_RELIGION',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',								'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P0K_BY_THE_SWORD_CAPTURED_CITY_MAJORITY_RELIGION_MODIFIER',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',								'P0K_RELIGION_MELEE_UNIT');
---------------------------------------------------------------------------------------------------------------
--ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments 
		(ModifierId,													Name,			Value)
VALUES	('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST',			'ModifierId',	'P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST_MODIFIER'),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST_MODIFIER',	'DistrictType',	'DISTRICT_HOLY_SITE'),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_DISTRICT_BOOST_MODIFIER',	'Amount',		50),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST',			'ModifierId',	'P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST_MODIFIER'),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST_MODIFIER',	'DistrictType',	'DISTRICT_HOLY_SITE'),
		('P0K_SACRAL_ARCHITECTURE_HOLY_SITE_BUILDING_BOOST_MODIFIER',	'Amount',		50),
		('P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT',					'ModifierId',	'P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT_MODIFIER'),
		('P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT_MODIFIER',			'UnitType',		'UNIT_INQUISITOR'),
		('P0K_WITCHCRAFT_TRIALS_INQUISITOR_DISCOUNT_MODIFIER',			'Amount',		50),
		('P0K_WITCHCRAFT_TRIALS_ADJUST_INQUISITOR_CHARGES',				'ModifierId',	'P0K_WITCHCRAFT_TRIALS_ADJUST_INQUISITOR_CHARGES_MODIFIER'),
		('P0K_WITCHCRAFT_TRIALS_ADJUST_INQUISITOR_CHARGES_MODIFIER',	'Amount',		1),
		('P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT',						'ModifierId',	'P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT_MODIFIER'),
		('P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT_MODIFIER',				'UnitType',		'UNIT_GURU'),
		('P0K_LAYING_ON_OF_HANDS_GURU_DISCOUNT_MODIFIER',				'Amount',		50),
		('P0K_LAYING_ON_OF_HANDS_ADJUST_GURU_CHARGES',					'ModifierId',	'P0K_LAYING_ON_OF_HANDS_ADJUST_GURU_CHARGES_MODIFIER'),
		('P0K_LAYING_ON_OF_HANDS_ADJUST_GURU_CHARGES_MODIFIER',			'Amount',		1),
		('P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE',						'ModifierId',	'P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE_MODIFIER'),
		('P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE_MODIFIER',				'Origin',		1),
		('P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE_MODIFIER',				'Destination',	1),
		('P0K_PIOUS_MERCHANTS_RELIGIOUS_PRESSURE_MODIFIER',				'Amount',		100),		
		('P0K_CANONIZATION_GREAT_PERSON_RELIGIOUS_PRESSURE',			'ModifierId',	'P0K_CANONIZATION_GREAT_PERSON_RELIGIOUS_PRESSURE_MODIFIER'),
		('P0K_CANONIZATION_GREAT_PERSON_RELIGIOUS_PRESSURE_MODIFIER',	'Amount',		400),
		('P0K_MILITARISTIC_SECT_RELIGIOUS_UNIT_COMBAT',					'ModifierId',	'P0K_MILITARISTIC_SECT_RELIGIOUS_UNIT_COMBAT_MODIFIER'),
		('P0K_MILITARISTIC_SECT_RELIGIOUS_UNIT_COMBAT_MODIFIER',		'AbilityType',	'ABILITY_P0K_MILITARISTIC_SECT'),
		('P0K_BY_THE_SWORD_CAPTURED_CITY_MAJORITY_RELIGION',			'ModifierId',	'P0K_BY_THE_SWORD_CAPTURED_CITY_MAJORITY_RELIGION_MODIFIER'),
		('P0K_BY_THE_SWORD_CAPTURED_CITY_MAJORITY_RELIGION_MODIFIER',	'AbilityType',	'ABILITY_P0K_BY_THE_SWORD');