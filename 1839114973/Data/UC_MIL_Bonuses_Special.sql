-- UC_MIL_Bonuses_Special
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_JNR_SINGLE_CITY_ADJUST_OUTER_DEFENSE',	'KIND_MODIFIER'),
		('MODIFIER_JNR_SINGLE_CITY_ADJUST_RANGED_STRIKE',	'KIND_MODIFIER'),
		('MODIFIER_JNR_SINGLE_CITY_ADJUST_HAPPINESS_YIELD',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,										CollectionType,				EffectType)
VALUES	('MODIFIER_JNR_SINGLE_CITY_ADJUST_OUTER_DEFENSE',	'COLLECTION_OWNER',			'EFFECT_ADJUST_CITY_OUTER_DEFENSE'),
		('MODIFIER_JNR_SINGLE_CITY_ADJUST_RANGED_STRIKE',	'COLLECTION_OWNER',			'EFFECT_ADJUST_CITY_RANGED_STRIKE'),
		('MODIFIER_JNR_SINGLE_CITY_ADJUST_HAPPINESS_YIELD',	'COLLECTION_OWNER_CITY',	'EFFECT_ADJUST_CITY_HAPPINESS_YIELD');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,											SubjectRequirementSetId)
VALUES	('JNR_CAVALIER_MILITARY_ENGINEER_CHARGE',		'MODIFIER_SINGLE_CITY_BUILDER_CHARGES',					'UNIT_IS_MILITARY_ENGINEER'),
		('JNR_CAVALIER_OUTERDEFENSE',					'MODIFIER_JNR_SINGLE_CITY_ADJUST_OUTER_DEFENSE',		NULL),
		('JNR_CAVALIER_RANGEDSTRIKE_ANCIENT',			'MODIFIER_JNR_SINGLE_CITY_ADJUST_RANGED_STRIKE',		'CITY_HAS_ANCIENT_WALLS'),
		('JNR_CAVALIER_RANGEDSTRIKE_MEDIEVAL',			'MODIFIER_JNR_SINGLE_CITY_ADJUST_RANGED_STRIKE',		'CITY_HAS_MEDIEVAL_WALLS'),
		('JNR_CAVALIER_RANGEDSTRIKE_RENAISSANCE',		'MODIFIER_JNR_SINGLE_CITY_ADJUST_RANGED_STRIKE',		'CITY_HAS_RENAISSANCE_WALLS'),
		('JNR_PRISON_LOYALTY',							'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN',		NULL),
		('JNR_PRISON_COUNTERSPY',						'MODIFIER_CITY_ADJUST_SPY_BONUS',						NULL),
		('JNR_PRISON_PRODUCTION_DISPLEASED',			'MODIFIER_JNR_SINGLE_CITY_ADJUST_HAPPINESS_YIELD',		NULL),
		('JNR_PRISON_PRODUCTION_UNHAPPY',				'MODIFIER_JNR_SINGLE_CITY_ADJUST_HAPPINESS_YIELD',		NULL),
		('JNR_PRISON_PRODUCTION_UNREST',				'MODIFIER_JNR_SINGLE_CITY_ADJUST_HAPPINESS_YIELD',		NULL),
		('TRAIT_ADJUST_NAVAL_BASE_STOCKPILE_CAP_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_STOCKPILE_CAP',	'BUILDING_IS_NAVAL_BASE_JNR');

