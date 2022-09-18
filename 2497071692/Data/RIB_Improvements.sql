-- RIB_Improvements
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,									Kind)
VALUES	('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'KIND_IMPROVEMENT'),
		('IMPROVEMENT_JNR_WET_FARM',			'KIND_IMPROVEMENT'),
		('IMPROVEMENT_JNR_CLOTHIER',			'KIND_IMPROVEMENT'),
		('IMPROVEMENT_JNR_BREWERY',				'KIND_IMPROVEMENT');
--------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvements
		(ImprovementType,						PrereqTech,				TraitType,						Buildable,	OnePerCity,	Housing,	TilesRequired,	Appeal,	PlunderType,	PlunderAmount,	Name,											Description,											Icon)
VALUES	('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'TECH_MATHEMATICS',		'TRAIT_CIVILIZATION_NO_PLAYER',	1,			0,			1,			2,				0,		'PLUNDER_HEAL',	50,				'LOC_IMPROVEMENT_JNR_JUNGLE_PLANTATION_NAME',	'LOC_IMPROVEMENT_JNR_JUNGLE_PLANTATION_DESCRIPTION',	'ICON_IMPROVEMENT_JNR_JUNGLE_PLANTATION'),
		('IMPROVEMENT_JNR_WET_FARM',			'TECH_IRRIGATION',		'TRAIT_CIVILIZATION_NO_PLAYER',	1,			0,			2,			2,				0,		'PLUNDER_HEAL',	50,				'LOC_IMPROVEMENT_JNR_WET_FARM_NAME',			'LOC_IMPROVEMENT_JNR_WET_FARM_DESCRIPTION',				'ICON_IMPROVEMENT_JNR_WET_FARM'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TECH_APPRENTICESHIP',	'TRAIT_CIVILIZATION_NO_PLAYER',	1,			1,			0,			1,				-1,		'PLUNDER_GOLD',	50,				'LOC_IMPROVEMENT_JNR_CLOTHIER_NAME',			'LOC_IMPROVEMENT_JNR_CLOTHIER_DESCRIPTION',				'ICON_IMPROVEMENT_JNR_CLOTHIER'),
		('IMPROVEMENT_JNR_BREWERY',				'TECH_APPRENTICESHIP',	'TRAIT_CIVILIZATION_NO_PLAYER',	1,			1,			2,			2,				-1,		'PLUNDER_GOLD',	50,				'LOC_IMPROVEMENT_JNR_BREWERY_NAME',				'LOC_IMPROVEMENT_JNR_BREWERY_DESCRIPTION',				'ICON_IMPROVEMENT_JNR_BREWERY');

UPDATE	Improvements
SET		PrereqTech='TECH_SHIPBUILDING',
		TraitType=NULL,
		Housing=1,
		TilesRequired=2,
		AdjacentSeaResource=1,
		Workable=1,
		Description='LOC_IMPROVEMENT_FISHERY_DESCRIPTION_JNR_UC'
WHERE ImprovementType='IMPROVEMENT_FISHERY';
--------------------------------------------------------------

-- Improvement_ValidBuildUnits
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidBuildUnits
		(ImprovementType,						UnitType)
VALUES	('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'UNIT_BUILDER'),
		('IMPROVEMENT_JNR_WET_FARM',			'UNIT_BUILDER'),
		('IMPROVEMENT_JNR_CLOTHIER',			'UNIT_BUILDER'),
		('IMPROVEMENT_JNR_BREWERY',				'UNIT_BUILDER');
--------------------------------------------------------------

-- Improvement_ValidTerrains
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidTerrains
		(ImprovementType,						TerrainType)
VALUES	('IMPROVEMENT_JNR_WET_FARM',			'TERRAIN_GRASS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_GRASS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_GRASS_HILLS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_PLAINS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_PLAINS_HILLS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_DESERT'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_DESERT_HILLS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_TUNDRA'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_TUNDRA_HILLS'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_SNOW'),
		('IMPROVEMENT_JNR_CLOTHIER',			'TERRAIN_SNOW_HILLS'),
		('IMPROVEMENT_JNR_BREWERY',				'TERRAIN_GRASS'),
		('IMPROVEMENT_JNR_BREWERY',				'TERRAIN_GRASS_HILLS'),
		('IMPROVEMENT_JNR_BREWERY',				'TERRAIN_PLAINS'),
		('IMPROVEMENT_JNR_BREWERY',				'TERRAIN_PLAINS_HILLS'),
		('IMPROVEMENT_JNR_BREWERY',				'TERRAIN_TUNDRA'),
		('IMPROVEMENT_JNR_BREWERY',				'TERRAIN_TUNDRA_HILLS');
--------------------------------------------------------------

-- Improvement_ValidFeatures
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidFeatures
		(ImprovementType,						FeatureType)
VALUES	('IMPROVEMENT_JNR_JUNGLE_PLANTATION',	'FEATURE_JUNGLE'),
		('IMPROVEMENT_JNR_WET_FARM',			'FEATURE_MARSH'),
		('IMPROVEMENT_JNR_WET_FARM',			'FEATURE_FLOODPLAINS_GRASSLAND');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,															Kind)
VALUES	('MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,													CollectionType,				EffectType)
VALUES	('MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'COLLECTION_PLAYER_CITIES',	'EFFECT_ADJUST_CITY_ALLOWED_IMPROVEMENT');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,													SubjectRequirementSetId)
VALUES	('JNR_RIB_BANANAS_UNLOCK_JUNGLE_PLANTATION',	'MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'CITY_HAS_RIB_BANANAS_REQUIREMENTS_JNR'),
		('JNR_RIB_RICE_UNLOCK_WET_FARM',				'MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'CITY_HAS_RIB_RICE_REQUIREMENTS_JNR'),
		('JNR_RIB_SHEEP_UNLOCK_CLOTHIER',				'MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'CITY_HAS_RIB_SHEEP_REQUIREMENTS_JNR'),
		('JNR_RIB_WHEAT_UNLOCK_BREWERY',				'MODIFIER_JNR_PLAYER_CITIES_ADJUST_CITY_ALLOWED_IMPROVEMENT',	'CITY_HAS_RIB_WHEAT_REQUIREMENTS_JNR'),
		('JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA',			'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN',		'CITY_HAS_RIB_POTATOES_REQUIREMENTS_JNR'),
		('JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA_HILLS',	'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN',		'CITY_HAS_RIB_POTATOES_REQUIREMENTS_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,				Value)
VALUES	('JNR_RIB_BANANAS_UNLOCK_JUNGLE_PLANTATION',	'ImprovementType',	'IMPROVEMENT_JNR_JUNGLE_PLANTATION'),
		('JNR_RIB_RICE_UNLOCK_WET_FARM',				'ImprovementType',	'IMPROVEMENT_JNR_WET_FARM'),
		('JNR_RIB_SHEEP_UNLOCK_CLOTHIER',				'ImprovementType',	'IMPROVEMENT_JNR_CLOTHIER'),
		('JNR_RIB_WHEAT_UNLOCK_BREWERY',				'ImprovementType',	'IMPROVEMENT_JNR_BREWERY'),	
		('JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA',			'ImprovementType',	'IMPROVEMENT_FARM'),
		('JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA',			'TerrainType',		'TERRAIN_TUNDRA'),
		('JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA_HILLS',	'ImprovementType',	'IMPROVEMENT_FARM'),
		('JNR_RIB_POTATOES_UNLOCK_FARM_TUNDRA_HILLS',	'TerrainType',		'TERRAIN_TUNDRA_HILLS');
--------------------------------------------------------------