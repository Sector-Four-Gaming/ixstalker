local CLOTHING = {}

CLOTHING.hawk_loner1 = {
	["bmSkin"] = 0
}
CLOTHING.hawk_loner2 = {
	["bmSkin"] = 1
}
CLOTHING.hawk_loner3 = {
	["bmSkin"] = 2
}
CLOTHING.hawk_loner4 = {
	["bmSkin"] = 3
}
CLOTHING.hawk_loner5 = {
	["bmSkin"] = 4
}
CLOTHING.hawk_loner6 = {
	["bmSkin"] = 5
}
CLOTHING.hawk_loner7 = {
	["bmSkin"] = 6
}
CLOTHING.hawk_loner8 = {
	["bmSkin"] = 7
}
CLOTHING.hawk_merc1 = {
	["bmSkin"] = 8
}
CLOTHING.hawk_merc2 = {
	["bmSkin"] = 9
}
CLOTHING.hawk_merc3 = {
	["bmSkin"] = 10
}
CLOTHING.hawk_merc4 = {
	["bmSkin"] = 11
}
CLOTHING.hawk_merc5 = {
	["bmSkin"] = 12
}
CLOTHING.hawk_merc6 = {
	["bmSkin"] = 13
}
CLOTHING.hawk_merc7 = {
	["bmSkin"] = 14
}
CLOTHING.hawk_merc8 = {
	["bmSkin"] = 15
}
CLOTHING.hawk_merc9 = {
	["bmSkin"] = 16
}
CLOTHING.hawk_merc10 = {
	["bmSkin"] = 17
}
CLOTHING.hawk_merc11 = {
	["bmSkin"] = 18
}
CLOTHING.hawk_merc12 = {
	["bmSkin"] = 19
}
CLOTHING.hawk_merc13 = {
	["bmSkin"] = 20
}
CLOTHING.hawk_merc14 = {
	["bmSkin"] = 21
}
CLOTHING.hawk_merc15 = {
	["bmSkin"] = 22
}
CLOTHING.hawk_merc16 = {
	["bmSkin"] = 23
}
CLOTHING.hawk_merc17 = {
	["bmSkin"] = 24
}
CLOTHING.hawk_merc18 = {
	["bmSkin"] = 25
}
CLOTHING.hawk_merc19 = {
	["bmSkin"] = 26
}
CLOTHING.hawk_merc20 = {
	["bmSkin"] = 27
}
CLOTHING.hawk_merc21 = {
	["bmSkin"] = 28
}
CLOTHING.hawk_military1 = {
	["bmSkin"] = 29
}
CLOTHING.hawk_military2 = {
	["bmSkin"] = 30
}
CLOTHING.hawk_military3 = {
	["bmSkin"] = 31
}
CLOTHING.hawk_monolith1 = {
	["bmSkin"] = 32
}
CLOTHING.hawk_renegade1 = {
	["bmSkin"] = 33
}
CLOTHING.hawk_renegade2 = {
	["bmSkin"] = 34
}
CLOTHING.hawk_renegade3 = {
	["bmSkin"] = 35
}
CLOTHING.hawk_renegade4 = {
	["bmSkin"] = 36
}
CLOTHING.hawk_sin1 = {
	["bmSkin"] = 37
}
CLOTHING.hawk_sin2 = {
	["bmSkin"] = 38
}
CLOTHING.hawk_sin3 = {
	["bmSkin"] = 39
}

-- DO NOT TOUCH BELOW IT ADDS THE ITEMS TO THE SCHEMA
for k, v in pairs(CLOTHING) do
	local ITEM = ix.item.Register(k, "base_bmclothing", false, nil, true)
	ITEM.name = v.name or k
	ITEM.model = v.model or "models/props_junk/cardboard_box004a.mdl"
	ITEM.description = v.description or "This does not provide sufficient protection from the Zone's harsh conditions."
	ITEM.category = "Clothing"
	ITEM.ap = v.ap or 0
	ITEM.price = v.price or 100000000
	ITEM.weight = v.weight or 5
	ITEM.width = v.width or 2
	ITEM.height = v.height or 2
	ITEM.bmSlot = "chestwear"
	ITEM.bmModel = "models/sectorfour/outfits/male_anorak_vest_hawk.mdl"
	ITEM.bmSkin = v.bmSkin or 0
end