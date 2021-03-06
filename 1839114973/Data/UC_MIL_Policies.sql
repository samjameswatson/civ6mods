-- UC_MIL_Policies
-- Author: JNR
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_LIMES_DESCRIPTION_JNR_UC'					WHERE PolicyType='POLICY_LIMES';
UPDATE Policies SET Description='LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC'		WHERE PolicyType='POLICY_THIRD_ALTERNATIVE';
UPDATE Policies SET Description='LOC_POLICY_MILITARY_RESEARCH_DESCRIPTION_JNR_UC'		WHERE PolicyType='POLICY_MILITARY_RESEARCH';
UPDATE Policies SET Description='LOC_POLICY_INTEGRATED_SPACE_CELL_DESCRIPTION_JNR_UC'	WHERE PolicyType='POLICY_INTEGRATED_SPACE_CELL';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='INTEGRATEDSPACECELL_BUILDING_REQUIREMENTS_JNR'	WHERE ModifierId='INTEGRATEDSPACECELL_SPACE_RACE_PROJECTS_PRODUCTION';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
VALUES	('LIMES_DISTRICTPRODUCTION_JNR',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_ENCAMPMENT'),
		('THIRDALTERNATIVE_DISTRICTPRODUCTION_JNR',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_ENCAMPMENT'),
		('THIRDALTERNATIVE_ARSENAL_CULTURE_MODIFIER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('THIRDALTERNATIVE_PRISON_CULTURE_MODIFIER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('THIRDALTERNATIVE_ARSENAL_GOLD_MODIFIER_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('THIRDALTERNATIVE_PRISON_GOLD_MODIFIER_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MILITARYRESEARCH_ARSENAL_SCIENCE_MODIFIER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MILITARYRESEARCH_PRISON_SCIENCE_MODIFIER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MILITARYRESEARCH_NAVAL_BASE_SCIENCE_MODIFIER_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('MILITARYRESEARCH_HANGAR_SCIENCE_MODIFIER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
VALUES	('LIMES_DISTRICTPRODUCTION_JNR',						'YieldType',	'YIELD_PRODUCTION'),
		('LIMES_DISTRICTPRODUCTION_JNR',						'Amount',		100),
		('THIRDALTERNATIVE_DISTRICTPRODUCTION_JNR',				'YieldType',	'YIELD_PRODUCTION'),
		('THIRDALTERNATIVE_DISTRICTPRODUCTION_JNR',				'Amount',		100),
		('THIRDALTERNATIVE_ARSENAL_CULTURE_MODIFIER_JNR',		'BuildingType',	'BUILDING_JNR_ARSENAL'),
		('THIRDALTERNATIVE_ARSENAL_CULTURE_MODIFIER_JNR',		'YieldType',	'YIELD_CULTURE'),
		('THIRDALTERNATIVE_ARSENAL_CULTURE_MODIFIER_JNR',		'Amount',		2),
		('THIRDALTERNATIVE_PRISON_CULTURE_MODIFIER_JNR',		'BuildingType',	'BUILDING_JNR_PRISON'),
		('THIRDALTERNATIVE_PRISON_CULTURE_MODIFIER_JNR',		'YieldType',	'YIELD_CULTURE'),
		('THIRDALTERNATIVE_PRISON_CULTURE_MODIFIER_JNR',		'Amount',		2),
		('THIRDALTERNATIVE_ARSENAL_GOLD_MODIFIER_JNR',			'BuildingType',	'BUILDING_JNR_ARSENAL'),
		('THIRDALTERNATIVE_ARSENAL_GOLD_MODIFIER_JNR',			'YieldType',	'YIELD_GOLD'),
		('THIRDALTERNATIVE_ARSENAL_GOLD_MODIFIER_JNR',			'Amount',		4),
		('THIRDALTERNATIVE_PRISON_GOLD_MODIFIER_JNR',			'BuildingType',	'BUILDING_JNR_PRISON'),
		('THIRDALTERNATIVE_PRISON_GOLD_MODIFIER_JNR',			'YieldType',	'YIELD_GOLD'),
		('THIRDALTERNATIVE_PRISON_GOLD_MODIFIER_JNR',			'Amount',		4),
		('MILITARYRESEARCH_ARSENAL_SCIENCE_MODIFIER_JNR',		'BuildingType',	'BUILDING_JNR_ARSENAL'),
		('MILITARYRESEARCH_ARSENAL_SCIENCE_MODIFIER_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('MILITARYRESEARCH_ARSENAL_SCIENCE_MODIFIER_JNR',		'Amount',		2),
		('MILITARYRESEARCH_PRISON_SCIENCE_MODIFIER_JNR',		'BuildingType',	'BUILDING_JNR_PRISON'),
		('MILITARYRESEARCH_PRISON_SCIENCE_MODIFIER_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('MILITARYRESEARCH_PRISON_SCIENCE_MODIFIER_JNR',		'Amount',		2),
		('MILITARYRESEARCH_NAVAL_BASE_SCIENCE_MODIFIER_JNR',	'BuildingType',	'BUILDING_JNR_NAVAL_BASE'),
		('MILITARYRESEARCH_NAVAL_BASE_SCIENCE_MODIFIER_JNR',	'YieldType',	'YIELD_SCIENCE'),
		('MILITARYRESEARCH_NAVAL_BASE_SCIENCE_MODIFIER_JNR',	'Amount',		2),
		('MILITARYRESEARCH_HANGAR_SCIENCE_MODIFIER_JNR',		'BuildingType',	'BUILDING_HANGAR'),
		('MILITARYRESEARCH_HANGAR_SCIENCE_MODIFIER_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('MILITARYRESEARCH_HANGAR_SCIENCE_MODIFIER_JNR',		'Amount',		2);
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'LIMES_DISTRICTPRODUCTION_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_LIMES';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_DISTRICTPRODUCTION_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_THIRD_ALTERNATIVE';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_ARSENAL_CULTURE_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_THIRD_ALTERNATIVE';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_PRISON_CULTURE_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_THIRD_ALTERNATIVE';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_ARSENAL_GOLD_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_THIRD_ALTERNATIVE';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_PRISON_GOLD_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_THIRD_ALTERNATIVE';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'MILITARYRESEARCH_ARSENAL_SCIENCE_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_MILITARY_RESEARCH';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'MILITARYRESEARCH_PRISON_SCIENCE_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_MILITARY_RESEARCH';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'MILITARYRESEARCH_NAVAL_BASE_SCIENCE_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_MILITARY_RESEARCH';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'MILITARYRESEARCH_HANGAR_SCIENCE_MODIFIER_JNR'
FROM	Policies
WHERE	PolicyType='POLICY_MILITARY_RESEARCH';

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND ModifierId='THIRDALTERNATIVE_COAL_POWER_PLANT_GOLD_MODIFIER';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND ModifierId='THIRDALTERNATIVE_FOSSIL_FUEL_POWER_PLANT_GOLD_MODIFIER';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND ModifierId='THIRDALTERNATIVE_POWER_PLANT_GOLD_MODIFIER';

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND ModifierId='THIRDALTERNATIVE_COAL_POWER_PLANT_CULTURE_MODIFIER';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND ModifierId='THIRDALTERNATIVE_FOSSIL_FUEL_POWER_PLANT_CULTURE_MODIFIER';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND ModifierId='THIRDALTERNATIVE_POWER_PLANT_CULTURE_MODIFIER';

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_MILITARY_RESEARCH' AND ModifierId='MILITARYRESEARCH_SEAPORT_SCIENCE_MODIFIER';
--------------------------------------------------------------