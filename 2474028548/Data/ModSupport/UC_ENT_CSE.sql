-- UC_ENT_CSE
-- Author: JNR
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
UPDATE	Modifiers SET SubjectRequirementSetId='PLAYER_HAS_LARGEST_INFLUENCE' WHERE ModifierId='MODIFIER_CSE_ENTERTAINMENT_STADIUM_AMENITY';

UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_ENTERTAINMENT_TIER1_JNR'	WHERE ModifierId='MODIFIER_CSE_ENTERTAINMENT_ARENA_AMENITY_MOD';
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_ENTERTAINMENT_TIER2_JNR'	WHERE ModifierId='MODIFIER_CSE_ENTERTAINMENT_ZOO_AMENITY_MOD';
UPDATE Modifiers SET SubjectRequirementSetId='BUILDING_IS_ENTERTAINMENT_TIER3_JNR'	WHERE ModifierId='MODIFIER_CSE_ENTERTAINMENT_STADIUM_AMENITY_MOD';
--------------------------------------------------------------

-- TraitModifiers
--------------------------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_ENTERTAINMENT_TRAIT' AND ModifierId='MODIFIER_CSE_ENTERTAINMENT_FERRIS_WHEEL_AMENITY';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_ENTERTAINMENT_TRAIT' AND ModifierId='MODIFIER_CSE_ENTERTAINMENT_AQUARIUM_AMENITY';
DELETE FROM TraitModifiers WHERE TraitType='MINOR_CIV_CSE_ENTERTAINMENT_TRAIT' AND ModifierId='MODIFIER_CSE_ENTERTAINMENT_AQUATICS_CENTER_AMENITY';
--------------------------------------------------------------