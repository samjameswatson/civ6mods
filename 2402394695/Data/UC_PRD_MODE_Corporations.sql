-- UC_PRD_MODE_Corporations
-- Author: JNR
--------------------------------------------------------------

-- PopulationReference 
-- (thanks Chrisy15! - and to p0kiehl for implementing it in "Production from Population")
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ProductReference
    (
    Copy TEXT
    );
 
INSERT OR IGNORE INTO ProductReference
		(Copy)
VALUES	('0'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'),
		('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('G'), ('H'), ('I'), ('J'), ('K'), ('L'), ('M'),
		('N'), ('O'), ('P'), ('Q'), ('R'), ('S'), ('T'), ('U'), ('V'), ('W'), ('X'), ('Y'), ('Z');
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
UPDATE Buildings SET InternalOnly=0, PrereqTech='TECH_REPLACEABLE_PARTS'	WHERE BuildingType='BUILDING_JNR_MODE_MACHINES';
UPDATE Buildings SET InternalOnly=0, PrereqTech='TECH_CHEMISTRY'			WHERE BuildingType='BUILDING_JNR_MODE_FERTILIZERS';
UPDATE Buildings SET InternalOnly=0, PrereqTech='TECH_COMPUTERS'			WHERE BuildingType='BUILDING_JNR_MODE_ELECTRONICS';
UPDATE Buildings SET InternalOnly=0, PrereqTech='TECH_ADVANCED_FLIGHT'		WHERE BuildingType='BUILDING_JNR_MODE_SOUVENIRS';
UPDATE Buildings SET InternalOnly=0, PrereqTech='TECH_SYNTHETIC_MATERIALS'	WHERE BuildingType='BUILDING_JNR_MODE_PHARMA';
UPDATE Buildings SET InternalOnly=0, PrereqTech='TECH_PLASTICS'				WHERE BuildingType='BUILDING_JNR_MODE_PLASTICS';
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,											Kind)
VALUES	('RESOURCE_JNR_MACHINES',						'KIND_RESOURCE'),
		('RESOURCE_JNR_FERTILIZERS',					'KIND_RESOURCE'),
		('RESOURCE_JNR_ELECTRONICS',					'KIND_RESOURCE'),
		('RESOURCE_JNR_SOUVENIRS',						'KIND_RESOURCE'),
		('RESOURCE_JNR_PHARMA',							'KIND_RESOURCE'),
		('RESOURCE_JNR_PLASTICS',						'KIND_RESOURCE'),

		('PROJECT_CREATE_PRODUCT_JNR_MACHINES',			'KIND_PROJECT'),
		('PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS',		'KIND_PROJECT'),
		('PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS',		'KIND_PROJECT'),
		('PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS',		'KIND_PROJECT'),
		('PROJECT_CREATE_PRODUCT_JNR_PHARMA',			'KIND_PROJECT'),
		('PROJECT_CREATE_PRODUCT_JNR_PLASTICS',			'KIND_PROJECT');

INSERT OR IGNORE INTO Types
		(Type,											Kind)
SELECT	'GREATWORK_PRODUCT_JNR_MACHINES_' || Copy,		'KIND_GREATWORK'
FROM	ProductReference WHERE Copy > 0;

INSERT OR IGNORE INTO Types
		(Type,											Kind)
SELECT	'GREATWORK_PRODUCT_JNR_FERTILIZERS_' || Copy,	'KIND_GREATWORK'
FROM	ProductReference WHERE Copy > 0;

INSERT OR IGNORE INTO Types
		(Type,											Kind)
SELECT	'GREATWORK_PRODUCT_JNR_ELECTRONICS_' || Copy,	'KIND_GREATWORK'
FROM	ProductReference WHERE Copy > 0;

INSERT OR IGNORE INTO Types
		(Type,											Kind)
SELECT	'GREATWORK_PRODUCT_JNR_SOUVENIRS_' || Copy,		'KIND_GREATWORK'
FROM	ProductReference WHERE Copy > 0;

INSERT OR IGNORE INTO Types
		(Type,											Kind)
SELECT	'GREATWORK_PRODUCT_JNR_PHARMA_' || Copy,		'KIND_GREATWORK'
FROM	ProductReference WHERE Copy > 0;

INSERT OR IGNORE INTO Types
		(Type,											Kind)
SELECT	'GREATWORK_PRODUCT_JNR_PLASTICS_' || Copy,		'KIND_GREATWORK'
FROM	ProductReference WHERE Copy > 0;
--------------------------------------------------------------

-- Resources
--------------------------------------------------------------
INSERT OR IGNORE INTO Resources
		(ResourceType,					ResourceClassType,		Happiness,	Frequency,	Name)
VALUES	('RESOURCE_JNR_MACHINES',		'RESOURCECLASS_LUXURY',	4,			0,			'LOC_RESOURCE_JNR_MACHINES_NAME'),
		('RESOURCE_JNR_FERTILIZERS',	'RESOURCECLASS_LUXURY',	4,			0,			'LOC_RESOURCE_JNR_FERTILIZERS_NAME'),
		('RESOURCE_JNR_ELECTRONICS',	'RESOURCECLASS_LUXURY',	4,			0,			'LOC_RESOURCE_JNR_ELECTRONICS_NAME'),
		('RESOURCE_JNR_SOUVENIRS',		'RESOURCECLASS_LUXURY',	4,			0,			'LOC_RESOURCE_JNR_SOUVENIRS_NAME'),
		('RESOURCE_JNR_PHARMA',			'RESOURCECLASS_LUXURY',	4,			0,			'LOC_RESOURCE_JNR_PHARMA_NAME'),
		('RESOURCE_JNR_PLASTICS',		'RESOURCECLASS_LUXURY',	4,			0,			'LOC_RESOURCE_JNR_PLASTICS_NAME');
--------------------------------------------------------------

-- GreatWorks
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatWorks
		(GreatWorkType,	GreatWorkObjectType,		Name)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',	'LOC_GREATWORK_PRODUCT_JNR_MACHINES_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_MACHINES_%';

INSERT OR IGNORE INTO GreatWorks
		(GreatWorkType,	GreatWorkObjectType,		Name)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',	'LOC_GREATWORK_PRODUCT_JNR_FERTILIZERS_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_FERTILIZERS_%';

INSERT OR IGNORE INTO GreatWorks
		(GreatWorkType,	GreatWorkObjectType,		Name)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',	'LOC_GREATWORK_PRODUCT_JNR_ELECTRONICS_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWorks
		(GreatWorkType,	GreatWorkObjectType,		Name)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',	'LOC_GREATWORK_PRODUCT_JNR_SOUVENIRS_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_SOUVENIRS_%';

INSERT OR IGNORE INTO GreatWorks
		(GreatWorkType,	GreatWorkObjectType,		Name)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',	'LOC_GREATWORK_PRODUCT_JNR_PHARMA_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorks
		(GreatWorkType,	GreatWorkObjectType,		Name)
SELECT	Type,			'GREATWORKOBJECT_PRODUCT',	'LOC_GREATWORK_PRODUCT_JNR_PLASTICS_X_NAME'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PLASTICS_%';
--------------------------------------------------------------

-- GreatWorks_ImprovementType
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatWorks_ImprovementType
		(GreatWorkType,	ResourceType)
SELECT	Type,			'RESOURCE_JNR_MACHINES'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_MACHINES_%';

INSERT OR IGNORE INTO GreatWorks_ImprovementType
		(GreatWorkType,	ResourceType)
SELECT	Type,			'RESOURCE_JNR_FERTILIZERS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_FERTILIZERS_%';

INSERT OR IGNORE INTO GreatWorks_ImprovementType
		(GreatWorkType,	ResourceType)
SELECT	Type,			'RESOURCE_JNR_ELECTRONICS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWorks_ImprovementType
		(GreatWorkType,	ResourceType)
SELECT	Type,			'RESOURCE_JNR_SOUVENIRS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_SOUVENIRS_%';

INSERT OR IGNORE INTO GreatWorks_ImprovementType
		(GreatWorkType,	ResourceType)
SELECT	Type,			'RESOURCE_JNR_PHARMA'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorks_ImprovementType
		(GreatWorkType,	ResourceType)
SELECT	Type,			'RESOURCE_JNR_PLASTICS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PLASTICS_%';
--------------------------------------------------------------

-- GreatWork_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatWork_YieldChanges
		(GreatWorkType,	YieldType,			YieldChange)
SELECT	Type,			'YIELD_PRODUCTION',	3
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_MACHINES_%';

INSERT OR IGNORE INTO GreatWork_YieldChanges
		(GreatWorkType,	YieldType,			YieldChange)
SELECT	Type,			'YIELD_FOOD',		3
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_FERTILIZERS_%';

INSERT OR IGNORE INTO GreatWork_YieldChanges
		(GreatWorkType,	YieldType,			YieldChange)
SELECT	Type,			'YIELD_SCIENCE',	3
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWork_YieldChanges
		(GreatWorkType,	YieldType,			YieldChange)
SELECT	Type,			'YIELD_GOLD',		6
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_SOUVENIRS_%';

INSERT OR IGNORE INTO GreatWork_YieldChanges
		(GreatWorkType,	YieldType,			YieldChange)
SELECT	Type,			'YIELD_FAITH',		3
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWork_YieldChanges
		(GreatWorkType,	YieldType,			YieldChange)
SELECT	Type,			'YIELD_CULTURE',	3
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PLASTICS_%';
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',	'KIND_MODIFIER'),
		('MODIFIER_JNR_SINGLE_CITY_ADJUST_SPY_BONUS',		'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,										CollectionType,					EffectType)
VALUES	('MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',	'COLLECTION_CITY_DISTRICTS',	'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE'),
		('MODIFIER_JNR_SINGLE_CITY_ADJUST_SPY_BONUS',		'COLLECTION_OWNER',				'EFFECT_ADJUST_CITY_SPY_BONUS');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,												SubjectRequirementSetId,				SubjectStackLimit)
VALUES	('JNR_PRODUCT_PRODUCTION_TILES_MACHINES',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_JNR',				1),
		('JNR_PRODUCT_FOOD_FARMS_FERTILIZERS',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'REQUIREMENTS_PLOT_HAS_FARM',			1),
		('JNR_PRODUCT_SCIENCE_PERCENTAGE_ELECTRONICS',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			NULL,									1),
		('JNR_PRODUCT_CULTURE_PERCENTAGE_ELECTRONICS',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			NULL,									1),
		('JNR_PRODUCT_FAITH_PERCENTAGE_ELECTRONICS',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			NULL,									1),
		('JNR_PRODUCT_TOURISM_SOUVENIRS',				'MODIFIER_SINGLE_CITY_ADJUST_TOURISM_LATE_ERAS',			NULL,									1),
		('JNR_PRODUCT_FOOD_CITIZENS_PHARMA',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL,									1),
		('JNR_PRODUCT_FAVOR_STOCK_EXCHANGE_PHARMA',		'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				'BUILDING_IS_COMMERCIAL_TIER3_JNR',		1),
		('JNR_PRODUCT_FAVOR_SEAPORT_PHARMA',			'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				'BUILDING_IS_HARBOR_TIER3_JNR',			1),
		('JNR_PRODUCT_FAVOR_AIRPORT_PHARMA',			'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				'BUILDING_IS_AIRPORT_JNR',				1),
		('JNR_PRODUCT_GOLD_NEIGHBORHOOD_PLASTICS',		'MODIFIER_JNR_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',			'DISTRICT_IS_NEIGHBORHOOD',				1),

		('JNR_PRODUCT_PENALTY_ELECTRONICS_ESPIONAGE',	'MODIFIER_JNR_SINGLE_CITY_ADJUST_SPY_BONUS',				NULL,									1),
		('JNR_PRODUCT_PENALTY_SOUVENIRS_AMENITIES',		'MODIFIER_PLAYER_DISTRICT_ADJUST_DISTRICT_AMENITY',			NULL,									1),
		('JNR_PRODUCT_PENALTY_SOUVENIRS_WONDERS',		'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY',			'PLOT_ADJACENT_TO_WONDER_REQUIREMENTS',	1),
		('JNR_PRODUCT_PENALTY_PHARMA_GOLD',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL,									1),
		('JNR_PRODUCT_PENALTY_PLASTICS_APPEAL',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',					NULL,									1);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('JNR_PRODUCT_PRODUCTION_TILES_MACHINES',		'YieldType',	'YIELD_PRODUCTION'),
		('JNR_PRODUCT_PRODUCTION_TILES_MACHINES',		'Amount',		1),
		('JNR_PRODUCT_FOOD_FARMS_FERTILIZERS',			'YieldType',	'YIELD_FOOD'),
		('JNR_PRODUCT_FOOD_FARMS_FERTILIZERS',			'Amount',		2),
		('JNR_PRODUCT_SCIENCE_PERCENTAGE_ELECTRONICS',	'YieldType',	'YIELD_SCIENCE'),
		('JNR_PRODUCT_SCIENCE_PERCENTAGE_ELECTRONICS',	'Amount',		5),
		('JNR_PRODUCT_CULTURE_PERCENTAGE_ELECTRONICS',	'YieldType',	'YIELD_CULTURE'),
		('JNR_PRODUCT_CULTURE_PERCENTAGE_ELECTRONICS',	'Amount',		5),
		('JNR_PRODUCT_FAITH_PERCENTAGE_ELECTRONICS',	'YieldType',	'YIELD_FAITH'),
		('JNR_PRODUCT_FAITH_PERCENTAGE_ELECTRONICS',	'Amount',		5),
		('JNR_PRODUCT_TOURISM_SOUVENIRS',				'MinimumEra',	'ERA_MODERN'),
		('JNR_PRODUCT_TOURISM_SOUVENIRS',				'Modifier',		25),
		('JNR_PRODUCT_FOOD_CITIZENS_PHARMA',			'YieldType',	'YIELD_FOOD'),
		('JNR_PRODUCT_FOOD_CITIZENS_PHARMA',			'Amount',		0.5),
		('JNR_PRODUCT_FAVOR_STOCK_EXCHANGE_PHARMA',		'Amount',		1),
		('JNR_PRODUCT_FAVOR_SEAPORT_PHARMA',			'Amount',		1),
		('JNR_PRODUCT_FAVOR_AIRPORT_PHARMA',			'Amount',		1),
		('JNR_PRODUCT_GOLD_NEIGHBORHOOD_PLASTICS',		'YieldType',	'YIELD_GOLD'),
		('JNR_PRODUCT_GOLD_NEIGHBORHOOD_PLASTICS',		'Amount',		10),

		('JNR_PRODUCT_PENALTY_ELECTRONICS_ESPIONAGE',	'Amount',		-2),
		('JNR_PRODUCT_PENALTY_SOUVENIRS_AMENITIES',		'Amount',		-1),
		('JNR_PRODUCT_PENALTY_SOUVENIRS_WONDERS',		'Amount',		-1),
		('JNR_PRODUCT_PENALTY_PHARMA_GOLD',				'YieldType',	'YIELD_GOLD'),
		('JNR_PRODUCT_PENALTY_PHARMA_GOLD',				'Amount',		-0.5),
		('JNR_PRODUCT_PENALTY_PLASTICS_APPEAL',			'Amount',		-1);
--------------------------------------------------------------

-- GreatWorkModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_PRODUCTION_TILES_MACHINES'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_MACHINES_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_FOOD_FARMS_FERTILIZERS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_FERTILIZERS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_SCIENCE_PERCENTAGE_ELECTRONICS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_CULTURE_PERCENTAGE_ELECTRONICS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_FAITH_PERCENTAGE_ELECTRONICS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_TOURISM_SOUVENIRS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_SOUVENIRS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_FOOD_CITIZENS_PHARMA'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_FAVOR_STOCK_EXCHANGE_PHARMA'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_FAVOR_SEAPORT_PHARMA'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_FAVOR_AIRPORT_PHARMA'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_GOLD_NEIGHBORHOOD_PLASTICS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PLASTICS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_PENALTY_ELECTRONICS_ESPIONAGE'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_ELECTRONICS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_PENALTY_SOUVENIRS_AMENITIES'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_SOUVENIRS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_PENALTY_SOUVENIRS_WONDERS'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_SOUVENIRS_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_PENALTY_PHARMA_GOLD'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PHARMA_%';

INSERT OR IGNORE INTO GreatWorkModifiers
		(GreatWorkType,	ModifierId)
SELECT	Type,			'JNR_PRODUCT_PENALTY_PLASTICS_APPEAL'
FROM	Types
WHERE	Type LIKE 'GREATWORK_PRODUCT_JNR_PLASTICS_%';
--------------------------------------------------------------

-- Projects
--------------------------------------------------------------
INSERT OR IGNORE INTO Projects
		(ProjectType,								PrereqDistrict,				RequiredBuilding,					Cost,	AdvisorType,		Name,												ShortName,													Description)
VALUES	('PROJECT_CREATE_PRODUCT_JNR_MACHINES',		'DISTRICT_INDUSTRIAL_ZONE',	'BUILDING_JNR_MODE_MACHINES',		500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_JNR_MACHINES_NAME',		'LOC_PROJECT_CREATE_PRODUCT_JNR_MACHINES_SHORT_NAME',		'LOC_PROJECT_CREATE_PRODUCT_JNR_MACHINES_DESCRIPTION'),
		('PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS',	'DISTRICT_INDUSTRIAL_ZONE',	'BUILDING_JNR_MODE_FERTILIZERS',	500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS_NAME',	'LOC_PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS_SHORT_NAME',	'LOC_PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS_DESCRIPTION'),
		('PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS',	'DISTRICT_INDUSTRIAL_ZONE',	'BUILDING_JNR_MODE_ELECTRONICS',	500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS_NAME',	'LOC_PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS_SHORT_NAME',	'LOC_PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS_DESCRIPTION'),
		('PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS',	'DISTRICT_INDUSTRIAL_ZONE',	'BUILDING_JNR_MODE_SOUVENIRS',		500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS_NAME',	'LOC_PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS_SHORT_NAME',		'LOC_PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS_DESCRIPTION'),
		('PROJECT_CREATE_PRODUCT_JNR_PHARMA',		'DISTRICT_INDUSTRIAL_ZONE',	'BUILDING_JNR_MODE_PHARMA',			500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_JNR_PHARMA_NAME',		'LOC_PROJECT_CREATE_PRODUCT_JNR_PHARMA_SHORT_NAME',			'LOC_PROJECT_CREATE_PRODUCT_JNR_PHARMA_DESCRIPTION'),
		('PROJECT_CREATE_PRODUCT_JNR_PLASTICS',		'DISTRICT_INDUSTRIAL_ZONE',	'BUILDING_JNR_MODE_PLASTICS',		500,	'ADVISOR_GENERIC',	'LOC_PROJECT_CREATE_PRODUCT_JNR_PLASTICS_NAME',		'LOC_PROJECT_CREATE_PRODUCT_JNR_PLASTICS_SHORT_NAME',		'LOC_PROJECT_CREATE_PRODUCT_JNR_PLASTICS_DESCRIPTION');

UPDATE Projects SET PrereqTech=(SELECT PrereqTech FROM Buildings WHERE BuildingType='BUILDING_JNR_MODE_MACHINES')		WHERE ProjectType='PROJECT_CREATE_PRODUCT_JNR_MACHINES';
UPDATE Projects SET PrereqTech=(SELECT PrereqTech FROM Buildings WHERE BuildingType='BUILDING_JNR_MODE_FERTILIZERS')	WHERE ProjectType='PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS';
UPDATE Projects SET PrereqTech=(SELECT PrereqTech FROM Buildings WHERE BuildingType='BUILDING_JNR_MODE_ELECTRONICS')	WHERE ProjectType='PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS';
UPDATE Projects SET PrereqTech=(SELECT PrereqTech FROM Buildings WHERE BuildingType='BUILDING_JNR_MODE_SOUVENIRS')		WHERE ProjectType='PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS';
UPDATE Projects SET PrereqTech=(SELECT PrereqTech FROM Buildings WHERE BuildingType='BUILDING_JNR_MODE_PHARMA')			WHERE ProjectType='PROJECT_CREATE_PRODUCT_JNR_PHARMA';
UPDATE Projects SET PrereqTech=(SELECT PrereqTech FROM Buildings WHERE BuildingType='BUILDING_JNR_MODE_PLASTICS')		WHERE ProjectType='PROJECT_CREATE_PRODUCT_JNR_PLASTICS';
--------------------------------------------------------------

-- Project_ResourceCosts
--------------------------------------------------------------
INSERT OR IGNORE INTO Project_ResourceCosts
		(ProjectType,								ResourceType,		StartProductionCost)
VALUES	('PROJECT_CREATE_PRODUCT_JNR_MACHINES',		'RESOURCE_IRON',	30),
		('PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS',	'RESOURCE_NITER',	30);
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType)
VALUES	('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_MACHINES',		'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_FERTILIZERS',	'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_ELECTRONICS',	'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_SOUVENIRS',		'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_PHARMA',		'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_PLASTICS',		'MODIFIER_PLAYER_GRANT_RANDOM_RESOURCE_PRODUCT');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
VALUES	('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_MACHINES',		'ResourceType',	'RESOURCE_JNR_MACHINES'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_FERTILIZERS',	'ResourceType',	'RESOURCE_JNR_FERTILIZERS'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_ELECTRONICS',	'ResourceType',	'RESOURCE_JNR_ELECTRONICS'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_SOUVENIRS',		'ResourceType',	'RESOURCE_JNR_SOUVENIRS'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_PHARMA',		'ResourceType',	'RESOURCE_JNR_PHARMA'),
		('JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_PLASTICS',		'ResourceType',	'RESOURCE_JNR_PLASTICS');
--------------------------------------------------------------

-- ProjectCompletionModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO ProjectCompletionModifiers
		(ProjectType,								ModifierId)
VALUES	('PROJECT_CREATE_PRODUCT_JNR_MACHINES',		'JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_MACHINES'),
		('PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS',	'JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_FERTILIZERS'),
		('PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS',	'JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_ELECTRONICS'),
		('PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS',	'JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_SOUVENIRS'),
		('PROJECT_CREATE_PRODUCT_JNR_PHARMA',		'JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_PHARMA'),
		('PROJECT_CREATE_PRODUCT_JNR_PLASTICS',		'JNR_PROJECT_COMPLETION_CREATE_CORPORATION_PRODUCT_PLASTICS');
--------------------------------------------------------------

-- Requirements
--------------------------------------------------------------
INSERT OR IGNORE INTO Requirements
		(RequirementId,							RequirementType)
VALUES	('REQUIRES_PLOT_HAS_IMPROVEMENT_JNR',	'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,				RequirementSetType)
VALUES	('PLOT_HAS_IMPROVEMENT_JNR',	'REQUIREMENTSET_TEST_ALL');
	
	--------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId)
VALUES	('PLOT_HAS_IMPROVEMENT_JNR',	'REQUIRES_PLOT_HAS_IMPROVEMENT_JNR');
--------------------------------------------------------------

-- ResourceIndustries
--------------------------------------------------------------
INSERT OR IGNORE INTO ResourceIndustries
		(ResourceType,					ResourceEffectTExt)
VALUES	('RESOURCE_JNR_MACHINES',		'LOC_PRODUCT_JNR_MACHINES_BONUS_DESCRIPTION'),
		('RESOURCE_JNR_FERTILIZERS',	'LOC_PRODUCT_JNR_FERTILIZERS_BONUS_DESCRIPTION'),
		('RESOURCE_JNR_ELECTRONICS',	'LOC_PRODUCT_JNR_ELECTRONICS_BONUS_DESCRIPTION'),
		('RESOURCE_JNR_SOUVENIRS',		'LOC_PRODUCT_JNR_SOUVENIRS_BONUS_DESCRIPTION'),
		('RESOURCE_JNR_PHARMA',			'LOC_PRODUCT_JNR_PHARMA_BONUS_DESCRIPTION'),
		('RESOURCE_JNR_PLASTICS',		'LOC_PRODUCT_JNR_PLASTICS_BONUS_DESCRIPTION');
--------------------------------------------------------------

-- ModifierStrings
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierStrings
		(ModifierId,									Context,	Text)
VALUES	('JNR_PRODUCT_PRODUCTION_TILES_MACHINES',		'Summary',	'LOC_PRODUCT_JNR_MACHINES_BONUS_DESCRIPTION'),
		('JNR_PRODUCT_FOOD_FARMS_FERTILIZERS',			'Summary',	'LOC_PRODUCT_JNR_FERTILIZERS_BONUS_DESCRIPTION'),
		('JNR_PRODUCT_SCIENCE_PERCENTAGE_ELECTRONICS',	'Summary',	'LOC_PRODUCT_JNR_ELECTRONICS_BONUS_DESCRIPTION'),
		('JNR_PRODUCT_TOURISM_SOUVENIRS',				'Summary',	'LOC_PRODUCT_JNR_SOUVENIRS_BONUS_DESCRIPTION'),
		('JNR_PRODUCT_FOOD_CITIZENS_PHARMA',			'Summary',	'LOC_PRODUCT_JNR_PHARMA_BONUS_DESCRIPTION'),
		('JNR_PRODUCT_GOLD_NEIGHBORHOOD_PLASTICS',		'Summary',	'LOC_PRODUCT_JNR_PLASTICS_BONUS_DESCRIPTION');
--------------------------------------------------------------

-- ProductReference
--------------------------------------------------------------
DROP TABLE ProductReference;
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,								Description,									YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement)
VALUES	('JNR_UC_Industry_Production',		'LOC_DISTRICT_JNR_UC_Industry_Production',		'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_INDUSTRY'),
		('JNR_UC_Corporation_Production',	'LOC_DISTRICT_JNR_UC_Corporation_Production',	'YIELD_PRODUCTION',	2,				1,				'IMPROVEMENT_CORPORATION');
--------------------------------------------------------------

-- District_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
VALUES	('DISTRICT_INDUSTRIAL_ZONE',	'JNR_UC_Industry_Production'),
		('DISTRICT_INDUSTRIAL_ZONE',	'JNR_UC_Corporation_Production');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_UC_Industry_Production'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_INDUSTRIAL_ZONE';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
SELECT	CivUniqueDistrictType,			'JNR_UC_Corporation_Production'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_INDUSTRIAL_ZONE';
--------------------------------------------------------------

-- Buildings
--------------------------------------------------------------
UPDATE	Buildings
SET		PrereqTech=NULL,
		PrereqCivic='CIVIC_CAPITALISM',
		RegionalRange=0,
		Name='LOC_BUILDING_KEIRETSU_NAME_UC_JNR',
		Description='LOC_BUILDING_KEIRETSU_DESCRIPTION_UC_JNR'
		WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';
--------------------------------------------------------------

-- Buildings_XP2
--------------------------------------------------------------
UPDATE Buildings_XP2 SET RequiredPower=1 WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';
--------------------------------------------------------------

-- Building_YieldChanges
--------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_SCIENCE';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_CULTURE';
--------------------------------------------------------------

-- Building_YieldChangesBonusWithPower
--------------------------------------------------------------
DELETE FROM Building_YieldChangesBonusWithPower WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_SCIENCE';
DELETE FROM Building_YieldChangesBonusWithPower WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_CULTURE';
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,						ModifierId)
VALUES	('BUILDING_ELECTRONICS_FACTORY',	'JNR_KANBAN_LOGISTICS_PROJECTS_PRODUCTION');
--------------------------------------------------------------