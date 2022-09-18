-- UC_REL_RwF
-- Author: JNR
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Great Theologians
----------------------------------------------------------------------------------------------------------------------------

-- GreatPersonIndividuals
--------------------------------------------------------------
UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREAT_PERSON_JFD_GREGORY_PALAMAS_HELP_UC_JNR'	WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JFD_GREGORY_PALAMAS';
UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREAT_PERSON_JFD_YOSEF_CARO_HELP_UC_JNR'		WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JFD_YOSEF_CARO';
UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREAT_PERSON_JFD_MATA_AMMA_HELP_UC_JNR'			WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JFD_MATA_AMMA';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,	RunOnce,	Permanent)
SELECT	'GREATPERSON_JFD_YOSEF_CARO_ALTAR_WRITING_UC_JNR',		ModifierType,	RunOnce,	Permanent
FROM	Modifiers WHERE ModifierId='GREATPERSON_JFD_YOSEF_CARO_TEMPLE_WRITING';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,	RunOnce,	Permanent)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_FOOD_UC_JNR',		ModifierType,	RunOnce,	Permanent
FROM	Modifiers WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_FOOD';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,	RunOnce,	Permanent)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_HOUSING_UC_JNR',	ModifierType,	RunOnce,	Permanent
FROM	Modifiers WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_HOUSING';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
UPDATE	ModifierArguments
SET		Value='BUILDING_SHRINE'
WHERE	ModifierId='GREATPERSON_JFD_YOSEF_CARO_TEMPLE_WRITING'
		AND Name='BuildingType';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_YOSEF_CARO_ALTAR_WRITING_UC_JNR',		Name,	'BUILDING_JNR_ALTAR'
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_YOSEF_CARO_TEMPLE_WRITING'	AND Name='BuildingType';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_YOSEF_CARO_ALTAR_WRITING_UC_JNR',		Name,	Value
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_YOSEF_CARO_TEMPLE_WRITING'	AND Name='GreatWorkSlotType';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_YOSEF_CARO_ALTAR_WRITING_UC_JNR',		Name,	Value
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_YOSEF_CARO_TEMPLE_WRITING'	AND Name='Amount';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_FOOD_UC_JNR',		Name,	'BUILDING_JNR_MONASTERY'
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_FOOD'		AND Name='BuildingType';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_FOOD_UC_JNR',		Name,	Value
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_FOOD'		AND Name='YieldType';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_FOOD_UC_JNR',		Name,	Value
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_FOOD'		AND Name='Amount';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_HOUSING_UC_JNR',	Name,	'BUILDING_JNR_MONASTERY'
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_HOUSING'	AND Name='BuildingType';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,	Value)
SELECT	'GREATPERSON_JFD_MATA_AMMA_MONASTERY_HOUSING_UC_JNR',	Name,	Value
FROM	ModifierArguments WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_TEMPLE_HOUSING'	AND Name='Amount';
--------------------------------------------------------------

-- GreatPersonIndividualActionModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers
		(GreatPersonIndividualType,					ModifierId,	AttachmentTargetType)
SELECT	'GREAT_PERSON_INDIVIDUAL_JFD_YOSEF_CARO',	ModifierId,	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'
FROM	Modifiers WHERE ModifierId='GREATPERSON_JFD_YOSEF_CARO_ALTAR_WRITING_UC_JNR';

INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers
		(GreatPersonIndividualType,					ModifierId,	AttachmentTargetType)
SELECT	'GREAT_PERSON_INDIVIDUAL_JFD_MATA_AMMA',	ModifierId,	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'
FROM	Modifiers WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_MONASTERY_FOOD_UC_JNR';

INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers
		(GreatPersonIndividualType,					ModifierId,	AttachmentTargetType)
