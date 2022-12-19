--============================================================================================================= 
-- CIVILIZATIONS EXPANDED: NZINGA MBANDE
--=============================================================================================================
-- LEADER UNIQUE ABILITY: QUEEN OF NDONGO AND MATAMBA (REWORK)
--=============================================================================================================
-- Cities within 9 tiles of any Capital receive +1 Amenity and generate +1 Influence point per turn.
-- Regional Production and Amenity bonuses from Industrial Zones, Entertainment Complexes, and Water Parks extend 3 tiles further.
-- +4 Gold, +2 Food, +2 Culture, and +2 Production from Trade Routes to allies or City-States you are Suzerain of (to both cities).
-- Military units receive +1 Combat Strength for each active Alliance. 
--=============================================================================================================
-- Types
---------------------------------------------------------------------------------------------------------------
INSERT INTO Types
		(Type,											Kind)
VALUES	('P0K_NZINGA_ABILITY_ALLIANCE_COMBAT',			'KIND_ABILITY');
---------------------------------------------------------------------------------------------------------------
-- TypeTags
---------------------------------------------------------------------------------------------------------------
INSERT INTO TypeTags
		(Type,									Tag)
VALUES	('P0K_NZINGA_ABILITY_ALLIANCE_COMBAT',	'CLASS_ALL_COMBAT_UNITS');
---------------------------------------------------------------------------------------------------------------
-- UnitAbilities
---------------------------------------------------------------------------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,						Name,											Description,											Inactive,	ShowFloatTextWhenEarned,	Permanent)
VALUES	('P0K_NZINGA_ABILITY_ALLIANCE_COMBAT',	'LOC_P0K_NZINGA_ABILITY_ALLIANCE_COMBAT_NAME',	'LOC_P0K_NZINGA_ABILITY_ALLIANCE_COMBAT_DESCRIPTION',	1,			0,							1);
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO Requirements
		(RequirementId,									RequirementType)
VALUES	('P0K_NZINGA_REQUIRES_PLOT_WITHIN_9_CAPITAL',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES');
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,									Name,			Value)
VALUES	('P0K_NZINGA_REQUIRES_PLOT_WITHIN_9_CAPITAL',	'BuildingType',	'BUILDING_PALACE'),
		('P0K_NZINGA_REQUIRES_PLOT_WITHIN_9_CAPITAL',	'MinRange',		0),
		('P0K_NZINGA_REQUIRES_PLOT_WITHIN_9_CAPITAL',	'MaxRange',		9);
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('P0K_NZINGA_CITY_WITHIN_9_CAPITAL',	'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('P0K_NZINGA_CITY_WITHIN_9_CAPITAL',	'P0K_NZINGA_REQUIRES_PLOT_WITHIN_9_CAPITAL');
---------------------------------------------------------------------------------------------------------------						
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,												ModifierType,																SubjectRequirementSetId)
VALUES	('P0K_NZINGA_INFLUENCE_POINTS_NEARBY_CAPITALS',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',									'P0K_NZINGA_CITY_WITHIN_9_CAPITAL'),
		('P0K_NZINGA_INFLUENCE_POINTS_NEARBY_CAPITALS_MODIFIER',	'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',							NULL),
		('P0K_NZINGA_AMENITY_NEARBY_CAPITALS',						'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',								'P0K_NZINGA_CITY_WITHIN_9_CAPITAL'),
		('P0K_NZINGA_REGIONAL_RANGE_BONUS',							'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',					'DISTRICT_IS_INDUSTRIAL_ZONE_OR_ENTERTAINMENT_COMPLEX'),
		('P0K_NZINGA_NZINGA_GRANT_ALLIANCE_COMBAT_ABILITY',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',										NULL),
		('P0K_ABILITY_ALLIANCE_COMBAT_BONUS',						'MODIFIER_SINGLE_UNIT_ADJUST_COMBAT_FOR_NUMBER_ALLIES',						NULL),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_ALLY',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',			NULL),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_ALLY',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',			NULL),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_ALLY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',			NULL),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_ALLY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',			NULL),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_SUZERAIN',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_SUZERAIN',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_SUZERAIN',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_SUZERAIN',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_TO_ALLY',						'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_TO_ALLY',						'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_ALLY',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_ALLY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE',		NULL),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_TO_SUZERAIN',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE',	NULL),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_TO_SUZERAIN',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE',	NULL),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_SUZERAIN',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE',	NULL),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_SUZERAIN',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE',	NULL),
		('P0K_NZINGA_MORE_ALLIANCE_POINTS',							'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS',									NULL);
