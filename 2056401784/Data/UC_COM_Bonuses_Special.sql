-- UC_COM_Bonuses_Special
-- Author: JNR
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
UPDATE Buildings SET Housing=Housing+1 WHERE BuildingType='BUILDING_JNR_GUILDHALL';
UPDATE Buildings SET Housing=Housing+2 WHERE BuildingType='BUILDING_JNR_MERCHANT_QUARTER';
UPDATE Buildings SET Housing=Housing+1 WHERE BuildingType='BUILDING_GRAND_BAZAAR';
UPDATE Buildings SET Housing=Housing+2 WHERE BuildingType='BUILDING_JNR_WHARF_FISHING';
UPDATE Buildings SET Housing=Housing+2 WHERE BuildingType='BUILDING_JNR_WHARF_TRADE';
UPDATE Buildings SET Housing=Housing+1 WHERE BuildingType='BUILDING_JNR_LIGHTHOUSE_TRADE';
UPDATE Buildings SET Housing=Housing+1 WHERE BuildingType='BUILDING_JNR_HAVEN';
UPDATE Buildings SET Housing=Housing+1 WHERE BuildingType='BUILDING_JNR_CONSULATE';
--------------------------------------------------------------

-- Building_GreatPersonPoints
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatPersonPoints
		(BuildingType,						GreatPersonClassType,			PointsPerTurn)
VALUES	('BUILDING_JNR_MINT',				'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_WAYSTATION',			'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_GUILDHALL',			'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_MERCHANT_QUARTER',	'GREAT_PERSON_CLASS_MERCHANT',	2),
		('BUILDING_JNR_COMMODITY_EXCHANGE',	'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_MARKETING_AGENCY',	'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_WHARF_FISHING',		'GREAT_PERSON_CLASS_ADMIRAL',	1),
		('BUILDING_JNR_WHARF_TRADE',		'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_LIGHTHOUSE_TRADE',	'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_HAVEN',				'GREAT_PERSON_CLASS_ADMIRAL',	1),
		('BUILDING_JNR_CONSULATE',			'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_JNR_CRUISE_TERMINAL',	'GREAT_PERSON_CLASS_MERCHANT',	1),
		('BUILDING_HANGAR',					'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_AIRPORT',				'GREAT_PERSON_CLASS_MERCHANT',	1);

UPDATE Building_GreatPersonPoints SET PointsPerTurn=2 WHERE BuildingType='BUILDING_GRAND_BAZAAR' AND GreatPersonClassType='GREAT_PERSON_CLASS_MERCHANT';

DELETE FROM Building_GreatPersonPoints WHERE BuildingType='BUILDING_AIRPORT' AND GreatPersonClassType='GREAT_PERSON_CLASS_GENERAL';
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,										Kind)
VALUES	('ABILITY_JNR_HAVEN_TRAINED_UNIT_PILLAGE',	'KIND_ABILITY');
--------------------------------------------------------------

-- UnitAbilities
--------------------------------------------------------------
INSERT OR IGNORE INTO UnitAbilities
		(UnitAbilityType,							Name,												Description,												Inactive)
VALUES	('ABILITY_JNR_HAVEN_TRAINED_UNIT_PILLAGE',	'LOC_ABILITY_JNR_HAVEN_TRAINED_UNIT_PILLAGE_NAME',	'LOC_ABILITY_JNR_HAVEN_TRAINED_UNIT_PILLAGE_DESCRIPTION',	1);

UPDATE UnitAbilities SET Description='LOC_ABILITY_HANGAR_TRAINED_AIRCRAFT_XP_DESCRIPTION_UC_JNR';
--------------------------------------------------------------

-- TypeTags
--------------------------------------------------------------
INSERT OR IGNORE INTO TypeTags
		(Type,										Tag)
