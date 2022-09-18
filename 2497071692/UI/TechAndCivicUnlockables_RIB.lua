-- TechAndCivicUnlockables_RIB
-- Author: JNR
--------------------------------------------------------------

-- ===========================================================================
--	Add TRAIT_CIVILIZATION_NO_PLAYER to trait map to show improvements unlocked via modifiers
-- ===========================================================================
function GetTraitMapForPlayer(playerId)
	if(playerId == nil) then
		return nil;	
	else
		local has_trait:table = nil;
		local player = playerId and Players[playerId];
		if(player ~= nil) then
			has_trait = {};
			local config = PlayerConfigurations[playerId];
			if(config ~= nil) then
				local leaderType = config:GetLeaderTypeName();
				local civType = config:GetCivilizationTypeName();

				if(leaderType) then
					for row in GameInfo.LeaderTraits() do
						if(row.LeaderType== leaderType) then
							has_trait[row.TraitType] = true;
						end
					end
				end

				if(civType) then
					for row in GameInfo.CivilizationTraits() do
						if(row.CivilizationType== civType) then
							has_trait[row.TraitType] = true;
						end
					end
				end
				has_trait["TRAIT_CIVILIZATION_NO_PLAYER"] = true;
			end
		end
		return has_trait;
	end
end