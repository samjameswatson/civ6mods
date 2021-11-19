-- UC_ENT_Bonuses_Amenities
-- Author: JNR
--------------------------------------------------------------

-- Buildings_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Buildings_XP2
		(BuildingType,				RequiredPower,	EntertainmentBonusWithPower)
VALUES	('BUILDING_JNR_THEME_PARK',	3,				2),
		('BUILDING_JNR_FOOD_COURT',	3,				2);

UPDATE Buildings_XP2 SET EntertainmentBonusWithPower=0 WHERE BuildingType='BUILDING_STADIUM';
UPDATE Buildings_XP2 SET EntertainmentBonusWithPower=0 WHERE BuildingType='BUILDING_AQUATICS_CENTER';
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_JNR_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,										CollectionType,					EffectType)
VALUES	('MODIFIER_JNR_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'COLLECTION_PLAYER_DISTRICTS',	'EFFECT_ATTACH_MODIFIER');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,							ModifierType,										SubjectRequirementSetId)
VALUES	('JNR_ARENA_AMENITIES_GOVERNOR',		'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_GOVERNOR'),
		('JNR_STADIUM_AMENITIES_2_SPECIALTY',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_2_SPECIALTY_DISTRICTS_JNR_POWERED'),
		('JNR_STADIUM_AMENITIES_4_SPECIALTY',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_4_SPECIALTY_DISTRICTS_JNR'),
		('JNR_STADIUM_AMENITIES_6_SPECIALTY',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_6_SPECIALTY_DISTRICTS_JNR_POWERED'),
		('JNR_STADIUM_AMENITIES_8_SPECIALTY',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_8_SPECIALTY_DISTRICTS_JNR'),
		('JNR_STADIUM_AMENITIES_10_SPECIALTY',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_10_SPECIALTY_DISTRICTS_JNR_POWERED'),
		('JNR_STADIUM_AMENITIES_12_SPECIALTY',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'CITY_HAS_12_SPECIALTY_DISTRICTS_JNR'),
		('JNR_MARINA_AMENITIES_ATTACH',			'MODIFIER_JNR_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'MARINA_AMENITIES_REQUIREMENTS_JNR'),
		('JNR_MARINA_AMENITIES_FISHING_BOATS',	'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		NULL),

		('JNR_TLACHTLI_AMENITIES_WAR',			'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'PLAYER_IS_AT_WAR_JNR');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('JNR_ARENA_AMENITIES_GOVERNOR',		'Amount',		1),
		('JNR_STADIUM_AMENITIES_2_SPECIALTY',	'Amount',		1),
		('JNR_STADIUM_AMENITIES_4_SPECIALTY',	'Amount',		1),
		('JNR_STADIUM_AMENITIES_6_SPECIALTY',	'Amount',		1),
		('JNR_STADIUM_AMENITIES_8_SPECIALTY',	'Amount',		1),
		('JNR_STADIUM_AMENITIES_10_SPECIALTY',	'Amount',		1),
		('JNR_STADIUM_AMENITIES_12_SPECIALTY',	'Amount',		1),
		('JNR_MARINA_AMENITIES_ATTACH',			'ModifierId',	'JNR_MARINA_AMENITIES_FISHING_BOATS'),
		('JNR_MARINA_AMENITIES_FISHING_BOATS',	'Amount',		1),

		('JNR_TLACHTLI_AMENITIES_WAR',			'Amount',		1);
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,					ModifierId)
VALUES	('BUILDING_ARENA',				'JNR_ARENA_AMENITIES_GOVERNOR'),
		('BUILDING_STADIUM',			'JNR_STADIUM_AMENITIES_2_SPECIALTY'),
		('BUILDING_STADIUM',			'JNR_STADIUM_AMENITIES_4_SPECIALTY'),
		('BUILDING_STADIUM',			'JNR_STADIUM_AMENITIES_6_SPECIALTY'),
		('BUILDING_STADIUM',			'JNR_STADIUM_AMENITIES_8_SPECIALTY'),
		('BUILDING_STADIUM',			'JNR_STADIUM_AMENITIES_10_SPECIALTY'),
		('BUILDING_STADIUM',			'JNR_STADIUM_AMENITIES_12_SPECIALTY'),
		('BUILDING_AQUATICS_CENTER',	'JNR_STADIUM_AMENITIES_2_SPECIALTY'),
		('BUILDING_AQUATICS_CENTER',	'JNR_STADIUM_AMENITIES_4_SPECIALTY'),
		('BUILDING_AQUATICS_CENTER',	'JNR_STADIUM_AMENITIES_6_SPECIALTY'),
		('BUILDING_AQUATICS_CENTER',	'JNR_STADIUM_AMENITIES_8_SPECIALTY'),
		('BUILDING_AQUATICS_CENTER',	'JNR_STADIUM_AMENITIES_10_SPECIALTY'),
		('BUILDING_AQUATICS_CENTER',	'JNR_STADIUM_AMENITIES_12_SPECIALTY'),

		('BUILDING_TLACHTLI',			'JNR_TLACHTLI_AMENITIES_WAR');
--------------------------------------------------------------

-- ImprovementModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO ImprovementModifiers
		(ImprovementType,				ModifierId)
VALUES	('IMPROVEMENT_FISHING_BOATS',	'JNR_MARINA_AMENITIES_ATTACH');
--------------------------------------------------------------