-- UC_AQD_Baray
-- Author: JNR
--------------------------------------------------------------

-- Districts
--------------------------------------------------------------
UPDATE Districts SET Cost=27, Maintenance=1, Description='LOC_DISTRICT_SUK_BARAY_DESCRIPTION_JNR_UC' WHERE DistrictType='DISTRICT_SUK_BARAY';
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
-- UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='Suk_Baray_Production';
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,											RequirementSetType)
VALUES	('CITY_HAS_BARAY_WITH_HAMMER_WORKS_ADJACENT_TO_OWNER_JNR',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,											RequirementId)
VALUES	('CITY_HAS_BARAY_WITH_HAMMER_WORKS_ADJACENT_TO_OWNER_JNR',	'ADJACENT_TO_OWNER'),
		('CITY_HAS_BARAY_WITH_HAMMER_WORKS_ADJACENT_TO_OWNER_JNR',	'REQUIRES_DISTRICT_IS_SUK_BARAY'),
		('CITY_HAS_BARAY_WITH_HAMMER_WORKS_ADJACENT_TO_OWNER_JNR',	'REQUIRES_CITY_HAS_HAMMER_WORKS_JNR');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,														Kind)
VALUES	('MODIFIER_JNR_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,												CollectionType,					EffectType)
VALUES	('MODIFIER_JNR_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE',	'COLLECTION_PLAYER_DISTRICTS',	'EFFECT_ADJUST_DISTRICT_BASE_YIELD_CHANGE');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,											ModifierType,												SubjectRequirementSetId)
VALUES	('JNR_BARAY_HAMMER_WORKS_PRODUCTION_ADJACENCY_WONDER',	'MODIFIER_JNR_PLAYER_DISTRICTS_ADJUST_BASE_YIELD_CHANGE',	'CITY_HAS_BARAY_WITH_HAMMER_WORKS_ADJACENT_TO_OWNER_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
UPDATE ModifierArguments SET Value=1 WHERE ModifierId='SUK_BARAY_ADJACENT_FARM_FOOD' AND Name='Amount';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
VALUES	('JNR_BARAY_HAMMER_WORKS_PRODUCTION_ADJACENCY_WONDER',	'YieldType',	'YIELD_PRODUCTION'),
		('JNR_BARAY_HAMMER_WORKS_PRODUCTION_ADJACENCY_WONDER',	'Amount',		2);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
			(BuildingType,		ModifierId)
SELECT		BuildingType,		'JNR_BARAY_HAMMER_WORKS_PRODUCTION_ADJACENCY_WONDER'
FROM Buildings WHERE IsWonder = 1;
--------------------------------------------------------------