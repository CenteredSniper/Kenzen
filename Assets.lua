local Asset = {}

local notification,fastwait
local gethiddengui = gethiddengui or nil
local sethiddenproperty = sethiddenproperty or function(obj,property,value) pcall(function() obj[property] = value end) end
pcall(function() notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/notificationstuff/main/src.lua",true))() end)
pcall(function() fastwait = loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/FastWait.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))() end)

Asset.ProtectGUI = function(GUI)
	if gethiddengui then
		GUI.Parent = gethiddengui()
	else
		Asset.Notification("gethiddengui not available")
	end
end

Asset.Spawn = function(Function)
	return task.spawn(coroutine.create(Function))
end

Asset.Clone = function(Obj,Parent)
	if Obj then
		local Clone
		if not Obj.Archivable then
			Obj.Archivable = true
			Clone = Obj:Clone()
			Obj.Archivable = false
		else
			Clone = Obj:Clone()
		end
		return Clone
	end
	return nil
end

Asset.new = function(Name,Parent,Properties)
	local NewInstance = Instance.new(Name)
	for i,v in pairs(Properties or {}) do
		pcall(function()
			sethiddenproperty(NewInstance,i,v)
		end)
	end
	NewInstance.Parent = Parent or nil
	return NewInstance
end

Asset.GetObject = function(ID)
	local Object
	pcall(function() Object = game:GetObjects("rbxassetid://" .. ID)[1] end)
	return Object
end

Asset.GetAssetFromURL = function(GUI)
	local getsynasset, request = getsynasset or getcustomasset or error('invalid attempt to \'getsynassetfromurl\' (custom asset retrieval function expected)'), (syn and syn.request) or (http and http.request) or (request) or error('invalid attempt to \'getsynassetfromurl\' (http request function expected)')
	local Extension, Types, URL = '', {'.png', '.webm'}, assert(tostring(type(URL)) == 'string', 'invalid argument #1 to \'getsynassetfromurl\' (string [URL] expected, got '..tostring(type(URL))..')') and URL or nil
	local Response, TempFile = request({
		Url = URL,
		Method = 'GET'
	})

	if Response.StatusCode == 200 then
		Extension = Response.Body:sub(2, 4) == 'PNG' and '.png' or Response.Body:sub(25, 28) == 'webm' and '.webm' or nil
	end

	if Response.StatusCode == 200 and (Extension and table.find(Types, Extension)) then
		for i = 1, 15 do
			local Letter, Lower = string.char(math.random(65, 90)), math.random(1, 5) == 3 and true or false
			TempFile = (not TempFile and '' .. (Lower and Letter:lower() or Letter)) or (TempFile .. (Lower and Letter:lower() or Letter)) or nil
		end

		writefile(TempFile..Extension, Response.Body)
		return getsynasset(TempFile..Extension)
	elseif Response.StatusCode ~= 200 or not Extension then
		warn('unexpected \'getsynassetfromurl\' Status Error: ' .. Response.StatusMessage .. ' ('..URL..')')
	elseif not (Extension) then
		warn('unexpected \'getsynassetfromurl\' Error: (PNG or webm file expected)')
	end
end

Asset.FindDad = function()
	return nil
end

Asset.Netless = function(Part)
	if Part:IsA("BasePart") then
		local BodyVelocity = Instance.new("BodyVelocity",Part)
		BodyVelocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge); 
		BodyVelocity.P = math.huge; 
		BodyVelocity.Velocity = Vector3.new(-25.05,-25.05,-25.05)

		local BodyAngularVelocity = Instance.new("BodyAngularVelocity",Part)
		BodyAngularVelocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); 
		BodyAngularVelocity.P = math.huge;

		local disconnect = game:GetService("RunService").Heartbeat:Connect(function()
			Part:ApplyImpulse(Vector3.new(-25.05,-25.05,-25.05))
		end)
		Part.AncestryChanged:Connect(function()
			if not Part.Parent then 
				disconnect:Disconnect()
			end
		end)
	end
	return Part
end

