-- RIB_NFP
-- Author: JNR
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('CITY_HAS_RIB_MAIZE_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_MAIZE_JNR');
--------------------------------------------------------------

-- TechnologyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TechnologyModifiers
		(TechnologyType,		ModifierId)
VALUES	('TECH_MATHEMATICS',	'JNR_RIB_MAIZE_FOOD_FOREST_ATTACH'),
		('TECH_MATHEMATICS',	'JNR_RIB_MAIZE_FOOD_JUNGLE_ATTACH');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,								Kind)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_MAIZE',	'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,					PrereqTech,			TraitType,						PlunderType,	Name,										Description,										Icon)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_MAIZE',	'TECH_MATHEMATICS',	'TRAIT_CIVILIZATION_NO_PLAYER',	'NO_PLUNDER',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_MAIZE_NAME',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_MAIZE_DESCRIPTION',	'ICON_IMPROVEMENT_JNR_RIB_DUMMY_MAIZE');
--------------------------------------------------------------