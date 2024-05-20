local LoadTick = tick()

-- [ Variables ] -- 

local Global = Global or getgenv and getgenv() or getrenv and getrenv() or getfenv and getfenv() or shared or _G

local _OG = {}; do
	_OG.readfile = readfileasync or readfile
	_OG.isfile = isfile or _OG.readfile and function(f) return pcall(function() _OG.readfile(f) end) end
	_OG.writefile = writefileasync or writefile
	_OG.decompile = decompile
	_OG.wait = wait
	_OG.getsynasset = getsynasset or getcustomasset
	_OG.printconsole = printconsole or print
end

local printconsole = printconsole or print
local request = (syn and syn.request) or (http and http.request) or (request) or (http_request) or (httprequest)
local getconnections = getconnections or get_connections or get_signal_cons
local setreadonly = setreadonly or make_readonly or makereadonly

local fwait = task.wait
local issyn = syn ~= nil
local Player,notify,Event,Settings,Part
local syng = syn or {}; 
local http = http or {};
local WindowFocused = true
local IsTeleporting = false

local FolderPath = "MarchAutoexec/"
local Link = "104 116 116 112 115 58 47 47 114 97 119 46 103 105 116 104 117 98 117 115 101 114 99 111 110 116 101 110 116 46 99 111 109 47 65 119 115 90 70 118 82 52 70 104 54 47 89 97 47 109 97 105 110 47"

local Sethiddenproperty; do -- sethiddenproperty compatability
	local shp = sethiddenproperty or set_hidden_property or sethiddenprop or setscriptable and function(loc,prop,val)
		if not loc then
			return true
		end 
		if not pcall(function() local a = loc[prop] end)  then
			setscriptable(loc,prop,true)
		end 
		loc[prop] = val
	end or function() end

	Sethiddenproperty = function(loc,prop,val) -- krnl has a broken sethiddenproperty
		return pcall(function()
			shp(loc,prop,val)
		end)
	end
end

local Gethiddenproperty; do -- gethiddenproperty compatability
	local shp = gethiddenproperty or get_hidden_property or gethiddenprop or get_hidden_prop or setscriptable and function(loc,prop)
		if not pcall(function() local a = loc[prop] end)  then
			setscriptable(loc,prop,true)
		end 
		return loc[prop]
	end or function() end

	Gethiddenproperty = function(loc,prop,val) -- krnl has a broken sethiddenproperty
		local Result; pcall(function()
			Result = shp(loc,prop,val)
		end) return Result
	end
end

local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local ChatService = game:GetService("Chat")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local HTTP = game:GetService("HttpService")
local NetworkClient = game:GetService("NetworkClient")
local Players = game:GetService("Players")

local ToggleKenzen

-- [ Functions ] -- 

local function RequestURL(URL,KeepActive)
	local Data,Temp; if request then 
		Data,Temp = request({Url = URL,Method = 'GET'}); Data = Data.Body
	else 
		Data,Temp = game:HttpGetAsync(URL)
	end
	return Data
end; 

local function SetGlobal(Name,Var)
	Global[Name] = Var
	if not Global[Name] then
		if getrenv then
			getrenv()[Name] = Var
		elseif getfenv then
			getfenv()[Name] = Var
		elseif shared then
			shared[Name] = Var
		elseif _G then
			_G[Name] = Var
		end
	end
end

local function SetAllGlobals(AllNames,Var)
	for i,v in pairs(AllNames) do
		SetGlobal(v,Var)
	end
end

local function ForceTableGlobal(MainTable,Name,Var)
	if setreadonly then
		setreadonly(MainTable,false)
		MainTable[Name] = Var
		setreadonly(MainTable,true)
	else
		pcall(function()
			MainTable[Name] = Var
		end)
	end
end

local function readfile(Name)
	return _OG.readfile(FolderPath .. Name)
end

local function isfile(Name)
	return _OG.isfile(FolderPath .. Name)
end

local function writefile(Name,Data)
	return _OG.writefile(FolderPath .. Name,Data)
end

local function getsynasset(Name)
	return _OG.getsynasset(FolderPath .. Name)
end

local function IsGameLoaded()
	if not game:IsLoaded("Workspace") then game.Loaded:Wait() end
end

