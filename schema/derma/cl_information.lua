
local PANEL = {}

function PANEL:Init()
	local parent = self:GetParent()
	local pW = 850
	local pH = 807
	self:SetSize(pW, pH)
	self:Dock(RIGHT)
	self:DockMargin(0, ScrH() * 0.05, ScrW() * 0.02, 0)

	self.VBar:SetWide(0)

	-- entry setup
	local suppress = {}
	hook.Run("CanCreateCharacterInfo", suppress)
	local scale = 1
	local imgWidth = 946 * scale
	local imgHeight = 807 * scale
	self.charbackground = parent:Add("DImage")
	self.charbackground:SetSize(imgWidth, imgHeight)
	self.charbackground:SetImage( "stalker/char_screen.png" )
	self.charbackground:SetPos(parent:GetWide() - imgWidth, parent:GetTall() - imgHeight)
	self.charbackground:SetZPos(-1)


	self.name = parent:Add("DLabel")
	self.name:SetFont("stalkerregulartitlefont")
	self.name:SetTextColor(color_white)
	self.name:SetPos(parent:GetWide() * 0.58, parent:GetTall() * 0.08)
	self.name:SetContentAlignment(9)
	self.name:SetWide(parent:GetWide() * 0.18)
	self.name:SetTall(parent:GetTall() * 0.1)

	if (!suppress.time) then
		local format = "%A, %B %d, %Y. %H:%M:%S"

		self.time = self:Add("DLabel")
		self.time:SetFont("stalkerregularfont")
		self.time:SetTall(28)
		self.time:SetContentAlignment(5)
		self.time:Dock(TOP)
		self.time:SetTextColor(color_white)
		self.time:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.time:DockMargin(0, 0, 0, 32)
		self.time:SetText(ix.date.GetFormatted(format))
		self.time.Think = function(this)
			if ((this.nextTime or 0) < CurTime()) then
				this:SetText(ix.date.GetFormatted(format))
				this.nextTime = CurTime() + 0.5
			end
		end
	end


	if (!suppress.description) then
		local descriptionPanel = self:Add("Panel")
		descriptionPanel:Dock(TOP)
		descriptionPanel:DockMargin(0, 0, 0, 8)
		descriptionPanel.PerformLayout = function(_, width, height)
			if (!self.description.bWrap) then
				self.description:SetPos(width * 0.5 - self.description:GetWide() * 0.5, height * 0.5 - self.description:GetTall() * 0.5)
			end
		end

		self.description = descriptionPanel:Add("DLabel")
		self.description:SetFont("stalkerregularfont")
		self.description:SetTextColor(color_white)
		self.description:SetContentAlignment(5)
		self.description:SetMouseInputEnabled(true)
		self.description:SetCursor("hand")

		self.description.Paint = function(this, width, height)
			surface.SetDrawColor(0, 0, 0, 150)
			surface.DrawRect(0, 0, width, height)
		end

		self.description.OnMousePressed = function(this, code)
			if (code == MOUSE_LEFT) then
				ix.command.Send("CharDesc")

				if (IsValid(ix.gui.menu)) then
					ix.gui.menu:Remove()
				end
			end
		end

		self.description.SizeToContents = function(this)
			if (this.bWrap) then
				-- sizing contents after initial wrapping does weird things so we'll just ignore (lol)
				return
			end

			local width, height = this:GetContentSize()

			if (width > self:GetWide()) then
				this:SetWide(self:GetWide())
				this:SetTextInset(16, 8)
				this:SetWrap(true)
				this:SizeToContentsY()
				this:SetTall(this:GetTall() + 16) -- eh

				-- wrapping doesn't like middle alignment so we'll do top-center
				self.description:SetContentAlignment(8)
				this.bWrap = true
			else
				this:SetSize(width + 16, height + 16)
			end

			descriptionPanel:SetTall(this:GetTall())
		end
	end

	if (!suppress.characterInfo) then
		self.characterInfo = self:Add("Panel")
		self.characterInfo.list = {}
		self.characterInfo:Dock(TOP) -- no dock margin because this is handled by ixListRow
		self.characterInfo.SizeToContents = function(this)
			local height = 0

			for _, v in ipairs(this:GetChildren()) do
				if (IsValid(v) and v:IsVisible()) then
					local _, top, _, bottom = v:GetDockMargin()
					height = height + v:GetTall() + top + bottom
				end
			end

			this:SetTall(height)
		end

		if (!suppress.faction) then
			self.faction = self.characterInfo:Add("ixListRow")
			self.faction:SetList(self.characterInfo.list)
			self.faction:Dock(TOP)
		end

		if (!suppress.class) then
			self.class = self.characterInfo:Add("ixListRow")
			self.class:SetList(self.characterInfo.list)
			self.class:Dock(TOP)
		end

		if (!suppress.money) then
			self.money = parent:Add("DLabel")
			self.money:SetFont("stalkerregularfont")
			self.money:SetPos(parent:GetWide() * 0.62, parent:GetTall() * 0.125)
			self.money:SetWide(parent:GetWide() * 0.18)
			self.money:SetContentAlignment(6)
		end

		hook.Run("CreateCharacterInfo", self.characterInfo)
		self.characterInfo:SizeToContents()
	end

	-- no need to update since we aren't showing the attributes panel
	if (!suppress.attributes) then
		local character = LocalPlayer().GetCharacter and LocalPlayer():GetCharacter()

		if (character) then
			self.attributes = self:Add("ixCategoryPanel")
			self.attributes:SetText("Primary Attributes")
			self.attributes:Dock(TOP)
			self.attributes:DockMargin(0, 0, 0, 8)
			-- self.attributes.Paint = function(this, width, height)
			-- 	surface.SetDrawColor(0, 0, 0, 255)
			-- 	surface.DrawRect(0, 0, width, height)
			-- 	surface.SetTextColor(255,255,255,255)
			-- end

			local boost = character:GetBoosts()
			local bFirst = true

			for k, v in SortedPairsByMemberValue(ix.attributes.list, "name") do
				local attributeBoost = 0

				if v.secondary then
					continue
				end

				if (boost[k]) then
					for _, bValue in pairs(boost[k]) do
						attributeBoost = attributeBoost + bValue
					end
				end

				local bar = self.attributes:Add("ixAttributeBar")
				bar:Dock(TOP)

				if (!bFirst) then
					bar:DockMargin(0, 3, 0, 0)
				else
					bFirst = false
				end

				local value = character:GetAttribute(k, 0)

				if (attributeBoost) then
					bar:SetValue(value - attributeBoost or 0)
				else
					bar:SetValue(value)
				end

				local maximum = v.maxValue or ix.config.Get("maxAttributes", 30)
				bar:SetMax(maximum)
				bar:SetReadOnly()
				bar:SetText(Format("%s [%.1f/%.1f]", L(v.name), value, maximum))

				if (attributeBoost) then
					bar:SetBoost(attributeBoost)
				end
			end

			self.attributes:SizeToContents()
		end
	end

	/*if (!suppress.secattributes) then
		local character = LocalPlayer().GetCharacter and LocalPlayer():GetCharacter()

		if (character) then
			self.secattributes = self:Add("ixCategoryPanel")
			self.secattributes:SetText("Secondary Attributes")
			self.secattributes:Dock(TOP)
			self.secattributes:DockMargin(0, 0, 0, 8)

			local boost = character:GetBoosts()
			local bFirst = true

			for k, v in SortedPairsByMemberValue(ix.attributes.list, "name") do
				local attributeBoost = 0

				if v.secondary != true then
					continue
				end
				
				if (boost[k]) then
					for _, bValue in pairs(boost[k]) do
						attributeBoost = attributeBoost + bValue
					end
				end
				
				local bar = self.secattributes:Add("ixAttributeBar")
				bar:Dock(TOP)
				
				if (!bFirst) then
					bar:DockMargin(0, 3, 0, 0)
				else
					bFirst = false
				end

				local value = character:GetAttribute(k, 0)

				if (attributeBoost) then
					bar:SetValue(value - attributeBoost or 0)
				else
					bar:SetValue(value)
				end

				local maximum = v.maxValue or ix.config.Get("maxAttributes", 30)
				if (value - attributeBoost) > value then
					bar:SetMax(value - attributeBoost)
				else
					bar:SetMax(value)
				end
				bar:SetReadOnly()
				bar:SetText(Format("%s [%i]", L(v.name), value, maximum))

				if (attributeBoost) then
					bar:SetBoost(attributeBoost)
				end
			end

			self.secattributes:SizeToContents()
		end
	end*/
	if (self.perks) then
		if (!suppress.perks) then
			local character = LocalPlayer().GetCharacter and LocalPlayer():GetCharacter()

			if (character) then
				self.perks = self:Add("ixCategoryPanel")
				self.perks:SetText("Perks")
				self.perks:Dock(TOP)
				self.perks:DockMargin(0, 0, 0, 8)

				local boost = character:GetBoosts()
				local bFirst = true

				for k, v in SortedPairsByMemberValue(ix.perks.list, "name") do
					local perkBoost = 0
					if (boost[k]) then
						for _, bValue in pairs(boost[k]) do
							perkBoost = perkBoost + bValue
						end
					end

					local bar = self.perks:Add("ixAttributeBar")
					bar:Dock(TOP)
					if (!bFirst) then
						bar:DockMargin(0, 3, 0, 0)
					else
						bFirst = false
					end

					local value = character:GetPerk(k, 0)
					if (perkBoost) then
						bar:SetValue(value - perkBoost or 0)
					else
						bar:SetValue(value)
					end

					local maximum = v.maxValue or ix.config.Get("maxPerks", 30)
					bar:SetMax(maximum)
					bar:SetReadOnly()
					bar:SetText(Format("%s [%i/%i]", L(v.name), value, maximum))
					if (perkBoost) then
						bar:SetBoost(perkBoost)
					end
				end
				self.perks:SizeToContents()
			end
		end
	end
	if !suppress.protection then
		local character = LocalPlayer().GetCharacter and LocalPlayer():GetCharacter()

		if character then
			local inventory = character:GetInv()
			local imptotal = 0
			local burntotal = 0
			local shocktotal = 0
			local chemtotal = 0
			local radtotal = 0
			local psitotal = 0

			for k, v in pairs (inventory:GetItems()) do
				if (!v:GetData("equip", false)) then continue end --ignores unequipped items

				local dura = v:GetData("durability", 0)
				if (dura <= 0) then continue end --ignores items with 0 durability

				local res = v.res

				if !res then continue end

				if (res["Fall"]) then
					imptotal = imptotal + res["Fall"]
				end

				if (res["Burn"]) then
					burntotal = burntotal + res["Burn"]
				end

				if (res["Radiation"]) then
					radtotal = radtotal + res["Radiation"]
				end

				if (res["Chemical"]) then
					chemtotal = chemtotal + res["Chemical"]
				end

				if (res["Shock"]) then
					shocktotal = shocktotal + res["Shock"]
				end

				if (res["Psi"]) then
					psitotal = psitotal + res["Psi"]
				end

				local modData = v:GetData("mod", {})
				for k, modTable in pairs(modData) do

					local modItem = ix.item.list[modTable[1]]

					if (!modItem) then continue end

					local modres = modItem.res

					if (modres) then
						if (modres["Fall"]) then
							imptotal = imptotal + modres["Fall"]
						end

						if (modres["Burn"]) then
							burntotal = burntotal + modres["Burn"]
						end

						if (modres["Radiation"]) then
							radtotal = radtotal + modres["Radiation"]
						end

						if (modres["Chemical"]) then
							chemtotal = chemtotal + modres["Chemical"]
						end

						if (modres["Shock"]) then
							shocktotal = shocktotal + modres["Shock"]
						end

						if (modres["Psi"]) then
							psitotal = psitotal + modres["Psi"]
						end
					end
				end
			end

			local resistances = {
				["Impact"] = imptotal * 100,
				["Burn"] = burntotal * 100,
				["Radiation"] = radtotal * 100,
				["Chemical"] = chemtotal * 100,
				["Shock"] = shocktotal * 100,
				["Psi"] = psitotal * 100,
			}

			self.resistances = self:Add("ixCategoryPanel")
			self.resistances:SetText("Resistances")
			self.resistances:Dock(TOP)
			self.resistances:DockMargin(0, 0, 0, 8)

			local bFirst = true

			for k, v in pairs(resistances) do
				local bar = self.resistances:Add("ixAttributeBar")
				bar:Dock(TOP)

				if (!bFirst) then
					bar:DockMargin(0, 3, 0, 0)
				else
					bFirst = false
				end

				bar:SetMax(100)
				bar:SetValue(v)
				bar:SetReadOnly()
				bar:SetText(Format("%s [%i/%i]", k, v, 100))
			end

			self.resistances:SizeToContents()
		end
	end

	hook.Run("CreateCharacterInfoCategory", self)
