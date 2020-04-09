
-- The shared init file. You'll want to fill out the info for your schema and include any other files that you need.

-- Schema info
Schema.name = "STALKER RP"
Schema.author = "Shavargo"
Schema.description = "A STALKER RP Schema."

-- Additional files that aren't auto-included should be included here. Note that ix.util.Include will take care of properly
-- using AddCSLuaFile, given that your files have the proper naming scheme.

-- You could technically put most of your schema code into a couple of files, but that makes your code a lot harder to manage -
-- especially once your project grows in size. The standard convention is to have your miscellaneous functions that don't belong
-- in a library reside in your cl/sh/sv_schema.lua files. Your gamemode hooks should reside in cl/sh/sv_hooks.lua. Logical
-- groupings of functions should be put into their own libraries in the libs/ folder. Everything in the libs/ folder is loaded
-- automatically.
ix.util.Include("libs/thirdparty/sh_netstream2.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("sv_schema.lua")

ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_hooks.lua")

-- You'll need to manually include files in the meta/ folder, however.
ix.util.Include("meta/sh_character.lua")
ix.util.Include("meta/sh_player.lua")

ix.flag.Add("a", "Tier 1 Warsaw")
ix.flag.Add("A", "Tier 2 Warsaw")
ix.flag.Add("b", "Tier 3 Warsaw")
ix.flag.Add("B", "Tier 4 Warsaw")

ix.flag.Add("C", "Tier 1 NATO")
ix.flag.Add("d", "Tier 2 NATO")
ix.flag.Add("D", "Tier 3 NATO")
ix.flag.Add("f", "Tier 4 NATO")

ix.flag.Add("g", "Tier 1 Misc")
ix.flag.Add("G", "Tier 2 Misc")
ix.flag.Add("h", "Tier 3 Misc")

ix.flag.Add("i", "Tier 5 Misc")

ix.flag.Add("I", "Tier 1 Neutral Armor")
ix.flag.Add("j", "Tier 2 Neutral Armor")
ix.flag.Add("J", "Tier 3 Neutral Armor")
ix.flag.Add("k", "Tier 4 Neutral Armor")

ix.flag.Add("l", "Duty Trader")
ix.flag.Add("L", "Freedom Trader")
ix.flag.Add("m", "Ecologist Trader")

ix.flag.Add("c", "Rookie Armor Tech")
ix.flag.Add("F", "Experienced Armor Tech")
ix.flag.Add("H", "Master Armor Tech")

ix.flag.Add("s", "Rookie Weapons Tech")
ix.flag.Add("S", "Experienced Weapons Tech")
ix.flag.Add("q", "Master Weapons Tech")

ix.flag.Add("M", "Duty Tech")
ix.flag.Add("K", "Freedom Tech")

ix.flag.Add("Z", "Admin Business Menu")

CITIZEN_MODELS = {
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