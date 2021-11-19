-- UC_ENT_Districts
-- Author: JNR
--------------------------------------------------------------

-- Districts
--------------------------------------------------------------
UPDATE Districts SET PrereqCivic='CIVIC_EXPLORATION' WHERE DistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
UPDATE Districts SET PrereqCivic='CIVIC_EXPLORATION' WHERE DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX');

UPDATE Districts SET Description='LOC_DISTRICT_ACROPOLIS_DESCRIPTION_JNR_UC_ENT' WHERE DistrictType='DISTRICT_ACROPOLIS';
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='EntertainmentComplex_Culture';
UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='WaterPark_Culture';
UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='StreetCarnival_Culture';
UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='Copacabana_Culture';
UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='Hippodrome_Culture';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,							Description,									YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentFeature,				AdjacentWonder,	AdjacentNaturalWonder,	AdjacentDistrict,			AdjacentImprovement)
VALUES	('District_Tourism_JNR',		'LOC_DISTRICT_TOURISM_JNR_DESCRIPTION',			'YIELD_GOLD',	1,				2,				1,						NULL,							0,				0,						NULL,						NULL),
		('Government_Tourism_JNR',		'LOC_GOVERNMENT_TOURISM_JNR_DESCRIPTION',		'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						'DISTRICT_GOVERNMENT',		NULL),
		('Theater_Tourism_JNR',			'LOC_THEATER_TOURISM_JNR_DESCRIPTION',			'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						'DISTRICT_THEATER',			NULL),
		('Commercial_Hub_Tourism_JNR',	'LOC_COMMERCIAL_HUB_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						'DISTRICT_COMMERCIAL_HUB',	NULL),
		('Harbor_Tourism_JNR',			'LOC_HARBOR_TOURISM_JNR_DESCRIPTION',			'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						'DISTRICT_HARBOR',			NULL),
		('Geothermal_Tourism_JNR',		'LOC_GEOTHERMAL_TOURISM_JNR_DESCRIPTION',		'YIELD_GOLD',	1,				1,				0,						'FEATURE_GEOTHERMAL_FISSURE',	0,				0,						NULL,						NULL),
		('Reef_Tourism_JNR',			'LOC_REEF_TOURISM_JNR_DESCRIPTION',				'YIELD_GOLD',	1,				1,				0,						'FEATURE_REEF',					0,				0,						NULL,						NULL),
		('Ski_Resort_Tourism_JNR',		'LOC_SKI_RESORT_TOURISM_JNR_DESCRIPTION',		'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						NULL,						'IMPROVEMENT_SKI_RESORT'),
		('Beach_Resort_Tourism_JNR',	'LOC_BEACH_RESORT_TOURISM_JNR_DESCRIPTION',		'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						NULL,						'IMPROVEMENT_BEACH_RESORT'),
		('Wonder_Tourism_JNR',			'LOC_WONDER_TOURISM_JNR_DESCRIPTION',			'YIELD_GOLD',	1,				1,				0,						NULL,							1,				0,						NULL,						NULL);

-- Unique Improvements adjacent
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,							Description,									YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentFeature,				AdjacentWonder,	AdjacentNaturalWonder,	AdjacentDistrict,			AdjacentImprovement)
SELECT	'Golf_Course_Tourism_JNR',		'LOC_GOLF_COURSE_TOURISM_JNR_DESCRIPTION',		'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						NULL,						ImprovementType
FROM	Improvements
WHERE	ImprovementType='IMPROVEMENT_GOLF_COURSE';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,							Description,									YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentFeature,				AdjacentWonder,	AdjacentNaturalWonder,	AdjacentDistrict,			AdjacentImprovement)
SELECT	'Ice_Hockey_Rink_Tourism_JNR',	'LOC_ICE_HOCKEY_RINK_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						NULL,						ImprovementType
FROM	Improvements
WHERE	ImprovementType='IMPROVEMENT_ICE_HOCKEY_RINK';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,							Description,									YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentFeature,				AdjacentWonder,	AdjacentNaturalWonder,	AdjacentDistrict,			AdjacentImprovement)
SELECT	'Batey_Tourism_JNR',			'LOC_BATEY_TOURISM_JNR_DESCRIPTION',			'YIELD_GOLD',	1,				1,				0,						NULL,							0,				0,						NULL,						ImprovementType
FROM	Improvements
WHERE	ImprovementType='IMPROVEMENT_BATEY';

-- Unique Districts adjacent
INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,										Description,													YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict)
SELECT	CivUniqueDistrictType || '_Tourism_JNR',	'LOC_' || CivUniqueDistrictType || '_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				CivUniqueDistrictType
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_GOVERNMENT';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,										Description,													YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict)
SELECT	CivUniqueDistrictType || '_Tourism_JNR',	'LOC_' || CivUniqueDistrictType || '_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				CivUniqueDistrictType
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_THEATER';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,										Description,													YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict)
SELECT	CivUniqueDistrictType || '_Tourism_JNR',	'LOC_' || CivUniqueDistrictType || '_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				CivUniqueDistrictType
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,										Description,													YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict)
SELECT	CivUniqueDistrictType || '_Tourism_JNR',	'LOC_' || CivUniqueDistrictType || '_TOURISM_JNR_DESCRIPTION',	'YIELD_GOLD',	1,				1,				CivUniqueDistrictType
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_HARBOR';
--------------------------------------------------------------

-- District_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
VALUES	('DISTRICT_ENTERTAINMENT_COMPLEX',			'District_Tourism_JNR'),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'Government_Tourism_JNR'),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'Theater_Tourism_JNR'),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'Commercial_Hub_Tourism_JNR'),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'Geothermal_Tourism_JNR'),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'Ski_Resort_Tourism_JNR'),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'Wonder_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'District_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Government_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Theater_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Harbor_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Reef_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Beach_Resort_Tourism_JNR'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'Wonder_Tourism_JNR');

