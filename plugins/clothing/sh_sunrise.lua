local CLOTHING = {}

CLOTHING.outfit_sunrise_loner1 = {
	["bmSkin"] = 0
}
CLOTHING.outfit_sunrise_loner2 = {
	["bmSkin"] = 1
}
CLOTHING.outfit_sunrise_loner3 = {
	["bmSkin"] = 2
}
CLOTHING.outfit_sunrise_loner4 = {
	["bmSkin"] = 3
}
CLOTHING.outfit_sunrise_loner5 = {
	["bmSkin"] = 4
}
CLOTHING.outfit_sunrise_loner6 = {
	["bmSkin"] = 5
}
CLOTHING.outfit_sunrise_loner7 = {
	["bmSkin"] = 6
}
CLOTHING.outfit_sunrise_loner8 = {
	["bmSkin"] = 7
}
CLOTHING.outfit_sunrise_loner9 = {
	["bmSkin"] = 8
}
CLOTHING.outfit_sunrise_loner10 = {
	["bmSkin"] = 9
}
CLOTHING.outfit_sunrise_loner11 = {
	["bmSkin"] = 10
}
CLOTHING.outfit_sunrise_loner12 = {
	["bmSkin"] = 11
}
CLOTHING.outfit_sunrise_loner13 = {
	["bmSkin"] = 12
}
CLOTHING.outfit_sunrise_loner14 = {
	["bmSkin"] = 13
}
CLOTHING.outfit_sunrise_loner15 = {
	["bmSkin"] = 14
}
CLOTHING.outfit_sunrise_loner16 = {
	["bmSkin"] = 15
}
CLOTHING.outfit_sunrise_loner17 = {
	["bmSkin"] = 16
}
CLOTHING.outfit_sunrise_loner18 = {
	["bmSkin"] = 17
}
CLOTHING.outfit_sunrise_loner19 = {
	["bmSkin"] = 18
}
CLOTHING.outfit_sunrise_loner20 = {
	["bmSkin"] = 19
}
CLOTHING.outfit_sunrise_loner21 = {
	["bmSkin"] = 20
}
CLOTHING.outfit_sunrise_loner22 = {
	["bmSkin"] = 21
}
CLOTHING.outfit_sunrise_merc1 = {
	["bmSkin"] = 22
}
CLOTHING.outfit_sunrise_military1 = {
	["bmSkin"] = 23
}
CLOTHING.outfit_sunrise_monolith1 = {
	["bmSkin"] = 24
}
CLOTHING.outfit_nbc_bandit = {
	["bmSkin"] = 25
}
CLOTHING.outfit_nbc_duty1 = {
	["bmSkin"] = 26
}
CLOTHING.outfit_nbc_freedom1 = {
	["bmSkin"] = 27
}
CLOTHING.outfit_nbc_loner1 = {
	["bmSkin"] = 28
}
CLOTHING.outfit_nbc_loner2 = {
	["bmSkin"] = 29
}
CLOTHING.outfit_nbc_monolith1 = {
	["bmSkin"] = 30
}
CLOTHING.outfit_ps5_bandit1 = {
	["bmSkin"] = 31
}
CLOTHING.outfit_ps5_bandit2 = {
	["bmSkin"] = 32
}
CLOTHING.outfit_ps5_beyond1 = {
	["bmSkin"] = 33
}
CLOTHING.outfit_ps5_clearsky1 = {
	["bmSkin"] = 34
}
CLOTHING.outfit_ps5_clearsky2 = {
	["bmSkin"] = 35
}
CLOTHING.outfit_ps5_duty1 = {
	["bmSkin"] = 36
}
CLOTHING.outfit_ps5_duty2 = {
	["bmSkin"] = 37
}
CLOTHING.outfit_ps5_finalday1 = {
	["bmSkin"] = 38
}
CLOTHING.outfit_ps5_freedom1 = {
	["bmSkin"] = 39
}
CLOTHING.outfit_ps5_freedom2 = {
	["bmSkin"] = 40
}
CLOTHING.outfit_ps5_freedom3 = {
	["bmSkin"] = 41
}
CLOTHING.outfit_ps5_freedom4 = {
	["bmSkin"] = 42
}
CLOTHING.outfit_ps5_isg1 = {
	["bmSkin"] = 43
}
CLOTHING.outfit_ps5_merc1 = {
	["bmSkin"] = 44
}
CLOTHING.outfit_ps5_merc2 = {
	["bmSkin"] = 45
}
CLOTHING.outfit_ps5_monolith1 = {
	["bmSkin"] = 46
}
CLOTHING.outfit_ps5_monolith2 = {
	["bmSkin"] = 47
}
CLOTHING.outfit_ps5_monolith3 = {
	["bmSkin"] = 48
}

-- DO NOT TOUCH BELOW IT ADDS THE ITEMS TO THE SCHEMA
for k, v in pairs(CLOTHING) do
	local ITEM = ix.item.Register(k, "base_bmclothing", false, nil, true)
	ITEM.name = v.name or k
	ITEM.model = v.model or "models/props_junk/cardboard_box004a.mdl"
	ITEM.description = v.description or "This DIY stalker bodysuit is a combination of a bodysuit of twin-layered rubberized cloth with plexiglass lining and built-in body armor. Despite the fact that the body armor is incapable of protecting the wearer from even pistol bullets, the suit enjoys great popularity due to its low cost and modification potential."
	ITEM.category = "Clothing"
	ITEM.ap = v.ap or 0
	ITEM.price = v.price or 100000000
	ITEM.weight = v.weight or 5
	ITEM.width = v.width or 2
	ITEM.height = v.height or 2
	ITEM.bmSlot = "torso"
	ITEM.bmModel = "models/sectorfour/outfits/male_sunrise.mdl"
	ITEM.bmSkin = v.bmSkin or 0
end