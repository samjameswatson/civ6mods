-- Suk_ResourceGenerator
-- Author: Sukritact
-- DateCreated: 4/14/2021 5:02:10 PM
--======================================================================================================================
if Game:GetProperty("Suk_Oceans_Resources_Spawned") then
	local tJumpFloodContinents = Game:GetProperty("Suk_Oceans_ContinentsData")
	if tJumpFloodContinents then
		ExposedMembers.Suk_Oceans_ContinentsData = tJumpFloodContinents
	end
	return
else
	Game:SetProperty("Suk_Oceans_Resources_Spawned", true)
end

include "PlotIterators"
--======================================================================================================================
-- Defines
--======================================================================================================================
local sQuery = [[
		SELECT *, (ResourceType IN (SELECT DISTINCT Type FROM TypeTags WHERE Tag = 'CLASS_SUK_LAKE_ONLY'))
		AS LakeOnly FROM Resources WHERE SeaFrequency > 0
	]]
local tResults = DB.Query(sQuery)

local tLakeOnly		= {}
local tLuxuries 	= {}
local tBonuses		= {}
local tResourceClasses = {
	RESOURCECLASS_BONUS		= tBonuses,
	RESOURCECLASS_LUXURY	= tLuxuries,
}

for _, tRow in pairs(tResults) do
	local iResource			= GameInfo.Resources[tRow.ResourceType].Index
	local sResourceClass	= tRow.ResourceClassType

	local tTable = tResourceClasses[sResourceClass]
	if tTable then
		tTable[iResource] = tRow
	end
	if tRow.LakeOnly == 1 then
		tLakeOnly[iResource] = true
	end
end

local iWidth, iHeight		= Map.GetGridSize()
local iTargetPercentage		= 40
local iLuxuryPercentage		= 19.33

