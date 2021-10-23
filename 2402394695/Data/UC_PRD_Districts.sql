-- UC_PRD_Districts
-- Author: JNR
--------------------------------------------------------------

-- Districts
--------------------------------------------------------------
UPDATE Districts SET PrereqTech='TECH_CONSTRUCTION' WHERE DistrictType='DISTRICT_INDUSTRIAL_ZONE';
UPDATE Districts SET PrereqTech='TECH_CONSTRUCTION' WHERE DistrictType='DISTRICT_HANSA';

UPDATE Districts SET Description='LOC_DISTRICT_HANSA_DESCRIPTION_UC_JNR' WHERE DistrictType='DISTRICT_HANSA';
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
UPDATE Adjacency_YieldChanges SET YieldChange=1	WHERE ID='Aqueduct_Production';
UPDATE Adjacency_YieldChanges SET YieldChange=1	WHERE ID='Dam_Production';
UPDATE Adjacency_YieldChanges SET YieldChange=1	WHERE ID='Canal_Production';

INSERT OR IGNORE INTO Adjacency_YieldChanges
		(ID,								Description,								YieldType,			YieldChange,	TilesRequired,	AdjacentDistrict,				AdjacentImprovement)
VALUES	('LumberMill_Production',			'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',		'YIELD_PRODUCTION',	1,				1,				NULL,							'IMPROVEMENT_LUMBER_MILL'),
		('JNR_UC_Harbor_Production',		'LOC_DISTRICT_JNR_UC_Harbor_Production',	'YIELD_PRODUCTION',	1,				1,				'DISTRICT_HARBOR',				NULL),
		('JNR_UC_Harbor_Production_Hansa',	'LOC_DISTRICT_JNR_UC_Harbor_Production',	'YIELD_PRODUCTION',	2,				1,				'DISTRICT_HARBOR',				NULL),
		('JNR_UC_RoyalDock_Production',		'LOC_DISTRICT_JNR_UC_RoyalDock_Production',	'YIELD_PRODUCTION',	1,				1,				'DISTRICT_ROYAL_NAVY_DOCKYARD',	NULL),
		('JNR_UC_Cothon_Production',		'LOC_DISTRICT_JNR_UC_Cothon_Production',	'YIELD_PRODUCTION',	1,				1,				'DISTRICT_COTHON',				NULL);
--------------------------------------------------------------

-- District_Adjacencies
--------------------------------------------------------------
INSERT OR IGNORE INTO District_Adjacencies
		(DistrictType,					YieldChangeId)
VALUES	('DISTRICT_INDUSTRIAL_ZONE',	'JNR_UC_Harbor_Production'),
		('DISTRICT_INDUSTRIAL_ZONE',	'JNR_UC_RoyalDock_Production'),
		('DISTRICT_INDUSTRIAL_ZONE',	'JNR_UC_Cothon_Production'),
		('DISTRICT_HANSA',				'JNR_UC_Harbor_Production_Hansa');

UPDATE District_Adjacencies SET YieldChangeId='Mine_Production'			WHERE YieldChangeId='Minel_HalfProduction'		AND DistrictType='DISTRICT_INDUSTRIAL_ZONE';
UPDATE District_Adjacencies SET YieldChangeId='Mine_Production'			WHERE YieldChangeId='Minel_HalfProduction'		AND DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE CivUniqueDistrictType='DISTRICT_INDUSTRIAL_ZONE');
UPDATE District_Adjacencies SET YieldChangeId='LumberMill_Production'	WHERE YieldChangeId='LumberMill_HalfProduction' AND DistrictType='DISTRICT_INDUSTRIAL_ZONE';
UPDATE District_Adjacencies SET YieldChangeId='LumberMill_Production'	WHERE YieldChangeId='LumberMill_HalfProduction' AND DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE CivUniqueDistrictType='DISTRICT_INDUSTRIAL_ZONE');
--------------------------------------------------------------