-- Clothing Items
local cITEMS = {}

-- cITEMS.headgear_armytrooper_standard = {
-- 	["name"] = "Imperial Army Helmet (Standard)",
-- 	["model"] = "models/stardust/props/container_closed.mdl",
-- 	["description"] = "",
-- 	["flag"] = "2",
-- 	["weight"] = 2,
-- 	["ap"] = 5,
-- 	["width"] = 2,
-- 	["height"] = 1,
-- 	["price"] = 500,
-- 	["bmSlot"] = "head",
-- 	["bmModel"] = "models/stardust/outfits/headgear_armytrooper.mdl"
-- }

-- Clothing Upgrade Items
local uITEMS = {}

-- uITEMS.attachment_headgear_armytrooper_visorup = {
-- 	["name"] = "Army Trooper Goggles (Up)",
-- 	["model"] = "models/stardust/props/container_closed.mdl",
-- 	["description"] = "",
-- 	["ap"] = 1,
-- 	["flag"] = "2",
-- 	["weight"] = 0.25,
-- 	["width"] = 1,
-- 	["height"] = 1,
-- 	["price"] = 200,
-- 	["bgnames"] = {"Visor"},
-- 	["models"] = {"models/stardust/outfits/headgear_armytrooper.mdl", "models/stardust/outfits/headgear_armytrooper_black.mdl", "models/stardust/outfits/headgear_armytrooper_green.mdl", "models/stardust/outfits/headgear_armytrooper_white.mdl"},
-- 	["slot"] = 1,
-- 	["bgy"] = 1,
-- }

-- DO NOT TOUCH BELOW IT ADDS THE ITEMS TO THE SCHEMA

for k, v in pairs(cITEMS) do
	local ITEM = ix.item.Register(k, "base_bmclothing", false, nil, true)
	ITEM.name = v.name
	ITEM.model = v.model or "models/stardust/props/container_closed.mdl"
	ITEM.description = v.description or "Insert Description Here"
	ITEM.category = "Clothing"
	ITEM.ap = v.ap or 0
	ITEM.price = v.price or 100000000
	ITEM.weight = v.weight or 100000000
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.bmSlot = v.bmSlot
	ITEM.bmModel = v.bmModel
	ITEM.bmSkin = v.bmSkin or 0
end

for k, v in pairs(uITEMS) do
	local ITEM = ix.item.Register(k, "base_bmupgrades", false, nil, true)
	ITEM.name = v.name
	ITEM.model = v.model or "models/stardust/props/container_closed.mdl"
	ITEM.description = v.description or "Insert Description Here"
	ITEM.category = "Clothing Upgrades"
	ITEM.ap = v.ap or 0
	ITEM.price = v.price or 100000000
	ITEM.weight = v.weight or 100000000
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.bmSlot = v.bmSlot or nil
	ITEM.bgnames = v.bgnames or nil
	ITEM.bgy = v.bgy or 0
	ITEM.models = v.models or nil
	ITEM.slot = v.slot or 0
end