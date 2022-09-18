-- RIB_Latin
-- Author: JNR
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('CITY_HAS_RIB_POTATOES_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_LEU_P0K_POTATOES_JNR');
--------------------------------------------------------------

-- TechnologyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TechnologyModifiers
		(TechnologyType,			ModifierId)
VALUES	('TECH_CURRENCY',			'JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA');
--------------------------------------------------------------

-- CivicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO CivicModifiers
		(CivicType,					ModifierId)
VALUES	('CIVIC_CIVIL_ENGINEERING',	'JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA_HILLS');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,									Kind)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_POTATOES',	'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,						PrereqTech,			TraitType,						PlunderType,	Name,											Description,											Icon)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_POTATOES',	'TECH_CURRENCY',	'TRAIT_CIVILIZATION_NO_PLAYER',	'NO_PLUNDER',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_POTATOES_NAME',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_POTATOES_DESCRIPTION',	'ICON_IMPROVEMENT_JNR_RIB_DUMMY_POTATOES');
--------------------------------------------------------------