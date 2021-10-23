-- UC_THR_Misc
-- Author: JNR
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Technologies and Civics
----------------------------------------------------------------------------------------------------------------------------

-- Boosts
--------------------------------------------------------------
UPDATE Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_HUMANISM_JNR_UC',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_HUMANISM_JNR_UC',
		Unit1Type='UNIT_GREAT_WRITER'
WHERE	CivicType='CIVIC_HUMANISM';

UPDATE Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_OPERA_BALLET_JNR_UC',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_OPERA_BALLET_JNR_UC',
		BuildingType='BUILDING_JNR_MANSION',
		NumItems=2
WHERE	CivicType='CIVIC_OPERA_BALLET';

UPDATE Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_NATURAL_HISTORY_JNR_UC',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_NATURAL_HISTORY_JNR_UC',
		BuildingType='BUILDING_JNR_CABINET',
		NumItems=2
WHERE	CivicType='CIVIC_NATURAL_HISTORY';

UPDATE Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_CONSERVATION_JNR_UC',
		TriggerLongDescription='LOC_BOOST_TRIGGER_LONGDESC_CONSERVATION_JNR_UC',
		BoostClass='BOOST_TRIGGER_HAVE_X_BUILDINGS',
		BuildingType='BUILDING_MUSEUM_ARTIFACT',
		DistrictType=NULL,
		NumItems=1
WHERE	CivicType='CIVIC_CONSERVATION';

UPDATE	Boosts SET
		TriggerDescription='LOC_BOOST_TRIGGER_TELECOMMUNICATIONS_JNR_UC'
WHERE	TriggerDescription='LOC_BOOST_TRIGGER_TELECOMMUNICATIONS';
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Pantheons and Traits
----------------------------------------------------------------------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_THEATER_TIER1_JNR' WHERE ModifierId='DIVINE_SPARK_WRITER_MODIFIER';
--------------------------------------------------------------

-- AiFavoredItems
--------------------------------------------------------------
INSERT OR IGNORE INTO AiFavoredItems
		(ListType,				Item,					Favored)
VALUES	('KristinaBuildings',	'BUILDING_JNR_OPERA',	'true');
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Apocalypse Mode
----------------------------------------------------------------------------------------------------------------------------

-- RandomEvent_PillagedBuildings
--------------------------------------------------------------
INSERT OR IGNORE INTO RandomEvent_PillagedBuildings
		(RandomEventType,	BuildingType)
SELECT	RandomEventType,	'BUILDING_JNR_MEDIA_CENTER'
FROM	RandomEvent_PillagedBuildings
WHERE	BuildingType='BUILDING_BROADCAST_CENTER';
--------------------------------------------------------------