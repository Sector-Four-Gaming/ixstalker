
-- You can define factions in the factions/ folder. You need to have at least one faction that is the default faction - i.e the
-- faction that will always be available without any whitelists and etc.

FACTION.name = "Duty"
FACTION.description = "Duty is one of the best known and powerful factions in the Zone with their main base being in Rostok and possibly, one of the biggest and most strategically important bases in the entirety of the Zone, that enables them to effectivelly control an important route that allows Stalkers to move in a much easier way around the Zone, without having to pass through one of the few way more dangerous and mutants filled paths, like Truck Cemetery or Wild Territory."
FACTION.isDefault = false
FACTION.color = Color(100, 60, 60)

-- You should define a global variable for this faction's index for easy access wherever you need. FACTION.index is
-- automatically set, so you can simply assign the value.

-- Note that the player's team will also have the same value as their current character's faction index. This means you can use
-- client:Team() == FACTION_CITIZEN to compare the faction of the player's current character.
FACTION_DUTY = FACTION.index