ITEM.name = "Simple Name";
ITEM.description = "Simple Base";
ITEM.category = "Artifacts";
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.width = 1;
ITEM.height = 1;
ITEM.weight = 1;
ITEM.isArtifact = true;
ITEM.buff = "";
ITEM.debuff = "";
ITEM.price = 1;
ITEM.quantity = 1

function ITEM:GetDescription()
	local description = self.description
	description = description .. "\nWeight: " .. self.weight .. "kg"
	return description
end

ITEM:Hook("drop", function(item)
	local client = item.player

	if (item:GetData("equip")) then

		if item.buff == "heal" then
			local curheal = client:GetNetVar("ArtiHealAmt") or 0
			local newheal = (curheal - item.buffval)
			client:SetNetVar("ArtiHealAmt", newheal)
		end

		if item.buff == "woundheal" then
			local curwheal = client:GetNetVar("WoundHeal") or 0
			local newwheal = (curwheal - item.buffval)
			client:SetNetVar("WoundHeal", newwheal)
		end

		if item.buff == "antirad" then
			local curantirad = client:GetNetVar("AntiRads") or 0
			local newantirad = (curantirad - item.buffval)
			client:SetNetVar("AntiRads", newantirad)
		end

		if item.buff == "end" then
			local curend = client:GetNetVar("EndBuff") or 0
			local newend = (curend - item.buffval)
			client:SetNetVar("EndBuff", newend)
		end

		if item.debuff == "rads" then
			local currads = client:GetNetVar("Rads") or 0
			local newrads = (currads - item.debuffval) or 0
			client:SetNetVar("Rads", newrads)
		end

		if item.debuff == "end" then
			local curend = client:GetNetVar("EndRed") or 0
			local newend = (curend - item.debuffval)
			client:SetNetVar("EndRed", newend)
		end

		if item.buff == "weight" then
		   local curweight = client:GetNetVar("WeightBuff") or 0
		   local newweight = (curweight - item.buffval)
		   client:SetNetVar("WeightBuff",newweight)
		end

		hook.Run("ArtifactChange", client)

		item:SetData("equip", nil);
	end;
end);

ITEM.functions.Equip =
{
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	OnRun = function(item)
		local client = item.player

		if item.buff == "heal" then
			local curheal = client:GetNetVar("ArtiHealAmt") or 0
			local newheal = (curheal + item.buffval)
			client:SetNetVar("ArtiHealAmt", newheal)
		end

		if item.buff == "woundheal" then
			local curwheal = client:GetNetVar("WoundHeal") or 0
			local newwheal = (curwheal + item.buffval)
			client:SetNetVar("WoundHeal", newwheal)
		end

		if item.buff == "antirad" then
			local curantirad = client:GetNetVar("AntiRads") or 0
			local newantirad = (curantirad + item.buffval)
			client:SetNetVar("AntiRads", newantirad)
		end

		if item.buff == "end" then
			local curend = client:GetNetVar("EndBuff") or 0
			local newend = (curend + item.buffval)
			client:SetNetVar("EndBuff", newend)
		end

		if item.debuff == "rads" then
			local currads = client:GetNetVar("Rads") or 0
			local newrads = (currads + item.debuffval)
			client:SetNetVar("Rads", newrads)
		end

		if item.debuff == "end" then
			local curend = client:GetNetVar("EndRed") or 0
			local newend = (curend + item.debuffval)
			client:SetNetVar("EndRed", newend)
		end

		if item.buff == "weight" then
		   local curweight = client:GetNetVar("WeightBuff") or 0
		   local newweight = (curweight + item.buffval)
		   client:SetNetVar("WeightBuff",newweight)
		end

		item:SetData("equip", true)

		hook.Run("ArtifactChange", client)

		return false
	end;

	OnCanRun = function(item)
		local client = item.player
		local cap = client:GetNetVar("ArtiSlots") or 0
		local char = client:GetChar()
		local inv = char:GetInv()
		local items = inv:GetItems()
		local curr = 0

		for k, invItem in pairs(items) do
			if invItem.isArtefact and invItem:GetData("equip") then
				curr = curr + 1
			end
		end

		if cap > curr then
			return !IsValid(item.entity) and item:GetData("equip") ~= true
		else
			return false
		end
	end;
}

ITEM.functions.UnEquip =
{
	name = "Unequip",
	tip = "unequipTip",
	icon = "icon16/cross.png",

	OnRun = function(item)
		local client = item.player

		if item.buff == "heal" then
		   local curheal = client:GetNetVar("ArtiHealAmt") or 0
			local newheal = (curheal - item.buffval)
			client:SetNetVar("ArtiHealAmt", newheal)
		end

		if item.buff == "woundheal" then
			local curwheal = client:GetNetVar("WoundHeal") or 0
			local newwheal = (curwheal - item.buffval)
			client:SetNetVar("WoundHeal", newwheal)
		end

		if item.buff == "antirad" then
			local curantirad = client:GetNetVar("AntiRads") or 0
			local newantirad = (curantirad - item.buffval)
			client:SetNetVar("AntiRads", newantirad)
		end

		if item.buff == "end" then
			local curend = client:GetNetVar("EndBuff") or 0
			local newend = (curend - item.buffval)
			client:SetNetVar("EndBuff", newend)
		end

		if item.debuff == "rads" then
			local currads = client:GetNetVar("Rads") or 0
			local newrads = (currads - item.debuffval) or 0
			client:SetNetVar("Rads", newrads)
		end

		if item.debuff == "end" then
			local curend = client:GetNetVar("EndRed") or 0
			local newend = (curend - item.debuffval)
			client:SetNetVar("EndRed", newend)
		end

		if item.buff == "weight" then
		   local curweight = client:GetNetVar("WeightBuff") or 0
		   local newweight = (curweight - item.buffval)
		   client:SetNetVar("WeightBuff",newweight)
		end

		item:SetData("equip", false)

		hook.Run("ArtifactChange", client)

		return false
	end;

	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetData("equip") == true
	end;
}

