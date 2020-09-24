if _G.DQPLUS then
	error("DQ+ is already running!",0)
	return
end
_G.DQPLUS = true
if not game:IsLoaded() then
	local notLoaded = Instance.new("Message",workspace)
	notLoaded.Text = 'game load plz thx'
	game.Loaded:Wait()
	notLoaded:Destroy()
end
repeat wait(0.1) until game.Players.LocalPlayer.PlayerGui:FindFirstChild("inventory")
--	locals
local nosave = false
local itemtable
local DQsortinventory = false
local DQviewport = false
local defaultsettings = {
	sortinventory = false;
	viewport = false;
}
local defaults = game:GetService("HttpService"):JSONEncode(defaultsettings)
--local u1 = require(game.ReplicatedStorage:WaitForChild("inventoryHelperFunctions"));
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local freakoutmode = false

--	Saves
local function DQwritefileExploit()
	if writefile then
		return true
	end
end

local cooldown = false
local function DQwritefileCooldown(name,data)
	spawn(function()
		if not cooldown then
			cooldown = true
			writefile(name, data)
		else
			repeat wait() until cooldown == false
			DQwritefileCooldown(name,data)
		end
		wait(3)
		cooldown = false
	end)
end

function savesDQPlus()
	if DQwritefileExploit() then
		if pcall(function() readfile("DQ.plus") end) then
			if readfile("DQ.plus") ~= nil then
				local success, response = pcall(function()
					local json = game:GetService("HttpService"):JSONDecode(readfile("DQ.plus"))
					if json.sortinventory ~= nil then DQsortinventory = json.sortinventory else DQsortinventory = false end
					if json.viewport ~= nil then DQviewport = json.viewport else DQviewport = false end
				end)
				if not success then
					warn("Save Json Error:", response)
					warn("Overwriting Save File")
					DQwritefileCooldown("DQ.plus", defaults)
					wait()
					savesDQPlus()
				end
			else
				DQwritefileCooldown("DQ.plus", defaults)
				wait()
				savesDQPlus()	
			end
		else
			DQwritefileCooldown("DQ.plus", defaults)
			wait()
			if pcall(function() readfile("DQ.plus") end) then
				savesDQPlus()
			else
				nosave = true
				DQsortinventory = false
				DQviewport = false
			end
		end
	end
end

savesDQPlus()

function updatesavesDQPlus()
	if nosave == false and DQwritefileExploit() then
		local update = {
			sortinventory = DQsortinventory;
			viewport = DQviewport;
		}
		DQwritefileCooldown("DQ.plus", game:GetService("HttpService"):JSONEncode(update))
	end
end

--	Sorting
local function dasortweapon(yep)
	for i,v in pairs(itemtable.weapons) do
		if tonumber(string.sub(i,8)) == yep then
			--            warn(v.levelReq)
			return v
		end
	end
end
local function dasortchest(yep)
	for i,v in pairs(itemtable.chests) do
		if tonumber(string.sub(i,7)) == yep then
			--            warn(v.levelReq)
			return v
		end
	end
end
local function dasortability(yep)
	for i,v in pairs(itemtable.abilities) do
		if tonumber(string.sub(i,9)) == yep then
			--            warn(v.levelReq)
			return v
		end
	end
end
local function dasorthelmet(yep)
	for i,v in pairs(itemtable.helmets) do
		if tonumber(string.sub(i,8)) == yep then
			--            warn(v.levelReq)
			return v
		end
	end
end
local function epicsortsystem()
	if game:GetService("ReplicatedStorage").remotes:FindFirstChild("sellItemEvent") then
		local function epicfunnyhahahtakeachillpillbroxd(locationepic)
			for _,g in pairs(locationepic:GetChildren()) do
				if g:IsA("ImageLabel") then
					local returnvalue
					if g.itemType.Value == "weapon" then
						returnvalue = dasortweapon(g.itemType.uniqueItemNum.Value)
					elseif g.itemType.Value == "helmet" then
						returnvalue = dasorthelmet(g.itemType.uniqueItemNum.Value)
					elseif g.itemType.Value == "ability" then
						returnvalue = dasortability(g.itemType.uniqueItemNum.Value)
					elseif g.itemType.Value == "chest" then
						returnvalue = dasortchest(g.itemType.uniqueItemNum.Value)
					end
					g.LayoutOrder = tonumber(returnvalue.levelReq)
				end
			end
		end
		epicfunnyhahahtakeachillpillbroxd(PlayerGui.inventory.mainBackground.innerBackground.rightSideFrame.ScrollingFrame)
		if PlayerGui:FindFirstChild("tradingGui") then epicfunnyhahahtakeachillpillbroxd(PlayerGui.tradingGui.mainBackground.innerBackground.rightSideFrame.ScrollingFrame) end
		if PlayerGui:FindFirstChild("blacksmith") then epicfunnyhahahtakeachillpillbroxd(PlayerGui.blacksmith.Frame.innerFrame.rightSideFrame.ScrollingFrame) end
		if PlayerGui:FindFirstChild("sellShop") then epicfunnyhahahtakeachillpillbroxd(PlayerGui.sellShop.Frame.innerFrame.rightSideFrame.ScrollingFrame) end
	end
