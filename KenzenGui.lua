local Version = "1.2.7.8e"

local Success, Err = pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/gethiddengui.lua", false))() end)

if not game:IsLoaded("Workspace") then -- scriptware uses isloaded args
	game.Loaded:Wait()
end

local Tick = tick()

local PathfindingService = game:GetService("PathfindingService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local NetworkClient = game:GetService("NetworkClient")
local HttpService = game:GetService("HttpService")
local NotificationService

local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()

local sethiddenproperty = sethiddenproperty or set_hidden_property or sethiddenprop
local gethiddenproperty = gethiddenproperty or get_hidden_property or gethiddenprop
local Global = Global or getgenv and getgenv() or shared or _G or getfenv(0)
local setfflag = setfflag or function(flag,bool) game:DefineFastFlag(flag,bool) end
local request = (syn and syn.request) or (http and http.request) or (request)
local setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set) or print
local loadstring = pcall(function() loadstring("")() end) and loadstring or nil
local isfile = isfile or readfile and function(name) pcall(function() local a = readfile(name) end) end
local isnetworkowner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
local Ping = game:GetService("Stats"):WaitForChild("Network"):WaitForChild("ServerStatsItem"):WaitForChild("Data Ping")
local printconsole = printconsole or print
local ChatRemote; task.defer(function()
	ChatRemote = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
end)

local Commands,Visible
local noclipping,Flying = false,false
local Toggle = false
local Token

local EventStorage = {}

if not Global.Event then
	local Bind = Instance.new("BindableEvent"); do
		local EventTick = tick()
		for i,v in ipairs({RunService.PreRender,RunService.PreAnimation,RunService.PreSimulation,RunService.PostSimulation}) do
			v:Connect(function()
				Bind:Fire(tick()-EventTick); EventTick = tick()
			end)
		end
		Global.Event = Bind.Event
	end
end; local Event = Global.Event

