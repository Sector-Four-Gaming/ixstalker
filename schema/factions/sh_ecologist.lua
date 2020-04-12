
-- You can define factions in the factions/ folder. You need to have at least one faction that is the default faction - i.e the
-- faction that will always be available without any whitelists and etc.

FACTION.name = "Ecologist"
FACTION.description = "Ukrainian Government funded scientists, Ecologists main job is to research the Zone, from anomaly's to the creatures inhabiting the Zone."
FACTION.isDefault = false
FACTION.color = Color(100, 60, 60)
FACTION.models = {
	"models/tnb/stalker/female_01_anorak.mdl",
	"models/tnb/stalker/female_02_anorak.mdl",
	"models/tnb/stalker/female_03_anorak.mdl",
	"models/tnb/stalker/female_04_anorak.mdl",
	"models/tnb/stalker/female_05_anorak.mdl",
	"models/tnb/stalker/female_06_anorak.mdl",
	"models/tnb/stalker/female_07_anorak.mdl",
	"models/tnb/stalker/female_08_anorak.mdl",
	"models/tnb/stalker/male_01_anorak.mdl",
	"models/tnb/stalker/male_02_anorak.mdl",
	"models/tnb/stalker/male_03_anorak.mdl",
	"models/tnb/stalker/male_04_anorak.mdl",
	"models/tnb/stalker/male_05_anorak.mdl",
	"models/tnb/stalker/male_06_anorak.mdl",
	"models/tnb/stalker/male_07_anorak.mdl",
	"models/tnb/stalker/male_08_anorak.mdl",
	"models/tnb/stalker/male_09_anorak.mdl",
	"models/tnb/stalker/male_10_anorak.mdl"
}

-- You should define a global variable for this faction's index for easy access wherever you need. FACTION.index is
-- automatically set, so you can simply assign the value.

-- Note that the player's team will also have the same value as their current character's faction index. This means you can use
-- client:Team() == FACTION_CITIZEN to compare the faction of the player's current character.
FACTION_ECOLOGIST = FACTION.index
