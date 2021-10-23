-- UC_REL_Worship_Requirements
-- Author: JNR
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,												RequirementType)
SELECT	'REQUIRES_CITY_HAS_' || SUBSTR(BuildingType,10),			'REQUIREMENT_CITY_HAS_BUILDING'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO Requirements
		(RequirementId,												RequirementType)
SELECT	'REQUIRES_CITY_HAS_' || SUBSTR(BuildingType,10) || '_BASE',	'REQUIREMENT_CITY_HAS_BUILDING'
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------

-- RequirementArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,												Name,			Value)
SELECT	'REQUIRES_CITY_HAS_' || SUBSTR(BuildingType,10),			'BuildingType',	BuildingType
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO RequirementArguments
		(RequirementId,												Name,			Value)
SELECT	'REQUIRES_CITY_HAS_' || SUBSTR(BuildingType,10) || '_BASE',	'BuildingType',	BuildingType
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
SELECT	'BUILDING_IS_TIER3_HOLY_SITE',			'REQUIRES_CITY_HAS_' || SUBSTR(BuildingType,10)
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
SELECT	'REQUIREMENTS_CITY_HAS_TIER3RELIGIOUS',	'REQUIRES_CITY_HAS_' || SUBSTR(BuildingType,10) || '_BASE'
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------