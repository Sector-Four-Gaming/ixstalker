AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Moonlight"
ENT.Category = "Artifacts"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.RenderGroup = RENDERGROUP_BOTH

if (SERVER) then
	function ENT:SpawnFunction(client, trace, class)
		local entity = ents.Create(class)
		entity:SetPos(trace.HitPos + trace.HitNormal * 20)
		entity:Spawn()
		entity:Activate()

		entity:setItem("moonlight")

		return entity
	end

	function ENT:Initialize()
		self:SetModel("models/props_junk/watermelon01.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
		end
	end
	
	function ENT:OnTakeDamage(dmginfo)
		return
	end

	function ENT:setItem(className)
		local itemTable = ix.item.list[className]
        self:SetNetVar("uniqueID", className)

		if (itemTable) then
			local model = itemTable.onGetDropModel and itemTable:onGetDropModel(self) or itemTable.model

			self:SetModel(model)
			self:SetSkin(itemTable.skin or 0)
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)

			local physObj = self:GetPhysicsObject()

			if (IsValid(physObj) == false) then
				local min, max = Vector(-8, -8, -8), Vector(8, 8, 8)

				self:PhysicsInitBox(min, max)
				self:SetCollisionBounds(min, max)
			end

			if (IsValid(physObj)) then
				physObj:EnableMotion(true)
				physObj:Wake()
			end

			if (itemTable.onEntityCreated) then
				itemTable:onEntityCreated(self)
			end
		end
	end

	function ENT:Use(client)
		local char = client:GetChar()
		local inv = char:GetInv()
        local itemid = self:GetNetVar("uniqueID")
		local addItem, reason = inv:Add(self:GetNetVar("uniqueID"))
		if (addItem) then
			self:EmitSound("physics/cardboard/cardboard_box_break"..math.random(1, 3)..".wav")
			self:Remove()
			hook.Run("ArtiPickup", client, itemid)
		else
			client:notifyLocalized(reason)
		end
	end
else
	ENT.DrawEntityInfo = true

	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha

	function ENT:onDrawEntityInfo(alpha)
		local itemTable = self.getItemTable(self)

		if (itemTable) then
			local oldData = itemTable.data
			itemTable.data = self.GetNetVar(self, "data", {})
			itemTable.entity = self

			local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
			local x, y = position.x, position.y
			local description = itemTable.getDesc and itemTable.getDesc(itemTable)

			if (description ~= self.desc) then
				self.desc = description
				self.lines, self.offset = ix.util.wrapText(description, ScrW() * 0.7, "ixSmallFont")
				self.offset = self.offset * 0.5
			end
			
			ix.util.drawText(L(itemTable.name), x, y, colorAlpha(ix.config.Get("color"), alpha), 1, 1, nil, alpha * 0.65)

			local lines = self.lines
			local offset = self.offset

			for i = 1, #lines do
				ix.util.drawText(lines[i], x, y + (i * 16), colorAlpha(color_white, alpha), 1, 1, "ixSmallFont", alpha * 0.65)
			end

			itemTable.entity = nil
			itemTable.data = oldData
		end		
	end

	local mat = Material("trails/laser")
	local mat2 = Material("sprites/glow04_noz.vmt")
end

function ENT:getItemTable()
	return ix.item.list[self:GetNetVar("uniqueID", "")] or {}
end

function ENT:getData(key, default)
	local data = self:GetNetVar("data", {})

	return data[key] or default
end