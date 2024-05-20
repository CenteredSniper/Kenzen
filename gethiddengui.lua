--[[
	Originally made by nul#3174
	Rewritted by ProductionTakeOne#3330
]]

local PlaceWhitelist = {
	"4282985734",
	"11979315221"
}; local function CheckWhitelist()
	return not table.find(PlaceWhitelist,tostring(game.PlaceId))
end

local Global = Global or getgenv and getgenv() or getrenv and getrenv() or getfenv and getfenv() or shared or _G
local gethiddengui = nil
local tostring = tostring
local game = game
local type = type
local typeof = typeof or type
local table = table
local setfenv = setfenv
local getrawmetatable = getrawmetatable or nil
local DebugSettings = settings and settings():GetService("DebugSettings") or nil
local getrenv = getrenv or nil
local getnamecallmethod = getnamecallmethod or nil
local hookmetamethod = hookmetamethod or nil
local checkcaller = checkcaller or nil
local newcclosure = newcclosure or nil
local cloneref = cloneref or function(ref) return ref end
local getconnections = getconnections or get_connections or get_signal_cons
local setreadonly = setreadonly or make_readonly or makereadonly
local stats = stats and stats() or Stats and Stats() or game:GetService("Stats")

if Global and Global.gethiddengui then return end; math.randomseed(tick())

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local rPlayer = Players:FindFirstChildOfClass("Player") ~= nil and cloneref(Players:FindFirstChildOfClass("Player")) or nil
local coreGuiProtection = {}

local function CheckIfV3Menu()
	return CoreGui:FindFirstChild("InGameMenu") and CoreGui:FindFirstChild("InGameMenuModalBlur") or 
		CoreGui:FindFirstChild("InGameMenu") and CoreGui:FindFirstChild("InGameMenuConfirmationDialog") or 
		CoreGui:FindFirstChild("InGameMenu") and CoreGui:FindFirstChild("InGameMenuEducationalPopupDialog")
end

local Check = gethui and type(gethui) == "function" and typeof(gethui()) == "Instance" and gethui() ~= CoreGui and not CheckIfV3Menu()

local Folder; do
	if not pcall(function()
			Folder = Instance.new("ParabolaAdornment")
		end) then Folder = Instance.new("Folder") end
	local Name = Check and tostring(math.random(1e9, 2e9)) or "RobloxGui"
	Folder.Archivable = false

	Folder.DescendantAdded:Connect(function(v)
		coreGuiProtection[v] = rPlayer and rPlayer.Name or tostring(math.random(1e9, 2e9))
	end) coreGuiProtection[Folder] = not Check and "RobloxGui" or rPlayer and rPlayer.Name or tostring(math.random(1e9, 2e9))

	local ConnectionsToDisable = {"ChildAdded","ChildRemoved","DescendantAdded","DescendantRemoving","childAdded","Destroying","Changed","AncestryChanged"}; pcall(function()
		if getconnections then
			for _,Connection in pairs(ConnectionsToDisable) do
				for _,v in pairs(getconnections(CoreGui[Connection])) do
					v:Disable()
				end
				for _,v in pairs(getconnections(Folder[Connection])) do
					v:Disable()
				end
			end
			for _,v in pairs(getconnections(Folder.AttributeChanged)) do
				v:Disable()
			end
		end

		if syn and syn.protect_gui and not gethui then
			syn.protect_gui(Folder)
		end; if protect_gui and not gethui then
			protect_gui(Folder)
		end
	end)
end 

local gethiddengui = function() return Folder end

local _ENV,_Globals; if getrenv then
	_Globals = {__metatable = "This metatable is locked"}; do
		for i, v in next, getrenv() do
			_Globals[i] = v
		end
	end
	_ENV = {__index = _Globals,__metatable = "This metatable is locked"}; do
		for i, v in next, getrenv() do
			_ENV[i] = v
		end
	end
	pcall(function() setreadonly(_Globals, true) setreadonly(_ENV, true) end)
end

local MemoryUsageForGui = 0; do
	RunService.Heartbeat:Connect(function()
		pcall(function()
			MemoryUsageForGui = stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui)
		end)
	end)
end

local Event = Event or Global.Event; if not Event then
	local BindableEvent = Instance.new("BindableEvent")
	local AllStepped = BindableEvent.Event

	RunService.Heartbeat:Connect(function()
		BindableEvent:Fire()
	end)
	RunService.Stepped:Connect(function()
		BindableEvent:Fire()
	end)
	RunService.RenderStepped:Connect(function()
		BindableEvent:Fire()
	end)
	RunService:BindToRenderStep(tostring(math.random(1e9, 2e9)), 0, function()
		BindableEvent:Fire()
	end)
	task.spawn(function()
		while wait(0) do
			BindableEvent:Fire()
		end
	end)
	task.spawn(function()
		while task.wait(0) do
			BindableEvent:Fire()
		end
	end)

	pcall(function()
		RunService.PreSimulation:Connect(function()
			BindableEvent:Fire()
		end)
		RunService.PostSimulation:Connect(function()
			BindableEvent:Fire()
		end)
		RunService.PreAnimation:Connect(function()
			BindableEvent:Fire()
		end)
		RunService.PreRender:Connect(function()
			BindableEvent:Fire()
		end)
	end)
