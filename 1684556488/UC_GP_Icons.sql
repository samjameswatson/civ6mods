-- UC_GP_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR REPLACE INTO IconDefinitions
		(Name,										Atlas,						'Index')
VALUES	('ICON_BUILDING_GOV_JNR_MOCC',				'ICON_ATLAS_BUILDINGS',		38),	-- Airport
		('ICON_BUILDING_GOV_JNR_PROPAGANDA',		'ICON_ATLAS_BUILDINGS',		14),	-- Temple
		('ICON_BUILDING_GOV_JNR_DIPLOMACY',			'ICON_ATLAS_BUILDINGS',		37),	-- Research Lab
		('ICON_BUILDING_GOV_JNR_DIPLOMACY_US',		'ICON_ATLAS_BUILDINGS',		1),		-- Palace

		('ICON_BUILDING_GOV_JNR_MOCC_FOW',			'ICON_ATLAS_BUILDINGS_FOW',	38),	-- Airport
		('ICON_BUILDING_GOV_JNR_PROPAGANDA_FOW',	'ICON_ATLAS_BUILDINGS_FOW',	34),	-- Temple
		('ICON_BUILDING_GOV_JNR_DIPLOMACY_FOW',		'ICON_ATLAS_BUILDINGS_FOW',	37),	-- Research Lab
		('ICON_BUILDING_GOV_JNR_DIPLOMACY_US_FOW',	'ICON_ATLAS_BUILDINGS_FOW',	1);		-- Palace
--------------------------------------------------------------

-- IconAliases
--------------------------------------------------------------
INSERT OR REPLACE INTO IconAliases
		(Name,												OtherName)
VALUES	('ICON_POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM',	'ICON_POLICY_WILDCARD'),
		('ICON_POLICY_JNR_GOV_DIGITAL_DEMOCRACY',			'ICON_POLICY_WILDCARD'),
		('ICON_POLICY_JNR_GOV_SYNTHETIC_TECHNOCRACY',		'ICON_POLICY_WILDCARD');
--------------------------------------------------------------