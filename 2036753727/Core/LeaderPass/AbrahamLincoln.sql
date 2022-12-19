--============================================================================================================= 
-- CIVILIZATIONS EXPANDED LITE: ABRAHAM LINCOLN
--=============================================================================================================
-- LEADER UNIQUE ABILITY: GETTYSBURG ADDRESS (REWORK)
--=============================================================================================================
-- +25% Production towards Industrial Zones and their buildings.
-- Constructing an Industrial Zone or its buildings grants a free melee unit. This unit receives +5 Combat Strength and ignores Strategic resource requirements.
-- Upon entering the Industrial Era, cities with an Industrial Zone receive +2 Amenities and cities without an Industrial Zone receive -5 Loyalty.
-- Defeating enemy units within 9 tiles of the Capital provides a burst of Great General points if on land and Great Admiral points if on water.
--=============================================================================================================
-- First, remove the Plantation Loyalty penalty; it's attached directly to the Improvement itself.
---------------------------------------------------------------------------------------------------------------
DELETE FROM	ImprovementModifiers
WHERE		ImprovementType = 'IMPROVEMENT_PLANTATION'
AND			ModifierID = 'PLANTATION_NEGATIVE_LOYALTY';
---------------------------------------------------------------------------------------------------------------
-- Types
---------------------------------------------------------------------------------------------------------------
INSERT INTO Types
		(Type,											Kind)
