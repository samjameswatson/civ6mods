-- UC_PRD_CX
-- Author: JNR
--------------------------------------------------------------

-- England - Pax Britannica
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType,											SubjectRequirementSetId)
SELECT	'P0K_TRAIT_HOME_CONTINENT_CAMPUS_SCIENCE_BONUS' || BuildingType,	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'P0K_ENGLAND_CITY_ON_HOME_CONTINENT'
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_CAMPUS';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,														ModifierType,											SubjectRequirementSetId)
SELECT	'P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUS' || BuildingType,	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS'
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_INDUSTRIAL_ZONE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'P0K_TRAIT_HOME_CONTINENT_CAMPUS_SCIENCE_BONUS' || BuildingType,	'BuildingType',	BuildingType
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_CAMPUS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'P0K_TRAIT_HOME_CONTINENT_CAMPUS_SCIENCE_BONUS' || BuildingType,	'YieldType',	'YIELD_SCIENCE'
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_CAMPUS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'P0K_TRAIT_HOME_CONTINENT_CAMPUS_SCIENCE_BONUS' || BuildingType,	'Amount',		Maintenance
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_CAMPUS';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUS' || BuildingType,	'BuildingType',	BuildingType
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_INDUSTRIAL_ZONE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUS' || BuildingType,	'YieldType',	'YIELD_PRODUCTION'
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_INDUSTRIAL_ZONE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,														Name,			Value)
SELECT	'P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUS' || BuildingType,	'Amount',		Maintenance
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_INDUSTRIAL_ZONE';

UPDATE ModifierArguments SET Value=4 WHERE Name='Amount' AND ModifierId='P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUSBUILDING_COAL_POWER_PLANT';
UPDATE ModifierArguments SET Value=4 WHERE Name='Amount' AND ModifierId='P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUSBUILDING_FOSSIL_FUEL_POWER_PLANT';
UPDATE ModifierArguments SET Value=4 WHERE Name='Amount' AND ModifierId='P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUSBUILDING_POWER_PLANT';
UPDATE ModifierArguments SET Value=4 WHERE Name='Amount' AND ModifierId='P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUSBUILDING_JNR_RENEWABLE_DISTRIBUTION';

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_PAX_BRITANNICA',	'P0K_TRAIT_HOME_CONTINENT_CAMPUS_SCIENCE_BONUS' || BuildingType
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_CAMPUS';

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_PAX_BRITANNICA',	'P0K_TRAIT_FOREIGN_CONTINENT_IZ_PRODUCTION_BONUS' || BuildingType
FROM	Buildings
WHERE	PrereqDistrict='DISTRICT_INDUSTRIAL_ZONE';

DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_PAX_BRITANNICA' AND ModifierId='P0K_TRAIT_HOME_CONTINENT_CAMPUS_BUILDING_SCIENCE_BONUS';
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_PAX_BRITANNICA' AND ModifierId='P0K_TRAIT_FOREIGN_CONTINENT_IZ_BUILDING_PRODUCTION_BONUS';
--------------------------------------------------------------

-- Germany - Hanseatic League
--------------------------------------------------------------
UPDATE	Modifiers SET SubjectRequirementSetId='BUILDING_IS_INDUSTRIAL_TIER2_JNR' WHERE ModifierId='P0K_TRAIT_FACTORY_AMENITY';
UPDATE	Modifiers SET SubjectRequirementSetId='BUILDING_IS_INDUSTRIAL_TIER2_JNR' WHERE ModifierId='P0K_TRAIT_FACTORY_PRODUCTION_BOOST';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType)
VALUES	('P0K_TRAIT_MANUFACTURY_ADJUST_PRODUCTION_JNR_UC',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');

UPDATE ModifierArguments SET Value=4	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_UNIVERSITY_SCIENCE_BOOST';
UPDATE ModifierArguments SET Value=4	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_FACTORY_PRODUCTION_BOOST';
UPDATE ModifierArguments SET Value=4	WHERE Name='Amount'	AND	ModifierId='P0K_TRAIT_BANK_GOLD_BOOST';

UPDATE ModifierArguments SET Value='BUILDING_WORKSHOP' WHERE Name='BuildingType' AND ModifierId='P0K_TRAIT_FACTORY_ADJUST_PRODUCTION';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,			Value)
VALUES	('P0K_TRAIT_MANUFACTURY_ADJUST_PRODUCTION_JNR_UC',	'BuildingType',	'BUILDING_JNR_MANUFACTURY'),
		('P0K_TRAIT_MANUFACTURY_ADJUST_PRODUCTION_JNR_UC',	'Amount',		25);

INSERT OR IGNORE INTO TraitModifiers
		(TraitType,									ModifierId)
VALUES	('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	'P0K_TRAIT_MANUFACTURY_ADJUST_PRODUCTION_JNR_UC');
--------------------------------------------------------------

-- India - Gospel of the Charkha
--------------------------------------------------------------
--------------------------------------------------------------

-- Japan - Zaibatsu
--------------------------------------------------------------
UPDATE Building_YieldChanges SET YieldChange=2	WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_CULTURE';
DELETE FROM Building_YieldChanges				WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_SCIENCE';

UPDATE Building_YieldChangesBonusWithPower SET YieldChange=4	WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_CULTURE';
DELETE FROM Building_YieldChangesBonusWithPower					WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' AND YieldType='YIELD_SCIENCE';
--------------------------------------------------------------

-- Hungary - Pearl of the Danube
--------------------------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_CIVILIZATION_PEARL_DANUBE' AND ModifierId='P0K_TRAIT_DANUBE_FREE_WATER_MILL';
--------------------------------------------------------------

-- Sweden - Minerva of the North
--------------------------------------------------------------
UPDATE ModifierArguments SET Value=2	WHERE Name='Amount'	AND	ModifierId LIKE 'P0K_TRAIT_MINERVA_%';
--------------------------------------------------------------