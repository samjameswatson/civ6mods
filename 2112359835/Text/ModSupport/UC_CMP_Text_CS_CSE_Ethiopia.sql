-- UC_CMP_Text_CS_CSE_Ethiopia
-- Author: JNR
--------------------------------------------------------------

-- English
--------------------------------------------------------------
INSERT OR REPLACE INTO EnglishText
		(Tag,														Text)
VALUES	('LOC_CSE_SCIENTIFIC_TRAIT_SMALL_INFLUENCE_BONUS',			'+1 [ICON_Science] Science in the [ICON_Capital] Capital and in every Library or School building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',			'+2 [ICON_Science] Science in every University, Academy, and Consulate building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',			'+3 [ICON_Science] Science in every Laboratory, Liberal Arts College, and Chancery building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_BONUS',		'+4 [ICON_Science] Science in every Institute of Technology, Community College, and Chancery building.');

INSERT OR REPLACE INTO EnglishText
		(Tag,														Text)
VALUES	('LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_MEKONG_BONUS',	'+2 [ICON_Science] Science in every University, Academy, and Consulate building.'),
		('LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_MEKONG_BONUS',	'+4 [ICON_Science] Science in every Institute of Technology, Community College, and Chancery building.');
--------------------------------------------------------------

-- Portuguese
--------------------------------------------------------------
INSERT OR IGNORE INTO LocalizedText
		(Language,	Tag,												Text)
VALUES	('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_SMALL_INFLUENCE_BONUS',	'+1 de [ICON_Science] ciência na [ICON_Capital] capital e em cada edificação de Biblioteca ou Escola.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',	'+2 de [ICON_Science] ciência em cada edificação de Universidade, Academia e Consulado.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',	'+3 de [ICON_Science] ciência em cada edificação de Laboratório de Pesquisa, Faculdade de Artes Liberais e Chancelaria.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_BONUS',	'+4 de [ICON_Science] ciência em cada edificação de Instituto de Tecnologia, Universidade Comunitária e Chancelaria.');
		
INSERT OR IGNORE INTO LocalizedText
		(Language,	Tag,														Text)
VALUES	('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_MEKONG_BONUS',	'+2 de [ICON_Science] ciência em cada edificação de Universidade, Academia e Consulado.'),
		('pt_BR',	'LOC_CSE_SCIENTIFIC_TRAIT_LARGEST_INFLUENCE_MEKONG_BONUS',	'+4 de [ICON_Science] ciência em cada edificação de Instituto de Tecnologia, Universidade Comunitária e Chancelaria.');
--------------------------------------------------------------