VALUES	('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'KIND_ABILITY'),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'KIND_ABILITY');
---------------------------------------------------------------------------------------------------------------
-- TypeTags
---------------------------------------------------------------------------------------------------------------
INSERT INTO TypeTags
		(Type,											Tag)
VALUES	('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_RECON'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_MELEE'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_RANGED'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_ANTI_CAVALRY'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_LIGHT_CAVALRY'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_HEAVY_CAVALRY'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_RANGED_CAVALRY'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_LIGHT_CHARIOT'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_HEAVY_CHARIOT'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_SIEGE'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_WARRIOR_MONK'),
		('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'CLASS_GIANT_DEATH_ROBOT'),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'CLASS_NAVAL_MELEE'),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'CLASS_NAVAL_RANGED'),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'CLASS_NAVAL_RAIDER'),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'CLASS_NAVAL_CARRIER');
---------------------------------------------------------------------------------------------------------------
-- UnitAbilities
---------------------------------------------------------------------------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,								Name,													Description,												Inactive,	ShowFloatTextWhenEarned,	Permanent)
VALUES	('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'LOC_P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS_NAME',	'LOC_P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS_DESCRIPTION',	1,			0,							1),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'LOC_P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS_NAME',	'LOC_P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS_DESCRIPTION',	1,			0,							1);
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO Requirements
		(RequirementId,										RequirementType,					Inverse)
VALUES	('P0K_LINCOLN_REQUIRES_PLAYER_IS_INDUSTRIAL_ERA',	'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0),
		('P0K_LINCOLN_REQUIRES_CITY_NO_INDUSTRIAL_ZONE',	'REQUIREMENT_CITY_HAS_DISTRICT',	1);	
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,										Name,			Value)
VALUES	('P0K_LINCOLN_REQUIRES_PLAYER_IS_INDUSTRIAL_ERA',	'EraType',		'ERA_INDUSTRIAL'),
		('P0K_LINCOLN_REQUIRES_CITY_NO_INDUSTRIAL_ZONE',	'DistrictType',	'DISTRICT_INDUSTRIAL_ZONE');
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('P0K_LINCOLN_INDUSTRIAL_ZONE_AMENITIES_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
		('P0K_LINCOLN_NO_INDUSTRIAL_ZONE_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');
	--	('P0K_LINCOLN_ABILITY_REQUIRES_LAND_DOMAIN',			'REQUIREMENTSET_TEST_ALL'),
	--	('P0K_LINCOLN_ABILITY_REQUIRES_SEA_DOMAIN'),			'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('P0K_LINCOLN_INDUSTRIAL_ZONE_AMENITIES_REQUIREMENTS',	'P0K_LINCOLN_REQUIRES_PLAYER_IS_INDUSTRIAL_ERA'),
		('P0K_LINCOLN_INDUSTRIAL_ZONE_AMENITIES_REQUIREMENTS',	'REQUIRES_DISTRICT_IS_INDUSTRIAL_ZONE'),
		('P0K_LINCOLN_NO_INDUSTRIAL_ZONE_REQUIREMENTS',			'P0K_LINCOLN_REQUIRES_PLAYER_IS_INDUSTRIAL_ERA'),
		('P0K_LINCOLN_NO_INDUSTRIAL_ZONE_REQUIREMENTS',			'P0K_LINCOLN_REQUIRES_CITY_NO_INDUSTRIAL_ZONE');
	--	('P0K_LINCOLN_ABILITY_REQUIRES_LAND_DOMAIN',			'REQUIRES_LAND_DOMAIN'),
	--	('P0K_LINCOLN_ABILITY_REQUIRES_LAND_DOMAIN',			'REQUIRES_AIR_DOMAIN'),
	--	('P0K_LINCOLN_ABILITY_REQUIRES_SEA_DOMAIN',				'REQUIRES_SEA_DOMAIN');
---------------------------------------------------------------------------------------------------------------
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,												ModifierType,																		SubjectRequirementSetId)
VALUES	('P0K_LINCOLN_INDUSTRIAL_ZONE_BOOST',						'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',								NULL),
		('P0K_LINCOLN_INDUSTRIAL_ZONE_BUILDING_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',								NULL),
		('P0K_TRAIT_INDUSTRIAL_ZONE_AMENITIES',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_DISTRICT_AMENITY',								'P0K_LINCOLN_INDUSTRIAL_ZONE_AMENITIES_REQUIREMENTS'),
		('P0K_TRAIT_NO_INDUSTRIAL_ZONE_LOYALTY_PENALTY',			'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',									'P0K_LINCOLN_NO_INDUSTRIAL_ZONE_REQUIREMENTS'),
		('P0K_TRAIT_LINCOLN_GRANT_GREAT_GENERAL_POINTS_ABILITY',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',												NULL),
		('P0K_LINCOLN_GREAT_GENERAL_POINTS',						'MODIFIER_PLAYER_ADJUST_UNITS_GREAT_PEOPLE_POINTS_PER_KILL_BY_DEFEATED_STRENGTH',	NULL),
		('P0K_TRAIT_LINCOLN_GRANT_GREAT_ADMIRAL_POINTS_ABILITY',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',												NULL),
		('P0K_LINCOLN_GREAT_ADMIRAL_POINTS',						'MODIFIER_PLAYER_ADJUST_UNITS_GREAT_PEOPLE_POINTS_PER_KILL_BY_DEFEATED_STRENGTH',	NULL);
---------------------------------------------------------------------------------------------------------------
-- ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,												Name,					Value)
VALUES	('P0K_LINCOLN_INDUSTRIAL_ZONE_BOOST',						'DistrictType',			'DISTRICT_INDUSTRIAL_ZONE'),
		('P0K_LINCOLN_INDUSTRIAL_ZONE_BOOST',						'Amount',				25),
		('P0K_LINCOLN_INDUSTRIAL_ZONE_BUILDING_BOOST',				'DistrictType',			'DISTRICT_INDUSTRIAL_ZONE'),
		('P0K_LINCOLN_INDUSTRIAL_ZONE_BUILDING_BOOST',				'Amount',				25),
		('P0K_TRAIT_INDUSTRIAL_ZONE_AMENITIES',						'Amount',				2),
		('P0K_TRAIT_NO_INDUSTRIAL_ZONE_LOYALTY_PENALTY',			'Amount',				-5),
		('P0K_TRAIT_LINCOLN_GRANT_GREAT_GENERAL_POINTS_ABILITY',	'AbilityType',			'P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS'),
		('P0K_LINCOLN_GREAT_GENERAL_POINTS',						'GreatPersonClassType',	'GREAT_PERSON_CLASS_GENERAL'),
		('P0K_LINCOLN_GREAT_GENERAL_POINTS',						'Amount',				25),
		('P0K_TRAIT_LINCOLN_GRANT_GREAT_ADMIRAL_POINTS_ABILITY',	'AbilityType',			'P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS'),
		('P0K_LINCOLN_GREAT_ADMIRAL_POINTS',						'GreatPersonClassType',	'GREAT_PERSON_CLASS_ADMIRAL'),
		('P0K_LINCOLN_GREAT_ADMIRAL_POINTS',						'Amount',				25);
---------------------------------------------------------------------------------------------------------------
-- UnitAbilityModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,								ModifierId)
VALUES	('P0K_LINCOLN_ABILITY_GREAT_GENERAL_POINTS',	'P0K_LINCOLN_GREAT_GENERAL_POINTS'),
		('P0K_LINCOLN_ABILITY_GREAT_ADMIRAL_POINTS',	'P0K_LINCOLN_GREAT_ADMIRAL_POINTS');
---------------------------------------------------------------------------------------------------------------
-- TraitModifiers
---------------------------------------------------------------------------------------------------------------
DELETE FROM	TraitModifiers
WHERE		TraitType = 'TRAIT_LEADER_LINCOLN'
AND			ModifierId IN 
			('INDUSTRIAL_ZONE_ADDAMENITIES',
		--	'TRAIT_LINCOLN_INDUSTRIAL_ZONE_FREE_MELEE_UNIT',
			'TRAIT_LINCOLN_INDUSTRIAL_ZONE_LOYALTY');

INSERT INTO TraitModifiers
		(TraitType,					ModifierId)
VALUES	('TRAIT_LEADER_LINCOLN',	'P0K_LINCOLN_INDUSTRIAL_ZONE_BOOST'),
		('TRAIT_LEADER_LINCOLN',	'P0K_LINCOLN_INDUSTRIAL_ZONE_BUILDING_BOOST'),
		('TRAIT_LEADER_LINCOLN',	'P0K_TRAIT_INDUSTRIAL_ZONE_AMENITIES'),
		('TRAIT_LEADER_LINCOLN',	'P0K_TRAIT_NO_INDUSTRIAL_ZONE_LOYALTY_PENALTY'),
		('TRAIT_LEADER_LINCOLN',	'P0K_TRAIT_LINCOLN_GRANT_GREAT_GENERAL_POINTS_ABILITY'),
		('TRAIT_LEADER_LINCOLN',	'P0K_TRAIT_LINCOLN_GRANT_GREAT_ADMIRAL_POINTS_ABILITY');