local function GetLinkedAsset(Link)
	local Name = string.split(Link,"/"); Name = Name[#Name]
	local File
	if getsynasset and string.find(Name,".") then
		if not isfile(Name) then
			writefile(Name,RequestURL(Link))
		end
		File = getsynasset(Name)
	end
	return File
end; 

local function RoundNumber(number, decimalPlaces) if number and tonumber(number) then
		decimalPlaces = decimalPlaces or 4
		local Negative = math.abs(number) ~= number and -1 or 1; number = math.abs(number)
		local Return = tostring(math.round(tonumber(number) * 10^decimalPlaces) * 10^-decimalPlaces)
		return string.find(Return,".") and tonumber(string.sub(Return,1,string.find(Return,".")+decimalPlaces+1)) or tonumber(Return)
	end
end; 

local function GetToPath(From,Directory)
	for i,v in pairs(string.split(Directory,".")) do
		From = From:WaitForChild(v,5000)
	end return From
end

local function SaveSettings()
	local SettingsString = "return {"
	for i,v in pairs(Settings) do
		SettingsString ..= "\n\t" .. tostring(i) .. " = " .. tostring(v) .. ","
	end
	SettingsString ..= "\n}"
	writefile("settings.lua",SettingsString)
end

local function Decrypt(Text)
	local NewString = ""; do 
		for i,v in pairs(string.split(tostring(Text)," ")) do
			if tonumber(v) then
				NewString ..= string.char(tonumber(v))
			end
		end
	end; return NewString
end

local function GitLink(Name)
	return RequestURL(Link .. Name .. ".lua")
end

local function CheckFile(name)
	local Bool = isfile(name)
	if not Bool then
		writefile(name .. ".lua",GitLink(name))
	end
	return Bool
end

-- [ Code ] -- 

Link = Decrypt(Link)
CheckFile("commands")

Settings = loadstring(readfile("settings.lua"))()
Event = RunService.Heartbeat

if Settings.ExtraGlobals then
	do -- :: Compatibility Fixes
		local GlobalAlternates = {
			--// Meta Table Functions \--

			[{
				"get_raw_metatable","getmetatable",{debug,"getmetatable"},
			}] = debug.getmetatable or get_raw_metatable or getrawmetatable,
			[{
				"set_raw_metatable","setrawmetatable",{debug,"setmetatable"},
			}] = debug.setmetatable or set_raw_metatable or setrawmetatable,
			[{
				"iswriteable","writeable","is_writeable"
			}] = iswriteable or writeable or is_writeable,
			[{
				"setreadonly","makereadonly","make_readonly"
			}] = setreadonly,

			--// Mouse Inputs \--

			[{
				"mouse1release","syn_mouse1release","m1release","m1rel","mouse1up"
			}] = mouse1release or syn_mouse1release or m1release or m1rel or mouse1up,
			[{
				"mouse1press","m1press","mouse1click"
			}] = mouse1press or m1press or mouse1click,
			[{
				"mouse2release","syn_mouse2release","m2release","m1rel","mouse2up"
			}] = mouse2release or syn_mouse2release or m2release or m1rel or mouse2up,
			[{
				"mouse2press","mouse2press","m2press","mouse2click"
			}] = mouse2press or mouse2press or m2press or mouse2click,

			--// IO Functions \--

			[{
				"isfolder","syn_isfolder","is_folder"
			}] = isfolder or syn_isfolder or is_folder,
			[{
				"delfolder","syn_delsfolder","del_folder"
			}] = delfolder or syn_delsfolder or del_folder,
			[{
				"appendfile","syn_io_append","append_file"
			}] = appendfile or syn_io_append or append_file,
			[{
				"makefolder","make_folder","createfolder","create_folder"
			}] = makefolder or make_folder or createfolder or create_folder,
			[{
				"getsynasset","getcustomasset"
			}] = _OG.getsynasset,
			[{
				"write_clipboard","writeclipboard","setclipboard","set_clipboard",{syng,"write_clipboard"}
			}] = write_clipboard or writeclipboard or setclipboard or set_clipboard or syng.write_clipboard,

			--// Environment Manipulation Functions \--

			[{
				"hookfunction","hookfunc","detour_function"
			}] = hookfunction or hookfunc or detour_function,
			[{
				"hookmetamethod","hook_meta_method"
			}] = hookmetamethod or hook_meta_method,
			[{
				"islclosure","is_lclosure","isluaclosure"
			}] = islclosure or is_lclosure or isluaclosure,
			[{
				"iscclosure","is_cclosure"
			}] = iscclosure or is_cclosure,
			[{
				"newcclosure","new_cclosure"
			}] = newcclosure or new_cclosure,
			[{
				"clonereference","cloneref"
			}] = clonereference or cloneref or function(Inst) return Inst end,
			[{
				"getconnections","get_connections","get_signal_cons"
			}] = getconnections,
			[{
				"getnamecallmethod","get_namecall_method"
			}] = getnamecallmethod or get_namecall_method,
			[{
				"setnamecallmethod","set_namecall_method"
			}] = setnamecallmethod or set_namecall_method,
			[{
				"_G","shared","Global"
			}] = Global,
			[{
				"getgenv"
			}] = function() return Global end,
			[{
				"getfenv",{debug,"getfenv"}
			}] = debug.getfenv or getfenv,
			[{
				"setfflag"
			}] = setfflag or function(flag,bool) game:DefineFastFlag(flag,bool) end,
			[{
				"fire_signal","firesignal"
			}] = fire_signal or firesignal or getconnections and function(Signal)
				for i,v in pairs(getconnections(Signal)) do
					v:Fire()
				end
			end,

			--// Instance Functions \--

			[{
				"getnilinstances","get_nil_instances"
			}] = getnilinstances or get_nil_instances,
			[{
				"fireclickdetector","fire_click_detector"
			}] = fireclickdetector or fire_click_detector,
			[{
				"gethiddenproperty","gethiddenproperty","gethiddenprop","get_hidden_prop"
			}] = Gethiddenproperty,
			[{
				"sethiddenproperty","set_hidden_property","sethiddenprop"
			}] = Sethiddenproperty,
			[{
				"getrunningscripts","getscripts","get_running_scripts","get_scripts"
			}] = getrunningscripts or getscripts or get_running_scripts or get_scripts,

			--// Network Functions \--

			[{
				"setsimradius","set_simulation_radius","setsimulationradius"
			}] = setsimradius or set_simulation_radius or setsimulationradius,
			[{
				"getsimradius","get_simulation_radius","getsimulationradius"
			}] = getsimradius or get_simulation_radius or getsimulationradius,
			[{
				"isnetowner","isnetworkowner","is_network_owner"
			}] = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end,
			[{
				"request","http_request","httprequest",{syng,"request"},{http,"request"}
			}] = function(Table)
				if Table and typeof(Table) == "table" and Table.Method and Table.Method == "GET" then
					return RequestURL(Table.Url)
				else
					return request(Table)
				end
			end,

			--// Script Methods \--

			[{
				"getthreadcontext","get_thread_context","getthreadidentity","get_thread_identity"
			}] = getthreadcontext or get_thread_context or getthreadidentity or get_thread_identity,
			[{
				"setthreadcontext","set_thread_context","setthreadidentity","set_thread_identity"
			}] = setthreadcontext or set_thread_context or setthreadidentity or set_thread_identity,
			[{
				"getcallingscript","get_calling_script"
			}] = getcallingscript or get_calling_script,
			[{
				"KRNL_SAFE_CALL","securecall","secure_call",{syng,{"securecall"}}
			}] = KRNL_SAFE_CALL or securecall or secure_call or syng.securecall,

			--// Misc Functions \--

			[{
				"iswindowactive","isrbxactive"
			}] = iswindowactive or isrbxactive or WindowFocused,
			[{
				"queue_on_teleport","queueonteleport",{syng,"queue_on_teleport"}
			}] = queue_on_teleport or queueonteleport or syng.queue_on_teleport,
			[{
				{syng,"protect_gui"}
			}] = syng.protect_gui or function(GUI) return GUI end,
			[{
				{syng,"unprotect_gui"}
			}] = syng.unprotect_gui or function(GUI) return GUI end,
			[{
				{syng,"unprotect_gui"}
			}] = syng.unprotect_gui or function(GUI) return GUI end,
			[{
				"http"
			}] = http,
			[{
				"luau"
			}] = true,
			[{
				"printconsole"
			}] = printconsole,
			[{
				"gethui"
			}] = not issyn or gethui,
		}

		for Names,Value in pairs(GlobalAlternates) do
			for _,Name in pairs(Names) do
				if typeof(Name) == "table" then
					ForceTableGlobal(Name[1],Name[2],Value)
				else
					SetGlobal(Name,Value)
				end
			end
		end

		if getproperties then
			SetAllGlobals({"getproperties","get_properties"},getproperties or get_properties)
			SetAllGlobals({"gethiddenproperties","get_hidden_properties"},gethiddenproperties or get_hidden_properties)
		else
			task.defer(function()
				local Properties = {}
				local HiddenProperties = {}

				local Data = HTTP:JSONDecode(RequestURL("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/API-Dump.json"))
				local DataFix = {}
				for i,v in pairs(Data.Classes) do
					DataFix[v.Name] = v
				end

				for i,v in pairs(DataFix) do
					if not Properties[i] then Properties[i] = {Properties={},Superclass=v.Superclass} end
					if not HiddenProperties[i] then HiddenProperties[i] = {Properties={},Superclass=v.Superclass} end
					for _,v in pairs(v.Members) do
						if v.MemberType == "Property" then
							if v.Tags and table.find(v.Tags,"NotScriptable") then
								table.insert(HiddenProperties[i].Properties,v.Name)
							elseif v.Tags and table.find(v.Tags,"Hidden") and v.Security.Read ~= "None" then
								table.insert(HiddenProperties[i].Properties,v.Name)
							else
								table.insert(Properties[i].Properties,v.Name)
							end
						end
					end
					task.defer(function()
						local superclass = v.Superclass
						repeat 
							repeat fwait() until Properties[superclass]
							if Properties[superclass] then
								for index,v in pairs(Properties[superclass].Properties) do
									if not table.find(Properties[i].Properties,v) then
										table.insert(Properties[i].Properties,v)
									end
								end
								for index,v in pairs(HiddenProperties[superclass].Properties) do
									if not table.find(HiddenProperties[i].Properties,v) then
										table.insert(HiddenProperties[i].Properties,v)
									end
								end
							end
							superclass = Properties[superclass].Superclass
						until superclass == "<<<ROOT>>>"
					end)

					if not table.find(Properties[i].Properties,"Parent") then
						table.insert(Properties[i].Properties,"Parent")
					end
				end

				SetAllGlobals({"getproperties","get_properties"},function(Instance)
					local Table = {}
					for i,v in pairs(Properties[Instance.ClassName].Properties) do
						Table[v] = Instance[v]
					end
					return Table
				end) 
				SetAllGlobals({"gethiddenproperties","get_hidden_properties"},function(Instance)
					local Table = {}
					for i,v in pairs(HiddenProperties[Instance.ClassName].Properties) do
						Table[v] = Gethiddenproperty(Instance,v)
					end
					return Table
				end)
			end)
		end

		task.defer(function() -- :: gethiddengui
			loadstring(RequestURL("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/gethiddengui.lua"))() 
		end)
	end
	Global.GetFileFromURL = GetLinkedAsset
	Global.RoundNumber = RoundNumber
	Global.RequestURL = RequestURL

	Global.isproperty = function(Inst,Property)
		return pcall(function()
			return Gethiddenproperty and Gethiddenproperty(Inst,Property) and true or Inst[Property] and true
		end)
	end

	Global.RandomString = function(Amount)
		local nString = ""
		for _ = 1, Amount or math.random(5,20) do
			nString = string.upper(nString .. string.char(math.random(33, 126)))
		end
		return nString
	end; Global.nCreate = Global.RandomString

	Global.WaitForDescendant = function(Start,Name)
		local Find = Start:FindFirstChild(Name,true)
		local DescendantAdded = Start.DescendantAdded:Connect(function(New)
			if New.Name == Name then Find = New end
		end)
		repeat Find = Start:FindFirstChild(Name,true) fwait(0/1) until Find
		DescendantAdded:Disconnect()
		return Find
	end

	Global.WaitForChildOfClass = function(Start,Class)
		local Find = Start:FindFirstChildOfClass(Class)
		if Find then return Find
		else
			local Table = {}
			local ChildAdded
			ChildAdded = Start.ChildAdded:Connect(function(v)
				if v:IsA(Class) and not table.find(Table,v) then Find = v else table.insert(Table,v) end
			end)
			for i,v in pairs(Start:GetChildren()) do
				if v:IsA(Class) then Find = v else table.insert(Table,v) end
			end
			repeat Start.ChildAdded:Wait() until Find; ChildAdded:Disconnect() return Find
		end

	end

	Global.WaitForDescendantOfClass = function(Start,Class)
		local Find = Start:FindFirstChildOfClass(Class,true)
		if Find then return Find
		else
			local Table = {}
			local DescendantAdded
			DescendantAdded = Start.DescendantAdded:Connect(function(v)
				if v:IsA(Class) and not table.find(Table,v) then Find = v else table.insert(Table,v) end
			end)
			for i,v in pairs(Start:GetDescendants()) do
				if v:IsA(Class) then Find = v else table.insert(Table,v) end
			end
			repeat Start.DescendantAdded:Wait() until Find; DescendantAdded:Disconnect() return Find
		end
	end

	do -- :: fwait and pwait
		local Bind = Instance.new("BindableEvent")
		local PingBind = Instance.new("BindableEvent")
		local PingVal,PingVal2 = 0,0
		local Ping; task.spawn(function() Ping = GetToPath(game:GetService("Stats"),"Network.ServerStatsItem.Data Ping") PingVal = Ping:GetValue()/1000 end)
		local VarTick = tick()

		local function Fire()
			Bind:Fire(tick()-VarTick)
			VarTick = tick()

			local GetValue = Ping and Ping:GetValue()
			if GetValue and GetValue ~= PingVal then
				PingVal = GetValue
				PingBind:Fire(PingVal/1000)
			end

			repeat fwait(0/1) until Player or Players.LocalPlayer
			local GetNetworkPing = Player and Player:GetNetworkPing() or Players.LocalPlayer and Players.LocalPlayer:GetNetworkPing()
			if GetNetworkPing and GetNetworkPing ~= PingVal2 then
				PingVal2 = GetNetworkPing
				PingBind:Fire(PingVal2)
			end
		end

		for i,v in ipairs({"RenderStepped","PreAnimation","Stepped","Heartbeat","PostSimulation","PreSimulation","PreRender"}) do
			RunService[v]:Connect(Fire)
		end;

		local function FastWait(Num)
			if Num and Num > 0 then
				local Tick = 0
				repeat
					Tick += Bind.Event:Wait()
				until Tick >= Num
				return Tick

			else
				return Bind.Event:Wait()
			end
		end
		local function PingWait()
			return PingBind.Event:Wait()
		end

		fwait = FastWait
		Global.fwait = FastWait
		Global.Event = Bind.Event

		Global.pwait = PingWait
		Global.pEvent = PingBind.Event

		Event = Bind.Event
	end

	Global.decompile = function(script)
		return "--  Advanced Decompiler by ProductionTakeOne#3330 \n" .. string.gsub(string.gsub(_OG.decompile(script),"l__",""),"__1","")
	end

	task.defer(function() -- :: ServerInfo
		local peer,replicator = NetworkClient.ConnectionAccepted:Wait()
		local data = HTTP:JSONDecode(RequestURL("http://ip-api.com/json/" .. peer:sub(1, peer:find("|")-1)))
		local ServerInfo = {
			Country = data.country,
			CountryCode = data.countrycode,
			State = data.regionName,
			StateCode = data.region,
			City = data.city,
			ZIP = data.zip,
			Latitude = data.lat,
			Longitude = data.lon,
			TimeZone = data.timezone,
			IP = data.query,
		}

		Global.ServerInfo = ServerInfo

		repeat fwait(0/1) until notify
		if notify ~= "Disabled" then
			Global.Notify = notify
			notify({
				Text = "Connected to " .. ServerInfo.State .. ", " .. ServerInfo.City .. " in " .. ServerInfo.Country,
				Duration = 10
			})
		end
	end)

	Global.wait = function(Time)
		if Time then
			return fwait(Time)
		else
			return fwait(1/30)
		end
	end

	Global.syn = syng
end

if Settings.KickGui then
	task.defer(function()
		GetToPath(CoreGui,"RobloxPromptGui.promptOverlay").ChildAdded:Connect(function(v)
			if v.Name == "ErrorPrompt" then
				if Settings.RejoinOnKick then
					if #Players:GetPlayers() <= 1 then
						TeleportService:Teleport(game.PlaceId, Player or Players.LocalPlayer)
					else
						TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Player or Players.LocalPlayer)
					end
				end

				GuiService:ClearError()
				local ErrorText = v:FindFirstChild("ErrorMessage",true)
				v.Visible = false
				local VideoFrame = Instance.new("VideoFrame"); do
					VideoFrame.AnchorPoint = Vector2.new(0.5,1)
					VideoFrame.BackgroundTransparency = 1
					VideoFrame.Position = UDim2.new(0.5,0,0.8,0)
					VideoFrame.Size = UDim2.new(0,450,0,225)
					VideoFrame.ZIndex = 999999998
					VideoFrame.Looped = true
					VideoFrame.Video = GetLinkedAsset("https://cdn.discordapp.com/attachments/806623634038325318/957076752843280424/one-piece-vinsmoke-sanji.webm") or "rbxassetid://5670785995"
					VideoFrame:Play()
					VideoFrame.Parent = CoreGui.RobloxPromptGui
				end
				local TextLabel = Instance.new("TextLabel"); do
					TextLabel.AnchorPoint = Vector2.new(0.5,0)
					TextLabel.BackgroundTransparency = 1
					TextLabel.Position = UDim2.new(0.5,0,1,0)
					TextLabel.Size = UDim2.new(1,0,0.3,0)
					TextLabel.ZIndex = 999999998
					TextLabel.Font = Enum.Font.Gotham
					TextLabel.TextSize = 20
					TextLabel.Text = ErrorText.Text
					TextLabel.TextColor3 = Color3.new(1,1,1)
					TextLabel.TextStrokeTransparency = 0
					TextLabel.Parent = VideoFrame
					ErrorText.Changed:Connect(function()
						TextLabel.Text = ErrorText.Text
					end)
				end
				local TextButton = Instance.new("TextButton"); do
					TextButton.AnchorPoint = Vector2.new(0,0)
					TextButton.Size = UDim2.new(1,0,1,0)
					TextButton.ZIndex = 999999999
					TextButton.Text = ""
					TextButton.Transparency = 1
					TextButton.Parent = VideoFrame
					TextButton.Activated:Connect(function()
						VideoFrame:Destroy()
					end)
				end
				RunService:SetRobloxGuiFocused(false)
				repeat GuiService:ClearError() fwait(0/1) until not VideoFrame
			end
		end)
	end)
end

if Settings.FastLoad then
	task.defer(function()
		local Properties = {}
		local function LockProperty(Inst,Property,Value)
			Inst[Property] = Value
			if not Properties[Inst] then
				Properties[Inst] = {}
				Inst.Changed:Connect(function(ChangedProp)
					if Properties[Inst][ChangedProp] then
						Inst[ChangedProp] = Properties[Inst][ChangedProp]
					end
				end)
			end
			Properties[Inst][Property] = Value
			Inst[Property] = Value
		end


		local RobloxLoadingGui = GetToPath(CoreGui,"RobloxLoadingGUI")

		GetToPath(RobloxLoadingGui,"BackgroundScreen").Enabled = false
		RunService:SetRobloxGuiFocused(false)

		local InfoFrame = GetToPath(RobloxLoadingGui,"MainScreen.DarkGradient.InfoFrame")
		LockProperty(InfoFrame,"BackgroundTransparency",1)
		LockProperty(InfoFrame,"AnchorPoint",Vector2.new(0,1))
		LockProperty(InfoFrame,"Position",UDim2.fromScale(0,1))

		local IconFrame = GetToPath(InfoFrame,"IconFrame")
		LockProperty(IconFrame,"AnchorPoint",Vector2.new(0,1))
		LockProperty(IconFrame,"Position",UDim2.fromScale(0,1))

		local TextLayout = GetToPath(InfoFrame,"TextLayout")

		task.defer(function()
			TextLayout.ChildAdded:Connect(function(v)
				if v:IsA("UIListLayout") or v:IsA("UIPadding") then
					v:Destroy()
				end
			end)
			GetToPath(TextLayout,"UIListLayout"):Destroy()
			GetToPath(TextLayout,"Padding"):Destroy()
		end)

		LockProperty(TextLayout,"AnchorPoint",Vector2.new(0,1))
		LockProperty(TextLayout,"Position",UDim2.new(0,IconFrame.Size.X.Offset*1.75,1,0)) -- IconFrame.Size.X.Offset+5

		local CreatorLabel = GetToPath(TextLayout,"CreatorLabel")
		LockProperty(CreatorLabel,"AnchorPoint",Vector2.new(0,1))
		LockProperty(CreatorLabel,"Position",UDim2.new(0,0,1,20))
		LockProperty(CreatorLabel,"Size",UDim2.new(0.6,0,0,20))
		LockProperty(CreatorLabel,"AutomaticSize",Enum.AutomaticSize.None)
		LockProperty(CreatorLabel,"TextXAlignment",Enum.TextXAlignment.Left)

		local PlaceLabel = GetToPath(TextLayout,"PlaceLabel")
		LockProperty(PlaceLabel,"AnchorPoint",Vector2.new(0,0))
		LockProperty(PlaceLabel,"Position",UDim2.new(0,0,0,0))
		LockProperty(PlaceLabel,"Size",UDim2.new(0.8,0,0,90))
		LockProperty(PlaceLabel,"AutomaticSize",Enum.AutomaticSize.None)
		LockProperty(PlaceLabel,"TextYAlignment",Enum.TextYAlignment.Bottom)
		LockProperty(PlaceLabel,"TextXAlignment",Enum.TextXAlignment.Left)

		local ServerFrame = GetToPath(RobloxLoadingGui,"MainScreen.DarkGradient.ServerFrame")
		LockProperty(ServerFrame,"AnchorPoint",Vector2.new(0.5,0))
		LockProperty(ServerFrame,"Position",UDim2.new(0.5,0,0,0))

		local JoinText = GetToPath(ServerFrame,"JoinText")
		LockProperty(JoinText,"Position",UDim2.new(0,0,0,0))
	end)
	Part = Instance.new("Part"); do
		Part.Size = Vector3.new(5,1,5)
		Part.CFrame = CFrame.Angles(0,math.rad(-90),0)--CFrame.new(Vector3.new(),workspace.CurrentCamera.CFrame.Position)
		Part.Transparency = 1
		Part.Parent = workspace
	end
	local Surface = Instance.new("SurfaceGui"); do
		Surface.Face = Enum.NormalId.Top
		Surface.Parent = Part
	end
	local Image = Instance.new("ImageLabel"); do
		Image.Size = UDim2.new(1,0,1,0)
		Image.BackgroundTransparency = 1
		Image.Image = GetLinkedAsset("https://cdn.discordapp.com/attachments/806690952089305158/954924304238260284/FN_nKHuUcAAY8H4.png") or "rbxassetid://9184481698"
		Image.Parent = Surface
	end