VALUES	('ABILITY_JNR_HAVEN_TRAINED_UNIT_PILLAGE',	'CLASS_NAVAL_RAIDER');
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,											RequirementType,						Inverse)
VALUES	('RADIUS_6_TILES_REQUIREMENT_JNR',						'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',	0),
		('REQUIRES_NO_MINT_JNR',								'REQUIREMENT_CITY_HAS_BUILDING',		1),
		('REQUIRES_NO_WAYSTATION_JNR',							'REQUIREMENT_CITY_HAS_BUILDING',		1),
		('REQUIRES_CITY_HAS_NO_STOCK_EXCHANGE_JNR',				'REQUIREMENT_CITY_HAS_BUILDING',		1),
		('REQUIRES_CITY_HAS_NO_COMMODITY_EXCHANGE_JNR',			'REQUIREMENT_CITY_HAS_BUILDING',		1),
		('REQUIRES_CITY_HAS_NO_CARGO_TERMINAL_JNR',				'REQUIREMENT_CITY_HAS_BUILDING',		1),
		('REQUIRES_CITY_HAS_WHARF_TRADE_JNR',					'REQUIREMENT_CITY_HAS_BUILDING',		0),
		('REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR',				'REQUIREMENT_CITY_HAS_BUILDING',		0),
		('REQUIRES_CITY_HAS_TRADE_DOCK_REQUIREMENTS_JNR',		'REQUIREMENT_REQUIREMENTSET_IS_MET',	0),
		('REQUIRES_CITY_HAS_COMMERCIAL_TIER1_REQUIREMENTS_JNR',	'REQUIREMENT_REQUIREMENTSET_IS_MET',	0);
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,											Name,				Value)
VALUES	('RADIUS_6_TILES_REQUIREMENT_JNR',						'MinDistance',		0),
		('RADIUS_6_TILES_REQUIREMENT_JNR',						'MaxDistance',		6),
		('REQUIRES_NO_MINT_JNR',								'BuildingType',		'BUILDING_JNR_MINT'),
		('REQUIRES_NO_WAYSTATION_JNR',							'BuildingType',		'BUILDING_JNR_WAYSTATION'),
		('REQUIRES_CITY_HAS_NO_STOCK_EXCHANGE_JNR',				'BuildingType',		'BUILDING_JNR_WAYSTATION'),
		('REQUIRES_CITY_HAS_NO_COMMODITY_EXCHANGE_JNR',			'BuildingType',		'BUILDING_JNR_COMMODITY_EXCHANGE'),
		('REQUIRES_CITY_HAS_NO_CARGO_TERMINAL_JNR',				'BuildingType',		'BUILDING_JNR_CARGO_TERMINAL'),
		('REQUIRES_CITY_HAS_WHARF_TRADE_JNR',					'BuildingType',		'BUILDING_JNR_WHARF_TRADE'),
		('REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR',				'BuildingType',		'BUILDING_JNR_LIGHTHOUSE_TRADE'),
		('REQUIRES_CITY_HAS_TRADE_DOCK_REQUIREMENTS_JNR',		'RequirementSetId',	'CITY_HAS_TRADE_DOCK_JNR'),
		('REQUIRES_CITY_HAS_COMMERCIAL_TIER1_REQUIREMENTS_JNR',	'RequirementSetId',	'BUILDING_IS_COMMERCIAL_TIER1_JNR');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('PLOT_RADIUS_6_TILES_REQUIREMENTS_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('CITY_HAS_TRADE_DOCK_JNR',						'REQUIREMENTSET_TEST_ANY'),
		('TRADE_ROUTE_B_IN_HUB_REQUIREMENTS_JNR',		'REQUIREMENTSET_TEST_ALL'),
		('TRADE_ROUTE_B_IN_HARBOR_REQUIREMENTS_JNR',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('PLOT_RADIUS_6_TILES_REQUIREMENTS_JNR',			'RADIUS_6_TILES_REQUIREMENT_JNR'),
		('LIGHTHOUSE_TRADE_ROUTE_CAPACITY_REQUIREMENTS',	'REQUIRES_NO_MINT_JNR'),
		('LIGHTHOUSE_TRADE_ROUTE_CAPACITY_REQUIREMENTS',	'REQUIRES_NO_WAYSTATION_JNR'),
		('CITY_HAS_TRADE_DOCK_JNR',							'REQUIRES_CITY_HAS_WHARF_TRADE_JNR'),
		('CITY_HAS_TRADE_DOCK_JNR',							'REQUIRES_CITY_HAS_LIGHTHOUSE_TRADE_JNR'),
		('TRADE_ROUTE_B_IN_HUB_REQUIREMENTS_JNR',			'REQUIRES_CITY_HAS_TRADE_DOCK_REQUIREMENTS_JNR'),
		('TRADE_ROUTE_B_IN_HUB_REQUIREMENTS_JNR',			'REQUIRES_CITY_HAS_NO_CARGO_TERMINAL_JNR'),
		('TRADE_ROUTE_B_IN_HARBOR_REQUIREMENTS_JNR',		'REQUIRES_CITY_HAS_COMMERCIAL_TIER1_REQUIREMENTS_JNR'),
		('TRADE_ROUTE_B_IN_HARBOR_REQUIREMENTS_JNR',		'REQUIRES_CITY_HAS_NO_STOCK_EXCHANGE_JNR'),
		('TRADE_ROUTE_B_IN_HARBOR_REQUIREMENTS_JNR',		'REQUIRES_CITY_HAS_NO_COMMODITY_EXCHANGE_JNR'),
		('TRADE_ROUTE_B_IN_HARBOR_REQUIREMENTS_JNR',		'REQUIRES_CITY_HAS_NO_CARGO_TERMINAL_JNR');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType,											SubjectRequirementSetId)
VALUES	('JNR_MINT_TRADE_ROUTE_CAPACITY',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',			NULL),
		('JNR_WAYSTATION_TRADE_ROUTE_CAPACITY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',			NULL),
		('JNR_STOCK_EXCHANGE_TRADE_ROUTE_CAPACITY',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',			'TRADE_ROUTE_B_IN_HUB_REQUIREMENTS_JNR'),
		('JNR_COMMODITY_EXCHANGE_TRADE_ROUTE_CAPACITY',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',			'TRADE_ROUTE_B_IN_HUB_REQUIREMENTS_JNR'),
		('JNR_SEAPORT_TRADE_ROUTE_CAPACITY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',			'TRADE_ROUTE_B_IN_HARBOR_REQUIREMENTS_JNR'),
		('JNR_AIRPORT_TRADE_ROUTE_CAPACITY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',			NULL),
		('JNR_MINT_LOYALTY_ATTACH',							'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'PLOT_RADIUS_6_TILES_REQUIREMENTS_JNR'),
		('JNR_MINT_LOYALTY',								'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN',		NULL),
		('JNR_MARKETING_AGENCY_APPEAL',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',				NULL),
		('JNR_HAVEN_TRAINED_UNIT_PILLAGE_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	NULL),
		('JNR_CRUISE_TERMINAL_TOURISM_WONDER',				'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',					NULL),
		('JNR_AIRPORT_TOURISM_MODERN_ERA_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'PLOT_RADIUS_6_TILES_REQUIREMENTS_JNR'),
		('JNR_AIRPORT_TOURISM_MODERN_ERA',					'MODIFIER_SINGLE_CITY_ADJUST_TOURISM_LATE_ERAS',		NULL),
		('TRAIT_ADJUST_LIGHTHOUSE_TRADE_STOCKPILE_CAP_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_STOCKPILE_CAP',	'BUILDING_IS_LIGHTHOUSE_TRADE_JNR'),
		('TRAIT_ADJUST_HAVEN_STOCKPILE_CAP_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_STOCKPILE_CAP',	'BUILDING_IS_HAVEN_JNR'),
		('TRAIT_ADJUST_CONSULATE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_STOCKPILE_CAP',	'BUILDING_IS_CONSULATE_JNR'),
		('TRAIT_ADJUST_CRUISE_TERMINAL_STOCKPILE_CAP_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_STOCKPILE_CAP',	'BUILDING_IS_CRUISE_TERMINAL_JNR');

UPDATE Modifiers SET Permanent=1 WHERE ModifierId='JNR_HAVEN_TRAINED_UNIT_PILLAGE_MODIFIER';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JNR_CRUISE_TERMINAL_TOURISM_' || GreatWorkObjectType,	'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

UPDATE Modifiers SET SubjectStackLimit=1 WHERE ModifierId='JNR_MINT_LOYALTY_ATTACH';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,					Value)
VALUES	('JNR_MINT_TRADE_ROUTE_CAPACITY',						'Amount',				1),
		('JNR_WAYSTATION_TRADE_ROUTE_CAPACITY',					'Amount',				1),
		('JNR_STOCK_EXCHANGE_TRADE_ROUTE_CAPACITY',				'Amount',				1),
		('JNR_COMMODITY_EXCHANGE_TRADE_ROUTE_CAPACITY',			'Amount',				1),
		('JNR_SEAPORT_TRADE_ROUTE_CAPACITY',					'Amount',				1),
		('JNR_AIRPORT_TRADE_ROUTE_CAPACITY',					'Amount',				1),
		('JNR_MINT_LOYALTY_ATTACH',								'ModifierId',			'JNR_MINT_LOYALTY'),
		('JNR_MINT_LOYALTY',									'Amount',				2),
		('JNR_MARKETING_AGENCY_APPEAL',							'Amount',				1),
		('JNR_HAVEN_TRAINED_UNIT_PILLAGE_MODIFIER',				'ModifierId',			'UNIT_REDUCED_PILLAGE_COST'),
		('JNR_CRUISE_TERMINAL_TOURISM_WONDER',					'BoostsWonders',		'true'),
		('JNR_CRUISE_TERMINAL_TOURISM_WONDER',					'ScalingFactor',		125),
		('JNR_AIRPORT_TOURISM_MODERN_ERA_ATTACH',				'ModifierId',			'JNR_AIRPORT_TOURISM_MODERN_ERA'),
		('JNR_AIRPORT_TOURISM_MODERN_ERA',						'MinimumEra',			'ERA_MODERN'),
		('JNR_AIRPORT_TOURISM_MODERN_ERA',						'Modifier',				25),
		('TRAIT_ADJUST_LIGHTHOUSE_TRADE_STOCKPILE_CAP_JNR',		'Amount',				10),
		('TRAIT_ADJUST_HAVEN_STOCKPILE_CAP_JNR',				'Amount',				10),
		('TRAIT_ADJUST_CONSULATE_STOCKPILE_CAP_JNR',			'Amount',				10),
		('TRAIT_ADJUST_CRUISE_TERMINAL_STOCKPILE_CAP_JNR',		'Amount',				10);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'JNR_CRUISE_TERMINAL_TOURISM_' || GreatWorkObjectType,	'ScalingFactor',		125
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'JNR_CRUISE_TERMINAL_TOURISM_' || GreatWorkObjectType,	'GreatWorkObjectType',	GreatWorkObjectType
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

UPDATE ModifierArguments SET Value=2	WHERE ModifierId='HANGAR_BONUS_AIR_SLOTS';
UPDATE ModifierArguments SET Value=1	WHERE ModifierId='AIRPORT_BONUS_AIR_SLOTS';
UPDATE ModifierArguments SET Value=50	WHERE ModifierId='HANGAR_TRAINED_AIRCRAFT_XP';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,						ModifierId)
VALUES	('BUILDING_JNR_MINT',				'JNR_MINT_TRADE_ROUTE_CAPACITY'),
		('BUILDING_JNR_WAYSTATION',			'JNR_WAYSTATION_TRADE_ROUTE_CAPACITY'),
		('BUILDING_JNR_LIGHTHOUSE_TRADE',	'LIGHTHOUSE_TRADE_ROUTE_CAPACITY'),
		('BUILDING_JNR_WHARF_TRADE',		'LIGHTHOUSE_TRADE_ROUTE_CAPACITY'),
		('BUILDING_STOCK_EXCHANGE',			'JNR_STOCK_EXCHANGE_TRADE_ROUTE_CAPACITY'),
		('BUILDING_JNR_COMMODITY_EXCHANGE',	'JNR_COMMODITY_EXCHANGE_TRADE_ROUTE_CAPACITY'),
		('BUILDING_SEAPORT',				'JNR_SEAPORT_TRADE_ROUTE_CAPACITY'),
		('BUILDING_AIRPORT',				'JNR_AIRPORT_TRADE_ROUTE_CAPACITY'),
		('BUILDING_JNR_MINT',				'JNR_MINT_LOYALTY_ATTACH'),
		('BUILDING_JNR_MARKETING_AGENCY',	'JNR_MARKETING_AGENCY_APPEAL'),
		('BUILDING_JNR_LIGHTHOUSE_TRADE',	'LIGHTHOUSE_TRAINED_UNIT_XP_MODIFIER'),
		('BUILDING_JNR_CRUISE_TERMINAL',	'JNR_CRUISE_TERMINAL_TOURISM_WONDER'),
		('BUILDING_HANGAR',					'HANGAR_TRAINED_AIRCRAFT_XP_MODIFIER'),
		('BUILDING_AIRPORT',				'JNR_AIRPORT_TOURISM_MODERN_ERA_ATTACH');

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,						ModifierId)
SELECT	'BUILDING_JNR_CRUISE_TERMINAL',		'JNR_CRUISE_TERMINAL_TOURISM_' || GreatWorkObjectType
FROM	GreatWorkObjectTypes
WHERE	GreatWorkObjectType IS NOT NULL;

DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_LIGHTHOUSE' AND ModifierId='LIGHTHOUSE_TRADE_ROUTE_CAPACITY';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_LIGHTHOUSE' AND ModifierId='LIGHTHOUSE_COASTAL_CITY_HOUSING';

UPDATE BuildingModifiers SET BuildingType='BUILDING_HANGAR' WHERE BuildingType='BUILDING_AIRPORT' AND ModifierId='JNR_AIRPORT_PROMOTION';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_AIRPORT' AND ModifierId='AIRPORT_TRAINED_AIRCRAFT_XP_MODIFIER';
--------------------------------------------------------------

-- UnitAbilityModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO UnitAbilityModifiers
		(UnitAbilityType,							ModifierId)
VALUES	('ABILITY_JNR_HAVEN_TRAINED_UNIT_PILLAGE',	'JNR_HAVEN_TRAINED_UNIT_PILLAGE_MODIFIER');
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,										ModifierId)
VALUES	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',	'TRAIT_ADJUST_LIGHTHOUSE_TRADE_STOCKPILE_CAP_JNR'),
		('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',	'TRAIT_ADJUST_HAVEN_STOCKPILE_CAP_JNR'),
		('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',	'TRAIT_ADJUST_CONSULATE_STOCKPILE_CAP_JNR'),
		('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',	'TRAIT_ADJUST_CRUISE_TERMINAL_STOCKPILE_CAP_JNR');
--------------------------------------------------------------