-- Unique Improvements adjacent
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_ENTERTAINMENT_COMPLEX',			ID
FROM	Adjacency_YieldChanges
WHERE	ID='Golf_Course_Tourism_JNR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',		ID
FROM	Adjacency_YieldChanges
WHERE	ID='Golf_Course_Tourism_JNR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_ENTERTAINMENT_COMPLEX',			ID
FROM	Adjacency_YieldChanges
WHERE	ID='Ice_Hockey_Rink_Tourism_JNR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',		ID
FROM	Adjacency_YieldChanges
WHERE	ID='Ice_Hockey_Rink_Tourism_JNR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_ENTERTAINMENT_COMPLEX',			ID
FROM	Adjacency_YieldChanges
WHERE	ID='Batey_Tourism_JNR';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',		ID
FROM	Adjacency_YieldChanges
WHERE	ID='Batey_Tourism_JNR';

-- Unique Districts adjacent
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_ENTERTAINMENT_COMPLEX',			ID
FROM	Adjacency_YieldChanges
WHERE	ID=(SELECT CivUniqueDistrictType || '_Tourism_JNR' FROM DistrictReplaces WHERE	ReplacesDistrictType='DISTRICT_GOVERNMENT');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',		ID
FROM	Adjacency_YieldChanges
WHERE	ID=(SELECT CivUniqueDistrictType || '_Tourism_JNR' FROM DistrictReplaces WHERE	ReplacesDistrictType='DISTRICT_GOVERNMENT');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_ENTERTAINMENT_COMPLEX',			ID
FROM	Adjacency_YieldChanges
WHERE	ID=(SELECT CivUniqueDistrictType || '_Tourism_JNR' FROM DistrictReplaces WHERE	ReplacesDistrictType='DISTRICT_THEATER');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',		ID
FROM	Adjacency_YieldChanges
WHERE	ID=(SELECT CivUniqueDistrictType || '_Tourism_JNR' FROM DistrictReplaces WHERE	ReplacesDistrictType='DISTRICT_THEATER');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_ENTERTAINMENT_COMPLEX',			ID
FROM	Adjacency_YieldChanges
WHERE	ID=(SELECT CivUniqueDistrictType || '_Tourism_JNR' FROM DistrictReplaces WHERE	ReplacesDistrictType='DISTRICT_COMMERCIAL_HUB');

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,								YieldChangeId)
SELECT	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',		ID
FROM	Adjacency_YieldChanges
WHERE	ID=(SELECT CivUniqueDistrictType || '_Tourism_JNR' FROM DistrictReplaces WHERE	ReplacesDistrictType='DISTRICT_HARBOR');

