-- UC_REL_City_States_GS
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType,											SubjectRequirementSetId)
VALUES	('MINOR_CIV_RELIGIOUS_MEDIUM_INFLUENCE_BONUS_ALTAR_JNR',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_MEDIUM_INFLUENCE'),
		('MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_BONUS_MONASTERY_JNR',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_ALTAR_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_MONASTERY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,				Value)
VALUES	('MINOR_CIV_RELIGIOUS_MEDIUM_INFLUENCE_BONUS_ALTAR_JNR',	'ModifierId',		'MINOR_CIV_RELIGIOUS_YIELD_FOR_ALTAR_JNR'),
		('MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_BONUS_MONASTERY_JNR',	'ModifierId',		'MINOR_CIV_RELIGIOUS_YIELD_FOR_MONASTERY_JNR'),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_ALTAR_JNR',					'BuildingType',		'BUILDING_JNR_ALTAR'),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_MONASTERY_JNR',				'BuildingType',		'BUILDING_JNR_MONASTERY'),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_ALTAR_JNR',					'YieldType',		'YIELD_FAITH'),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_MONASTERY_JNR',				'YieldType',		'YIELD_FAITH'),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_ALTAR_JNR',					'Amount',			2),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_MONASTERY_JNR',				'Amount',			2),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_ALTAR_JNR',					'CityStatesOnly',	1),
		('MINOR_CIV_RELIGIOUS_YIELD_FOR_MONASTERY_JNR',				'CityStatesOnly',	1);
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('MINOR_CIV_RELIGIOUS_TRAIT',	'MINOR_CIV_RELIGIOUS_MEDIUM_INFLUENCE_BONUS_ALTAR_JNR'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_BONUS_MONASTERY_JNR');
--------------------------------------------------------------