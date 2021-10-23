-- UC_CMP_Bonuses_Special
-- Author: JNR
--------------------------------------------------------------

-- Building_GreatPersonPoints
--------------------------------------------------------------
DELETE FROM Building_GreatPersonPoints WHERE BuildingType='BUILDING_MUSEUM_ART';
DELETE FROM Building_GreatPersonPoints WHERE BuildingType='BUILDING_MUSEUM_ARTIFACT';

INSERT OR IGNORE INTO Building_GreatPersonPoints
		(BuildingType,					GreatPersonClassType,			PointsPerTurn)
VALUES	('BUILDING_JNR_ASSEMBLY',		'GREAT_PERSON_CLASS_WRITER',	1),
		('BUILDING_JNR_CABINET',		'GREAT_PERSON_CLASS_WRITER',	1),
		('BUILDING_JNR_MANSION',		'GREAT_PERSON_CLASS_WRITER',	1),
		('BUILDING_JNR_GRAND_HOTEL',	'GREAT_PERSON_CLASS_WRITER',	1),
		
		('BUILDING_JNR_CABINET',		'GREAT_PERSON_CLASS_ARTIST',	2),
		('BUILDING_JNR_MANSION',		'GREAT_PERSON_CLASS_ARTIST',	2),
		('BUILDING_JNR_GRAND_HOTEL',	'GREAT_PERSON_CLASS_ARTIST',	1),
		('BUILDING_MUSEUM_ART',			'GREAT_PERSON_CLASS_ARTIST',	1),
		('BUILDING_JNR_MEDIA_CENTER',	'GREAT_PERSON_CLASS_ARTIST',	1),

		('BUILDING_JNR_OPERA',			'GREAT_PERSON_CLASS_MUSICIAN',	2),
		('BUILDING_JNR_GRAND_HOTEL',	'GREAT_PERSON_CLASS_MUSICIAN',	1),
		('BUILDING_JNR_MEDIA_CENTER',	'GREAT_PERSON_CLASS_MUSICIAN',	2);
--------------------------------------------------------------

-- Building_GreatWorks
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatWorks
		(BuildingType,					GreatWorkSlotType,			NumSlots)
VALUES	('BUILDING_JNR_ASSEMBLY',		'GREATWORKSLOT_WRITING',	1),
		('BUILDING_JNR_CABINET',		'GREATWORKSLOT_PALACE',		2),
		('BUILDING_JNR_MANSION',		'GREATWORKSLOT_ART',		2),
		('BUILDING_JNR_OPERA',			'GREATWORKSLOT_WRITING',	1),
		('BUILDING_JNR_OPERA',			'GREATWORKSLOT_MUSIC',		2),
		('BUILDING_JNR_GRAND_HOTEL',	'GREATWORKSLOT_PALACE',		1),
		('BUILDING_JNR_MEDIA_CENTER',	'GREATWORKSLOT_MUSIC',		1);

UPDATE Building_GreatWorks SET NumSlots=2 WHERE BuildingType='BUILDING_JNR_DOJO' AND GreatWorkSlotType='GREATWORKSLOT_ART';
--------------------------------------------------------------

-- Building_TourismBombs_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,					TourismBombValue)
SELECT	'BUILDING_JNR_ASSEMBLY',		TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_AMPHITHEATER';

INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,					TourismBombValue)
SELECT	'BUILDING_JNR_OPERA',			TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_AMPHITHEATER';

INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,					TourismBombValue)
SELECT	'BUILDING_JNR_GRAND_HOTEL',		TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_AMPHITHEATER';

INSERT OR IGNORE INTO Building_TourismBombs_XP2
		(BuildingType,					TourismBombValue)
SELECT	'BUILDING_JNR_MEDIA_CENTER',	TourismBombValue
FROM	Building_TourismBombs_XP2
WHERE	BuildingType='BUILDING_BROADCAST_CENTER';
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,																	Kind)
VALUES	('MODIFIER_JNR_CITY_ADJUST_IDENTITY_PER_CITIZEN',						'KIND_MODIFIER'),
		('MODIFIER_JNR_CITY_DISTRICT_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,															CollectionType,		EffectType)
VALUES	('MODIFIER_JNR_CITY_ADJUST_IDENTITY_PER_CITIZEN',						'COLLECTION_OWNER',	'EFFECT_ADJUST_CITY_IDENTITY_PER_CITIZEN'),
		('MODIFIER_JNR_CITY_DISTRICT_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',	'COLLECTION_OWNER',	'EFFECT_ADJUST_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,								ModifierType)
VALUES	('JNR_ASSEMBLY_LOYALTY',					'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN'),
		('JNR_MANSION_LOYALTY',						'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN'),
		('JNR_GRAND_HOTEL_LOYALTY_PRESSURE',		'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PRESSURE'),
		('JNR_BROADCAST_TOWER_LOYALTY_PRESSURE',	'MODIFIER_JNR_CITY_ADJUST_IDENTITY_PER_CITIZEN'),
		('JNR_GRAND_HOTEL_TOURISM_ADJACENCY',		'MODIFIER_JNR_CITY_DISTRICT_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('JNR_ASSEMBLY_LOYALTY',					'Amount',		2),
		('JNR_MANSION_LOYALTY',						'Amount',		2),
		('JNR_GRAND_HOTEL_LOYALTY_PRESSURE',		'Amount',		1),
		('JNR_BROADCAST_TOWER_LOYALTY_PRESSURE',	'Amount',		0.5),
		('JNR_GRAND_HOTEL_TOURISM_ADJACENCY',		'YieldType',	'YIELD_CULTURE'),
		('JNR_GRAND_HOTEL_TOURISM_ADJACENCY',		'Amount',		100);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
VALUES	('BUILDING_JNR_ASSEMBLY',		'JNR_ASSEMBLY_LOYALTY'),
		('BUILDING_MARAE',				'JNR_ASSEMBLY_LOYALTY'),
		('BUILDING_JNR_MANSION',		'JNR_MANSION_LOYALTY'),
		('BUILDING_JNR_GRAND_HOTEL',	'JNR_GRAND_HOTEL_LOYALTY_PRESSURE'),
		('BUILDING_BROADCAST_CENTER',	'JNR_BROADCAST_TOWER_LOYALTY_PRESSURE'),
		('BUILDING_FILM_STUDIO',		'JNR_BROADCAST_TOWER_LOYALTY_PRESSURE'),
		('BUILDING_JNR_GRAND_HOTEL',	'JNR_GRAND_HOTEL_TOURISM_ADJACENCY');

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
SELECT	BuildingType,					'JNR_MANSION_LOYALTY'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_DOJO';
--------------------------------------------------------------