end
if game:GetService("ReplicatedStorage").remotes:FindFirstChild("sellItemEvent") then
	game.ReplicatedStorage.remotes.updateLocalInventoryTable.OnClientEvent:Connect(function(updatedtable)
		if updatedtable then
			itemtable = updatedtable;
			
		end;
	end);
	local EMPTYTABLELOL = {
		["ability"] = {},
		["helmet"] = {},
		["chest"] = {},
		["weapon"] = {}
	}
	
	game:GetService("ReplicatedStorage").remotes.sellItemEvent:FireServer(EMPTYTABLELOL)
	repeat wait(0.1) until itemtable ~= nil
	--sortsystemhere
	
	PlayerGui.inventory.mainBackground.innerBackground.rightSideFrame.ScrollingFrame.ChildAdded:Connect(function()
		wait(1.5)
		if DQsortinventory == true then
			epicsortsystem()
		end
	end)
	PlayerGui.inventory.mainBackground.innerBackground.rightSideFrame.ScrollingFrame.ChildRemoved:Connect(function()
		wait(1.5)
		if DQsortinventory == true then
			epicsortsystem()
		end
	end)
	if DQsortinventory == true then
		epicsortsystem()
	end
end
-- view port frame
local char = game.Players.LocalPlayer.Character
local cam = Instance.new("Camera",script.Parent)
local viewportgui = Instance.new("ScreenGui",PlayerGui)
viewportgui.ResetOnSpawn = false
local viewportframe = Instance.new("ViewportFrame",viewportgui)
viewportframe.Position = UDim2.new(0.6,0,0.99,0)
viewportframe.Size = UDim2.new(0,150,0,150)
viewportframe.AnchorPoint = Vector2.new(0,1)
viewportframe.BackgroundTransparency = 1
viewportframe.Visible = false
local Character1 = Instance.new("Model",viewportframe)
Character1.Name = "Character1"
game:GetService("RunService").RenderStepped:Connect(function()
	if DQviewport then
		viewportframe.Visible = true
		for i,v in pairs(Character1:GetDescendants()) do
			v:Destroy()
		end
		for i,v in pairs(char:GetChildren()) do
			local v2 = v:Clone()
			if v2:IsA("Script") or v2:IsA("LocalScript") or v2:IsA("ModuleScript") then
				v2:Destroy()
			else
				v2.Parent = Character1
				if v2:IsA("Humanoid") then
					v2.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				end
			end
			
			
			
		end
		viewportframe.CurrentCamera = cam
		cam.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5) *  CFrame.Angles(math.rad(-10),math.rad(180),0)
	else
		viewportframe.Visible = false
	end
end)
-- player info shower
local PlayerStatus = PlayerGui.playerStatus.Frame
PlayerStatus.healthFrame.health.Changed:Connect(function()
	if freakoutmode == false then
		wait(0.1)
		PlayerStatus.healthFrame.health.Text = (tostring(LocalPlayer.Character.Humanoid.Health) .. "/" .. tostring(LocalPlayer.Character.Humanoid.MaxHealth))
	end	
end)
LocalPlayer.XP.Changed:Connect(function()
	wait(0.1)
	PlayerStatus.xpFrame.xp.Text = (tostring(LocalPlayer.XP.Value) .. "/" .. tostring(LocalPlayer.XPNeeded.Value))
end)
LocalPlayer.leaderstats.Gold.Changed:Connect(function()
	wait(0.1)
	PlayerStatus.moneyMain.TextLabel.Text = (tostring(LocalPlayer.leaderstats.Gold.Value))
end)

for i,player in pairs(PlayerStatus.teammateHolder:GetChildren()) do
	if player:IsA("Frame") then
		print("any feedback")
		local pplayer = game.Players[player.playerName.Text]
		local XPLabel = player.playerName:Clone()
		XPLabel.Parent = player
		XPLabel.Name = "XP"
		XPLabel.TextColor3 = Color3.new(170/255,0,255/255)
		XPLabel.Position = UDim2.new(0.1,0,0.7,0)
		XPLabel.TextStrokeTransparency = 0.6
		XPLabel.TextScaled = false
		XPLabel.TextWrapped = false
		XPLabel.TextSize = 18
		XPLabel.Text = (tostring(pplayer.XP.Value) .. "/" .. tostring(pplayer.XPNeeded.Value))
		pplayer.XP.Changed:Connect(function()
			XPLabel.Text = (tostring(pplayer.XP.Value) .. "/" .. tostring(pplayer.XPNeeded.Value))
		end)	
	end
