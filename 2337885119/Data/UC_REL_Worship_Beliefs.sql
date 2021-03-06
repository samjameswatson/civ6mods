-- UC_REL_Worship_Beliefs
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,						Kind)
VALUES	('BELIEF_JNR_CANDI',		'KIND_BELIEF'),
		('BELIEF_JNR_DAOGUAN',		'KIND_BELIEF'),
		('BELIEF_JNR_JINJA',		'KIND_BELIEF'),
		('BELIEF_JNR_KHALWAT',		'KIND_BELIEF'),
		('BELIEF_JNR_MANDIR',		'KIND_BELIEF'),
		('BELIEF_JNR_MBARI',		'KIND_BELIEF'),
		('BELIEF_JNR_PERIPTEROS',	'KIND_BELIEF'),
		('BELIEF_JNR_SOBOR',		'KIND_BELIEF'),
		('BELIEF_JNR_TZACUALLI',	'KIND_BELIEF');
--------------------------------------------------------------

-- Beliefs
--------------------------------------------------------------
INSERT OR IGNORE INTO Beliefs
		(BeliefType,				BeliefClassType,		Name,								Description)
VALUES	('BELIEF_JNR_CANDI',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_CANDI_NAME',		'LOC_BELIEF_JNR_CANDI_DESCRIPTION'),
		('BELIEF_JNR_DAOGUAN',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_DAOGUAN_NAME',		'LOC_BELIEF_JNR_DAOGUAN_DESCRIPTION'),
		('BELIEF_JNR_JINJA',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_JINJA_NAME',		'LOC_BELIEF_JNR_JINJA_DESCRIPTION'),
		('BELIEF_JNR_KHALWAT',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_KHALWAT_NAME',		'LOC_BELIEF_JNR_KHALWAT_DESCRIPTION'),
		('BELIEF_JNR_MANDIR',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_MANDIR_NAME',		'LOC_BELIEF_JNR_MANDIR_DESCRIPTION'),
		('BELIEF_JNR_MBARI',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_MBARI_NAME',		'LOC_BELIEF_JNR_MBARI_DESCRIPTION'),
		('BELIEF_JNR_PERIPTEROS',	'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_PERIPTEROS_NAME',	'LOC_BELIEF_JNR_PERIPTEROS_DESCRIPTION'),
		('BELIEF_JNR_SOBOR',		'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_SOBOR_NAME',		'LOC_BELIEF_JNR_SOBOR_DESCRIPTION'),
		('BELIEF_JNR_TZACUALLI',	'BELIEF_CLASS_WORSHIP',	'LOC_BELIEF_JNR_TZACUALLI_NAME',	'LOC_BELIEF_JNR_TZACUALLI_DESCRIPTION');

UPDATE Beliefs SET Description='LOC_BELIEF_CATHEDRAL_DESCRIPTION_UC_JNR'		WHERE BeliefType='BELIEF_CATHEDRAL';
UPDATE Beliefs SET Description='LOC_BELIEF_DAR_E_MEHR_DESCRIPTION_UC_JNR'		WHERE BeliefType='BELIEF_DAR_E_MEHR';
UPDATE Beliefs SET Description='LOC_BELIEF_GURDWARA_DESCRIPTION_UC_JNR'			WHERE BeliefType='BELIEF_GURDWARA';
UPDATE Beliefs SET Description='LOC_BELIEF_MEETING_HOUSE_DESCRIPTION_UC_JNR'	WHERE BeliefType='BELIEF_MEETING_HOUSE';
UPDATE Beliefs SET Description='LOC_BELIEF_MOSQUE_DESCRIPTION_UC_JNR'			WHERE BeliefType='BELIEF_MOSQUE';
UPDATE Beliefs SET Description='LOC_BELIEF_PAGODA_DESCRIPTION_UC_JNR'			WHERE BeliefType='BELIEF_PAGODA';
UPDATE Beliefs SET Description='LOC_BELIEF_STUPA_DESCRIPTION_UC_JNR'			WHERE BeliefType='BELIEF_STUPA';
UPDATE Beliefs SET Description='LOC_BELIEF_SYNAGOGUE_DESCRIPTION_UC_JNR'		WHERE BeliefType='BELIEF_SYNAGOGUE';
UPDATE Beliefs SET Description='LOC_BELIEF_WAT_DESCRIPTION_UC_JNR'				WHERE BeliefType='BELIEF_WAT';

UPDATE Beliefs SET Description='LOC_BELIEF_JNR_SOBOR_DESCRIPTION_DIPLOMATIC'	WHERE BeliefType='BELIEF_JNR_SOBOR' AND EXISTS (SELECT * FROM Buildings WHERE BuildingType='BUILDING_CHANCERY');

DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_BASILICA';
DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_BETH_MANDA';
DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_KHALWAT';
DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_BUTTO';
DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_DERASAR';
DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_CANDI';
DELETE FROM Beliefs WHERE BeliefType='BELIEF_P0K_SERAPEUM';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,				ModifierType)
VALUES	('ALLOW_JNR_CANDI',			'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_DAOGUAN',		'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_JINJA',			'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_KHALWAT',		'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_MANDIR',		'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_MBARI',			'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_PERIPTEROS',	'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_SOBOR',			'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING'),
		('ALLOW_JNR_TZACUALLI',		'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BUILDING');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,				Name,			Value)
VALUES	('ALLOW_JNR_CANDI',			'BuildingType',	'BUILDING_JNR_CANDI'),
		('ALLOW_JNR_DAOGUAN',		'BuildingType',	'BUILDING_JNR_DAOGUAN'),
		('ALLOW_JNR_JINJA',			'BuildingType',	'BUILDING_JNR_JINJA'),
		('ALLOW_JNR_KHALWAT',		'BuildingType',	'BUILDING_JNR_KHALWAT'),
		('ALLOW_JNR_MANDIR',		'BuildingType',	'BUILDING_JNR_MANDIR'),
		('ALLOW_JNR_MBARI',			'BuildingType',	'BUILDING_JNR_MBARI'),
		('ALLOW_JNR_PERIPTEROS',	'BuildingType',	'BUILDING_JNR_PERIPTEROS'),
		('ALLOW_JNR_SOBOR',			'BuildingType',	'BUILDING_JNR_SOBOR'),
		('ALLOW_JNR_TZACUALLI',		'BuildingType',	'BUILDING_JNR_TZACUALLI');
--------------------------------------------------------------

-- BeliefModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BeliefModifiers
		(BeliefType,				ModifierId)
VALUES	('BELIEF_JNR_CANDI',		'ALLOW_JNR_CANDI'),
		('BELIEF_JNR_DAOGUAN',		'ALLOW_JNR_DAOGUAN'),
		('BELIEF_JNR_JINJA',		'ALLOW_JNR_JINJA'),
		('BELIEF_JNR_KHALWAT',		'ALLOW_JNR_KHALWAT'),
		('BELIEF_JNR_MANDIR',		'ALLOW_JNR_MANDIR'),
		('BELIEF_JNR_MBARI',		'ALLOW_JNR_MBARI'),
		('BELIEF_JNR_PERIPTEROS',	'ALLOW_JNR_PERIPTEROS'),
		('BELIEF_JNR_SOBOR',		'ALLOW_JNR_SOBOR'),
		('BELIEF_JNR_TZACUALLI',	'ALLOW_JNR_TZACUALLI');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
UPDATE Buildings SET Description=NULL												WHERE BuildingType='BUILDING_SYNAGOGUE';

UPDATE Buildings SET Description='LOC_BUILDING_JNR_CANDI_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_CANDI';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_DAOGUAN_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_DAOGUAN';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_JINJA_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_JINJA';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_KHALWAT_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_KHALWAT';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_MANDIR_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_MANDIR';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_MBARI_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_MBARI';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_PERIPTEROS_DESCRIPTION'			WHERE BuildingType='BUILDING_JNR_PERIPTEROS';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_SOBOR_DESCRIPTION'				WHERE BuildingType='BUILDING_JNR_SOBOR';
UPDATE Buildings SET Description='LOC_BUILDING_JNR_SOBOR_DESCRIPTION_DIPLOMATIC'	WHERE BuildingType='BUILDING_JNR_SOBOR' AND EXISTS (SELECT * FROM Buildings WHERE BuildingType='BUILDING_CHANCERY');
UPDATE Buildings SET Description='LOC_BUILDING_JNR_TZACUALLI_DESCRIPTION'			WHERE BuildingType='BUILDING_JNR_TZACUALLI';
--------------------------------------------------------------