Asset.GetAll = function(Path,Name)
	local Instances = {}
	for i,v in pairs(Path:GetChildren()) do
		if v.Name == Name then
			table.insert(Instances,v)
		end
	end
	return Instances
end

Asset.WaitForChildOfClass = function(Path,ClassName)
	local waitTime = 0
	local warned = false
	local timeOut = 5
	repeat
		local obj = Path:FindFirstChildOfClass(ClassName)
		if obj then 
			return obj 
		else
			waitTime = waitTime + task.wait()
			if timeOut then 
				if waitTime > timeOut then return nil end
			elseif not warned then
				if waitTime > 5 then 
					warn("Infinite yield possible waiting on",Path:GetFullName() .. ":WaitForChildOfClass(\"".. ClassName .. "\")")
					warned = true
				end
			end
		end
	until false
end

Asset.Notification = function(Text,Time)
	if notification then
		notification({
			Text = Text,
			Duration = Time
		})
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Notification",
			Text = Text,
			Duration = Time,
		})
	end
end

Asset.Wait = function(Time)
	if fastwait then
		fastwait(Time)
	else
		task.wait(Time or 0)
	end
end

Asset.Stepped = function(Function,Property,Value)
	if typeof(Function) == "Instance" then
		game:GetService("RunService").Stepped:Connect(function()
			sethiddenproperty(Function,Property,Value)
		end)
	else
		game:GetService("RunService").Stepped:Connect(Function)
	end
end

Asset.RenderStep = function(Function,Property,Value)
	if typeof(Function) == "Instance" then
		game:GetService("RunService").RenderStepped:Connect(function()
			sethiddenproperty(Function,Property,Value)
		end)
	else
		game:GetService("RunService").RenderStepped:Connect(Function)
	end
end

Asset.Heartbeat = function(Function,Property,Value)
	if typeof(Function) == "Instance" then
		game:GetService("RunService").Heartbeat:Connect(function()
			sethiddenproperty(Function,Property,Value)
		end)
	else
		game:GetService("RunService").Heartbeat:Connect(Function)
	end
end

Asset.Teleport = function(PlaceID,Player)
	game:GetService("TeleportService"):Teleport(PlaceID,Player)
end

Asset.FireTouch = function(Part)
	if firetouchinterest then
		firetouchinterest(Part, game.Players.LocalPlayer.Character:FindFirstChildOfClass("BasePart"), 1, Asset.Wait(1/30) and firetouchinterest(Part, game.Players.LocalPlayer.Character:FindFirstChildOfClass("BasePart"), 0))
	else
		Asset.Notification("Firetouchinterest not available")
	end
end

Asset.LoopEvent = function(Remote,args)
	if Remote:IsA("RemoteEvent") then
		Asset.Stepped(function() Remote:FireServer(unpack(args)) end)
	elseif Remote:IsA("RemoteFunction") then
		Asset.Stepped(function() Remote:InvokeServer(unpack(args)) end)
	else
		Asset.Notification("Not a remote?")
	end
end

Asset.DetectExploit = function()
	local exploit = 
		(syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
		(is_sirhurt_closure and "Sirhurt") or
		(KRNL_LOADED and "Krnl") or
		(WrapGlobal and "WeAreDevs") or
		(OXYGEN_LOADED and "Oxygen U") or
		(IsElectron and "Electron") or
		("Undetected")
	return exploit
end

Asset.WebhookSend = function(webhook,message)
	local request = (syn and syn.request) or (http and http.request) or (request) or error('http request function expected')
	request{Url = webhook, Body = game:GetService("HttpService"):JSONEncode({['content'] = message}), Method = "POST", Headers = {["content-type"] = "application/json"}}	
end

Asset.CollisionGroup = function(Part)
	local PhysicsService = game:GetService("PhysicsService")
	if not pcall(function() PhysicsService:GetCollisionGroupId("NoCollide") end) then 
		PhysicsService:CreateCollisionGroup("NoCollide")
		PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)
	end
	if Part:IsA("BasePart") then
		PhysicsService:SetPartCollisionGroup(Part, "NoCollide")
	end
end

Asset.Ping = function()
	return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
end
Asset.FPS = function()
	return 1/(task.wait())
