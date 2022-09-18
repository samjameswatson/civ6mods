-- UC_COM_Policies
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,							Kind)
VALUES	('POLICY_JNR_ADMIRALITY_COURT',	'KIND_POLICY');
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
INSERT OR IGNORE INTO Policies
		(PolicyType,					Name,									Description,									PrereqCivic,			GovernmentSlotType)
SELECT	'POLICY_JNR_ADMIRALITY_COURT',	'LOC_POLICY_JNR_ADMIRALITY_COURT_NAME',	'LOC_POLICY_JNR_ADMIRALITY_COURT_DESCRIPTION',	'CIVIC_COLONIALISM',	'SLOT_ECONOMIC'
FROM	Policies
WHERE	PolicyType='POLICY_FREE_MARKET';

UPDATE Policies SET Description='LOC_POLICY_FREE_MARKET_DESCRIPTION_JNR_UC' WHERE PolicyType='POLICY_FREE_MARKET';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
VALUES	('FREEMARKET_HIGH_ADJACENCY_MARKET_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_MINT_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_WAYSTATION_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_BANK_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_GUILDHALL_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_MERCHANT_QUARTER_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_STOCK_EXCHANGE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_COMMODITY_EXCHANGE_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),
		('FREEMARKET_HIGH_ADJACENCY_MARKETING_AGENCY_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'COMMERCIAL_HUB_HAS_HIGH_ADJACENCY'),

		('FREEMARKET_HIGH_POP_MARKET_JNR',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_MINT_JNR',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_WAYSTATION_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_BANK_JNR',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_GUILDHALL_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_MERCHANT_QUARTER_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_STOCK_EXCHANGE_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_COMMODITY_EXCHANGE_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('FREEMARKET_HIGH_POP_MARKETING_AGENCY_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),

		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_TRADE_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SHIPYARD_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_HAVEN_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CONSULATE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SEAPORT_JNR',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CRUISE_TERMINAL_JNR',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'),

		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_TRADE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('ADMIRALITYCOURT_HIGH_POP_SHIPYARD_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('ADMIRALITYCOURT_HIGH_POP_HAVEN_JNR',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('ADMIRALITYCOURT_HIGH_POP_CONSULATE_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('ADMIRALITYCOURT_HIGH_POP_SEAPORT_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'),
		('ADMIRALITYCOURT_HIGH_POP_CRUISE_TERMINAL_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION');

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
SELECT	'ADMIRALITYCOURT_HIGH_ADJACENCY_NAVAL_BASE_JNR',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'HARBOR_HAS_HIGH_ADJACENCY_JNR'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';

INSERT OR IGNORE INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
SELECT	'ADMIRALITYCOURT_HIGH_POP_NAVAL_BASE_JNR',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'CITY_HAS_HIGH_POPULATION'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
VALUES	('FREEMARKET_HIGH_ADJACENCY_MARKET_JNR',				'BuildingType',	'BUILDING_MARKET'),
		('FREEMARKET_HIGH_ADJACENCY_MINT_JNR',					'BuildingType',	'BUILDING_JNR_MINT'),
		('FREEMARKET_HIGH_ADJACENCY_WAYSTATION_JNR',			'BuildingType',	'BUILDING_JNR_WAYSTATION'),
		('FREEMARKET_HIGH_ADJACENCY_BANK_JNR',					'BuildingType',	'BUILDING_BANK'),
		('FREEMARKET_HIGH_ADJACENCY_GUILDHALL_JNR',				'BuildingType',	'BUILDING_JNR_GUILDHALL'),
		('FREEMARKET_HIGH_ADJACENCY_MERCHANT_QUARTER_JNR',		'BuildingType',	'BUILDING_JNR_MERCHANT_QUARTER'),
		('FREEMARKET_HIGH_ADJACENCY_STOCK_EXCHANGE_JNR',		'BuildingType',	'BUILDING_STOCK_EXCHANGE'),
		('FREEMARKET_HIGH_ADJACENCY_COMMODITY_EXCHANGE_JNR',	'BuildingType',	'BUILDING_JNR_COMMODITY_EXCHANGE'),
		('FREEMARKET_HIGH_ADJACENCY_MARKETING_AGENCY_JNR',		'BuildingType',	'BUILDING_JNR_MARKETING_AGENCY'),
		('FREEMARKET_HIGH_ADJACENCY_MARKET_JNR',				'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_MINT_JNR',					'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_WAYSTATION_JNR',			'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_BANK_JNR',					'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_GUILDHALL_JNR',				'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_MERCHANT_QUARTER_JNR',		'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_STOCK_EXCHANGE_JNR',		'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_COMMODITY_EXCHANGE_JNR',	'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_MARKETING_AGENCY_JNR',		'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_ADJACENCY_MARKET_JNR',				'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_MINT_JNR',					'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_WAYSTATION_JNR',			'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_BANK_JNR',					'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_GUILDHALL_JNR',				'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_MERCHANT_QUARTER_JNR',		'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_STOCK_EXCHANGE_JNR',		'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_COMMODITY_EXCHANGE_JNR',	'Amount',		2),
		('FREEMARKET_HIGH_ADJACENCY_MARKETING_AGENCY_JNR',		'Amount',		2),

		('FREEMARKET_HIGH_POP_MARKET_JNR',						'BuildingType',	'BUILDING_MARKET'),
		('FREEMARKET_HIGH_POP_MINT_JNR',						'BuildingType',	'BUILDING_JNR_MINT'),
		('FREEMARKET_HIGH_POP_WAYSTATION_JNR',					'BuildingType',	'BUILDING_JNR_WAYSTATION'),
		('FREEMARKET_HIGH_POP_BANK_JNR',						'BuildingType',	'BUILDING_BANK'),
		('FREEMARKET_HIGH_POP_GUILDHALL_JNR',					'BuildingType',	'BUILDING_JNR_GUILDHALL'),
		('FREEMARKET_HIGH_POP_MERCHANT_QUARTER_JNR',			'BuildingType',	'BUILDING_JNR_MERCHANT_QUARTER'),
		('FREEMARKET_HIGH_POP_STOCK_EXCHANGE_JNR',				'BuildingType',	'BUILDING_STOCK_EXCHANGE'),
		('FREEMARKET_HIGH_POP_COMMODITY_EXCHANGE_JNR',			'BuildingType',	'BUILDING_JNR_COMMODITY_EXCHANGE'),
		('FREEMARKET_HIGH_POP_MARKETING_AGENCY_JNR',			'BuildingType',	'BUILDING_JNR_MARKETING_AGENCY'),
		('FREEMARKET_HIGH_POP_MARKET_JNR',						'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_MINT_JNR',						'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_WAYSTATION_JNR',					'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_BANK_JNR',						'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_GUILDHALL_JNR',					'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_MERCHANT_QUARTER_JNR',			'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_STOCK_EXCHANGE_JNR',				'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_COMMODITY_EXCHANGE_JNR',			'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_MARKETING_AGENCY_JNR',			'YieldType',	'YIELD_GOLD'),
		('FREEMARKET_HIGH_POP_MARKET_JNR',						'Amount',		2),
		('FREEMARKET_HIGH_POP_MINT_JNR',						'Amount',		2),
		('FREEMARKET_HIGH_POP_WAYSTATION_JNR',					'Amount',		2),
		('FREEMARKET_HIGH_POP_BANK_JNR',						'Amount',		2),
		('FREEMARKET_HIGH_POP_GUILDHALL_JNR',					'Amount',		2),
		('FREEMARKET_HIGH_POP_MERCHANT_QUARTER_JNR',			'Amount',		2),
		('FREEMARKET_HIGH_POP_STOCK_EXCHANGE_JNR',				'Amount',		2),
		('FREEMARKET_HIGH_POP_COMMODITY_EXCHANGE_JNR',			'Amount',		2),
		('FREEMARKET_HIGH_POP_MARKETING_AGENCY_JNR',			'Amount',		2),

		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_JNR',		'BuildingType',	'BUILDING_LIGHTHOUSE'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_TRADE_JNR',	'BuildingType',	'BUILDING_JNR_LIGHTHOUSE_TRADE'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SHIPYARD_JNR',			'BuildingType',	'BUILDING_SHIPYARD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_HAVEN_JNR',			'BuildingType',	'BUILDING_JNR_HAVEN'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CONSULATE_JNR',		'BuildingType',	'BUILDING_JNR_CONSULATE'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SEAPORT_JNR',			'BuildingType',	'BUILDING_SEAPORT'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CRUISE_TERMINAL_JNR',	'BuildingType',	'BUILDING_JNR_CRUISE_TERMINAL'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_JNR',		'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_TRADE_JNR',	'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SHIPYARD_JNR',			'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_HAVEN_JNR',			'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CONSULATE_JNR',		'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SEAPORT_JNR',			'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CRUISE_TERMINAL_JNR',	'YieldType',	'YIELD_FOOD'),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_JNR',		'Amount',		1),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_TRADE_JNR',	'Amount',		1),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SHIPYARD_JNR',			'Amount',		1),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_HAVEN_JNR',			'Amount',		1),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CONSULATE_JNR',		'Amount',		1),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_SEAPORT_JNR',			'Amount',		1),
		('ADMIRALITYCOURT_HIGH_ADJACENCY_CRUISE_TERMINAL_JNR',	'Amount',		1),

		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_JNR',				'BuildingType',	'BUILDING_LIGHTHOUSE'),
		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_TRADE_JNR',		'BuildingType',	'BUILDING_JNR_LIGHTHOUSE_TRADE'),
		('ADMIRALITYCOURT_HIGH_POP_SHIPYARD_JNR',				'BuildingType',	'BUILDING_SHIPYARD'),
		('ADMIRALITYCOURT_HIGH_POP_HAVEN_JNR',					'BuildingType',	'BUILDING_JNR_HAVEN'),
		('ADMIRALITYCOURT_HIGH_POP_CONSULATE_JNR',				'BuildingType',	'BUILDING_JNR_CONSULATE'),
		('ADMIRALITYCOURT_HIGH_POP_SEAPORT_JNR',				'BuildingType',	'BUILDING_SEAPORT'),
		('ADMIRALITYCOURT_HIGH_POP_CRUISE_TERMINAL_JNR',		'BuildingType',	'BUILDING_JNR_CRUISE_TERMINAL'),
		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_JNR',				'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_TRADE_JNR',		'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_SHIPYARD_JNR',				'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_HAVEN_JNR',					'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_CONSULATE_JNR',				'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_SEAPORT_JNR',				'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_CRUISE_TERMINAL_JNR',		'YieldType',	'YIELD_PRODUCTION'),
		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_JNR',				'Amount',		1),
		('ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_TRADE_JNR',		'Amount',		1),
		('ADMIRALITYCOURT_HIGH_POP_SHIPYARD_JNR',				'Amount',		1),
		('ADMIRALITYCOURT_HIGH_POP_HAVEN_JNR',					'Amount',		1),
		('ADMIRALITYCOURT_HIGH_POP_CONSULATE_JNR',				'Amount',		1),
		('ADMIRALITYCOURT_HIGH_POP_SEAPORT_JNR',				'Amount',		1),
		('ADMIRALITYCOURT_HIGH_POP_CRUISE_TERMINAL_JNR',		'Amount',		1);

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'ADMIRALITYCOURT_HIGH_ADJACENCY_NAVAL_BASE_JNR',		'BuildingType',	'BuildingType'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'ADMIRALITYCOURT_HIGH_ADJACENCY_NAVAL_BASE_JNR',		'YieldType',	'YIELD_FOOD'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'ADMIRALITYCOURT_HIGH_ADJACENCY_NAVAL_BASE_JNR',		'Amount',		1
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'ADMIRALITYCOURT_HIGH_POP_NAVAL_BASE_JNR',				'BuildingType',	'BuildingType'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'ADMIRALITYCOURT_HIGH_POP_NAVAL_BASE_JNR',				'YieldType',	'YIELD_PRODUCTION'
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';

INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,											Name,			Value)
SELECT	'ADMIRALITYCOURT_HIGH_POP_NAVAL_BASE_JNR',				'Amount',		1
FROM	Buildings
WHERE	BuildingType='BUILDING_JNR_NAVAL_BASE';
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
-- Free Market
INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_MARKET_JNR'					FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_MINT_JNR'					FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_WAYSTATION_JNR'				FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_BANK_JNR'					FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_GUILDHALL_JNR'				FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_MERCHANT_QUARTER_JNR'		FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_STOCK_EXCHANGE_JNR'			FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_COMMODITY_EXCHANGE_JNR'		FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_ADJACENCY_MARKETING_AGENCY_JNR'		FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_MARKET_JNR'						FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_MINT_JNR'							FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_WAYSTATION_JNR'					FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_BANK_JNR'							FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_GUILDHALL_JNR'						FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_MERCHANT_QUARTER_JNR'				FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_STOCK_EXCHANGE_JNR'				FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_COMMODITY_EXCHANGE_JNR'			FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'FREEMARKET_HIGH_POP_MARKETING_AGENCY_JNR'				FROM Policies WHERE PolicyType='POLICY_FREE_MARKET';

-- Admirality Court

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_LIGHTHOUSE_TRADE_JNR'	FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_SHIPYARD_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_HAVEN_JNR'				FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_CONSULATE_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_SEAPORT_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_CRUISE_TERMINAL_JNR'	FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_JNR'				FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_LIGHTHOUSE_TRADE_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_SHIPYARD_JNR'					FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_HAVEN_JNR'					FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_CONSULATE_JNR'				FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_SEAPORT_JNR'					FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_CRUISE_TERMINAL_JNR'			FROM Policies WHERE PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_ADJACENCY_NAVAL_BASE_JNR'
FROM	Buildings a, Policies b
WHERE	a.BuildingType='BUILDING_JNR_NAVAL_BASE' and b.PolicyType='POLICY_JNR_ADMIRALITY_COURT';

INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType,	ModifierId)
SELECT	PolicyType,		'ADMIRALITYCOURT_HIGH_POP_NAVAL_BASE_JNR'
FROM	Buildings a, Policies b
WHERE	a.BuildingType='BUILDING_JNR_NAVAL_BASE' and b.PolicyType='POLICY_JNR_ADMIRALITY_COURT';

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_FREE_MARKET' AND ModifierId='FREEMARKET_BUILDING_YIELDS_HIGH_ADJACENCY';
DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_FREE_MARKET' AND ModifierId='FREEMARKET_BUILDING_YIELDS_HIGH_POP';
--------------------------------------------------------------