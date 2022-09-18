-- UC_REL_AmunRa
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,							Kind)
VALUES	('BUILDING_JNR_CONSERVATION',	'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------

INSERT INTO Buildings
		(BuildingType,					PrereqDistrict,			PrereqCivic,			Cost,	Maintenance,	CitizenSlots,	PurchaseYield,	AdvisorType,			TraitType,									Name,							Description)
VALUES	('BUILDING_JNR_CONSERVATION',	'DISTRICT_HOLY_SITE',	'CIVIC_CONSERVATION',	330,	4,				1,				'YIELD_GOLD',	'ADVISOR_RELIGIOUS',	'TRAIT_CIVILIZATION_POK_BUILDING_OBELISK',	'LOC_BUILDING_JNR_CONSERVATION_NAME',	'LOC_BUILDING_JNR_CONSERVATION_DESCRIPTION');

UPDATE Buildings SET CitizenSlots=2													WHERE BuildingType='BUILDING_OBELISK';
UPDATE Buildings SET Description='LOC_BUILDING_NUBIAN_SHRINE_DESCRIPTION_UC_JNR'	WHERE BuildingType='BUILDING_NUBIAN_SHRINE';
UPDATE Buildings SET Description='LOC_BUILDING_TEMPLE_AMUN_DESCRIPTION_UC_JNR'		WHERE BuildingType='BUILDING_TEMPLE_AMUN';
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingPrereqs
		(Building,						PrereqBuilding)
VALUES	('BUILDING_JNR_CONSERVATION',	'BUILDING_TEMPLE_AMUN');
--------------------------------------------------------------

-- BuildingReplaces
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingReplaces
		(CivUniqueBuildingType,			ReplacesBuildingType)
VALUES	('BUILDING_OBELISK',			'BUILDING_JNR_ALTAR'),
		('BUILDING_NUBIAN_SHRINE',		'BUILDING_JNR_MONASTERY'),
		('BUILDING_JNR_CONSERVATION',	'BUILDING_JNR_HOSPITIUM'),
		('BUILDING_JNR_CONSERVATION',	'BUILDING_JNR_GARDEN');
--------------------------------------------------------------

-- Building_YieldChanges
--------------------------------------------------------------

INSERT OR IGNORE INTO Building_YieldChanges
		(BuildingType,					YieldType,		YieldChange)
VALUES	('BUILDING_JNR_CONSERVATION',	'YIELD_FAITH',	1);

UPDATE Building_YieldChanges SET YieldChange=1	WHERE BuildingType='BUILDING_OBELISK'		AND YieldType='YIELD_FAITH';
UPDATE Building_YieldChanges SET YieldChange=1	WHERE BuildingType='BUILDING_NUBIAN_SHRINE'	AND YieldType='YIELD_FAITH';
--------------------------------------------------------------

-- Building_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_CitizenYieldChanges
		(BuildingType,			YieldType,		YieldChange)
VALUES	('BUILDING_OBELISK',	'YIELD_FAITH',	1),
		('BUILDING_OBELISK',	'YIELD_FAITH',	1);
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,									SubjectRequirementSetId)
VALUES	('POK_JNR_CONSERVATION_REEDS_SCIENCE',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'POK_AMUN_RA_REEDS_REQUIREMENTS'),
		('POK_JNR_CONSERVATION_FAITH_ARTIFACT',	'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',	NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
VALUES	('POK_JNR_CONSERVATION_REEDS_SCIENCE',	'YieldType',			'YIELD_SCIENCE'),
		('POK_JNR_CONSERVATION_REEDS_SCIENCE',	'Amount',				1),
		('POK_JNR_CONSERVATION_FAITH_ARTIFACT',	'GreatWorkObjectType',	'GREATWORKOBJECT_ARTIFACT'),
		('POK_JNR_CONSERVATION_FAITH_ARTIFACT',	'YieldType',			'YIELD_FAITH'),
		('POK_JNR_CONSERVATION_FAITH_ARTIFACT',	'YieldChange',			2);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
VALUES	('BUILDING_NUBIAN_SHRINE',		'JNR_TEMPLE_FAITH_POPULATION'),
		('BUILDING_TEMPLE_AMUN',		'JNR_WORSHIP_FAITH_PERCENTAGE'),
		('BUILDING_JNR_CONSERVATION',	'POK_JNR_CONSERVATION_REEDS_SCIENCE'),
		('BUILDING_JNR_CONSERVATION',	'POK_JNR_CONSERVATION_FAITH_ARTIFACT'),
		('BUILDING_JNR_CONSERVATION',	'JNR_GARDEN_GREAT_PEOPLE');
--------------------------------------------------------------

-- MomentIllustrations
--------------------------------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType,				MomentDataType,			GameDataType,					Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_BUILDING',	'MOMENT_DATA_BUILDING',	'BUILDING_JNR_CONSERVATION',	'Moment_Unique_Building_Pok_Obelisk.dds');
--------------------------------------------------------------