SELECT	'GREAT_PERSON_INDIVIDUAL_JFD_MATA_AMMA',	ModifierId,	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'
FROM	Modifiers WHERE ModifierId='GREATPERSON_JFD_MATA_AMMA_MONASTERY_HOUSING_UC_JNR';
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Policies
----------------------------------------------------------------------------------------------------------------------------

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_JFD_CLERIC_OFFICIALS_DESCRIPTION_UC_JNR' WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_SHRINE_FAITH_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_ALTAR_FAITH_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_TEMPLE_FAITH_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_MONASTERY_FAITH_UC_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_HOSPITIUM_FAITH_UC_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_GARDEN_FAITH_UC_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,																ModifierType)
SELECT	'JFD_CLERIC_OFFICIALS_' || SUBSTR(b.BuildingType,10) || '_FAITH_UC_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM	Policies a, Buildings b
WHERE	a.PolicyType='_POLICY_JFD_CLERIC_OFFICIALS'
		AND b.EnabledByReligion=1;
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_SHRINE_FAITH_UC_JNR',		'BuildingType',	'BUILDING_SHRINE'			FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_ALTAR_FAITH_UC_JNR',		'BuildingType',	'BUILDING_JNR_ALTAR'		FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_TEMPLE_FAITH_UC_JNR',		'BuildingType',	'BUILDING_TEMPLE'			FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_MONASTERY_FAITH_UC_JNR',	'BuildingType',	'BUILDING_JNR_MONASTERY'	FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_HOSPITIUM_FAITH_UC_JNR',	'BuildingType',	'BUILDING_JNR_HOSPITIUM'	FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_GARDEN_FAITH_UC_JNR',		'BuildingType',	'BUILDING_JNR_GARDEN'		FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,																Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_' || SUBSTR(b.BuildingType,10) || '_FAITH_UC_JNR',	'BuildingType',	b.BuildingType
FROM	Policies a, Buildings b
WHERE	a.PolicyType='_POLICY_JFD_CLERIC_OFFICIALS'
		AND b.EnabledByReligion=1;


INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_SHRINE_FAITH_UC_JNR',		'YieldType',	'YIELD_FAITH'				FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_ALTAR_FAITH_UC_JNR',		'YieldType',	'YIELD_FAITH'				FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_TEMPLE_FAITH_UC_JNR',		'YieldType',	'YIELD_FAITH'				FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_MONASTERY_FAITH_UC_JNR',	'YieldType',	'YIELD_FAITH'				FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_HOSPITIUM_FAITH_UC_JNR',	'YieldType',	'YIELD_FAITH'				FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_GARDEN_FAITH_UC_JNR',		'YieldType',	'YIELD_FAITH'				FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,																Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_' || SUBSTR(b.BuildingType,10) || '_FAITH_UC_JNR',	'YieldType',	'YIELD_FAITH'
FROM	Policies a, Buildings b
WHERE	a.PolicyType='_POLICY_JFD_CLERIC_OFFICIALS'
		AND b.EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_SHRINE_FAITH_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_ALTAR_FAITH_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_TEMPLE_FAITH_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_MONASTERY_FAITH_UC_JNR',	'Amount',		1							FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_HOSPITIUM_FAITH_UC_JNR',	'Amount',		1							FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_GARDEN_FAITH_UC_JNR',		'Amount',		1							FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,																Name,			Value)
SELECT	'JFD_CLERIC_OFFICIALS_' || SUBSTR(b.BuildingType,10) || '_FAITH_UC_JNR',	'Amount',		1
FROM	Policies a, Buildings b
WHERE	a.PolicyType='_POLICY_JFD_CLERIC_OFFICIALS'
		AND b.EnabledByReligion=1;
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_CLERIC_OFFICIALS_SHRINE_FAITH_UC_JNR'		FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_CLERIC_OFFICIALS_ALTAR_FAITH_UC_JNR'		FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_CLERIC_OFFICIALS_TEMPLE_FAITH_UC_JNR'		FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_CLERIC_OFFICIALS_MONASTERY_FAITH_UC_JNR'	FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_CLERIC_OFFICIALS_HOSPITIUM_FAITH_UC_JNR'	FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'JFD_CLERIC_OFFICIALS_GARDEN_FAITH_UC_JNR'		FROM Policies WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	a.PolicyType,	'JFD_CLERIC_OFFICIALS_' || SUBSTR(b.BuildingType,10) || '_FAITH_UC_JNR'
FROM	Policies a, Buildings b
WHERE	a.PolicyType='_POLICY_JFD_CLERIC_OFFICIALS'
		AND b.EnabledByReligion=1;

DELETE FROM PolicyModifiers WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS' AND ModifierId='JFD_CLERIC_OFFICIALS_SHRINE_FAITH';
DELETE FROM PolicyModifiers WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS' AND ModifierId='JFD_CLERIC_OFFICIALS_TEMPLE_FAITH';
DELETE FROM PolicyModifiers WHERE PolicyType='_POLICY_JFD_CLERIC_OFFICIALS' AND ModifierId='JFD_CLERIC_OFFICIALS_' || (SELECT BuildingType FROM Buildings WHERE EnabledByReligion = 1) || '_FAITH';
--------------------------------------------------------------