---------------------------------------------------------------------------------------------------------------
-- ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,												Name,			Value)
VALUES	('P0K_NZINGA_INFLUENCE_POINTS_NEARBY_CAPITALS',				'ModifierId',	'P0K_NZINGA_INFLUENCE_POINTS_NEARBY_CAPITALS_MODIFIER'),
		('P0K_NZINGA_INFLUENCE_POINTS_NEARBY_CAPITALS_MODIFIER',	'Amount',		1),
		('P0K_NZINGA_AMENITY_NEARBY_CAPITALS',						'Amount',		1),
		('P0K_NZINGA_REGIONAL_RANGE_BONUS',							'Amount',		3),
		('P0K_NZINGA_NZINGA_GRANT_ALLIANCE_COMBAT_ABILITY',			'AbilityType',	'P0K_NZINGA_ABILITY_ALLIANCE_COMBAT'),
		('P0K_ABILITY_ALLIANCE_COMBAT_BONUS',						'Amount',		1),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_ALLY',					'YieldType',	'YIELD_GOLD'),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_ALLY',					'Amount',		4),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_ALLY',					'YieldType',	'YIELD_FOOD'),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_ALLY',					'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_ALLY',				'YieldType',	'YIELD_CULTURE'),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_ALLY',				'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_ALLY',				'YieldType',	'YIELD_PRODUCTION'),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_ALLY',				'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_SUZERAIN',				'YieldType',	'YIELD_GOLD'),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_SUZERAIN',				'Amount',		4),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_SUZERAIN',				'YieldType',	'YIELD_FOOD'),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_SUZERAIN',				'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_SUZERAIN',			'YieldType',	'YIELD_CULTURE'),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_SUZERAIN',			'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_SUZERAIN',			'YieldType',	'YIELD_PRODUCTION'),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_SUZERAIN',			'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_TO_ALLY',						'YieldType',	'YIELD_GOLD'),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_TO_ALLY',						'Amount',		4),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_TO_ALLY',						'YieldType',	'YIELD_FOOD'),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_TO_ALLY',						'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_ALLY',					'YieldType',	'YIELD_CULTURE'),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_ALLY',					'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_ALLY',				'YieldType',	'YIELD_PRODUCTION'),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_ALLY',				'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_TO_SUZERAIN',					'YieldType',	'YIELD_GOLD'),
		('P0K_NZINGA_TRADE_ROUTE_GOLD_TO_SUZERAIN',					'Amount',		4),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_TO_SUZERAIN',					'YieldType',	'YIELD_FOOD'),
		('P0K_NZINGA_TRADE_ROUTE_FOOD_TO_SUZERAIN',					'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_SUZERAIN',				'YieldType',	'YIELD_CULTURE'),
		('P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_SUZERAIN',				'Amount',		2),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_SUZERAIN',			'YieldType',	'YIELD_PRODUCTION'),
		('P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_SUZERAIN',			'Amount',		2),
		('P0K_NZINGA_MORE_ALLIANCE_POINTS',							'Amount',		1);
---------------------------------------------------------------------------------------------------------------
-- UnitAbilityModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,						ModifierId)
VALUES	('P0K_NZINGA_ABILITY_ALLIANCE_COMBAT',	'P0K_ABILITY_ALLIANCE_COMBAT_BONUS');
---------------------------------------------------------------------------------------------------------------
-- TraitModifiers
---------------------------------------------------------------------------------------------------------------
DELETE FROM TraitModifiers
WHERE		TraitType = 'TRAIT_LEADER_NZINGA_MBANDE'
AND			ModifierId IN ('TRAIT_FOREIGN_CONTINENT_YIELD',
			'TRAIT_SAME_CONTINENT_YIELD');

INSERT INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_INFLUENCE_POINTS_NEARBY_CAPITALS'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_AMENITY_NEARBY_CAPITALS'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_NZINGA_GRANT_ALLIANCE_COMBAT_ABILITY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_GOLD_FROM_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_FOOD_FROM_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_CULTURE_FROM_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_PRODUCTION_FROM_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_GOLD_TO_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_FOOD_TO_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_ALLY'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_GOLD_TO_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_FOOD_TO_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_CULTURE_TO_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_TRADE_ROUTE_PRODUCTION_TO_SUZERAIN'),
		('TRAIT_LEADER_NZINGA_MBANDE',	'P0K_NZINGA_MORE_ALLIANCE_POINTS');