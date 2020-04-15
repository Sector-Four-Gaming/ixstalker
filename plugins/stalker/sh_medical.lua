local ITEMS = {}
--[[

ITEMS.name = {
	["name"] = "",
	["description"] = "",
	["model"] = ""
}

	medkit_standard
		+100% HP, +30% Blood, -10% Rads
	medkit_military
		+100% HP, +100% Blood, -10% Rads
	medkit_scientific
		+100% HP, +30% Blood, -100% Rads
	drug_anabiotic
		Can survive an emission
	drug_antidote
		Can survive poisonous gasses
	drug_antirad
		-100% Rads
	bandage
		+10% HP, Stop small bleeding
	drug_psyblock
		+240% psy resistance
	drug_radioprotectant
		Prevents radiation unless artifact induced
]]

ITEMS.medkit_standard = {
	["name"] = "Standard Medkit",
	["description"] = "All-purpose single-use medkit. Allows to handle injuries of different types and degrees of complexity.",
	["model"] = "models/stalker/item/medical/medkit1.mdl"
}
ITEMS.medkit_military = {
	["name"] = "Military Medkit",
	["description"] = "Includes medicine for faster blood coagulation, as well as painkillers, antibiotics, immunity stimulators, and more.",
	["model"] = "models/stalker/item/medical/medkit2.mdl"
}
ITEMS.medkit_scientific = {
	["name"] = "Scientific Medkit",
	["description"] = "High end medical set designed for use in The Zone. This medkit includes items used to stop bleeding, treat burns, clean wounds, and treat a variety of different injuries. It also includes anti-radiation pills and medicine.",
	["model"] = "models/stalker/item/medical/medkit3.mdl"
}
ITEMS.drug_anabiotic = {
	["name"] = "Anabiotic",
	["description"] = "An experimental drug developed by Professor Ozersky for scientific research teams working in the Zone. At its core, the drug contains tetrodotoxin, known colloquially as 'zombie powder', which causes a complete shutdown of the body's central nervous system that may allow people to survive emissions outside cover. The drug has not undergone clinical or field testing, which puts its effectiveness in doubt and raises the issue of possible side effects.",
	["model"] = "models/stalker/item/medical/antibotic.mdl"
}
ITEMS.drug_antidote = {
	["name"] = "Antidote",
	["description"] = "The IP2 antitoxin is a complex drug comprising several antidotes, including metoclopramidum, pyridoxine, thiamine, riboxin and other pharmaceuticals. The drug is used to inject a range of antibiotics to neutralize natural poisons, together with synthetic poison absorbers, into the bloodstream. IP2 is not particularly popular in the Zone, as most stalkers rely on a gas mask and a protective suit, there are still those who have a pack of this antidote stashed away. The effects of the drug are long-lasting.",
	["model"] = "models/stalker/item/medical/antidote.mdl"
}
ITEMS.drug_antirad = {
	["name"] = "Anti-rad",
	["description"] = "Mexaminum radiation protection drugs are common in the Zone. When used, this drug induces contraction of peripheral blood vessels and oxygen deprivation, which serves to treat and prevent radiation exposure. The drug does not have severe side effects, although isolated cases of mild nausea, dizziness, cramps and stomach pain have been reported.",
	["model"] = "models/stalker/item/medical/antirad.mdl"
}
ITEMS.bandage = {
	["name"] = "Bandage",
	["description"] = "A medicinal gauze that instantly stops light bleeding, but will require more than one to stop severe hemorrhages.",
	["model"] = "models/stalker/item/medical/bandage.mdl"
}
ITEMS.drug_psyblock = {
	["name"] = "Psy-block",
	["description"] = "A drug that blocks avalanche-like nerve impulses. Consumption induces short-term loss of all emotion. Used exclusively in the Zone to counteract the effects of anomalous psy-fields. The effects of the drug are long-lasting.",
	["model"] = "models/stalker/item/medical/psy_pills.mdl"
}
ITEMS.drug_radioprotectant = {
	["name"] = "Radioprotectant",
	["description"] = "B190 Indraline radioprotectant, included in medkits, issued to nuclear power plant personnel. Used in the Zone instead of the excessively toxic PC1 cystamine hydrochloride, repeated use of which often caused death. Reduces the effects of gamma radiation on live tissue. Best consumed before exposure, as effects are not instant. The effects of the drug are long-lasting.",
	["model"] = "models/stalker/item/medical/rad_pills.mdl"
}

for k, v in pairs(ITEMS) do
	local ITEM = ix.item.Register(k, nil, false, nil, true)
	ITEM.name = v.name
	ITEM.model = v.model or "models/props_junk/cardboard_box001a.mdl"
	ITEM.description = v.description or "Insert Description Here"
	ITEM.category = "Medical"
	ITEM.price = v.price or 100000000
	ITEM.weight = v.weight or 100000000
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.heal = v.heal
end