end

local TBIsHidden,CheckTB = false,function()
	return UserInputService:GetFocusedTextBox() ~= nil and gethiddengui and UserInputService:GetFocusedTextBox():IsDescendantOf(Folder) or 
		UserInputService:GetFocusedTextBox() ~= nil and gethui and gethui() ~= CoreGui and UserInputService.GetFocusedTextBox(UserInputService):IsDescendantOf(gethui()) 
end; do
	for i,v in pairs({Event,UserInputService.TextBoxFocused,UserInputService.TextBoxFocusReleased}) do
		v:Connect(function()
			TBIsHidden = CheckTB()
		end)
	end
end

do -- Mostly untouched code
	if getrawmetatable and setreadonly and newcclosure and Global and not Global.EXPRO_COREGUIPROTECTION_LOADED and (identifyexecutor and identifyexecutor():find("Synapse") or CheckWhitelist()) then
		local meta = getrawmetatable(game)
		local tostr = meta.__tostring
		setreadonly(meta, false)
		meta.__tostring = newcclosure(function(t)
			if coreGuiProtection[t] and not checkcaller() then
				if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
				return coreGuiProtection[t]
			end
			if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
			return tostr(t)
		end)
		setreadonly(meta, true)
		if Global then Global.EXPRO_COREGUIPROTECTION_LOADED = true end
	end

	local function RandomFloat(lower, greater)
		return lower + math.random() * (greater - lower);
	end

	if hookmetamethod and newcclosure and checkcaller and getnamecallmethod and hookfunction and (identifyexecutor and identifyexecutor():find("Synapse") or CheckWhitelist()) then
		local OldNameCall
		OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
			local NameCallMethod = getnamecallmethod()
			local Args = {...}
			if not checkcaller() and Self == stats and NameCallMethod == "GetMemoryUsageMbForTag" and MemoryUsageForGui >= 11 and Args[1] and (Args[1] == Enum.DeveloperMemoryTag.Gui or Args[1] == "Gui") then
				if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
				return MemoryUsageForGui - RandomFloat(3, 7)
			end
			if UserInputService ~= nil and Self == UserInputService and NameCallMethod == "GetFocusedTextBox" and TBIsHidden then -- GFTB Bypassing
				if identifyexecutor and not identifyexecutor():find("Synapse") and not identifyexecutor() == "ScriptWare" then setfenv(1, _ENV) end
				return nil
			end
			if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
			return OldNameCall(Self, ...)
		end))
	end

	if (hookfunction and newcclosure and identifyexecutor and identifyexecutor():find("Synapse")) or (hookfunction and newcclosure and CheckWhitelist()) then
		local OldFunction
		OldFunction = hookfunction(stats.GetMemoryUsageMbForTag, newcclosure(function(Self, ...)
			local Args = {...}
			if not checkcaller() and (Self == stats) == "Stats" and MemoryUsageForGui >= 11 and Args[1] and (Args[1] == Enum.DeveloperMemoryTag.Gui or Args[1] == "Gui") then
				if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
				return MemoryUsageForGui - RandomFloat(3, 7)
			end
			if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
			return OldFunction(Self, ...)
		end))
	end

	local InstanceCount = 0

	task.spawn(function()
		while cloneref(RunService).RenderStepped:Wait() do
			for i = 1, #Folder:GetDescendants() do
				InstanceCount = stats.InstanceCount - i
			end
		end
	end)

	if hookmetamethod and newcclosure and checkcaller and identifyexecutor and identifyexecutor():find("Synapse") or hookmetamethod and newcclosure and checkcaller and CheckWhitelist() then
		local OldIndex
		OldIndex = hookmetamethod(game, "__index", newcclosure(function(Self, Prop, ...)
			if not checkcaller() and Self == stats and Prop == "InstanceCount" then
				if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
				return InstanceCount
			end
			if not checkcaller() and Self == DebugSettings and Prop == "InstanceCount" then
				if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
				return InstanceCount
			end
			if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
			return OldIndex(Self, Prop, ...)
		end))
	end

	if getrenv and hookfunction and newcclosure and identifyexecutor and identifyexecutor():find("Synapse") or getrenv and hookfunction and newcclosure and CheckWhitelist() then
		local TableNumbaor001 = {}
		local SomethingOld;
		SomethingOld = hookfunction(getrenv().newproxy, newcclosure(function(...)
			local proxy = SomethingOld(...)
			table.insert(TableNumbaor001, proxy)
			if identifyexecutor and not identifyexecutor():find("Synapse") then setfenv(1, _ENV) end
			return proxy
		end))
		local RunService = cloneref(RunService)
		RunService.Stepped:Connect(function()
			for i, v in pairs(TableNumbaor001) do
				if v == nil then end
			end
		end)
	end
end

Folder.Parent = Check and gethui() or CoreGui

if Global then
	Global.gethiddengui =  gethiddengui
	Global.get_hidden_gui = gethiddengui
	Global.gethgui = gethiddengui
	Global.get_h_gui = gethiddengui
	if not Global.gethui then
		Global.gethui = gethiddengui
	end
end
