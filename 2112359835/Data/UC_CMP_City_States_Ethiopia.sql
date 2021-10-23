-- UC_CMP_City_States_Ethiopia
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType,											SubjectRequirementSetId)
VALUES	('MINOR_CIV_SCIENTIFIC_SMALL_INFLUENCE_ACADEMY_JNR',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_SMALL_INFLUENCE'),
		('MINOR_CIV_SCIENTIFIC_MEDIUM_INFLUENCE_SCHOOL_JNR',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_MEDIUM_INFLUENCE'),
		('MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_LABORATORY_JNR',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_LIBERAL_ARTS_JNR',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_LARGE_INFLUENCE'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_ACADEMY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LABORATORY_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LIBERAL_ARTS_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,				Value)
VALUES	('MINOR_CIV_SCIENTIFIC_SMALL_INFLUENCE_ACADEMY_JNR',		'ModifierId',		'MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR'),
		('MINOR_CIV_SCIENTIFIC_MEDIUM_INFLUENCE_SCHOOL_JNR',		'ModifierId',		'MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR'),
		('MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_LABORATORY_JNR',		'ModifierId',		'MINOR_CIV_SCIENTIFIC_YIELD_FOR_LABORATORY_JNR'),
		('MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_LIBERAL_ARTS_JNR',	'ModifierId',		'MINOR_CIV_SCIENTIFIC_YIELD_FOR_LIBERAL_ARTS_JNR'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_ACADEMY_JNR',				'BuildingType',		'BUILDING_JNR_ACADEMY'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR',				'BuildingType',		'BUILDING_JNR_SCHOOL'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LABORATORY_JNR',			'BuildingType',		'BUILDING_JNR_LABORATORY'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LIBERAL_ARTS_JNR',			'BuildingType',		'BUILDING_JNR_LIBERAL_ARTS'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_ACADEMY_JNR',				'YieldType',		'YIELD_SCIENCE'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR',				'YieldType',		'YIELD_SCIENCE'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LABORATORY_JNR',			'YieldType',		'YIELD_SCIENCE'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LIBERAL_ARTS_JNR',			'YieldType',		'YIELD_SCIENCE'),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_ACADEMY_JNR',				'Amount',			1),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR',				'Amount',			2),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LABORATORY_JNR',			'Amount',			3),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LIBERAL_ARTS_JNR',			'Amount',			3),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_ACADEMY_JNR',				'CityStatesOnly',	1),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_SCHOOL_JNR',				'CityStatesOnly',	1),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LABORATORY_JNR',			'CityStatesOnly',	1),
		('MINOR_CIV_SCIENTIFIC_YIELD_FOR_LIBERAL_ARTS_JNR',			'CityStatesOnly',	1);
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('MINOR_CIV_SCIENTIFIC_TRAIT',	'MINOR_CIV_SCIENTIFIC_SMALL_INFLUENCE_ACADEMY_JNR'),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MINOR_CIV_SCIENTIFIC_MEDIUM_INFLUENCE_SCHOOL_JNR'),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_LABORATORY_JNR'),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_LIBERAL_ARTS_JNR');

DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_SCIENTIFIC_TRAIT' AND ModifierId='MINOR_CIV_SCIENTIFIC_LARGE_INFLUENCE_RESEARCH_LAB';
--------------------------------------------------------------