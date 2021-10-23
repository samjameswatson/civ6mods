-- UC_CMP_Text_CS_CSB
-- Author: JNR
--------------------------------------------------------------

-- English
--------------------------------------------------------------
INSERT OR REPLACE INTO EnglishText
		(Tag,														Text)
VALUES	('LOC_MINOR_CIV_SCIENTIFIC_TRAIT_SMALL_INFLUENCE_BONUS',	'+1 [ICON_Science] Science in the [ICON_Capital] Capital and in every Library or School building.'),
		('LOC_MINOR_CIV_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',	'+2 [ICON_Science] Science in every University or Academy building.'),
		('LOC_MINOR_CIV_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',	'+3 [ICON_Science] Science in every Laboratory or Liberal Arts College building.');
--------------------------------------------------------------

-- Portuguese
--------------------------------------------------------------
INSERT OR IGNORE INTO LocalizedText
		(Language,	Tag,														Text)
VALUES	('pt_BR',	'LOC_MINOR_CIV_SCIENTIFIC_TRAIT_SMALL_INFLUENCE_BONUS',		'Placeholder'),
		('pt_BR',	'LOC_MINOR_CIV_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',	'+2 de [ICON_SCIENCE] cięncia em cada edificaçăo de Universidade ou Academia.'),
		('pt_BR',	'LOC_MINOR_CIV_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',		'+2 de [ICON_SCIENCE] cięncia em cada edificaçăo de Laboratório ou Faculdade de Artes Liberais.');
--------------------------------------------------------------