end
PlayerStatus.teammateHolder.ChildAdded:Connect(function(player)
	wait(0.6)
	if player:IsA("Frame") then
		print("any feedback 2")
		local pplayer = game.Players[player.playerName.Text]
		local XPLabel = player.playerName:Clone()
		XPLabel.Parent = player
		XPLabel.Name = "XP"
		XPLabel.TextColor3 = Color3.new(170/255,0,255/255)
		XPLabel.Position = UDim2.new(0.1,0,0.7,0)
		XPLabel.TextStrokeTransparency = 0.6
		XPLabel.TextScaled = false
		XPLabel.TextWrapped = false
		XPLabel.TextSize = 18
		XPLabel.Text = (tostring(pplayer.XP.Value) .. "/" .. tostring(pplayer.XPNeeded.Value))
		pplayer.XP.Changed:Connect(function()
			XPLabel.Text = (tostring(pplayer.XP.Value) .. "/" .. tostring(pplayer.XPNeeded.Value))
		end)	
	end
end)

-- settings menu



local function settingcolor(variable)
	if variable then
		return Color3.new(52/255, 127/255, 25/255)
	else
		return Color3.new(122/255, 24/255, 24/255)
	end
end

local function applyredesignsetting(location)
	location.SliceScale = 0.04
	location.optionsInner.ImageTransparency = 1
	location.xFrame.Position = UDim2.new(1,0,0.015,0)
	location.xFrame.Size = UDim2.new(0.03,0,0.1,0)
	location.xFrame.AnchorPoint = Vector2.new(1,1)
	location.xFrame.ImageLabel.ImageTransparency = 0
	location.xFrame.ImageTransparency = 0
	location.xFrame.xButton["TextButton_Roundify_12px"].ImageTransparency = 1
	local optionslol = location.optionsInner
	location.Size = UDim2.new(0.5,0,0.4,0)
	for i,okyeah in pairs(optionslol:GetChildren()) do
		okyeah.Size = UDim2.new(0.18,0,0.135,0)
		okyeah.Position = UDim2.new(0.1,0,okyeah.Position.Y.Scale,0)
		okyeah.TextButton.main.ImageTransparency = 1
		okyeah.TextButton.main.BackgroundColor3 = okyeah.TextButton.main.ImageColor3
		okyeah.TextButton.main.background.ImageTransparency = 1
		okyeah.TextButton.main.background.BackgroundColor3 = okyeah.TextButton.main.background.ImageColor3
		okyeah.TextButton.main.BackgroundTransparency = 0
		okyeah.TextButton.main.background.BackgroundTransparency = 0
		okyeah.TextButton.MouseButton1Click:Connect(function()
			okyeah.TextButton.main.background.BackgroundColor3 = okyeah.TextButton.main.background.ImageColor3
		end)
	end
	local Splitter = Instance.new("Frame",optionslol)
	Splitter.BackgroundColor3 = Color3.new(64/255, 64/255, 64/255)
	Splitter.Size = UDim2.new(0.01,0,0.99,0)
	Splitter.Position = UDim2.new(0.2,0,0.5,0)
	Splitter.AnchorPoint = Vector2.new(0,0.5)
	Splitter.BorderSizePixel = 0
	local function addbuttontosettings(position,name,text)
		local tempbutton = optionslol.music:Clone()
		tempbutton.Name = name
		tempbutton.Text = text
		tempbutton.TextButton.musicLocalScript:Destroy()
		tempbutton.Position = position
		return tempbutton
	end
	local viewportsetting = addbuttontosettings(UDim2.new(0.31,0,0.33,0),"viewport","Viewport Frame")
	viewportsetting.Parent = optionslol
	viewportsetting.TextButton.main.background.BackgroundColor3 = settingcolor(DQviewport)
	viewportsetting.TextButton.MouseButton1Click:Connect(function()
		DQviewport = not DQviewport
		viewportsetting.TextButton.main.background.BackgroundColor3 = settingcolor(DQviewport)	
		if nosave == false then
			updatesavesDQPlus()
		end	
	end)
	if game:GetService("ReplicatedStorage").remotes:FindFirstChild("sellItemEvent") then
		local inventorysortsetting = addbuttontosettings(UDim2.new(0.31,0,0,0),"inventorysort","Sort Inventory")
		inventorysortsetting.Parent = optionslol
		inventorysortsetting.TextButton.main.background.BackgroundColor3 = settingcolor(DQsortinventory)
		inventorysortsetting.TextButton.MouseButton1Click:Connect(function()
			DQsortinventory = not DQsortinventory
			inventorysortsetting.TextButton.main.background.BackgroundColor3 = settingcolor(DQsortinventory)
			epicsortsystem()	
			if nosave == false then
				updatesavesDQPlus()
			end
		end)
	end
