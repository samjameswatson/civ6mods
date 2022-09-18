-- RIB_Improvements
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,									Kind)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',		'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,
		PrereqTech,
		TraitType,
		Buildable,
		OnePerCity,
		Housing,
		TilesRequired,
		Appeal,
		SameAdjacentValid,
		DefenseModifier,
		GrantFortification,
		PlunderType,
		PlunderAmount,
		Name,
		Description,
		Icon)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',
		'TECH_BANKING',
		'TRAIT_CIVILIZATION_NO_PLAYER',
		1,
		1,
		2,
		2,
		0,
		0,
		4,
		2,
		'PLUNDER_GOLD',
		50,
		'LOC_IMPROVEMENT_JNR_CARAVANSERAI_NAME',
		'LOC_IMPROVEMENT_JNR_CARAVANSERAI_DESCRIPTION',
		'ICON_IMPROVEMENT_JNR_CARAVANSERAI');
--------------------------------------------------------------

-- Improvement_ValidBuildUnits
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidBuildUnits
		(ImprovementType,					UnitType)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',	'UNIT_BUILDER');
--------------------------------------------------------------

-- Improvement_ValidTerrains
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidTerrains
		(ImprovementType,					TerrainType)
VALUES	('IMPROVEMENT_JNR_CARAVANSERAI',	'TERRAIN_DESERT'),
		('IMPROVEMENT_JNR_CARAVANSERAI',	'TERRAIN_DESERT_HILLS');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,							ModifierType,													SubjectRequirementSetId)
VALUES	('JNR_RIB_CAMEL_UNLOCK_CARAVANSERAI',	'MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'CITY_HAS_RIB_CAMEL_REQUIREMENTS_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,							Name,				Value)
VALUES	('JNR_RIB_CAMEL_UNLOCK_CARAVANSERAI',	'ImprovementType',	'IMPROVEMENT_JNR_CARAVANSERAI');
--------------------------------------------------------------

-- Zombies mode
--------------------------------------------------------------
INSERT OR IGNORE INTO TypeProperties
		(Type,							Name,	Value)
SELECT	'IMPROVEMENT_JNR_CARAVANSERAI',	Name,	Value
FROM	TypeProperties
WHERE	Type='IMPROVEMENT_FORT' AND Name='PLOT_DAMAGE_TO_WALKING_INTO';

UPDATE	Improvements
SET		Description='LOC_IMPROVEMENT_JNR_CARAVANSERAI_DESCRIPTION_ZOMBIE'
WHERE	ImprovementType=(SELECT * FROM TypeProperties WHERE Type='IMPROVEMENT_JNR_CARAVANSERAI' AND Name='PLOT_DAMAGE_TO_WALKING_INTO');
--------------------------------------------------------------