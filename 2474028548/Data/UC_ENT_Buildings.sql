-- UC_ENT_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
-------------------------------------------------------------- 
INSERT OR IGNORE INTO Types
		(Type,								Kind)
VALUES	('BUILDING_JNR_TOURNEY',			'KIND_BUILDING'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'KIND_BUILDING'),
		('BUILDING_JNR_THEME_PARK',			'KIND_BUILDING'),
		('BUILDING_JNR_MARINA',				'KIND_BUILDING'),
		('BUILDING_JNR_CASINO',				'KIND_BUILDING'),
		('BUILDING_JNR_FOOD_COURT',			'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,						PrereqDistrict,							PrereqCivic,				Cost,	Maintenance,	CitizenSlots,	Entertainment,	RegionalRange,	PurchaseYield,	AdvisorType,		Name,										Description)
VALUES	('BUILDING_JNR_TOURNEY',			'DISTRICT_ENTERTAINMENT_COMPLEX',		'CIVIC_FEUDALISM',			150,	1,				1,				1,				6,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_TOURNEY_NAME',			'LOC_BUILDING_JNR_TOURNEY_DESCRIPTION'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'DISTRICT_ENTERTAINMENT_COMPLEX',		'CIVIC_NATURAL_HISTORY',	360,	2,				1,				1,				6,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_BOTANICAL_GARDEN_NAME',	'LOC_BUILDING_JNR_BOTANICAL_GARDEN_DESCRIPTION'),
		('BUILDING_JNR_THEME_PARK',			'DISTRICT_ENTERTAINMENT_COMPLEX',		'CIVIC_RAPID_DEPLOYMENT',	440,	3,				1,				1,				9,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_THEME_PARK_NAME',			'LOC_BUILDING_JNR_THEME_PARK_DESCRIPTION'),
		('BUILDING_JNR_MARINA',				'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'CIVIC_EXPLORATION',		250,	1,				1,				1,				0,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MARINA_NAME',				'LOC_BUILDING_JNR_MARINA_DESCRIPTION'),
		('BUILDING_JNR_CASINO',				'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'CIVIC_URBANIZATION',		360,	2,				1,				1,				6,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_CASINO_NAME',				'LOC_BUILDING_JNR_CASINO_DESCRIPTION'),
		('BUILDING_JNR_FOOD_COURT',			'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'CIVIC_CULTURAL_HERITAGE',	440,	3,				1,				1,				9,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_FOOD_COURT_NAME',			'LOC_BUILDING_JNR_FOOD_COURT_DESCRIPTION');

UPDATE Buildings SET	PrereqCivic='CIVIC_CIVIL_ENGINEERING', Cost=250	WHERE BuildingType='BUILDING_FERRIS_WHEEL';

UPDATE Buildings SET	CitizenSlots=2,	Entertainment=1,						Description='LOC_BUILDING_ARENA_DESCRIPTION_UC_JNR'				WHERE BuildingType='BUILDING_ARENA';
UPDATE Buildings SET	CitizenSlots=1,	Entertainment=1,						Description='LOC_BUILDING_TLACHTLI_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_TLACHTLI';
UPDATE Buildings SET	CitizenSlots=1,	Entertainment=1,						Description='LOC_BUILDING_ZOO_DESCRIPTION_UC_JNR'				WHERE BuildingType='BUILDING_ZOO';
UPDATE Buildings SET	CitizenSlots=1,	Entertainment=1,						Description='LOC_BUILDING_THERMAL_BATH_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_THERMAL_BATH';
UPDATE Buildings SET	CitizenSlots=1,	Entertainment=0,	RegionalRange=0,	Description='LOC_BUILDING_STADIUM_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_STADIUM';
UPDATE Buildings SET	CitizenSlots=2,	Entertainment=1,	RegionalRange=6,	Description='LOC_BUILDING_FERRIS_WHEEL_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_FERRIS_WHEEL';
UPDATE Buildings SET	CitizenSlots=1,	Entertainment=1,	RegionalRange=6,	Description='LOC_BUILDING_AQUARIUM_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_AQUARIUM';
UPDATE Buildings SET	CitizenSlots=1,	Entertainment=0,	RegionalRange=0,	Description='LOC_BUILDING_AQUATICS_CENTER_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_AQUATICS_CENTER';
--------------------------------------------------------------

-- BuildingReplaces
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingReplaces
		(CivUniqueBuildingType,		ReplacesBuildingType)
VALUES	('BUILDING_THERMAL_BATH',	'BUILDING_JNR_BOTANICAL_GARDEN'),
		('BUILDING_TLACHTLI',		'BUILDING_JNR_TOURNEY');
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
VALUES	('BUILDING_JNR_BOTANICAL_GARDEN',	'BUILDING_ARENA'),
		('BUILDING_JNR_THEME_PARK',			'BUILDING_ZOO'),
		('BUILDING_JNR_CASINO',				'BUILDING_FERRIS_WHEEL'),
		('BUILDING_JNR_FOOD_COURT',			'BUILDING_AQUARIUM');

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_TOURNEY'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_ARENA';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_BOTANICAL_GARDEN'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_ZOO';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_MARINA'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_FERRIS_WHEEL';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_CASINO'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_AQUARIUM';
--------------------------------------------------------------

-- MutuallyExclusiveBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
VALUES	('BUILDING_ARENA',					'BUILDING_JNR_TOURNEY'),
		('BUILDING_JNR_TOURNEY',			'BUILDING_ARENA'),
		('BUILDING_ZOO',					'BUILDING_JNR_BOTANICAL_GARDEN'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'BUILDING_ZOO'),
		('BUILDING_STADIUM',				'BUILDING_JNR_THEME_PARK'),
		('BUILDING_JNR_THEME_PARK',			'BUILDING_STADIUM'),
		('BUILDING_FERRIS_WHEEL',			'BUILDING_JNR_MARINA'),
		('BUILDING_JNR_MARINA',				'BUILDING_FERRIS_WHEEL'),
		('BUILDING_AQUARIUM',				'BUILDING_JNR_CASINO'),
		('BUILDING_JNR_CASINO',				'BUILDING_AQUARIUM'),
		('BUILDING_AQUATICS_CENTER',		'BUILDING_JNR_FOOD_COURT'),
		('BUILDING_JNR_FOOD_COURT',			'BUILDING_AQUATICS_CENTER');
--------------------------------------------------------------

-- StartingBuildings
--------------------------------------------------------------
DELETE FROM StartingBuildings WHERE District='DISTRICT_ENTERTAINMENT_COMPLEX';
DELETE FROM StartingBuildings WHERE District='DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
--------------------------------------------------------------