-- UC_COM_Policies
-- Author: JNR
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
UPDATE Policies SET Description='LOC_POLICY_NATURAL_PHILOSOPHY_DESCRIPTION_JNR_UC'		WHERE PolicyType='POLICY_NATURAL_PHILOSOPHY';
UPDATE Policies SET Description='LOC_POLICY_FIVE_YEAR_PLAN_DESCRIPTION_JNR_UC_CMP'		WHERE PolicyType='POLICY_FIVE_YEAR_PLAN'	AND Description='LOC_POLICY_FIVE_YEAR_PLAN_DESCRIPTION';
UPDATE Policies SET Description='LOC_POLICY_FIVE_YEAR_PLAN_DESCRIPTION_JNR_UC'			WHERE PolicyType='POLICY_FIVE_YEAR_PLAN'	AND Description='LOC_POLICY_FIVE_YEAR_PLAN_DESCRIPTION_JNR_UC_PRD';
UPDATE Policies SET Description='LOC_POLICY_RATIONALISM_DESCRIPTION_JNR_UC'				WHERE PolicyType='POLICY_RATIONALISM';
UPDATE Policies SET Description='LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC_CMP'	WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND Description='LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION';
UPDATE Policies SET Description='LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC'		WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND Description='LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC_MIL';
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,							RequirementType,					Inverse)
VALUES	('REQUIRES_CITY_HAS_NO_UNIVERSITY_JNR',	'REQUIREMENT_CITY_HAS_BUILDING',	1);
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,							Name,			Value)
VALUES	('REQUIRES_CITY_HAS_NO_UNIVERSITY_JNR',	'BuildingType',	'BUILDING_UNIVERSITY');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('DISTRICT_IS_CAMPUS_NO_UNIVERSITY_JNR',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('DISTRICT_IS_CAMPUS_NO_UNIVERSITY_JNR',	'REQUIRES_DISTRICT_IS_CAMPUS'),
		('DISTRICT_IS_CAMPUS_NO_UNIVERSITY_JNR',	'REQUIRES_CITY_HAS_NO_UNIVERSITY_JNR');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType,											SubjectRequirementSetId)
