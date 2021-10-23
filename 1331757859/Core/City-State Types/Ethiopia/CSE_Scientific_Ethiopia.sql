/*
	Scientific
	Authors: SeelingCat
*/

-----------------------------------------------
-- TraitModifiers
-----------------------------------------------

INSERT INTO TraitModifiers 
		(TraitType, 					ModifierId												)
VALUES	('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_ETHIOPIA'			),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_ETHIOPIA'				),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_ETHIOPIA'		),

		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_ETHIOPIA'				),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_ETHIOPIA'				),
		
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_ETHIOPIA_LARGEST'		),
		('MINOR_CIV_SCIENTIFIC_TRAIT',	'MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_ETHIOPIA_LARGEST'		);

-----------------------------------------------
-- Modifiers
-----------------------------------------------

INSERT INTO Modifiers 
		(ModifierId,														ModifierType,													SubjectRequirementSetId					)
VALUES	('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_ETHIOPIA',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_LARGEST_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD_ETHIOPIA',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_ETHIOPIA',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_LARGEST_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_MOD_ETHIOPIA',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_ETHIOPIA',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_LARGEST_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD_ETHIOPIA',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									),

		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_ETHIOPIA_LARGEST',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_LARGEST_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA_LARGEST',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_ETHIOPIA_LARGEST',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_LARGEST_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA_LARGEST',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									),

		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_ETHIOPIA',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_LARGE_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_ETHIOPIA',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_MEDIUM_INFLUENCE'			),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',			NULL									);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------

INSERT INTO ModifierArguments
		(ModifierId,														Name,				Value														)
VALUES	('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_ETHIOPIA',				'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD_ETHIOPIA'		),
		('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD_ETHIOPIA',			'BuildingType',		'BUILDING_LIBRARY'											),
		('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD_ETHIOPIA',			'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD_ETHIOPIA',			'Amount',			1															),
		('MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD_ETHIOPIA',			'CityStatesOnly',	1															),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_ETHIOPIA',				'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_MOD_ETHIOPIA'	),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_MOD_ETHIOPIA',			'BuildingType',		'BUILDING_UNIVERSITY'										),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_MOD_ETHIOPIA',			'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_MOD_ETHIOPIA',			'Amount',			1															),
		('MODIFIER_CSE_SCIENTIFIC_UNIVERSITY_SCIENCE_MOD_ETHIOPIA',			'CityStatesOnly',	1															),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_ETHIOPIA',			'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD_ETHIOPIA'	),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD_ETHIOPIA',		'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD_ETHIOPIA',		'Amount',			1															),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD_ETHIOPIA',		'BuildingType',		'BUILDING_RESEARCH_LAB'										),
		('MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD_ETHIOPIA',		'CityStatesOnly',	1															),

		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_ETHIOPIA',				'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA'		),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA',			'BuildingType',		'BUILDING_CHANCERY'											),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA',			'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA',			'Amount',			3															),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA',			'CityStatesOnly',	1															),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_ETHIOPIA',				'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA'	),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA',			'BuildingType',		'BUILDING_CONSULATE'										),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA',			'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA',			'Amount',			2															),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA',			'CityStatesOnly',	1															),

		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_ETHIOPIA_LARGEST',		'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA_LARGEST'	),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA_LARGEST',	'BuildingType',		'BUILDING_CHANCERY'											),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA_LARGEST',	'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA_LARGEST',	'Amount',			1															),
		('MODIFIER_CSE_SCIENTIFIC_CHANCERY_SCIENCE_MOD_ETHIOPIA_LARGEST',	'CityStatesOnly',	1															),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_ETHIOPIA_LARGEST',		'ModifierId',		'MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA_LARGEST'	),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA_LARGEST',	'BuildingType',		'BUILDING_CONSULATE'										),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA_LARGEST',	'YieldType',		'YIELD_SCIENCE'												),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA_LARGEST',	'Amount',			1															),
		('MODIFIER_CSE_SCIENTIFIC_CONSULATE_SCIENCE_MOD_ETHIOPIA_LARGEST',	'CityStatesOnly',	1															);

UPDATE	ModifierArguments
SET		Value = 1
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_SCIENTIFIC_CAPITAL_SCIENCE_MOD';

UPDATE	ModifierArguments
SET		Value = 1
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_SCIENTIFIC_LIBRARY_SCIENCE_MOD';

UPDATE	ModifierArguments
SET		Value = 3
WHERE	Name = 'Amount' AND ModifierId = 'MODIFIER_CSE_SCIENTIFIC_RESEARCH_LAB_SCIENCE_MOD';