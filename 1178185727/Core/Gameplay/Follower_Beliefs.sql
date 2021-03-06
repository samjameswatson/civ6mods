--=============================================================================================================
-- RELIGION EXPANDED: FOLLOWER BELIEFS
--=============================================================================================================
-- Types
---------------------------------------------------------------------------------------------------------------
INSERT INTO Types 
		(Type,								Kind)
VALUES	('BELIEF_P0K_HIERATIC_SCRIPT',		'KIND_BELIEF'),
		('BELIEF_P0K_WORSHIP_OF_WEALTH',	'KIND_BELIEF'),
		('BELIEF_P0K_PROSPERITY_DOCTRINE',	'KIND_BELIEF'),
		('BELIEF_P0K_WORKS_RIGHTEOUSNESS',	'KIND_BELIEF'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'KIND_BELIEF'),
		('BELIEF_P0K_FERVENT_SPIRIT',		'KIND_BELIEF'),
		('BELIEF_P0K_FESTIVAL_PROCESSIONS',	'KIND_BELIEF'),
		('BELIEF_P0K_HOLY_SANCTUARIES',		'KIND_BELIEF');	
---------------------------------------------------------------------------------------------------------------
-- Beliefs
---------------------------------------------------------------------------------------------------------------
INSERT INTO Beliefs		
		(BeliefType,						Name,										Description,										BeliefClassType) 
