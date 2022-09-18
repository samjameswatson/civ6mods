-- UC_REL_Worship_CX
-- Author: JNR
--------------------------------------------------------------

-- India - Dharma
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,						ModifierType)
VALUES	('P0K_TRAIT_SHRINE_FAITH_JNR_UC',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'),
		('P0K_TRAIT_TEMPLE_FAITH_JNR_UC',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType)
SELECT	'P0K_TRAIT_' || SUBSTR(BuildingType,10) || '_FAITH_JNR_UC',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,						Name,		Value)
VALUES	('P0K_TRAIT_SHRINE_FAITH_JNR_UC',	'BuildingType',	'BUILDING_SHRINE'),
		('P0K_TRAIT_SHRINE_FAITH_JNR_UC',	'YieldType',	'YIELD_FAITH'),
		('P0K_TRAIT_SHRINE_FAITH_JNR_UC',	'Amount',		1),

		('P0K_TRAIT_TEMPLE_FAITH_JNR_UC',	'BuildingType',	'BUILDING_TEMPLE'),
		('P0K_TRAIT_TEMPLE_FAITH_JNR_UC',	'YieldType',	'YIELD_FAITH'),
		('P0K_TRAIT_TEMPLE_FAITH_JNR_UC',	'Amount',		2);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
SELECT	'P0K_TRAIT_' || SUBSTR(BuildingType,10) || '_FAITH_JNR_UC',	'BuildingType',	'BuildingType'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
SELECT	'P0K_TRAIT_' || SUBSTR(BuildingType,10) || '_FAITH_JNR_UC',	'YieldType',	'YIELD_FAITH'
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
SELECT	'P0K_TRAIT_' || SUBSTR(BuildingType,10) || '_FAITH_JNR_UC',	'Amount',		3
FROM	Buildings
WHERE	EnabledByReligion=1;

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('TRAIT_CIVILIZATION_DHARMA',	'P0K_TRAIT_SHRINE_FAITH_JNR_UC'),
		('TRAIT_CIVILIZATION_DHARMA',	'P0K_TRAIT_TEMPLE_FAITH_JNR_UC');

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
SELECT	'TRAIT_CIVILIZATION_DHARMA',	'P0K_TRAIT_' || SUBSTR(BuildingType,10) || '_FAITH_JNR_UC'
FROM	Buildings
WHERE	EnabledByReligion=1;

DELETE FROM TraitModifiers WHERE TraitType='TRAIT_CIVILIZATION_DHARMA' AND ModifierId='P0K_TRAIT_BONUS_FAITH_FROM_HOLY_SITE_BUILDINGS';
--------------------------------------------------------------