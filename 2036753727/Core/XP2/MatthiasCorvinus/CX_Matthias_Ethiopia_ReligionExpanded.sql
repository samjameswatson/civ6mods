/* 
	Civilizations Expanded: Matthias Corvinus Leader Ability (Ethiopia DLC + Religion Expanded activated)
	Author: p0kiehl
*/
--=============================================================================================================
-- LEADER UNIQUE ABILITY: RAVEN KING (ENHANCEMENT)
--=============================================================================================================
-- (Add Religion Expanded buildings to the ability defined in CX_Matthias_Ethiopia.sql)
--=============================================================================================================
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,														ModifierType,												SubjectRequirementSetId)
VALUES	('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BASILICA',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BETH_MANDA',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_KHALWAT',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BUTTO',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_DERASAR',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_CANDI',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_SERAPEUM',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'P0K_HUNGARY_MATTHIAS_SUZERAIN_LARGE_INFLUENCE'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BASILICA',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BETH_MANDA',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_KHALWAT',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BUTTO',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_DERASAR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_CANDI',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_SERAPEUM',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',		NULL);
---------------------------------------------------------------------------------------------------------------	
-- ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments		
		(ModifierId,														Name,				Value)
VALUES	('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BASILICA',	'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BASILICA'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BETH_MANDA',	'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BETH_MANDA'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_KHALWAT',		'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_KHALWAT'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BUTTO',		'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BUTTO'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_DERASAR',		'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_DERASAR'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_CANDI',		'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_CANDI'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_SERAPEUM',	'ModifierId',		'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_SERAPEUM'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BASILICA',			'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BASILICA',			'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BASILICA',			'BuildingType',		'BUILDING_P0K_BASILICA'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BASILICA',			'CityStatesOnly',	1),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BETH_MANDA',		'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BETH_MANDA',		'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BETH_MANDA',		'BuildingType',		'BUILDING_P0K_BETH_MANDA'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BETH_MANDA',		'CityStatesOnly',	1),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_KHALWAT',			'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_KHALWAT',			'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_KHALWAT',			'BuildingType',		'BUILDING_P0K_KHALWAT'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_KHALWAT',			'CityStatesOnly',	1),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BUTTO',				'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BUTTO',				'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BUTTO',				'BuildingType',		'BUILDING_P0K_BUTTO'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_BUTTO',				'CityStatesOnly',	1),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_DERASAR',			'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_DERASAR',			'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_DERASAR',			'BuildingType',		'BUILDING_P0K_DERASAR'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_DERASAR',			'CityStatesOnly',	1),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_CANDI',				'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_CANDI',				'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_CANDI',				'BuildingType',		'BUILDING_P0K_CANDI'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_CANDI',				'CityStatesOnly',	1),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_SERAPEUM',			'YieldType',		'YIELD_FAITH'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_SERAPEUM',			'Amount',			3),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_SERAPEUM',			'BuildingType',		'BUILDING_P0K_SERAPEUM'),
		('P0K_HUNGARY_MINOR_CIV_RELIGIOUS_YIELD_FOR_P0K_SERAPEUM',			'CityStatesOnly',	1);
---------------------------------------------------------------------------------------------------------------
-- TraitModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BASILICA'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BETH_MANDA'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_KHALWAT'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_BUTTO'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_DERASAR'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_CANDI'),
		('MINOR_CIV_RELIGIOUS_TRAIT',	'P0K_HUNGARY_MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_P0K_SERAPEUM');
