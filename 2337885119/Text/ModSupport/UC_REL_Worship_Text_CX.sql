-- UC_REL_Worship_Text_CX
-- Author: JNR
--------------------------------------------------------------

-- English
--------------------------------------------------------------
INSERT OR REPLACE INTO EnglishText
		(Tag,													Text)
SELECT	'LOC_TRAIT_CIVILIZATION_DHARMA_EXPANSION2_DESCRIPTION',	'Holy Site buildings grant extra [ICON_Faith] Faith equal to their level. Cities with a Worship Building receive [ICON_Food] Food, [ICON_Production] Production, and [ICON_Gold] Gold equal to 15% of their [ICON_Faith] Faith output. Each city receives +1 [ICON_Amenities] Amenity from all present [ICON_Religion] Religions as well as their Follower Belief bonuses.'
FROM	LocalizedText
WHERE	Tag='LOC_P0K_LAUTARO_ABILITY_DESCRIPTION';
--------------------------------------------------------------