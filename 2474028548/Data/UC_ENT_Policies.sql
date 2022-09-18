-- UC_ENT_Policies
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,						Kind)
VALUES	('POLICY_JNR_STATE_FAIRS',	'KIND_POLICY');
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_SPORTS_MEDIA_DESCRIPTION_JNR_UC' WHERE PolicyType='POLICY_SPORTS_MEDIA';

INSERT OR IGNORE INTO Policies
		(PolicyType,				Name,								Description,								PrereqCivic,				GovernmentSlotType)
SELECT	'POLICY_JNR_STATE_FAIRS',	'LOC_POLICY_JNR_STATE_FAIRS_NAME',	'LOC_POLICY_JNR_STATE_FAIRS_DESCRIPTION',	'CIVIC_CULTURAL_HERITAGE',	'SLOT_ECONOMIC'
FROM	Policies
WHERE	PolicyType='POLICY_SPORTS_MEDIA';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='CITY_HAS_TIER_3_SPORTS_VENUE_JNR'	WHERE ModifierId='SPORTSMEDIA_STADIUMENTERTAINMENT';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,								ModifierType,										SubjectRequirementSetId)
VALUES	('STATEFAIRS_DISTRICTTOURISM_JNR',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_ENTERTAINMENT_COMPLEX_JNR'),
		('STATEFAIRS_DISTRICTTOURISM_WATER_JNR',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_WATER_PARK_JNR'),
		('STATEFAIRS_THEMEPARK_ENTERTAINMENT_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',		'CITY_HAS_TIER_3_FAIR_VENUE_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('STATEFAIRS_DISTRICTTOURISM_JNR',			'YieldType',	'YIELD_GOLD'),
		('STATEFAIRS_DISTRICTTOURISM_JNR',			'Amount',		100),
		('STATEFAIRS_DISTRICTTOURISM_WATER_JNR',	'YieldType',	'YIELD_GOLD'),
		('STATEFAIRS_DISTRICTTOURISM_WATER_JNR',	'Amount',		100),
		('STATEFAIRS_THEMEPARK_ENTERTAINMENT_JNR',	'Amount',		1);
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'STATEFAIRS_DISTRICTTOURISM_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_STATE_FAIRS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'STATEFAIRS_DISTRICTTOURISM_WATER_JNR'		FROM Policies WHERE PolicyType='POLICY_JNR_STATE_FAIRS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'STATEFAIRS_THEMEPARK_ENTERTAINMENT_JNR'	FROM Policies WHERE PolicyType='POLICY_JNR_STATE_FAIRS';
--------------------------------------------------------------