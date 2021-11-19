-- UC_ENT_CX
-- Author: JNR
--------------------------------------------------------------

-- India - Gospel of the Charkha
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType)
VALUES	('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_TOURNEY',	'MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'),
		('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_MARINA',	'MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE');

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,			Value)
VALUES	('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_TOURNEY',	'BuildingType',	'BUILDING_JNR_TOURNEY'),
		('P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_MARINA',	'BuildingType',	'BUILDING_JNR_MARINA');

INSERT OR IGNORE INTO TraitModifiers 
		(TraitType, 				ModifierId)
VALUES	('TRAIT_LEADER_SATYAGRAHA',	'P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_TOURNEY'),
		('TRAIT_LEADER_SATYAGRAHA',	'P0K_TRAIT_FAITH_PURCHASE_BUILDING_JNR_MARINA');
--------------------------------------------------------------

-- currently, Minerva of the North does not apply to Entertainment districts.

---- Sweden - Minerva of the North

----------------------------------------------------------------
--INSERT OR IGNORE INTO Modifiers
		--(ModifierId,								ModifierType)
--VALUES	('P0K_TRAIT_MINERVA_BUILDING_JNR_TOURNEY',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
		--('P0K_TRAIT_MINERVA_BUILDING_JNR_MARINA',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
--
--INSERT OR IGNORE INTO ModifierArguments
		--(ModifierId,								Name,		Value)
--VALUES	('P0K_TRAIT_MINERVA_BUILDING_JNR_TOURNEY',	'BuildingType',	'BUILDING_JNR_TOURNEY'),
		--('P0K_TRAIT_MINERVA_BUILDING_JNR_TOURNEY',	'Amount',		50),
		--('P0K_TRAIT_MINERVA_BUILDING_JNR_MARINA',	'BuildingType',	'BUILDING_JNR_MARINA'),
		--('P0K_TRAIT_MINERVA_BUILDING_JNR_MARINA',	'Amount',		50);
--
--UPDATE ModifierArguments SET Value=2	WHERE Name='Amount'	AND	ModifierId LIKE 'P0K_TRAIT_MINERVA_%';
--
--INSERT OR IGNORE INTO TraitModifiers 
		--(TraitType, 							ModifierId)
--VALUES	('TRAIT_LEADER_KRISTINA_AUTO_THEME',	'P0K_TRAIT_MINERVA_BUILDING_JNR_TOURNEY'),
		--('TRAIT_LEADER_KRISTINA_AUTO_THEME',	'P0K_TRAIT_MINERVA_BUILDING_JNR_MARINA');
----------------------------------------------------------------