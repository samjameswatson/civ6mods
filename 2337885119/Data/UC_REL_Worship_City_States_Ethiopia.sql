-- UC_REL_Worship_City_States_Ethiopia
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType,							SubjectRequirementSetId)
SELECT	'MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_' || SUBSTR(BuildingType,10),	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'PLAYER_HAS_LARGE_INFLUENCE'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType)
SELECT	'MINOR_CIV_RELIGIOUS_YIELD_FOR_' || SUBSTR(BuildingType,10),		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,				Value)
SELECT	'MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_' || SUBSTR(BuildingType,10),	'ModifierId',		'MINOR_CIV_RELIGIOUS_YIELD_FOR_' || SUBSTR(BuildingType,10)		
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,				Value)
SELECT	'MINOR_CIV_RELIGIOUS_YIELD_FOR_' || SUBSTR(BuildingType,10),		'BuildingType',		BuildingType		
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,				Value)
SELECT	'MINOR_CIV_RELIGIOUS_YIELD_FOR_' || SUBSTR(BuildingType,10),		'YieldType',		'YIELD_FAITH'		
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,				Value)
SELECT	'MINOR_CIV_RELIGIOUS_YIELD_FOR_' || SUBSTR(BuildingType,10),		'Amount',			3		
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,				Value)
SELECT	'MINOR_CIV_RELIGIOUS_YIELD_FOR_' || SUBSTR(BuildingType,10),		'CityStatesOnly',	1		
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
SELECT	'MINOR_CIV_RELIGIOUS_TRAIT',	'MINOR_CIV_RELIGIOUS_LARGE_INFLUENCE_' || SUBSTR(BuildingType,10)		
FROM	Buildings
WHERE	EnabledByReligion=1;
--------------------------------------------------------------