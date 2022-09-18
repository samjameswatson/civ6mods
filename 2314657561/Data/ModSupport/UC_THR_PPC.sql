-- UC_THR_PPC
-- Author: JNR
--------------------------------------------------------------

-- Buildings_JNRUCPPC_PowerTierYields
--------------------------------------------------------------
INSERT OR IGNORE INTO Buildings_JNRUCPPC_PowerTierYields
		(BuildingType,					Tier,	Yield,				GPP)
VALUES	('BUILDING_JNR_OPERA',			2,		'YIELD_CULTURE',	'GWAM'),
		('BUILDING_JNR_GRAND_HOTEL',	2,		'YIELD_CULTURE',	'GWAM'),
		('BUILDING_JNR_MEDIA_CENTER',	3,		'YIELD_CULTURE',	'GWAM');

DELETE FROM Buildings_JNRUCPPC_PowerTierYields WHERE BuildingType='BUILDING_MUSEUM_ART';
DELETE FROM Buildings_JNRUCPPC_PowerTierYields WHERE BuildingType='BUILDING_MUSEUM_ARTIFACT';
--------------------------------------------------------------