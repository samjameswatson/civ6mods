-- UC_AQD_CSE
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers 
		(ModifierId,										ModifierType,											SubjectRequirementSetId)
VALUES	('MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);

UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_HAS_LARGEST_INFLUENCE' WHERE ModifierId='MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,				Value)
VALUES	('MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD',			'ModifierId',		'MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD'		),
		('MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD',		'BuildingType',		'BUILDING_JNR_ORCHARD'								),
		('MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD',		'YieldType',		'YIELD_FOOD'										),
		('MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD',		'CityStatesOnly',	1													),
		('MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD',		'ModifierId',		'MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD'	),
		('MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD',	'BuildingType',		'BUILDING_JNR_HAMMER_WORKS'							),
		('MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD',	'YieldType',		'YIELD_FOOD'										),
		('MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD',	'CityStatesOnly',	1													),
		('MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD',		'ModifierId',		'MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD'		),
		('MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD',	'BuildingType',		'BUILDING_JNR_BATHHOUSE'							),
		('MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD',	'YieldType',		'YIELD_FOOD'										),
		('MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD',	'CityStatesOnly',	1													);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,				Value)
SELECT	'MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD_MOD',			'Amount',			Value
FROM	ModifierArguments
WHERE	Name='Amount' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD_MOD';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,				Value)
SELECT	'MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD_MOD',		'Amount',			Value
FROM	ModifierArguments
WHERE	Name='Amount' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD_MOD';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,				Value)
SELECT	'MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD_MOD',			'Amount',			Value
FROM	ModifierArguments
WHERE	Name='Amount' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD_MOD';

UPDATE ModifierArguments SET Value=(SELECT Value FROM ModifierArguments WHERE ModifierId='MODIFIER_CSE_AGRICULTURAL_AQUEDUCT_FOOD_MOD' AND Name='Amount') WHERE ModifierId='MODIFIER_CSE_AGRICULTURAL_SEWER_FOOD_MOD' AND Name='Amount';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 							ModifierId										)
VALUES	('MINOR_CIV_CSE_AGRICULTURAL_TRAIT',	'MODIFIER_CSE_AGRICULTURAL_ORCHARD_FOOD'		),
		('MINOR_CIV_CSE_AGRICULTURAL_TRAIT',	'MODIFIER_CSE_AGRICULTURAL_HAMMER_WORKS_FOOD'	),
		('MINOR_CIV_CSE_AGRICULTURAL_TRAIT',	'MODIFIER_CSE_AGRICULTURAL_BATHHOUSE_FOOD'		);

DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_AQUEDUCT_FOOD';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_FOOD_MARKET_FOOD';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_AGRICULTURAL_TRAIT' AND ModifierId='MODIFIER_CSE_AGRICULTURAL_SHOPPING_MALL_FOOD';
--------------------------------------------------------------