--===========================================================================================================================================================================--
-- Author: Albro
-- Create date: 2021-09-17
-- Description: Adds support for UC mod.
--==========================================================================================================================================================================--

--===============================================================================================================================================================================--
/* SECTION 1: DISTRICT */
--===============================================================================================================================================================================--
	UPDATE Policies 
	SET Description='LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC_ARS' 
	WHERE PolicyType='POLICY_THIRD_ALTERNATIVE';
