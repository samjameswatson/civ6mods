-- UC_PRD_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,								Kind)
VALUES	('BUILDING_JNR_DUMMY_IZ_RIVER',		'KIND_BUILDING'),
		('BUILDING_JNR_MILL_RACE',			'KIND_BUILDING'),
		('BUILDING_JNR_WIND_MILL',			'KIND_BUILDING'),
		('BUILDING_JNR_MANUFACTURY',		'KIND_BUILDING'),
		('BUILDING_JNR_CHEMICAL',			'KIND_BUILDING'),
		('BUILDING_JNR_FREIGHT_YARD',		'KIND_BUILDING'),
		('BUILDING_JNR_MODE_MACHINES',		'KIND_BUILDING'),
		('BUILDING_JNR_MODE_FERTILIZERS',	'KIND_BUILDING'),
		('BUILDING_JNR_MODE_ELECTRONICS',	'KIND_BUILDING'),
		('BUILDING_JNR_MODE_SOUVENIRS',		'KIND_BUILDING'),
		('BUILDING_JNR_MODE_PHARMA',		'KIND_BUILDING'),
		('BUILDING_JNR_MODE_PLASTICS',		'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,						PrereqDistrict,				PrereqTech,				Cost,	Maintenance,	CitizenSlots,	PurchaseYield,	AdvisorType,		Name,										Description)
VALUES	('BUILDING_JNR_DUMMY_IZ_RIVER',		'DISTRICT_CITY_CENTER',		NULL,					1,		0,				0,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_DUMMY_IZ_RIVER_NAME',		NULL),
		('BUILDING_JNR_MILL_RACE',			'DISTRICT_CITY_CENTER',		NULL,					1,		0,				0,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MILL_RACE_NAME',			'LOC_BUILDING_JNR_MILL_RACE_DESCRIPTION'),
		('BUILDING_JNR_WIND_MILL',			'DISTRICT_INDUSTRIAL_ZONE',	'TECH_APPRENTICESHIP',	150,	1,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_WIND_MILL_NAME',			'LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION'),
		('BUILDING_JNR_MANUFACTURY',		'DISTRICT_INDUSTRIAL_ZONE',	'TECH_MASS_PRODUCTION',	250,	2,				2,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MANUFACTURY_NAME',		'LOC_BUILDING_JNR_MANUFACTURY_DESCRIPTION'),
		('BUILDING_JNR_CHEMICAL',			'DISTRICT_INDUSTRIAL_ZONE',	'TECH_REFINING',		330,	3,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_CHEMICAL_NAME',			'LOC_BUILDING_JNR_CHEMICAL_DESCRIPTION'),
		('BUILDING_JNR_FREIGHT_YARD',		'DISTRICT_INDUSTRIAL_ZONE',	'TECH_COMBUSTION',		390,	4,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_FREIGHT_YARD_NAME',		'LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION'),
		('BUILDING_JNR_MODE_MACHINES',		'DISTRICT_INDUSTRIAL_ZONE',	NULL,					450,	0,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MODE_MACHINES_NAME',		'LOC_BUILDING_JNR_MODE_MACHINES_DESCRIPTION'),
		('BUILDING_JNR_MODE_FERTILIZERS',	'DISTRICT_INDUSTRIAL_ZONE',	NULL,					450,	0,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MODE_FERTILIZERS_NAME',	'LOC_BUILDING_JNR_MODE_FERTILIZERS_DESCRIPTION'),
		('BUILDING_JNR_MODE_ELECTRONICS',	'DISTRICT_INDUSTRIAL_ZONE',	NULL,					450,	0,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MODE_ELECTRONICS_NAME',	'LOC_BUILDING_JNR_MODE_ELECTRONICS_DESCRIPTION'),
		('BUILDING_JNR_MODE_SOUVENIRS',		'DISTRICT_INDUSTRIAL_ZONE',	NULL,					450,	0,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MODE_SOUVENIRS_NAME',		'LOC_BUILDING_JNR_MODE_SOUVENIRS_DESCRIPTION'),
		('BUILDING_JNR_MODE_PHARMA',		'DISTRICT_INDUSTRIAL_ZONE',	NULL,					450,	0,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MODE_PHARMA_NAME',		'LOC_BUILDING_JNR_MODE_PHARMA_DESCRIPTION'),
		('BUILDING_JNR_MODE_PLASTICS',		'DISTRICT_INDUSTRIAL_ZONE',	NULL,					450,	0,				1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_MODE_PLASTICS_NAME',		'LOC_BUILDING_JNR_MODE_PLASTICS_DESCRIPTION');

UPDATE Buildings SET InternalOnly=1																		WHERE BuildingType='BUILDING_JNR_DUMMY_IZ_RIVER';
UPDATE Buildings SET PrereqDistrict='DISTRICT_INDUSTRIAL_ZONE', CitizenSlots=1, RequiresAdjacentRiver=0	WHERE BuildingType='BUILDING_WATER_MILL';
UPDATE Buildings SET Description='LOC_BUILDING_GRANARY_DESCRIPTION_UC_JNR_PRD'							WHERE BuildingType='BUILDING_GRANARY';

UPDATE Buildings SET PrereqTech='TECH_CONSTRUCTION',	Cost=150,	Maintenance=1,	Description='LOC_BUILDING_WATER_MILL_DESCRIPTION_UC_JNR'					WHERE BuildingType='BUILDING_WATER_MILL';
UPDATE Buildings SET PrereqTech='TECH_MASS_PRODUCTION',	Cost=250,	Maintenance=2,	Description='LOC_BUILDING_WORKSHOP_DESCRIPTION_UC_JNR'						WHERE BuildingType='BUILDING_WORKSHOP';
UPDATE Buildings SET									Cost=330,	Maintenance=3,	Description='LOC_BUILDING_FACTORY_DESCRIPTION_UC_JNR'						WHERE BuildingType='BUILDING_FACTORY';
UPDATE Buildings SET PrereqTech='TECH_ELECTRICITY',		Cost=390,	Maintenance=4,	Description='LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';
UPDATE Buildings SET									Cost=300,	Maintenance=3,	Description='LOC_BUILDING_COAL_POWER_PLANT_DESCRIPTION_UC_JNR'				WHERE BuildingType='BUILDING_COAL_POWER_PLANT';
UPDATE Buildings SET									Cost=390,	Maintenance=4,	Description='LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_FOSSIL_FUEL_POWER_PLANT';
UPDATE Buildings SET									Cost=480,	Maintenance=5,	Description='LOC_BUILDING_POWER_PLANT_DESCRIPTION_UC_JNR'					WHERE BuildingType='BUILDING_POWER_PLANT';
UPDATE Buildings SET									Cost=570,	Maintenance=6,	Description='LOC_BUILDING_JNR_RENEWABLE_DISTRIBUTION_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';

UPDATE Buildings SET PrereqTech='TECH_THE_WHEEL' WHERE BuildingType='BUILDING_ETEMENANKI';

UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_MODE_MACHINES';
UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_MODE_FERTILIZERS';
UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_MODE_ELECTRONICS';
UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_MODE_SOUVENIRS';
UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_MODE_PHARMA';
UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_MODE_PLASTICS';
--------------------------------------------------------------

-- BuildingReplaces
--------------------------------------------------------------
UPDATE BuildingReplaces SET ReplacesBuildingType='BUILDING_JNR_FREIGHT_YARD' WHERE CivUniqueBuildingType='BUILDING_ELECTRONICS_FACTORY';

DELETE FROM BuildingReplaces WHERE CivUniqueBuildingType='BUILDING_PALGUM';
--------------------------------------------------------------

-- Buildings_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Buildings_XP2
		(BuildingType,					Pillage)
VALUES	('BUILDING_JNR_DUMMY_IZ_RIVER',	0),
		('BUILDING_JNR_MILL_RACE',		0);

INSERT OR IGNORE INTO Buildings_XP2
		(BuildingType,				RequiredPower)
SELECT	'BUILDING_JNR_CHEMICAL',	RequiredPower
FROM	Buildings_XP2
WHERE	BuildingType='BUILDING_FACTORY';

UPDATE Buildings_XP2 SET RequiredPower=3 WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';

INSERT OR IGNORE INTO Buildings_XP2
		(BuildingType,							RequiredPower)
VALUES	('BUILDING_ELECTRONICS_FACTORY',		3),
		('BUILDING_JNR_MODE_MACHINES',			4),
		('BUILDING_JNR_MODE_FERTILIZERS',		4),
		('BUILDING_JNR_MODE_ELECTRONICS',		4),
		('BUILDING_JNR_MODE_SOUVENIRS',			4),
		('BUILDING_JNR_MODE_PHARMA',			4),
		('BUILDING_JNR_MODE_PLASTICS',			4);
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
UPDATE BuildingPrereqs SET PrereqBuilding='BUILDING_FACTORY'  WHERE Building='BUILDING_ELECTRONICS_FACTORY';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
VALUES	('BUILDING_JNR_MILL_RACE',			'BUILDING_JNR_DUMMY_IZ_RIVER'),
		('BUILDING_WATER_MILL',				'BUILDING_JNR_MILL_RACE'),
		
		('BUILDING_WORKSHOP',				'BUILDING_WATER_MILL'),
		('BUILDING_JNR_MANUFACTURY',		'BUILDING_WATER_MILL'),
		('BUILDING_JNR_CHEMICAL',			'BUILDING_WORKSHOP'),
		('BUILDING_JNR_FREIGHT_YARD',		'BUILDING_FACTORY'),
		('BUILDING_JNR_MODE_MACHINES',		'BUILDING_FACTORY'),
		('BUILDING_JNR_MODE_FERTILIZERS',	'BUILDING_FACTORY'),
		('BUILDING_JNR_MODE_ELECTRONICS',	'BUILDING_FACTORY'),
		('BUILDING_JNR_MODE_SOUVENIRS',		'BUILDING_FACTORY'),
		('BUILDING_JNR_MODE_PHARMA',		'BUILDING_FACTORY'),
		('BUILDING_JNR_MODE_PLASTICS',		'BUILDING_FACTORY');

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_WIND_MILL'
FROM	BuildingPrereqs
WHERE	PrereqBuilding='BUILDING_WATER_MILL';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_MANUFACTURY'
FROM	BuildingPrereqs
WHERE	PrereqBuilding='BUILDING_WORKSHOP';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_CHEMICAL'
FROM	BuildingPrereqs
WHERE	PrereqBuilding='BUILDING_FACTORY';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_COAL_POWER_PLANT'
FROM	BuildingPrereqs
WHERE	PrereqBuilding='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_FOSSIL_FUEL_POWER_PLANT'
FROM	BuildingPrereqs
WHERE	PrereqBuilding='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	a.Building,							'BUILDING_JNR_RENEWABLE_DISTRIBUTION'
FROM	BuildingPrereqs a, Buildings b
WHERE	a.PrereqBuilding='BUILDING_POWER_PLANT' AND b.BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_FREIGHT_YARD'
FROM	BuildingPrereqs
WHERE	PrereqBuilding='BUILDING_POWER_PLANT';

DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_MODE_FERTILIZERS'	AND PrereqBuilding='BUILDING_FACTORY';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_MODE_PHARMA'		AND PrereqBuilding='BUILDING_FACTORY';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_MODE_PLASTICS'		AND PrereqBuilding='BUILDING_FACTORY';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_MODE_MACHINES'		AND PrereqBuilding='BUILDING_JNR_CHEMICAL';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_MODE_ELECTRONICS'	AND PrereqBuilding='BUILDING_JNR_CHEMICAL';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_MODE_SOUVENIRS'	AND PrereqBuilding='BUILDING_JNR_CHEMICAL';
--------------------------------------------------------------

-- MutuallyExclusiveBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,								MutuallyExclusiveBuilding)
VALUES	('BUILDING_JNR_MILL_RACE',				'BUILDING_JNR_WIND_MILL'),
		
		('BUILDING_WATER_MILL',					'BUILDING_JNR_WIND_MILL'),
		('BUILDING_JNR_WIND_MILL',				'BUILDING_WATER_MILL'),
		('BUILDING_WORKSHOP',					'BUILDING_JNR_MANUFACTURY'),
		('BUILDING_JNR_MANUFACTURY',			'BUILDING_WORKSHOP'),
		('BUILDING_FACTORY',					'BUILDING_JNR_CHEMICAL'),
		('BUILDING_JNR_CHEMICAL',				'BUILDING_FACTORY'),
		('BUILDING_JNR_FREIGHT_YARD',			'BUILDING_COAL_POWER_PLANT'),
		('BUILDING_JNR_FREIGHT_YARD',			'BUILDING_FOSSIL_FUEL_POWER_PLANT'),
		('BUILDING_JNR_FREIGHT_YARD',			'BUILDING_POWER_PLANT'),
		('BUILDING_ELECTRONICS_FACTORY',		'BUILDING_COAL_POWER_PLANT'),
		('BUILDING_ELECTRONICS_FACTORY',		'BUILDING_FOSSIL_FUEL_POWER_PLANT'),
		('BUILDING_ELECTRONICS_FACTORY',		'BUILDING_POWER_PLANT'),
		('BUILDING_COAL_POWER_PLANT',			'BUILDING_JNR_FREIGHT_YARD'),
		('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'BUILDING_JNR_FREIGHT_YARD'),
		('BUILDING_POWER_PLANT',				'BUILDING_JNR_FREIGHT_YARD'),

		('BUILDING_JNR_MODE_MACHINES',			'BUILDING_JNR_MODE_FERTILIZERS'),
		('BUILDING_JNR_MODE_MACHINES',			'BUILDING_JNR_MODE_ELECTRONICS'),
		('BUILDING_JNR_MODE_MACHINES',			'BUILDING_JNR_MODE_SOUVENIRS'),
		('BUILDING_JNR_MODE_MACHINES',			'BUILDING_JNR_MODE_PHARMA'),
		('BUILDING_JNR_MODE_MACHINES',			'BUILDING_JNR_MODE_PLASTICS'),

		('BUILDING_JNR_MODE_FERTILIZERS',		'BUILDING_JNR_MODE_MACHINES'),
		('BUILDING_JNR_MODE_FERTILIZERS',		'BUILDING_JNR_MODE_ELECTRONICS'),
		('BUILDING_JNR_MODE_FERTILIZERS',		'BUILDING_JNR_MODE_SOUVENIRS'),
		('BUILDING_JNR_MODE_FERTILIZERS',		'BUILDING_JNR_MODE_PHARMA'),
		('BUILDING_JNR_MODE_FERTILIZERS',		'BUILDING_JNR_MODE_PLASTICS'),

		('BUILDING_JNR_MODE_ELECTRONICS',		'BUILDING_JNR_MODE_MACHINES'),
		('BUILDING_JNR_MODE_ELECTRONICS',		'BUILDING_JNR_MODE_FERTILIZERS'),
		('BUILDING_JNR_MODE_ELECTRONICS',		'BUILDING_JNR_MODE_SOUVENIRS'),
		('BUILDING_JNR_MODE_ELECTRONICS',		'BUILDING_JNR_MODE_PHARMA'),
		('BUILDING_JNR_MODE_ELECTRONICS',		'BUILDING_JNR_MODE_PLASTICS'),

		('BUILDING_JNR_MODE_SOUVENIRS',			'BUILDING_JNR_MODE_MACHINES'),
		('BUILDING_JNR_MODE_SOUVENIRS',			'BUILDING_JNR_MODE_FERTILIZERS'),
		('BUILDING_JNR_MODE_SOUVENIRS',			'BUILDING_JNR_MODE_ELECTRONICS'),
		('BUILDING_JNR_MODE_SOUVENIRS',			'BUILDING_JNR_MODE_PHARMA'),
		('BUILDING_JNR_MODE_SOUVENIRS',			'BUILDING_JNR_MODE_PLASTICS'),

		('BUILDING_JNR_MODE_PHARMA',			'BUILDING_JNR_MODE_MACHINES'),
		('BUILDING_JNR_MODE_PHARMA',			'BUILDING_JNR_MODE_FERTILIZERS'),
		('BUILDING_JNR_MODE_PHARMA',			'BUILDING_JNR_MODE_ELECTRONICS'),
		('BUILDING_JNR_MODE_PHARMA',			'BUILDING_JNR_MODE_SOUVENIRS'),
		('BUILDING_JNR_MODE_PHARMA',			'BUILDING_JNR_MODE_PLASTICS'),

		('BUILDING_JNR_MODE_PLASTICS',			'BUILDING_JNR_MODE_MACHINES'),
		('BUILDING_JNR_MODE_PLASTICS',			'BUILDING_JNR_MODE_FERTILIZERS'),
		('BUILDING_JNR_MODE_PLASTICS',			'BUILDING_JNR_MODE_ELECTRONICS'),
		('BUILDING_JNR_MODE_PLASTICS',			'BUILDING_JNR_MODE_SOUVENIRS'),
		('BUILDING_JNR_MODE_PLASTICS',			'BUILDING_JNR_MODE_PHARMA');


-- Renewable Energy Complexity
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,								MutuallyExclusiveBuilding)
SELECT	'BUILDING_JNR_FREIGHT_YARD',			BuildingType
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,								MutuallyExclusiveBuilding)
SELECT	'BUILDING_ELECTRONICS_FACTORY',			BuildingType
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,								MutuallyExclusiveBuilding)
SELECT	BuildingType,							'BUILDING_JNR_FREIGHT_YARD'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';

-- Uniques
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,								MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,					'BUILDING_JNR_MANUFACTURY'
FROM	BuildingReplaces
WHERE	ReplacesBuildingType='BUILDING_WORKSHOP';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,								MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,					'BUILDING_JNR_CHEMICAL'
FROM	BuildingReplaces
WHERE	ReplacesBuildingType='BUILDING_FACTORY';
--------------------------------------------------------------

-- StartingBuildings
--------------------------------------------------------------
DELETE FROM StartingBuildings WHERE District='DISTRICT_INDUSTRIAL_ZONE';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,						ModifierType,											SubjectRequirementSetId)
VALUES	('JNR_GRANT_MILL_RACE_DUMMY_RIVER',	'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',	'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,						Name,			Value)
VALUES	('JNR_GRANT_MILL_RACE_DUMMY_RIVER',	'BuildingType',	'BUILDING_JNR_MILL_RACE');
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,					ModifierId)
VALUES	('DISTRICT_INDUSTRIAL_ZONE',	'JNR_GRANT_MILL_RACE_DUMMY_RIVER');

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,					ModifierId)
SELECT	CivUniqueDistrictType,			'JNR_GRANT_MILL_RACE_DUMMY_RIVER'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_INDUSTRIAL_ZONE';
--------------------------------------------------------------