-- UC_CMP_Text_CS_CSE_Default
-- Author: JNR
--------------------------------------------------------------

-- English
--------------------------------------------------------------
INSERT OR REPLACE INTO EnglishText
		(Tag,														Text)
VALUES	('LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',			'+2 [ICON_Science] Science in every Library or School building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',			'+2 [ICON_Science] Science in every University or Academy building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_BONUS',		'+2 [ICON_Science] Science in every Laboratory or Liberal Arts College building.');

INSERT OR REPLACE INTO EnglishText
		(Tag,														Text)
VALUES	('LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_MEKONG_BONUS',	'+1 [ICON_Science] Science in every Library or School building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_MEKONG_BONUS',	'+3 [ICON_Science] Science in every Laboratory or Liberal Arts College building.');
--------------------------------------------------------------

-- Portuguese
--------------------------------------------------------------
INSERT OR IGNORE INTO LocalizedText
		(Language,	Tag,												Text)
VALUES	('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',	'+2 de [ICON_SCIENCE] cięncia em cada edificaçăo de Biblioteca ou Escola.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',	'+2 de [ICON_SCIENCE] cięncia em cada edificaçăo de Universidade ou Academia.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_BONUS',	'+2 de [ICON_SCIENCE] c em cada edificaçăo de Laboratório ou Faculdade de Artes Liberais.');
		
INSERT OR IGNORE INTO LocalizedText
		(Language,	Tag,														Text)
VALUES	('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_MEKONG_BONUS',	'+1 de [ICON_SCIENCE] cięncia em cada edificaçăo de Biblioteca ou Escola.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_MEKONG_BONUS',	'+3 de [ICON_SCIENCE] cięncia em cada edificaçăo de Laboratório ou Faculdade de Artes Liberais.');
--------------------------------------------------------------