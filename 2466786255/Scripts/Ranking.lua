
include( "Civ6Common" );
include( "Colors") ;
include( "InstanceManager" );
include( "PopupDialog" );
include( "SupportFunctions" );
include( "InputSupport" );
include( "LocalPlayerActionSupport" );
include( "CivilizationIcon" );
include( "LeaderIcon" );
include("ToolTipHelper");

local bIsClosing = false
local bIsWindowOpen = false
local sLastWriter = ""
local sLastRanking = ""
local iLastTurnRanked = 0
local iRankingFrequency = 25
local iCityRankLimit = 10
local bXP2 = Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68")
local bXP1 = Modding.IsModActive("1B28771A-C749-434B-9053-D1380C553DE9") or Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68")

local iMinimumGreatPeople = 3
local iMinimumWonders = 3
local iMinimumNaval = 5
local iMinimumWorks = 5

local tRankingIM = InstanceManager:new("SCRankingsInstance", "SCRankingItem", Controls.RankingStack)

local tWonders = {}

for row in GameInfo.Buildings() do
	if row.IsWonder == true then
		table.insert(tWonders, row.Index)
		--print ("Found a wonder: ", row.BuildingType, row.Index)
	end
end

local tEraRestrictedRankings = {
	"SC_RIHLA_LIST_TOURISM",
	"SC_RIHLA_LIST_DEVELOPED",
	"SC_RIHLA_LIST_GREEN",
	"SC_RIHLA_LIST_CAPTURES",
	"SC_RIHLA_LIST_SUZERAINS",
	"SC_RIHLA_LIST_PARKS",
	"SC_RIHLA_LIST_POLLUTION",
	"SC_RIHLA_LIST_GOVERNORS",
	"SC_RIHLA_LIST_IMPROVED",
	"SC_RIHLA_LIST_LOYAL",
	"SC_RIHLA_LIST_TOURISM_CITY",
	"SC_RIHLA_LIST_POWER_CITY",
}

local iGeothermal = GameInfo.Improvements["IMPROVEMENT_GEOTHERMAL_PLANT"].Index
local iSolar = GameInfo.Improvements["IMPROVEMENT_SOLAR_FARM"].Index
local iWind = GameInfo.Improvements["IMPROVEMENT_WIND_FARM"].Index
local iOffshore = GameInfo.Improvements["IMPROVEMENT_OFFSHORE_WIND_FARM"].Index
local iHydro = GameInfo.Buildings["BUILDING_HYDROELECTRIC_DAM"].Index

function SortEntries(rankings, iLimit)

	local tSorted = {}
	local iNumEntries = 0

	if rankings then
		table.sort(rankings, function(a,b) return a.Value > b.Value end)

		for i, entry in ipairs(rankings) do
			table.insert(tSorted, entry)
			iNumEntries = iNumEntries+1

			if (iLimit ~= -1) and (iNumEntries >= iLimit) then
				break
			end
		end
	end

	return tSorted
end

