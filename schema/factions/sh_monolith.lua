
-- You can define factions in the factions/ folder. You need to have at least one faction that is the default faction - i.e the
-- faction that will always be available without any whitelists and etc.

FACTION.name = "Monolith"
FACTION.description = "A religious cult that is hostile to all but their own, the Monolithians believe in the power of the Wish Granter, rumored to be an alien artifact hidden in the center of the Zone."
FACTION.models = {}
FACTION.isDefault = false
FACTION.color = Color(100, 60, 60)

for k,v in pairs(headTable) do
	table.insert(FACTION.models, v)
end


-- You should define a global variable for this faction's index for easy access wherever you need. FACTION.index is
-- automatically set, so you can simply assign the value.

-- Note that the player's team will also have the same value as their current character's faction index. This means you can use
-- client:Team() == FACTION_CITIZEN to compare the faction of the player's current character.
FACTION_MONOLITH = FACTION.index
