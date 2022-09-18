-- UC_CMP_Text_RwF
-- Author: JNR
--------------------------------------------------------------

-- English
--------------------------------------------------------------
INSERT OR IGNORE INTO EnglishText
		(Tag,														Text)
VALUES	('LOC_POLICY_JFD_SCHOLASTIC_METHOD_DESCRIPTION_UC_JNR',		'+100% [ICON_SCIENCE] adjacency bonus for Campuses (+50% in Campuses with a University building).'),
		('LOC_POLICY_JFD_SCIENCE_ACADEMIES_DESCRIPTION_UC_JNR',		'+100% [ICON_SCIENCE] adjacency bonus for Campuses (+50% in Campuses with a University building). +100% [ICON_PRODUCTION] adjacency bonus and Industrial Zones.'),
		('LOC_POLICY_JFD_RATIONAL_BUREAUCRACY_DESCRIPTION_UC_JNR',	'+2 [ICON_SCIENCE] Science from Campus Buildings.');
--------------------------------------------------------------

-- Portuguese
--------------------------------------------------------------
INSERT OR IGNORE INTO LocalizedText
		(Language,	Tag,														Text)
VALUES	('pt_BR',	'LOC_POLICY_JFD_SCHOLASTIC_METHOD_DESCRIPTION_UC_JNR',		'+100% de bônus de adjacęncia para Campi sem uma edificaçăo de Universidade. +50% em Campi com uma edificaçăo de Universidade.'),
		('pt_BR',	'LOC_POLICY_JFD_SCIENCE_ACADEMIES_DESCRIPTION_UC_JNR',		'+100% de bônus de adjacęncia para Campi sem uma edificaçăo de Universidade. +50% em Campi com uma edificaçăo de Universidade. +100% de bônus de adjacęncia para Zonas Industriais.'),
		('pt_BR',	'LOC_POLICY_JFD_RATIONAL_BUREAUCRACY_DESCRIPTION_UC_JNR',	'+2 de [ICON_SCIENCE] Cięncia de edificaçőes de Campus.');
--------------------------------------------------------------