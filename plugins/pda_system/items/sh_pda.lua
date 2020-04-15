ITEM.name = "Personal Digital Assistant"
ITEM.model = "models/stalker/item/handhelds/pda.mdl"
ITEM.description = "A pocket-sized electronic device meant to encompass the basic and most vital functions of a computer."
ITEM.cost = 50
ITEM.flag = "Z"

-- Inventory drawing
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		if (item:GetData("enabled")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

function ITEM.postHooks.drop(item, status)
	item:SetData("enabled", false)
end


ITEM.functions.Toggle = {
	OnRun = function(itemTable)
		local character = itemTable.player:GetCharacter()
		local pdas = character:GetInventory():GetItemsByUniqueID("pda", true)
		local bCanToggle = true

		-- don't allow someone to turn on another radio when they have one on already
		if (#pdas > 1) then
			for k, v in ipairs(pdas) do
				if (v != itemTable and v:GetData("enabled", false)) then
					bCanToggle = false
					break
				end
			end
		end

		if (bCanToggle) then
			itemTable:SetData("enabled", !itemTable:GetData("enabled", false))
		else
			itemTable.player:NotifyLocalized("pdaAlreadyOn")
		end

		return false
	end
}