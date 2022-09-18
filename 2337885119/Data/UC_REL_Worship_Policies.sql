-- UC_REL_Worship_Policies
-- Author: JNR
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_SIMULTANEUM_DESCRIPTION_JNR_UC'	WHERE PolicyType='POLICY_SIMULTANEUM';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,											SubjectRequirementSetId)
VALUES	('SIMULTANEUM_HIGH_ADJACENCY_SHRINE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HOLY_SITE_HAS_HIGH_ADJACENCY'),
		('SIMULTANEUM_HIGH_ADJACENCY_TEMPLE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HOLY_SITE_HAS_HIGH_ADJACENCY'),

		('SIMULTANEUM_HIGH_POP_SHRINE_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('SIMULTANEUM_HIGH_POP_TEMPLE_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION');

INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType,											SubjectRequirementSetId)
SELECT	'SIMULTANEUM_HIGH_ADJACENCY_' || SUBSTR(BuildingType,10) || '_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HOLY_SITE_HAS_HIGH_ADJACENCY'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType,											SubjectRequirementSetId)
SELECT	'SIMULTANEUM_HIGH_POP_' || SUBSTR(BuildingType,10) || '_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,					Value)
VALUES	('SIMULTANEUM_HIGH_ADJACENCY_SHRINE_JNR',		'BuildingType',			'BUILDING_SHRINE'),
		('SIMULTANEUM_HIGH_ADJACENCY_SHRINE_JNR',		'YieldType',			'YIELD_FAITH'),
		('SIMULTANEUM_HIGH_ADJACENCY_SHRINE_JNR',		'Amount',				1),
		('SIMULTANEUM_HIGH_ADJACENCY_TEMPLE_JNR',		'BuildingType',			'BUILDING_TEMPLE'),
		('SIMULTANEUM_HIGH_ADJACENCY_TEMPLE_JNR',		'YieldType',			'YIELD_FAITH'),
		('SIMULTANEUM_HIGH_ADJACENCY_TEMPLE_JNR',		'Amount',				1),


		('SIMULTANEUM_HIGH_POP_SHRINE_JNR',				'BuildingType',			'BUILDING_SHRINE'),
		('SIMULTANEUM_HIGH_POP_SHRINE_JNR',				'YieldType',			'YIELD_FAITH'),
		('SIMULTANEUM_HIGH_POP_SHRINE_JNR',				'Amount',				1),
		('SIMULTANEUM_HIGH_POP_TEMPLE_JNR',				'BuildingType',			'BUILDING_TEMPLE'),
		('SIMULTANEUM_HIGH_POP_TEMPLE_JNR',				'YieldType',			'YIELD_FAITH'),
		('SIMULTANEUM_HIGH_POP_TEMPLE_JNR',				'Amount',				1);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'SIMULTANEUM_HIGH_ADJACENCY_' || SUBSTR(BuildingType,10) || '_JNR',	'BuildingType',	BuildingType
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'SIMULTANEUM_HIGH_ADJACENCY_' || SUBSTR(BuildingType,10) || '_JNR',	'YieldType',	'YIELD_FAITH'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'SIMULTANEUM_HIGH_ADJACENCY_' || SUBSTR(BuildingType,10) || '_JNR',	'Amount',		1
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'SIMULTANEUM_HIGH_POP_' || SUBSTR(BuildingType,10) || '_JNR',		'BuildingType',	BuildingType
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'SIMULTANEUM_HIGH_POP_' || SUBSTR(BuildingType,10) || '_JNR',		'YieldType',	'YIELD_FAITH'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'SIMULTANEUM_HIGH_POP_' || SUBSTR(BuildingType,10) || '_JNR',		'Amount',		1
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'SIMULTANEUM_HIGH_ADJACENCY_SHRINE_JNR'		FROM Policies WHERE PolicyType='POLICY_SIMULTANEUM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'SIMULTANEUM_HIGH_ADJACENCY_TEMPLE_JNR'		FROM Policies WHERE PolicyType='POLICY_SIMULTANEUM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	a.PolicyType,	'SIMULTANEUM_HIGH_ADJACENCY_' || SUBSTR(b.BuildingType,10) || '_JNR'
FROM	Policies a, Buildings b
WHERE	a.PolicyType='POLICY_SIMULTANEUM'
		AND b.EnabledByReligion=1;

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'SIMULTANEUM_HIGH_POP_SHRINE_JNR'			FROM Policies WHERE PolicyType='POLICY_SIMULTANEUM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'SIMULTANEUM_HIGH_POP_TEMPLE_JNR'			FROM Policies WHERE PolicyType='POLICY_SIMULTANEUM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	a.PolicyType,	'SIMULTANEUM_HIGH_POP_' || SUBSTR(b.BuildingType,10) || '_JNR'
FROM	Policies a, Buildings b
WHERE	a.PolicyType='POLICY_SIMULTANEUM'
		AND b.EnabledByReligion=1;
--------------------------------------------------------------