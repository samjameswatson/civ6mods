-- UC_MIC_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,							Kind)
VALUES	('BUILDING_JNR_TARGET_RANGE',	'KIND_BUILDING'),
		('BUILDING_JNR_CAVALIER',		'KIND_BUILDING'),
		('BUILDING_JNR_DEPOT',			'KIND_BUILDING'),
		('BUILDING_JNR_ARSENAL',		'KIND_BUILDING'),
		('BUILDING_JNR_PRISON',			'KIND_BUILDING'),
		('BUILDING_JNR_NAVAL_BASE',		'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,					PrereqDistrict,			PrereqTech,					PrereqCivic,			Cost,	Maintenance,	CitizenSlots,	Housing,	PurchaseYield,	AdvisorType,		Name,									Description)
VALUES	('BUILDING_JNR_TARGET_RANGE',	'DISTRICT_ENCAMPMENT',	'TECH_ARCHERY',				NULL,					90,		1,				1,				0,			'YIELD_GOLD',	'ADVISOR_CONQUEST',	'LOC_BUILDING_JNR_TARGET_RANGE_NAME',	'LOC_BUILDING_JNR_TARGET_RANGE_DESCRIPTION'),
		('BUILDING_JNR_CAVALIER',		'DISTRICT_ENCAMPMENT',	'TECH_CASTLES',				NULL,					195,	2,				1,				1,			'YIELD_GOLD',	'ADVISOR_CONQUEST',	'LOC_BUILDING_JNR_CAVALIER_NAME',		'LOC_BUILDING_JNR_CAVALIER_DESCRIPTION'),
		('BUILDING_JNR_DEPOT',			'DISTRICT_ENCAMPMENT',	'TECH_STIRRUPS',			NULL,					195,	2,				1,				0,			'YIELD_GOLD',	'ADVISOR_CONQUEST',	'LOC_BUILDING_JNR_DEPOT_NAME',			'LOC_BUILDING_JNR_DEPOT_DESCRIPTION'),
		('BUILDING_JNR_ARSENAL',		'DISTRICT_ENCAMPMENT',	'TECH_INDUSTRIALIZATION',	NULL,					330,	3,				1,				0,			'YIELD_GOLD',	'ADVISOR_CONQUEST',	'LOC_BUILDING_JNR_ARSENAL_NAME',		'LOC_BUILDING_JNR_ARSENAL_DESCRIPTION'),
		('BUILDING_JNR_PRISON',			'DISTRICT_ENCAMPMENT',	NULL,						'CIVIC_SCORCHED_EARTH',	360,	3,				2,				1,			'YIELD_GOLD',	'ADVISOR_CONQUEST',	'LOC_BUILDING_JNR_PRISON_NAME',			'LOC_BUILDING_JNR_PRISON_DESCRIPTION'),
		('BUILDING_JNR_NAVAL_BASE',		'DISTRICT_HARBOR',		'TECH_RADIO',				NULL,					440,	3,				1,				1,			'YIELD_GOLD',	'ADVISOR_CONQUEST',	'LOC_BUILDING_JNR_NAVAL_BASE_NAME',		'LOC_BUILDING_JNR_NAVAL_BASE_DESCRIPTION');

UPDATE Buildings SET	PrereqTech=	NULL,	PrereqCivic='CIVIC_MILITARY_TRADITION',						Description='LOC_BUILDING_BARRACKS_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_BARRACKS';
UPDATE Buildings SET																Housing=0,			Description='LOC_BUILDING_STABLE_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_STABLE';
UPDATE Buildings SET	PrereqTech=	NULL,	PrereqCivic='CIVIC_MILITARY_TRADITION',						Description='LOC_BUILDING_BASILIKOI_PAIDES_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_BASILIKOI_PAIDES';
UPDATE Buildings SET	Cost=90,																		Description='LOC_BUILDING_ORDU_DESCRIPTION_UC_JNR'				WHERE BuildingType='BUILDING_ORDU';
UPDATE Buildings SET																					Description='LOC_BUILDING_ARMORY_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_ARMORY';
UPDATE Buildings SET	Maintenance=3,																	Description='LOC_BUILDING_MILITARY_ACADEMY_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_MILITARY_ACADEMY';
UPDATE Buildings SET																					Description='LOC_BUILDING_SHIPYARD_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_SHIPYARD';
UPDATE Buildings SET	Maintenance=3,	CitizenSlots=1,													Description='LOC_BUILDING_HANGAR_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_HANGAR';
UPDATE Buildings SET	Maintenance=4,	CitizenSlots=1,		Name='LOC_BUILDING_AIRPORT_NAME_UC_JNR',	Description='LOC_BUILDING_AIRPORT_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_AIRPORT';
UPDATE Buildings SET																					Description='LOC_BUILDING_SEAPORT_DESCRIPTION_UC_JNR'			WHERE BuildingType='BUILDING_SEAPORT';
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
VALUES	('BUILDING_ARMORY',				'BUILDING_JNR_TARGET_RANGE'),
		('BUILDING_JNR_CAVALIER',		'BUILDING_BARRACKS'),
		('BUILDING_JNR_CAVALIER',		'BUILDING_STABLE'),
		('BUILDING_JNR_CAVALIER',		'BUILDING_JNR_TARGET_RANGE'),
		('BUILDING_JNR_DEPOT',			'BUILDING_BARRACKS'),
		('BUILDING_JNR_DEPOT',			'BUILDING_STABLE'),
		('BUILDING_JNR_DEPOT',			'BUILDING_JNR_TARGET_RANGE'),
		('BUILDING_MILITARY_ACADEMY',	'BUILDING_JNR_CAVALIER'),
		('BUILDING_MILITARY_ACADEMY',	'BUILDING_JNR_DEPOT'),
		('BUILDING_JNR_ARSENAL',		'BUILDING_ARMORY'),
		('BUILDING_JNR_ARSENAL',		'BUILDING_JNR_CAVALIER'),
		('BUILDING_JNR_ARSENAL',		'BUILDING_JNR_DEPOT'),
		('BUILDING_JNR_PRISON',			'BUILDING_ARMORY'),
		('BUILDING_JNR_PRISON',			'BUILDING_JNR_CAVALIER'),
		('BUILDING_JNR_PRISON',			'BUILDING_JNR_DEPOT'),
		('BUILDING_JNR_NAVAL_BASE',		'BUILDING_SHIPYARD'),
		('BUILDING_TERRACOTTA_ARMY',	'BUILDING_JNR_TARGET_RANGE');
--------------------------------------------------------------

-- MutuallyExclusiveBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,						MutuallyExclusiveBuilding)
VALUES	-- TIER 1
		('BUILDING_BARRACKS',			'BUILDING_JNR_TARGET_RANGE'),
		('BUILDING_STABLE',				'BUILDING_JNR_TARGET_RANGE'),
		('BUILDING_JNR_TARGET_RANGE',	'BUILDING_BARRACKS'),
		('BUILDING_JNR_TARGET_RANGE',	'BUILDING_STABLE'),
		-- TIER 2
		('BUILDING_ARMORY',				'BUILDING_JNR_CAVALIER'),
		('BUILDING_ARMORY',				'BUILDING_JNR_DEPOT'),
		('BUILDING_JNR_CAVALIER',		'BUILDING_ARMORY'),
		('BUILDING_JNR_CAVALIER',		'BUILDING_JNR_DEPOT'),
		('BUILDING_JNR_DEPOT',			'BUILDING_ARMORY'),
		('BUILDING_JNR_DEPOT',			'BUILDING_JNR_CAVALIER'),
		-- TIER 3
		('BUILDING_MILITARY_ACADEMY',	'BUILDING_JNR_ARSENAL'),
		('BUILDING_MILITARY_ACADEMY',	'BUILDING_JNR_PRISON'),
		('BUILDING_JNR_ARSENAL',		'BUILDING_MILITARY_ACADEMY'),
		('BUILDING_JNR_ARSENAL',		'BUILDING_JNR_PRISON'),
		('BUILDING_JNR_PRISON',			'BUILDING_MILITARY_ACADEMY'),
		('BUILDING_JNR_PRISON',			'BUILDING_JNR_ARSENAL'),
		-- Harbor
		('BUILDING_SEAPORT',			'BUILDING_JNR_NAVAL_BASE'),
		('BUILDING_JNR_NAVAL_BASE',		'BUILDING_SEAPORT');
