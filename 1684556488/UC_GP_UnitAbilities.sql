-- UC_GP_UnitAbilities
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR REPLACE INTO Types
		(Type,										Kind)
VALUES	('ABILITY_JNR_GOV_PROPAGANDA_STEALTH',		'KIND_ABILITY'),
		('ABILITY_JNR_GOV_PROPAGANDA_IGNORE_ZOC',	'KIND_ABILITY'),
		('ABILITY_JNR_GOV_MOCC_AIRCRAFT',			'KIND_ABILITY');
--------------------------------------------------------------

-- TypeTags
--------------------------------------------------------------
INSERT OR REPLACE INTO TypeTags
		(Type,										Tag)
VALUES	('ABILITY_JNR_GOV_PROPAGANDA_STEALTH',		'CLASS_RELIGIOUS_ALL'),
		('ABILITY_JNR_GOV_PROPAGANDA_IGNORE_ZOC',	'CLASS_RELIGIOUS_ALL'),
		('ABILITY_JNR_GOV_MOCC_AIRCRAFT',			'CLASS_AIRCRAFT');
--------------------------------------------------------------

-- UnitAbilities
--------------------------------------------------------------
UPDATE UnitAbilities SET Inactive=1 WHERE UnitAbilityType='ABILITY_ROCK_BAND_ENTER_FOREIGN_LANDS';

INSERT OR REPLACE INTO UnitAbilities
		(UnitAbilityType,							Name,										Description,									Inactive)
VALUES	('ABILITY_JNR_GOV_PROPAGANDA_STEALTH',		'LOC_ABILITY_STEALTH_NAME',					'LOC_ABILITY_STEALTH_DESCRIPTION',				1),
		('ABILITY_JNR_GOV_PROPAGANDA_IGNORE_ZOC',	'LOC_ABILITY_IGNORE_ZOC_NAME',				'LOC_ABILITY_IGNORE_ZOC_DESCRIPTION',			1),
		('ABILITY_JNR_GOV_MOCC_AIRCRAFT',			'LOC_ABILITY_JNR_GOV_MOCC_AIRCRAFT_NAME',	'LOC_ABILITY_JNR_GOV_MOCC_AIRCRAFT_DESCRIPTION',	1);
--------------------------------------------------------------

-- UnitAbilityModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers
		(UnitAbilityType,							ModifierId)
VALUES	('ABILITY_JNR_GOV_PROPAGANDA_STEALTH',		'CAMOUFLAGE_STEALTH'),
		('ABILITY_JNR_GOV_PROPAGANDA_IGNORE_ZOC',	'IGNOREZOC_IGNORE_ZOC'),
		('ABILITY_JNR_GOV_MOCC_AIRCRAFT',			'JNR_GOV_MOCC_AIRCRAFT_MOVES'),
		('ABILITY_JNR_GOV_MOCC_AIRCRAFT',			'JNR_GOV_MOCC_AIRCRAFT_RANGE');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers
		(ModifierId,							ModifierType)
VALUES	('JNR_GOV_MOCC_AIRCRAFT_MOVES',	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT'),
		('JNR_GOV_MOCC_AIRCRAFT_RANGE',	'MODIFIER_PLAYER_UNITS_ADJUST_ATTACK_RANGE');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,					Name,		Value)
VALUES	('JNR_GOV_MOCC_AIRCRAFT_MOVES',	'Amount',	3),
		('JNR_GOV_MOCC_AIRCRAFT_RANGE',	'Amount',	2);
--------------------------------------------------------------