local Funcs = {}; do
	Funcs.RoundNumber = function(number, decimalPlaces) if number and tonumber(number) then
			decimalPlaces = decimalPlaces or 4
			local Return = tostring(math.round(tonumber(number) * 10^decimalPlaces) * 10^-decimalPlaces)
			return string.find(Return,".") and tonumber(string.sub(Return,1,string.find(Return,".")+decimalPlaces+1)) or tonumber(Return)
		end
	end
	Funcs.fwait = fwait or function(Time)
		if Time and tonumber(Time) and Time > 0 then
			local Timed = 0; repeat Timed += Event:Wait() until Timed >= Time
		else Event:Wait() end
	end
	Funcs.ShortName = function(Name,IncludeLocal)
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
	Funcs.GetPing = function(Divider) Divider = Divider or 1000
		return Ping:GetValue()/Divider
	end
	Funcs.PredictPos = function(Pos1, Velocity1, Pos2, Velocity2, _Pos3, TOAOff, DISTOff)
		local DIST = (Pos1 - (_Pos3 or Pos2)).Magnitude + (DISTOff or 0)
		local TOA = (DIST / Velocity1.Magnitude) + (TOAOff or 0)
		local POS = Pos2 + (Velocity2 * TOA)
		return POS
	end
	Funcs.ClearConnections = function(Folder)
		if EventStorage[Folder] then
			for i,v in pairs(EventStorage[Folder]) do
				v:Disconnect()
			end
		end; EventStorage[Folder] = {}
	end
	Funcs.AttachToPlayer = function(ToPlr,Offset,Prediction)
		local function FixYAxis(Velocity)
			return Vector3.new(Velocity.X,Velocity.Y/3.5,Velocity.Z)
		end
		Funcs.ClearConnections("Attachments")

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
				local Positioning = Prediction and CFrame.new(Funcs.PredictPos(Player.Character.HumanoidRootPart.Position, 
					Vector3.new(math.huge, 0, 0), 
					ToPlr.Character.HumanoidRootPart.Position, 
					FixYAxis(ToPlr.Character.HumanoidRootPart.Velocity), 
					nil, 
					.4+Funcs.GetPing(1000))) * (ToPlr.Character.HumanoidRootPart.CFrame-ToPlr.Character.HumanoidRootPart.Position) * Offset or ToPlr.Character.HumanoidRootPart.CFrame * Offset
				Player.Character.HumanoidRootPart.CFrame = Positioning
			end
		end))

		Player.CharacterAdded:Connect(function()
			Funcs.ClearConnections("Attachments")
		end)
	end
	Funcs.Loadstring = function(Link,NoHTTP,ChunkName)
		if loadstring then
			return loadstring(NoHTTP and Link or game:HttpGet(Link,true),ChunkName)()
		end
	end
	Funcs.GetAuthentication = function()
		local cookie = readfile("cookie.txt")
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
			Funcs.Notify("Incorrect Cookie","Your cookie invalid")
		end
	end
	NotificationService = Funcs.Loadstring("https://raw.githubusercontent.com/AbstractPoo/Main/main/Notifications.lua"); Funcs.Notify = function(Title,Description)
		--print(NotificationService,tostring(Title) .. " " .. tostring(Description))
		if NotificationService then
			--print(tostring(Title) .. " " .. tostring(Description))
			NotificationService:message{
				Title = Title or "",
				Description = Description or "",
				Icon = 8982365769,
				Accept = {
					Text = "Close",
					Callback = function() end,
				},
			}
		end
	end

	Funcs.KillValidity = function(Player) 
		Player.CharacterAdded:Connect(function(Character)
			Character:WaitForChild("HumanoidRootPart"):SetAttribute("SpawnTime",tick())
		end)
		task.defer(function()
			if Player.Character then
				Player.Character:WaitForChild("HumanoidRootPart"):SetAttribute("SpawnTime",tick())
			end
		end)
	end

	Funcs.PreventSleeping = function(Part) 
		Funcs.ClearConnections("SleepEvent")
		local SleepEvent = Event:Connect(function()
			sethiddenproperty(Part, "NetworkIsSleeping", false)
		end); table.insert(EventStorage["SleepEvent"],SleepEvent)

		Part.AncestryChanged:Connect(function()
			if not Part or not Part.Parent then
				Funcs.ClearConnections("SleepEvent")
			end
		end)

		return SleepEvent
	end

	Funcs.CheckForRCD = function() 
		return not gethiddenproperty and true or gethiddenproperty(workspace,"RejectCharacterDeletions") == Enum.RejectCharacterDeletions.Enabled
	end

end; if not Global.fwait then Global.fwait = Funcs.fwait end



