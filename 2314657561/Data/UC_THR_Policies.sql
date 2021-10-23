-- UC_THR_Policies
-- Author: JNR
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_GRAND_OPERA_DESCRIPTION_JNR_UC', Name='LOC_POLICY_GRAND_OPERA_NAME_JNR_UC'	WHERE PolicyType='POLICY_GRAND_OPERA';
UPDATE Policies SET Description='LOC_POLICY_DISINFORMATION_CAMPAIGN_DESCRIPTION_JNR_UC'									WHERE PolicyType='POLICY_DISINFORMATION_CAMPAIGN';
UPDATE Policies SET Description='LOC_POLICY_FRESCOES_DESCRIPTION_JNR_UC'												WHERE PolicyType='POLICY_FRESCOES';
UPDATE Policies SET Description='LOC_POLICY_SYMPHONIES_DESCRIPTION_JNR_UC'												WHERE PolicyType='POLICY_SYMPHONIES';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType,											SubjectRequirementSetId)
VALUES	('GRAND_OPERA_HIGH_ADJACENCY_AMPHITHEATER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_ASSEMBLY_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_CABINET_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_MANSION_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_OPERA_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_GRAND_HOTEL_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_BROADCAST_CENTER_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),
		('GRAND_OPERA_HIGH_ADJACENCY_MEDIA_CENTER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'THEATER_SQUARE_HAS_HIGH_ADJACENCY'),

		('GRAND_OPERA_HIGH_POP_AMPHITHEATER_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_ASSEMBLY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_CABINET_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_MANSION_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_OPERA_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_GRAND_HOTEL_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_BROADCAST_CENTER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('GRAND_OPERA_HIGH_POP_MEDIA_CENTER_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),

		('DISINFORMATION_CAMPAIGN_MEDIA_FAVOR_JNR',			'MODIFIER_PLAYER_ADJUST_BUILDING_FAVOR',				NULL);

UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_THEATER_TIER2_JNR' WHERE ModifierId='FRESCOES_ARTIST_ARTMUSEUM';
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_THEATER_TIER4_JNR' WHERE ModifierId='SYMPHONIES_MUSICIAN_BROADCASTCENTER';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,			Value)
VALUES	('GRAND_OPERA_HIGH_ADJACENCY_AMPHITHEATER_JNR',		'BuildingType',	'BUILDING_AMPHITHEATER'),
		('GRAND_OPERA_HIGH_ADJACENCY_ASSEMBLY_JNR',			'BuildingType',	'BUILDING_JNR_ASSEMBLY'),
		('GRAND_OPERA_HIGH_ADJACENCY_CABINET_JNR',			'BuildingType',	'BUILDING_JNR_CABINET'),
		('GRAND_OPERA_HIGH_ADJACENCY_MANSION_JNR',			'BuildingType',	'BUILDING_JNR_MANSION'),
		('GRAND_OPERA_HIGH_ADJACENCY_OPERA_JNR',			'BuildingType',	'BUILDING_JNR_OPERA'),
		('GRAND_OPERA_HIGH_ADJACENCY_GRAND_HOTEL_JNR',		'BuildingType',	'BUILDING_JNR_GRAND_HOTEL'),
		('GRAND_OPERA_HIGH_ADJACENCY_BROADCAST_CENTER_JNR',	'BuildingType',	'BUILDING_BROADCAST_CENTER'),
		('GRAND_OPERA_HIGH_ADJACENCY_MEDIA_CENTER_JNR',		'BuildingType',	'BUILDING_JNR_MEDIA_CENTER'),
		('GRAND_OPERA_HIGH_ADJACENCY_AMPHITHEATER_JNR',		'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_ASSEMBLY_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_CABINET_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_MANSION_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_OPERA_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_GRAND_HOTEL_JNR',		'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_BROADCAST_CENTER_JNR',	'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_MEDIA_CENTER_JNR',		'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_ADJACENCY_AMPHITHEATER_JNR',		'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_ASSEMBLY_JNR',			'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_CABINET_JNR',			'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_MANSION_JNR',			'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_OPERA_JNR',			'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_GRAND_HOTEL_JNR',		'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_BROADCAST_CENTER_JNR',	'Amount',		1),
		('GRAND_OPERA_HIGH_ADJACENCY_MEDIA_CENTER_JNR',		'Amount',		1),

		('GRAND_OPERA_HIGH_POP_AMPHITHEATER_JNR',			'BuildingType',	'BUILDING_AMPHITHEATER'),
		('GRAND_OPERA_HIGH_POP_ASSEMBLY_JNR',				'BuildingType',	'BUILDING_JNR_ASSEMBLY'),
		('GRAND_OPERA_HIGH_POP_CABINET_JNR',				'BuildingType',	'BUILDING_JNR_CABINET'),
		('GRAND_OPERA_HIGH_POP_MANSION_JNR',				'BuildingType',	'BUILDING_JNR_MANSION'),
		('GRAND_OPERA_HIGH_POP_OPERA_JNR',					'BuildingType',	'BUILDING_JNR_OPERA'),
		('GRAND_OPERA_HIGH_POP_GRAND_HOTEL_JNR',			'BuildingType',	'BUILDING_JNR_GRAND_HOTEL'),
		('GRAND_OPERA_HIGH_POP_BROADCAST_CENTER_JNR',		'BuildingType',	'BUILDING_BROADCAST_CENTER'),
		('GRAND_OPERA_HIGH_POP_MEDIA_CENTER_JNR',			'BuildingType',	'BUILDING_JNR_MEDIA_CENTER'),
		('GRAND_OPERA_HIGH_POP_AMPHITHEATER_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_ASSEMBLY_JNR',				'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_CABINET_JNR',				'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_MANSION_JNR',				'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_OPERA_JNR',					'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_GRAND_HOTEL_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_BROADCAST_CENTER_JNR',		'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_MEDIA_CENTER_JNR',			'YieldType',	'YIELD_CULTURE'),
		('GRAND_OPERA_HIGH_POP_AMPHITHEATER_JNR',			'Amount',		1),
		('GRAND_OPERA_HIGH_POP_ASSEMBLY_JNR',				'Amount',		1),
		('GRAND_OPERA_HIGH_POP_CABINET_JNR',				'Amount',		1),
		('GRAND_OPERA_HIGH_POP_MANSION_JNR',				'Amount',		1),
		('GRAND_OPERA_HIGH_POP_OPERA_JNR',					'Amount',		1),
		('GRAND_OPERA_HIGH_POP_GRAND_HOTEL_JNR',			'Amount',		1),
		('GRAND_OPERA_HIGH_POP_BROADCAST_CENTER_JNR',		'Amount',		1),
		('GRAND_OPERA_HIGH_POP_MEDIA_CENTER_JNR',			'Amount',		1),

		('DISINFORMATION_CAMPAIGN_MEDIA_FAVOR_JNR',			'BuildingType',	'BUILDING_BROADCAST_CENTER'),
		('DISINFORMATION_CAMPAIGN_MEDIA_FAVOR_JNR',			'Favor',		3);
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_GRAND_OPERA' AND ModifierId='GRANDOPERA_BUILDING_YIELDS_HIGH_ADJACENCY';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_GRAND_OPERA' AND ModifierId='GRANDOPERA_BUILDING_YIELDS_HIGH_POP';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_AMPHITHEATER_JNR'		FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_ASSEMBLY_JNR'			FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_CABINET_JNR'			FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_MANSION_JNR'			FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_OPERA_JNR'				FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_GRAND_HOTEL_JNR'		FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_BROADCAST_CENTER_JNR'	FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_ADJACENCY_MEDIA_CENTER_JNR'		FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_AMPHITHEATER_JNR'				FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_ASSEMBLY_JNR'					FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_CABINET_JNR'					FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_MANSION_JNR'					FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_OPERA_JNR'					FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_GRAND_HOTEL_JNR'				FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_BROADCAST_CENTER_JNR'			FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GRAND_OPERA_HIGH_POP_MEDIA_CENTER_JNR'				FROM Policies WHERE PolicyType='POLICY_GRAND_OPERA';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'DISINFORMATION_CAMPAIGN_MEDIA_FAVOR_JNR'			FROM Policies WHERE PolicyType='POLICY_DISINFORMATION_CAMPAIGN';
--------------------------------------------------------------