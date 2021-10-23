-- RIB_TechCivic
-- Author: JNR
--------------------------------------------------------------

-- Technologies
--------------------------------------------------------------
UPDATE Technologies SET Description='LOC_TECH_ECONOMICS_DESCRIPTION'	WHERE TechnologyType='TECH_ECONOMICS';
UPDATE Technologies SET Description='LOC_TECH_ELECTRICITY_DESCRIPTION'	WHERE TechnologyType='TECH_ELECTRICITY';
--------------------------------------------------------------

-- Civics
--------------------------------------------------------------
UPDATE Civics SET Description='LOC_CIVIC_FEUDALISM_DESCRIPTION'			WHERE CivicType='CIVIC_FEUDALISM';
UPDATE Civics SET Description='LOC_CIVIC_ENVIRONMENTALISM_DESCRIPTION'	WHERE CivicType='CIVIC_ENVIRONMENTALISM';
--------------------------------------------------------------