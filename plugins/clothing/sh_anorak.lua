local CLOTHING = {}

CLOTHING.outfit_anorak_loner1 = {
	["bmSkin"] = 0
}
CLOTHING.outfit_anorak_loner2 = {
	["bmSkin"] = 1
}
CLOTHING.outfit_anorak_loner3 = {
	["bmSkin"] = 2
}
CLOTHING.outfit_anorak_loner4 = {
	["bmSkin"] = 3
}
CLOTHING.outfit_anorak_loner5 = {
	["bmSkin"] = 4
}
CLOTHING.outfit_anorak_loner6 = {
	["bmSkin"] = 5
}
CLOTHING.outfit_anorak_loner7 = {
	["bmSkin"] = 6
}
CLOTHING.outfit_anorak_loner8 = {
	["bmSkin"] = 7
}
CLOTHING.outfit_anorak_loner9 = {
	["bmSkin"] = 8
}
CLOTHING.outfit_anorak_loner10 = {
	["bmSkin"] = 9
}
CLOTHING.outfit_anorak_loner11 = {
	["bmSkin"] = 10
}
CLOTHING.outfit_anorak_loner12 = {
	["bmSkin"] = 11
}
CLOTHING.outfit_anorak_loner13 = {
	["bmSkin"] = 12
}
CLOTHING.outfit_anorak_loner14 = {
	["bmSkin"] = 13
}
CLOTHING.outfit_anorak_loner15 = {
	["bmSkin"] = 14
}
CLOTHING.outfit_anorak_loner16 = {
	["bmSkin"] = 15
}
CLOTHING.outfit_anorak_loner17 = {
	["bmSkin"] = 16
}
CLOTHING.outfit_anorak_loner18 = {
	["bmSkin"] = 17
}
CLOTHING.outfit_anorak_loner19 = {
	["bmSkin"] = 18
}
CLOTHING.outfit_anorak_loner20 = {
	["bmSkin"] = 19
}
CLOTHING.outfit_anorak_loner21 = {
	["bmSkin"] = 20
}
CLOTHING.outfit_anorak_loner22 = {
	["bmSkin"] = 21
}
CLOTHING.outfit_anorak_loner23 = {
	["bmSkin"] = 22
}
CLOTHING.outfit_anorak_loner24 = {
	["bmSkin"] = 23
}
CLOTHING.outfit_anorak_loner25 = {
	["bmSkin"] = 24
}
CLOTHING.outfit_anorak_loner26 = {
	["bmSkin"] = 25
}
CLOTHING.outfit_anorak_loner27 = {
	["bmSkin"] = 26
}
CLOTHING.outfit_anorak_loner28 = {
	["bmSkin"] = 27
}
CLOTHING.outfit_anorak_loner29 = {
	["bmSkin"] = 28
}
CLOTHING.outfit_anorak_loner30 = {
	["bmSkin"] = 29
}
CLOTHING.outfit_anorak_loner31 = {
	["bmSkin"] = 30
}
CLOTHING.outfit_anorak_loner32 = {
	["bmSkin"] = 31
}
CLOTHING.outfit_anorak_loner33 = {
	["bmSkin"] = 32
}
CLOTHING.outfit_anorak_loner34 = {
	["bmSkin"] = 33
}
CLOTHING.outfit_anorak_loner35 = {
	["bmSkin"] = 34
}
CLOTHING.outfit_anorak_bandit1 = {
	["bmSkin"] = 35
}
CLOTHING.outfit_anorak_bandit2 = {
	["bmSkin"] = 36
}
CLOTHING.outfit_anorak_bandit3 = {
	["bmSkin"] = 37
}
CLOTHING.outfit_anorak_bandit4 = {
	["bmSkin"] = 38
}
CLOTHING.outfit_anorak_bandit5 = {
	["bmSkin"] = 39
}
CLOTHING.outfit_anorak_bandit6 = {
	["bmSkin"] = 40
}
CLOTHING.outfit_anorak_bandit7 = {
	["bmSkin"] = 41
}
CLOTHING.outfit_anorak_bandit8 = {
	["bmSkin"] = 42
}
CLOTHING.outfit_anorak_bandit9 = {
	["bmSkin"] = 43
}
CLOTHING.outfit_anorak_bandit10 = {
	["bmSkin"] = 44
}
CLOTHING.outfit_anorak_bandit11 = {
	["bmSkin"] = 45
}
CLOTHING.outfit_anorak_bandit12 = {
	["bmSkin"] = 46
}
CLOTHING.outfit_anorak_clearsky1 = {
	["bmSkin"] = 47
}
CLOTHING.outfit_anorak_duty1 = {
	["bmSkin"] = 48
}
CLOTHING.outfit_anorak_duty2 = {
	["bmSkin"] = 49
}
CLOTHING.outfit_anorak_duty3 = {
	["bmSkin"] = 50
}
CLOTHING.outfit_anorak_freedom1 = {
	["bmSkin"] = 51
}
CLOTHING.outfit_anorak_freedom2 = {
	["bmSkin"] = 52
}
CLOTHING.outfit_anorak_freedom3 = {
	["bmSkin"] = 53
}
CLOTHING.outfit_anorak_merc1 = {
	["bmSkin"] = 54
}
CLOTHING.outfit_anorak_merc2 = {
	["bmSkin"] = 55
}
CLOTHING.outfit_anorak_merc3 = {
	["bmSkin"] = 56
}
CLOTHING.outfit_anorak_merc4 = {
	["bmSkin"] = 57
}
CLOTHING.outfit_anorak_military1 = {
	["bmSkin"] = 58
}
CLOTHING.outfit_anorak_military2 = {
	["bmSkin"] = 59
}
CLOTHING.outfit_anorak_unique = {
	["bmSkin"] = 60
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
	ITEM.bmSlot = "torso"
	ITEM.bmModel = "models/sectorfour/outfits/male_anorak.mdl"
	ITEM.bmSkin = v.bmSkin or 0
end