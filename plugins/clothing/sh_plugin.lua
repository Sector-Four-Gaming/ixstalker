local PLUGIN = PLUGIN
PLUGIN.name = "Advanced Clothing System"
PLUGIN.author = "Shavargo"
PLUGIN.desc = "Clothing system utilizing bonemerging."


function PLUGIN:PlayerPostThink(client)
	local torso = ents.Create("prop_physics")
		torso:SetModel("models/projectpt/suits/male_anorak.mdl")
		torso:SetParent(client, 1)
		torso:SetPos(Vector(0, 0, 0))
		torso:SetAngles(Angle(0,0,0))

		torso:AddEffects(EF_BONEMERGE)
end