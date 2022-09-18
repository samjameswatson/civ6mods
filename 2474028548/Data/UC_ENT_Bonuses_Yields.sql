-- UC_ENT_Bonuses_Yields
-- Author: JNR
--------------------------------------------------------------

-- Building_YieldChanges
--------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_ARENA';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_ZOO';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_STADIUM';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_FERRIS_WHEEL';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_AQUARIUM';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_AQUATICS_CENTER';

DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_TLACHTLI' AND YieldType='YIELD_FAITH';
--------------------------------------------------------------

-- Building_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_CitizenYieldChanges
		(BuildingType,						YieldType,			YieldChange)
VALUES	('BUILDING_ARENA',					'YIELD_CULTURE',	1),
		('BUILDING_ZOO',					'YIELD_SCIENCE',	1),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'YIELD_SCIENCE',	1),
		('BUILDING_STADIUM',				'YIELD_GOLD',		2),
		('BUILDING_JNR_THEME_PARK',			'YIELD_GOLD',		2),
		('BUILDING_FERRIS_WHEEL',			'YIELD_CULTURE',	1),
		('BUILDING_AQUARIUM',				'YIELD_SCIENCE',	1),
		('BUILDING_JNR_CASINO',				'YIELD_GOLD',		2),
		('BUILDING_AQUATICS_CENTER',		'YIELD_GOLD',		2),
		('BUILDING_JNR_FOOD_COURT',			'YIELD_GOLD',		2),

		('BUILDING_TLACHTLI',				'YIELD_FAITH',		1);
--------------------------------------------------------------

-- Building_YieldDistrictCopies
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_YieldDistrictCopies
		(BuildingType,				OldYieldType,	NewYieldType)
VALUES	('BUILDING_JNR_THEME_PARK',	'YIELD_GOLD',	'YIELD_GOLD'),
		('BUILDING_JNR_FOOD_COURT',	'YIELD_GOLD',	'YIELD_GOLD');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,							ModifierType,											SubjectRequirementSetId)
