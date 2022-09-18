-- UC_GP_Policies
-- Author: JNR
--------------------------------------------------------------

-- Types
--------------------------------------------------------------
INSERT OR REPLACE INTO Types
		(Type,										Kind)
VALUES	('POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM',	'KIND_POLICY'),
		('POLICY_JNR_GOV_DIGITAL_DEMOCRACY',		'KIND_POLICY'),
		('POLICY_JNR_GOV_SYNTHETIC_TECHNOCRACY',	'KIND_POLICY');
--------------------------------------------------------------

-- Policies
--------------------------------------------------------------
INSERT OR REPLACE INTO Policies
		(PolicyType,								Name,											Description, 										GovernmentSlotType,	RequiresGovernmentUnlock)
VALUES	('POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM',	'LOC_POLICY_JNR_CORPORATE_LIBERTARIANISM_NAME',	'LOC_GOVT_INHERENT_BONUS_CORPORATE_LIBERTARIANISM',	'SLOT_WILDCARD',	1),
		('POLICY_JNR_GOV_DIGITAL_DEMOCRACY',		'LOC_POLICY_JNR_DIGITAL_DEMOCRACY_NAME',		'LOC_GOVT_INHERENT_BONUS_DIGITAL_DEMOCRACY',		'SLOT_WILDCARD',	1),
		('POLICY_JNR_GOV_SYNTHETIC_TECHNOCRACY',	'LOC_POLICY_JNR_SYNTHETIC_TECHNOCRACY_NAME',	'LOC_GOVT_INHERENT_BONUS_GOVSYNTHETIC_TECHNOCRACY',	'SLOT_WILDCARD',	1);
--------------------------------------------------------------

-- Governments
--------------------------------------------------------------
UPDATE Governments SET PolicyToUnlock='POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM'	WHERE GovernmentType='GOVERNMENT_CORPORATE_LIBERTARIANISM';
UPDATE Governments SET PolicyToUnlock='POLICY_JNR_GOV_DIGITAL_DEMOCRACY'		WHERE GovernmentType='GOVERNMENT_DIGITAL_DEMOCRACY';
UPDATE Governments SET PolicyToUnlock='POLICY_JNR_GOV_SYNTHETIC_TECHNOCRACY'	WHERE GovernmentType='GOVERNMENT_SYNTHETIC_TECHNOCRACY';
--------------------------------------------------------------

-- PolicyModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO PolicyModifiers
		(PolicyType,								ModifierId)
VALUES	('POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM',	'CORPORATE_LIBERTARIANISM_RESOURCE_EXTRACTION'),
		('POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM',	'CORPORATE_LIBERTARIANISM_COMMERCIAL_HUB_PRODUCTION'),
		('POLICY_JNR_GOV_CORPORATE_LIBERTARIANISM',	'CORPORATE_LIBERTARIANISM_ENCAMPMENT_PRODUCTION'),
		('POLICY_JNR_GOV_DIGITAL_DEMOCRACY',		'DIGITAL_DEMOCRACY_CITY_AMENITIES'),
		('POLICY_JNR_GOV_DIGITAL_DEMOCRACY',		'DIGITAL_DEMOCRACY_DISTRICT_CULTURE'),
		('POLICY_JNR_GOV_SYNTHETIC_TECHNOCRACY',	'SYNTHETIC_TECHNOCRACY_CITY_POWER'),
		('POLICY_JNR_GOV_SYNTHETIC_TECHNOCRACY',	'SYNTHETIC_TECHNOCRACY_CITY_PROJECT_PRODUCTION');
--------------------------------------------------------------