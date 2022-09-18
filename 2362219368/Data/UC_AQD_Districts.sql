-- UC_AQD_Districts
-- Author: JNR
--------------------------------------------------------------

-- Districts
--------------------------------------------------------------
UPDATE Districts SET Cost=54, Maintenance=1,	Name='LOC_DISTRICT_AQUEDUCT_NAME_JNR_UC',	Description='LOC_DISTRICT_AQUEDUCT_DESCRIPTION_JNR_UC'	WHERE DistrictType='DISTRICT_AQUEDUCT';
UPDATE Districts SET Entertainment=0,			Name='LOC_DISTRICT_BATH_NAME_JNR_UC',		Description='LOC_DISTRICT_BATH_DESCRIPTION_JNR_UC'		WHERE DistrictType='DISTRICT_BATH';
UPDATE Districts SET Cost=27, Maintenance=1 WHERE DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType='DISTRICT_AQUEDUCT');
--------------------------------------------------------------

-- District_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR IGNORE INTO District_CitizenYieldChanges
		(DistrictType,			YieldType,			YieldChange)
VALUES	('DISTRICT_AQUEDUCT',	'YIELD_PRODUCTION',	1);

INSERT OR IGNORE INTO District_CitizenYieldChanges
		(DistrictType,			YieldType,			YieldChange)
SELECT	CivUniqueDistrictType,	'YIELD_PRODUCTION',	1
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';
--------------------------------------------------------------

-- District_TradeRouteYields
--------------------------------------------------------------
INSERT OR IGNORE INTO District_TradeRouteYields
		(DistrictType,			YieldType,		YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
VALUES	('DISTRICT_AQUEDUCT',	'YIELD_FOOD',	1,									1);

INSERT OR IGNORE INTO District_TradeRouteYields
		(DistrictType,			YieldType,		YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
SELECT	CivUniqueDistrictType,	'YIELD_FOOD',	1,									1
FROM	DistrictReplaces
WHERE	ReplacesDistrictType='DISTRICT_AQUEDUCT';
--------------------------------------------------------------

-- Adjacency_YieldChanges
--------------------------------------------------------------
-- UPDATE Adjacency_YieldChanges SET YieldChange=1 WHERE ID='Aqueduct_Production';
--------------------------------------------------------------