--------------------------------------------------------------

-- MutuallyExclusiveBuildings - Uniques
--------------------------------------------------------------
-- TIER 1
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_BARRACKS'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_STABLE' OR ReplacesBuildingType='BUILDING_JNR_TARGET_RANGE';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_STABLE'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_BARRACKS' OR ReplacesBuildingType='BUILDING_JNR_TARGET_RANGE';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_JNR_TARGET_RANGE'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_BARRACKS' OR ReplacesBuildingType='BUILDING_STABLE';

-- TIER 2
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_ARMORY'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_JNR_CAVALIER' OR ReplacesBuildingType='BUILDING_JNR_DEPOT';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_JNR_CAVALIER'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_ARMORY' OR ReplacesBuildingType='BUILDING_JNR_DEPOT';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_JNR_DEPOT'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_ARMORY' OR ReplacesBuildingType='BUILDING_JNR_CAVALIER';

-- TIER 3
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_MILITARY_ACADEMY'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_JNR_ARSENAL' OR ReplacesBuildingType='BUILDING_JNR_PRISON';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_JNR_ARSENAL'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_MILITARY_ACADEMY' OR ReplacesBuildingType='BUILDING_JNR_PRISON';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_JNR_PRISON'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_MILITARY_ACADEMY' OR ReplacesBuildingType='BUILDING_JNR_ARSENAL';

