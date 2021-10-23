-- UC_PRD_Config
-- Author: JNR
--------------------------------------------------------------

-- Players
--------------------------------------------------------------
UPDATE	Players
SET		CivilizationAbilityDescription='LOC_TRAIT_CIVILIZATION_NOBEL_PRIZE_DESCRIPTION_JNR_UC'
WHERE	CivilizationAbilityDescription='LOC_TRAIT_CIVILIZATION_NOBEL_PRIZE_DESCRIPTION';
--------------------------------------------------------------

-- PlayerItems
--------------------------------------------------------------
UPDATE	PlayerItems
SET		Description='LOC_DISTRICT_HANSA_DESCRIPTION_UC_JNR'
WHERE	Type='DISTRICT_HANSA';
--------------------------------------------------------------

-- PlayerItems
--------------------------------------------------------------
UPDATE	PlayerItems
SET		Description='LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION_UC_JNR'
WHERE	Type='BUILDING_ELECTRONICS_FACTORY';
--------------------------------------------------------------

-- GameModePlayerItemOverrides
--------------------------------------------------------------
INSERT OR IGNORE INTO GameModePlayerItemOverrides
		(GameModeType,			Domain,							CivilizationType,		LeaderType,		Type,							Name,									Description)
VALUES	('GAMEMODE_MONOPOLIES',	'Players:StandardPlayers',		'CIVILIZATION_JAPAN',	'LEADER_HOJO',	'BUILDING_ELECTRONICS_FACTORY',	'LOC_BUILDING_KEIRETSU_NAME_UC_JNR',	'LOC_BUILDING_KEIRETSU_DESCRIPTION_UC_JNR'),
		('GAMEMODE_MONOPOLIES',	'Players:Expansion1_Players',	'CIVILIZATION_JAPAN',	'LEADER_HOJO',	'BUILDING_ELECTRONICS_FACTORY',	'LOC_BUILDING_KEIRETSU_NAME_UC_JNR',	'LOC_BUILDING_KEIRETSU_DESCRIPTION_UC_JNR'),
		('GAMEMODE_MONOPOLIES',	'Players:Expansion2_Players',	'CIVILIZATION_JAPAN',	'LEADER_HOJO',	'BUILDING_ELECTRONICS_FACTORY',	'LOC_BUILDING_KEIRETSU_NAME_UC_JNR',	'LOC_BUILDING_KEIRETSU_DESCRIPTION_UC_JNR');
--------------------------------------------------------------

-- Queries
--------------------------------------------------------------
INSERT OR IGNORE INTO Queries
		(QueryId,							SQL)
VALUES	("MonopoliesPlayerItemOverrides",	"SELECT * FROM GameModePlayerItemOverrides WHERE GameModeType = 'GAMEMODE_MONOPOLIES'");
--------------------------------------------------------------

-- PlayerItemOverrideQueries
--------------------------------------------------------------
INSERT OR IGNORE INTO PlayerItemOverrideQueries
		(QueryId)
VALUES	('MonopoliesPlayerItemOverrides');
--------------------------------------------------------------

-- QueryCriteria
--------------------------------------------------------------
INSERT OR IGNORE INTO QueryCriteria
		(QueryId,							ConfigurationGroup,	ConfigurationId,		Operator,	ConfigurationValue)
VALUES	('MonopoliesPlayerItemOverrides',	'Game',				'GAMEMODE_MONOPOLIES',	'Equals',	1);
--------------------------------------------------------------

