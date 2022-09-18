-- UC_REL_CSE
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers 
		(ModifierId,									ModifierType,											SubjectRequirementSetId)
VALUES	('MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_MEDIUM_INFLUENCE'),
		('MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH_MOD',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);
		--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
VALUES	('MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH',			'ModifierId',		'MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD'		),
		('MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD',		'BuildingType',		'BUILDING_JNR_ALTAR'							),
		('MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD',		'YieldType',		'YIELD_FAITH'									),		
		('MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD',		'CityStatesOnly',	1												),
		('MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH',		'ModifierId',		'MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH_MOD'	),
		('MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH_MOD',	'BuildingType',		'BUILDING_JNR_MONASTERY'						),
		('MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH_MOD',	'YieldType',		'YIELD_FAITH'									),
		('MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH_MOD',	'CityStatesOnly',	1												);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
SELECT	'MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH_MOD',		'Amount',			Value
FROM	ModifierArguments
WHERE	Name='Amount' AND ModifierId='MODIFIER_CSE_RELIGIOUS_SHRINE_FAITH_MOD';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
SELECT	'MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH_MOD',	'Amount',			Value
FROM	ModifierArguments
WHERE	Name='Amount' AND ModifierId='MODIFIER_CSE_RELIGIOUS_TEMPLE_FAITH_MOD';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 					ModifierId									)
VALUES	('MINOR_CIV_RELIGIOUS_TRAIT',	'MODIFIER_CSE_RELIGIOUS_ALTAR_FAITH'		),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'MODIFIER_CSE_RELIGIOUS_MONASTERY_FAITH'	);
--------------------------------------------------------------