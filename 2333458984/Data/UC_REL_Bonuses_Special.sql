-- UC_REL_Bonuses_Special
-- Author: JNR
--------------------------------------------------------------

-- Building_GreatPersonPoints
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatPersonPoints
		(BuildingType,				GreatPersonClassType,			PointsPerTurn)
VALUES	('BUILDING_JNR_ALTAR',		'GREAT_PERSON_CLASS_PROPHET',	1),
		('BUILDING_JNR_MONASTERY',	'GREAT_PERSON_CLASS_PROPHET',	1);
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,				ModifierType)
VALUES	('JNR_HOSPITIUM_TOURISM',	'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
		('JNR_GARDEN_GREAT_PEOPLE',	'MODIFIER_CITY_INCREASE_GREAT_PERSON_POINT_BONUS');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,				Name,				Value)
VALUES	('JNR_HOSPITIUM_TOURISM',	'Religious',		1),
		('JNR_HOSPITIUM_TOURISM',	'ScalingFactor',	125),
		('JNR_GARDEN_GREAT_PEOPLE',	'Amount',			10);	
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
VALUES	('BUILDING_JNR_HOSPITIUM',	'JNR_HOSPITIUM_TOURISM'),
		('BUILDING_JNR_GARDEN',		'JNR_GARDEN_GREAT_PEOPLE');
--------------------------------------------------------------