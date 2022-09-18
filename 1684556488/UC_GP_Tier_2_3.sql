-- UC_GP_Tier_2_3
-- Author: JNR
--------------------------------------------------------------

-- BuildingModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO BuildingModifiers
		(ModifierId,										BuildingType)
SELECT	'MAJOR_CIV_JNR_BORDER_GROWTH_ERA_BONUS_CLASSIC',	a.BuildingType FROM Buildings a WHERE a.GovernmentTierRequirement='Tier2';

INSERT OR REPLACE INTO BuildingModifiers
		(ModifierId,										BuildingType)
SELECT	'JNR_UC_GP_GOV_3_TILE_PURCHASE_COST',				a.BuildingType FROM Buildings a WHERE a.GovernmentTierRequirement='Tier3';

INSERT OR REPLACE INTO BuildingModifiers
		(ModifierId,										BuildingType)
SELECT	'JNR_UC_GP_GOV_3_FAST_BORDER_GROWTH',				a.BuildingType FROM Buildings a WHERE a.GovernmentTierRequirement='Tier3';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers
		(ModifierId,								ModifierType)
VALUES	('JNR_UC_GP_GOV_2_SETTLER_PRODUCTION',		'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION'),
		('JNR_UC_GP_GOV_3_TILE_PURCHASE_COST',		'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST'),
		('JNR_UC_GP_GOV_3_FAST_BORDER_GROWTH',		'MODIFIER_ALL_CITIES_CULTURE_BORDER_EXPANSION');
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,								Name,		Value)
VALUES	('JNR_UC_GP_GOV_2_SETTLER_PRODUCTION',		'UnitType',	'UNIT_SETTLER'),
		('JNR_UC_GP_GOV_2_SETTLER_PRODUCTION',		'Amount',	50),
		('JNR_UC_GP_GOV_3_TILE_PURCHASE_COST',		'Amount',	-50),
		('JNR_UC_GP_GOV_3_FAST_BORDER_GROWTH',		'Amount',	500);
--------------------------------------------------------------