UPDATE Modifiers SET Permanent=1 WHERE ModifierId='JNR_CAVALIER_MILITARY_ENGINEER_CHARGE';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
VALUES	('JNR_CAVALIER_MILITARY_ENGINEER_CHARGE',		'Amount',			1),
		('JNR_CAVALIER_OUTERDEFENSE',					'Amount',			2),
		('JNR_CAVALIER_RANGEDSTRIKE_ANCIENT',			'Amount',			2),
		('JNR_CAVALIER_RANGEDSTRIKE_MEDIEVAL',			'Amount',			2),
		('JNR_CAVALIER_RANGEDSTRIKE_RENAISSANCE',		'Amount',			2),
		('JNR_PRISON_LOYALTY',							'Amount',			4),
		('JNR_PRISON_COUNTERSPY',						'Amount',			2),
		('JNR_PRISON_PRODUCTION_DISPLEASED',			'YieldType',		'YIELD_PRODUCTION'),
		('JNR_PRISON_PRODUCTION_DISPLEASED',			'HappinessType',	'HAPPINESS_DISPLEASED'),
		('JNR_PRISON_PRODUCTION_DISPLEASED',			'Amount',			15),
		('JNR_PRISON_PRODUCTION_UNHAPPY',				'YieldType',		'YIELD_PRODUCTION'),
		('JNR_PRISON_PRODUCTION_UNHAPPY',				'HappinessType',	'HAPPINESS_UNHAPPY'),
		('JNR_PRISON_PRODUCTION_UNHAPPY',				'Amount',			30),
		('JNR_PRISON_PRODUCTION_UNREST',				'YieldType',		'YIELD_PRODUCTION'),
		('JNR_PRISON_PRODUCTION_UNREST',				'HappinessType',	'HAPPINESS_UNREST'),
		('JNR_PRISON_PRODUCTION_UNREST',				'Amount',			45),
		('TRAIT_ADJUST_NAVAL_BASE_STOCKPILE_CAP_JNR',	'Amount',			10);
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
DELETE FROM TraitModifiers WHERE ModifierId='TRAIT_ADJUST_SHIPYARD_STOCKPILE_CAP';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
VALUES	('BUILDING_JNR_CAVALIER',	'JNR_CAVALIER_MILITARY_ENGINEER_CHARGE'),
		('BUILDING_JNR_CAVALIER',	'JNR_CAVALIER_OUTERDEFENSE'),
		('BUILDING_JNR_CAVALIER',	'JNR_CAVALIER_RANGEDSTRIKE_ANCIENT'),
		('BUILDING_JNR_CAVALIER',	'JNR_CAVALIER_RANGEDSTRIKE_MEDIEVAL'),
		('BUILDING_JNR_CAVALIER',	'JNR_CAVALIER_RANGEDSTRIKE_RENAISSANCE'),
		('BUILDING_JNR_ARSENAL',	'MILITARY_ACADEMY_TRAINED_CORPS_ARMY_DISCOUNT'),
		('BUILDING_JNR_PRISON',		'JNR_PRISON_LOYALTY'),
		('BUILDING_JNR_PRISON',		'JNR_PRISON_COUNTERSPY'),
		('BUILDING_JNR_PRISON',		'JNR_PRISON_PRODUCTION_DISPLEASED'),
		('BUILDING_JNR_PRISON',		'JNR_PRISON_PRODUCTION_UNHAPPY'),
		('BUILDING_JNR_PRISON',		'JNR_PRISON_PRODUCTION_UNREST');

UPDATE BuildingModifiers SET BuildingType='BUILDING_JNR_NAVAL_BASE' WHERE ModifierId='SEAPORT_TRAINED_CORPS_ARMY_DISCOUNT'	AND BuildingType='BUILDING_SEAPORT';
--------------------------------------------------------------

-- Unit_BuildingPrereqs
--------------------------------------------------------------
DELETE FROM Unit_BuildingPrereqs WHERE Unit='UNIT_MILITARY_ENGINEER';

INSERT OR IGNORE INTO Unit_BuildingPrereqs
		(Unit,						PrereqBuilding)
VALUES	('UNIT_MILITARY_ENGINEER',	'BUILDING_BARRACKS'),
		('UNIT_MILITARY_ENGINEER',	'BUILDING_STABLE'),
		('UNIT_MILITARY_ENGINEER',	'BUILDING_JNR_TARGET_RANGE'),
		('UNIT_MEDIC',				'BUILDING_JNR_DEPOT'),
		('UNIT_SUPPLY_CONVOY',		'BUILDING_JNR_DEPOT');
--------------------------------------------------------------

-- Units
--------------------------------------------------------------
UPDATE Units SET Description='LOC_UNIT_MILITARY_ENGINEER_DESCRIPTION_JNR_UC'	WHERE UnitType='UNIT_MILITARY_ENGINEER';
UPDATE Units SET Description='LOC_UNIT_MEDIC_DESCRIPTION_JNR_UC'				WHERE UnitType='UNIT_MEDIC';
UPDATE Units SET Description='LOC_UNIT_SUPPLY_CONVOY_DESCRIPTION_JNR_UC'		WHERE UnitType='UNIT_SUPPLY_CONVOY';
--------------------------------------------------------------