local CommandBar,CommandsFrame,ExitButton,ScrollingFrame
local ScreenGui = Instance.new("ScreenGui"); do
	CommandBar = Instance.new("TextBox"); do
		CommandBar.AnchorPoint = Vector2.new(0.5, 0)
		CommandBar.BackgroundColor3 = Color3.fromRGB(57, 0, 98)
		CommandBar.BorderSizePixel = 0
		CommandBar.Position = UDim2.new(0.5,0,0,-70)
		CommandBar.Size = UDim2.new(0.3, 0, 0, 30)
		CommandBar.ZIndex = 5
		CommandBar.Font = Enum.Font.Gotham
		CommandBar.PlaceholderText = "Commands"
		CommandBar.Text = ""
		CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
		CommandBar.TextSize = 20
		CommandBar.TextWrapped = true
		local Diamond = Instance.new("Frame"); do
			Diamond.AnchorPoint = Vector2.new(0.5, 0.5)
			Diamond.BackgroundColor3 = Color3.fromRGB(57, 0, 98)
			Diamond.BorderSizePixel = 0
			Diamond.Position = UDim2.new(0.5, 0, 0.5, 0)
			Diamond.Rotation = 45
			Diamond.Size = UDim2.new(0, 50, 0, 50)
			Diamond.ZIndex = 4
			Diamond.Parent = CommandBar
		end
		CommandBar.Parent = ScreenGui
		CommandBar.FocusLost:Connect(function(EnterPressed)
			if EnterPressed then
				local Args = string.split(CommandBar.Text," ")
				local CommandName = string.lower(Args[1]); table.remove(Args,1)
				if not Args[1] then Args[1] = "" end
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
		CommandsFrame.BackgroundColor3 = Color3.fromRGB(57, 0, 98)
		CommandsFrame.BorderSizePixel = 0
		CommandsFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
		CommandsFrame.Size = UDim2.new(0, 200, 0, 220)
		CommandsFrame.Visible = false
		local Frame_4 = Instance.new("Frame"); do
			Frame_4.BackgroundColor3 = Color3.fromRGB(47, 0, 84)
			Frame_4.BorderSizePixel = 0
			Frame_4.Size = UDim2.new(1, 0, 0, 25)
			ExitButton = Instance.new("TextButton"); do
				ExitButton.AnchorPoint = Vector2.new(1, 0)
				ExitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ExitButton.BackgroundTransparency = 1
				ExitButton.Position = UDim2.new(1, 0, 0, 0)
				ExitButton.Size = UDim2.new(0, 25, 0, 25)
				ExitButton.Font = Enum.Font.Gotham
				ExitButton.Text = "X"
				ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				ExitButton.TextSize = 14
				ExitButton.Parent = Frame_4
				ExitButton.Activated:Connect(function()
					CommandsFrame.Visible = false
				end)
			end
			Frame_4.Parent = CommandsFrame
			task.defer(function() -- Drag
				local dragToggle,dragInput,dragStart,startPos
				local dragSpeed = 0
				local function updateInput(input)
					local Delta = input.Position - dragStart
					CommandsFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
				end
				Frame_4.InputBegan:Connect(function(input)
					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
						dragToggle = true
						dragStart = input.Position
						startPos = CommandsFrame.Position
						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								dragToggle = false
							end
						end)	
					end
				end)
				Frame_4.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						dragInput = input
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if input == dragInput and dragToggle then
						updateInput(input)
					end
				end)
			end)
		end
		ScrollingFrame = Instance.new("ScrollingFrame"); do
			ScrollingFrame.Active = true
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.Position = UDim2.new(0, 0, 0, 25)
			ScrollingFrame.Size = UDim2.new(0, 200, 0, 195)
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.ScrollBarThickness = 0
			ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			local UIListLayout = Instance.new("UIListLayout"); do
				UIListLayout.SortOrder = Enum.SortOrder.Name
				UIListLayout.Parent = ScrollingFrame
			end
			ScrollingFrame.Parent = CommandsFrame
		end
		CommandsFrame.Parent = ScreenGui
	end
	if syn and syn.protect_gui then
		syn.protect_gui(ScreenGui)
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
			Funcs.Loadstring(String,true)
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
		Args = {},
		Alias = {"gr"},
		Function = function()
			if Visible then
				Visible(); Visible = nil
			end
			if game.PlaceId == 7115420363 then game:GetService("ReplicatedStorage").Respawn:FireServer()
			elseif game.PlaceId == 7143319086 then Player.Respawn:FireServer()
			elseif game.PlaceId == 9307193325 or game.PlaceId == 5100950559 then
				Global.ToggleChatFix = false
				local ChatBar = Player:WaitForChild("PlayerGui"):WaitForChild("Chat"):WaitForChild("Frame"):WaitForChild("ChatBarParentFrame"):WaitForChild("Frame"):WaitForChild("BoxFrame"):WaitForChild("Frame"):WaitForChild("ChatBar")
				local Text = ChatBar.Text
				ChatBar:SetTextFromInput("-gr")
				Players:Chat("-gr")
				ChatBar:SetTextFromInput(Text)
				Global.ToggleChatFix = true
			elseif Funcs.CheckForRCD() then
				local CameraType = workspace.CurrentCamera.CameraType
				workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed

				Player.Character:PivotTo(CFrame.new(0,workspace.FallenPartsDestroyHeight+0.1,0))
				task.defer(function()
					Funcs.fwait(Funcs.GetPing(850))
					Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
					Player.Character.Humanoid:TakeDamage(9e9 + 9e9 + 9e9 + 9e9); Player.Character.Humanoid.Health = 0
					if firesignal then firesignal(Player.Character.Humanoid.Died) end
					Player.Character:FindFirstChild("Humanoid").Health = 0
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
		Args = {},
		Alias = {"re","unbang"},
		Function = function()
			local PreviousPosition = Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart.CFrame or
				Player.Character:FindFirstChild("Head") and Player.Character.Head.CFrame or
				Player.Character.PrimaryPart and Player.Character.PrimaryPart.CFrame or
				Player.Character:FindFirstChildOfClass("BasePart") and Player.Character:FindFirstChildOfClass("BasePart").CFrame
			Commands["respawn"].Function()
			Player.CharacterAdded:Wait()
			Player.Character:WaitForChild("HumanoidRootPart").CFrame = PreviousPosition
		end,
	},

	["hydroxide"] = {
		Args = {},
		Alias = {"remotespy","rspy","spy"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/init.lua",false,'init.lua')
			Funcs.Loadstring("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ui/main.lua",false,'ui/main.lua')
		end,
	},
	["fatesadmin"] = {
		Args = {},
		Alias = {"fate"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua")
		end,
	},
	["cmdx"] = {
		Args = {},
		Alias = {"cmdxadmin"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source")
		end,
	},
	["backdoorchecker"] = {
		Args = {},
		Alias = {"bdc","bchecker"},
		Function = function()
			Funcs.Loadstring('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua')
		end,
	},
	["animstealer"] = {
		Args = {},
		Alias = {"animgrabber"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimationStealer.lua")
		end,
	},
	["aimlock"] = {
		Args = {},
		Alias = {},
		Function = function()
			Funcs.Loadstring("https://pastebin.com/raw/Zz5yB0D1")
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
					Funcs.fwait()
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
			Funcs.PreventSleeping(HumanoidRootPart)
			while HumanoidRootPart and HumanoidRootPart.Parent do
				game:GetService("RunService").PostSimulation:Wait()
				local RootVelocity = HumanoidRootPart.Velocity
				HumanoidRootPart.Velocity = Velocity
				game:GetService("RunService").PreRender:Wait()
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
			Funcs.PreventSleeping(HumanoidRootPart)
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
					Funcs.fwait()
				end
			end; 
		end,
	},
	["antifling"] = {
		Args = {},
		Alias = {"physicsantifling"},
		Function = function()
			--Funcs.Loadstring("https://raw.githubusercontent.com/L8X/phys/main/antifling.lua")
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
			Funcs.Loadstring("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/NonPhysicsServiceAntiFling.lua")
		end,
	},
	["explorer"] = {
		Args = {},
		Alias = {"betterdex","newdex"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/wally-rblx/awesome-explorer/main/source.lua")
		end,
	},
	["dex"] = {
		Args = {},
		Alias = {"exprodex"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/L8X/ExProDex-V2/main/src.lua")
		end,
	},
	["dexv4"] = {
		Args = {},
		Alias = {"upgradeddex"},
		Function = function()
			Funcs.Loadstring("https://pastebin.com/raw/fPP8bZ8Z")
		end,
	},
	["iy"] = {
		Args = {},
		Alias = {},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
		end,
	},
	["owlhub"] = {
		Args = {},
		Alias = {},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua")
		end,
	},
	["boomboxhub"] = {
		Args = {},
		Alias = {"boombox"},
		Function = function()
			Funcs.Loadstring('https://riptxde.dev/u/hub/script.lua')
		end,
	},
	["serverhop"] = {
		Args = {"type"},
		Alias = {"hopserver"},
		Function = function(Args)
			local ServerList = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/".. game.PlaceId.. "/servers/Public?sortOrder=Asc&limit=100"))
			local Type = "Random"

			if table.find({"small","smallest","lowest","low","bottom","s"},string.lower(Args[1])) then
				Type = "Smallest"
			elseif table.find({"large","largestest","highest","high","top","l"},string.lower(Args[1])) then
				Type = "Largest"
			end Funcs.Notify("Attempting to serverhop","Type: " .. Type)

			local PlayerCount,ServerJobId = Type == "Smallest" and 100 or 0,nil
			for i,v in pairs(ServerList.data) do
				if Type == "Smallest" and v.playing < v.maxPlayers-1 and v.id ~= game.JobId and v.playing < PlayerCount or Type == "Largest" and v.playing < v.maxPlayers-1 and v.id ~= game.JobId and v.playing > PlayerCount then
					PlayerCount = v.playing
					ServerJobId = v.id
				elseif not ServerJobId and v.id ~= game.JobId and v.playing < v.maxPlayers-1 then
					ServerJobId = v.id
				end 
			end
			if ServerJobId then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ServerJobId)
			end
		end,
	},
	["reanimate"] = {
		Args = {},
		Alias = {"netless"},
		Function = function()
			Funcs.Loadstring("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/ZendeyReanimate.lua")
		end,
	},
	["tooldances"] = {
		Args = {},
		Alias = {"toolemotes","emotes","emote"},
		Function = function()
			if Funcs.CheckForRCD() then
				return -- game is patched
			end

			Global.ToolDancesSettings = {
				Preload = false,
				PreloadWait = true,
				Reanimate = true,
				R15 = false,
			}
			Funcs.Loadstring("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/toolanimations.lua")
		end,
	},
	["r15tooldances"] = {
		Args = {},
		Alias = {"r15toolemotes","r15emotes","r15emote"},
		Function = function()
			if Funcs.CheckForRCD() then
				return -- game is patched
			end

			Global.ToolDancesSettings = {
				Preload = false,
				PreloadWait = true,
				Reanimate = true,
				R15 = true,
			}
			Funcs.Loadstring("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/toolanimations.lua")
		end,
	},
	["f3x"] = {
		Args = {},
		Alias = {"btools"},
		Function = function()
			Funcs.Loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source,true)
		end,
	},
	["copypos"] = {
		Args = {},
		Alias = {"copylocation"},
		Function = function()
			local Root = Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.PrimaryPart or Player.Character:FindFirstChild("Head") or Player.Character:FindFirstChildOfClass("BasePart")
			if Root then setclipboard(Funcs.RoundNumber(Root.Position.X) .. ", " .. Funcs.RoundNumber(Root.Position.Y) .. ", " .. Funcs.RoundNumber(Root.Position.Z)) end
			Funcs.Notify("Copied position","Copied your .Position to your clipboard.")
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
					Funcs.Notify("R6 Needed","You cannot remove korblox on R15")
				end
			end)
			if Player.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
				Player.Character:WaitForChild("Korblox Deathspeaker Right Leg"):Destroy()
			else
				Funcs.Notify("R6 Needed","You cannot remove korblox on R15")
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
			writefile("cookie.txt",Connected)
		end,
	},
	["checkcookie"] = {
		Args = {},
		Alias = {},
		Function = function(Args)
			if isfile("cookie.txt") then
				if not Token then Funcs.GetAuthentication() end
				if not Token then
					Funcs.Notify("Cookie Invalid","Please get a new cookie.")
				else
					Funcs.Notify("Cookie Valid","You may proceed to use cookie related commands.")
				end
			else
				Funcs.Notify("No Cookie","You have not added your cookie, please use the savecookie command.")
			end
		end,
	},
	["r6"] = {
		Args = {},
		Alias = {},
		Function = function()
			if isfile("cookie.txt") then
				if not Token then Funcs.GetAuthentication() end
				if Token then
					local Response = request({
						Url = "https://avatar.roblox.com/v1/avatar/set-player-avatar-type",
						Method = "POST",
						Headers = {
							["cookie"] = readfile("cookie.txt"),
							["Content-Type"] = "application/json",
							["x-csrf-token"] = Token,
							["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0"
						},
						Body = game:GetService("HttpService"):JSONEncode({
							playerAvatarType = 1
						})
					})
					if not Response.Success then
						--Funcs.Notify("Attempted to change to r6","Response code" .. Response.StatusCode)
						Funcs.Notify(Response.StatusMessage,"StatusCode: " .. Response.StatusCode .. " | " .. Token)
					else
						Commands["refresh"].Function()
					end
				else
					Funcs.Notify("Invalid Token?",Token)
				end
			else
				Funcs.Notify("No Cookie","You have not added your cookie, please use the savecookie command.")
			end
		end,
	},
	["r15"] = {
		Args = {},
		Alias = {},
		Function = function()
			if isfile("cookie.txt") then
				if not Token then Funcs.GetAuthentication() end
				if Token then
					local Response = request({
						Url = "https://avatar.roblox.com/v1/avatar/set-player-avatar-type",
						Method = "POST",
						Headers = {
							["cookie"] = readfile("cookie.txt"),
							["Content-Type"] = "application/json",
							["x-csrf-token"] = Token,
							["user-agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0"
						},
						Body = game:GetService("HttpService"):JSONEncode({
							playerAvatarType = 3
						})
					})
					if not Response.Success then
						--Funcs.Notify("Attempted to change to r6","Response code" .. Response.StatusCode)
						Funcs.Notify(Response.StatusMessage,"StatusCode: " .. Response.StatusCode .. " | " .. Token)
					else
						Commands["refresh"].Function()
					end
				else
					Funcs.Notify("Invalid Token?",Token)
				end
			else
				Funcs.Notify("No Cookie","You have not added your cookie, please use the savecookie command.")
			end
		end,
	},
	["headsit"] = {
		Args = {"Player"},
		Alias = {},
		Function = function(Args)
			local ToPlr = Funcs.ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
				Funcs.AttachToPlayer(ToPlr,CFrame.new(0,1.6,1.15))
				Player.Character:WaitForChild("Humanoid").Sit = true
				Funcs.PreventSleeping(Player.Character.HumanoidRootPart)
				table.insert(EventStorage["Attachments"],Player.Character.Humanoid.Seated:Connect(function(Seated)
					if not Seated then
						if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then Player.Character.HumanoidRootPart.BodyVelocity:Destroy() end
						if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then Player.Character.HumanoidRootPart.BodyAngularVelocity:Destroy() end
						Funcs.ClearConnections("Attachments")
						Funcs.ClearConnections("SleepEvent")
					end
				end)); 
			end
		end,
	},
	["headsitpredict"] = {
		Args = {"Player"},
		Alias = {},
		Function = function(Args)
			local ToPlr = Funcs.ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
				Funcs.AttachToPlayer(ToPlr,CFrame.new(0,1.6,1.15),true) 
				Player.Character:WaitForChild("Humanoid").Sit = true
				Funcs.PreventSleeping(Player.Character.HumanoidRootPart)
				table.insert(EventStorage["Attachments"],Player.Character.Humanoid.Seated:Connect(function(Seated)
					if not Seated then
						if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then Player.Character.HumanoidRootPart.BodyVelocity:Destroy() end
						if Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then Player.Character.HumanoidRootPart.BodyAngularVelocity:Destroy() end
						Funcs.ClearConnections("Attachments")
						Funcs.ClearConnections("SleepEvent")
					end
				end)); 
			end
		end,
	},
	["bang"] = {
		Args = {"Player"},
		Alias = {},
		Function = function(Args)
			local ToPlr = Funcs.ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
				Funcs.AttachToPlayer(ToPlr,CFrame.new(0,0,1)) 
				Funcs.PreventSleeping(Player.Character.HumanoidRootPart)
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
			local ToPlr = Funcs.ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1] 
				Funcs.AttachToPlayer(ToPlr,CFrame.new(0,0,1),true) 
				Funcs.PreventSleeping(Player.Character.HumanoidRootPart)
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
			if #Players:GetPlayers() <= 1 then
				game:GetService('TeleportService'):Teleport(game.PlaceId, Player)
			else
				game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
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
				local Player = game:GetService("Players").LocalPlayer
				local RealChar = Player.Character
				RealChar.Archivable = true
				local FakeChar = RealChar:Clone()

				for i,v in pairs(FakeChar:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Material = Enum.Material.ForceField
					end
				end

				RealChar:MoveTo(Vector3.new(0,math.huge,0))
				Funcs.fwait()
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
				local Player = game:GetService("Players").LocalPlayer
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
					Funcs.fwait()
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
				Funcs.fwait(.1+Funcs.GetPing())
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
			local Plr = Funcs.ShortName(Args[1]);
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
			local Plr = Funcs.ShortName(Args[1]);
			if Plr then
				Player.Character.HumanoidRootPart.CFrame = Plr[1].Character:FindFirstChild("HumanoidRootPart") and Plr[1].Character.HumanoidRootPart.CFrame or Plr[1].Character:FindFirstChildOfClass("BasePart").CFrame
			end
		end,
	},
	["goto2"] = {
		Args = {},
		Alias = {},
		Function = function(Args)
			local Plr = Funcs.ShortName(Args[1]);
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
		Args = {"Player","RISH"},
		Alias = {"toolkill"},
		Function = function(Args)
			local ToPlr = Funcs.ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1]
				local RISH = Args[2] and string.lower(Args[2]) == "yes" or Args[2] and string.lower(Args[2]) == "true"; if RISH and ToPlr.Character:WaitForChild("HumanoidRootPart"):GetAttribute("SpawnTime") >= Player.Character:WaitForChild("HumanoidRootPart"):GetAttribute("SpawnTime") then
					Commands["refresh"].Function()
					Funcs.fwait(.3)
				end
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
					Funcs.AttachToPlayer(ToPlr,CFrame.new(),true)
					tool:GetPropertyChangedSignal("Parent"):Wait(); if tool.Parent == ToPlr.Character then
						Funcs.ClearConnections("Attachments")
						local Root = Player.Character.HumanoidRootPart
						repeat
							Root.CFrame = CFrame.new(999999, workspace.FallenPartsDestroyHeight + 1,999999)
							Funcs.fwait()
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
			local ToPlr = Funcs.ShortName(Args[1]); if ToPlr then ToPlr = ToPlr[1]
				local Root = Player.Character:WaitForChild("HumanoidRootPart")
				local Origin = Root.CFrame
				Commands["noclip"].Function()
				Funcs.AttachToPlayer(ToPlr,CFrame.new(),true)
				Funcs.PreventSleeping(Player.Character.HumanoidRootPart)
				Funcs.fwait(.1+Funcs.GetPing(750))--Funcs.GetPing(750))
				Root:WaitForChild("BodyAngularVelocity").AngularVelocity = Vector3.new(2147483646,0,0)
				repeat 
					Funcs.fwait()
				until not ToPlr.Character or not ToPlr.Character:FindFirstChild("HumanoidRootPart") or ToPlr.Character.HumanoidRootPart.Velocity.Magnitude >= 100 or ToPlr.Character.HumanoidRootPart.RotVelocity.Magnitude >= 100
				Funcs.ClearConnections("SleepEvent")
				Funcs.ClearConnections("Attachments")
				Commands["clip"].Function()
				Root:WaitForChild("BodyAngularVelocity"):Destroy()
				Root:WaitForChild("BodyVelocity"):Destroy()
				for i=1,3 do
					Root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					Root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					Root.CFrame = Origin
					Funcs.fwait()
				end
			end
		end,
	},
	["printvelocity"] = {
		Args = {"Player"},
		Alias = {},
		Function = function(Args)
			local ToPlr = Funcs.ShortName(Args[1],true); if ToPlr then 
				for i,v in pairs(ToPlr) do
					for i,part in pairs(v.Character:GetChildren()) do
						if part:IsA("BasePart") then
							print(v.Name,part.Name,Funcs.RoundNumber(part.Velocity.X) .. "," .. Funcs.RoundNumber(part.Velocity.Y) .. "," .. Funcs.RoundNumber(part.Velocity.Z))
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
			local ToPlr = Funcs.ShortName(Args[1],true); if ToPlr then 
				for i,v in pairs(ToPlr) do
					for i,part in pairs(v.Character:GetChildren()) do
						if part:IsA("BasePart") then
							print(v.Name,part.Name,Funcs.RoundNumber(part.Velocity.Magnitude))
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
				print("Connected to " .. Global.ServerInfo.State .. ", " .. Global.ServerInfo.City .. " in " .. Global.ServerInfo.Country)	
			else
				Funcs.Notify("No Global.ServerInfo","Please use the autoexecute provided by ProductionTakeOne")
			end
		end,
	},
	["printplayerinfo"] = {
		Args = {"Player"},
		Alias = {"serverinfo","serverlocation"},
		Function = function(Args)
			if Global.GetPlayerData and Args[1] then
				local Found = Funcs.ShortName(Args[1])
				print(Global.GetPlayerData(Found and Found[1].Name or Args[1]))
			else
				Funcs.Notify("No RoTracker","Please ask ProductionTakeOne for RoTracker")
			end
		end,
	},
	["chatserverinfo"] = {
		Args = {},
		Alias = {"serverinfo","serverlocation"},
		Function = function()
			if Global.ServerInfo then
				Funcs.fwait(Funcs.GetPing(900))
				ChatRemote:FireServer("Connected to " .. Global.ServerInfo.State .. ", " .. Global.ServerInfo.City .. " in " .. Global.ServerInfo.Country,"All")
			else
				Funcs.Notify("No Global.ServerInfo","Please use the autoexecute provided by ProductionTakeOne")
			end
		end,
	},
	["chatplayerinfo"] = {
		Args = {"Player"},
		Alias = {"serverinfo","serverlocation"},
		Function = function(Args)
			if Global.GetPlayerData and Args[1] then
				Funcs.fwait(Funcs.GetPing(900))
				local Found = Funcs.ShortName(Args[1])
				ChatRemote:FireServer(Global.GetPlayerData(Found and Found[1].Name or Args[1]),"All")
			else
				Funcs.Notify("No RoTracker","Please ask ProductionTakeOne for RoTracker")
			end
		end,
	},
	["printmass"] = {
		Args = {"Player"},
		Alias = {},
		Function = function(Args)
			local ToPlr = Funcs.ShortName(Args[1],true); if ToPlr then 
				for i,v in pairs(ToPlr) do
					local Mass = 0
					for i,part in pairs(v.Character:GetChildren()) do
						if part:IsA("BasePart") then
							Mass += part.Mass
						end
					end
					print(v,Mass)
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

for i,v in pairs(Commands) do
	local newlabel = Instance.new("TextLabel"); task.defer(function()
		newlabel.BackgroundTransparency = 1
		newlabel.Size = UDim2.new(1,0,0,20)
		newlabel.Font = Enum.Font.Gotham
		newlabel.TextSize = 14
		newlabel.TextColor3 = Color3.new(1,1,1)
		newlabel.Name = i

		local TextValue = i
		for i,v in pairs(v.Args) do
			TextValue ..= " <" .. v .. ">"
		end; newlabel.Text = TextValue

		newlabel.Parent = ScrollingFrame
	end)
end

UserInputService.InputBegan:Connect(function(input,gameprocess)
	if not gameprocess and input.KeyCode == Enum.KeyCode.LeftBracket then
		Toggle = not Toggle
		if Toggle then
			TweenService:Create(CommandBar,TweenInfo.new(0.5),{Position=UDim2.new(0.5,0,0.1,0)}):Play()
		else
			TweenService:Create(CommandBar,TweenInfo.new(0.5),{Position=UDim2.new(0.5,0,0,-70)}):Play()
		end
	end
end)

task.defer(function()
	local Settings = Global.AidKid or {
		MainColor = Color3.fromRGB(57, 0, 98),
		SecondaryColor = Color3.fromRGB(47, 0, 84),
	}
	for i,v in pairs(ScreenGui:GetDescendants()) do
		if not v:IsA("UIListLayout") then
			if v.BackgroundColor3 == Color3.fromRGB(57, 0, 98) then
				v.BackgroundColor3 = Settings.MainColor
			elseif v.BackgroundColor3 == Color3.fromRGB(47, 0, 84) then
				v.BackgroundColor3 = Settings.SecondaryColor
			end
		end
	end
end)

if not pcall(function()
		ScreenGui.Parent = Global.gethiddengui and Global.gethiddengui() or gethui and gethui() or game:GetService("CoreGui"):FindFirstChild("RobloxGui") or game:GetService("CoreGui")
	end)
then 
	ScreenGui.Parent = Player:WaitForChild("PlayerGui")
end

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

Players.PlayerAdded:Connect(Funcs.KillValidity)
for i,v in pairs(Players:GetPlayers()) do Funcs.KillValidity(v) end

local NewTick = tostring(Funcs.RoundNumber(tick()-Tick))
printconsole("Version: " .. Version .. " | Load Time: " .. NewTick)
local RCD = Funcs.CheckForRCD() and "Enabled" or "Disabled"
Funcs.Notify("RCD","RejectCharacterDeletions is " .. RCD)
Funcs.Notify("LoadTime",NewTick)
return Tick
