-- UC_THR_City_States_GS
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType,											SubjectRequirementSetId)
VALUES	('MINOR_CIV_CULTURAL_MEDIUM_INFLUENCE_BONUS_ASSEMBLY_JNR',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_HAS_MEDIUM_INFLUENCE'),
		('MINOR_CIV_CULTURAL_YIELD_FOR_ASSEMBLY_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,				Value)
VALUES	('MINOR_CIV_CULTURAL_MEDIUM_INFLUENCE_BONUS_ASSEMBLY_JNR',	'ModifierId',		'MINOR_CIV_CULTURAL_YIELD_FOR_ASSEMBLY_JNR'),
		('MINOR_CIV_CULTURAL_YIELD_FOR_ASSEMBLY_JNR',				'BuildingType',		'BUILDING_JNR_ASSEMBLY'),
		('MINOR_CIV_CULTURAL_YIELD_FOR_ASSEMBLY_JNR',				'YieldType',		'YIELD_CULTURE'),
		('MINOR_CIV_CULTURAL_YIELD_FOR_ASSEMBLY_JNR',				'Amount',			2),
		('MINOR_CIV_CULTURAL_YIELD_FOR_ASSEMBLY_JNR',				'CityStatesOnly',	1);

UPDATE ModifierArguments SET Value='BUILDING_JNR_CABINET'	WHERE Name='BuildingType' AND ModifierId='MINOR_CIV_CULTURAL_YIELD_FOR_ART';
UPDATE ModifierArguments SET Value='BUILDING_JNR_MANSION'		WHERE Name='BuildingType' AND ModifierId='MINOR_CIV_CULTURAL_YIELD_FOR_ARTIFACT';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
VALUES	('MINOR_CIV_CULTURAL_TRAIT',	'MINOR_CIV_CULTURAL_MEDIUM_INFLUENCE_BONUS_ASSEMBLY_JNR');
--------------------------------------------------------------