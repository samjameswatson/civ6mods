-- RIB_Misc
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,										Kind)
VALUES	('GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',	'KIND_GOVERNOR_PROMOTION');
--------------------------------------------------------------

-- GovernorPromotionSets
--------------------------------------------------------------
UPDATE GovernorPromotionSets SET GovernorPromotion='GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE' WHERE GovernorType='GOVERNOR_THE_BUILDER' AND GovernorPromotion='GOVERNOR_PROMOTION_AQUACULTURE';
--------------------------------------------------------------

-- GovernorPromotions
--------------------------------------------------------------
INSERT OR IGNORE INTO GovernorPromotions
		(GovernorPromotionType,
		Name,
		Description,
		Level,
		Column
		)
SELECT	'GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',
		'LOC_GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE_NAME',
		'LOC_GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE_DESCRIPTION',
		Level,
		Column
FROM	GovernorPromotions
WHERE	GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';

UPDATE	GovernorPromotions
SET		Description='LOC_GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE_DESCRIPTION_DIPL'
WHERE	GovernorPromotionType='GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE'
		AND EXISTS (SELECT * FROM Districts WHERE DistrictType='DISTRICT_DIPLOMATIC_QUARTER');
--------------------------------------------------------------

-- GovernorPromotionPrereqs
--------------------------------------------------------------
UPDATE GovernorPromotionPrereqs SET GovernorPromotionType='GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE'	WHERE GovernorPromotionType='GOVERNOR_PROMOTION_AQUACULTURE';
UPDATE GovernorPromotionPrereqs SET PrereqGovernorPromotion='GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE'	WHERE PrereqGovernorPromotion='GOVERNOR_PROMOTION_AQUACULTURE';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType)
VALUES	('JNR_INFRASTRUCTURE_FASTER_CITY_CENTER_CONSTRUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION'),
		('JNR_INFRASTRUCTURE_FASTER_GOVERNMENT_CONSTRUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION'),
		('JNR_INFRASTRUCTURE_FASTER_ENTERTAINMENT_CONSTRUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION'),
		('JNR_INFRASTRUCTURE_FASTER_WATER_PARK_CONSTRUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION');

INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType)
SELECT	'JNR_INFRASTRUCTURE_FASTER_DIPLOMATIC_CONSTRUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION'
FROM	Districts
WHERE	DistrictType='DISTRICT_DIPLOMATIC_QUARTER';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
VALUES	('JNR_INFRASTRUCTURE_FASTER_CITY_CENTER_CONSTRUCTION',		'DistrictType',	'DISTRICT_CITY_CENTER'),
		('JNR_INFRASTRUCTURE_FASTER_CITY_CENTER_CONSTRUCTION',		'Amount',		30),
		('JNR_INFRASTRUCTURE_FASTER_GOVERNMENT_CONSTRUCTION',		'DistrictType',	'DISTRICT_GOVERNMENT'),
		('JNR_INFRASTRUCTURE_FASTER_GOVERNMENT_CONSTRUCTION',		'Amount',		30),
		('JNR_INFRASTRUCTURE_FASTER_ENTERTAINMENT_CONSTRUCTION',	'DistrictType',	'DISTRICT_ENTERTAINMENT_COMPLEX'),
		('JNR_INFRASTRUCTURE_FASTER_ENTERTAINMENT_CONSTRUCTION',	'Amount',		30),
		('JNR_INFRASTRUCTURE_FASTER_WATER_PARK_CONSTRUCTION',		'DistrictType',	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX'),
		('JNR_INFRASTRUCTURE_FASTER_WATER_PARK_CONSTRUCTION',		'Amount',		30);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
SELECT	'JNR_INFRASTRUCTURE_FASTER_DIPLOMATIC_CONSTRUCTION',		'DistrictType',	DistrictType
FROM	Districts
WHERE	DistrictType='DISTRICT_DIPLOMATIC_QUARTER';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
SELECT	'JNR_INFRASTRUCTURE_FASTER_DIPLOMATIC_CONSTRUCTION',		'Amount',		30
FROM	Districts
WHERE	DistrictType='DISTRICT_DIPLOMATIC_QUARTER';
--------------------------------------------------------------

-- GovernorPromotionModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO GovernorPromotionModifiers
		(GovernorPromotionType,						ModifierId)
VALUES	('GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',	'JNR_INFRASTRUCTURE_FASTER_CITY_CENTER_CONSTRUCTION'),
		('GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',	'JNR_INFRASTRUCTURE_FASTER_GOVERNMENT_CONSTRUCTION'),
		('GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',	'JNR_INFRASTRUCTURE_FASTER_ENTERTAINMENT_CONSTRUCTION'),
		('GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',	'JNR_INFRASTRUCTURE_FASTER_WATER_PARK_CONSTRUCTION');

INSERT OR IGNORE INTO GovernorPromotionModifiers
		(GovernorPromotionType,						ModifierId)
SELECT	'GOVERNOR_PROMOTION_JNR_INFRASTRUCTURE',	'JNR_INFRASTRUCTURE_FASTER_DIPLOMATIC_CONSTRUCTION'
FROM	Districts
WHERE	DistrictType='DISTRICT_DIPLOMATIC_QUARTER';
--------------------------------------------------------------