end
applyredesignsetting(PlayerGui.mainInterface.options)
-- other functions

local function inventoryredesign()
	local inventory = PlayerGui.inventory.mainBackground
	inventory.Size = UDim2.new(0.6,0,0.5,0)
	inventory.gearTab.Visible = false
	inventory.statsTab.Visible = false
	local inventory2 = inventory.innerBackground
	inventory2.divider.Position = UDim2.new(0.29,0,0.5,0)
	local divider = inventory2.divider:Clone()
	divider.Position = UDim2.new(0.58,0,0.5,0)
	divider.Parent = inventory2
	inventory2.rightSideFrame.Size = UDim2.new(0.43,0,1,0)
	inventory2.leftSideFrame.Position = UDim2.new(0.29,0,0,0)
	inventory2.leftSideStats.Visible = true
	inventory2.leftSideFrame.Visible = true
end
inventoryredesign()

local function readdondeath()
	PlayerStatus.healthFrame.health.Text = (tostring(LocalPlayer.Character.Humanoid.Health) .. "/" .. tostring(LocalPlayer.Character.Humanoid.MaxHealth))
	PlayerStatus.xpFrame.xp.Text = (tostring(LocalPlayer.XP.Value) .. "/" .. tostring(LocalPlayer.XPNeeded.Value))
	PlayerStatus.moneyMain.TextLabel.Text = (tostring(LocalPlayer.leaderstats.Gold.Value))
	for i,player in pairs(PlayerStatus.teammateHolder:GetChildren()) do
		if player:IsA("Frame") then
			local pplayer = game.Players[player.playerName.Text]
			local XPLabel = player.playerName:Clone()
			XPLabel.Parent = player
			XPLabel.Name = "XP"
			XPLabel.TextColor3 = Color3.new(170/255,0,255/255)
			XPLabel.Position = UDim2.new(0.1,0,0.7,0)
			XPLabel.TextStrokeTransparency = 0.6
			XPLabel.TextScaled = false
			XPLabel.TextWrapped = false
			XPLabel.TextSize = 18
			XPLabel.Text = (tostring(pplayer.XP.Value) .. "/" .. tostring(pplayer.XPNeeded.Value))
			pplayer.XP.Changed:Connect(function()
				XPLabel.Text = (tostring(pplayer.XP.Value) .. "/" .. tostring(pplayer.XPNeeded.Value))
			end)	
		end
	end
end
wait(1)
LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
	freakoutmode = true
	wait(8)
	if LocalPlayer.Character.Humanoid.Health >= 0 then
		applyredesignsetting(PlayerGui.mainInterface.options)
		inventoryredesign()
		readdondeath()
		freakoutmode = false
	end
end)
PlayerGui.ChildAdded:Connect(function()
	wait(3)
	epicsortsystem()
end)

wait(2)
for i,v in pairs(game.Players:GetPlayers()) do
	local test = false
	for d,p in pairs(PlayerStatus.teammateHolder:GetChildren()) do
		if p:IsA("Frame") then
			if v.Name == p.playerName.Text then
				test = true
			end
		end
	end
	if test then
		local newgui = game.ReplicatedStorage.teammateGui:Clone()
		newgui.Parent = PlayerStatus.teammateHolder
		newgui.playerName.Text = v.Name
		local XPLabel = newgui.playerName:Clone()
		XPLabel.Parent = newgui
		XPLabel.Name = "XP"
		XPLabel.TextColor3 = Color3.new(170/255,0,255/255)
		XPLabel.Position = UDim2.new(0.1,0,0.7,0)
		XPLabel.TextStrokeTransparency = 0.6
		XPLabel.TextScaled = false
		XPLabel.TextWrapped = false
		XPLabel.TextSize = 18
		XPLabel.Text = (tostring(v.XP.Value) .. "/" .. tostring(v.XPNeeded.Value))
		v.XP.Changed:Connect(function()
			XPLabel.Text = (tostring(v.XP.Value) .. "/" .. tostring(v.XPNeeded.Value))
		end)
	end
end