end

function PANEL:Update(character)
	if (!character) then
		return
	end

	local faction = ix.faction.indices[character:GetFaction()]
	local class = ix.class.list[character:GetClass()]

	if (self.name) then
		self.name:SetText(character:GetName())

		if (faction) then
			self.name.backgroundColor = ColorAlpha(faction.color, 150) or Color(0, 0, 0, 150)
		end

		--self.name:SizeToContents()
	end

	if (self.description) then
		self.description:SetText(character:GetDescription())
		self.description:SizeToContents()
	end

	if (self.faction) then
		self.faction:SetLabelText(L("faction"))
		self.faction:SetText(L(faction.name))
		self.faction:SizeToContents()
	end

	if (self.class) then
		-- don't show class label if the class is the same name as the faction
		if (class and class.name != faction.name) then
			self.class:SetLabelText(L("class"))
			self.class:SetText(L(class.name))
			self.class:SizeToContents()
		else
			self.class:SetVisible(false)
		end
	end

	if (self.money) then
		self.money:SetText(ix.currency.Get(character:GetMoney()))
		--self.money:SizeToContents()
	end

	hook.Run("UpdateCharacterInfo", self.characterInfo, character)

	self.characterInfo:SizeToContents()

	hook.Run("UpdateCharacterInfoCategory", self, character)
