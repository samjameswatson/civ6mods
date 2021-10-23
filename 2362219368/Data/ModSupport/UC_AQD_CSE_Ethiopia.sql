-- UC_AQD_CSE_Ethiopia
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers 
		(ModifierId,									ModifierType,											SubjectRequirementSetId			)
VALUES	('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_MEDIUM_INFLUENCE'	),
		('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD_MOD',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_AQUEDUCT_JNR'			);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,				Value											)
VALUES	('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD',			'ModifierId',		'MODIFIER_CSE_AGRICULTURAL_INSTITUTE_FOOD_MOD'	),
		('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD_MOD',		'BuildingType',		'BUILDING_GRANARY'								),
		('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD_MOD',		'YieldType',		'YIELD_FOOD'									),
		('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD_MOD',		'Amount',			2												),
		('MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD_MOD',		'CityStatesOnly',	1												);

UPDATE	ModifierArguments
SET		Value = 3
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD';

UPDATE	ModifierArguments
SET		Value = 3
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD';

UPDATE	ModifierArguments
SET		Value = 3
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD';

UPDATE	ModifierArguments
SET		Value = 4
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD_MOD';

UPDATE	ModifierArguments
SET		Value = 4
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_AGRICULTURAL_CHANCERY_FOOD_MOD_ETHIOPIA_LARGEST';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 							ModifierId									)
VALUES	('MINOR_CIV_CSE_AGRICULTURAL_TRAIT',	'MODIFIER_CSE_AGRICULTURAL_CISTERN_FOOD'	);

DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_GRANARY_FOOD_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_AQUEDUCT_FOOD_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_FOOD_MARKET_FOOD_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_SHOPPING_MALL_FOOD_ETHIOPIA';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_CONSULATE_FOOD_ETHIOPIA_LARGEST';
--------------------------------------------------------------