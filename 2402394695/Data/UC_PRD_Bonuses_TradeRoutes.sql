-- UC_PRD_Bonuses_TradeRoutes
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,												ModifierType)
VALUES	('JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,												Name,			Value)
VALUES	('JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION',	'Amount',		1),
		('JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION');
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
-- BuildingModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,							ModifierId)
VALUES	('BUILDING_WATER_MILL',					'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_JNR_WIND_MILL',				'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_WORKSHOP',					'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_JNR_MANUFACTURY',			'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_FACTORY',					'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_JNR_CHEMICAL',				'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_JNR_FREIGHT_YARD',			'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_COAL_POWER_PLANT',			'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_POWER_PLANT',				'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'),
		('BUILDING_ELECTRONICS_FACTORY',		'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION');

INSERT OR IGNORE INTO BuildingModifiers
		(BuildingType,							ModifierId)
SELECT	BuildingType,							'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_RENEWABLE_DISTRIBUTION';
--------------------------------------------------------------