end

function PANEL:OnSubpanelRightClick()
	properties.OpenEntityMenu(LocalPlayer())
end

vgui.Register("ixCharacterInfo", PANEL, "DScrollPanel")

hook.Add("CreateMenuButtons", "ixCharInfo", function(tabs)
	tabs["you"] = {
		bHideBackground = true,
		buttonColor = team.GetColor(LocalPlayer():Team()),
		Create = function(info, container)
			container.infoPanel = container:Add("ixCharacterInfo")
			container.infoPanel:DockMargin(0,container.infoPanel:GetParent():GetTall() * 0.15,container.infoPanel:GetParent():GetWide() * 0.05,container.infoPanel:GetParent():GetWide() * 0.17)


			container.OnMouseReleased = function(this, key)
				if (key == MOUSE_RIGHT) then
					this.infoPanel:OnSubpanelRightClick()
				end
			end
		end,
		OnSelected = function(info, container)
			container.infoPanel:Update(LocalPlayer():GetCharacter())
			ix.gui.menu:SetCharacterOverview(true)
		end,
		OnDeselected = function(info, container)
			ix.gui.menu:SetCharacterOverview(false)
		end
	}
end)

hook.Add("CreateMenuButtons", "ixCharInv", function(tabs)
	tabs["inventory"] = {
		bHideBackground = true,
		buttonColor = team.GetColor(LocalPlayer():Team()),
		Create = function(info, container)
			--cl_inventory start
			local canvas = container:Add("DTileLayout")
			local canvasLayout = canvas.PerformLayout
			canvas.PerformLayout = nil -- we'll layout after we add the panels instead of each time one is added
			canvas:SetBorder(0)
			canvas:SetSpaceX(2)
			canvas:SetSpaceY(2)
			canvas:Dock(FILL)


			ix.gui.menuInventoryContainer = canvas

			local panel = canvas:Add("ixInventory")
			panel:SetPos(0, 0)
			panel:SetDraggable(false)
			panel:SetSizable(false)
			panel:SetTitle("")
			panel.bNoBackgroundBlur = true
			panel.childPanels = {}

			local inventory = LocalPlayer():GetCharacter():GetInventory()

			if (inventory) then
				panel:SetInventory(inventory)
			end

			ix.gui.inv1 = panel

			if (ix.option.Get("openBags", true)) then
				for _, v in pairs(inventory:GetItems()) do
					if v.isBag and v:GetData("equip") == true then
						v.functions.View.OnClick(v)
					end
				end
			end

			canvas.PerformLayout = canvasLayout
			canvas:Layout()
			--cl_inventory end
		end
	}
end)