VALUES	('RATIONALISM_HIGH_ADJACENCY_LIBRARY_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_ACADEMY_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_UNIVERSITY_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_SCHOOL_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_LABORATORY_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_LIBERAL_ARTS_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_RESEARCH_LAB_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),
		('RATIONALISM_HIGH_ADJACENCY_EDUCATION_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CAMPUS_HAS_HIGH_ADJACENCY'),

		('RATIONALISM_HIGH_POP_LIBRARY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_ACADEMY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_UNIVERSITY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_SCHOOL_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_LABORATORY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_LIBERAL_ARTS_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_RESEARCH_LAB_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('RATIONALISM_HIGH_POP_EDUCATION_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),

		('NATURALPHILOSOPHY_NOUNIVERSITYSCIENCE_JNR',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_CAMPUS_NO_UNIVERSITY_JNR'),
		('FIVEYEARPLAN_NOUNIVERSITYSCIENCE_JNR',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_CAMPUS_NO_UNIVERSITY_JNR'),
		
		('THIRDALTERNATIVE_EDUCATION_GOLD_MODIFIER_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL),
		('THIRDALTERNATIVE_EDUCATION_CULTURE_MODIFIER_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,			Value)
VALUES	('RATIONALISM_HIGH_ADJACENCY_LIBRARY_JNR',			'BuildingType',	'BUILDING_LIBRARY'),
		('RATIONALISM_HIGH_ADJACENCY_ACADEMY_JNR',			'BuildingType',	'BUILDING_JNR_ACADEMY'),
		('RATIONALISM_HIGH_ADJACENCY_UNIVERSITY_JNR',		'BuildingType',	'BUILDING_UNIVERSITY'),
		('RATIONALISM_HIGH_ADJACENCY_SCHOOL_JNR',			'BuildingType',	'BUILDING_JNR_SCHOOL'),
		('RATIONALISM_HIGH_ADJACENCY_LABORATORY_JNR',		'BuildingType',	'BUILDING_JNR_LABORATORY'),
		('RATIONALISM_HIGH_ADJACENCY_LIBERAL_ARTS_JNR',		'BuildingType',	'BUILDING_JNR_LIBERAL_ARTS'),
		('RATIONALISM_HIGH_ADJACENCY_RESEARCH_LAB_JNR',		'BuildingType',	'BUILDING_RESEARCH_LAB'),
		('RATIONALISM_HIGH_ADJACENCY_EDUCATION_JNR',		'BuildingType',	'BUILDING_JNR_EDUCATION'),
		('RATIONALISM_HIGH_ADJACENCY_LIBRARY_JNR',			'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_ACADEMY_JNR',			'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_UNIVERSITY_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_SCHOOL_JNR',			'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_LABORATORY_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_LIBERAL_ARTS_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_RESEARCH_LAB_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_EDUCATION_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_ADJACENCY_LIBRARY_JNR',			'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_ACADEMY_JNR',			'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_UNIVERSITY_JNR',		'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_SCHOOL_JNR',			'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_LABORATORY_JNR',		'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_LIBERAL_ARTS_JNR',		'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_RESEARCH_LAB_JNR',		'Amount',		1),
		('RATIONALISM_HIGH_ADJACENCY_EDUCATION_JNR',		'Amount',		1),

		('RATIONALISM_HIGH_POP_LIBRARY_JNR',				'BuildingType',	'BUILDING_LIBRARY'),
		('RATIONALISM_HIGH_POP_ACADEMY_JNR',				'BuildingType',	'BUILDING_JNR_ACADEMY'),
		('RATIONALISM_HIGH_POP_UNIVERSITY_JNR',				'BuildingType',	'BUILDING_UNIVERSITY'),
		('RATIONALISM_HIGH_POP_SCHOOL_JNR',					'BuildingType',	'BUILDING_JNR_SCHOOL'),
		('RATIONALISM_HIGH_POP_LABORATORY_JNR',				'BuildingType',	'BUILDING_JNR_LABORATORY'),
		('RATIONALISM_HIGH_POP_LIBERAL_ARTS_JNR',			'BuildingType',	'BUILDING_JNR_LIBERAL_ARTS'),
		('RATIONALISM_HIGH_POP_RESEARCH_LAB_JNR',			'BuildingType',	'BUILDING_RESEARCH_LAB'),
		('RATIONALISM_HIGH_POP_EDUCATION_JNR',				'BuildingType',	'BUILDING_JNR_EDUCATION'),
		('RATIONALISM_HIGH_POP_LIBRARY_JNR',				'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_ACADEMY_JNR',				'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_UNIVERSITY_JNR',				'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_SCHOOL_JNR',					'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_LABORATORY_JNR',				'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_LIBERAL_ARTS_JNR',			'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_RESEARCH_LAB_JNR',			'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_EDUCATION_JNR',				'YieldType',	'YIELD_SCIENCE'),
		('RATIONALISM_HIGH_POP_LIBRARY_JNR',				'Amount',		1),
		('RATIONALISM_HIGH_POP_ACADEMY_JNR',				'Amount',		1),
		('RATIONALISM_HIGH_POP_UNIVERSITY_JNR',				'Amount',		1),
		('RATIONALISM_HIGH_POP_SCHOOL_JNR',					'Amount',		1),
		('RATIONALISM_HIGH_POP_LABORATORY_JNR',				'Amount',		1),
		('RATIONALISM_HIGH_POP_LIBERAL_ARTS_JNR',			'Amount',		1),
		('RATIONALISM_HIGH_POP_RESEARCH_LAB_JNR',			'Amount',		1),
		('RATIONALISM_HIGH_POP_EDUCATION_JNR',				'Amount',		1),

		('NATURALPHILOSOPHY_NOUNIVERSITYSCIENCE_JNR',		'YieldType',	'YIELD_SCIENCE'),
		('NATURALPHILOSOPHY_NOUNIVERSITYSCIENCE_JNR',		'Amount',		50),
		('FIVEYEARPLAN_NOUNIVERSITYSCIENCE_JNR',			'YieldType',	'YIELD_SCIENCE'),
		('FIVEYEARPLAN_NOUNIVERSITYSCIENCE_JNR',			'Amount',		50),

		('THIRDALTERNATIVE_EDUCATION_GOLD_MODIFIER_JNR',	'BuildingType',	'BUILDING_JNR_EDUCATION'),
		('THIRDALTERNATIVE_EDUCATION_GOLD_MODIFIER_JNR',	'YieldType',	'YIELD_GOLD'),
		('THIRDALTERNATIVE_EDUCATION_GOLD_MODIFIER_JNR',	'Amount',		4),
		('THIRDALTERNATIVE_EDUCATION_CULTURE_MODIFIER_JNR',	'BuildingType',	'BUILDING_JNR_EDUCATION'),
		('THIRDALTERNATIVE_EDUCATION_CULTURE_MODIFIER_JNR',	'YieldType',	'YIELD_CULTURE'),
		('THIRDALTERNATIVE_EDUCATION_CULTURE_MODIFIER_JNR',	'Amount',		2);

UPDATE ModifierArguments SET Value=50 WHERE ModifierId='NATURALPHILOSOPHY_DISTRICTSCIENCE'	AND Name='Amount';
UPDATE ModifierArguments SET Value=50 WHERE ModifierId='FIVEYEARPLAN_DISTRICTSCIENCE'		AND Name='Amount';
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
-- Free Market
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_LIBRARY_JNR'			FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_ACADEMY_JNR'			FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_UNIVERSITY_JNR'			FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_SCHOOL_JNR'				FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_LABORATORY_JNR'			FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_LIBERAL_ARTS_JNR'		FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_RESEARCH_LAB_JNR'		FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_ADJACENCY_EDUCATION_JNR'			FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_LIBRARY_JNR'					FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_ACADEMY_JNR'					FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_UNIVERSITY_JNR'				FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_SCHOOL_JNR'					FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_LABORATORY_JNR'				FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_LIBERAL_ARTS_JNR'				FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_RESEARCH_LAB_JNR'				FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'RATIONALISM_HIGH_POP_EDUCATION_JNR'				FROM Policies WHERE PolicyType='POLICY_RATIONALISM';

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_RATIONALISM' AND ModifierId='RATIONALISM_BUILDING_YIELDS_HIGH_ADJACENCY';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_RATIONALISM' AND ModifierId='RATIONALISM_BUILDING_YIELDS_HIGH_POP';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'NATURALPHILOSOPHY_NOUNIVERSITYSCIENCE_JNR'			FROM Policies WHERE PolicyType='POLICY_NATURAL_PHILOSOPHY';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FIVEYEARPLAN_NOUNIVERSITYSCIENCE_JNR'				FROM Policies WHERE PolicyType='POLICY_FIVE_YEAR_PLAN';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_EDUCATION_GOLD_MODIFIER_JNR'		FROM Policies WHERE PolicyType='POLICY_THIRD_ALTERNATIVE';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'THIRDALTERNATIVE_EDUCATION_CULTURE_MODIFIER_JNR'	FROM Policies WHERE PolicyType='POLICY_THIRD_ALTERNATIVE';
--------------------------------------------------------------