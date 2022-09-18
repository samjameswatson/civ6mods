-- Wetlands_Text
-- Author: JNR
--------------------------------------------------------------

-- EnglishText
--------------------------------------------------------------
INSERT OR REPLACE INTO EnglishText
		(Tag,	Text)
VALUES	('LOC_FEATURE_FLOODPLAINS_TUNDRA_NAME',
		'Tundra Floodplains'),
		('LOC_FEATURE_FLOODPLAINS_TUNDRA_DESCRIPTION',
		'This low-lying area adjacent to a River has not yet flooded so it starts the game with the same yields as a flat Tundra tile. If the River floods again structures built on this tile may be damaged or destroyed, but the tile is also likely to gain additional yields.'),
		('LOC_RESOURCE_JNR_SWAMP_NAME',
		'Swamp'),
		('LOC_RESOURCE_JNR_PEAT_NAME',
		'Peat'),
		('LOC_IMPROVEMENT_JNR_OASIS_FARM_NAME',
		'Oasis Garden'),
		('LOC_IMPROVEMENT_JNR_OASIS_FARM_DESCRIPTION',
		'Unlocks the Builder ability to construct an Oasis Garden.[NEWLINE][NEWLINE]+1 [ICON_FOOD] Food. +2 [ICON_Gold] Gold for for every 2 adjacent Districts. Additional [ICON_Food] Food, [ICON_Production] Production, [ICON_Gold] Gold, and [ICON_Tourism] Tourism as you advance through the Technology and Civics Tree.[NEWLINE]Prevents [ICON_Food] Food loss during Drought.[NEWLINE]Can only be built on Oases.'),
		('LOC_IMPROVEMENT_JNR_FLOOD_FARM_NAME',
		'Irrigation Farm'),
		('LOC_IMPROVEMENT_JNR_FLOOD_FARM_DESCRIPTION',
		'Unlocks the Builder ability to construct an Irrigation Farm.[NEWLINE][NEWLINE]+1 [ICON_FOOD] Food. +2 [ICON_Gold] Gold for for every 2 adjacent Districts. Additional [ICON_Food] Food as you advance through the Technology Tree. Can only be built on Desert Floodplains.'),
		('LOC_IMPROVEMENT_JNR_REED_HOME_NAME',
		'Reed Home'),
		('LOC_IMPROVEMENT_JNR_REED_HOME_DESCRIPTION',
		'Unlocks the Builder ability to construct a Reed Home.[NEWLINE][NEWLINE]+1 [ICON_Food] Food. Additional [ICON_Production] Production as you advance through the Civics Tree. Can only be built on Marsh, Grassland Floodplains, Plains Floodplains, Tundra Floodplains, or on valid resources.[NEWLINE][NEWLINE]Can only be pillaged (never destroyed) by natural disasters.'),
		-- Mod Support
		('LOC_POK_DISTRICT_AMUN_RA_TUNDRA_FLOODPLAINS_FAITH',
		'+{1_num} [ICON_Faith] Faith from the adjacent Tundra Floodplains tile(s).'),
		('LOC_TECH_REPLACEABLE_PARTS_DESCRIPTION',
		'Farm and Irrigation Farm improvements now gain +1 [ICON_Food] Food from every adjacent Farm and Irrigation Farm improvement.');

INSERT OR REPLACE INTO EnglishText
		(Tag,	Text)
SELECT	Tag,	Text || ' +1 [ICON_Production] Production to Oasis Gardens. Allows Harvesting of [ICON_RESOURCE_JNR_PEAT] Peat.'
FROM	EnglishText
WHERE	Tag='LOC_TECH_MACHINERY_DESCRIPTION';

INSERT OR REPLACE INTO EnglishText
		(Tag,	Text)
SELECT	Tag,	Text || ' +1 [ICON_Food] Food to Oasis Gardens.'
FROM	EnglishText
WHERE	Tag='LOC_TECH_SCIENTIFIC_THEORY_DESCRIPTION';

INSERT OR REPLACE INTO EnglishText
		(Tag,	Text)
SELECT	Tag,	Text || ' +1 [ICON_Food] Food to Irrigation Farms.'
FROM	EnglishText
WHERE	Tag='LOC_CIVIC_FEUDALISM_DESCRIPTION';

INSERT OR REPLACE INTO EnglishText
		(Tag,	Text)
SELECT	Tag,	Text || ' +1 [ICON_Production] Production to Reed Homes.'
FROM	EnglishText
WHERE	Tag='LOC_CIVIC_MERCANTILISM_DESCRIPTION';

INSERT OR REPLACE INTO EnglishText
		(Tag,	Text)
SELECT	Tag,	Text || ' +2 [ICON_Gold] Gold to Oasis Gardens.'
FROM	EnglishText
WHERE	Tag='LOC_CIVIC_GLOBALIZATION_DESCRIPTION';

INSERT OR IGNORE INTO EnglishText
		(Tag,	Text)
VALUES	('LOC_TECH_MACHINERY_DESCRIPTION',
		'+1 [ICON_Production] Production to Oasis Gardens. Allows Harvesting of [ICON_RESOURCE_JNR_PEAT] Peat.');

--------------------------------------------------------------