function ValidateRanking(sProposedRanking, iEra)

	if sProposedRanking == "SC_RIHLA_LIST_GREAT_PEOPLE" then -- count number of Great People Earned
		local pGreatPeople = Game.GetGreatPeople()
		local pPastGreats = pGreatPeople:GetPastTimeline()

		if pPastGreats ~= nil then
			if #pPastGreats >= iMinimumGreatPeople then
				print ("enough great people earned: ", #pPastGreats)
				return true
			else
				print ("not enough great people earned:", #pPastGreats)
				return false
			end
		else
			print ("Great People is nil?")
		end
	elseif sProposedRanking == "SC_RIHLA_LIST_WONDERS" then -- count buildings
		local iNumWonders = 0

		for i, player in ipairs(PlayerManager:GetAliveMajors()) do
			local pCities = player:GetCities()
			for j, pCity in pCities:Members() do
				if pCity ~= nil then
					local pBuildings = pCity:GetBuildings()
					for s, Wonder in ipairs(tWonders) do
						if pBuildings:HasBuilding(Wonder) then
							iNumWonders = iNumWonders+1
							--print ("wonder found")
							if iNumWonders >= iMinimumWonders then
								print ("enough wonders found!")
								return true
							end
						end
					end
				else
					print ("pCity is nil")
				end
			end
		end

		print ("not enough Wonders Found: ", iNumWonders)
		return false

	elseif sProposedRanking == "SC_RIHLA_LIST_SCORE" then -- Requires XP1/XP2
		if bXP1 then
			return true
		else
			return false
		end

	elseif sProposedRanking == "SC_RIHLA_LIST_GREAT_WORKS" then  -- Great works
		local iNumWorks = 0

		for i, player in ipairs(PlayerManager:GetAliveMajors()) do
			local pCities = player:GetCities()
			for j, pCity in pCities:Members() do
				if pCity ~= nil then
					local pBuildings = pCity:GetBuildings()
					for buildingInfo in GameInfo.Buildings() do
						local iBuildingIndex = buildingInfo.Index
						if pBuildings:HasBuilding(iBuildingIndex) then
							local iSlots = pBuildings:GetNumGreatWorkSlots(iBuildingIndex)
							if (iSlots ~= nil) and (iSlots > 0) then
								for index=0, iSlots-1 do
									local iGreatWork = pBuildings:GetGreatWorkInSlot(iBuildingIndex, index)
									if iGreatWork ~= -1 then
										iNumWorks = iNumWorks+1
										--print ("Great Work found")
										if iNumWorks >= iMinimumWorks then
											print ("enough Great Works found!")
											return true
										end
									end
								end
							end
						end
					end
				else
					print ("pCity is nil")
				end
			end
		end

		print ("not enough Great Works Found: ", iNumWorks)
		return false

	elseif sProposedRanking == "SC_RIHLA_LIST_NAVAL" then -- units
		local iNumNaval = 0

		for i, player in ipairs(PlayerManager:GetAliveMajors()) do
			local pUnits = player:GetUnits()
			for j, pUnit in pUnits:Members() do
				if pUnit ~= nil then
					local pUnitInfo = GameInfo.Units[pUnit:GetUnitType()]
					if pUnitInfo.Domain == "DOMAIN_SEA" then
						iNumNaval = iNumNaval+1
						if iNumNaval >= iMinimumNaval then
							print ("enough naval Units found!")
							return true
						end
					end
				else
					print ("pUnit is nil")
				end
			end
		end

		print ("not enough Naval Units Found: ", iNumNaval)
		return false
	end

	for s, RankingType in ipairs(tEraRestrictedRankings) do -- Eras (xp1/xp2 check)
		if sProposedRanking == RankingType then
			if sProposedRanking == "SC_RIHLA_LIST_POLLUTION" or sProposedRanking == "SC_RIHLA_LIST_GREEN" then -- INFORMATION
				if bXP2 then
					if iEra >= 7 then
						return true
					end
				end
				print ("Ranking Type not Valid")
				return false
			elseif sProposedRanking == "SC_RIHLA_LIST_PARKS" then -- Atomic
				if iEra >= 6 then
					return true
				end
				print ("Ranking Type not Valid")
				return false
			elseif sProposedRanking == "SC_RIHLA_LIST_POWER_CITY" then -- Modern
				if bXP2 then
					if iEra >= 5 then
						return true
					end
				end
				print ("Ranking Type not Valid")
				return false
			elseif sProposedRanking == "SC_RIHLA_LIST_TOURISM" or sProposedRanking == "SC_RIHLA_LIST_TOURISM_CITY" then -- Industrial
				if iEra >= 4 then
					return true
				end
				print ("Ranking Type not Valid")
				return false
			else -- Classical
				if iEra >= 1 then
					if sProposedRanking == "SC_RIHLA_LIST_GOVERNORS" or sProposedRanking == "SC_RIHLA_LIST_LOYAL" or sProposedRanking == "SC_RIHLA_LIST_FAVOR" then
						if bXP1 then
							return true
						end
					else
						return true
					end
				end
				print ("Ranking Type not Valid")
				return false
			end
		end
	end

	--print ("Ranking is Valid")
	return true
end

function SC_GenerateRankings(sRankingType, sRankingMethod)
	local tGeneratedRankings = {}

	if sRankingMethod == "City" then -- city Based
		for i, player in ipairs(PlayerManager:GetAliveMajors()) do
			local pCities = player:GetCities()
			for j, pCity in pCities:Members() do
				if pCity ~= nil then
					local tCityData = {}
					tCityData.ID = player:GetID()
					tCityData.Name = Locale.Lookup("LOC_SC_RIHLA_UNMET_CITY")

					local pVisibility = PlayersVisibility[Game.GetLocalPlayer()]
					if pVisibility ~= nil then
						local CityX = pCity:GetX()
						local CityY = pCity:GetY()

						if pVisibility:IsVisible(CityX, CityY) or pVisibility:IsRevealed(CityX, CityY) then
							tCityData.Name = Locale.Lookup(pCity:GetName())
						end
					end

					if sRankingType == "SC_RIHLA_LIST_POPULATION_CITY" then
						tCityData.Value = pCity:GetPopulation()
					elseif sRankingType == "SC_RIHLA_LIST_TOURISM_CITY" then
						local iTourism = 0
						local pCulture = player:GetCulture()
						local cityPlots = Map.GetCityPlots():GetPurchasedPlots(pCity)
						if cityPlots ~= nil then
							for _, plotID in ipairs(cityPlots) do
								iTourism = iTourism + pCulture:GetTourismAt(plotID)
							end
						end
						tCityData.Value = iTourism
					elseif sRankingType == "SC_RIHLA_LIST_PRODUCTION_CITY" then
						tCityData.Value = pCity:GetYield(YieldTypes.PRODUCTION)
					elseif sRankingType == "SC_RIHLA_LIST_GOLD_CITY" then
						tCityData.Value = pCity:GetYield(YieldTypes.GOLD)
					elseif sRankingType == "SC_RIHLA_LIST_CULTURE_CITY" then
						tCityData.Value = pCity:GetYield(YieldTypes.CULTURE)
					elseif sRankingType == "SC_RIHLA_LIST_FOOD_CITY" then
						tCityData.Value = pCity:GetYield(YieldTypes.FOOD)
					elseif sRankingType == "SC_RIHLA_LIST_SCIENCE_CITY" then
						tCityData.Value = pCity:GetYield(YieldTypes.SCIENCE)
					elseif sRankingType == "SC_RIHLA_LIST_FAITH_CITY" then
						tCityData.Value = pCity:GetYield(YieldTypes.FAITH)
					elseif sRankingType == "SC_RIHLA_LIST_POWER_CITY" then
						local pCityPower = pCity:GetPower()
						tCityData.Value = pCityPower:GetFreePower() + pCityPower:GetTemporaryPower()
					elseif sRankingType == "SC_RIHLA_LIST_HOUSING_CITY" then
						local pCityGrowth = pCity:GetGrowth()
						tCityData.Value = (pCityGrowth:GetHousing() - pCity:GetPopulation())*pCity:GetPopulation()
					elseif sRankingType == "SC_RIHLA_LIST_AMENITIES_CITY" then
						local pCityGrowth = pCity:GetGrowth()
						tCityData.Value = (pCityGrowth:GetAmenities() - pCityGrowth:GetAmenitiesNeeded())*pCity:GetPopulation()
					else
						print ("undefined ranking type! ", sRankingType)
					end

					table.insert(tGeneratedRankings, tCityData)
				end
			end
		end
	else -- Civ Based
		for i, player in ipairs(PlayerManager:GetAliveMajors()) do
			local tPlayerData = {}
			tPlayerData.ID = player:GetID()
			local pPlayerConfig = PlayerConfigurations[tPlayerData.ID]
			tPlayerData.Name = Locale.Lookup(pPlayerConfig:GetLeaderName())

			if sRankingType == "SC_RIHLA_LIST_GOLD" then
				tPlayerData.Value = player:GetTreasury():GetGoldBalance()
			elseif sRankingType == "SC_RIHLA_LIST_GOLD_TURN" then
				tPlayerData.Value = player:GetTreasury():GetGoldYield() - player:GetTreasury():GetTotalMaintenance()
			elseif sRankingType == "SC_RIHLA_LIST_MILITARY" then
				tPlayerData.Value = player:GetStats():GetMilitaryStrengthWithoutTreasury()
			elseif sRankingType == "SC_RIHLA_LIST_TECH" then
				tPlayerData.Value = player:GetStats():GetNumTechsResearched()
			elseif sRankingType == "SC_RIHLA_LIST_SCIENCE_TURN" then
				tPlayerData.Value = player:GetTechs():GetScienceYield()
			elseif sRankingType == "SC_RIHLA_LIST_TOURISM" then
				tPlayerData.Value = player:GetStats():GetTourism()
			elseif sRankingType == "SC_RIHLA_LIST_CIVICS" then
				local iNumCivics = 0
				for row in GameInfo.Civics() do
					--print (row.Index)
					if player:GetCulture():HasCivic(row.Index) then
						--print ("yep has this civic!")
						iNumCivics = iNumCivics+1
					end
				end
				tPlayerData.Value = iNumCivics
			elseif sRankingType == "SC_RIHLA_LIST_CULTURE_TURN" then
				tPlayerData.Value = player:GetCulture():GetCultureYield()
			elseif sRankingType == "SC_RIHLA_LIST_FAVOR" then
				tPlayerData.Value = player:GetFavorPerTurn()
			elseif sRankingType == "SC_RIHLA_LIST_FAITH" then
				tPlayerData.Value = player:GetReligion():GetFaithBalance()
			elseif sRankingType == "SC_RIHLA_LIST_FAITH_TURN" then
				tPlayerData.Value = player:GetReligion():GetFaithYield()
			elseif sRankingType == "SC_RIHLA_LIST_TRADE_ROUTES" then
				tPlayerData.Value = player:GetTrade():GetOutgoingRouteCapacity()
			elseif sRankingType == "SC_RIHLA_LIST_POLLUTION" then
				tPlayerData.Value = GameClimate.GetPlayerCO2Footprint(tPlayerData.ID, false)
			elseif sRankingType == "SC_RIHLA_LIST_SCORE" then
				tPlayerData.Value = Game.GetEras():GetPlayerCurrentScore(tPlayerData.ID)
			elseif sRankingType == "SC_RIHLA_LIST_NAVAL" then
				local iNumNaval = 0
				for j, pUnit in player:GetUnits():Members() do
					if pUnit ~= nil then
						local pUnitInfo = GameInfo.Units[pUnit:GetUnitType()]
						if pUnitInfo.Domain == "DOMAIN_SEA" then
							iNumNaval = iNumNaval+1
						end
					else
						print ("pUnit is nil")
					end
				end
				tPlayerData.Value = iNumNaval
			elseif sRankingType == "SC_RIHLA_LIST_GOVERNORS" then
				tPlayerData.Value = player:GetGovernors():GetGovernorPointsSpent()
			elseif sRankingType == "SC_RIHLA_LIST_GREAT_PEOPLE" then
				local iNumGreatPeople = 0
				local pPastGreats = Game.GetGreatPeople():GetPastTimeline()

				for j, entry in ipairs(pPastGreats) do
					if entry.claimant == tPlayerData.ID then
						iNumGreatPeople = iNumGreatPeople+1
						print ("yup this is our great person: ", entry.Individual)
					end
				end
				tPlayerData.Value = iNumGreatPeople
			elseif sRankingType == "SC_RIHLA_LIST_SUZERAINS" then
				local iNumberSuzerained = 0

				for j, CityState in ipairs(PlayerManager.GetAliveMinors()) do
					if CityState:GetInfluence():GetSuzerain() == tPlayerData.ID then
						iNumberSuzerained = iNumberSuzerained+1
					end
				end
				tPlayerData.Value = iNumberSuzerained
			elseif sRankingType == "SC_RIHLA_LIST_LUXURIES" then
				local iNumLux = 0

				for row in GameInfo.Resources() do
					if row.ResourceClassType == "RESOURCECLASS_LUXURY" then
						local iAmount = player:GetResources():GetResourceAmount(row.Index)
						if iAmount > 0 then
							--print ("has resource ", row.Name)
							iNumLux = iNumLux+1
						end
					end
				end
				tPlayerData.Value = iNumLux
			else -- will need to iterate through cities
				local pCities = player:GetCities()

				local iNumCities = 0
				local iTotalPop = 0
				local iFoodSurplus = 0
				local iProduction = 0
				local iAmenities = 0
				local iCaptured = 0
				local iLoyalty = 0
				local iDistricts = 0
				local iWonders = 0
				local iGreatWorks = 0
				local iParks = 0
				local iImprovements = 0
				local iGreen = 0
				
				for j, pCity in pCities:Members() do
					if pCity ~= nil then
						iNumCities = iNumCities + 1
						iTotalPop = iTotalPop + pCity:GetPopulation()
						if sRankingType == "SC_RIHLA_LIST_POPULATION" or sRankingType == "SC_RIHLA_LIST_TALL" or sRankingType == "SC_RIHLA_LIST_WIDE" then
							-- nothing more needed
						elseif sRankingType == "SC_RIHLA_LIST_FOOD" then
							iFoodSurplus = iFoodSurplus + pCity:GetGrowth():GetFoodSurplus()
						elseif sRankingType == "SC_RIHLA_LIST_PRODUCTION" then
							iProduction = iProduction + pCity:GetYield(YieldTypes.PRODUCTION)
						elseif sRankingType == "SC_RIHLA_LIST_AMENITIES" then
							local pCityGrowth = pCity:GetGrowth()
							iAmenities = iAmenities + (pCityGrowth:GetAmenities() - pCityGrowth:GetAmenitiesNeeded())*pCity:GetPopulation()
						elseif sRankingType == "SC_RIHLA_LIST_CAPTURES" then
							if tPlayerData.ID ~= pCity:GetOriginalOwner() then
								iCaptured = iCaptured + 1
							end
						elseif sRankingType == "SC_RIHLA_LIST_LOYAL" then
							local pIdentity = pCity:GetCulturalIdentity()
							iLoyalty = iLoyalty + pIdentity:GetLoyalty()
						elseif sRankingType == "SC_RIHLA_LIST_DEVELOPED" then
							print ("developed")
							local pDistricts = pCity:GetDistricts()
							for k, District in pDistricts:Members() do
								iDistricts = iDistricts+1
							end
							-- BUILDINGS
						elseif sRankingType == "SC_RIHLA_LIST_GREAT_WORKS" or sRankingType == "SC_RIHLA_LIST_WONDERS" then
							local pBuildings = pCity:GetBuildings()

							if sRankingType == "SC_RIHLA_LIST_GREAT_WORKS" then
								for buildingInfo in GameInfo.Buildings() do
									local iBuildingIndex = buildingInfo.Index
									if pBuildings:HasBuilding(iBuildingIndex) then
										local iSlots = pBuildings:GetNumGreatWorkSlots(iBuildingIndex)
										if (iSlots ~= nil) and (iSlots > 0) then
											for index=0, iSlots-1 do
												local iGreatWork = pBuildings:GetGreatWorkInSlot(iBuildingIndex, index)
												if iGreatWork ~= -1 then
													iGreatWorks = iGreatWorks+1
												end
											end
										end
									end
								end
							elseif sRankingType == "SC_RIHLA_LIST_WONDERS" then
								for s, Wonder in ipairs(tWonders) do
									if pBuildings:HasBuilding(Wonder) then
										iWonders = iWonders+1
										--print ("wonder found")
									end
								end
							end
							-- PLOTS
						else
							local pPlots = Map.GetCityPlots():GetPurchasedPlots(pCity)
							if pPlots ~= nil then
								for _, plotID in ipairs(pPlots) do
									local pCityPlot = Map.GetPlotByIndex(plotID)
									if sRankingType == "SC_RIHLA_LIST_PARKS" then
										if pCityPlot:IsNationalPark() then
											iParks = iParks+1
										end
									elseif sRankingType == "SC_RIHLA_LIST_IMPROVED" then
										local iImprovement = pCityPlot:GetImprovementType()
										if iImprovement ~= -1 then
											iImprovements = iImprovements+1
										end
									elseif sRankingType == "SC_RIHLA_LIST_GREEN" then
										local iImprovement = pCityPlot:GetImprovementType()
										if iImprovement == iGeothermal or iImprovement == iSolar or iImprovement == iWind or iImprovement == iOffshore then
											iGreen = iGreen+1
											print ("green improvment found")
										end
										local pCityBuildings = pCity:GetBuildings()
										local pBuildingsInPlot = pCityBuildings:GetBuildingsAtLocation(plotID)
										for b, building in ipairs(pBuildingsInPlot) do
											--print (building)
											if building == iHydro then
												iGreen = iGreen+1
												print ("hydro plant found")
											end
										end
									end
								end
							else
								print ("pPlots is nil?")
							end
						end
					else
						print ("City is nil?")
					end
				end

				if iNumCities == 0 then
					iNumCities = 1
				else
					if sRankingType == "SC_RIHLA_LIST_POPULATION" then
						tPlayerData.Value = iTotalPop
					elseif sRankingType == "SC_RIHLA_LIST_TALL" then
						tPlayerData.Value = iTotalPop/iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_WIDE" then
						tPlayerData.Value = iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_FOOD" then
						tPlayerData.Value = iFoodSurplus/iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_PRODUCTION" then
						tPlayerData.Value = iProduction/iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_AMENITIES" then
						tPlayerData.Value = iAmenities/iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_CAPTURES" then
						tPlayerData.Value = iCaptured
					elseif sRankingType == "SC_RIHLA_LIST_LOYAL" then
						tPlayerData.Value = iLoyalty/iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_DEVELOPED" then
						tPlayerData.Value = iDistricts/iNumCities
					elseif sRankingType == "SC_RIHLA_LIST_GREAT_WORKS" then
						tPlayerData.Value = iGreatWorks
					elseif sRankingType == "SC_RIHLA_LIST_WONDERS" then
						tPlayerData.Value = iWonders
					elseif sRankingType == "SC_RIHLA_LIST_PARKS" then
						tPlayerData.Value = iParks
					elseif sRankingType == "SC_RIHLA_LIST_IMPROVED" then
						tPlayerData.Value = iImprovements
					elseif sRankingType == "SC_RIHLA_LIST_GREEN" then
						tPlayerData.Value = iGreen
					else
						print ("undefined ranking type:", sRankingType)
					end
				end
			end
			table.insert(tGeneratedRankings, tPlayerData)
		end
	end

	return tGeneratedRankings
end

function ShowRankings()
	if bIsClosing then
		print ("whoops")
		return
	end

	pLocalPlayer = Players[Game.GetLocalPlayer()]
	iLocalPlayer = pLocalPlayer:GetID()

	EffectsManager:PauseAllEffects()

	Controls.RankingsAlphaIn:SetToBeginning();
	Controls.RankingsAlphaIn:Play();
	Controls.RankingsSlideIn:SetToBeginning();
	Controls.RankingsSlideIn:Play();

	Controls.RankingsName:SetText(Locale.ToUpper(Locale.Lookup("LOC_SC_RIHLA_TITLE_BANNER")))

	local iEra = 0

	if bXP1 then
		iEra = Game.GetEras():GetCurrentEra()
		--print ("Current era is: ", iEra)
	else
		iEra = Players[Game.GetLocalPlayer()]:GetEra()
		--print ("Current era is: ", iEra)
	end

	local tWriter = {}
	local sWriterType = ""
	local sWriterTextType = ""
	local bWriterCleared = false

	while bWriterCleared == false do
		tWriter = DB.Query("SELECT WriterType, WriterTextType from SC_Rihla_Writers WHERE EraType = ? ORDER BY RANDOM() LIMIT 1", iEra)
	
		if tWriter then
			for i, row in ipairs(tWriter) do
				if row.WriterType == sLastWriter then
					print (row.WriterType, " just wrote! Picking a new one")
				else
					print ("found a writer: ", row.WriterType)
					sWriterType = "LOC_" .. row.WriterType
					sWriterTextType = "LOC_SC_RIHLA_" .. row.WriterTextType
					sLastWriter = row.WriterType
					bWriterCleared = true
				end
			end
		else
			print ("ruh-roh!")
			bWriterCleared = true
		end
	end


	local tRankingType = {}
	local sRankingType = ""
	local sRankingName = ""
	local sRankingMethod = ""

	local bRankingCleared = false

	while bRankingCleared == false do
		tRankingType = DB.Query("SELECT ListType, RankingType from SC_Rihla_Lists ORDER BY RANDOM() LIMIT 1")
		if tRankingType then
			for i, row in ipairs(tRankingType) do
				if row.ListType == sLastRanking then
					print (row.ListType, " was just used! Picking a new one")
				else
					print ("found a ranking system: ", row.ListType)

					if ValidateRanking(row.ListType, iEra) == true then
						print ("list is okay!")
						bRankingCleared = true
						sRankingType = row.ListType
						sRankingName = "LOC_" .. row.ListType
						sLastRanking = sRankingType
						sRankingMethod = row.RankingType
					else
						print (row.ListType, " is not allowed! Picking a new one")
					end
				end
			end
		else
			print ("double ruh-roh!")
			bRankingCleared = true
			break
		end
	end

	Controls.RankingsBlurb:SetText(Locale.Lookup(sWriterType) .. Locale.Lookup(sWriterTextType))
	Controls.RankingsType:SetText(Locale.Lookup(sRankingName))
	Controls.RankingsType:LocalizeAndSetToolTip(sRankingName .. "_TT")

	tRankingIM:ResetInstances()

	local tFreshRankings = SC_GenerateRankings(sRankingType, sRankingMethod)

	local tSortedRankings = {}
	local iLastValue = -999
	local iRankNumber = 0
	local iRankPlace = 1

	local tSortedRankings = SortEntries(tFreshRankings, iCityRankLimit)

	if tSortedRankings ~= nil then
		for i, Entry in ipairs(tSortedRankings) do
			local tItemInstance = tRankingIM:GetInstance()
			tItemInstance.SCRankingIdentifier:SetText("") -- need to clear it out apparently

			local sLeaderName = Entry.Name

			if Entry.ID == iLocalPlayer then
				if sRankingMethod == "Civ" then
					tItemInstance.SCRankingIdentifier:SetText(Locale.Lookup("LOC_SC_RIHLA_YOU"))
				end
			elseif not pLocalPlayer:GetDiplomacy():HasMet(Entry.ID) then
				if sRankingMethod == "Civ" then
					sLeaderName = Locale.Lookup("LOC_SC_RIHLA_UNMET_CIV")
				end
			elseif Players[Entry.ID]:IsHuman() then
				if sRankingMethod == "Civ" then
					local sPlayerName = Locale.Lookup(pPlayerConfig:GetPlayerName())
					tItemInstance.SCRankingIdentifier:SetText("(" .. sPlayerName .. ")")
				end
			end

			iRankNumber = iRankNumber+1

			if Entry.Value == iLastValue then
				-- tie
			else
				iRankPlace = iRankNumber
				iLastValue = Entry.Value
			end

			local civIconController = CivilizationIcon:AttachInstance(tItemInstance.CivIcon)
			civIconController:UpdateIconFromPlayerID(Entry.ID)
			civIconController:SetLeaderTooltip(Entry.ID)

			tItemInstance.SCRankingsPosition:SetText(iRankPlace .. ".")
			tItemInstance.SCRankingsName:SetText(sLeaderName)
			tItemInstance.SCRankingsNumber:SetText(Round(Entry.Value, 0))
			tItemInstance.SCRankingsNumber:LocalizeAndSetToolTip(sRankingName .. "_NUMBER_TT")
		end
	else
		print ("table is empty?")
	end

	iLastTurnRanked = Game.GetCurrentGameTurn()
	ContextPtr:SetHide(false)
	bIsWindowOpen = true

end

function SC_LocalPlayerTurnStart()
	print ("should be firing!")
	ShowRankings()
end

function CloseWindow()
	if bIsClosing then
		return
	end

	bIsClosing = true

	EffectsManager:ResumeAllEffects()

	if (Controls.RankingsAlphaIn:IsStopped()) then
		-- Animation is good for a nice clean animation out..
		Controls.RankingsAlphaIn:Reverse();
		Controls.RankingsAlphaIn:Reverse();
		Controls.RankingsWindowClose:SetToBeginning();
		Controls.RankingsWindowClose:Play();
	else
		-- Animation is not in an expected state, just reset all...
		Controls.RankingsAlphaIn:SetToBeginning();
		Controls.RankingsSlideIn:SetToBeginning();
		Controls.RankingsWindowClose:SetToBeginning();
	end

	bIsClosing = false
	ContextPtr:SetHide(true)
	bIsWindowOpen = false
	UI.PlaySound("UI_Screen_Close")
end

function OnInput(input)

	local iInput = input:GetMessageType()

	if (iInput == KeyEvents.KeyUp) and (bIsWindowOpen == true) then
		if input:GetKey() == Keys.VK_ESCAPE then
			CloseWindow()
			return true
		end
	end

	return false
end

function SC_LocalPlayerTurnEnd()
	if bIsWindowOpen == true then
		CloseWindow()
	end
end

function SC_Should_Rank()
	local iTurn = Game.GetCurrentGameTurn()

	if math.fmod(iTurn, iRankingFrequency) == 0 then
		ShowRankings()
	end
end

function Initialize()

	Events.LocalPlayerTurnBegin.Add(SC_Should_Rank)
	Events.LocalPlayerTurnEnd.Add(SC_LocalPlayerTurnEnd)

	ContextPtr:SetInputHandler(OnInput, true)

	Controls.CloseButton:RegisterCallback(Mouse.eLClick, CloseWindow);
	ContextPtr:SetHide(true)

	print("SC_Rankings has loaded")
end

Initialize()