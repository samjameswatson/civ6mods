-- UC_REL_Worship_Buildings
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,						Kind)
VALUES	('BUILDING_JNR_CANDI',		'KIND_BUILDING'),
		('BUILDING_JNR_DAOGUAN',	'KIND_BUILDING'),
		('BUILDING_JNR_JINJA',		'KIND_BUILDING'),
		('BUILDING_JNR_KHALWAT',	'KIND_BUILDING'),
		('BUILDING_JNR_MANDIR',		'KIND_BUILDING'),
		('BUILDING_JNR_MBARI',		'KIND_BUILDING'),
		('BUILDING_JNR_PERIPTEROS',	'KIND_BUILDING'),
		('BUILDING_JNR_SOBOR',		'KIND_BUILDING'),
		('BUILDING_JNR_TZACUALLI',	'KIND_BUILDING');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
INSERT INTO Buildings
		(BuildingType,				PrereqDistrict,			EnabledByReligion,	Cost,	Maintenance,	CitizenSlots,	Housing,	Entertainment,	PurchaseYield,	Name,								Description)
VALUES	('BUILDING_JNR_CANDI',		'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_CANDI_NAME',		'LOC_BUILDING_JNR_CANDI_DESCRIPTION'),
		('BUILDING_JNR_DAOGUAN',	'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_DAOGUAN_NAME',	'LOC_BUILDING_JNR_DAOGUAN_DESCRIPTION'),
		('BUILDING_JNR_JINJA',		'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_JINJA_NAME',		'LOC_BUILDING_JNR_JINJA_DESCRIPTION'),
		('BUILDING_JNR_KHALWAT',	'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			1,				'YIELD_FAITH',	'LOC_BUILDING_JNR_KHALWAT_NAME',	'LOC_BUILDING_JNR_KHALWAT_DESCRIPTION'),
		('BUILDING_JNR_MANDIR',		'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_MANDIR_NAME',		'LOC_BUILDING_JNR_MANDIR_DESCRIPTION'),
		('BUILDING_JNR_MBARI',		'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				1,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_MBARI_NAME',		'LOC_BUILDING_JNR_MBARI_DESCRIPTION'),
		('BUILDING_JNR_PERIPTEROS',	'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_PERIPTEROS_NAME',	'LOC_BUILDING_JNR_PERIPTEROS_DESCRIPTION'),
		('BUILDING_JNR_SOBOR',		'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_SOBOR_NAME',		'LOC_BUILDING_JNR_SOBOR_DESCRIPTION'),
		('BUILDING_JNR_TZACUALLI',	'DISTRICT_HOLY_SITE',	1,					190,	3,				1,				0,			0,				'YIELD_FAITH',	'LOC_BUILDING_JNR_TZACUALLI_NAME',	'LOC_BUILDING_JNR_TZACUALLI_DESCRIPTION');

UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_CATHEDRAL';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_DAR_E_MEHR';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_GURDWARA';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_MEETING_HOUSE';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_MOSQUE';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_PAGODA';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_STUPA';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_SYNAGOGUE';
UPDATE Buildings SET Maintenance=3 WHERE BuildingType='BUILDING_WAT';

UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_BASILICA';
UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_BETH_MANDA';
UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_KHALWAT';
UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_BUTTO';
UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_DERASAR';
UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_CANDI';
UPDATE Buildings SET InternalOnly=1, EnabledByReligion=0 WHERE BuildingType='BUILDING_P0K_SERAPEUM';
--------------------------------------------------------------

-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingPrereqs
		(Building,					PrereqBuilding)
VALUES	('BUILDING_JNR_CANDI',		'BUILDING_TEMPLE'),
		('BUILDING_JNR_DAOGUAN',	'BUILDING_TEMPLE'),
		('BUILDING_JNR_JINJA',		'BUILDING_TEMPLE'),
		('BUILDING_JNR_KHALWAT',	'BUILDING_TEMPLE'),
		('BUILDING_JNR_MANDIR',		'BUILDING_TEMPLE'),
		('BUILDING_JNR_MBARI',		'BUILDING_TEMPLE'),
		('BUILDING_JNR_PERIPTEROS',	'BUILDING_TEMPLE'),
		('BUILDING_JNR_SOBOR',		'BUILDING_TEMPLE'),
		('BUILDING_JNR_TZACUALLI',	'BUILDING_TEMPLE');
--------------------------------------------------------------

