-- Wetlands_ModSupport
-- Author: JNR
--------------------------------------------------------------

-- p0kiehl's Better Pantheons
--------------------------------------------------------------
DELETE FROM RequirementSetRequirements WHERE RequirementSetId='P0K_REEDS_REQUIREMENTS' AND RequirementId='P0K_BP_REQUIRES_PLOT_HAS_GRASSLAND_FLOODPLAINS';
DELETE FROM RequirementSetRequirements WHERE RequirementSetId='P0K_REEDS_REQUIREMENTS' AND RequirementId='P0K_BP_REQUIRES_PLOT_HAS_PLAINS_FLOODPLAINS';
UPDATE RequirementSetRequirements SET RequirementId='REQUIRES_PLOT_HAS_FLOODPLAINS_TAG'	WHERE RequirementSetId='P0K_REEDS_REQUIREMENTS' AND RequirementId='REQUIRES_PLOT_HAS_FLOODPLAINS';
--------------------------------------------------------------

-- p0kiehl's Lady of the Reeds and Marshes++
--------------------------------------------------------------
DELETE FROM RequirementSetRequirements WHERE RequirementSetId='P0K_REEDS_PLOT_HAS_REEDS_REQUIREMENTS' AND RequirementId='P0K_REEDS_REQUIRES_PLOT_HAS_GRASSLAND_FLOODPLAINS';
DELETE FROM RequirementSetRequirements WHERE RequirementSetId='P0K_REEDS_PLOT_HAS_REEDS_REQUIREMENTS' AND RequirementId='P0K_REEDS_REQUIRES_PLOT_HAS_PLAINS_FLOODPLAINS';
UPDATE RequirementSetRequirements SET RequirementId='REQUIRES_PLOT_HAS_FLOODPLAINS_TAG'	WHERE RequirementSetId='P0K_REEDS_PLOT_HAS_REEDS_REQUIREMENTS' AND RequirementId='REQUIRES_PLOT_HAS_FLOODPLAINS';
--------------------------------------------------------------

-- p0kiehl's Precinct of Amun-Ra
--------------------------------------------------------------
INSERT INTO Adjacency_YieldChanges
		(ID,										Description,											YieldType,	YieldChange,	TilesRequired,	AdjacentFeature)
SELECT	'Pok_Amun_Ra_Tundra_Floodplains_Faith',	'LOC_POK_DISTRICT_AMUN_RA_TUNDRA_FLOODPLAINS_FAITH',	YieldType,	YieldChange,	TilesRequired,	'FEATURE_FLOODPLAINS_TUNDRA'
FROM	Adjacency_YieldChanges
WHERE	ID='Pok_Amun_Ra_Floodplains_Faith';

INSERT INTO District_Adjacencies
		(DistrictType,	YieldChangeId)
SELECT	DistrictType,	'Pok_Amun_Ra_Tundra_Floodplains_Faith'
FROM	District_Adjacencies
WHERE	YieldChangeId='Pok_Amun_Ra_Floodplains_Faith';
--------------------------------------------------------------

-- Latin American Resources
--------------------------------------------------------------
INSERT INTO Resource_ValidFeatures
		(ResourceType,	FeatureType)
SELECT	ResourceType,	'FEATURE_FLOODPLAINS_TUNDRA'
FROM	Resource_ValidTerrains
WHERE	ResourceType='RESOURCE_LEU_P0K_POTATOES' AND TerrainType='TERRAIN_TUNDRA';
--------------------------------------------------------------

-- Resourceful 2
--------------------------------------------------------------
INSERT INTO Resource_ValidFeatures
		(ResourceType,	FeatureType)
SELECT	ResourceType,	'FEATURE_FLOODPLAINS_TUNDRA'
FROM	Resource_ValidTerrains
WHERE	ResourceType IN ('RESOURCE_BERRIES', 'RESOURCE_WOLF', 'RESOURCE_MUSHROOMS', 'RESOURCE_BARLEY') AND TerrainType='TERRAIN_TUNDRA';
--------------------------------------------------------------