VALUES	('JNR_ZOO_SCIENCE_CAMP',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_CAMP_REQUIREMENTS'),
		('JNR_ZOO_SCIENCE_PASTURE',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_PASTURE_REQUIREMENTS'),
		('JNR_BOTANICAL_SCIENCE_FARM',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_RESOURCE_FARM_JNR'),
		('JNR_BOTANICAL_SCIENCE_PLANTATION',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_RESOURCE_PLANTATION_JNR'),
		('JNR_BOTANICAL_SCIENCE_LUMBER_MILL',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_RESOURCE_LUMBER_MILL_JNR'),
		('JNR_STADIUM_GOLD',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_IS_POWERED'),
		('JNR_MARINA_CULTURE_FISHING_BOATS',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
		('JNR_CASINO_GOLD_COMMERCE',			'MODIFIER_BUILDING_YIELD_CHANGE',						NULL),
		('JNR_AQUATIC_CENTER_GOLD',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_IS_POWERED'),

		('JNR_TLACHTLI_FAITH_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'CITY_IS_ORIGINAL_CAPITAL_JNR'),
		('JNR_TLACHTLI_FAITH_CAPITALS',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('JNR_THERMALBATH_ADDSCIENCE',			'MODIFIER_BUILDING_YIELD_CHANGE',						'CITY_HAS_1_OR_MORE_GEOTHERMALFISSURE_REQUIREMENTS'),
		('JNR_THERMALBATH_ADDCULTURE',			'MODIFIER_BUILDING_YIELD_CHANGE',						'CITY_HAS_1_OR_MORE_GEOTHERMALFISSURE_REQUIREMENTS');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,							Name,					Value)
VALUES	('JNR_ZOO_SCIENCE_CAMP',				'YieldType',			'YIELD_SCIENCE'),
		('JNR_ZOO_SCIENCE_CAMP',				'Amount',				1),
		('JNR_ZOO_SCIENCE_PASTURE',				'YieldType',			'YIELD_SCIENCE'),
		('JNR_ZOO_SCIENCE_PASTURE',				'Amount',				1),
		('JNR_BOTANICAL_SCIENCE_FARM',			'YieldType',			'YIELD_SCIENCE'),
		('JNR_BOTANICAL_SCIENCE_FARM',			'Amount',				1),
		('JNR_BOTANICAL_SCIENCE_PLANTATION',	'YieldType',			'YIELD_SCIENCE'),
		('JNR_BOTANICAL_SCIENCE_PLANTATION',	'Amount',				1),
		('JNR_BOTANICAL_SCIENCE_LUMBER_MILL',	'YieldType',			'YIELD_SCIENCE'),
		('JNR_BOTANICAL_SCIENCE_LUMBER_MILL',	'Amount',				1),
		('JNR_STADIUM_GOLD',					'BuildingType',			'BUILDING_STADIUM'),
		('JNR_STADIUM_GOLD',					'YieldType',			'YIELD_GOLD'),
		('JNR_STADIUM_GOLD',					'Amount',				1),
		('JNR_MARINA_CULTURE_FISHING_BOATS',	'YieldType',			'YIELD_CULTURE'),
		('JNR_MARINA_CULTURE_FISHING_BOATS',	'Amount',				1),
		('JNR_CASINO_GOLD_COMMERCE',			'BuildingType',			'BUILDING_JNR_CASINO'),
		('JNR_CASINO_GOLD_COMMERCE',			'YieldType',			'YIELD_GOLD'),
		('JNR_CASINO_GOLD_COMMERCE',			'Amount',				1),
		('JNR_AQUATIC_CENTER_GOLD',				'BuildingType',			'BUILDING_AQUATICS_CENTER'),
		('JNR_AQUATIC_CENTER_GOLD',				'YieldType',			'YIELD_GOLD'),
		('JNR_AQUATIC_CENTER_GOLD',				'Amount',				1),

		('JNR_TLACHTLI_FAITH_ATTACH',			'ModifierId',			'JNR_TLACHTLI_FAITH_CAPITALS'),
		('JNR_TLACHTLI_FAITH_CAPITALS',			'BuildingType',			'BUILDING_TLACHTLI'),
		('JNR_TLACHTLI_FAITH_CAPITALS',			'YieldType',			'YIELD_FAITH'),
		('JNR_TLACHTLI_FAITH_CAPITALS',			'Amount',				1),
		('JNR_THERMALBATH_ADDSCIENCE',			'BuildingType',			'BUILDING_THERMAL_BATH'),
		('JNR_THERMALBATH_ADDSCIENCE',			'YieldType',			'YIELD_SCIENCE'),
		('JNR_THERMALBATH_ADDSCIENCE',			'Amount',				2),
		('JNR_THERMALBATH_ADDCULTURE',			'BuildingType',			'BUILDING_THERMAL_BATH'),
		('JNR_THERMALBATH_ADDCULTURE',			'YieldType',			'YIELD_CULTURE'),
		('JNR_THERMALBATH_ADDCULTURE',			'Amount',				2);

UPDATE ModifierArguments SET Value=2 WHERE ModifierId='THERMALBATH_ADDTOURISM' AND Name='Amount';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,						ModifierId)
VALUES	('BUILDING_ZOO',					'JNR_ZOO_SCIENCE_CAMP'),
		('BUILDING_ZOO',					'JNR_ZOO_SCIENCE_PASTURE'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'ZOO_MARSH_SCIENCE'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'JNR_BOTANICAL_SCIENCE_FARM'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'JNR_BOTANICAL_SCIENCE_PLANTATION'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'JNR_BOTANICAL_SCIENCE_LUMBER_MILL'),
		('BUILDING_STADIUM',				'JNR_STADIUM_GOLD'),
		('BUILDING_STADIUM',				'JNR_AQUATIC_CENTER_GOLD'),
		('BUILDING_JNR_MARINA',				'JNR_MARINA_CULTURE_FISHING_BOATS'),
		('BUILDING_AQUATICS_CENTER',		'JNR_STADIUM_GOLD'),
		('BUILDING_AQUATICS_CENTER',		'JNR_AQUATIC_CENTER_GOLD'),

		('BUILDING_THERMAL_BATH',			'JNR_THERMALBATH_ADDSCIENCE'),
		('BUILDING_THERMAL_BATH',			'JNR_THERMALBATH_ADDCULTURE');

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,						ModifierId)
SELECT	BuildingType,						'JNR_CASINO_GOLD_COMMERCE'
FROM	Buildings
WHERE	PrereqDistrict IN ('DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_AERODROME');

DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_ZOO' AND ModifierId='ZOO_RAINFOREST_SCIENCE';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,									ModifierId)
VALUES	('TRAIT_CIVILIZATION_BUILDING_TLACHTLI',	'JNR_TLACHTLI_FAITH_ATTACH');
--------------------------------------------------------------