-- Unique Districts
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,				YieldChangeId)
SELECT	a.CivUniqueDistrictType,	b.YieldChangeId
FROM	DistrictReplaces a, District_Adjacencies b
WHERE	a.ReplacesDistrictType='DISTRICT_ENTERTAINMENT_COMPLEX'
AND		b.DistrictType='DISTRICT_ENTERTAINMENT_COMPLEX';

INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,				YieldChangeId)
SELECT	a.CivUniqueDistrictType,	b.YieldChangeId
FROM	DistrictReplaces a, District_Adjacencies b
WHERE	a.ReplacesDistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX'
AND		b.DistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
--------------------------------------------------------------

-- RequirementSets
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets
		(RequirementSetId,		RequirementSetType)
VALUES	('PLAYER_HAS_FLIGHT',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------

-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSetRequirements
		(RequirementSetId,		RequirementId)
VALUES	('PLAYER_HAS_FLIGHT',	'REQUIRES_PLAYER_HAS_FLIGHT');
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,																Kind)
VALUES	('MODIFIER_JNR_SINGLE_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER',	'KIND_MODIFIER');
--------------------------------------------------------------

-- DynamicModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DynamicModifiers
		(ModifierType,														CollectionType,		EffectType)
VALUES	('MODIFIER_JNR_SINGLE_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER',	'COLLECTION_OWNER',	'EFFECT_ADJUST_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER');
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,							ModifierType,														SubjectRequirementSetId)
VALUES	('JNR_ENTERTAINMENT_ADJACENCY_TOURISM',	'MODIFIER_JNR_SINGLE_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER',	'PLAYER_HAS_FLIGHT');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('JNR_ENTERTAINMENT_ADJACENCY_TOURISM',	'Amount',		100),
		('JNR_ENTERTAINMENT_ADJACENCY_TOURISM',	'YieldType',	'YIELD_GOLD');
--------------------------------------------------------------

-- DistrictModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,								ModifierId)
VALUES	('DISTRICT_ENTERTAINMENT_COMPLEX',			'JNR_ENTERTAINMENT_ADJACENCY_TOURISM'),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'JNR_ENTERTAINMENT_ADJACENCY_TOURISM');
		
INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,								ModifierId)
SELECT	CivUniqueDistrictType,						'JNR_ENTERTAINMENT_ADJACENCY_TOURISM'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_ENTERTAINMENT_COMPLEX';

INSERT OR IGNORE INTO DistrictModifiers
		(DistrictType,								ModifierId)
SELECT	CivUniqueDistrictType,						'JNR_ENTERTAINMENT_ADJACENCY_TOURISM'
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
--------------------------------------------------------------

-- District_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO District_CitizenYieldChanges
		(DistrictType,								YieldType,			YieldChange)
VALUES	('DISTRICT_ENTERTAINMENT_COMPLEX',			'YIELD_GOLD',		2),
		('DISTRICT_ENTERTAINMENT_COMPLEX',			'YIELD_CULTURE',	1),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'YIELD_GOLD',		2),
		('DISTRICT_WATER_ENTERTAINMENT_COMPLEX',	'YIELD_CULTURE',	1);

INSERT OR IGNORE INTO District_CitizenYieldChanges
		(DistrictType,								YieldType,			YieldChange)
SELECT	a.CivUniqueDistrictType,					b.YieldType,		b.YieldChange
FROM	DistrictReplaces a, District_CitizenYieldChanges b
WHERE	a.ReplacesDistrictType='DISTRICT_ENTERTAINMENT_COMPLEX'
AND		b.DistrictType='DISTRICT_ENTERTAINMENT_COMPLEX';

INSERT OR IGNORE INTO District_CitizenYieldChanges
		(DistrictType,								YieldType,			YieldChange)
SELECT	a.CivUniqueDistrictType,					b.YieldType,		b.YieldChange
FROM	DistrictReplaces a, District_CitizenYieldChanges b
WHERE	a.ReplacesDistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX'
AND		b.DistrictType='DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
--------------------------------------------------------------