local iResourceSetting		= MapConfiguration.GetValue("resources") or 0
local tResourceSettings		= {
	[1] = -3,
	--[2] = 0, -- Standard
	[3] = 3,
	[4] = TerrainBuilder.GetRandomNumber(9, "Random Resources - Lua") - 4,
	[25] = 25,
	[45] = 45,
}
iResourceSetting = tResourceSettings[iResourceSetting] or 0
iTargetPercentage = iTargetPercentage + iResourceSetting
--======================================================================================================================
-- Utility Functions
--======================================================================================================================
function DrawRandomCard(tCards, tWeights, sReason)
	assert(#tCards == #tWeights, "Cards and Weights must be equal in length")
	local sReason = sReason or "Drawing Random Card - Suk"

	local iWeightSum = 0
	for _,iWeight in ipairs(tWeights) do
		iWeightSum = iWeightSum + iWeight
	end

	local iRandomDraw = TerrainBuilder.GetRandomNumber(100, sReason)/100 * iWeightSum
	local iRunningWeight = 0
	local iDrawn = 1

	for iIndex, iWeight in ipairs(tWeights) do
		iRunningWeight = iRunningWeight + iWeight

		if iRandomDraw < iRunningWeight then
			iDrawn = iIndex
			break
		end
	end

	return tCards[iDrawn], iDrawn
end

function DrawRandomCards(tCards, tWeights, iNum, sReason)
	assert(#tCards >= iNum, "Deck smaller than specified number to draw")
	assert(iNum > 0, "Number to draw must be greater than 0")
	local tCards	= {unpack(tCards)}
	local tWeights	= {unpack(tWeights)}
	local sReason	= sReason or "Drawing Random Card - Suk"

	local tDrawn			= {}

	while #tDrawn < iNum do
		pDrawnCard, iDrawnIndex = DrawRandomCard(tCards, tWeights, sReason)

		table.insert(tDrawn, pDrawnCard)
		table.remove(tCards, iDrawnIndex)
		table.remove(tWeights, iDrawnIndex)
	end

	return unpack(tDrawn)
end

function CanHaveResource(pPlot, iResource)
	if tLakeOnly[iResource] then
		return ResourceBuilder.CanHaveResource(pPlot, iResource) and pPlot:IsLake()
	else
		return ResourceBuilder.CanHaveResource(pPlot, iResource)
	end
end
--======================================================================================================================
-- Generate Continents
--======================================================================================================================
local tJumpFloodContinents	= Suk_GetPlotContinents()
Game:SetProperty("Suk_Oceans_ContinentsData", tJumpFloodContinents)
ExposedMembers.Suk_Oceans_ContinentsData = tJumpFloodContinents

local tContinentWaterPlots	= {}
local iNumContinents		= 0
local iNumWaterPlots		= 0

local tPlotsData = {
	Plots			= {}, -- array of plots
	Continent		= {},
	IsWater			= {},
	NearbyLuxuries	= {},
	LuxuryWeight	= {},
	BonusWeight		= {},
}

for iContinent, tPlots in pairs(tJumpFloodContinents.Continents) do

	tContinentWaterPlots[iContinent] = {}
	iNumContinents = iNumContinents + 1

	for _, iPlot in pairs(tPlots) do
		local pPlot		= Map.GetPlotByIndex(iPlot)
		local bIsWater	= pPlot:IsWater()

		tPlotsData.Plots[iPlot]				= pPlot
		tPlotsData.Continent[iPlot]			= iContinent
		tPlotsData.IsWater[iPlot]			= bIsWater
		tPlotsData.NearbyLuxuries[iPlot]	= 0

		if bIsWater then
			table.insert(tContinentWaterPlots[iContinent], iPlot)
			iNumWaterPlots = iNumWaterPlots + 1
		end
	end
end

if iNumWaterPlots < 1 then return end -- Apparently this map is land only.
--======================================================================================================================
-- Generate Resource Heat Map
--======================================================================================================================
local tLuxuryMap			= Suk_MapConvolution:new(0)
local tBonusMap				= Suk_MapConvolution:new(0)

local iLakesMultiplier = 0
local iNumOceans = 0
local iNumCoasts = 0
local iNumLakes = 0
local iNumLuxuries = 0

for iY = 0, iHeight - 1, 1 do
	for iX = 0, iWidth - 1, 1 do

		local iPlot				= iY * iWidth + iX;
		local pPlot				= Map.GetPlotByIndex(iPlot)

		if pPlot:IsWater() then
			------------------------
			-- Resource Stuff
			------------------------
			local iResource		= pPlot:GetResourceType()
			local iLuxWeight	= tLuxuries[iResource] and 500 or 0
			local iBonusWight	= tBonuses[iResource] and 500 or 0

			tLuxuryMap.m_MapGrid[iPlot]	= iLuxWeight
			tBonusMap.m_MapGrid[iPlot]	= iBonusWight
			------------------------
			-- Lake or Coast
			------------------------
				if pPlot:IsLake() then
					iNumLakes = iNumLakes + 1
				elseif pPlot:GetTerrainType() == g_TERRAIN_TYPE_COAST then
					iNumCoasts = iNumCoasts + 1
				else
					iNumOceans = iNumOceans + 1
				end
			------------------------
			-- Remove Resources
			------------------------
			if iLuxWeight > 0 then
				ResourceBuilder.SetResourceType(pPlot, -1)
				iNumLuxuries = iNumLuxuries + 1
			end
		else
			tLuxuryMap.m_MapGrid[iPlot] = 0
			tBonusMap.m_MapGrid[iPlot] = 0
		end
	end
end

print("Removed luxuries from " .. iNumLuxuries .. " tiles")

iLakesMultiplier = 1 + (iNumWaterPlots - iNumLakes)/iNumWaterPlots

tLuxuryMap = tLuxuryMap:DoConvolution(g_Suk_GaussianKernel_3x3)
tLuxuryMap = tLuxuryMap:DoConvolution(g_Suk_GaussianKernel_5x5)
tLuxuryMap:DoNormalise()

tBonusMap = tBonusMap:DoConvolution(g_Suk_GaussianKernel_3x3)
tBonusMap = tBonusMap:DoConvolution(g_Suk_GaussianKernel_5x5)
tBonusMap:DoNormalise()

for iPlot = 0, #tPlotsData.Plots do
	tPlotsData.LuxuryWeight[iPlot]	= tLuxuryMap.m_MapGrid[iPlot]
	tPlotsData.BonusWeight[iPlot]	= tBonusMap.m_MapGrid[iPlot]
end
--======================================================================================================================
-- Score Luxuries for each continent
--======================================================================================================================
local tContinentLuxuries = {}

for iResource, tResource in pairs(tLuxuries) do

	local iFrequency = tResource.SeaFrequency
	tContinentLuxuries[iResource] = {}

	for iContinent, tWaterPlots in pairs(tContinentWaterPlots) do

		local iValidPlots = 0
		tContinentLuxuries[iResource][iContinent] = {Score = 0, Plots = {}}

		for _, iPlot in pairs(tWaterPlots) do
			if CanHaveResource(tPlotsData.Plots[iPlot], iResource) then
				iValidPlots = iValidPlots + 1
				table.insert(tContinentLuxuries[iResource][iContinent].Plots, iPlot)
			end
		end

		-- if tLakeOnly[iResource] then
		-- 	tContinentLuxuries[iResource][iContinent].Score = iValidPlots * iFrequency * iLakesMultiplier
		-- else
		-- 	tContinentLuxuries[iResource][iContinent].Score = iValidPlots * iFrequency
		-- end

		tContinentLuxuries[iResource][iContinent].Score = iValidPlots * iFrequency
	end
end
--======================================================================================================================
-- Place Luxuries
--======================================================================================================================
for iContinent, tWaterPlots in pairs(tContinentWaterPlots) do
	print("-------------------------------")
	print("Placing Resources for Continent:\t\t" .. iContinent)
	-------------------------------------------------
	-- Pick two random resources
	-------------------------------------------------
	local tCards	= {}
	local tWeights	= {}
	local iCount	= 0

	for iResource, tResource in pairs(tLuxuries) do
		iCount				= iCount + 1
		tCards[iCount]		= iResource
		tWeights[iCount]	= tContinentLuxuries[iResource][iContinent].Score
	end

	local tResources = {DrawRandomCards(tCards, tWeights, 2)}
	-------------------------------------------------
	-- After two resources have been picked:
	-------------------------------------------------
	if #tResources > 0 then
		-------------------------------------------------
		-- Sort Resources by number of Plots
		-------------------------------------------------
		table.sort(tResources, function(a, b)
			return #tContinentLuxuries[a][iContinent].Plots < #tContinentLuxuries[b][iContinent].Plots;
		end)
		-------------------------------------------------
		-- Calculate Max Occurences per continent
		-------------------------------------------------
		-- local iNumResourcePlots = 0
		-- local tResourcePlots	= {}

		-- for iIndex, iResource in ipairs(tResources) do
		-- 	for _,iPlot in pairs(tContinentLuxuries[iResource][iContinent].Plots) do
		-- 		if not tResourcePlots[iPlot] then
		-- 			tResourcePlots[iPlot] = true
		-- 			iNumResourcePlots = iNumResourcePlots + 1
		-- 		end
		-- 	end
		-- end

		-- local iMaxOccurences = (iTargetPercentage/100) * iNumResourcePlots * (iLuxuryPercentage/100)
		-------------------------------------------------
		-- For each resource
		-------------------------------------------------
		for _,iResource in ipairs(tResources) do
			-------------------------------------------------
			-- Lower the score for the selected resources
			-- to make them less likely to be picked again
			-------------------------------------------------
			for iContinent, tWaterPlots in pairs(tContinentWaterPlots) do
				tContinentLuxuries[iResource][iContinent].Score = math.ceil(tContinentLuxuries[iResource][iContinent].Score/8)
			end

			print("Placing Resource:\t" ..  tLuxuries[iResource].ResourceType)
			-------------------------------------------------
			-- Sort Plots by Heatmap Score
			-------------------------------------------------
			local tResourcePlots = tContinentLuxuries[iResource][iContinent].Plots
			table.sort(tResourcePlots, function(a, b)
				return tPlotsData.LuxuryWeight[a] > tPlotsData.LuxuryWeight[b]
			end)
			-------------------------------------------------
			-- Calcuate number of tiles to place
			-------------------------------------------------
			local iOccurencesPerFrequency = (iTargetPercentage/100) * #tResourcePlots * (iLuxuryPercentage/100)
			local iFrequency = tLuxuries[iResource].SeaFrequency
			local iTargetOccurences = iOccurencesPerFrequency * iFrequency

			if iTargetOccurences > 10 then iTargetOccurences = iTargetOccurences
				- math.ceil((Map.GetMapSize()+1)/2)
				+ TerrainBuilder.GetRandomNumber(Map.GetMapSize()+1, "Target Occurences Adjust - Lua")
			end

			iTargetOccurences = math.floor(iTargetOccurences + 0.5)


			--iTargetOccurences = math.min(iMaxOccurences, iResourceOccurences)

			print("Valid Plots:\t\t" ..  #tResourcePlots)
			print("Target Occurences:\t" ..  iTargetOccurences)

			local iOccurences = 0
			local iMaxWeight = 0
			for _, iPlot in ipairs(tResourcePlots) do
				if tPlotsData.LuxuryWeight[iPlot] > iMaxWeight then
					iMaxWeight = tPlotsData.LuxuryWeight[iPlot]
				end
			end
			-------------------------------------------------
			-- Actually Place Resources
			-------------------------------------------------
			for _, iPlot in ipairs(tResourcePlots) do
				local pPlot = tPlotsData.Plots[iPlot]
				if CanHaveResource(pPlot, iResource) then

					local bPlaced	= false
					local iWeight	= tPlotsData.LuxuryWeight[iPlot]/iMaxWeight
					local iNearby	= tPlotsData.NearbyLuxuries[iPlot]
					local iScore	= (iWeight^0.666) * (6 - iNearby) * 0.1666 * 100

					-- Be a bit more lax with lake resource placement
					if tLakeOnly[iResource] then
						iScore = iScore * iLakesMultiplier
					end

					if(TerrainBuilder.GetRandomNumber(100, "Resources Placement Score - Lua") <= iScore) then
						ResourceBuilder.SetResourceType(pPlot, iResource, 1)
						iOccurences = iOccurences + 1
						bPlaced = true
					end

					if bPlaced then
						for pLoopPlot in PlotRingIterator(pPlot, 1) do
							local iLoopPlot = pLoopPlot:GetIndex()
							tPlotsData.NearbyLuxuries[iLoopPlot] = tPlotsData.NearbyLuxuries[iLoopPlot] + 3
						end
						for pLoopPlot in PlotRingIterator(pPlot, 2) do
							local iLoopPlot = pLoopPlot:GetIndex()
							tPlotsData.NearbyLuxuries[iLoopPlot] = tPlotsData.NearbyLuxuries[iLoopPlot] + 2
						end
						for pLoopPlot in PlotRingIterator(pPlot, 3) do
							local iLoopPlot = pLoopPlot:GetIndex()
							tPlotsData.NearbyLuxuries[iLoopPlot] = tPlotsData.NearbyLuxuries[iLoopPlot] + 1
						end
					end
				end

				if iOccurences >= iTargetOccurences then break end
			end

			print("Occurences Placed:\t" ..  iOccurences)
		end
	end
end
--======================================================================================================================
--======================================================================================================================