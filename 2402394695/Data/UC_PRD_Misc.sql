-- UC_PRD_Misc
-- Author: JNR
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Projects
----------------------------------------------------------------------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,										Kind)
VALUES	('PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	'KIND_PROJECT');
--------------------------------------------------------------

-- Projects
--------------------------------------------------------------
INSERT OR IGNORE INTO Projects
		(ProjectType,
		Name,
		ShortName,
		Description,
		PrereqDistrict,
		PrereqTech,
		Cost,
		AdvisorType)
VALUES	(
		'PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',
		'LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_NAME',
		'LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_SHORT_NAME',
		'LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_DESCRIPTION',
		'DISTRICT_INDUSTRIAL_ZONE',
		'TECH_COMBUSTION',
		300,
		'ADVISOR_GENERIC'
		);
--------------------------------------------------------------

-- Projects_XP2
--------------------------------------------------------------
INSERT OR IGNORE INTO Projects_XP2
		(ProjectType,								CreateBuilding)
VALUES	('PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	'BUILDING_JNR_FREIGHT_YARD');
--------------------------------------------------------------

-- Project_BuildingCosts
--------------------------------------------------------------
INSERT OR IGNORE INTO Project_BuildingCosts
		(ProjectType,								ConsumedBuildingType)
VALUES	('PROJECT_CONVERT_REACTOR_TO_COAL',			'BUILDING_JNR_FREIGHT_YARD'),
		('PROJECT_CONVERT_REACTOR_TO_OIL',			'BUILDING_JNR_FREIGHT_YARD'),
		('PROJECT_CONVERT_REACTOR_TO_URANIUM',		'BUILDING_JNR_FREIGHT_YARD'),
		('PROJECT_CONVERT_REACTOR_TO_COAL',			'BUILDING_ELECTRONICS_FACTORY'),
		('PROJECT_CONVERT_REACTOR_TO_OIL',			'BUILDING_ELECTRONICS_FACTORY'),
		('PROJECT_CONVERT_REACTOR_TO_URANIUM',		'BUILDING_ELECTRONICS_FACTORY'),
		('PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	'BUILDING_COAL_POWER_PLANT'),
		('PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	'BUILDING_FOSSIL_FUEL_POWER_PLANT'),
		('PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	'BUILDING_POWER_PLANT');

INSERT OR IGNORE INTO Project_BuildingCosts
		(ProjectType,								ConsumedBuildingType)
SELECT	'PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT',	BuildingType
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';

INSERT OR IGNORE INTO Project_BuildingCosts
		(ProjectType,								ConsumedBuildingType)
SELECT	ProjectType,								'BUILDING_JNR_FREIGHT_YARD'
FROM	Projects
WHERE	ProjectType='PROJECT_JNR_CONVERT_REACTOR_TO_BATTERY';

INSERT OR IGNORE INTO Project_BuildingCosts
		(ProjectType,								ConsumedBuildingType)
SELECT	ProjectType,								'BUILDING_ELECTRONICS_FACTORY'
FROM	Projects
WHERE	ProjectType='PROJECT_JNR_CONVERT_REACTOR_TO_BATTERY';
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Technologies and Civics
----------------------------------------------------------------------------------------------------------------------------

-- Boosts
--------------------------------------------------------------
UPDATE	Boosts SET
		TechnologyType='TECH_CONSTRUCTION',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_CONSTRUCTION_JNR_UC'
WHERE	TechnologyType='TECH_ENGINEERING';

UPDATE	Boosts SET
		TechnologyType='TECH_ENGINEERING',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_ENGINEERING_JNR_UC'
WHERE	TechnologyType='TECH_APPRENTICESHIP';

UPDATE	Boosts SET
		TechnologyType='TECH_APPRENTICESHIP',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_APPRENTICESHIP_JNR_UC'
WHERE	TechnologyType='TECH_CONSTRUCTION'
		AND TriggerDescription='LOC_BOOST_TRIGGER_CONSTRUCTION';

UPDATE	Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_INDUSTRIALIZATION_JNR_UC',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_INDUSTRIALIZATION_JNR_UC',
		BuildingType='BUILDING_JNR_MANUFACTURY',
		NumItems=2
WHERE	TechnologyType='TECH_INDUSTRIALIZATION';

UPDATE	Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_CLASS_STRUGGLE_JNR_UC',
		NumItems=2
WHERE	CivicType='CIVIC_CLASS_STRUGGLE';

DELETE FROM Boosts WHERE	TechnologyType='TECH_ELECTRICITY';

UPDATE	Boosts SET
		TechnologyType='TECH_ELECTRICITY',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_ELECTRICITY_JNR_UC'
WHERE	TechnologyType='TECH_REFINING';

UPDATE	Boosts SET
		TechnologyType='TECH_REFINING'
WHERE	TechnologyType='TECH_COMBUSTION';

UPDATE	Boosts SET
		TechnologyType='TECH_COMBUSTION',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_COMBUSTION_JNR_UC'
WHERE	TechnologyType='TECH_PLASTICS';

INSERT OR IGNORE INTO Boosts
		(TechnologyType,
		Boost,
		BoostClass,
		BuildingType,
		NumItems,
		TriggerDescription,
		TriggerLongDescription)
VALUES	('TECH_PLASTICS',
		40,
		'BOOST_TRIGGER_HAVE_X_BUILDINGS',
		'BUILDING_JNR_FREIGHT_YARD',
		2,
		'LOC_BOOST_TRIGGER_PLASTICS_JNR_UC',
		'LOC_BOOST_TRIGGER_LONGDESC_PLASTICS_JNR_UC');
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Governors
----------------------------------------------------------------------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType)
VALUES	('INDUSTRIALIST_JNR_FREIGHT_YARD_PRODUCTION',	'MODIFIER_BUILDING_YIELD_CHANGE');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('INDUSTRIALIST_JNR_FREIGHT_YARD_PRODUCTION',	'BuildingType',	'BUILDING_JNR_FREIGHT_YARD'),
		('INDUSTRIALIST_JNR_FREIGHT_YARD_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
		('INDUSTRIALIST_JNR_FREIGHT_YARD_PRODUCTION',	'Amount',		2);
--------------------------------------------------------------

-- GovernorPromotionModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO GovernorPromotionModifiers
		(GovernorPromotionType,									ModifierId)
VALUES	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',	'INDUSTRIALIST_JNR_FREIGHT_YARD_PRODUCTION');
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Great People
----------------------------------------------------------------------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,													Kind)
VALUES	('GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',				'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',					'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',					'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU',	'KIND_GREAT_PERSON_INDIVIDUAL');
--------------------------------------------------------------

-- GreatPersonIndividuals
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatPersonIndividuals
		(
		GreatPersonIndividualType,
		Name,
		GreatPersonClassType,
		EraType,
		Gender,
		ActionCharges,
		ActionRequiresCompletedDistrictType
		)
VALUES	(
		'GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_INDUSTRIAL_ZONE'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_INDUSTRIAL_ZONE'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_CITY_CENTER'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_RENAISSANCE',
		'F',
		1,
		'DISTRICT_CITY_CENTER'
		);

UPDATE GreatPersonIndividuals SET EraType='ERA_CLASSICAL'	WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_IMHOTEP';

UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREATPERSON_IMHOTEP_ACTIVE_JNR_UC'				WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_IMHOTEP';
UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREATPERSON_LEONARDO_DA_VINCI_ACTIVE_JNR_UC'	WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI';
UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREATPERSON_JAMES_WATT_ACTIVE_JNR_UC'			WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JAMES_WATT';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType,											SubjectRequirementSetId,					Permanent)
VALUES	('JNR_GREATPERSON_EUREKA_STRENGTH',					'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST',				NULL,										1),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK',				NULL,										1),
		('JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION',			'MODIFIER_PLAYER_CITIES_DISTRICT_ADJACENCY',			NULL,										1),
		('JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',			NULL,										1),
		('JNR_GREATPERSON_REVEAL_COAL',						'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY',		NULL,										1),
		('JNR_GREATPERSON_MINES_FRESH_WATER_GOLD',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_HAS_FRESH_WATER_MINE_JNR',			1),
		('JNR_GREATPERSON_FRESH_WATER_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_HAS_FRESH_WATER_OR_WATER_WORKS_JNR',	1),
		('JNR_GREATPERSON_WORKSHOP_PRODUCTION',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	NULL,										1);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,					Value)
VALUES	('JNR_GREATPERSON_EUREKA_STRENGTH',					'Amount',				5),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'DistrictType',			'DISTRICT_DAM'),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'TechType',				'TECH_MATHEMATICS'),
		('JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION',			'DistrictType',			'DISTRICT_DAM'),
		('JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION',			'YieldType',			'YIELD_PRODUCTION'),
		('JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION',			'Amount',				1),
		('JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION',			'Description',			'LOC_DISTRICT_DISTRICT_1_PRODUCTION'),
		('JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION',	'GreatWorkObjectType',	'GREATWORKOBJECT_WRITING'),
		('JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION',	'YieldType',			'YIELD_PRODUCTION'),
		('JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION',	'YieldChange',			4),	
		('JNR_GREATPERSON_REVEAL_COAL',						'ResourceType',			'RESOURCE_COAL'),
		('JNR_GREATPERSON_MINES_FRESH_WATER_GOLD',			'YieldType',			'YIELD_GOLD'),
		('JNR_GREATPERSON_MINES_FRESH_WATER_GOLD',			'Amount',				2),
		('JNR_GREATPERSON_FRESH_WATER_PRODUCTION',			'YieldType',			'YIELD_PRODUCTION'),
		('JNR_GREATPERSON_FRESH_WATER_PRODUCTION',			'Amount',				1),
		('JNR_GREATPERSON_WORKSHOP_PRODUCTION',				'BuildingType',			'BUILDING_WORKSHOP'),
		('JNR_GREATPERSON_WORKSHOP_PRODUCTION',				'YieldType',			'YIELD_PRODUCTION'),
		('JNR_GREATPERSON_WORKSHOP_PRODUCTION',				'Amount',				1);

UPDATE ModifierArguments SET Extra=-1	WHERE Name='Amount' AND ModifierId='JNR_GREATPERSON_EUREKA_STRENGTH';

UPDATE ModifierArguments SET Value=250	WHERE Name='Amount' AND ModifierId='GREAT_PERSON_INDIVIDUAL_IMHOTEP_PRODUCTION_ANCIENT_CLASSICAL';
UPDATE ModifierArguments SET Value=125	WHERE Name='Amount' AND ModifierId='GREAT_PERSON_INDIVIDUAL_IMHOTEP_PRODUCTION_OTHER';
--------------------------------------------------------------

-- GreatPersonIndividualActionModifiers
--------------------------------------------------------------
DELETE FROM GreatPersonIndividualActionModifiers WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JAMES_WATT' AND ModifierId='GREATPERSON_WORKSHOP';
DELETE FROM GreatPersonIndividualActionModifiers WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JAMES_WATT' AND ModifierId='GREATPERSON_FACTORY';
DELETE FROM GreatPersonIndividualActionModifiers WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JAMES_WATT' AND ModifierId='GREATPERSON_FACTORIES_PRODUCTION';

INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers
		(GreatPersonIndividualType,								ModifierId,											AttachmentTargetType)
VALUES	('GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',				'JNR_GREATPERSON_EUREKA_STRENGTH',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',					'JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',					'JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',					'JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU',	'JNR_GREATPERSON_REVEAL_COAL',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU',	'JNR_GREATPERSON_MINES_FRESH_WATER_GOLD',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JAMES_WATT',					'JNR_GREATPERSON_FRESH_WATER_PRODUCTION',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
		('GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI',			'JNR_GREATPERSON_WORKSHOP_PRODUCTION',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');
--------------------------------------------------------------

-- ModifierStrings
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierStrings
		(ModifierId,										Context,	Text)
VALUES	('JNR_GREATPERSON_EUREKA_STRENGTH',					'Summary',	'LOC_JNR_GREATPERSON_EUREKA_STRENGTH'),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'Summary',	'LOC_JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS'),
		('JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION',	'Summary',	'LOC_JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION'),
		('JNR_GREATPERSON_REVEAL_COAL',						'Summary',	'LOC_JNR_GREATPERSON_REVEAL_COAL');
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Traits
----------------------------------------------------------------------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_INDUSTRIAL_TIER2_JNR'	WHERE ModifierId='TRAIT_GREAT_ENGINEER_FACTORY_MODIFIER';
--------------------------------------------------------------

-- Traits
--------------------------------------------------------------
UPDATE	Traits SET Description='LOC_TRAIT_CIVILIZATION_NOBEL_PRIZE_DESCRIPTION_JNR_UC' WHERE TraitType='TRAIT_CIVILIZATION_NOBEL_PRIZE';
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Apocalypse Mode
----------------------------------------------------------------------------------------------------------------------------

-- RandomEvent_PillagedBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_CHEMICAL'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_FACTORY';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_FREIGHT_YARD'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MODE_MACHINES'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MODE_FERTILIZERS'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MODE_ELECTRONICS'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MODE_SOUVENIRS'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MODE_PHARMA'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MODE_PLASTICS'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_POWER_PLANT';
--------------------------------------------------------------