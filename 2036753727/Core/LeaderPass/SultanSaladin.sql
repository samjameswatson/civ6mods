--============================================================================================================= 
-- CIVILIZATIONS EXPANDED: SULTAN SALADIN
--=============================================================================================================
-- LEADER UNIQUE ABILITY: AYYUBID DYNASTY (ENHANCEMENT)
--=============================================================================================================
-- +100% Great General points.
-- Encampments grant a standard adjacency bonus to all specialty districts. 
-- May purchase Encampment buildings with Faith.
-- Training a heavy cavalry unit grants a duplicate of that unit for free.
--=============================================================================================================
-- Types
---------------------------------------------------------------------------------------------------------------
INSERT INTO Types
		(Type,											Kind)
VALUES	('P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY',	'KIND_ABILITY');
---------------------------------------------------------------------------------------------------------------
-- TypeTags
---------------------------------------------------------------------------------------------------------------
INSERT INTO TypeTags
		(Type,											Tag)
VALUES	('P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY',	'CLASS_ALL_COMBAT_UNITS');
---------------------------------------------------------------------------------------------------------------
-- UnitAbilities
---------------------------------------------------------------------------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,								Name,													Description,													Inactive,	ShowFloatTextWhenEarned,	Permanent)
VALUES	('P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY',	'LOC_P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY_NAME',	'LOC_P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY_DESCRIPTION',	1,			0,							1);
---------------------------------------------------------------------------------------------------------------
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,										ModifierType)
VALUES	('P0K_SALADIN_DOUBLE_GENERAL_POINTS',				'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
		('P0K_SALADIN_PURCHASE_BUILDINGS_WITH_FAITH',		'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE'),
		('P0K_SALADIN_DOUBLE_HEAVY_CAVALRY',				'MODIFIER_PLAYER_UNITS_ADJUST_EXTRA_UNIT_COPY_TAG'),
		('P0K_SALADIN_GRANT_CONQUEST_CONVERT_CITY_ABILITY',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
		('P0K_SALADIN_CONQUEST_CONVERT_CITY',				'MODIFIER_PLAYER_UNIT_ADJUST_CITY_ON_CAPTURE');
---------------------------------------------------------------------------------------------------------------
-- ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,										Name,						Value)
VALUES	('P0K_SALADIN_DOUBLE_GENERAL_POINTS',				'GreatPersonClassType',	'GREAT_PERSON_CLASS_GENERAL'),
		('P0K_SALADIN_DOUBLE_GENERAL_POINTS',				'Amount',				100),
		('P0K_SALADIN_PURCHASE_BUILDINGS_WITH_FAITH',		'DistrictType',			'DISTRICT_ENCAMPMENT'),
		('P0K_SALADIN_DOUBLE_HEAVY_CAVALRY',				'Tag',					'CLASS_HEAVY_CAVALRY'),
		('P0K_SALADIN_DOUBLE_HEAVY_CAVALRY',				'Amount',				1),
		('P0K_SALADIN_GRANT_CONQUEST_CONVERT_CITY_ABILITY',	'AbilityType',			'P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY'),
		('P0K_SALADIN_CONQUEST_CONVERT_CITY',				'Enable',				1);
---------------------------------------------------------------------------------------------------------------
-- UnitAbilityModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,								ModifierId)
VALUES	('P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY',	'P0K_SALADIN_CONQUEST_CONVERT_CITY');
---------------------------------------------------------------------------------------------------------------
-- TraitModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('TRAIT_LEADER_SALADIN_ALT',	'P0K_SALADIN_DOUBLE_GENERAL_POINTS'),
		('TRAIT_LEADER_SALADIN_ALT',	'P0K_SALADIN_PURCHASE_BUILDINGS_WITH_FAITH'),
		('TRAIT_LEADER_SALADIN_ALT',	'P0K_SALADIN_DOUBLE_HEAVY_CAVALRY'),
		('TRAIT_LEADER_SALADIN_ALT',	'P0K_SALADIN_GRANT_CONQUEST_CONVERT_CITY_ABILITY');
