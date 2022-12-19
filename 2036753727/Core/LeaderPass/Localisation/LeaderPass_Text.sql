--=============================================================================================================
-- CIVILIZATIONS EXPANDED: TEXT (LEADER PASS)
--=============================================================================================================
INSERT OR REPLACE INTO BaseGameText
		(Tag,					Text)
VALUES
--=============================================================================================================
-- JULIUS CAESAR: TBD
--=============================================================================================================
--=============================================================================================================
-- ABRAHAM LINCOLN
--=============================================================================================================
		('LOC_TRAIT_LEADER_LINCOLN_NAME',
		'Gettysburg Address'),
		('LOC_TRAIT_LEADER_LINCOLN_EXPANSION_DESCRIPTION',
		'+25% [ICON_Production] Production towards Industrial Zones and their buildings. Receive a free melee unit upon constructing an Industrial Zone or its buildings. This unit receives an additional +5 [ICON_Strength] Combat Strength and ignores Strategic resource requirements.Upon entering the Industrial Era, cities with an Industrial Zone receive +2 [ICON_Amenities] Amenities and cities without an Industrial Zone receive -5 Loyalty. Defeating enemy units within 9 tiles of the [ICON_Capital] Capital provides a burst of [ICON_GreatGeneral] Great General points if on land and [ICON_GreatAdmiral] Great Admiral points if on water.'),
		('LOC_P0K_LINCOLN_ABILITY_COMBAT_UNUSED_MOVEMENT_NAME',
		'Gettysburg Address'),
		('LOC_P0K_LINCOLN_ABILITY_COMBAT_UNUSED_MOVEMENT_DESCRIPTION',
		'+3 [ICON_Strength] Combat Strength for each unused [ICON_Movement] Movement point.'),
		('LOC_ABILITY_LINCOLN_MELEE_UNITS_DESCRIPTION',
		'+5 [ICON_Strength] Combat Strength and ignores Strategic resource requirements.'),
		-- Text changes only
		('LOC_AGENDA_PRESERVER_OF_THE_UNION_NAME',
		'Favors civilizations with the same [ICON_Government] Government type, dislikes civilizations that have different [ICON_Governments] Governments, and really dislikes civilizations with different [ICON_Government] Governments of the same era as his own.'),
--=============================================================================================================
-- NZINGA MBENDE
--=============================================================================================================
		('LOC_TRAIT_LEADER_NZINGA_MBANDE_DESCRIPTION',
		'Cities within 9 tiles of any [ICON_Capital] Capital receive +1 [ICON_Amenities] Amenity and generate +1 [ICON_InfluencePerTurn] Influence point per turn. Regional [ICON_Production] Production and [ICON_Amenities] Amenity bonuses from Industrial Zone, Entertainment Complex, and Water Park districts extend 3 tiles farther. [ICON_TradeRoute] Trade Routes to allies or City-States you are Suzerain of provide +4 [ICON_Gold] Gold, +2 [ICON_Food] Food, +2 [ICON_Culture] Culture, and +2 [ICON_Production] Production to both cities. Military units receive +1 [ICON_Strength] Combat Strength for each active Alliance.'),
		('LOC_P0K_NZINGA_ABILITY_ALLIANCE_COMBAT_NAME',
		'Strategist of Matamba'),
		('LOC_P0K_NZINGA_ABILITY_ALLIANCE_COMBAT_DESCRIPTION',
		'+{1_Amount} [ICON_Strength] Combat Strength for each Alliance.'),
		-- Text changes only
		('LOC_AGENDA_DECOLONIZATION_NAME',
		'Mother of Angola'),
--=============================================================================================================
-- SALADIN
--=============================================================================================================		
		('LOC_TRAIT_LEADER_SALADIN_ALT_NAME',
		'Ayyubid Dynasty'),
		('LOC_TRAIT_LEADER_SALADIN_ALT_DESCRIPTION',
		'+100% [ICON_GreatGeneral] Great General points. May purchase Encampment buildings with [ICON_Faith] Faith. Military and [ICON_Religion] Religious units receive doubled Flanking and Support bonuses. Training a heavy cavalry unit grants a duplicate of that unit for free. Conquered cities immediately convert to Arabia''s [ICON_Religion] Religion.'),
		('LOC_P0K_SALADIN_ABILITY_FAITH_FROM_KILLS_DESCRIPTION',
		'Combat victories grant [ICON_Faith] Faith equal to 50% of the defeated unit''s [ICON_Strength] Combat Strength.'),
		('LOC_P0K_SALADIN_CONQUEST_CONVERT_CITY_ABILITY_DESCRIPTION',
		'Conquering a city with this unit immediately converts that city to Arabia''s majority [ICON_Religion] Religion.'),
		-- Text changes only
		('LOC_ABILITY_SALADIN_FLANKING_UNITS_DESCRIPTION',
		'+100% Flanking and Support bonuses.');