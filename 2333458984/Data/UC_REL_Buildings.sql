-- UC_REL_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,						Kind)
VALUES	('BUILDING_JNR_ALTAR',		'KIND_BUILDING'),
		('BUILDING_JNR_MONASTERY',	'KIND_BUILDING'),
		('BUILDING_JNR_HOSPITIUM',	'KIND_BUILDING'),
		('BUILDING_JNR_GARDEN',		'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,				PrereqDistrict,			PrereqCivic,				Cost,	Maintenance,	CitizenSlots,	Housing,	Entertainment,	PurchaseYield,	AdvisorType,			Name,								Description)
VALUES	('BUILDING_JNR_ALTAR',		'DISTRICT_HOLY_SITE',	'CIVIC_MYSTICISM',			70,		1,				1,				0,			0,				'YIELD_GOLD',	'ADVISOR_RELIGIOUS',	'LOC_BUILDING_JNR_ALTAR_NAME',		'LOC_BUILDING_JNR_ALTAR_DESCRIPTION'),
		('BUILDING_JNR_MONASTERY',	'DISTRICT_HOLY_SITE',	'CIVIC_THEOLOGY',			150,	2,				1,				0,			0,				'YIELD_GOLD',	'ADVISOR_RELIGIOUS',	'LOC_BUILDING_JNR_MONASTERY_NAME',	'LOC_BUILDING_JNR_MONASTERY_DESCRIPTION'),
		('BUILDING_JNR_HOSPITIUM',	'DISTRICT_HOLY_SITE',	'CIVIC_REFORMED_CHURCH',	290,	4,				1,				2,			0,				'YIELD_GOLD',	'ADVISOR_RELIGIOUS',	'LOC_BUILDING_JNR_HOSPITIUM_NAME',	'LOC_BUILDING_JNR_HOSPITIUM_DESCRIPTION'),
		('BUILDING_JNR_GARDEN',		'DISTRICT_HOLY_SITE',	'CIVIC_HUMANISM',			290,	4,				1,				1,			1,				'YIELD_GOLD',	'ADVISOR_RELIGIOUS',	'LOC_BUILDING_JNR_GARDEN_NAME',		'LOC_BUILDING_JNR_GARDEN_DESCRIPTION');

UPDATE Buildings SET	CitizenSlots=2																WHERE BuildingType='BUILDING_SHRINE';
UPDATE Buildings SET	Cost=150,		Description='LOC_BUILDING_TEMPLE_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_TEMPLE';
UPDATE Buildings SET	Cost=150,		Description='LOC_BUILDING_STAVE_CHURCH_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_STAVE_CHURCH';
UPDATE Buildings SET	Cost=150,		Description='LOC_BUILDING_PRASAT_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_PRASAT';
UPDATE Buildings SET	Maintenance=3,	Description='LOC_' || BuildingType || '_DESCRIPTION_UC_JNR'	WHERE EnabledByReligion=1;

UPDATE Improvements SET					Name='LOC_IMPROVEMENT_MONASTERY_NAME_UC_JNR'				WHERE ImprovementType='IMPROVEMENT_MONASTERY';
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
VALUES	('BUILDING_JNR_MONASTERY',		'BUILDING_SHRINE');

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	'BUILDING_JNR_HOSPITIUM',			BuildingType
FROM	Buildings	WHERE		EnabledByReligion=1;

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	'BUILDING_JNR_HOSPITIUM',			BuildingType
FROM	Buildings	WHERE		EnabledByReligion=1;

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_ALTAR'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_SHRINE';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	Building,							'BUILDING_JNR_MONASTERY'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_TEMPLE';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,							PrereqBuilding)
SELECT	'BUILDING_JNR_GARDEN',				PrereqBuilding
FROM	BuildingPrereqs	WHERE	Building='BUILDING_JNR_HOSPITIUM';
--------------------------------------------------------------

-- BuildingReplaces
--------------------------------------------------------------
DELETE FROM BuildingReplaces WHERE CivUniqueBuildingType='BUILDING_STAVE_CHURCH';

INSERT OR IGNORE INTO BuildingReplaces
		(CivUniqueBuildingType,		ReplacesBuildingType)
SELECT	BuildingType,				'BUILDING_JNR_MONASTERY'
FROM	Buildings
WHERE	BuildingType='BUILDING_STAVE_CHURCH';
--------------------------------------------------------------

-- MutuallyExclusiveBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,					MutuallyExclusiveBuilding)
VALUES	('BUILDING_SHRINE',			'BUILDING_JNR_ALTAR'),
		('BUILDING_JNR_ALTAR',		'BUILDING_SHRINE'),
		('BUILDING_TEMPLE',			'BUILDING_JNR_MONASTERY'),
		('BUILDING_JNR_MONASTERY',	'BUILDING_TEMPLE'),
		('BUILDING_JNR_HOSPITIUM',	'BUILDING_JNR_GARDEN'),
		('BUILDING_JNR_GARDEN',		'BUILDING_JNR_HOSPITIUM');

-- Uniques
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,				'BUILDING_JNR_ALTAR'
FROM	BuildingReplaces	WHERE	ReplacesBuildingType='BUILDING_SHRINE';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,				'BUILDING_JNR_MONASTERY'
FROM	BuildingReplaces	WHERE	ReplacesBuildingType='BUILDING_TEMPLE';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,				'BUILDING_TEMPLE'
FROM	BuildingReplaces	WHERE	ReplacesBuildingType='BUILDING_JNR_MONASTERY';
--------------------------------------------------------------

-- Unit_BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO Unit_BuildingPrereqs
		(Unit,	PrereqBuilding)
SELECT	Unit,	'BUILDING_JNR_ALTAR'
FROM	Unit_BuildingPrereqs WHERE PrereqBuilding='BUILDING_SHRINE';

INSERT OR IGNORE INTO Unit_BuildingPrereqs
		(Unit,	PrereqBuilding)
SELECT	Unit,	'BUILDING_JNR_MONASTERY'
FROM	Unit_BuildingPrereqs WHERE PrereqBuilding='BUILDING_TEMPLE';
--------------------------------------------------------------

-- StartingBuildings
--------------------------------------------------------------
DELETE FROM StartingBuildings WHERE District='DISTRICT_HOLY_SITE';
--------------------------------------------------------------