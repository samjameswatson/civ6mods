-- UC_CMP_CX
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

-- India - Gospel of the Charkha
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
VALUES	('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_ALTAR',	'MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_ALTAR',	'BuildingType',	'BUILDING_JNR_ALTAR');

INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 				ModifierId)
VALUES	('TRAIT_LEADER_SATYAGRAHA',	'P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_ALTAR');
--------------------------------------------------------------

-- Kongo - Wisdom Of The Nkisi
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType)
VALUES	('P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_JNR_UC',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'),
		('P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_MODIFIER_JNR_UC',	'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,					Value)
VALUES	('P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_JNR_UC',				'ModifierId',			'P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_MODIFIER_JNR_UC'),
		('P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_MODIFIER_JNR_UC',	'BuildingType',			'BUILDING_JNR_ALTAR'),
		('P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_MODIFIER_JNR_UC',	'GreatWorkSlotType',	'GREATWORKSLOT_PALACE'),
		('P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_MODIFIER_JNR_UC',	'Amount',				2);

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('TRAIT_CIVILIZATION_NKISI',	'P0K_TRAIT_ALTAR_GREAT_WORK_SLOTS_JNR_UC');
--------------------------------------------------------------

-- Kongo - Baptized King
--------------------------------------------------------------
UPDATE	Modifiers SET SubjectRequirementSetId='BUILDING_IS_HOLY_SITE_TIER2_JNR' WHERE ModifierId='P0K_TRAIT_TEMPLE_FREE_RELIC';
--------------------------------------------------------------

-- Georgia - Epoch of Glory
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
				(RequirementId,										RequirementType)
SELECT DISTINCT	'P0K_GEORGIA_REQUIRES_PLAYER_HAS_' ||BuildingType,	'REQUIREMENT_PLAYER_HAS_BUILDING'
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO RequirementArguments
				(RequirementId,										Name,			Value)
SELECT DISTINCT	'P0K_GEORGIA_REQUIRES_PLAYER_HAS_' ||BuildingType,	'BuildingType',	BuildingType
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO RequirementSets
				(RequirementSetId,							RequirementSetType)
SELECT DISTINCT	'P0K_GEORGIA_PLAYER_HAS_' ||BuildingType,	'REQUIREMENTSET_TEST_ALL'
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO RequirementSetRequirements
				(RequirementSetId,							RequirementId)
SELECT DISTINCT	'P0K_GEORGIA_PLAYER_HAS_' ||BuildingType,	'P0K_GEORGIA_REQUIRES_PLAYER_HAS_' ||BuildingType
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO Modifiers
				(ModifierId,															ModifierType,							OwnerRequirementSetId,						SubjectRequirementSetId)
SELECT DISTINCT	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType,				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'P0K_GEORGIA_PLAYER_HAS_' ||BuildingType,	'P0K_GEORGIA_TAMAR_IS_SUZERAIN'
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO Modifiers
				(ModifierId,															ModifierType)
SELECT DISTINCT	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType|| '_MODIFIER',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS'
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO ModifierArguments
				(ModifierId,															Name,			Value)
SELECT DISTINCT	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType,				'ModifierId',	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType|| '_MODIFIER'
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO ModifierArguments
				(ModifierId,															Name,					Value)
SELECT DISTINCT	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType|| '_MODIFIER',	'GreatPersonClassType',	GreatPersonClassType
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

INSERT OR IGNORE INTO ModifierArguments
				(ModifierId,															Name,					Value)
SELECT DISTINCT	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType|| '_MODIFIER',	'Amount',				PointsPerTurn
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);

DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_DEFAULT_TRAIT' AND ModifierId LIKE 'P0K_TRAIT_BUILDING_%GREAT_PERSON_CLASS_%';

INSERT OR IGNORE INTO TraitModifiers
				(TraitType,					ModifierId)
SELECT DISTINCT	'MINOR_CIV_DEFAULT_TRAIT',	'P0K_TRAIT_' ||BuildingType|| '_' ||GreatPersonClassType
FROM Building_GreatPersonPoints WHERE BuildingType IN (SELECT BuildingType FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0);
--------------------------------------------------------------

-- Sweden - Minerva of the North
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
VALUES	('P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',	NULL),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR_YIELD_FAITH',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_ALTAR_JNR');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,		Value)
VALUES	('P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR',				'BuildingType',	'BUILDING_JNR_ALTAR'),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR',				'Amount',		50),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR_YIELD_FAITH',	'YieldType',	'YIELD_FAITH'),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR_YIELD_FAITH',	'Amount',		2);

UPDATE ModifierArguments SET Value=2	WHERE Name='Amount'	AND	ModifierId LIKE 'P0K_TRAIT_MINERVA_%';

INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 							ModifierId)
VALUES	('TRAIT_LEADER_KRISTINA_AUTO_THEME',	'P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR'),
		('TRAIT_LEADER_KRISTINA_AUTO_THEME',	'P0K_TRAIT_MINERVA_BUILDING_JNR_ALTAR_YIELD_FAITH');
--------------------------------------------------------------