VALUES	('BELIEF_P0K_HIERATIC_SCRIPT',		'LOC_BELIEF_P0K_HIERATIC_SCRIPT_NAME',		'LOC_BELIEF_P0K_HIERATIC_SCRIPT_DESCRIPTION',		'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_WORSHIP_OF_WEALTH',	'LOC_BELIEF_P0K_WORSHIP_OF_WEALTH_NAME',	'LOC_BELIEF_P0K_WORSHIP_OF_WEALTH_DESCRIPTION',		'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_PROSPERITY_DOCTRINE',	'LOC_BELIEF_P0K_PROSPERITY_DOCTRINE_NAME',	'LOC_BELIEF_P0K_PROSPERITY_DOCTRINE_DESCRIPTION',	'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_WORKS_RIGHTEOUSNESS',	'LOC_BELIEF_P0K_WORKS_RIGHTEOUSNESS_NAME',	'LOC_BELIEF_P0K_WORKS_RIGHTEOUSNESS_DESCRIPTION',	'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'LOC_BELIEF_P0K_BLESSED_DEDICATIONS_NAME',	'LOC_BELIEF_P0K_BLESSED_DEDICATIONS_DESCRIPTION',	'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_FERVENT_SPIRIT',		'LOC_BELIEF_P0K_FERVENT_SPIRIT_NAME',		'LOC_BELIEF_P0K_FERVENT_SPIRIT_DESCRIPTION',		'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_FESTIVAL_PROCESSIONS',	'LOC_BELIEF_P0K_FESTIVAL_PROCESSIONS_NAME',	'LOC_BELIEF_P0K_FESTIVAL_PROCESSIONS_DESCRIPTION',	'BELIEF_CLASS_FOLLOWER'),
		('BELIEF_P0K_HOLY_SANCTUARIES',		'LOC_BELIEF_P0K_HOLY_SANCTUARIES_NAME',		'LOC_BELIEF_P0K_HOLY_SANCTUARIES_DESCRIPTION',		'BELIEF_CLASS_FOLLOWER');
---------------------------------------------------------------------------------------------------------------
-- BeliefModifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO BeliefModifiers 
		(BeliefType,						ModifierId) 
VALUES	('BELIEF_P0K_HIERATIC_SCRIPT',		'P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE'),	
		('BELIEF_P0K_HIERATIC_SCRIPT',		'P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE'),	
		('BELIEF_P0K_WORSHIP_OF_WEALTH',	'P0K_WORSHIP_OF_WEALTH_WONDER_GOLD'),
		('BELIEF_P0K_PROSPERITY_DOCTRINE',	'P0K_PROSPERITY_DOCTRINE_GOLD_BUILDINGS'),	
		('BELIEF_P0K_PROSPERITY_DOCTRINE',	'P0K_PROSPERITY_DOCTRINE_AMENITY_BUILDINGS'),
		('BELIEF_P0K_WORKS_RIGHTEOUSNESS',	'P0K_WORKS_RIGHTEOUSNESS_PRODUCTION_BUILDINGS'),	
		('BELIEF_P0K_WORKS_RIGHTEOUSNESS',	'P0K_WORKS_RIGHTEOUSNESS_HARBOR_BUILDINGS'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE'),
		('BELIEF_P0K_BLESSED_DEDICATIONS',	'P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH'),
		('BELIEF_P0K_FERVENT_SPIRIT',		'P0K_FERVENT_SPIRIT_BUILDER_MOVEMENT'),
		('BELIEF_P0K_FESTIVAL_PROCESSIONS',	'P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE'),
		('BELIEF_P0K_HOLY_SANCTUARIES',		'P0K_HOLY_SANCTUARIES_AMENITY'),
		('BELIEF_P0K_HOLY_SANCTUARIES',		'P0K_HOLY_SANCTUARIES_HOUSING');
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('P0K_RELIGION_REQUIRES_UNIT_IS_SETTLER',	'REQUIREMENT_UNIT_TYPE_MATCHES'),
		('P0K_RELIGION_REQUIRES_CITY_HAS_WONDER',	'REQUIREMENT_CITY_HAS_ANY_WONDER'); -- No argument
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,								Name,		Value)
VALUES	('P0K_RELIGION_REQUIRES_UNIT_IS_SETTLER',	'UnitType',	'UNIT_SETTLER');
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('P0K_RELIGION_UNIT_IS_BUILDER_OR_SETTLER',	'REQUIREMENTSET_TEST_ANY'),
		('P0K_RELIGION_CITY_HAS_WONDER',			'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('P0K_RELIGION_UNIT_IS_BUILDER_OR_SETTLER',	'REQUIREMENT_UNIT_IS_BUILDER'),
		('P0K_RELIGION_UNIT_IS_BUILDER_OR_SETTLER',	'P0K_RELIGION_REQUIRES_UNIT_IS_SETTLER'),
		('P0K_RELIGION_CITY_HAS_WONDER',			'P0K_RELIGION_REQUIRES_CITY_HAS_WONDER');
---------------------------------------------------------------------------------------------------------------
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers 
		(ModifierId,												ModifierType,													SubjectRequirementSetId) 
VALUES	('P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE',						'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE_MODIFIER',				'MODIFIER_BUILDING_YIELD_CHANGE',								NULL),
		('P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE',						'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE_MODIFIER',				'MODIFIER_BUILDING_YIELD_CHANGE',								NULL),
		('P0K_WORSHIP_OF_WEALTH_WONDER_GOLD',						'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_WORSHIP_OF_WEALTH_WONDER_GOLD_MODIFIER',				'MODIFIER_SINGLE_CITY_ADJUST_WONDER_YIELD_CHANGE',				NULL),
		('P0K_PROSPERITY_DOCTRINE_GOLD_BUILDINGS',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_PROSPERITY_DOCTRINE_GOLD_BUILDINGS_MODIFIER',			'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE',					NULL),
		('P0K_PROSPERITY_DOCTRINE_AMENITY_BUILDINGS',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_PROSPERITY_DOCTRINE_AMENITY_BUILDINGS_MODIFIER',		'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE',					NULL),
		('P0K_WORKS_RIGHTEOUSNESS_PRODUCTION_BUILDINGS',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_WORKS_RIGHTEOUSNESS_PRODUCTION_BUILDINGS_MODIFIER',	'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE',					NULL),
		('P0K_WORKS_RIGHTEOUSNESS_HARBOR_BUILDINGS',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_WORKS_RIGHTEOUSNESS_HARBOR_BUILDINGS_MODIFIER',		'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE',					NULL),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH_MODIFIER',			'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',					NULL),
		('P0K_FERVENT_SPIRIT_BUILDER_MOVEMENT',						'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_FERVENT_SPIRIT_BUILDER_MOVEMENT_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',			'P0K_RELIGION_UNIT_IS_BUILDER_OR_SETTLER'),
		('P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE_MODIFIER',		'MODIFIER_FOLLOWER_YIELD_MODIFIER',								NULL),
		('P0K_HOLY_SANCTUARIES_AMENITY',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_HOLY_SANCTUARIES_AMENITY_MODIFIER',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_AMENITIES_FROM_RELIGION',		'P0K_RELIGION_CITY_HAS_WONDER'),
		('P0K_HOLY_SANCTUARIES_HOUSING',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('P0K_HOLY_SANCTUARIES_HOUSING_MODIFIER',					'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_HOUSING',					'P0K_RELIGION_CITY_HAS_WONDER');
---------------------------------------------------------------------------------------------------------------
--ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments 
		(ModifierId,												Name,					Value)
VALUES	('P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE',						'ModifierId',			'P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE_MODIFIER'),
		('P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE_MODIFIER',				'BuildingType',			'BUILDING_SHRINE'),
		('P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE_MODIFIER',				'YieldType',			'YIELD_SCIENCE'),
		('P0K_HIERATIC_SCRIPT_SHRINE_SCIENCE_MODIFIER',				'Amount',				2),
		('P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE',						'ModifierId',			'P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE_MODIFIER'),
		('P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE_MODIFIER',				'BuildingType',			'BUILDING_TEMPLE'),
		('P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE_MODIFIER',				'YieldType',			'YIELD_SCIENCE'),
		('P0K_HIERATIC_SCRIPT_TEMPLE_SCIENCE_MODIFIER',				'Amount',				4),
		('P0K_WORSHIP_OF_WEALTH_WONDER_GOLD',						'ModifierId',			'P0K_WORSHIP_OF_WEALTH_WONDER_GOLD_MODIFIER'),
		('P0K_WORSHIP_OF_WEALTH_WONDER_GOLD_MODIFIER',				'YieldType',			'YIELD_GOLD'),
		('P0K_WORSHIP_OF_WEALTH_WONDER_GOLD_MODIFIER',				'Amount',				8),
		('P0K_PROSPERITY_DOCTRINE_GOLD_BUILDINGS',					'ModifierId',			'P0K_PROSPERITY_DOCTRINE_GOLD_BUILDINGS_MODIFIER'),
		('P0K_PROSPERITY_DOCTRINE_GOLD_BUILDINGS_MODIFIER',			'DistrictType',			'DISTRICT_COMMERCIAL_HUB'),
		('P0K_PROSPERITY_DOCTRINE_AMENITY_BUILDINGS',				'ModifierId',			'P0K_PROSPERITY_DOCTRINE_AMENITY_BUILDINGS_MODIFIER'),
		('P0K_PROSPERITY_DOCTRINE_AMENITY_BUILDINGS_MODIFIER',		'DistrictType',			'DISTRICT_ENTERTAINMENT_COMPLEX'),
		('P0K_WORKS_RIGHTEOUSNESS_PRODUCTION_BUILDINGS',			'ModifierId',			'P0K_WORKS_RIGHTEOUSNESS_PRODUCTION_BUILDINGS_MODIFIER'),
		('P0K_WORKS_RIGHTEOUSNESS_PRODUCTION_BUILDINGS_MODIFIER',	'DistrictType',			'DISTRICT_INDUSTRIAL_ZONE'),
		('P0K_WORKS_RIGHTEOUSNESS_HARBOR_BUILDINGS',				'ModifierId',			'P0K_WORKS_RIGHTEOUSNESS_HARBOR_BUILDINGS_MODIFIER'),
		('P0K_WORKS_RIGHTEOUSNESS_HARBOR_BUILDINGS_MODIFIER',		'DistrictType',			'DISTRICT_HARBOR'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE',				'ModifierId',			'P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_RELIGIOUS'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE_MODIFIER',		'YieldType',			'YIELD_CULTURE'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_CULTURE_MODIFIER',		'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH',					'ModifierId',			'P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_RELIGIOUS'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH_MODIFIER',		'YieldType',			'YIELD_FAITH'),
		('P0K_BLESSED_DEDICATIONS_RELIGIOUS_FAITH_MODIFIER',		'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE',				'ModifierId',			'P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_SCULPTURE'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE_MODIFIER',		'YieldType',			'YIELD_CULTURE'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_CULTURE_MODIFIER',		'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH',					'ModifierId',			'P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_SCULPTURE'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH_MODIFIER',		'YieldType',			'YIELD_FAITH'),
		('P0K_BLESSED_DEDICATIONS_SCULPTURE_FAITH_MODIFIER',		'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE',				'ModifierId',			'P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_PORTRAIT'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE_MODIFIER',		'YieldType',			'YIELD_CULTURE'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_CULTURE_MODIFIER',		'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH',					'ModifierId',			'P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH_MODIFIER',			'GreatWorkObjectType',	'GREATWORKOBJECT_PORTRAIT'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH_MODIFIER',			'YieldType',			'YIELD_FAITH'),
		('P0K_BLESSED_DEDICATIONS_PORTRAIT_FAITH_MODIFIER',			'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE',				'ModifierId',			'P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_LANDSCAPE'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE_MODIFIER',		'YieldType',			'YIELD_CULTURE'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_CULTURE_MODIFIER',		'YieldChange',			2),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH',					'ModifierId',			'P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH_MODIFIER'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH_MODIFIER',		'GreatWorkObjectType',	'GREATWORKOBJECT_LANDSCAPE'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH_MODIFIER',		'YieldType',			'YIELD_FAITH'),
		('P0K_BLESSED_DEDICATIONS_LANDSCAPE_FAITH_MODIFIER',		'YieldChange',			2),
		('P0K_FERVENT_SPIRIT_BUILDER_MOVEMENT',						'ModifierId',			'P0K_FERVENT_SPIRIT_BUILDER_MOVEMENT_MODIFIER'),
		('P0K_FERVENT_SPIRIT_BUILDER_MOVEMENT_MODIFIER',			'AbilityType',			'ABILITY_P0K_FERVENT_SPIRIT'),
		('P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE',				'ModifierId',			'P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE_MODIFIER'),
		('P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE_MODIFIER',		'YieldType',			'YIELD_CULTURE'),
		('P0K_FESTIVAL_PROCESSIONS_FOLLOWER_CULTURE_MODIFIER',		'Amount',				1),
		('P0K_HOLY_SANCTUARIES_AMENITY',							'ModifierId',			'P0K_HOLY_SANCTUARIES_AMENITY_MODIFIER'),
		('P0K_HOLY_SANCTUARIES_AMENITY_MODIFIER',					'Amount',				2),
		('P0K_HOLY_SANCTUARIES_HOUSING',							'ModifierId',			'P0K_HOLY_SANCTUARIES_HOUSING_MODIFIER'),
		('P0K_HOLY_SANCTUARIES_HOUSING_MODIFIER',					'Amount',				2);
