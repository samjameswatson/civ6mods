-- UC_THR_RwF
-- Author: JNR
--------------------------------------------------------------JFD_NATIONAL_OPERA

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_JFD_NATIONAL_OPERA_DESCRIPTION_UC_JNR'	WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_AMPHITHEATER_CULTURE_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_ASSEMBLY_CULTURE_UC_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_CABINET_CULTURE_UC_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_MANSION_CULTURE_UC_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_OPERA_HOUSE_CULTURE_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_GRAND_HOTEL_CULTURE_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_BROADCAST_TOWER_CULTURE_UC_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
SELECT	'JFD_NATIONAL_OPERA_MEDIA_CENTER_CULTURE_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_AMPHITHEATER_CULTURE_UC_JNR',		'BuildingType',	'BUILDING_AMPHITHEATER'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_ASSEMBLY_CULTURE_UC_JNR',			'BuildingType',	'BUILDING_JNR_ASSEMBLY'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_CABINET_CULTURE_UC_JNR',			'BuildingType',	'BUILDING_JNR_CABINET'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_MANSION_CULTURE_UC_JNR',			'BuildingType',	'BUILDING_JNR_MANSION'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_OPERA_HOUSE_CULTURE_UC_JNR',		'BuildingType',	'BUILDING_JNR_OPERA'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_GRAND_HOTEL_CULTURE_UC_JNR',		'BuildingType',	'BUILDING_JNR_GRAND_HOTEL'	FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_BROADCAST_TOWER_CULTURE_UC_JNR',	'BuildingType',	'BUILDING_BROADCAST_CENTER'	FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_MEDIA_CENTER_CULTURE_UC_JNR',		'BuildingType',	'BUILDING_JNR_MEDIA_CENTER'	FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_AMPHITHEATER_CULTURE_UC_JNR',		'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_ASSEMBLY_CULTURE_UC_JNR',			'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_CABINET_CULTURE_UC_JNR',			'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_MANSION_CULTURE_UC_JNR',			'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_OPERA_HOUSE_CULTURE_UC_JNR',		'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_GRAND_HOTEL_CULTURE_UC_JNR',		'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_BROADCAST_TOWER_CULTURE_UC_JNR',	'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_MEDIA_CENTER_CULTURE_UC_JNR',		'YieldType',	'YIELD_CULTURE'				FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_AMPHITHEATER_CULTURE_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_ASSEMBLY_CULTURE_UC_JNR',			'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_CABINET_CULTURE_UC_JNR',			'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_MANSION_CULTURE_UC_JNR',			'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_OPERA_HOUSE_CULTURE_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_GRAND_HOTEL_CULTURE_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_BROADCAST_TOWER_CULTURE_UC_JNR',	'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'JFD_NATIONAL_OPERA_MEDIA_CENTER_CULTURE_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_AMPHITHEATER_CULTURE_UC_JNR'	FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_ASSEMBLY_CULTURE_UC_JNR'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_CABINET_CULTURE_UC_JNR'			FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_MANSION_CULTURE_UC_JNR'			FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_OPERA_HOUSE_CULTURE_UC_JNR'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_GRAND_HOTEL_CULTURE_UC_JNR'		FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_BROADCAST_TOWER_CULTURE_UC_JNR'	FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_NATIONAL_OPERA_MEDIA_CENTER_CULTURE_UC_JNR'	FROM Policies WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA';

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA' AND ModifierId='JFD_NATIONAL_OPERA_AMPHITHEATER_CULTURE';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA' AND ModifierId='JFD_NATIONAL_OPERA_MUSEUM_ART_CULTURE';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA' AND ModifierId='JFD_NATIONAL_OPERA_MUSEUM_ARTIFACT_CULTURE';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_JFD_NATIONAL_OPERA' AND ModifierId='JFD_NATIONAL_OPERA_BROADCAST_CULTURE';
--------------------------------------------------------------