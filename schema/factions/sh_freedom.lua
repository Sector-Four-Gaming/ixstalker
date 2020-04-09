
-- You can define factions in the factions/ folder. You need to have at least one faction that is the default faction - i.e the
-- faction that will always be available without any whitelists and etc.

FACTION.name = "Freedom"
FACTION.description = "Members of this faction believe that the Zone should be a separate and free territory without laws and rulers, seeing it as a scientific marvel, and opposing all who would try to exploit or work against its nature."
FACTION.isDefault = false
FACTION.color = Color(100, 60, 60)

-- You should define a global variable for this faction's index for easy access wherever you need. FACTION.index is
-- automatically set, so you can simply assign the value.

-- Note that the player's team will also have the same value as their current character's faction index. This means you can use
-- client:Team() == FACTION_CITIZEN to compare the faction of the player's current character.
FACTION_FREEDOM = FACTION.index
