-- UC_CMP_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,							Kind)
VALUES	('BUILDING_JNR_ASSEMBLY',		'KIND_BUILDING'),
		('BUILDING_JNR_CABINET',		'KIND_BUILDING'),
		('BUILDING_JNR_MANSION',		'KIND_BUILDING'),
		('BUILDING_JNR_OPERA',			'KIND_BUILDING'),
		('BUILDING_JNR_GRAND_HOTEL',	'KIND_BUILDING'),
		('BUILDING_JNR_MEDIA_CENTER',	'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,					PrereqDistrict,		PrereqCivic,					Cost,	Maintenance,	CitizenSlots,	Entertainment,	PurchaseYield,	AdvisorType,		Name,									Description)
VALUES	('BUILDING_JNR_ASSEMBLY',		'DISTRICT_THEATER',	'CIVIC_POLITICAL_PHILOSOPHY',	150,	1,				1,				0,				'YIELD_GOLD',	'ADVISOR_CULTURE',	'LOC_BUILDING_JNR_ASSEMBLY_NAME',		'LOC_BUILDING_JNR_ASSEMBLY_DESCRIPTION'),
		('BUILDING_JNR_CABINET',		'DISTRICT_THEATER',	'CIVIC_HUMANISM',				250,	2,				2,				1,				'YIELD_GOLD',	'ADVISOR_CULTURE',	'LOC_BUILDING_JNR_CABINET_NAME',		NULL),
		('BUILDING_JNR_MANSION',		'DISTRICT_THEATER',	'CIVIC_DIPLOMATIC_SERVICE',		250,	2,				1,				0,				'YIELD_GOLD',	'ADVISOR_CULTURE',	'LOC_BUILDING_JNR_MANSION_NAME',		'LOC_BUILDING_JNR_MANSION_DESCRIPTION'),
		('BUILDING_JNR_OPERA',			'DISTRICT_THEATER',	'CIVIC_OPERA_BALLET',			360,	3,				1,				1,				'YIELD_GOLD',	'ADVISOR_CULTURE',	'LOC_BUILDING_JNR_OPERA_NAME',			'LOC_BUILDING_JNR_OPERA_DESCRIPTION'),
		('BUILDING_JNR_GRAND_HOTEL',	'DISTRICT_THEATER',	'CIVIC_OPERA_BALLET',			360,	3,				1,				0,				'YIELD_GOLD',	'ADVISOR_CULTURE',	'LOC_BUILDING_JNR_GRAND_HOTEL_NAME',	'LOC_BUILDING_JNR_GRAND_HOTEL_DESCRIPTION'),
		('BUILDING_JNR_MEDIA_CENTER',	'DISTRICT_THEATER',	'CIVIC_MASS_MEDIA',				480,	4,				1,				1,				'YIELD_GOLD',	'ADVISOR_CULTURE',	'LOC_BUILDING_JNR_MEDIA_CENTER_NAME',	'LOC_BUILDING_JNR_MEDIA_CENTER_DESCRIPTION');

UPDATE Buildings SET Name='LOC_BUILDING_AMPHITHEATER_NAME_UC_JNR'		WHERE BuildingType='BUILDING_AMPHITHEATER';
UPDATE Buildings SET Name='LOC_BUILDING_BROADCAST_CENTER_NAME_UC_JNR'	WHERE BuildingType='BUILDING_BROADCAST_CENTER';
UPDATE Buildings SET Name='LOC_BUILDING_MUSEUM_ART_NAME_UC_JNR'			WHERE BuildingType='BUILDING_MUSEUM_ART';
UPDATE Buildings SET Name='LOC_BUILDING_MUSEUM_ARTIFACT_NAME_UC_JNR'	WHERE BuildingType='BUILDING_MUSEUM_ARTIFACT';

UPDATE Buildings SET								Entertainment=1																		WHERE BuildingType='BUILDING_AMPHITHEATER';
UPDATE Buildings SET													Description='LOC_BUILDING_MARAE_DESCRIPTION_UC_JNR'				WHERE BuildingType='BUILDING_MARAE';
UPDATE Buildings SET	Cost=480,	Maintenance=4,						Description='LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_BROADCAST_CENTER';
UPDATE Buildings SET	Cost=480,	Maintenance=4,	Entertainment=1,	Description='LOC_BUILDING_FILM_STUDIO_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_FILM_STUDIO';
UPDATE Buildings SET	Cost=250,										Description='LOC_BUILDING_JNR_DOJO_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_JNR_DOJO';

UPDATE Buildings SET	Cost=180,	Maintenance=0,	PrereqCivic='CIVIC_NATIONALISM',		CitizenSlots=NULL,	Description='LOC_BUILDING_MUSEUM_ART_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_MUSEUM_ART';
UPDATE Buildings SET	Cost=180,	Maintenance=0,	PrereqCivic='CIVIC_NATURAL_HISTORY',	CitizenSlots=NULL,	Description='LOC_BUILDING_MUSEUM_ARTIFACT_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_MUSEUM_ARTIFACT';
--------------------------------------------------------------

-- Buildings_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Buildings_XP2
		(BuildingType,					RequiredPower)
SELECT	'BUILDING_JNR_MEDIA_CENTER',	RequiredPower
FROM	Buildings_XP2
WHERE	BuildingType='BUILDING_BROADCAST_CENTER';
--------------------------------------------------------------

-- BuildingReplaces
--------------------------------------------------------------
DELETE FROM BuildingReplaces WHERE CivUniqueBuildingType='BUILDING_MARAE';
DELETE FROM BuildingReplaces WHERE CivUniqueBuildingType='BUILDING_FILM_STUDIO';
DELETE FROM BuildingReplaces WHERE CivUniqueBuildingType='BUILDING_JNR_DOJO';

INSERT OR IGNORE INTO BuildingReplaces
		(CivUniqueBuildingType,		ReplacesBuildingType)
VALUES	('BUILDING_MARAE',			'BUILDING_JNR_ASSEMBLY'),
		('BUILDING_MARAE',			'BUILDING_AMPHITHEATER'),
		('BUILDING_FILM_STUDIO',	'BUILDING_JNR_MEDIA_CENTER'),
		('BUILDING_FILM_STUDIO',	'BUILDING_BROADCAST_CENTER');
		
INSERT OR IGNORE INTO BuildingReplaces
		(CivUniqueBuildingType,		ReplacesBuildingType)
SELECT	BuildingType,				'BUILDING_JNR_MANSION'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_DOJO';

INSERT OR IGNORE INTO BuildingReplaces
		(CivUniqueBuildingType,		ReplacesBuildingType)
SELECT	BuildingType,				'BUILDING_JNR_CABINET'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_DOJO';
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_MUSEUM_ART';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_MUSEUM_ARTIFACT';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_BROADCAST_CENTER';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_FILM_STUDIO';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_MUSEUM_ARTIFACT';
DELETE FROM BuildingPrereqs WHERE Building='BUILDING_JNR_DOJO';

UPDATE BuildingPrereqs SET PrereqBuilding='BUILDING_JNR_CABINET' WHERE PrereqBuilding='BUILDING_MUSEUM_ART';
UPDATE BuildingPrereqs SET PrereqBuilding='BUILDING_JNR_MANSION' WHERE PrereqBuilding='BUILDING_MUSEUM_ARTIFACT';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
VALUES	('BUILDING_JNR_CABINET',		'BUILDING_AMPHITHEATER'),
		('BUILDING_JNR_MANSION',		'BUILDING_AMPHITHEATER'),
		('BUILDING_JNR_OPERA',			'BUILDING_JNR_CABINET'),
		('BUILDING_JNR_GRAND_HOTEL',	'BUILDING_JNR_CABINET'),
		('BUILDING_MUSEUM_ART',			'BUILDING_JNR_CABINET'),
		('BUILDING_MUSEUM_ARTIFACT',	'BUILDING_JNR_CABINET'),
		('BUILDING_BROADCAST_CENTER',	'BUILDING_JNR_OPERA'),
		('BUILDING_JNR_MEDIA_CENTER',	'BUILDING_JNR_OPERA'),
		('BUILDING_FILM_STUDIO',		'BUILDING_JNR_OPERA');

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	BuildingType,					'BUILDING_AMPHITHEATER'
FROM	Buildings		WHERE	BuildingType='BUILDING_JNR_DOJO';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	Building,						'BUILDING_JNR_ASSEMBLY'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_AMPHITHEATER';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	Building,						'BUILDING_JNR_MANSION'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_JNR_CABINET';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	Building,						'BUILDING_JNR_CABINET'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_JNR_MANSION';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	Building,						'BUILDING_JNR_GRAND_HOTEL'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_JNR_OPERA';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	Building,						'BUILDING_JNR_MEDIA_CENTER'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_BROADCAST_CENTER';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
SELECT	Building,						'BUILDING_JNR_MEDIA_CENTER'
FROM	BuildingPrereqs	WHERE	PrereqBuilding='BUILDING_BROADCAST_CENTER';

INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
VALUES	('BUILDING_BOLSHOI_THEATRE',	'BUILDING_JNR_OPERA'),
		('BUILDING_BOLSHOI_THEATRE',	'BUILDING_JNR_GRAND_HOTEL'),
		('BUILDING_HERMITAGE',			'BUILDING_JNR_CABINET'),
		('BUILDING_HERMITAGE',			'BUILDING_JNR_MANSION'),
		('BUILDING_BROADWAY',			'BUILDING_BROADCAST_CENTER'),
		('BUILDING_BROADWAY',			'BUILDING_JNR_MEDIA_CENTER');
--------------------------------------------------------------

-- MutuallyExclusiveBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,						MutuallyExclusiveBuilding)
VALUES	('BUILDING_AMPHITHEATER',		'BUILDING_JNR_ASSEMBLY'),
		('BUILDING_JNR_ASSEMBLY',		'BUILDING_AMPHITHEATER'),
		('BUILDING_JNR_CABINET',		'BUILDING_JNR_MANSION'),
		('BUILDING_JNR_MANSION',		'BUILDING_JNR_CABINET'),
		('BUILDING_JNR_OPERA',			'BUILDING_JNR_GRAND_HOTEL'),
		('BUILDING_JNR_GRAND_HOTEL',	'BUILDING_JNR_OPERA'),
		('BUILDING_BROADCAST_CENTER',	'BUILDING_JNR_MEDIA_CENTER'),
		('BUILDING_JNR_MEDIA_CENTER',	'BUILDING_BROADCAST_CENTER');

-- Uniques
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,				'BUILDING_JNR_ASSEMBLY'
FROM	BuildingReplaces	WHERE	ReplacesBuildingType='BUILDING_AMPHITHEATER' AND CivUniqueBuildingType NOT IN ('BUILDING_MARAE');

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,				'BUILDING_JNR_MANSION'
FROM	BuildingReplaces	WHERE	ReplacesBuildingType='BUILDING_JNR_CABINET' AND CivUniqueBuildingType NOT IN ('BUILDING_JNR_DOJO');

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,							MutuallyExclusiveBuilding)
SELECT	CivUniqueBuildingType,				'BUILDING_JNR_MEDIA_CENTER'
FROM	BuildingReplaces	WHERE	ReplacesBuildingType='BUILDING_BROADCAST_CENTER' AND CivUniqueBuildingType NOT IN ('BUILDING_FILM_STUDIO');
--------------------------------------------------------------

-- StartingBuildings
--------------------------------------------------------------
DELETE FROM StartingBuildings WHERE District='DISTRICT_THEATER';
--------------------------------------------------------------