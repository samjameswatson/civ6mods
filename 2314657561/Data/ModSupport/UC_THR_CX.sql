-- UC_CMP_CX
-- Author: JNR
--------------------------------------------------------------

-- America - Film Studio
--------------------------------------------------------------
UPDATE Buildings SET Maintenance=0 WHERE BuildingType='BUILDING_FILM_STUDIO';
--------------------------------------------------------------

-- Brazil - Magnanimous
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_THEATER_TIER1_JNR'	WHERE ModifierId='P0K_TRAIT_PRODUCTION_FROM_AMPHITHEATER';
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_THEATER_TIER2_JNR'	WHERE ModifierId='P0K_TRAIT_PRODUCTION_FROM_MUSEUM';
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_THEATER_TIER3_JNR'	WHERE ModifierId='P0K_TRAIT_PRODUCTION_FROM_BROADCAST_CENTER';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType,										SubjectRequirementSetId)
VALUES	('P0K_TRAIT_PRODUCTION_FROM_MEDIA_TOWER_JNR_UC',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'BUILDING_IS_THEATER_TIER4_JNR');

UPDATE ModifierArguments SET Value=1	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_PRODUCTION_FROM_AMPHITHEATER';
UPDATE ModifierArguments SET Value=2	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_PRODUCTION_FROM_MUSEUM';
UPDATE ModifierArguments SET Value=3	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_PRODUCTION_FROM_BROADCAST_CENTER';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,			Value)
VALUES	('P0K_TRAIT_PRODUCTION_FROM_MEDIA_TOWER_JNR_UC',	'YieldType',	'YIELD_PRODUCTION'),
		('P0K_TRAIT_PRODUCTION_FROM_MEDIA_TOWER_JNR_UC',	'Amount',		4);

UPDATE ModifierArguments SET Value=1	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_FOOD_FROM_LIBRARY';
UPDATE ModifierArguments SET Value=2	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_FOOD_FROM_UNIVERSITY';
UPDATE ModifierArguments SET Value=3	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_FOOD_FROM_RESEARCH_LAB';

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('TRAIT_LEADER_MAGNANIMOUS',	'P0K_TRAIT_PRODUCTION_FROM_MEDIA_TOWER_JNR_UC');
--------------------------------------------------------------

-- India - Gospel of the Charkha
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType)
VALUES	('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_ASSEMBLY',	'MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,			Value)
VALUES	('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_ASSEMBLY',	'BuildingType',	'BUILDING_JNR_ASSEMBLY');

INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 				ModifierId)
VALUES	('TRAIT_LEADER_SATYAGRAHA',	'P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_ASSEMBLY');
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
		(ModifierId,												ModifierType,											SubjectRequirementSetId)
VALUES	('P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',	NULL),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY_YIELD_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_ASSEMBLY_JNR');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,		Value)
VALUES	('P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY',					'BuildingType',	'BUILDING_JNR_ASSEMBLY'),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY',					'Amount',		50),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY_YIELD_CULTURE',	'YieldType',	'YIELD_CULTURE'),
		('P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY_YIELD_CULTURE',	'Amount',		2);

UPDATE ModifierArguments SET Value=2	WHERE Name='Amount'	AND	ModifierId LIKE 'P0K_TRAIT_MINERVA_%';

INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 							ModifierId)
VALUES	('TRAIT_LEADER_KRISTINA_AUTO_THEME',	'P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY'),
		('TRAIT_LEADER_KRISTINA_AUTO_THEME',	'P0K_TRAIT_MINERVA_BUILDING_JNR_ASSEMBLY_YIELD_CULTURE');
--------------------------------------------------------------

-- Eleanor - Court of Love
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType)
VALUES	('P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'),		
		('P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS_MODIFIER',	'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,					Value)
VALUES	('P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS',				'ModifierId',			'P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS_MODIFIER'),
		('P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS_MODIFIER',	'BuildingType',			'BUILDING_JNR_ASSEMBLY'),
		('P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS_MODIFIER',	'GreatWorkSlotType',	'GREATWORKSLOT_MUSIC'),
		('P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS_MODIFIER',	'Amount',				1);

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_LEADER_ELEANOR_LOYALTY',	'P0K_TRAIT_ASSEMBLY_GREAT_WORK_SLOTS');
--------------------------------------------------------------