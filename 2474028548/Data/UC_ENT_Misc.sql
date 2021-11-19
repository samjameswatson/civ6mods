-- UC_ENT_Misc
-- Author: JNR
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Apocalypse Mode
----------------------------------------------------------------------------------------------------------------------------

-- RandomEvent_PillagedBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_THEME_PARK'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_STADIUM';

INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_FOOD_COURT'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_AQUATICS_CENTER';
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Ice Hockey Rink
----------------------------------------------------------------------------------------------------------------------------

-- Improvements
--------------------------------------------------------------
UPDATE Improvements SET Description='LOC_IMPROVEMENT_ICE_HOCKEY_RINK_DESCRIPTION_JNR_UC' WHERE ImprovementType='IMPROVEMENT_ICE_HOCKEY_RINK';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='PLOT_IS_ADJACENT_TO_ENTERTAINMENT_TIER3_JNR' WHERE ModifierId='ICEHOCKEYRINK_CULTURE_STADIUM';
--------------------------------------------------------------