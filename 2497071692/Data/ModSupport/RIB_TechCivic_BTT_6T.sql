-- RIB_TechCivic_BTT_6T
-- Author: JNR
--------------------------------------------------------------

-- create items in TechSpecialUnlockables for Brewery and Clothier yield upgrades
--------------------------------------------------------------
INSERT OR IGNORE INTO TechSpecialUnlockables
		(Unlockable,				PrereqTech,					Description,						Background,					Icon,						Civilopedia)
VALUES	('CLOTHIER_GOLD_UPGRADE',	'TECH_INDUSTRIALIZATION',	'LOC_JNR_CLOTHIER_LATE_GAME_BONUS',	'IMPR_BONUS_YIELD_GOLD',	'IMPROVEMENT_JNR_CLOTHIER',	'IMPROVEMENT_JNR_CLOTHIER'),
		('BREWERY_GOLD_UPGRADE',	'TECH_ELECTRICITY',			'LOC_JNR_BREWERY_LATE_GAME_BONUS',	'IMPR_BONUS_YIELD_GOLD',	'IMPROVEMENT_JNR_BREWERY',	'IMPROVEMENT_JNR_BREWERY');
--------------------------------------------------------------