-- RIB_Suk_Oceans
-- Author: JNR
--------------------------------------------------------------

-- Improvement_ValidFeatures
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_ValidFeatures
		(ImprovementType,		FeatureType)
VALUES	('IMPROVEMENT_FISHERY',	'FEATURE_SUK_KELP');
--------------------------------------------------------------

-- Improvement_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Improvement_YieldChanges
		(ImprovementType,		YieldType,			YieldChange)
VALUES	('IMPROVEMENT_FISHERY',	'YIELD_FOOD',		0),
		('IMPROVEMENT_FISHERY',	'YIELD_PRODUCTION',	0),
		('IMPROVEMENT_FISHERY',	'YIELD_FAITH',		0);
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('CITY_HAS_RIB_SEALS_REQUIREMENTS_JNR',		'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_SUK_SEALS_JNR'),
		('CITY_HAS_RIB_SQUID_REQUIREMENTS_JNR',		'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_SUK_SQUID_JNR');
--------------------------------------------------------------

-- ImprovementModifiers
--------------------------------------------------------------
DELETE FROM ImprovementModifiers WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS' AND ModifierId='SUK_FISHERY_FOOD';
DELETE FROM ImprovementModifiers WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS' AND ModifierId='SUK_FISHERY_PRODUCTION';

INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,		ModifierId)
VALUES	('IMPROVEMENT_FISHERY',	'JNR_RIB_FISHERY_SEALS_PRODUCTION'),
		('IMPROVEMENT_FISHERY',	'JNR_RIB_FISHERY_SQUID_FAITH');
--------------------------------------------------------------