ITEM.functions.Sell =
{
	name = "Sell",
	tip = "Sells Item",
	icon = "icon16/money.png",
	OnRun = function(item)
		local player = item.player;
		local character = player:GetChar();
		character:GiveMoney(item.price);
		item:Remove()
		player:NotifyLocalized("Item sold for " .. item.price)

		local client = player

		if (item:GetData("equip")) then

			if item.buff == "heal" then
			   local curheal = client:GetNetVar("ArtiHealAmt") or 0
				local newheal = (curheal - item.buffval)
				client:SetNetVar("ArtiHealAmt", newheal)
			end

			if item.buff == "antirad" then
				local curantirad = client:GetNetVar("AntiRads") or 0
				local newantirad = (curantirad - item.buffval)
				client:SetNetVar("AntiRads", newantirad)
			end

			if item.buff == "end" then
				local curend = client:GetNetVar("EndBuff") or 0
				local newend = (curend - item.buffval)
				client:SetNetVar("EndBuff", newend)
			end

			if item.debuff == "rads" then
				local currads = client:GetNetVar("Rads") or 0
				local newrads = (currads - item.debuffval) or 0
				client:SetNetVar("Rads", newrads)
			end

			if item.debuff == "end" then
				local curend = client:GetNetVar("EndRed") or 0
				local newend = (curend - item.debuffval)
				client:SetNetVar("EndRed", newend)
			end

			if item.buff == "weight" then
			   local curweight = client:GetNetVar("WeightBuff") or 0
			   local newweight = (curweight - item.buffval)
			   client:SetNetVar("WeightBuff",newweight)
			end

			hook.Run("ArtifactChange", client)

			item:SetData("equip", nil);
		end

		return false
	end;

	OnCanRun = function(item)
		local char = item.player:GetChar()
		if (char:HasFlags("a") or
			char:HasFlags("A") or
			char:HasFlags("b") or
			char:HasFlags("B") or
			char:HasFlags("C") or
			char:HasFlags("d") or
			char:HasFlags("D") or
			char:HasFlags("f") or
			char:HasFlags("I") or
			char:HasFlags("g") or
			char:HasFlags("G") or
			char:HasFlags("h") or
			char:HasFlags("j") or
			char:HasFlags("J") or
			char:HasFlags("k") or
			char:HasFlags("l") or
			char:HasFlags("L") or
			char:HasFlags("m")
			)
		then
			return !IsValid(item.entity)
		else
			return false
		end
	end;
}

ITEM.functions.SellPriceCheck =
{
	name = "Check Value",
	tip = "Checks the value of the item you will receive",
	icon = "icon16/money_dollar.png",
	OnRun = function(item)
		local player = item.player
		player:NotifyLocalized("Item is worth " .. item.price .. " if sold")
		return false
	end;

	OnCanRun = function(item)
		local char = item.player:GetChar()
		if ( char:HasFlags("a") or
			char:HasFlags("A") or
			char:HasFlags("b") or
			char:HasFlags("B") or
			char:HasFlags("C") or
			char:HasFlags("d") or
			char:HasFlags("D") or
			char:HasFlags("f") or
			char:HasFlags("I") or
			char:HasFlags("g") or
			char:HasFlags("G") or
			char:HasFlags("h") or
			char:HasFlags("j") or
			char:HasFlags("J") or
			char:HasFlags("k") or
			char:HasFlags("l") or
			char:HasFlags("L") or
			char:HasFlags("m")
			)
		then
			return !IsValid(item.entity)
		else
			return false
		end
	end;
}

function ITEM:onLoadout()
	local client = self.player
	client:SetNetVar("ArtiHealAmt",0)
	client:SetNetVar("WoundHeal",0)
	client:SetNetVar("AntiRads",0)
	client:SetNetVar("EndBuff",0)
	client:SetNetVar("Rads",0)
	client:SetNetVar("EndRed",0)
	client:SetNetVar("WeightBuff",0)
	client:SetNetVar("ArtiHealCur",0)
	client:SetNetVar("WoundHealCur",0)
	client:SetNetVar("AntiRadsCur",0)
	client:SetNetVar("EndBuffCur",0)
	client:SetNetVar("RadsCur",0)
	client:SetNetVar("EndRedCur",0)
	client:SetNetVar("WeightBuffCur",0)
	if (self:GetData("equip")) then
		self:SetData("equip", false)
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		surface.SetDrawColor(item:GetData("equip") and Color(110, 255, 110, 100) or Color(255, 110, 110, 100))
		surface.DrawRect(w - 16, 10, 8, 8)
	end
end

function ITEM:OnCanBeTransfered(oldInventory, newInventory) return true end;

function ITEM:OnTransfered()
	if self:GetData("equip") then self:SetData("equip", nil) end;
end;