end

Asset.MarketInfo = function(ID)
	local marketinfo = game:GetService("MarketplaceService"):GetProductInfo(tonumber(ID))
	repeat 
		task.wait(3)
		marketinfo = game:GetService("MarketplaceService"):GetProductInfo(tonumber(ID))
	until marketinfo
	return marketinfo
end

Asset.HiddenChanged = function(Obj,Property,Method)
	local Event = Instance.new("BindableEvent")
	local gethiddenproperty = gethiddenproperty or function(Obj,Property) pcall(function() return Obj[Property] end) end
	local PropertyValue = gethiddenproperty(Obj,Property)
	if Method == "Stepped" or Method == "Both" then
		Asset.Stepped(function()
			if PropertyValue ~= gethiddenproperty(Obj,Property) then
				PropertyValue = gethiddenproperty(Obj,Property)
				Event:Fire()
			end
		end)
	end
	if not Method or Method == "Heartbeat" or Method == "Both" then
		Asset.Heartbeat(function()
			if PropertyValue ~= gethiddenproperty(Obj,Property) then
				PropertyValue = gethiddenproperty(Obj,Property)
				Event:Fire()
			end
		end)
	end
	return Event.Event
end

Asset.GetWeld = function(Part)
	local Instances = {}
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Weld") or v:IsA("Motor6D") or v:IsA("ManuelWeld") then
			if v.Part1 == Part then
				table.insert(Instances,v)
			end
			if v.Part0 == Part then
				table.insert(Instances,v)
			end
		end
	end
	return Instances
end

if getgenv().gethiddengui then
	gethiddengui = getgenv().gethiddengui
end

Asset.Spawn(function()
	pcall(function()
		if not gethui or gethiddengui then 
			--- Synapse gethui() made by nul#3174 ---

			local CoreGui = cloneref(game:GetService("CoreGui"))
			local RobloxGui = cloneref(CoreGui:WaitForChild("RobloxGui"))
			local Folder = cloneref(Instance.new("Folder")) or cloneref(RobloxGui:FindFirstChildOfClass("Folder")) 

			for i, v in next, getconnections(CoreGui.ChildAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.ChildRemoved) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.DescendantAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.DescendantRemoving) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.childAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.Destroying) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.Changed) do
				v:Disable()
			end

			for i, v in next, getconnections(CoreGui.AncestryChanged) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.DescendantAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.DescendantRemoving) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.ChildAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.ChildRemoved) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.Destroying) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.Changed) do
				v:Disable()
			end

			for i, v in next, getconnections(RobloxGui.AncestryChanged) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.ChildAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.ChildRemoved) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.DescendantAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.DescendantRemoving) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.childAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.Destroying) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.Changed) do
				v:Disable()
			end

			for i, v in next, getconnections(Folder.AncestryChanged) do
				v:Disable()
			end

			syn.protect_gui(Folder)
			syn.protect_gui(CoreGui)
			syn.protect_gui(RobloxGui)

			local old;
			old = hookmetamethod(game, "__index", newcclosure(function(self, idx)
				if (not checkcaller() and typeof(self) == "Instance" and self == Folder and tostring(idx):lower() == "parent") then
					return nil;
				end
				return old(self, idx);
			end));

			Folder.Parent = RobloxGui

			gethiddengui = function()
				return cloneref(Folder)
			end

			getgenv().gethiddengui = gethiddengui

			for i, v in next, getconnections(gethiddengui().ChildAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().ChildRemoved) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().DescendantAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().DescendantRemoving) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().childAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().Destroying) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().Changed) do
				v:Disable()
			end

			for i, v in next, getconnections(gethiddengui().AncestryChanged) do
				v:Disable()
			end

			getgenv().gethui = gethiddengui

			for i, v in next, getconnections(gethui().ChildAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().ChildRemoved) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().DescendantAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().DescendantRemoving) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().childAdded) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().Destroying) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().Changed) do
				v:Disable()
			end

			for i, v in next, getconnections(gethui().AncestryChanged) do
				v:Disable()
			end
		end
	end)
end)

return Asset
