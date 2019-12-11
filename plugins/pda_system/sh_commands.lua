do
	local CLASS = {}
	CLASS.color = Color(75, 150, 50)
	CLASS.format = "[GPDA] %s: %s"

	function CLASS:CanHear(speaker, listener)
		local character = listener:GetCharacter()
		local inventory = character:GetInventory()
		local bHasPda = false

		for k, v in pairs(inventory:GetItemsByUniqueID("pda", true)) do
			if (v:GetData("enabled", false)) then
				bHasPda = true
				break
			end
		end

		return bHasPda
	end

	function CLASS:OnChatAdd(speaker, text)
		--chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
		chat.AddText(Color(0,255,0), "[GPDA] ", Color(255,255,255), speaker:Name(), ": ", text)
	end

	ix.chat.Register("GPDA", CLASS)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local pdas = character:GetInventory():GetItemsByUniqueID("pda", true)
		local item

		for k, v in ipairs(pdas) do
			if (v:GetData("enabled", false)) then
				item = v
				break
			end
		end

		if (item) then
			if (!client:IsRestricted()) then
				ix.chat.Send(client, "GPDA", message)
			else
				return "@notNow"
			end
		elseif (#pdas > 0) then
			return "@pdaNotOn"
		else
			return "@pdaRequired"
		end
	end

	ix.command.Add("GPDA", COMMAND)
end
