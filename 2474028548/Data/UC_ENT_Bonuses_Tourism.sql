-- UC_ENT_Bonuses_Tourism
-- Author: JNR
--------------------------------------------------------------

-- Building_TourismBombs_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,				TourismBombValue)
SELECT	'BUILDING_JNR_TOURNEY',		TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_ARENA';

INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,				TourismBombValue)
SELECT	'BUILDING_JNR_THEME_PARK',	TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_STADIUM';

INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,				TourismBombValue)
SELECT	'BUILDING_JNR_MARINA',		TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_FERRIS_WHEEL';

INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,				TourismBombValue)
SELECT	'BUILDING_JNR_FOOD_COURT',	TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_AQUATICS_CENTER';
--------------------------------------------------------------

-- Building_GreatWorks
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatWorks
		(BuildingType,				NumSlots,	GreatWorkSlotType)
VALUES	('BUILDING_ARENA',			1,			'GREATWORKSLOT_MUSIC'),
		('BUILDING_TLACHTLI',		1,			'GREATWORKSLOT_MUSIC'),
		('BUILDING_JNR_THEME_PARK',	1,			'GREATWORKSLOT_MUSIC'),
		('BUILDING_JNR_FOOD_COURT',	1,			'GREATWORKSLOT_MUSIC');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,														Kind)
VALUES	('MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',			'KIND_MODIFIER'),
		('MODIFIER_JNR_ALLIANCE_DISTRICTS_ADJUST_TOURISM_CHANGE',	'KIND_MODIFIER'),
		('MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',		'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,												CollectionType,						EffectType)
VALUES	('MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',			'COLLECTION_OWNER',					'EFFECT_ADJUST_FEATURE_APPEAL_MODIFIER'),
		('MODIFIER_JNR_ALLIANCE_DISTRICTS_ADJUST_TOURISM_CHANGE',	'COLLECTION_ALLIANCE_DISTRICTS',	'EFFECT_ADJUST_DISTRICT_TOURISM_CHANGE'),
		('MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',		'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_YIELD_MODIFIER');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,							ModifierType,												SubjectRequirementSetId)
VALUES	('JNR_ZOO_TOURISM',						'MODIFIER_PLAYER_DISTRICT_ADJUST_TOURISM_CHANGE',			NULL),
		('JNR_BOTANICAL_GARDEN_TOURISM',		'MODIFIER_PLAYER_DISTRICT_ADJUST_TOURISM_CHANGE',			NULL),
		('JNR_AQUARIUM_TOURISM',				'MODIFIER_PLAYER_DISTRICT_ADJUST_TOURISM_CHANGE',			NULL),
		('JNR_AQUARIUM_APPEAL_REEF',			'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',				NULL),
		('JNR_TOURNEY_TOURISM_ALLY_TRADE',		'MODIFIER_JNR_ALLIANCE_DISTRICTS_ADJUST_TOURISM_CHANGE',	'TOURNEY_TOURISM_REQUIREMENTS_JNR'),
		('JNR_MARINA_TOURISM_FISHING_BOATS',	'MODIFIER_CITY_DISTRICTS_ADJUST_TOURISM_CHANGE',			'DISTRICT_IS_WATER_PARK_WITH_MARINA_JNR'),
		('JNR_THEME_PARK_TOURISM_ADJACENCY',	'MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_ENTERTAINMENT_COMPLEX_POWERED_JNR'),
		('JNR_FOOD_COURT_TOURISM_ADJACENCY',	'MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_WATER_PARK_POWERED_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('JNR_ZOO_TOURISM',						'Amount',		2),
		('JNR_BOTANICAL_GARDEN_TOURISM',		'Amount',		2),
		('JNR_AQUARIUM_TOURISM',				'Amount',		1),
		('JNR_AQUARIUM_APPEAL_REEF',			'FeatureType',	'FEATURE_REEF'),
		('JNR_AQUARIUM_APPEAL_REEF',			'Amount',		1),
		('JNR_TOURNEY_TOURISM_ALLY_TRADE',		'Amount',		1),
		('JNR_MARINA_TOURISM_FISHING_BOATS',	'Amount',		1),
		('JNR_THEME_PARK_TOURISM_ADJACENCY',	'YieldType',	'YIELD_GOLD'),
		('JNR_THEME_PARK_TOURISM_ADJACENCY',	'Amount',		100),
		('JNR_FOOD_COURT_TOURISM_ADJACENCY',	'YieldType',	'YIELD_GOLD'),
		('JNR_FOOD_COURT_TOURISM_ADJACENCY',	'Amount',		100);

UPDATE ModifierArguments SET Value=1 WHERE ModifierId='FERRIS_WHEEL_TOURISM'			AND Name='Amount';
UPDATE ModifierArguments SET Value=1 WHERE ModifierId='AQUATICS_CENTER_WONDER_TOURISM'	AND Name='Amount';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,						ModifierId)
VALUES	('BUILDING_ZOO',					'JNR_ZOO_TOURISM'),
		('BUILDING_JNR_BOTANICAL_GARDEN',	'JNR_BOTANICAL_GARDEN_TOURISM'),
		('BUILDING_AQUARIUM',				'JNR_AQUARIUM_TOURISM'),
		('BUILDING_AQUARIUM',				'JNR_AQUARIUM_APPEAL_REEF'),
		('BUILDING_JNR_CASINO',				'AQUATICS_CENTER_WONDER_TOURISM'),
		('BUILDING_JNR_THEME_PARK',			'JNR_THEME_PARK_TOURISM_ADJACENCY'),
		('BUILDING_JNR_FOOD_COURT',			'JNR_FOOD_COURT_TOURISM_ADJACENCY'),
		('BUILDING_AQUATICS_CENTER',		'STADIUM_10_POPULATION_TOURISM'),
		('BUILDING_AQUATICS_CENTER',		'STADIUM_20_POPULATION_TOURISM');

DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_AQUATICS_CENTER' AND ModifierId='AQUATICS_CENTER_WONDER_TOURISM';
--------------------------------------------------------------

-- ImprovementModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,				ModifierId)
VALUES	('IMPROVEMENT_FISHING_BOATS',	'JNR_MARINA_TOURISM_FISHING_BOATS');
--------------------------------------------------------------

-- AllianceEffects
--------------------------------------------------------------
INSERT OR IGNORE INTO AllianceEffects
		(LevelRequirement,	AllianceType,	ModifierID)
SELECT	1,					AllianceType,	'JNR_TOURNEY_TOURISM_ALLY_TRADE'
FROM	Alliances
WHERE	AllianceType IS NOT NULL;
--------------------------------------------------------------

-- CivicModifiers
--------------------------------------------------------------
DELETE FROM CivicModifiers WHERE CivicType='CIVIC_CONSERVATION' AND ModifierId='CONSERVATION_ARENA_TOURISM';
--------------------------------------------------------------