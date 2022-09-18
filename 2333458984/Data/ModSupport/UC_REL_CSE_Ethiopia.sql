-- UC_REL_CSE_Ethiopia
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers 
		(ModifierId,									ModifierType,											SubjectRequirementSetId			)
VALUES	('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGEST_INFLUENCE'	),
		('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH_MOD',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL							),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGEST_INFLUENCE'	),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH_MOD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL							);

UPDATE	Modifiers SET SubjectRequirementSetId='PLAYER_HAS_SMALL_INFLUENCE'	WHERE ModifierId='MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH';
UPDATE	Modifiers SET SubjectRequirementSetId='PLAYER_HAS_MEDIUM_INFLUENCE'	WHERE ModifierId='MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value											)
VALUES	('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH',		'ModifierId',		'MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH_MOD'	),
		('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH_MOD',	'BuildingType',		'BUILDING_JNR_HOSPITIUM'						),
		('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH_MOD',	'YieldType',		'YIELD_FAITH'									),
		('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH_MOD',	'Amount',			4												),
		('MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH_MOD',	'CityStatesOnly',	1												),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH',			'ModifierId',		'MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH_MOD'		),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH_MOD',		'BuildingType',		'BUILDING_JNR_GARDEN'							),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH_MOD',		'YieldType',		'YIELD_FAITH'									),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH_MOD',		'Amount',			4												),
		('MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH_MOD',		'CityStatesOnly',	1												);

UPDATE	ModifierArguments
SET		Value = 1
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD';

UPDATE	ModifierArguments
SET		Value = 4
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_RELIGIOUS_CHANCERY_FAITH_MOD_ETHIOPIA_LARGEST';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 					ModifierId									)
VALUES	('MINOR_CIV_RELIGIOUS_TRAIT',	'MODIFIER_CSE_RELIGIOUS_HOSPITIUM_FAITH'	),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'MODIFIER_CSE_RELIGIOUS_GARDEN_FAITH'		);

DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_RELIGIOUS_TRAIT' AND ModifierId='MODIFIER_CSE_RELIGIOUS_SHRINE_FAITH_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_RELIGIOUS_TRAIT' AND ModifierId='MODIFIER_CSE_RELIGIOUS_TEMPLE_FAITH_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_RELIGIOUS_TRAIT' AND ModifierId='MODIFIER_CSE_RELIGIOUS_CONSULATE_FAITH_ETHIOPIA_LARGEST';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_RELIGIOUS_TRAIT' AND ModifierId='MODIFIER_CSE_RELIGIOUS_' || (SELECT BuildingType FROM Buildings WHERE EnabledByReligion=1) || '_FAITH_ETHIOPIA';
--------------------------------------------------------------