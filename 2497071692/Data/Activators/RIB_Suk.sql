-- RIB_Suk
-- Author: JNR
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('CITY_HAS_RIB_BISON_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_DLV_BISON_JNR'),
		('CITY_HAS_RIB_CAMEL_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_SUK_CAMEL_JNR');
--------------------------------------------------------------

-- TechnologyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TechnologyModifiers
		(TechnologyType,			ModifierId)
VALUES	('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_FOOD_PLAINS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_FOOD_PLAINS_HILLS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_PRODUCTION_GRASS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_PRODUCTION_GRASS_HILLS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_GOLD_PLAINS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_GOLD_PLAINS_HILLS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_GOLD_GRASS_ATTACH'),
		('TECH_MILITARY_TACTICS',	'JNR_RIB_BISON_GOLD_GRASS_HILLS_ATTACH'),
		('TECH_BANKING',			'JNR_RIB_CAMEL_UNLOCK_CARAVANSERAI');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,									Kind)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_BISON',	'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,					PrereqTech,					TraitType,						PlunderType,	Name,										Description,										Icon)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_BISON',	'TECH_MILITARY_TACTICS',	'TRAIT_CIVILIZATION_NO_PLAYER',	'NO_PLUNDER',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_BISON_NAME',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_BISON_DESCRIPTION',	'ICON_IMPROVEMENT_JNR_RIB_DUMMY_BISON');
--------------------------------------------------------------