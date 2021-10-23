-- UC_AQD_Policies
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,						Kind)
VALUES	('POLICY_JNR_RESERVOIRS',	'KIND_POLICY');
--------------------------------------------------------------

--------------------------------------------------------------
INSERT OR IGNORE INTO Policies	
		(PolicyType,				Name, 								Description, 								PrereqCivic, 				GovernmentSlotType)
VALUES	('POLICY_JNR_RESERVOIRS', 	'LOC_POLICY_JNR_RESERVOIRS_NAME', 	'LOC_POLICY_JNR_RESERVOIRS_DESCRIPTION',	'CIVIC_RECORDED_HISTORY', 	'SLOT_ECONOMIC');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,						ModifierType,							SubjectRequirementSetId)
VALUES	('JNR_RESERVOIRS_FOOD_WATER_WORKS',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_IS_FARM_WATER_WORKS_ADJACENT_REQUIREMENTS_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,						Name,			Value)
VALUES	('JNR_RESERVOIRS_FOOD_WATER_WORKS',	'YieldType',	'YIELD_FOOD'),
		('JNR_RESERVOIRS_FOOD_WATER_WORKS',	'Amount',		1);
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType, 				ModifierId)
VALUES	('POLICY_JNR_RESERVOIRS', 	'JNR_RESERVOIRS_FOOD_WATER_WORKS');
--------------------------------------------------------------