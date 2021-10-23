-- UC_PRD_Bonuses_Special
-- Author: JNR
--------------------------------------------------------------

-- Building_GreatPersonPoints
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatPersonPoints
		(BuildingType,						GreatPersonClassType,			PointsPerTurn)
VALUES	('BUILDING_WATER_MILL',				'GREAT_PERSON_CLASS_ENGINEER',	1),
		('BUILDING_JNR_WIND_MILL',			'GREAT_PERSON_CLASS_ENGINEER',	1),
		('BUILDING_JNR_MANUFACTURY',		'GREAT_PERSON_CLASS_ENGINEER',	1),
		('BUILDING_JNR_CHEMICAL',			'GREAT_PERSON_CLASS_ENGINEER',	1),
		('BUILDING_JNR_FREIGHT_YARD',		'GREAT_PERSON_CLASS_ENGINEER',	1);
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,														Kind)
VALUES	('MODIFIER_JNR_SINGLE_CITY_ADJUST_ALL_PROJECTS_PRODUCTION',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,												CollectionType,		EffectType)
VALUES	('MODIFIER_JNR_SINGLE_CITY_ADJUST_ALL_PROJECTS_PRODUCTION',	'COLLECTION_OWNER',	'EFFECT_ADJUST_ALL_PROJECTS_PRODUCTION');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
VALUES	('JNR_COAL_POWER_PLANT_APPEAL_PENALTY',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL'),
		('JNR_FOSSILE_FUEL_POWER_PLANT_APPEAL_PENALTY',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL'),
		('JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP',		'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
		('JNR_KANBAN_LOGISTICS_PROJECTS_PRODUCTION',	'MODIFIER_JNR_SINGLE_CITY_ADJUST_ALL_PROJECTS_PRODUCTION');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,		Value)
VALUES	('JNR_COAL_POWER_PLANT_APPEAL_PENALTY',			'Amount',	-2),
		('JNR_FOSSILE_FUEL_POWER_PLANT_APPEAL_PENALTY',	'Amount',	-1),
		('JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP',		'Amount',	20),
		('JNR_KANBAN_LOGISTICS_PROJECTS_PRODUCTION',	'Amount',	20);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,							ModifierId)
VALUES	('BUILDING_COAL_POWER_PLANT',			'JNR_COAL_POWER_PLANT_APPEAL_PENALTY'),
		('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'JNR_FOSSILE_FUEL_POWER_PLANT_APPEAL_PENALTY'),
		('BUILDING_JNR_FREIGHT_YARD',			'JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP'),
		('BUILDING_ELECTRONICS_FACTORY',		'JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP');
--------------------------------------------------------------