-- UC_REL_Worship_Bonuses_Special
-- Author: JNR
--------------------------------------------------------------

-- Building_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_YieldChanges
		(BuildingType,				YieldType,			YieldChange)
VALUES	('BUILDING_JNR_CANDI',		'YIELD_GOLD',		4),
		('BUILDING_CATHEDRAL',		'YIELD_CULTURE',	2),
		('BUILDING_JNR_MBARI',		'YIELD_FOOD',		2),
		('BUILDING_JNR_JINJA',		'YIELD_CULTURE',	2),
		('BUILDING_MOSQUE',			'YIELD_SCIENCE',	2),
		('BUILDING_JNR_SOBOR',		'YIELD_GOLD',		4),
		('BUILDING_JNR_TZACUALLI',	'YIELD_PRODUCTION',	2);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,				ModifierId)
VALUES	('BUILDING_JNR_PERIPTEROS',	'PAGODA_ADJUST_FAVOR');
--------------------------------------------------------------

-- GreatWork_ValidSubTypes
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatWork_ValidSubTypes
		(GreatWorkSlotType, GreatWorkObjectType)
VALUES	('GREATWORKSLOT_CATHEDRAL', 'GREATWORKOBJECT_RELIC'),
		('GREATWORKSLOT_CATHEDRAL', 'GREATWORKOBJECT_MUSIC');
--------------------------------------------------------------

-- Building_GreatWorks
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_GreatWorks
		(BuildingType,				GreatWorkSlotType,			NumSlots)
VALUES	('BUILDING_JNR_CANDI',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_CATHEDRAL',		'GREATWORKSLOT_CATHEDRAL',	1),
		('BUILDING_JNR_DAOGUAN',	'GREATWORKSLOT_RELIC',		1),
		('BUILDING_DAR_E_MEHR',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_MBARI',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_JINJA',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_GURDWARA',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_KHALWAT',	'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_MANDIR',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_MEETING_HOUSE',	'GREATWORKSLOT_RELIC',		1),
		('BUILDING_MOSQUE',			'GREATWORKSLOT_RELIC',		1),
		('BUILDING_PAGODA',			'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_PERIPTEROS',	'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_SOBOR',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_STUPA',			'GREATWORKSLOT_RELIC',		2),
		('BUILDING_SYNAGOGUE',		'GREATWORKSLOT_RELIC',		1),
		('BUILDING_JNR_TZACUALLI',	'GREATWORKSLOT_RELIC',		1),
		('BUILDING_WAT',			'GREATWORKSLOT_RELIC',		1);
--------------------------------------------------------------