end

if Settings.DisablePrompts then
	task.defer(function()
		GetToPath(CoreGui,"PurchasePrompt.ProductPurchaseContainer").Visible = false
		for i,v in pairs(GetToPath(CoreGui,"TopBarApp.TopBarFrame.LeftFrame"):GetChildren()) do
			if v.Name == "Button" and v:FindFirstChild("Button",true) then
				v.Visible = false
			end
		end
	end)
end

if Settings.ToggleGUI then
	-- :: Variables

	local Background,ConsoleScroll,ConsoleExample,SettingsScroll,SettingsExample,CommandsFrame,CommandsScroll,CommandBar,Commands,Visible,Token,OutfitsUI,OutfitList

	local VcVerified = {{},{}}

	local PathfindingService = game:GetService("PathfindingService")
	local TweenService = game:GetService("TweenService")
	local HTTP = game:GetService("HttpService")
	local TextService = game:GetService("TextService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local Ping; task.defer(function()
		Ping = GetToPath(game:GetService("Stats"),"Network.ServerStatsItem.Data Ping")
	end)

	local noclipping,Flying,Toggle,BackgroundToggle = false,false,false,false
	local ChatRemote; task.defer(function()
		ChatRemote = GetToPath(ReplicatedStorage,"DefaultChatSystemChatEvents.SayMessageRequest")
	end)

	local EventStorage = {}

	printconsole = function(...)
		local NewString = ""
		local Packed = table.pack(...)
		for i,v in pairs(Packed) do
			if tonumber(i) then
				NewString ..= " " .. tostring(v)
			end
		end

		local NewPrint = ConsoleExample:Clone(); do
			NewPrint.Text = NewString
			NewPrint.Size = UDim2.new(0,383,0,TextService:GetTextSize(NewString,12,Enum.Font.Ubuntu,Vector2.new(383,math.huge)).Y)
			NewPrint.Parent = ConsoleScroll
		end
	end; 

	local function colorprintconsole(Color,...)
		local NewString = ""
		local Packed = table.pack(...)
		for i,v in pairs(Packed) do
			if tonumber(i) then
				NewString ..= " " .. tostring(v)
			end
		end

		local NewPrint = ConsoleExample:Clone(); do
			NewPrint.Text = NewString
			NewPrint.TextColor3 = Color
			NewPrint.Size = UDim2.new(0,383,0,TextService:GetTextSize(NewString,12,Enum.Font.Ubuntu,Vector2.new(383,math.huge)).Y)
			NewPrint.Parent = ConsoleScroll
		end
	end

	local ShortName = function(Name,IncludeLocal)
		local Users = {}; local Names = string.split(Name,",")
		for _,v in pairs(Names) do
			for _,plr in pairs(Players:GetPlayers()) do
				if IncludeLocal and string.sub(string.lower(plr.Name),1,#v) == string.lower(v) or 
					plr ~= Player and string.sub(string.lower(plr.Name),1,#v) == string.lower(v) or 
					IncludeLocal and string.sub(string.lower(plr.DisplayName),1,#v) == string.lower(v) or 
					plr ~= Player and string.sub(string.lower(plr.DisplayName),1,#v) == string.lower(v) then
					table.insert(Users,plr)
				end
			end
		end
		return Users[1] and Users or nil
	end

	local PredictPos = function(Pos1, Velocity1, Pos2, Velocity2, _Pos3, TOAOff, DISTOff)
		local DIST = (Pos1 - (_Pos3 or Pos2)).Magnitude + (DISTOff or 0)
		local TOA = (DIST / Velocity1.Magnitude) + (TOAOff or 0)
		local POS = Pos2 + (Velocity2 * TOA)
		return POS
	end

	local ClearConnections = function(Folder)
		if EventStorage[Folder] then
			for i,v in pairs(EventStorage[Folder]) do
				v:Disconnect()
			end
		end; EventStorage[Folder] = {}
	end

	local GetPing = function(Divider) Divider = Divider or 1000
		return Ping:GetValue()/Divider
	end

	local AttachToPlayer = function(ToPlr,Offset,Prediction)
		local function FixYAxis(Velocity)
			return Vector3.new(Velocity.X,Velocity.Y/3.5,Velocity.Z)
		end
		ClearConnections("Attachments")

		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
			local BodyVelocity = Instance.new("BodyVelocity"); do
				BodyVelocity.MaxForce = Vector3.new(1,1,1) * math.huge; 
				BodyVelocity.P = math.huge; 
				BodyVelocity.Velocity = Vector3.new()
				BodyVelocity.Parent = Player.Character.HumanoidRootPart;
			end

			local BodyAngularVelocity = Instance.new("BodyAngularVelocity"); do
				BodyAngularVelocity.MaxTorque = Vector3.new(1,1,1) * math.huge;
				BodyAngularVelocity.P = math.huge; 
				BodyAngularVelocity.AngularVelocity = Vector3.new(0,0,0)
				BodyAngularVelocity.Parent = Player.Character.HumanoidRootPart
			end
		end

		table.insert(EventStorage["Attachments"],Event:Connect(function()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and ToPlr and ToPlr.Parent and ToPlr.Character and ToPlr.Character:FindFirstChild("HumanoidRootPart") then
				local Positioning = Prediction and CFrame.new(PredictPos(Player.Character.HumanoidRootPart.Position, 
					Vector3.new(math.huge, 0, 0), 
					ToPlr.Character.HumanoidRootPart.Position, 
					FixYAxis(ToPlr.Character.HumanoidRootPart.Velocity), 
					nil, 
					.4+GetPing(1000))) * (ToPlr.Character.HumanoidRootPart.CFrame-ToPlr.Character.HumanoidRootPart.Position) * Offset or ToPlr.Character.HumanoidRootPart.CFrame * Offset
				Player.Character.HumanoidRootPart.CFrame = Positioning
			end
		end))

		Player.CharacterAdded:Connect(function()
			ClearConnections("Attachments")
		end)
	end

	local Loadstring = function(Link,NoHTTP,ChunkName)
		if loadstring then
			return loadstring(NoHTTP and Link or RequestURL(Link,true),ChunkName)()
		end
	end

	local GetAuthentication = function()
		local cookie = _OG.readfile("cookie.txt")
		local authRes = request({
			Url = "https://www.roblox.com/authentication/signoutfromallsessionsandreauthenticate",
			Method = "POST",
			Headers = {
				["content-type"] = "application/json",
				["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/0.0.305 Chrome/69.0.3497.128 Electron/4.0.8 Safari/537.36",
				["cookie"] = cookie,
			}
		});
		if authRes.Success then
			return authRes.Headers["x-csrf-token"];
		end;
		local authRes2 = request({
			Url = "https://auth.roblox.com/v1/account/pin",
			Method = "GET",
			Headers = {
				["content-type"] = "application/json",
				["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) discord/0.0.305 Chrome/69.0.3497.128 Electron/4.0.8 Safari/537.36",
				["cookie"] = cookie,
				["X-CSRF-TOKEN"] = authRes.Headers["x-csrf-token"]
			}
		});
		if authRes2.Success then
			Token = authRes.Headers["x-csrf-token"]; task.delay(600,function() 
				Token = nil	
			end)
			--return 
		else
			printconsole("Incorrect Cookie","Your cookie invalid")
		end
	end

	local PreventSleeping = function(Part) 
		ClearConnections("SleepEvent")
		local SleepEvent = Event:Connect(function()
			Sethiddenproperty(Part, "NetworkIsSleeping", false)
		end); table.insert(EventStorage["SleepEvent"],SleepEvent)

		Part.AncestryChanged:Connect(function()
			if not Part or not Part.Parent then
				ClearConnections("SleepEvent")
			end
		end)

		return SleepEvent
	end

	local CheckForRCD = function() 
		return not Gethiddenproperty and true or Gethiddenproperty(workspace,"RejectCharacterDeletions") == Enum.RejectCharacterDeletions.Enabled
	end

	local function Drag(DragFrame,ToDrag)
		local dragToggle,dragInput,dragStart,startPos
		local dragSpeed = 0
		local function updateInput(input)
			local Delta = input.Position - dragStart
			ToDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		end
		DragFrame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UserInputService:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = ToDrag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)	
			end
		end)
		DragFrame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end

	local function InvokeRobloxApi(Link,Body)
		if _OG.isfile("cookie.txt") then
			if not Token then GetAuthentication() end
			if Token then
				local Response = request({
					Url = Link,
					Method = "POST",
					Headers = {
						["cookie"] = _OG.readfile("cookie.txt"),
						["Content-Type"] = "application/json",
						["x-csrf-token"] = Token,
						["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0"
					},
					Body = HTTP:JSONEncode(Body)
				})
				if not Response.Success then
					--Notify("Attempted to change to r6","Response code" .. Response.StatusCode)
					printconsole(Response.StatusMessage,"StatusCode: " .. Response.StatusCode .. " | " .. Token)
				end
				return Response
			else
				printconsole("Invalid Token?",Token)
			end
		else
			printconsole("No Cookie","You have not added your cookie, please use the savecookie command.")
		end
	end

	Commands = {
		["print"] = {
			Args = {"Text"},
			Alias = {},
			Function = function(Args)
				local String = ""
				for i,v in pairs(Args) do
					String ..= " " .. v
				end
				print(String)
			end,
		},
		["loadstring"] = {
			Args = {"Script"},
			Alias = {"s","execute"},
			Function = function(Args)
				local String = ""
				for i,v in pairs(Args) do
					String ..= " " .. v
				end
				Loadstring(String,true)
			end,
		},
		["commands"] = {
			Args = {},
			Alias = {"cmds","help"},
			Function = function()
				CommandsFrame.Visible = true; CommandsFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
			end,
		},

		["respawn"] = {
			Args = {"doreset"},
			Alias = {"gr"},
			Function = function(Args)
				local DoReset = Args[1] and string.lower(Args[1]) or nil
				if Visible then
					Visible(); Visible = nil
				end
				if game.PlaceId == 7115420363 then ReplicatedStorage:WaitForChild("Respawn"):FireServer()
				elseif game.PlaceId == 6708206173 then ReplicatedStorage:WaitForChild("RequestRespawn"):FireServer()
				elseif game.PlaceId == 7143319086 then Player:WaitForChild("Respawn"):FireServer()
				elseif game.PlaceId == 9307193325 or game.PlaceId == 5100950559 then
					local ChatBar = GetToPath(Player,"PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar")
					local Text = ChatBar.Text
					ChatBar:SetTextFromInput("-gr")
					Players:Chat("-gr")
					ChatBar:SetTextFromInput(Text)
				elseif DoReset == "true" or DoReset == "doreset" or DoReset == "reset" or DoReset == "die" or DoReset == "yes" then
					Player.Character:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Dead, true)
					Player.Character.Humanoid:TakeDamage(9e9 + 9e9 + 9e9 + 9e9); Player.Character.Humanoid.Health = 0
					if firesignal then firesignal(Player.Character.Humanoid.Died) end
				elseif CheckForRCD() then
					local CameraType = workspace.CurrentCamera.CameraType
					workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed

					Player.Character:PivotTo(CFrame.new(0,workspace.FallenPartsDestroyHeight+0.1,0))
					task.defer(function()
						fwait(GetPing(850))
						Player.Character:WaitForChild("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Dead, true)
						Player.Character.Humanoid:TakeDamage(9e9 + 9e9 + 9e9 + 9e9); Player.Character.Humanoid.Health = 0
						if firesignal then firesignal(Player.Character.Humanoid.Died) end
					end)

					Player.CharacterAdded:Wait()
					workspace.CurrentCamera.CameraType = CameraType
				elseif Player.Character:FindFirstChild(Player.Name) then
					Player.Character.Head:Destroy()
				else
					local char = Player.Character
					if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
					char:ClearAllChildren()
					local newChar = Instance.new("Model")
					newChar.Parent = workspace
					Player.Character = newChar
					Player.Character = char
					newChar:Destroy()
				end
			end,
		},

		["refresh"] = {
			Args = {"doreset"},
			Alias = {"re","unbang"},
			Function = function(Args)
				local CameraPos = workspace.CurrentCamera and workspace.CurrentCamera.CFrame

				local PreviousPosition = Player and Player.Character; if PreviousPosition then
					PreviousPosition = PreviousPosition:FindFirstChild("HumanoidRootPart") or PreviousPosition:FindFirstChild("Head") or PreviousPosition:FindFirstChildOfClass("BasePart")
					if PreviousPosition then PreviousPosition = PreviousPosition.CFrame end
				end

				Commands["respawn"].Function(Args)

				Player.CharacterAdded:Wait()

				Player.Character:WaitForChild("HumanoidRootPart").CFrame = PreviousPosition

				RunService.RenderStepped:Wait()
				workspace.CurrentCamera.CFrame = CameraPos
			end,
		},

		["hydroxide"] = {
			Args = {},
			Alias = {"remotespy","rspy","spy"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/init.lua",false,'init.lua')
				Loadstring("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ui/main.lua",false,'ui/main.lua')
			end,
		},
		["fatesadmin"] = {
			Args = {},
			Alias = {"fate"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua")
			end,
		},
		["cmdx"] = {
			Args = {},
			Alias = {"cmdxadmin"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source")
			end,
		},
		["backdoorchecker"] = {
			Args = {},
			Alias = {"bdc","bchecker"},
			Function = function()
				Loadstring('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua')
			end,
		},
		["animstealer"] = {
			Args = {},
			Alias = {"animgrabber"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimationStealer.lua")
			end,
		},
		["aimlock"] = {
			Args = {},
			Alias = {},
			Function = function()
				Loadstring("https://pastebin.com/raw/Zz5yB0D1")
			end,
		},
		["antitp"] = {
			Args = {},
			Alias = {"notp"},
			Function = function()
				local humroot = Player.Character:FindFirstChild("HumanoidRootPart"); if humroot then
					local prevpos = humroot.CFrame
					while humroot and humroot.Parent do
						if (humroot.Position - prevpos.Position).Magnitude < -2 or (humroot.Position - prevpos.Position).Magnitude > 2 then
							humroot.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
							humroot.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
							humroot.CFrame = prevpos
						end
						prevpos = humroot.CFrame
						fwait()
					end
				end
			end,
		},
		["antitool"] = {
			Args = {},
			Alias = {"notk","antitk","antiattach"},
			Function = function()
				Player.Character.ChildAdded:Connect(function(Tool)
					if Tool:IsA("Tool") and Tool:FindFirstChild("Handle") then
						for i,v in pairs(Tool.Handle:GetJoints()) do
							if v and v.Parent and v.Parent.Parent and v.Parent.Parent ~= Player.Character and Players:GetPlayerFromCharacter(v.Parent.Parent) then
								Player.Character.DescendantAdded:Wait() -- waits for the grip
								Tool.Parent = Player.Backpack
							end
						end
					end
				end)
			end,
		},
		["antipredict"] = {
			Args = {"yaxis"},
			Alias = {"velocityspoof","cleanfling2"},
			Function = function(Args)
				local HumanoidRootPart = Player.Character.HumanoidRootPart
				local Velocity = Vector3.new(-2^14,Args[1] and tonumber(Args[1]) or -2^14,-2^14)
				PreventSleeping(HumanoidRootPart)
				while HumanoidRootPart and HumanoidRootPart.Parent do
					RunService.PostSimulation:Wait()
					local RootVelocity = HumanoidRootPart.Velocity
					HumanoidRootPart.Velocity = Velocity
					RunService.PreRender:Wait()
					HumanoidRootPart.Velocity = RootVelocity
				end; 
			end,
		},

		["antibang"] = {
			Args = {},
			Alias = {"antiheadsit"},
			Function = function()
				local Height = workspace.FallenPartsDestroyHeight - 50
				workspace.FallenPartsDestroyHeight = Height - 100
				local HumanoidRootPart = Player.Character.HumanoidRootPart
				local Camera = workspace.CurrentCamera
				PreventSleeping(HumanoidRootPart)
				while HumanoidRootPart and HumanoidRootPart.Parent do
					local If = false
					for i,v in pairs(Players:GetPlayers()) do
						if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position-HumanoidRootPart.Position).Magnitude <= 5 then
							if v.Character:FindFirstChildOfClass("Humanoid").Sit == true then
								If = true
							else
								for _,Track in pairs(v.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
									if Track.Speed >= 2.9 then
										If = true
									end
								end
							end
						end
					end
					if If then
						local RootCFrame = HumanoidRootPart.CFrame
						local Cam = Camera.CFrame
						HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position.X,Height,HumanoidRootPart.Position.Z)--CFrame
						Camera.CFrame = Cam
						RunService.PreRender:Wait()
						HumanoidRootPart.CFrame = RootCFrame
						Camera.CFrame = Cam
						task.wait(Player:GetNetworkPing()*4)
					else
						fwait()
					end
				end; 
			end,
		},
		["antifling"] = {
			Args = {},
			Alias = {"physicsantifling"},
			Function = function()
				--Loadstring("https://raw.githubusercontent.com/L8X/phys/main/antifling.lua")
				local Character = Player.Character
				local Terrain = workspace:FindFirstChildOfClass("Terrain") or workspace:FindFirstAncestorOfClass("Part",true) or workspace:GetChildren()[1]

				local function CreateConstraint(Part1,Part2,Parent)
					local Constraint = Instance.new("NoCollisionConstraint"); do
						Constraint.Part0 = Part1
						Constraint.Part1 = Part2
						Constraint.Parent = Parent
					end

					Part1.AncestryChanged:Connect(function()
						if not Part1:IsDescendantOf(workspace) and Constraint and Constraint.Parent then
							Constraint:Destroy()
						end
					end)
					Part2.AncestryChanged:Connect(function()
						if not Part2:IsDescendantOf(workspace) and Constraint and Constraint.Parent then
							Constraint:Destroy()
						end
					end)
				end

				local function NoCollision(OtherCharacter)
					local NewFolder = Instance.new("Folder"); do
						NewFolder.Name = OtherCharacter.Name
					end
					OtherCharacter.DescendantAdded:Connect(function(v)
						if v:IsA("BasePart") then
							for _,vv in pairs(Character:GetDescendants()) do
								if vv:IsA("BasePart") then
									CreateConstraint(v,vv,NewFolder)
								end
							end
						end
					end)
					for i,v in pairs(OtherCharacter:GetDescendants()) do
						if v:IsA("BasePart") then
							for _,vv in pairs(Character:GetDescendants()) do
								if vv:IsA("BasePart") then
									CreateConstraint(v,vv,NewFolder)
								end
							end
						end
					end
					NewFolder.Parent = Terrain
				end

				local function AddPlayer(OtherPlayer)
					if OtherPlayer ~= Player then
						OtherPlayer.CharacterAdded:Connect(NoCollision)
						if OtherPlayer.Character then NoCollision(OtherPlayer.Character) end
					end
				end

				Players.PlayerAdded:Connect(AddPlayer)
				for i,v in pairs(Players:GetPlayers()) do AddPlayer(v) end
			end,
		},
		["antifling2"] = {
			Args = {},
			Alias = {"nophysicsantifling"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/NonPhysicsServiceAntiFling.lua")
			end,
		},
		["explorer"] = {
			Args = {},
			Alias = {"betterdex","newdex"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/wally-rblx/awesome-explorer/main/source.lua")
			end,
		},
		["dex"] = {
			Args = {},
			Alias = {"exprodex"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/L8X/ExProDex-V2/main/src.lua")
			end,
		},
		["dexv4"] = {
			Args = {},
			Alias = {"upgradeddex"},
			Function = function()
				Loadstring("https://pastebin.com/raw/fPP8bZ8Z")
			end,
		},
		["iy"] = {
			Args = {},
			Alias = {},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
			end,
		},
		["owlhub"] = {
			Args = {},
			Alias = {},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua")
			end,
		},
		["boomboxhub"] = {
			Args = {},
			Alias = {"boombox"},
			Function = function()
				Loadstring('https://riptxde.dev/u/hub/script.lua')
			end,
		},
		["serverhop"] = {
			Args = {"type"},
			Alias = {"hopserver"},
			Function = function(Args)
				local ServerList = HTTP:JSONDecode(RequestURL("https://games.roblox.com/v1/games/".. game.PlaceId.. "/servers/Public?sortOrder=Asc&limit=100"))
				local Type = "Random"

				if Args[1] then
					if table.find({"small","smallest","lowest","low","bottom","s"},string.lower(Args[1])) then
						Type = "Smallest"
					elseif table.find({"large","largestest","highest","high","top","l"},string.lower(Args[1])) then
						Type = "Largest"
					end
				end; printconsole("Attempting to serverhop","Type: " .. Type)

				local NotFull = {}

				for i,v in pairs(ServerList.data) do
					if v.id ~= game.JobId and v.playing < v.maxPlayers-1 then
						table.insert(NotFull,{v.id,v.playing})
					end
				end

				local PlayerCount,ServerJobId = Type == "Smallest" and 100 or 0,nil

				for i,v in pairs(NotFull) do
					if Type == "Smallest" and v[2] < PlayerCount or Type == "Largest" and v[2] > PlayerCount then
						PlayerCount = v[2]
						ServerJobId = v[1]
					else
						ServerJobId = NotFull[math.random(1,#NotFull)][1]
					end
				end

				IsTeleporting = true
				if ServerJobId then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerJobId)
				end
			end,
		},
		["reanimate"] = {
			Args = {},
			Alias = {"netless"},
			Function = function()
				Loadstring("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/ZendeyReanimate.lua")
			end,
		},
		["tooldances"] = {
			Args = {},
			Alias = {"toolemotes","emotes","emote"},
			Function = function()
				if CheckForRCD() then
					return -- game is patched
				end

				Global.ToolDancesSettings = {
					Preload = false,
					PreloadWait = true,
					Reanimate = true,
					R15 = false,
				}
				Loadstring("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/toolanimations.lua")
			end,
		},
		["r15tooldances"] = {
			Args = {},
			Alias = {"r15toolemotes","r15emotes","r15emote"},
			Function = function()
				if CheckForRCD() then
					return -- game is patched
				end

				Global.ToolDancesSettings = {
					Preload = false,
					PreloadWait = true,
					Reanimate = true,
					R15 = true,
				}
				Loadstring("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/toolanimations.lua")
			end,
		},
		["f3x"] = {
			Args = {},
			Alias = {"btools"},
			Function = function()
				Loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source,true)
			end,
		},
		["copypos"] = {
			Args = {},
			Alias = {"copylocation"},
			Function = function()
				local Root = Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.PrimaryPart or Player.Character:FindFirstChild("Head") or Player.Character:FindFirstChildOfClass("BasePart")
				if Root then setclipboard(RoundNumber(Root.Position.X) .. ", " .. RoundNumber(Root.Position.Y) .. ", " .. RoundNumber(Root.Position.Z)) end
				printconsole("Copied position","Copied your .Position to your clipboard.")
			end,
		},
		["antikorblox"] = {
			Args = {},
			Alias = {"removekorblox"},
			Function = function()
				Player.CharacterAdded:Connect(function(Character)
					if Player.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
						Player.Character:WaitForChild("Korblox Deathspeaker Right Leg"):Destroy()
					else
						printconsole("R6 Needed","You cannot remove korblox on R15")
					end
				end)
				if Player.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
					Player.Character:WaitForChild("Korblox Deathspeaker Right Leg"):Destroy()
				else
					printconsole("R6 Needed","You cannot remove korblox on R15")
				end
			end,
		},
		["savecookie"] = {
			Args = {"cookie"},
			Alias = {"cookie"},
			Function = function(Args)
				local Connected = ""
				for i,v in pairs(Args) do
					Connected ..= " " .. v
				end
				_OG.writefile("cookie.txt",Connected)
			end,
		},
		["checkcookie"] = {
			Args = {},
			Alias = {},
			Function = function(Args)
				if _OG.isfile("cookie.txt") then
					if not Token then GetAuthentication() end
					if not Token then
						printconsole("Cookie Invalid","Please get a new cookie.")
					else
						printconsole("Cookie Valid","You may proceed to use cookie related commands.")
					end
				else
					printconsole("No Cookie","You have not added your cookie, please use the savecookie command.")
				end
			end,
		},
		["r6"] = {
			Args = {},
			Alias = {},
			Function = function()
				InvokeRobloxApi("https://avatar.roblox.com/v1/avatar/set-player-avatar-type",{playerAvatarType = 1})
				Commands["refresh"].Function({"true"})
				--[[
				if _OG.isfile("cookie.txt") then
					if not Token then GetAuthentication() end
					if Token then
						local Response = request({
							Url = "https://avatar.roblox.com/v1/avatar/set-player-avatar-type",
							Method = "POST",
							Headers = {
								["cookie"] = _OG.readfile("cookie.txt"),
								["Content-Type"] = "application/json",
								["x-csrf-token"] = Token,
								["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0"
							},
							Body = HTTP:JSONEncode({
								playerAvatarType = 1
							})
						})
						if not Response.Success then
							--Notify("Attempted to change to r6","Response code" .. Response.StatusCode)
							printconsole(Response.StatusMessage,"StatusCode: " .. Response.StatusCode .. " | " .. Token)
						else
							Commands["refresh"].Function()
						end
					else
						printconsole("Invalid Token?",Token)
					end
				else
					printconsole("No Cookie","You have not added your cookie, please use the savecookie command.")
				end]]
			end,
		},
		["r15"] = {
			Args = {},
			Alias = {},
			Function = function()
				InvokeRobloxApi("https://avatar.roblox.com/v1/avatar/set-player-avatar-type",{playerAvatarType = 3})
				Commands["refresh"].Function({"true"})
				--[[
				if _OG.isfile("cookie.txt") then
					if not Token then GetAuthentication() end
					if Token then
						local Response = request({
							Url = "https://avatar.roblox.com/v1/avatar/set-player-avatar-type",
							Method = "POST",
							Headers = {
								["cookie"] = _OG.readfile("cookie.txt"),
								["Content-Type"] = "application/json",
								["x-csrf-token"] = Token,
								["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0"
							},
							Body = HTTP:JSONEncode({
								playerAvatarType = 3
							})
						})
						if not Response.Success then
							--Notify("Attempted to change to r6","Response code" .. Response.StatusCode)
							printconsole(Response.StatusMessage,"StatusCode: " .. Response.StatusCode .. " | " .. Token)
						else
							Commands["refresh"].Function()
						end
					else
						printconsole("Invalid Token?",Token)
					end
				else
					printconsole("No Cookie","You have not added your cookie, please use the savecookie command.")
				end]]
			end,
		},
		["headsit"] = {
			Args = {"Player"},
			Alias = {},
			Function = function(Args)
				local ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
					AttachToPlayer(ToPlr,CFrame.new(0,1.6,1.15))
					Player.Character:WaitForChild("Humanoid").Sit = true
					PreventSleeping(Player.Character.HumanoidRootPart)
					table.insert(EventStorage["Attachments"],Player.Character.Humanoid.Seated:Connect(function(Seated)
						if not Seated then
							if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then Player.Character.HumanoidRootPart.BodyVelocity:Destroy() end
							if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then Player.Character.HumanoidRootPart.BodyAngularVelocity:Destroy() end
							ClearConnections("Attachments")
							ClearConnections("SleepEvent")
						end
					end)); 
				end
			end,
		},
		["headsitpredict"] = {
			Args = {"Player"},
			Alias = {},
			Function = function(Args)
				local ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
					AttachToPlayer(ToPlr,CFrame.new(0,1.6,1.15),true) 
					Player.Character:WaitForChild("Humanoid").Sit = true
					PreventSleeping(Player.Character.HumanoidRootPart)
					table.insert(EventStorage["Attachments"],Player.Character.Humanoid.Seated:Connect(function(Seated)
						if not Seated then
							if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then Player.Character.HumanoidRootPart.BodyVelocity:Destroy() end
							if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then Player.Character.HumanoidRootPart.BodyAngularVelocity:Destroy() end
							ClearConnections("Attachments")
							ClearConnections("SleepEvent")
						end
					end)); 
				end
			end,
		},
		["bang"] = {
			Args = {"Player"},
			Alias = {},
			Function = function(Args)
				local ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
					AttachToPlayer(ToPlr,CFrame.new(0,0,1)) 
					PreventSleeping(Player.Character.HumanoidRootPart)
					local bangAnim = Instance.new("Animation") do
						if Player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
							bangAnim.AnimationId = "rbxassetid://5918726674"
						else
							bangAnim.AnimationId = "rbxassetid://148840371"
						end

						local Anim = Player.Character.Humanoid:LoadAnimation(bangAnim); do
							Anim:Play(.1, 1, 1)
							Anim:AdjustSpeed(5)
						end
					end; 
				end
			end,
		},
		["bangpredict"] = {
			Args = {"Player"},
			Alias = {},
			Function = function(Args)
				local ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
					AttachToPlayer(ToPlr,CFrame.new(0,0,1),true) 
					PreventSleeping(Player.Character.HumanoidRootPart)
					local bangAnim = Instance.new("Animation") do
						if Player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
							bangAnim.AnimationId = "rbxassetid://5918726674"
						else
							bangAnim.AnimationId = "rbxassetid://148840371"
						end

						local Anim = Player.Character.Humanoid:LoadAnimation(bangAnim); do
							Anim:Play(.1, 1, 1)
							Anim:AdjustSpeed(5)
						end
					end end
			end,
		},
		["rejoin"] = {
			Args = {},
			Alias = {},
			Function = function()
				IsTeleporting = true
				if #Players:GetPlayers() <= 1 then
					TeleportService:Teleport(game.PlaceId, Player)
				else
					TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
				end
			end,
		},
		["invisible"] = {
			Args = {},
			Alias = {},
			Function = function()
				if Visible then
					Visible(); Visible = nil
				end
				if not Global.RealChar then
					local Player = Players.LocalPlayer
					local RealChar = Player.Character
					RealChar.Archivable = true
					local FakeChar = RealChar:Clone()

					for i,v in pairs(FakeChar:GetDescendants()) do
						if v:IsA("BasePart") then
							v.Material = Enum.Material.ForceField
						end
					end

					RealChar:MoveTo(Vector3.new(0,math.huge,0))
					fwait()
					RealChar.HumanoidRootPart.Anchored = true

					FakeChar.Parent = workspace
					Player.Character = FakeChar

					workspace.CurrentCamera.CameraSubject = FakeChar.Humanoid
					if FakeChar:FindFirstChild("Animate") then FakeChar.Animate.Disabled = true; FakeChar.Animate.Disabled = false end

					Visible = function()
						workspace.CurrentCamera.CameraSubject = RealChar.Humanoid

						RealChar.HumanoidRootPart.Anchored = false
						RealChar.HumanoidRootPart.CFrame = FakeChar.HumanoidRootPart.CFrame

						Player.Character = RealChar
						FakeChar:Destroy()
					end
				end
			end,
		},
		["visible"] = {
			Args = {},
			Alias = {},
			Function = function()
				if Visible then
					Visible(); Visible = nil
				end
			end,
		},
		["noclip"] = {
			Args = {},
			Alias = {},
			Function = function()
				if EventStorage.Noclip then 
					EventStorage.Noclip:Disconnect() EventStorage.Noclip = nil
				end
				EventStorage.Noclip = RunService.Stepped:Connect(function()
					for _, child in pairs(Player.Character:GetDescendants()) do
						if child:IsA("BasePart") and child.CanCollide == true then
							child.CanCollide = false
						end
					end
				end)
			end,
		},
		["clip"] = {
			Args = {},
			Alias = {},
			Function = function()
				if EventStorage.Noclip then 
					EventStorage.Noclip:Disconnect() EventStorage.Noclip = nil
				end
			end,
		},
		["fly"] = {
			Args = {},
			Alias = {},
			Function = function()
				if not Flying then
					local Player = Player or Players.LocalPlayer
					local Character = Player.Character
					local Root = Character.HumanoidRootPart

					Flying = true

					local Speed = 50

					local Controls = {
						Left = 0,
						Right = 0,
						Forward = 0,
						Back = 0,
						Up = 0,
						Down = 0,
					}

					local BodyGyro = Instance.new("BodyGyro"); do
						BodyGyro.P = 9e4
						BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						BodyGyro.CFrame = Root.CFrame
						BodyGyro.Parent = Root
					end

					local BodyVelocity = Instance.new("BodyVelocity"); do
						BodyVelocity.Velocity = Vector3.new(0, 0, 0)
						BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
						BodyVelocity.Parent = Root
					end

					Character.Humanoid.PlatformStand = true

					EventStorage.FlyInputBegan = UserInputService.InputBegan:Connect(function(Key)
						if Key.KeyCode == Enum.KeyCode.W then
							Controls.Forward = 1
						elseif Key.KeyCode == Enum.KeyCode.S then
							Controls.Back = - 1
						elseif Key.KeyCode == Enum.KeyCode.A then
							Controls.Left = - 1
						elseif Key.KeyCode == Enum.KeyCode.D then 
							Controls.Right = 1
						elseif Key.KeyCode == Enum.KeyCode.E then
							Controls.Up = 1*2
						elseif Key.KeyCode == Enum.KeyCode.Q then
							Controls.Down = -1*2
						end
					end)

					EventStorage.FlyInputEnd = UserInputService.InputEnded:Connect(function(Key)
						if Key.KeyCode == Enum.KeyCode.W then
							Controls.Forward = 0
						elseif Key.KeyCode == Enum.KeyCode.S then
							Controls.Back =  0
						elseif Key.KeyCode == Enum.KeyCode.A then
							Controls.Left =  0
						elseif Key.KeyCode == Enum.KeyCode.D then 
							Controls.Right = 0
						elseif Key.KeyCode == Enum.KeyCode.E then
							Controls.Up = 0
						elseif Key.KeyCode == Enum.KeyCode.Q then
							Controls.Down = 0
						end
					end)

					Player.CharacterAdded:Connect(function()
						Commands["unfly"].Function()
					end)

					while Flying do
						local Speed = Controls.Left == 0 and  Controls.Right == 0 and Controls.Forward == 0 and  Controls.Back == 0 and  Controls.Down == 0 and Controls.Up == 0 and 0 or 50
						if (Controls.Left + Controls.Right) ~= 0 or (Controls.Forward + Controls.Back) ~= 0 or (Controls.Down + Controls.Up) ~= 0 then
							BodyVelocity.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (Controls.Forward + Controls.Back)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(Controls.Left + Controls.Right, (Controls.Forward + Controls.Back + Controls.Down + Controls.Up) * 0.2, 0).Position) - workspace.CurrentCamera.CoordinateFrame.p)) * Speed
						else
							BodyVelocity.Velocity = Vector3.new(0, 0, 0)
						end
						BodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame
						fwait()
					end

					BodyGyro:destroy()
					BodyVelocity:destroy()
					Player.Character.Humanoid.PlatformStand = false
				end
			end,
		},
		["unfly"] = {
			Args = {},
			Alias = {},
			Function = function()
				Flying = false
				if EventStorage.FlyInputEnd then EventStorage.FlyInputEnd:Disconnect() end
				if EventStorage.FlyInputBegan then EventStorage.FlyInputBegan:Disconnect() end
			end,
		},
		["cleanfling"] = {
			Args = {},
			Alias = {},
			Function = function()
				local tool = Player.Character:FindFirstChildOfClass("Tool") or Player.Backpack:FindFirstChildOfClass("Tool")
				if tool then
					tool.Parent = Player.Backpack
					tool.Handle.Massless = true
					tool.GripPos = Vector3.new(5000, 5000, 5000)
					Player.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,math.huge,math.huge,math.huge)
					tool.Parent = Player.Backpack
					tool.Parent = Player.Character
					Commands["noclip"].Function()
					fwait(.1+GetPing())
					for i,v in pairs(Player.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
						if string.find(v.Animation.AnimationId,"182393478") then
							v:Stop()
						end
					end
				end
			end,
		},
		["datalimit"] = {
			Args = {"KBPS"},
			Alias = {},
			Function = function(Args)
				if tonumber(Args[1]) then
					NetworkClient:SetOutgoingKBPSLimit(tonumber(Args[1]))
				end
			end,
		},
		["pathfind"] = {
			Args = {"pathfindto"},
			Alias = {},
			Function = function(Args)
				local Plr = ShortName(Args[1]);
				if Plr then
					Plr = Plr[1]
					Commands["antifling"].Function()

					local Character = Player.Character
					local Humanoid = Character:WaitForChild("Humanoid")
					local Root = Character:WaitForChild("HumanoidRootPart")
					local Target = Plr.Character
					local TRoot = Target:WaitForChild("HumanoidRootPart")

					local Path = PathfindingService:CreatePath({
						AgentHeight = 3,
						WaypointSpacing = 10,
						AgentCanJump = true,
					})

					while Character and Character.Parent do
						Path:ComputeAsync(Root.Position,TRoot.Position)
						for i=1,5 do
							local Path1 = Path:GetWaypoints()[i]
							if Path1 then
								if Path1.Action == Enum.PathWaypointAction.Walk then
									Humanoid:MoveTo(Path1.Position)--; Humanoid.MoveToFinished:Wait()
									repeat fwait() until (Root.Position - Path1.Position).Magnitude < 4
								elseif Path1.Action == Enum.PathWaypointAction.Jump then
									Humanoid.Jump = true
									fwait()
								end
							end
						end
					end
				end
			end,
		},
		["goto"] = {
			Args = {},
			Alias = {},
			Function = function(Args)
				local Plr = ShortName(Args[1]);
				if Plr then
					Player.Character.HumanoidRootPart.CFrame = Plr[1].Character:FindFirstChild("HumanoidRootPart") and Plr[1].Character.HumanoidRootPart.CFrame or Plr[1].Character:FindFirstChildOfClass("BasePart").CFrame
				end
			end,
		},
		["goto2"] = {
			Args = {},
			Alias = {},
			Function = function(Args)
				local Plr = ShortName(Args[1]);
				if Plr then
					Player.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					Player.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					Player.Character.HumanoidRootPart.CFrame = Plr[1].Character:FindFirstChild("HumanoidRootPart") and Plr[1].Character.HumanoidRootPart.CFrame or Plr[1].Character:FindFirstChildOfClass("BasePart").CFrame
				end
			end,
		},
		["replicationlag"] = {
			Args = {"number"},
			Alias = {},
			Function = function(Args)
				if tonumber(Args[1]) then
					settings():GetService("NetworkSettings").IncomingReplicationLag = tonumber(Args[1])/1000
				end
			end,
		},
		["psr"] = {
			Args = {"number"},
			Alias = {},
			Function = function(Args)
				if tonumber(Args[1]) then
					setfflag("S2PhysicsSenderRate",tonumber(Args[1]) or 30)
				end
			end,
		},
		["speed"] = {
			Args = {"number"},
			Alias = {"walkspeed"},
			Function = function(Args)
				Player.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Args[1] and tonumber(Args[1]) or 16
			end,
		},
		["gravity"] = {
			Args = {"number"},
			Alias = {},
			Function = function(Args)
				workspace.Gravity = Args[1] and tonumber(Args[1]) or 16
			end,
		},
		["sit"] = {
			Args = {},
			Alias = {},
			Function = function()
				Player.Character:WaitForChild("Humanoid").Sit = true
			end,
		},
		["split"] = {
			Args = {},
			Alias = {"r15split"},
			Function = function()
				if Player.Character:FindFirstChild("Waist",true) then
					Player.Character.Character:FindFirstChild("Waist",true):Destroy()
				end
			end,
		},
		["kill"] = {
			Args = {"Player"},
			Alias = {"toolkill"},
			Function = function(Args)
				local ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1]
					local tool = Player.Character:FindFirstChildOfClass("Tool") or Player.Backpack:FindFirstChildOfClass("Tool")
					if tool then
						tool.Parent = Player.Backpack

						local Humanoid = Player.Character.Humanoid do
							local FakeHum = Humanoid:Clone()
							Humanoid.Name = ""
							FakeHum.Parent = Player.Character
							Humanoid:Destroy()
						end

						tool.Parent = Player.Character
						AttachToPlayer(ToPlr,CFrame.new(),true)
						tool:GetPropertyChangedSignal("Parent"):Wait(); if tool.Parent == ToPlr.Character then
							ClearConnections("Attachments")
							local Root = Player.Character.HumanoidRootPart
							repeat
								Root.CFrame = CFrame.new(999999, workspace.FallenPartsDestroyHeight + 1,999999)
								fwait()
							until not ToPlr.Character or not Root or not ToPlr.Character:FindFirstChild("HumanoidRootPart") or not Root.Parent
						end
					end
				end
			end,
		},
		["fling"] = {
			Args = {"Player"},
			Alias = {"velocitykill","flingkill"},
			Function = function(Args)
				local ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1]
					local Root = Player.Character:WaitForChild("HumanoidRootPart")
					local Origin = Root.CFrame
					Commands["noclip"].Function()
					AttachToPlayer(ToPlr,CFrame.new(),true)
					PreventSleeping(Player.Character.HumanoidRootPart)
					fwait(.1+GetPing(750))--GetPing(750))
					Root:WaitForChild("BodyAngularVelocity").AngularVelocity = Vector3.new(2147483646,0,0)
					repeat 
						fwait()
					until not ToPlr.Character or not ToPlr.Character:FindFirstChild("HumanoidRootPart") or ToPlr.Character.HumanoidRootPart.Velocity.Magnitude >= 100 or ToPlr.Character.HumanoidRootPart.RotVelocity.Magnitude >= 100
					ClearConnections("SleepEvent")
					ClearConnections("Attachments")
					Commands["clip"].Function()
					Root:WaitForChild("BodyAngularVelocity"):Destroy()
					Root:WaitForChild("BodyVelocity"):Destroy()
					for i=1,3 do
						Root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
						Root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
						Root.CFrame = Origin
						fwait()
					end
				end
			end,
		},
		["printvelocity"] = {
			Args = {"Player"},
			Alias = {},
			Function = function(Args)
				local ToPlr = ShortName(Args[1],true); if ToPlr then 
					for i,v in pairs(ToPlr) do
						for i,part in pairs(v.Character:GetChildren()) do
							if part:IsA("BasePart") then
								printconsole(v.Name,part.Name,RoundNumber(part.Velocity.X) .. "," .. RoundNumber(part.Velocity.Y) .. "," .. RoundNumber(part.Velocity.Z))
							end
						end
					end
				end
			end,
		},
		["printtotalvelocity"] = {
			Args = {"Player"},
			Alias = {"printmagnitude"},
			Function = function(Args)
				local ToPlr = ShortName(Args[1],true); if ToPlr then 
					for i,v in pairs(ToPlr) do
						for i,part in pairs(v.Character:GetChildren()) do
							if part:IsA("BasePart") then
								printconsole(v.Name,part.Name,RoundNumber(part.Velocity.Magnitude))
							end
						end
					end
				end
			end,
		},
		["printserverinfo"] = {
			Args = {},
			Alias = {},
			Function = function()
				if Global.ServerInfo then
					printconsole("Connected to " .. Global.ServerInfo.State .. ", " .. Global.ServerInfo.City .. " in " .. Global.ServerInfo.Country)	
				else
					printconsole("No Global.ServerInfo","Please use the autoexecute provided by TimedMarch")
				end
			end,
		},
		["printplayerinfo"] = {
			Args = {"Player"},
			Alias = {"serverinfo","serverlocation"},
			Function = function(Args)
				if Global.GetPlayerData and Args[1] then
					local Found = ShortName(Args[1])
					printconsole(Global.GetPlayerData(Found and Found[1].Name or Args[1]))
				else
					printconsole("No RoTracker","Please ask ProductionTakeOne for RoTracker")
				end
			end,
		},
		["chatserverinfo"] = {
			Args = {},
			Alias = {"serverinfo","serverlocation"},
			Function = function()
				if Global.ServerInfo then
					fwait(GetPing(900))
					ChatRemote:FireServer("Connected to " .. Global.ServerInfo.State .. ", " .. Global.ServerInfo.City .. " in " .. Global.ServerInfo.Country,"All")
				else
					printconsole("No Global.ServerInfo","Please use the autoexecute provided by TimedMarch")
				end
			end,
		},
		["chatplayerinfo"] = {
			Args = {"Player"},
			Alias = {"serverinfo","serverlocation"},
			Function = function(Args)
				if Global.GetPlayerData and Args[1] then
					fwait(GetPing(900))
					local Found = ShortName(Args[1])
					ChatRemote:FireServer(Global.GetPlayerData(Found and Found[1].Name or Args[1]),"All")
				else
					printconsole("No RoTracker","Please ask TimedMarch for RoTracker")
				end
			end,
		},
		["printmass"] = {
			Args = {"Player"},
			Alias = {},
			Function = function(Args)
				local ToPlr = ShortName(Args[1],true); if ToPlr then 
					for i,v in pairs(ToPlr) do
						local Mass = 0
						for i,part in pairs(v.Character:GetChildren()) do
							if part:IsA("BasePart") then
								Mass += part.Mass
							end
						end
						printconsole(v,Mass)
					end
				end
			end,
		},
		["outfits"] = {
			Args = {},
			Alias = {},
			Function = function()
				if not OutfitsUI then
					local AnimIds = {
						[619542203] = 10921132962,
						[837011741] = 10921071918,
						[619521748] = 10921248039,
						[619535834] = 10921344533,
						[973771666] = 10921301576,
						[1113742618] = 10921315373,
						[658832408] = 10921155160,
						[5319922112] = 10921230744,
						[734327140] = 10921117521,
						[754637456] = 10921144709,
						[892268340] = 10921101664,
						[619528125] = 10921288909,
						[619511648] = 10921272275,
						[1113752682] = 10921330408,
						[1018553897] = 10921054344,
						[1090133099] = 10921034824,
						[837024662] = 750781874,
						[2510235063] = 10921258489,
					}
					local Avatars = HTTP:JSONDecode(RequestURL("https://avatar.roblox.com/v1/users/" .. tostring(Player.UserId) .. "/outfits?outfitType=1&itemsPerPage=50&isEditable=true")); do
						OutfitList = {}; for i,v in pairs(Avatars.data) do
							OutfitList[v.name] = v.id
						end
					end
					local OutfitExample,OutfitsScroll
					OutfitsUI = Instance.new("Frame"); do
						OutfitsUI.BackgroundColor3 = Color3.fromRGB(57,57,57)
						OutfitsUI.Name = "Outfits"
						OutfitsUI.Position = UDim2.new(0,20,0,450)
						OutfitsUI.Size = UDim2.new(0,400,0,200)

						local UICorner_1 = Instance.new("UICorner"); do
							UICorner_1.CornerRadius = UDim.new(0,5)
							UICorner_1.Parent = OutfitsUI
						end

						local ImageLabel_1 = Instance.new("ImageLabel"); do
							ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
							ImageLabel_1.BackgroundTransparency = 1
							ImageLabel_1.Image = "rbxassetid://4670964366"
							ImageLabel_1.Position = UDim2.new(0,3,0,3)
							ImageLabel_1.Size = UDim2.new(0,20,0,20)
							ImageLabel_1.Parent = OutfitsUI
						end

						local TextLabel_2 = Instance.new("TextLabel"); do
							TextLabel_2.AnchorPoint = Vector2.new(0.5,0)
							TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
							TextLabel_2.BackgroundTransparency = 2

							do -- FontFace
								TextLabel_2.FontFace.Weight = Enum.FontWeight.Regular
								TextLabel_2.FontFace.Bold = false
								TextLabel_2.FontFace.Family = "rbxasset://fonts/families/Ubuntu.json"
								TextLabel_2.FontFace.Style = Enum.FontStyle.Normal
							end
							TextLabel_2.FontSize = Enum.FontSize.Size11
							TextLabel_2.Position = UDim2.new(0.5,0,0,7)
							TextLabel_2.Text = "Outfits"
							TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
							TextLabel_2.TextSize = 11
							TextLabel_2.TextWrap = true
							TextLabel_2.TextWrapped = true
							TextLabel_2.Size = UDim2.new(0,200,0,14)
							TextLabel_2.Parent = OutfitsUI
						end

						OutfitsScroll = Instance.new("ScrollingFrame"); do
							OutfitsScroll.Active = true
							OutfitsScroll.AnchorPoint = Vector2.new(0.5,1)
							OutfitsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
							OutfitsScroll.BackgroundColor3 = Color3.fromRGB(53,53,53)
							OutfitsScroll.BorderSizePixel = 0
							OutfitsScroll.BottomImage = "http://www.roblox.com/asset/?id=1195495135"
							OutfitsScroll.CanvasSize = UDim2.new(0,0,0,0)
							OutfitsScroll.MidImage = "http://www.roblox.com/asset/?id=1195495135"
							OutfitsScroll.Position = UDim2.new(0.5,0,1,-3)
							OutfitsScroll.ScrollBarImageColor3 = Color3.fromRGB(124,124,124)
							OutfitsScroll.ScrollBarThickness = 6
							OutfitsScroll.ScrollingDirection = Enum.ScrollingDirection.Y
							OutfitsScroll.TopImage = "http://www.roblox.com/asset/?id=1195495135"
							OutfitsScroll.Size = UDim2.new(0.98,-3,0.975,-25)

							local UIGridLayout = Instance.new("UIGridLayout"); do
								UIGridLayout.CellSize = UDim2.new(0.32,0,0,125)
								UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
								UIGridLayout.Parent = OutfitsScroll
							end

							OutfitExample = Instance.new("TextButton"); do
								OutfitExample.BackgroundTransparency = 1
								OutfitExample.Text = ""
								OutfitExample.Visible = false

								local TextLabel = Instance.new("TextLabel"); do
									TextLabel.AnchorPoint = Vector2.new(0,1)
									TextLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
									TextLabel.BackgroundTransparency = 1

									do -- FontFace
										TextLabel.FontFace.Weight = Enum.FontWeight.Regular
										TextLabel.FontFace.Bold = false
										TextLabel.FontFace.Family = "rbxasset://fonts/families/GothamSSm.json"
										TextLabel.FontFace.Style = Enum.FontStyle.Normal
									end

									TextLabel.FontSize = Enum.FontSize.Size14
									TextLabel.Position = UDim2.new(0,0,1,0)
									TextLabel.Text = ""
									TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
									TextLabel.TextScaled = true
									TextLabel.TextSize = 14
									TextLabel.TextStrokeTransparency = 0
									TextLabel.TextWrap = true
									TextLabel.TextWrapped = true
									TextLabel.Size = UDim2.new(1,0,0,20)
									TextLabel.Parent = OutfitExample
								end

								local ViewportFrame = Instance.new("ViewportFrame"); do
									ViewportFrame.BackgroundTransparency = 1
									ViewportFrame.Size = UDim2.new(1,0,1,-20)

									local Camera = Instance.new("Camera"); do
										Camera.CFrame = CFrame.new(0,0,-5) * CFrame.Angles(0,math.rad(-180),0)
										Camera.Parent = ViewportFrame

										ViewportFrame.CurrentCamera = Camera
									end

									local WorldModel = Instance.new("WorldModel"); do
										WorldModel.Parent = ViewportFrame
									end

									ViewportFrame.Parent = OutfitExample
								end
							end

							OutfitsScroll.Parent = OutfitsUI
						end
						OutfitsUI.Parent = Background
						OutfitsUI.Visible = BackgroundToggle
						Drag(OutfitsUI,OutfitsUI)	
					end
					Player.Character.Archivable = true
					local DummyBody = Player.Character:Clone(); do
						for i,v in pairs(DummyBody:GetChildren()) do
							if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
								v:Destroy()
							end
						end
					end

					local loadqueue,loadqueuetable = 0,{}
					for i,v in pairs(OutfitList) do
						table.insert(loadqueuetable,{i,v})
					end

					for i=1,#loadqueuetable do
						if loadqueue < 5 then
							loadqueue += 1; task.defer(function()
								local v = {
									id = loadqueuetable[i][2],
									name = loadqueuetable[i][1],
								}
								local Description = Players:GetHumanoidDescriptionFromOutfitId(v.id)
								local newview = OutfitExample:Clone(); do
									newview.Visible = true
									newview:WaitForChild("TextLabel").Text = v.name
									newview.Parent = OutfitsScroll

									local RigType = DummyBody:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15 and "R15" or "R6"

									local Body = DummyBody:Clone(); do
										Body:PivotTo(CFrame.new(0,2000000,0))
										Body.Parent = workspace
										Body:WaitForChild("Humanoid"):ApplyDescription(Description)--AddToQueue(function(Body,Description) return Body:WaitForChild("Humanoid"):ApplyDescription(Description) end,Body,Description)
										Body:PivotTo(CFrame.new(0,0,0))
										Body.Parent = newview:WaitForChild("ViewportFrame"):WaitForChild("WorldModel")

										local Animation = Instance.new("Animation"); Animation.AnimationId = RigType == "R15" and AnimIds[Description.IdleAnimation] and "rbxassetid://" .. AnimIds[Description.IdleAnimation]
											or RigType == "R15" and "rbxassetid://507766388"
											or "rbxassetid://180435571"
										Animation = Body:WaitForChild("Humanoid"):LoadAnimation(Animation); Animation.Looped = true; Animation:Play()
									end

									newview.Activated:Connect(function()
										InvokeRobloxApi("https://avatar.roblox.com/v1/outfits/" .. v.id .. "/wear",{})
										Commands["refresh"].Function({"true"})
									end)
								end
								loadqueue -= 1
							end)
						end
						repeat fwait() until loadqueue < 5
					end
				end
			end,
		},
		["changeoutfit"] = {
			Args = {"Name"},
			Alias = {"outfit"},
			Function = function(Args)
				if Args[1] and OutfitList and OutfitList[Args[1]] then
					InvokeRobloxApi("https://avatar.roblox.com/v1/outfits/" .. OutfitList[Args[1]] .. "/wear",{})
					Commands["refresh"].Function({"true"})
				elseif Args[1] and OutfitList then
					printconsole("Outfit not found.")
				elseif Args[1] then
					printconsole("Please run !outfits before using this command")
				end
			end,
		},
		["checkvc"] = {
			Args = {"Player"},
			Alias = {"isvc"},
			Function = function(Args)
				if keypress and keyrelease then
					local ToPlr; if Args[1] then ToPlr = ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] end end
					local NewTeam = game:GetService("Teams"):FindFirstChild("VC")
					if not NewTeam then
						NewTeam = Instance.new("Team"); do
							NewTeam.Name = "VC";
							NewTeam.TeamColor = BrickColor.new("Royal purple")
							NewTeam.Parent = game:GetService("Teams")
						end
					end

					if ToPlr and table.find(VcVerified[1],ToPlr) then
						ChatRemote:FireServer(ToPlr.Name .. " (" .. ToPlr.DisplayName .. ") is VC Verified","All")
					elseif ToPlr and table.find(VcVerified[2],ToPlr) then
						ChatRemote:FireServer(ToPlr.Name .. " (" .. ToPlr.DisplayName .. ") is not VC Verified","All")
					else
						local function OpenMenu()
							keypress(27)
							keyrelease(27)
						end
						
						local DontAddExtraWait = iswindowactive or isrbxactive or WindowFocused 
						repeat fwait() until iswindowactive or isrbxactive or WindowFocused  
						if not DontAddExtraWait then fwait(1/2) end

						OpenMenu()
						for i=1,10 do 
							fwait()
						end
						OpenMenu()

						for i,v in pairs(GetToPath(CoreGui,"RobloxGui.SettingsShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players"):GetChildren()) do
							if v:IsA("ImageLabel") then
								local ThePlayer = Players:FindFirstChild(string.split(v.Name,"Label")[2])
								if v:FindFirstChild("MuteStatusButton",true) and ThePlayer then
									ThePlayer.Team = NewTeam
								end
								if ToPlr and string.find(v.Name,ToPlr.Name) then
									table.insert(v:FindFirstChild("MuteStatusButton",true) and VcVerified[1] or VcVerified[2],ToPlr)
									fwait(GetPing(900))
									local Additive = v:FindFirstChild("MuteStatusButton",true) and " VC Verified" or " not VC Verified"
									ChatRemote:FireServer(ToPlr.Name .. " (" .. ToPlr.DisplayName .. ") is" .. Additive,"All")
								end
							end
						end
					end
				end
			end,
		},
	 --[[
	[""] = {
		Args = {},
		Alias = {},
		Function = function()

		end,
	}, ]]
	}



	local ScreenGui = Instance.new("ScreenGui"); do
		ScreenGui.IgnoreGuiInset = true
		ScreenGui.ResetOnSpawn = false
		ScreenGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets

		Background = Instance.new("Frame"); do
			Background.BackgroundColor3 = Color3.fromRGB(61,61,61)
			Background.BackgroundTransparency = 0.5
			Background.Name = "Background"
			Background.Size = UDim2.new(1,0,1,0)

			local Console = Instance.new("Frame"); do
				Console.BackgroundColor3 = Color3.fromRGB(57,57,57)
				Console.Name = "Console"
				Console.Position = UDim2.new(0,20,0,30)
				Console.Size = UDim2.new(0,400,0,200)

				local UICorner = Instance.new("UICorner"); do
					UICorner.CornerRadius = UDim.new(0,5)
					UICorner.Parent = Console
				end

				local ImageLabel = Instance.new("ImageLabel"); do
					ImageLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
					ImageLabel.BackgroundTransparency = 1
					ImageLabel.Image = "rbxassetid://4670964366"
					ImageLabel.Position = UDim2.new(0,3,0,3)
					ImageLabel.Size = UDim2.new(0,20,0,20)
					ImageLabel.Parent = Console
				end

				local TextLabel = Instance.new("TextLabel"); do
					TextLabel.AnchorPoint = Vector2.new(0.5,0)
					TextLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
					TextLabel.BackgroundTransparency = 2

					do -- FontFace
						TextLabel.FontFace.Weight = Enum.FontWeight.Regular
						TextLabel.FontFace.Bold = false
						TextLabel.FontFace.Family = "rbxasset://fonts/families/Ubuntu.json"
						TextLabel.FontFace.Style = Enum.FontStyle.Normal
					end
					TextLabel.FontSize = Enum.FontSize.Size11
					TextLabel.Position = UDim2.new(0.5,0,0,7)
					TextLabel.Text = "Console"
					TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
					TextLabel.TextSize = 11
					TextLabel.TextWrap = true
					TextLabel.TextWrapped = true
					TextLabel.Size = UDim2.new(0,200,0,14)
					TextLabel.Parent = Console
				end

				ConsoleScroll = Instance.new("ScrollingFrame"); do
					ConsoleScroll.Active = true
					ConsoleScroll.AnchorPoint = Vector2.new(0.5,1)
					ConsoleScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
					ConsoleScroll.BackgroundColor3 = Color3.fromRGB(53,53,53)
					ConsoleScroll.BorderSizePixel = 0
					ConsoleScroll.BottomImage = "http://www.roblox.com/asset/?id=1195495135"
					ConsoleScroll.CanvasSize = UDim2.new(0,0,0,0)
					ConsoleScroll.MidImage = "http://www.roblox.com/asset/?id=1195495135"
					ConsoleScroll.Position = UDim2.new(0.5,0,1,-3)
					ConsoleScroll.ScrollBarImageColor3 = Color3.fromRGB(124,124,124)
					ConsoleScroll.ScrollBarThickness = 6
					ConsoleScroll.ScrollingDirection = Enum.ScrollingDirection.Y
					ConsoleScroll.TopImage = "http://www.roblox.com/asset/?id=1195495135"
					ConsoleScroll.Size = UDim2.new(0.98,-3,0.975,-25)

					local UIListLayout = Instance.new("UIListLayout"); do
						UIListLayout.Padding = UDim.new(0,2)
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.Parent = ConsoleScroll
					end

					ConsoleExample = Instance.new("TextLabel"); do
						ConsoleExample.BackgroundColor3 = Color3.fromRGB(255,255,255)
						ConsoleExample.BackgroundTransparency = 1
						ConsoleExample.TextWrapped = true

						do -- FontFace
							ConsoleExample.FontFace.Weight = Enum.FontWeight.Regular
							ConsoleExample.FontFace.Bold = false
							ConsoleExample.FontFace.Family = "rbxasset://fonts/families/Ubuntu.json"
							ConsoleExample.FontFace.Style = Enum.FontStyle.Normal
						end

						ConsoleExample.FontSize = Enum.FontSize.Size12
						ConsoleExample.TextColor3 = Color3.fromRGB(255,255,255)
						ConsoleExample.TextSize = 12
						ConsoleExample.TextXAlignment = Enum.TextXAlignment.Left
						ConsoleExample.Size = UDim2.new(1,-6,0,12)
					end

					local EmptySpace = Instance.new("Frame"); do
						EmptySpace.Size = UDim2.new(0,3,0,3)
						EmptySpace.BackgroundTransparency = 1
						EmptySpace.Parent = ConsoleScroll
					end

					ConsoleScroll.Parent = Console
				end
				Console.Parent = Background
				Drag(Console,Console)	
			end

			local Settings = Instance.new("Frame"); do
				Settings.BackgroundColor3 = Color3.fromRGB(57,57,57)
				Settings.Name = "Settings"
				Settings.Position = UDim2.new(0,20,0,240)
				Settings.Size = UDim2.new(0,400,0,200)

				local UICorner_1 = Instance.new("UICorner"); do
					UICorner_1.CornerRadius = UDim.new(0,5)
					UICorner_1.Parent = Settings
				end

				local ImageLabel_1 = Instance.new("ImageLabel"); do
					ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
					ImageLabel_1.BackgroundTransparency = 1
					ImageLabel_1.Image = "rbxassetid://4670964366"
					ImageLabel_1.Position = UDim2.new(0,3,0,3)
					ImageLabel_1.Size = UDim2.new(0,20,0,20)
					ImageLabel_1.Parent = Settings
				end

				local TextLabel_2 = Instance.new("TextLabel"); do
					TextLabel_2.AnchorPoint = Vector2.new(0.5,0)
					TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
					TextLabel_2.BackgroundTransparency = 2

					do -- FontFace
						TextLabel_2.FontFace.Weight = Enum.FontWeight.Regular
						TextLabel_2.FontFace.Bold = false
						TextLabel_2.FontFace.Family = "rbxasset://fonts/families/Ubuntu.json"
						TextLabel_2.FontFace.Style = Enum.FontStyle.Normal
					end
					TextLabel_2.FontSize = Enum.FontSize.Size11
					TextLabel_2.Position = UDim2.new(0.5,0,0,7)
					TextLabel_2.Text = "Settings"
					TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
					TextLabel_2.TextSize = 11
					TextLabel_2.TextWrap = true
					TextLabel_2.TextWrapped = true
					TextLabel_2.Size = UDim2.new(0,200,0,14)
					TextLabel_2.Parent = Settings
				end

				SettingsScroll = Instance.new("ScrollingFrame"); do
					SettingsScroll.Active = true
					SettingsScroll.AnchorPoint = Vector2.new(0.5,1)
					SettingsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
					SettingsScroll.BackgroundColor3 = Color3.fromRGB(53,53,53)
					SettingsScroll.BorderSizePixel = 0
					SettingsScroll.BottomImage = "http://www.roblox.com/asset/?id=1195495135"
					SettingsScroll.CanvasSize = UDim2.new(0,0,0,0)
					SettingsScroll.MidImage = "http://www.roblox.com/asset/?id=1195495135"
					SettingsScroll.Position = UDim2.new(0.5,0,1,-3)
					SettingsScroll.ScrollBarImageColor3 = Color3.fromRGB(124,124,124)
					SettingsScroll.ScrollBarThickness = 6
					SettingsScroll.ScrollingDirection = Enum.ScrollingDirection.Y
					SettingsScroll.TopImage = "http://www.roblox.com/asset/?id=1195495135"
					SettingsScroll.Size = UDim2.new(0.98,-3,0.975,-25)

					local UIListLayout_1 = Instance.new("UIListLayout"); do
						UIListLayout_1.Padding = UDim.new(0,2)
						UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout_1.Parent = SettingsScroll
					end

					SettingsExample = Instance.new("TextButton"); do
						SettingsExample.BackgroundColor3 = Color3.fromRGB(68,68,68) -- Color3.fromRGB(247,104,2)
						SettingsExample.Size = UDim2.new(0,20,0,20)
						SettingsExample.Text = ""

						local UICorner_2 = Instance.new("UICorner"); do
							UICorner_2.CornerRadius = UDim.new(0,5)
							UICorner_2.Parent = SettingsExample
						end

						local TextLabel_3 = Instance.new("TextLabel"); do
							TextLabel_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
							TextLabel_3.BackgroundTransparency = 1

							do -- FontFace
								TextLabel_3.FontFace.Weight = Enum.FontWeight.Regular
								TextLabel_3.FontFace.Bold = false
								TextLabel_3.FontFace.Family = "rbxasset://fonts/families/Ubuntu.json"
								TextLabel_3.FontFace.Style = Enum.FontStyle.Normal
							end
							TextLabel_3.FontSize = Enum.FontSize.Size18
							TextLabel_3.Position = UDim2.new(1,3,0,0)
							TextLabel_3.TextColor3 = Color3.fromRGB(255,255,255)
							TextLabel_3.TextSize = 15
							TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
							TextLabel_3.Size = UDim2.new(0,380,1,0)
							TextLabel_3.Parent = SettingsExample
						end
					end

					local EmptySpace = Instance.new("Frame"); do
						EmptySpace.Size = UDim2.new(0,3,0,3)
						EmptySpace.BackgroundTransparency = 1
						EmptySpace.Parent = SettingsScroll
					end

					SettingsScroll.Parent = Settings
				end
				Settings.Parent = Background
				Drag(Settings,Settings)	
			end

			CommandBar = Instance.new("TextBox"); do
				CommandBar.AnchorPoint = Vector2.new(0.5,0)
				CommandBar.BackgroundColor3 = Color3.fromRGB(57,57,57)
				CommandBar.BorderSizePixel = 0

				do -- FontFace
					CommandBar.FontFace.Weight = Enum.FontWeight.Regular
					CommandBar.FontFace.Bold = false
					CommandBar.FontFace.Family = "rbxasset://fonts/families/GothamSSm.json"
					CommandBar.FontFace.Style = Enum.FontStyle.Normal
				end
				CommandBar.FontSize = Enum.FontSize.Size24
				CommandBar.PlaceholderText = "Command Bar"
				CommandBar.Position = UDim2.new(0.5,0,0,-70)
				CommandBar.Text = ""
				CommandBar.TextColor3 = Color3.fromRGB(255,255,255)
				CommandBar.TextSize = 14
				CommandBar.TextWrap = true
				CommandBar.TextWrapped = true
				CommandBar.ZIndex = 5
				CommandBar.Size = UDim2.new(0.25,0,0,25)
				CommandBar.Parent = Background
				CommandBar.FocusLost:Connect(function(EnterPressed)
					if EnterPressed then
						local Args = string.split(CommandBar.Text," ")
						local CommandName = string.lower(Args[1]); table.remove(Args,1)
						for i,v in pairs(Commands) do
							if i == CommandName or table.find(v.Alias,CommandName) then
								task.defer(function()
									Commands[i].Function(Args)
								end)
							end
						end
					end
					CommandBar.Text = ""
				end)
			end

			CommandsFrame = Instance.new("Frame"); do
				CommandsFrame.BackgroundColor3 = Color3.fromRGB(53,53,53)
				CommandsFrame.BorderSizePixel = 0
				CommandsFrame.Name = "Commands"
				CommandsFrame.Position = UDim2.new(0,429,0,30)
				CommandsFrame.Size = UDim2.new(0,200,0,220)

				local Frame_2 = Instance.new("Frame"); do
					Frame_2.BackgroundColor3 = Color3.fromRGB(57,57,57)
					Frame_2.BorderSizePixel = 0
					Frame_2.Size = UDim2.new(1,0,0,25)

					local TextButton = Instance.new("TextButton"); do
						TextButton.AnchorPoint = Vector2.new(1,0)
						TextButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
						TextButton.BackgroundTransparency = 1

						do -- FontFace
							TextButton.FontFace.Weight = Enum.FontWeight.Regular
							TextButton.FontFace.Bold = false
							TextButton.FontFace.Family = "rbxasset://fonts/families/GothamSSm.json"
							TextButton.FontFace.Style = Enum.FontStyle.Normal
						end
						TextButton.FontSize = Enum.FontSize.Size14
						TextButton.Position = UDim2.new(1,0,0,0)
						TextButton.Text = "X"
						TextButton.TextColor3 = Color3.fromRGB(255,255,255)
						TextButton.TextSize = 14
						TextButton.Visible = false
						TextButton.Size = UDim2.new(0,25,0,25)
						TextButton.Parent = Frame_2
						TextButton.Activated:Connect(function()
							CommandsFrame.Visible = BackgroundToggle
						end)
						Drag(Frame_2,CommandsFrame)
					end

					local ImageLabel_2 = Instance.new("ImageLabel"); do
						ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
						ImageLabel_2.BackgroundTransparency = 1
						ImageLabel_2.Image = "rbxassetid://4670964366"
						ImageLabel_2.Position = UDim2.new(0,3,0,3)
						ImageLabel_2.Size = UDim2.new(0,20,0,20)
						ImageLabel_2.Parent = Frame_2
					end

					local TextLabel_5 = Instance.new("TextLabel"); do
						TextLabel_5.AnchorPoint = Vector2.new(0.5,0)
						TextLabel_5.BackgroundColor3 = Color3.fromRGB(255,255,255)
						TextLabel_5.BackgroundTransparency = 2

						do -- FontFace
							TextLabel_5.FontFace.Weight = Enum.FontWeight.Regular
							TextLabel_5.FontFace.Bold = false
							TextLabel_5.FontFace.Family = "rbxasset://fonts/families/Ubuntu.json"
							TextLabel_5.FontFace.Style = Enum.FontStyle.Normal
						end
						TextLabel_5.FontSize = Enum.FontSize.Size11
						TextLabel_5.Position = UDim2.new(0.5,0,0,7)
						TextLabel_5.Text = "Commands"
						TextLabel_5.TextColor3 = Color3.fromRGB(255,255,255)
						TextLabel_5.TextSize = 11
						TextLabel_5.TextWrap = true
						TextLabel_5.TextWrapped = true
						TextLabel_5.Size = UDim2.new(0,200,0,14)
						TextLabel_5.Parent = Frame_2
					end
					Frame_2.Parent = CommandsFrame
				end

				CommandsScroll = Instance.new("ScrollingFrame"); do
					CommandsScroll.Active = true
					CommandsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
					CommandsScroll.BackgroundColor3 = Color3.fromRGB(255,255,255)
					CommandsScroll.BackgroundTransparency = 1
					CommandsScroll.CanvasSize = UDim2.new(0,0,0,0)
					CommandsScroll.Position = UDim2.new(0,0,0,25)
					CommandsScroll.ScrollBarThickness = 0
					CommandsScroll.Size = UDim2.new(0,200,0,195)

					local UIListLayout_2 = Instance.new("UIListLayout"); do
						UIListLayout_2.Parent = CommandsScroll
					end
					CommandsScroll.Parent = CommandsFrame
				end
				CommandsFrame.Parent = Background
			end
			Background.Parent = ScreenGui
		end

		if not pcall(function()
				ScreenGui.Parent = Global.gethiddengui and Global.gethiddengui() or Global.gethui and Global.gethui() or  game:GetService("CoreGui"):FindFirstChild("RobloxGui") or game:GetService("CoreGui")
			end) then
			ScreenGui.Parent = Player:WaitForChild("PlayerGui")
		end
	end

	local Success,Reason = pcall(function() -- could error
		for i,v in pairs(loadstring(readfile("commands.lua"))()) do
			Commands[i] = v
		end
	end); if not Success then printconsole("Errored loading commands.lua") end

	for i,v in pairs(Commands) do
		local newlabel = Instance.new("TextLabel"); do
			newlabel.BackgroundTransparency = 1
			newlabel.Size = UDim2.new(1,0,0,20)
			newlabel.Font = Enum.Font.Gotham
			newlabel.TextSize = 14
			newlabel.TextColor3 = Color3.fromRGB(247,104,2)
			newlabel.Name = i

			local TextValue = i
			for i,v in pairs(v.Args) do
				TextValue ..= " <" .. v .. ">"
			end; newlabel.Text = TextValue

			newlabel.Parent = CommandsScroll
		end
	end

	for i,v in pairs(Settings) do
		local NewSetting = SettingsExample:Clone(); do
			NewSetting.BackgroundColor3 = v and Color3.fromRGB(247,104,2) or Color3.fromRGB(68,68,68)
			NewSetting:WaitForChild("TextLabel").Text = tostring(i)
			NewSetting.Parent = SettingsScroll
			NewSetting.Activated:Connect(function()
				Settings[i] = not Settings[i]
				NewSetting.BackgroundColor3 = Settings[i] and Color3.fromRGB(247,104,2) or Color3.fromRGB(68,68,68)
				SaveSettings()
			end)
		end
	end

	UserInputService.InputBegan:Connect(function(input,gameprocess)
		if not gameprocess then
			if input.KeyCode == Enum.KeyCode.LeftBracket then
				Toggle = not Toggle
				TweenService:Create(CommandBar,TweenInfo.new(0.5),{Position=Toggle and UDim2.new(0.5,0,0.1,0) or UDim2.new(0.5,0,0,-70)}):Play()
			elseif input.KeyCode == Enum.KeyCode.Home then
				BackgroundToggle = not BackgroundToggle
				ToggleKenzen(BackgroundToggle)
			end
		end
	end)

	ToggleKenzen = function(Bool)
		Background.BackgroundTransparency = Bool and 0.5 or 1
		Background:WaitForChild("Console").Visible = Bool
		Background:WaitForChild("Settings").Visible = Bool
		Background:WaitForChild("Commands").Visible = Bool

		if OutfitsUI then
			OutfitsUI.Visible = Bool
		end

		GetToPath(CommandsFrame,"Frame.TextButton").Visible = not Bool
		Background.Active = Bool
	end; ToggleKenzen(true)

	task.defer(function()
		repeat fwait(0/1) until Player
		Player.Chatted:Connect(function(msg)
			if string.sub(msg,1,1) == "!" then
				msg = string.sub(msg,2)
				local Args = string.split(msg," ")
				local CommandName = string.lower(Args[1]); table.remove(Args,1)
				for i,v in pairs(Commands) do
					if i == CommandName or table.find(v.Alias,CommandName) then
						Commands[i].Function(Args)
					end
				end
			end
		end)
	end)
	local RCD = CheckForRCD() and "Enabled" or "Disabled"
	printconsole("RCD","RejectCharacterDeletions is " .. RCD)
end

IsGameLoaded(); Part:Destroy()
local GameLoadedIn = tick() - LoadTick
printconsole(tostring("Game loaded in " .. RoundNumber(GameLoadedIn) .. " (" .. RoundNumber(GameLoadedIn)*10000 .. "ms)"))

if ToggleKenzen then
	ToggleKenzen(false)
end

Player = Players.LocalPlayer

if Settings.DisableConnections and getconnections then
	local ConnectionsToDisable = {
		GuiService.MenuOpened,
		GuiService.MenuClosed,
	}; for _,v in pairs(ConnectionsToDisable) do
		for _,Connection in pairs(getconnections(v)) do
			Connection:Disable()
		end
	end
end

if Settings.Backrooms then
	local function RootCheck(Char)
		local HumRoot = Char:WaitForChild("HumanoidRootPart",500)
		local HB
		HB = RunService.Heartbeat:Connect(function()
			if HumRoot and HumRoot.Parent then
				if HumRoot.Position.Y <= workspace.FallenPartsDestroyHeight + 10 then
					TeleportService:Teleport(3227921645, Player)
					HB:Disconnect()
				end
			else
				HB:Disconnect()
			end
		end)
	end Player.CharacterAdded:Connect(function(Character)
		RootCheck(Character) 
	end) if Player.Character then RootCheck(Player.Character) end
end

if Settings.ChatFilterLabel then
	task.defer(function()
		local ChatBar = GetToPath(Player,"PlayerGui.Chat.Frame.ChatBarParentFrame")
		local ChatBox = GetToPath(ChatBar,"Frame.BoxFrame.Frame.ChatBar")
		local TextLabel = Instance.new("TextLabel"); do
			TextLabel.Size = UDim2.new(1,0,0,42)
			TextLabel.Position = UDim2.new(0,5,1,0)
			TextLabel.BackgroundTransparency = 1
			TextLabel.TextStrokeTransparency = 0
			TextLabel.TextColor3 = Color3.new(1,1,1)
			TextLabel.Text = ChatBox.Text
			TextLabel.TextSize = 15
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.TextYAlignment = Enum.TextYAlignment.Top
			TextLabel.Parent = ChatBar
		end
		local bool = true
		ChatBox.Changed:Connect(function()
			if bool then
				bool = false
				pcall(function()
					TextLabel.Text = ChatService:FilterStringForBroadcast(ChatBox.Text,Player)
				end) 
				bool = true
			end
		end)
	end)
end

if Settings.Notifications then
	notify = Settings.Notifications and loadstring(RequestURL("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/Notifications.lua"))() or "Disabled"
end

if Settings.AntiAFK then 
	task.defer(function()
		loadstring(RequestURL("https://raw.githubusercontent.com/NoTwistedHere/Roblox/main/AntiAFK.lua"))()
	end) 
end

if Settings.SecureEnvironment then 
	if issyn then
		loadstring(RequestURL("https://raw.githubusercontent.com/IHaxU/SecureSynapseEnv/main/SecureSynapseEnv.lua"))()
	end 
end

local loadedtime = (tick() - LoadTick)

printconsole(tostring("V4.11 Autoexec loaded in " .. RoundNumber(loadedtime) .. " (" .. RoundNumber(loadedtime)*10000 .. "ms)"))

if notify ~= "Disabled" then
	notify({Text = "Game loaded in " .. math.abs(GameLoadedIn),Duration = 5})
end

