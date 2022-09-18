-- UC_AQD_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,								Kind)
VALUES	('BUILDING_JNR_ORCHARD',			'KIND_BUILDING'),
		('BUILDING_JNR_HAMMER_WORKS',		'KIND_BUILDING'),
		('BUILDING_JNR_BATHHOUSE',			'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,						PrereqDistrict,			PrereqTech,				Cost,	Maintenance,	CitizenSlots,	Housing,	Entertainment,	PurchaseYield,	AdvisorType,		Name,										Description)
VALUES	('BUILDING_JNR_ORCHARD',			'DISTRICT_AQUEDUCT',	'TECH_MATHEMATICS',		210,	0,				2,				2,			0,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_ORCHARD_NAME',			'LOC_BUILDING_JNR_ORCHARD_DESCRIPTION'),
		('BUILDING_JNR_HAMMER_WORKS',		'DISTRICT_AQUEDUCT',	'TECH_MACHINERY',		210,	1,				2,				0,			0,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_HAMMER_WORKS_NAME',		'LOC_BUILDING_JNR_HAMMER_WORKS_DESCRIPTION'),
		('BUILDING_JNR_BATHHOUSE',			'DISTRICT_AQUEDUCT',	'TECH_CONSTRUCTION',	210,	1,				2,				0,			1,				'YIELD_GOLD',	'ADVISOR_GENERIC',	'LOC_BUILDING_JNR_BATHHOUSE_NAME',			'LOC_BUILDING_JNR_BATHHOUSE_DESCRIPTION');

UPDATE Buildings SET PrereqDistrict='DISTRICT_AQUEDUCT', Cost=290, Housing=1, CitizenSlots=1, Description='LOC_BUILDING_SEWER_DESCRIPTION_JNR_UC' WHERE BuildingType='BUILDING_SEWER';

UPDATE Buildings SET InternalOnly=1 WHERE BuildingType='BUILDING_JNR_WATER_TREATMENT';
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	'BUILDING_JNR_ORCHARD',			BuildingType
FROM	Buildings
WHERE	BuildingType IN (
						'BUILDING_GRANARY',
						'BUILDING_MARKET',
						'BUILDING_JNR_MINT',
						'BUILDING_JNR_WAYSTATION',
						'BUILDING_LIGHTHOUSE',
						'BUILDING_JNR_LIGHTHOUSE_TRADE'
						);

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	'BUILDING_JNR_HAMMER_WORKS',	BuildingType
FROM	Buildings
WHERE	BuildingType IN (
						'BUILDING_LIBRARY',
						'BUILDING_JNR_ACADEMY',
						'BUILDING_WORKSHOP',
						'BUILDING_BARRACKS',
						'BUILDING_STABLE',
						'BUILDING_JNR_TARGET_RANGE'
						);

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	'BUILDING_JNR_BATHHOUSE',		BuildingType
FROM	Buildings
WHERE	BuildingType IN (
						'BUILDING_AMPHITHEATER',
						'BUILDING_JNR_ASSEMBLY',
						'BUILDING_TEMPLE',
						'BUILDING_JNR_MONASTERY',
						'BUILDING_ARENA',
						'BUILDING_JNR_TOURNEY'
						);

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
VALUES	('BUILDING_SEWER',				'BUILDING_JNR_ORCHARD'),
		('BUILDING_SEWER',				'BUILDING_JNR_HAMMER_WORKS'),
		('BUILDING_SEWER',				'BUILDING_JNR_BATHHOUSE');

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	'BUILDING_JNR_HAMMER_WORKS',	'BUILDING_JNR_WIND_MILL'
FROM	Buildings WHERE EXISTS (SELECT * FROM BUILDINGS WHERE BuildingType='BUILDING_JNR_WIND_MILL');

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	'BUILDING_JNR_HAMMER_WORKS',	'BUILDING_WATER_MILL'
FROM	Buildings WHERE EXISTS (SELECT * FROM BUILDINGS WHERE BuildingType='BUILDING_JNR_WIND_MILL');

DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_HAMMER_WORKS'	AND PrereqBuilding='BUILDING_WORKSHOP' AND EXISTS (SELECT * FROM BUILDINGS WHERE BuildingType='BUILDING_JNR_WIND_MILL');
--------------------------------------------------------------

-- MutuallyExclusiveBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,						MutuallyExclusiveBuilding)
VALUES	('BUILDING_JNR_ORCHARD',		'BUILDING_JNR_HAMMER_WORKS'),
		('BUILDING_JNR_ORCHARD',		'BUILDING_JNR_BATHHOUSE'),
		('BUILDING_JNR_HAMMER_WORKS',	'BUILDING_JNR_ORCHARD'),
		('BUILDING_JNR_HAMMER_WORKS',	'BUILDING_JNR_BATHHOUSE'),
		('BUILDING_JNR_BATHHOUSE',		'BUILDING_JNR_ORCHARD'),
		('BUILDING_JNR_BATHHOUSE',		'BUILDING_JNR_HAMMER_WORKS');
--------------------------------------------------------------