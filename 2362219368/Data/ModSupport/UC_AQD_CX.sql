-- UC_AQD_Text_Baray
-- Author: JNR
--------------------------------------------------------------

-- Districts
--------------------------------------------------------------
UPDATE Districts SET Entertainment=0 WHERE DistrictType='DISTRICT_BATH';
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
UPDATE	Adjacency_YieldChanges
SET		YieldChange=1
WHERE	ID IN
		(
		'p0k_Campus_Bath_Science',
		'p0k_Campus_Bath_Culture',
		'p0k_Campus_Bath_Faith',
		'p0k_Campus_Bath_Production',
		'p0k_Campus_Bath_Gold'
		);
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,									ModifierType,										SubjectRequirementSetId)
VALUES	('JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE_ROME',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'ADJACENT_PLOT_HAS_FOOD_IMPROVEMENT_JNR'),
		('JNR_BATHHOUSE_AMENITY_ROME',					'MODIFIER_PLAYER_DISTRICT_ADJUST_DISTRICT_AMENITY',	'BUILDING_IS_BATHHOUSE_JNR');

UPDATE Modifiers SET OwnerRequirementSetId='BUILDING_IS_ORCHARD_JNR' WHERE ModifierId='JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE_ROME';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE_ROME',	'YieldType',	'YIELD_GOLD'),
		('JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE_ROME',	'Amount',		1),
		('JNR_BATHHOUSE_AMENITY_ROME',					'Amount',		1);
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,		ModifierId)
VALUES	('DISTRICT_BATH',	'JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE_ROME'),
		('DISTRICT_BATH',	'JNR_BATHHOUSE_AMENITY_ROME');
--------------------------------------------------------------