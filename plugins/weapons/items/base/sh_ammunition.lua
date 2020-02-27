ITEM.name = "Ammo Base"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.ammo = "pistol" -- type of the ammo
ITEM.ammoAmount = 30 -- amount of the ammo
ITEM.loadSize = {1,5,15, ITEM.ammoAmount}
ITEM.description = "A box with %s rounds of ammunition."
ITEM.category = "Ammunition"
ITEM.busflag = {"dev"}
ITEM.isAmmo = true

function ITEM:GetDescription()
	local quant = self:GetData("quantity", self.ammoAmount)
	local ammodesc = Format(self.description, quant)
	local str = ""
	if self.longdesc then
		str = (self.longdesc or "")
	end

	if (self.entity) then
		return (ammodesc)
	else
        return (str.."\n \nThis box contains "..quant.." rounds.")
	end
end

function ITEM:GetName()
	local name = self.name
	
	local customData = self:GetData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

ITEM.functions.split = {
    name = "Split",
    tip = "useTip",
    icon = "icon16/stalker/split.png",
    isMulti = true,
    multiOptions = function(item, client)
		local targets = {}
        local quantity = item:GetData("quantity", item.ammoAmount)
		
        for i=1,#item.loadSize-1 do
			if quantity > item.loadSize[i] then
				table.insert(targets, {
					name = item.loadSize[i],
					data = {item.loadSize[i]},
				})
			end
		end
        return targets
	end,
	OnCanRun = function(item)				
		return (!IsValid(item.entity))
	end,
    OnRun = function(item, data)
		if data[1] then
			local quantity = item:GetData("quantity", item.ammoAmount)
			local client = item.player
			
			client:GetCharacter():GetInventory():Add(item.uniqueID, 1, {["quantity"] = data[1]})
			
			quantity = quantity - data[1]

			item.player:EmitSound("stalkersound/inv_properties.mp3", 110)
			
			item:SetData("quantity", quantity)
			
		end
		return false
	end,
}

ITEM.functions.combine = {
	OnCanRun = function(item, data)
		if data ~= nil then
			if !data[1] then
				return false
			end
			
			local targetItem = ix.item.instances[data[1]]

			if targetItem.uniqueID == item.uniqueID then
				return true
			else
				return false
			end
		end
	end,
	OnRun = function(item, data)
		local targetItem = ix.item.instances[data[1]]
		local localQuant = item:GetData("quantity", item.quantity)
		local targetQuant = targetItem:GetData("quantity", targetItem.quantity)
		local combinedQuant = (localQuant + targetQuant)

		item.player:EmitSound("stalkersound/inv_properties.mp3", 110)

		if combinedQuant <= item.maxStack then
			targetItem:SetData("quantity", combinedQuant)
			return true
		elseif localQuant >= targetQuant then
			targetItem:SetData("quantity",item.maxStack)
			item:SetData("quantity",(localQuant - (item.maxStack - targetQuant)))
			return false
		else
			targetItem:SetData("quantity",(targetQuant - (item.maxStack - localQuant)))
			item:SetData("quantity",item.maxStack)
			return false
		end
	end,
}

-- Called after the item is registered into the item tables.
function ITEM:OnRegistered()
	if (ix.ammo) then
		ix.ammo.Register(self.ammo)
	end
end

function ITEM:OnInstanced()
	timer.Simple(0.5,function()
		if self:GetData("quantity",0) == 0 then
			self:SetData("quantity",self.ammoAmount)
		end
	end)
end

ITEM.functions.Sell = {
	name = "Sell",
	icon = "icon16/stalker/sell.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		client:Notify( "Sold for "..((item.price/2)*(item:GetData("quantity",1)/item.ammoAmount)).." rubles." )
		client:GetCharacter():GiveMoney((item.price/2)*(item:GetData("quantity",1)/item.ammoAmount))
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}

ITEM.functions.Value = {
	name = "Value",
	icon = "icon16/help.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		client:Notify( "Item is sellable for "..((item.price/2)*(item:GetData("quantity",1)/item.ammoAmount)).." rubles." )
		return false
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}