-- Harbor
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_JNR_NAVAL_BASE'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_SEAPORT';

INSERT OR IGNORE INTO MutuallyExclusiveBuildings
		(Building,				MutuallyExclusiveBuilding)
SELECT	 CivUniqueBuildingType,	'BUILDING_SEAPORT'
FROM BuildingReplaces WHERE ReplacesBuildingType='BUILDING_JNR_NAVAL_BASE';
--------------------------------------------------------------

-- Building_GreatPersonPoints
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatPersonPoints
		(BuildingType,					GreatPersonClassType,			PointsPerTurn)
VALUES	('BUILDING_JNR_TARGET_RANGE',	'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_JNR_CAVALIER',		'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_JNR_DEPOT',			'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_JNR_ARSENAL',		'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_HANGAR',				'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_AIRPORT',			'GREAT_PERSON_CLASS_GENERAL',	1),
		('BUILDING_JNR_NAVAL_BASE',		'GREAT_PERSON_CLASS_ADMIRAL',	2);

UPDATE Building_GreatPersonPoints SET PointsPerTurn=2 WHERE BuildingType='BUILDING_ORDU'				AND GreatPersonClassType='GREAT_PERSON_CLASS_GENERAL';
UPDATE Building_GreatPersonPoints SET PointsPerTurn=2 WHERE BuildingType='BUILDING_MILITARY_ACADEMY'	AND GreatPersonClassType='GREAT_PERSON_CLASS_GENERAL';

UPDATE Building_GreatPersonPoints SET GreatPersonClassType='GREAT_PERSON_CLASS_MERCHANT' WHERE BuildingType='BUILDING_SEAPORT';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType)
VALUES	('ENCAMPMENT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',	'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('TARGET_RANGE_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',	'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('CAVALIER_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('DEPOT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',			'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('ARSENAL_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('PRISON_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('SHIPYARD_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('NAVAL_BASE_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',	'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('AERODROME_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('HANGAR_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('AIRPORT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,		Value)
VALUES	('ENCAMPMENT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',	'Amount',	10),
		('TARGET_RANGE_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',	'Amount',	10),
		('CAVALIER_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10),
		('DEPOT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',			'Amount',	10),
		('ARSENAL_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10),
		('PRISON_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10),
		('SHIPYARD_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10),
		('NAVAL_BASE_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',	'Amount',	10),
		('AERODROME_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10),
		('HANGAR_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10),
		('AIRPORT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR',		'Amount',	10);
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
VALUES	('DISTRICT_ENCAMPMENT',	'ENCAMPMENT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('DISTRICT_AERODROME',	'AERODROME_ADJUST_RESOURCE_STOCKPILE_CAP_JNR');

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'ENCAMPMENT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'
FROM	DistrictReplaces WHERE ReplacesDistrictType='DISTRICT_ENCAMPMENT';

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,			ModifierId)
SELECT	CivUniqueDistrictType,	'AERODROME_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'
FROM	DistrictReplaces WHERE ReplacesDistrictType='DISTRICT_AERODROME';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
VALUES	('BUILDING_JNR_TARGET_RANGE',	'TARGET_RANGE_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_JNR_CAVALIER',		'CAVALIER_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_JNR_DEPOT',			'DEPOT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_JNR_ARSENAL',		'ARSENAL_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_JNR_PRISON',			'PRISON_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_SHIPYARD',			'SHIPYARD_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_JNR_NAVAL_BASE',		'NAVAL_BASE_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_HANGAR',				'HANGAR_ADJUST_RESOURCE_STOCKPILE_CAP_JNR'),
		('BUILDING_AIRPORT',			'AIRPORT_ADJUST_RESOURCE_STOCKPILE_CAP_JNR');
--------------------------------------------------------------