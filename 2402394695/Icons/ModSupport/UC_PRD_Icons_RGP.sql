-- UC_PRD_Icons_RGP
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Name,															IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_ARCHIMEDES',			160,		1,				1,				'RGP_Archimedes.dds'),
		('ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_LI_BING',				160,		1,				1,				'RGP_Li_Bing.dds'),
		('ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_MA_JUN',				160,		1,				1,				'RGP_Ma_Jun.dds'),
		('ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_MARTINE_DE_BERTEREAU',	160,		1,				1,				'RGP_Martine_de_Bertereau.dds');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,														Atlas,															'Index')
VALUES	('ICON_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',				'ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_ARCHIMEDES',			0),
		('ICON_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',				'ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_LI_BING',				0),
		('ICON_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',					'ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_MA_JUN',				0),
		('ICON_GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU',	'ICON_ATLAS_JNR_GREAT_PERSON_INDIVIDUAL_MARTINE_DE_BERTEREAU',	0);
--------------------------------------------------------------