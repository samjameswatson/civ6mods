-- UC_ENT_Suk_Oceans
-- Author: JNR
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
DELETE FROM DistrictModifiers WHERE ModifierId='SUK_OCEANS_WATER_PARK_AMENITIES';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,					ModifierType)
VALUES	('JNR_AQUARIUM_APPEAL_KELP',	'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('JNR_AQUARIUM_APPEAL_KELP',	'FeatureType',	'FEATURE_SUK_KELP'),
		('JNR_AQUARIUM_APPEAL_KELP',	'Amount',		1);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_AQUARIUM' AND ModifierId='SUK_OCEANS_AQUARIUM_ADJACENT_SCIENCE';

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,			ModifierId)
VALUES	('BUILDING_AQUARIUM',	'JNR_AQUARIUM_APPEAL_KELP');

DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_AQUATICS_CENTER' AND ModifierId='SUK_OCEANS_AQUATIC_CENTER_TOURISM';
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
UPDATE Buildings SET Description='LOC_BUILDING_AQUARIUM_DESCRIPTION_UC_JNR_KELP' WHERE BuildingType='BUILDING_AQUARIUM';
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,					Description,						YieldType,		YieldChange,	TilesRequired,	AdjacentFeature)
VALUES	('Kelp_Tourism_JNR',	'LOC_KELP_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				'FEATURE_SUK_KELP');
--------------------------------------------------------------

-- District_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
VALUES	('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Kelp_Tourism_JNR');
--------------------------------------------------------------