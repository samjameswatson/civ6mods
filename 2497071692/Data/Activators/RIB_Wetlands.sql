-- RIB_Wetlands
-- Author: JNR
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,							RequirementType)
VALUES	('REQUIRES_PLOT_HAS_RESOURCE_PEAT_JNR',	'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES');
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,							Name,			Value)
VALUES	('REQUIRES_PLOT_HAS_RESOURCE_PEAT_JNR',	'ResourceType',	'RESOURCE_JNR_PEAT');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('PEAT_IRON_REQUIREMENT_JNR',			'REQUIRES_PLOT_HAS_RESOURCE_PEAT_JNR'),
		('PEAT_COAL_REQUIREMENT_JNR',			'REQUIRES_PLOT_HAS_RESOURCE_PEAT_JNR'),
		('CITY_HAS_RIB_PEAT_REQUIREMENTS_JNR',	'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_JNR_PEAT_JNR');
--------------------------------------------------------------

-- ImprovementModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,		ModifierId)
VALUES	('IMPROVEMENT_QUARRY',	'JNR_RIB_PEAT_IRON'),
		('IMPROVEMENT_QUARRY',	'JNR_RIB_PEAT_COAL');
--------------------------------------------------------------

-- Improvement_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_Adjacencies
		(ImprovementType,				YieldChangeId)
VALUES	('IMPROVEMENT_JNR_FLOOD_FARM',	'JNR_WetFarm_MechanizedAdjacency'),
		('IMPROVEMENT_JNR_WET_FARM',	'Flood_Farms_MechanizedAdjacency');
--------------------------------------------------------------


-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,									Kind)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_PEAT_1',	'KIND_IMPROVEMENT'),
		('IMPROVEMENT_JNR_RIB_DUMMY_PEAT_2',	'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,						TraitType,						PlunderType,	Name,											Description,										Icon)
VALUES	('IMPROVEMENT_JNR_RIB_DUMMY_PEAT_1',	'TRAIT_CIVILIZATION_NO_PLAYER',	'NO_PLUNDER',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_PEAT_1_NAME',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_PEAT_1_DESCRIPTION',	'ICON_IMPROVEMENT_JNR_RIB_DUMMY_PEAT_1'),
		('IMPROVEMENT_JNR_RIB_DUMMY_PEAT_2',	'TRAIT_CIVILIZATION_NO_PLAYER',	'NO_PLUNDER',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_PEAT_2_NAME',	'LOC_IMPROVEMENT_JNR_RIB_DUMMY_PEAT_2_DESCRIPTION',	'ICON_IMPROVEMENT_JNR_RIB_DUMMY_PEAT_2');
		
UPDATE Improvements SET PrereqTech=(SELECT PrereqTech FROM Resources WHERE ResourceType='RESOURCE_IRON') WHERE ImprovementType='IMPROVEMENT_JNR_RIB_DUMMY_PEAT_1';
UPDATE Improvements SET PrereqTech=(SELECT PrereqTech FROM Resources WHERE ResourceType='RESOURCE_COAL') WHERE ImprovementType='IMPROVEMENT_JNR_RIB_DUMMY_PEAT_2';
--------------------------------------------------------------