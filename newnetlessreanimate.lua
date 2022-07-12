-- [[ https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330 & nul#3174 ]] --
-- [[ Zendey Reanimate // By ProductionTakeOne#3330 // Additional support from nul#3174 and Iamverybored#9941 ]] --

do -- [[ Checks ]] --
	if not game:IsLoaded("Workspace") then -- scriptware uses isloaded args
		game.Loaded:Wait()
	end
	if workspace:FindFirstChild("ExProReanimate") then 
		error("Already Reanimated?") 
	end
end

local SpeedTest = tick()

-- [[ Variables ]] --

local Global = getgenv and getgenv() or _G
local gethiddenproperty = gethiddenproperty or get_hidden_property or gethiddenprop or nil

local shp = sethiddenproperty or set_hidden_property or sethiddenprop or setscriptable and function(loc,prop,val) if not loc then return true end local succ,f = pcall(function() local a = loc[prop] end) if not succ then setscriptable(loc,prop,true) end loc[prop] = val end or nil
local sethiddenproperty = function(loc,prop,val) -- krnl has a broken sethiddenproperty
	pcall(function()
		shp(loc,prop,val)
	end)
end

local isnetworkowner = isnetworkowner or function() return true end
local cloneref = cloneref or function(ref) return ref end
local printconsole = printconsole or print
local setfflag = setfflag or function(flag,bool) game:DefineFastFlag(flag,bool) end

local TweenService = cloneref(game:GetService("TweenService"))
local PhysicsService = game:GetService("PhysicsService")
local RunService = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local Stats = cloneref(game:GetService("Stats"))


local Player = Players.LocalPlayer
local RigType = Player.Character.Humanoid.RigType
local OriginalRig = Player.Character
local OriginalRigDescendants = OriginalRig:GetDescendants()
local event = Global.MiliWait

local FPS = Stats.Workspace.FPS
local Ping = Stats.Network.ServerStatsItem["Data Ping"]

local Asset,Events,BodyVel,Tools = {},{},{},{}

local FakeTorso,FakeTorso1,FakeHead,Character,Claim2Heartbeat,FoundPos,R15Offsets,TorsoHats,SplitTorsoHats,HeadHats,Notify

local Claim2 = true
local ReclaimingParts = false


do -- [[ Removing Tools (Currently Crashes) ]] --
	for i,v in ipairs(OriginalRigDescendants) do
		if v:IsA("Tool") then
			v:Destroy()
		end
	end
	for i,v in ipairs(Player:WaitForChild("Backpack"):GetChildren()) do
		if v:IsA("Tool") then
			v:Destroy()
		end
	end
end

do -- [[ PhysicsService bypass thanks to DanDavis#5234 ]] --
	if Global.CollisionGroupsEnabled then
	elseif gethiddenproperty and setreadonly then
		Global.CollisionGroupsEnabled = true
		local Workspace = game:GetService("Workspace")

		local function doMath(index)
			return -(2^(index-1))
		end


		local function FindCollisionGroup(CollisionGroup)
			for i,v in pairs(gethiddenproperty(Workspace, "CollisionGroups"):split("\\")) do
				local split = v:split("^")
				if split[1] == CollisionGroup then
					return v
				end
			end
			return false
		end

		local function EditCollisionGroup(Name,arg1,arg2,arg3)
			local str = ""
			local args = {arg1,arg2,arg3}

			for i,v in pairs(gethiddenproperty(Workspace, "CollisionGroups"):split("\\")) do
				local split = v:split("^")
				if split[1] == Name  then
					for i,v in pairs(args) do
						if not v then
							args[i] = split[i]
						end
					end
					str = str..string.format("%s%s^%s^%s",((i == 1 and "" ) or "\\") ,args[1], args[2], args[3])
				else	
					str = str..string.format("%s%s^%s^%s",((i == 1 and "" ) or "\\") ,split[1], split[2], split[3])
				end
			end

			sethiddenproperty(Workspace, "CollisionGroups", str)
		end


		local function CreateCollisionGroup(Name)
			assert(FindCollisionGroup(Name) == false, "Could not create collision group, one with that name already exists.")
			sethiddenproperty(Workspace, "CollisionGroups", string.format("%s\\%s^%s^%s", gethiddenproperty(Workspace, "CollisionGroups"),Name,tonumber(#PhysicsService:GetCollisionGroups()), "-1" ))
			return true	
		end

		local function CollisionGroupSetCollidable(Name1,Name2,Boolean)
			assert(typeof(Name1) == "string", string.format("Bad argument #1 to '?' (string expected, got %s)", typeof(Name1)))
			assert(typeof(Name2) == "string", string.format("Bad argument #2 to '?' (string expected, got %s)", typeof(Name1)))
			assert(typeof(Boolean) == "boolean", string.format("Bad argument #3 to '?' (boolean expected, got %s)", typeof(Name1)))
			assert(FindCollisionGroup(Name1) ~= false, "Both collision groups must be valid.")
			assert(FindCollisionGroup(Name2) ~= false, "Both collision groups must be valid.")
			local CollisionGroup1 = FindCollisionGroup(Name1)
			local CollisionGroup2 = FindCollisionGroup(Name2)
			local split1 = CollisionGroup1:split("^")
			local split2 = CollisionGroup2:split("^")
			if Boolean == false then
				if PhysicsService:CollisionGroupsAreCollidable(Name1, Name2) == true then
					if Name1 == Name2 then
						EditCollisionGroup(split1[1], false, false , (tonumber(split1[3])) + doMath(tonumber(split1[2]+1)))
					elseif Name1 ~= Name2 then
						EditCollisionGroup(split1[1], false, false , (tonumber(split1[3])) + doMath(tonumber(split2[2]+1)))
						EditCollisionGroup(split2[1], false, false , (tonumber(split2[3])) + doMath(tonumber(split1[2]+1)))
					end
				end
			elseif Boolean == true then
				if PhysicsService:CollisionGroupsAreCollidable(Name1, Name2) == false then
					if Name1 == Name2 then
						EditCollisionGroup(split1[1], false, false , (tonumber(split1[3])) - doMath(tonumber(split1[2]+1)))
					elseif Name1 ~= Name2 then
						EditCollisionGroup(split1[1], false, false , (tonumber(split1[3])) - doMath(tonumber(split2[2]+1)))
						EditCollisionGroup(split2[1], false, false , (tonumber(split2[3])) - doMath(tonumber(split1[2]+1)))
					end
				end
			end
		end



		local function RemoveCollisionGroup(CollisionGroup)
			string.gsub(gethiddenproperty(Workspace, "CollisionGroups"),"([%w%p]*)("..CollisionGroup.."%^%d+%^%-%d+)([%w%p]*)",function(arg1,arg2,arg3)

				local new = ""
				for index, value in pairs(string.split(arg3,"\\")) do
					new = new.."\\"..string.gsub(value,"(%w+%^)(%d+)(%^%-%d+)",function(arg1,arg2,arg3)  return arg1..math.floor(tonumber(arg2)-1)..arg3 end)

				end
				if new:sub(1,1) == "\\" then  new = new:sub(2,new:len()) end
				local toReturn = arg1..new
				if toReturn:sub(toReturn:len(),toReturn:len()) == "\\" then toReturn = toReturn:sub(1,toReturn:len()-1) end

				sethiddenproperty(Workspace, "CollisionGroups", toReturn)
			end)
		end

		local function RenameCollisionGroup(CollisionGroup,newName)
			assert(typeof(CollisionGroup) == "string", string.format("Bad argument #1 to '?' (string expected, got %s)", typeof(CollisionGroup)))
			assert(typeof(newName) == "string", string.format("Bad argument #1 to '?' (string expected, got %s)", typeof(newName)))
			assert(FindCollisionGroup(CollisionGroup) ~= false, "Cannot find the collision group")
			assert(FindCollisionGroup(newName) == false, "This collision group already exists!")
			string.gsub(gethiddenproperty(Workspace, "CollisionGroups"),"([%w%p]*)("..CollisionGroup.."%^%d+%^%-%d+)([%w%p]*)",function(arg1,arg2,arg3)
				local split = FindCollisionGroup(CollisionGroup):split("^")
				local str = newName.."^"..split[2].."^"..split[3]
				sethiddenproperty(Workspace, "CollisionGroups", arg1..str..arg3)
			end)
		end

		xpcall(function()
			local old
			old = hookmetamethod(game, "__namecall" ,newcclosure(function(self,...)
				if not checkcaller() then return old(self,...) end
				local args = {...}

				if self == PhysicsService then
					if getnamecallmethod() == "RenameCollisionGroup" then
						return	RenameCollisionGroup(args[1],args[2])
					elseif getnamecallmethod() == "RemoveCollisionGroup"  then
						return	RemoveCollisionGroup(args[1])
					elseif getnamecallmethod() == "CreateCollisionGroup" then
						return	CreateCollisionGroup(args[1])
					elseif getnamecallmethod() == "CollisionGroupSetCollidable" then
						return CollisionGroupSetCollidable(args[1],args[2],args[3])
					end
				end 

				return old(self,...)
			end))
		end, function()
			local mt = getrawmetatable(game)
			local old = mt.__namecall

			setreadonly(mt,false)

			mt.__namecall = newcclosure(function(self, ...)
				if not checkcaller() then return old(self,...) end
				local args = {...}

				if self == PhysicsService then
					if getnamecallmethod() == "RenameCollisionGroup" then
						return	RenameCollisionGroup(args[1],args[2])
					elseif getnamecallmethod() == "RemoveCollisionGroup"  then
						return	RemoveCollisionGroup(args[1])
					elseif getnamecallmethod() == "CreateCollisionGroup" then
						return	CreateCollisionGroup(args[1])
					elseif getnamecallmethod() == "CollisionGroupSetCollidable" then
						return CollisionGroupSetCollidable(args[1],args[2],args[3])
					end
				end 

				return old(self,...)
			end)

			setreadonly(mt,true)
		end)
	else
		PhysicsService = nil
	end
end

do -- [[ Enabling Extra Runservice Signals ]] --
	pcall(function() setfflag("NewRunServiceSignals", "true") end) 
	pcall(function() setfflag("NewRunServiceSignals", true) end) 
end

do -- [[ Notification Service, original by quirky anime boy#5506 ]] --
	local notification
	do
		local CoreGui

		if gethui and identifyexecutor and identifyexecutor() == "ScriptWare" then
			CoreGui = cloneref(gethui())
		elseif gethiddengui then
			CoreGui = cloneref(gethiddengui())
		else
			CoreGui = cloneref(game:GetService("CoreGui"))
		end

		local Debris = cloneref(game:GetService("Debris"))

		notification = function(Arguments)
			coroutine.resume(coroutine.create(function()
				local Text = Arguments.Text or "lorem ipsum"
				local Duration = Arguments.Duration or 5

				-- Instances:

				local ScreenGui = CoreGui:FindFirstChild("Error") or Instance.new("ScreenGui", CoreGui)
				local ErrorMessage = cloneref(Instance.new("Frame"))
				local TextSizeConstraint = cloneref(Instance.new("UISizeConstraint"))
				local AsspectRatioConstraint = cloneref(Instance.new("UIAspectRatioConstraint"))
				local ErrorText = cloneref(Instance.new("TextLabel"))
				local TextSizeConstraint_2 = cloneref(Instance.new("UITextSizeConstraint"))
				local SizeConstraint = cloneref(Instance.new("UISizeConstraint"))
				local ErrorIcon = cloneref(Instance.new("ImageLabel"))
				local AsspectRatioConstraint_2 = cloneref(Instance.new("UIAspectRatioConstraint"))

				--Properties:

				local Children = ScreenGui:GetChildren()
				for i,v in ipairs(Children) do
					local Tween = TweenService:Create(v,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(ErrorMessage.Position.X.Scale, 0, .1, (i*v.AbsoluteSize.Y*1.2))})
					Tween:Play()
				end

				ScreenGui.Parent = CoreGui
				ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				ScreenGui.Name = "Error"

				ErrorMessage.Name = "ErrorMessage"
				ErrorMessage.Parent = ScreenGui
				ErrorMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				ErrorMessage.BackgroundTransparency = 0.300
				ErrorMessage.BorderSizePixel = 0
				ErrorMessage.Position = UDim2.new(-1, 0, .1, 0)
				ErrorMessage.Size = UDim2.new(0.600000024, 0, 0.200000003, 0)

				TextSizeConstraint.Name = "TextSizeConstraint"
				TextSizeConstraint.Parent = ErrorMessage
				TextSizeConstraint.MaxSize = Vector2.new(432, 72)
				TextSizeConstraint.MinSize = Vector2.new(336, 56)

				AsspectRatioConstraint.Name = "AsspectRatioConstraint"
				AsspectRatioConstraint.Parent = ErrorMessage
				AsspectRatioConstraint.AspectRatio = 6.000

				ErrorText.Name = "ErrorText"
				ErrorText.Parent = ErrorMessage
				ErrorText.AnchorPoint = Vector2.new(0, 0.5)
				ErrorText.BackgroundTransparency = 1.000
				ErrorText.Position = UDim2.new(0.200000003, -10, 0.5, 0)
				ErrorText.Size = UDim2.new(0.800000012, 0, 1, 0)
				ErrorText.Font = Enum.Font.Gotham
				ErrorText.Text = Text
				ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ErrorText.TextScaled = true
				ErrorText.TextSize = 36.000
				ErrorText.TextWrapped = true
				ErrorText.TextXAlignment = Enum.TextXAlignment.Left

				TextSizeConstraint_2.Name = "TextSizeConstraint"
				TextSizeConstraint_2.Parent = ErrorText
				TextSizeConstraint_2.MaxTextSize = 36

				SizeConstraint.Name = "SizeConstraint"
				SizeConstraint.Parent = ErrorText
				SizeConstraint.MaxSize = Vector2.new(432, 46)

				ErrorIcon.Name = "ErrorIcon"
				ErrorIcon.Parent = ErrorMessage
				ErrorIcon.AnchorPoint = Vector2.new(0, 0.5)
				ErrorIcon.BackgroundTransparency = 1.000
				ErrorIcon.Position = UDim2.new(0, 10, 0.5, 0)
				ErrorIcon.Size = UDim2.new(0.200000003, -20, 1, -20)
				ErrorIcon.Image = "rbxasset://textures/ui/Emotes/ErrorIcon.png"
				ErrorIcon.Rotation = 180

				AsspectRatioConstraint_2.Name = "AsspectRatioConstraint"
				AsspectRatioConstraint_2.Parent = ErrorIcon

				Debris:AddItem(ErrorMessage, Duration+3)
				local Tween = TweenService:Create(ErrorMessage,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(0, 0, 0, ErrorMessage.AbsolutePosition.Y)})
				Tween:Play()
				task.wait(0.6)
				local IconTween = TweenService:Create(ErrorIcon,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation = 0})
				IconTween:Play()
				task.wait(0.4)
				wait(Duration)
				Tween = TweenService:Create(ErrorMessage,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(-1, 0, 0, ErrorMessage.AbsolutePosition.Y)})
				Tween:Play()
			end))
		end
	end
	Notify = function(title,duration)
		if Global.Notification then
			notification({
				Text = title,
				Duration = duration
			})
		end
		printconsole("Zendey // "..tostring(title))
	end
end

do -- [[ Asset Functions ]] -- 
	Asset.Spawn = function(func)
		return task.spawn(coroutine.create(func))
	end
end

do -- [[ Hats and Offsets ]] -- 
	TorsoHats = {
		{"6053208962",CFrame.Angles(0,0,0)},
		{"6859433369",CFrame.Angles(0,0,0)},
		{"6239379629",CFrame.Angles(0,0,0)},
		{"6741673853",CFrame.Angles(math.rad(-90),0,0)},
		{"6239349425",CFrame.Angles(0,0,0)},
		{"24907105",CFrame.Angles(math.rad(-90),0,0)},
		{"6239399609",CFrame.Angles(0,0,0)},
		{"28666413",CFrame.Angles(0,math.rad(90),0)},
		{"2256438720",CFrame.Angles(0,math.rad(90),0)},
		{"6076800984",CFrame.Angles(0,math.rad(90),0)},
		{"29322010",CFrame.Angles(math.rad(-90),0,0)},
	}
	SplitTorsoHats = {
		{"19999406",CFrame.Angles(math.rad(-90),0,0)},
		{"26400954",CFrame.Angles(math.rad(-90),0,0)},
		{"81504106",CFrame.Angles(math.rad(-90),0,0)},
		{"20367587",CFrame.Angles(math.rad(-90),0,0)},
		{"15730704",CFrame.Angles(math.rad(-90),0,0)},
		{"6858317867",CFrame.Angles(math.rad(-90),0,0)},
		{"6858318826",CFrame.Angles(math.rad(-90),0,0)},
		{"6926051356",CFrame.Angles(math.rad(-90),0,0)},
		{"45915003",CFrame.Angles(math.rad(-90),0,0)},
		{"44106323",CFrame.Angles(math.rad(-90),0,0)},
		{"376188163",CFrame.Angles(math.rad(-90),0,0)},
		{"417448095",CFrame.Angles(math.rad(-90),0,0)},
		{"47991609",CFrame.Angles(math.rad(-90),0,0)},
		{"3210183293",CFrame.Angles(math.rad(-90),0,0)},
		{"21778516",CFrame.Angles(math.rad(-90),0,0)},
		{"19999406",CFrame.Angles(math.rad(-90),0,0)},
		{"19999406",CFrame.Angles(math.rad(-90),0,0)},
		{"7287236788",CFrame.Angles(0,0,0)},
		{"31740496",CFrame.Angles(0,0,0)},
		{"3612040655",CFrame.Angles(0,0,0)},
		{"30303412",CFrame.Angles(0,0,0)},
		{"4802604574",CFrame.Angles(0,0,0)},
		{"7250556324",CFrame.Angles(0,0,0)},
		{"7402858015",CFrame.Angles(0,0,0)},
		{"14456185",CFrame.Angles(0,0,0)},
	}
	HeadHats = {
		{"4905027238",CFrame.Angles(0,0,0)},
		{"4904528793",CFrame.Angles(0,0,0)},
		{"7097383073",CFrame.Angles(0,0,0)},
		{"7117381471",CFrame.Angles(0,0,0)},
		{"7436282751",CFrame.Angles(0,0,0)},
		{"8891492740",CFrame.Angles(0,0,0)},
		{"5355543242",CFrame.Angles(0,0,0)},
		{"5314945173",CFrame.Angles(0,0,0)},
		{"8974788752",CFrame.Angles(0,0,0)},
		{"9245818421",CFrame.Angles(0,0,0)},
		{"5012971322",CFrame.Angles(0,0,0)},
		{"7148229003",CFrame.Angles(0,0,0)},
		{"5830615971",CFrame.Angles(0,0,0)},
		{"7052761637",CFrame.Angles(0,0,0)},
		{"8083233113",CFrame.Angles(0,0,0)},
		{"5830616229",CFrame.Angles(0,0,0)},
		{"4921870697",CFrame.Angles(0,0,0)},
		{"5645662435",CFrame.Angles(0,0,0)},
		{"6669710893",CFrame.Angles(0,0,0)},
		{"7792915162",CFrame.Angles(0,0,0)},
	}
end

do -- [[ Default Settings ]] -- 
	if Global.Optimizer == nil then Global.Optimizer = false end
	if Global.Fling == true then Global.Fling = "HumanoidRootPart" end
	if not Global.Fling then Global.Fling = "" end
	if Global.EnableSpin == nil then Global.EnableSpin = false end
	if Global.PartGUI == nil then Global.PartGUI = false end
	if Global.ShowReal == nil then Global.ShowReal = false end
	if Global.FakeGod == nil then Global.FakeGod = false end
	if Global.GodMode == nil then Global.GodMode = true end
	if Global.AutoAnimate == nil then Global.AutoAnimate = true end
	if Global.Velocity == nil then Global.Velocity = -17.72 end
	if Global.Collisions == nil then Global.Collisions = true end
	if Global.Network == nil then Global.Network = true end
	if Global.Claim2 == nil then Global.Claim2 = false end
	if Global.Notification == nil then Global.Notification = true end
	if Global.AntiSleep == nil then Global.AntiSleep = false end
	if Global.MovementVelocity == nil then Global.MovementVelocity = false end
	if Global.ArtificialHeartBeat == nil then Global.ArtificialHeartBeat = true end
	if Global.R6 == nil then Global.R6 = true end
	if Global.AutoReclaim == nil then Global.AutoReclaim = false end
	if Global.HatCollision == nil then Global.HatCollision = false end
end

do -- [[ Optimizations ]] -- 
	settings().Rendering.EagerBulkExecution = true
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	settings().Physics.AllowSleep = false
	settings().Physics.ForceCSGv2 = false
	settings().Physics.DisableCSGv2 = true
	settings().Physics.UseCSGv2 = false
	settings().Physics.ThrottleAdjustTime = math.huge
	sethiddenproperty(workspace,"InterpolationThrottling",Enum.InterpolationThrottlingMode.Disabled)
	sethiddenproperty(workspace,"PhysicsSteppingMethod",Enum.PhysicsSteppingMethod.Fixed)
	sethiddenproperty(workspace,"PhysicsSimulationRate",Enum.PhysicsSimulationRate.Fixed240Hz)
	sethiddenproperty(workspace,"StreamOutBehavior",Enum.StreamOutBehavior.Opportunistic)
	sethiddenproperty(workspace,"StreamingMinRadius",1/0)
	sethiddenproperty(workspace,"StreamingEnabled",true)
	Player.ReplicationFocus = workspace
end

do -- [[ Global Variable Fixes ]] -- 
	if Global.Optimizer and pcall(function() loadstring("")() end) then
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/GameOptimizer/main/src.lua", true))()
	end
	if Global.TorsoFling then 
		if RigType == Enum.HumanoidRigType.R15 then 
			Global.Fling = "LowerTorso" 
		else 
			Global.Fling = "Torso" 
		end 
	end
	if Global.FakeGod and RigType == Enum.HumanoidRigType.R6 then 
		Global.GodMode = false 
	elseif Global.FakeGod then
		Global.FakeGod = false
		Global.GodMode = true
	end
	if Global.HatCollision and RigType == Enum.HumanoidRigType.R6 then 
		Global.GodMode = true
		Global.FakeGod = false
	elseif Global.HatCollision then
		Global.HatCollision = false
		Global.GodMode = true
	end
end

do -- [[ Simulation Radius ]] -- 
	if Global.Network then
		Player.MaximumSimulationRadius=2022
		sethiddenproperty(Player,"SimulationRadius",2022)
		if not Global.SimRadius then
			Global.SimRadius = RunService.Stepped:Connect(function()
				Player.MaximumSimulationRadius=2022
				sethiddenproperty(Player,"SimulationRadius",2022)
			end)
		end
	end
end

do -- [[ Artificial Heartbeat, original by 4eyedfool ]] --
	if not event then
		if Global.ArtificialHeartBeat then
			local BindEvent = Instance.new("BindableEvent")
			for _,Event in ipairs({RunService.Heartbeat,RunService.Stepped,RunService.PreRender,RunService.PreAnimation}) do
				Event:Connect(function()
					BindEvent:Fire()
				end)
			end 
			event = BindEvent.Event
		else
			event = RunService.Heartbeat
		end
		Global.MiliWait = event
	end
end

local Velocity = Vector3.new(Global.Velocity, 0, Global.Velocity) -- Using Velocity on Y axis can cause jittering (rumored)

local wait = function(Time)
	event:Wait()
end

do -- [[ Creating Collision Group ]]
	if PhysicsService then
		if not pcall(function() PhysicsService:GetCollisionGroupId("NoCollide") end) then 
			PhysicsService:CreateCollisionGroup("NoCollide")
			PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)
		end
	end
end

do -- [[ Part GUI ]]
	if Global.PartGUI then
		Asset.Spawn(function()
			local ScreenGui = Instance.new("ScreenGui")
			local ViewPort = Instance.new("ViewportFrame")
			local Camera = Instance.new("Camera")
			Camera.CFrame = OriginalRig:WaitForChild("HumanoidRootPart",10).CFrame * CFrame.new(0,0,-5) * CFrame.Angles(0,math.rad(180),0)
			ViewPort.BackgroundTransparency = 1
			ViewPort.AnchorPoint = Vector2.new(1,0.5)
			ViewPort.Position = UDim2.new(1,0,0.5,0)
			ViewPort.Size = UDim2.new(0,200,0,300)
			ViewPort.CurrentCamera = Camera

			ViewPort.Parent = ScreenGui
			ScreenGui.Parent = game.CoreGui

			for i,v in ipairs(OriginalRigDescendants) do
				if v:IsA("BasePart") then
					local Clone = v:Clone()
					local PartHB
					PartHB = event:Connect(function()
						if v and v.Parent and v:IsDescendantOf(workspace) then
							if isnetworkowner(v) then
								Clone.Material = v.Material
							else
								Clone.Material = Enum.Material.ForceField
							end
						else
							Clone:Destroy()
							PartHB:Disconnect()
						end
					end)
					Clone.Parent = ViewPort
				end
			end
		end)
	end
end

do -- [[ Create Fake Rig ]]
	if RigType == Enum.HumanoidRigType.R15 and Global.R6 then
		R15Offsets = {
			["Left Arm"] = {["LeftUpperArm"] = CFrame.new((1-OriginalRig.LeftUpperArm.Size.X)*2,0.369*(OriginalRig.LeftUpperArm.Size.Y/1.169),0),
				["LeftLowerArm"] = CFrame.new((1-OriginalRig.LeftLowerArm.Size.X)*2,-0.224*(OriginalRig.LeftLowerArm.Size.Y/1.052),0),
				["LeftHand"] = CFrame.new((1-OriginalRig.LeftHand.Size.X)*2,-0.85*(OriginalRig.LeftHand.Size.Y/0.3),0),
			},
			["Right Arm"] = {["RightUpperArm"] = CFrame.new(-(1-OriginalRig.RightUpperArm.Size.X)*2,0.369*(OriginalRig.RightUpperArm.Size.Y/1.169),0),
				["RightLowerArm"] = CFrame.new(-(1-OriginalRig.RightLowerArm.Size.X)*2,-0.224*(OriginalRig.RightLowerArm.Size.Y/1.052),0),
				["RightHand"] = CFrame.new(-(1-OriginalRig.RightHand.Size.X)*2,-0.85*(OriginalRig.RightHand.Size.Y/0.3),0),
			},
			["Torso"] = {["UpperTorso"] = CFrame.new(0,0.2*(OriginalRig.UpperTorso.Size.Y/1.6),0),
				["LowerTorso"] = CFrame.new(0,-0.8*(OriginalRig.LowerTorso.Size.Y/0.4),0),
			},
			["Left Leg"] = {["LeftUpperLeg"] = CFrame.new((1-OriginalRig.LeftUpperLeg.Size.X)/2,0.579*(OriginalRig.LeftUpperLeg.Size.Y/1.217),0),
				["LeftLowerLeg"] = CFrame.new((1-OriginalRig.LeftLowerLeg.Size.X)/2,-0.201*(OriginalRig.LeftLowerLeg.Size.Y/1.193),0),
				["LeftFoot"] = CFrame.new((1-OriginalRig.LeftFoot.Size.X)/2,-0.85*(OriginalRig.LeftFoot.Size.Y/0.3),0),
			},
			["Right Leg"] = {["RightUpperLeg"] = CFrame.new(-(1-OriginalRig.RightUpperLeg.Size.X)/2,0.579*(OriginalRig.RightUpperLeg.Size.Y/1.217),0),
				["RightLowerLeg"] = CFrame.new(-(1-OriginalRig.RightLowerLeg.Size.X)/2,-0.201*(OriginalRig.RightLowerLeg.Size.Y/1.193),0),
				["RightFoot"] = CFrame.new(-(1-OriginalRig.RightFoot.Size.X)/2,-0.85*(OriginalRig.RightFoot.Size.Y/0.3),0),
			},
			["Head"] = {["Head"] = CFrame.new(0,0,0)},
			["HumanoidRootPart"] = {["HumanoidRootPart"] = CFrame.new(0,0,0)},
		}
		--Character = loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/R6Rig.lua",true))()--game:GetObjects("rbxassetid://8232772380")[1]:Clone()
		do -- [[ Creating R6 Rig ]] -- 
			local FakeRig = Global.R6Rig

			if not Global.R6Rig then
				FakeRig = Instance.new("Model")

				local Humanoid = Instance.new("Humanoid")

				local Head = Instance.new("Part")
				local HeadMesh = Instance.new("SpecialMesh")
				--local face = Instance.new("Decal")

				local Torso = Instance.new("Part")
				local Neck = Instance.new("Motor6D")

				local LeftArm = Instance.new("Part")
				local LeftShoulder = Instance.new("Motor6D")

				local RightArm = Instance.new("Part")
				local RightShoulder = Instance.new("Motor6D")

				local LeftLeg = Instance.new("Part")
				local LeftHip = Instance.new("Motor6D")

				local RightLeg = Instance.new("Part")
				local RightHip = Instance.new("Motor6D")

				local RootPart = Instance.new("Part")
				local RootJoint = Instance.new("Motor6D")

				-- not gonna bother naming all of these
				local Animate = Instance.new("LocalScript")
				local Idle = Instance.new("StringValue")
				local Animation31 = Instance.new("Animation")
				local NumberValue32 = Instance.new("NumberValue")
				local Animation33 = Instance.new("Animation")
				local NumberValue34 = Instance.new("NumberValue")
				local StringValue35 = Instance.new("StringValue")
				local Animation36 = Instance.new("Animation")
				local StringValue37 = Instance.new("StringValue")
				local Animation38 = Instance.new("Animation")
				local StringValue39 = Instance.new("StringValue")
				local Animation40 = Instance.new("Animation")
				local StringValue41 = Instance.new("StringValue")
				local Animation42 = Instance.new("Animation")
				local StringValue43 = Instance.new("StringValue")
				local Animation44 = Instance.new("Animation")
				local StringValue45 = Instance.new("StringValue")
				local Animation46 = Instance.new("Animation")
				local StringValue47 = Instance.new("StringValue")
				local Animation48 = Instance.new("Animation")
				local NumberValue49 = Instance.new("NumberValue")
				local BodyColors50 = Instance.new("BodyColors")

				FakeRig.Name = " "
				FakeRig.PrimaryPart = Head

				Head.Name = "Head"
				Head.Color = Color3.new(0.960784, 0.803922, 0.188235)
				Head.Size = Vector3.new(2, 1, 1)
				Head.BrickColor = BrickColor.new("Bright yellow")
				Head.Locked = true
				Head.TopSurface = Enum.SurfaceType.Smooth
				Head.brickColor = BrickColor.new("Bright yellow")
				Head.FormFactor = Enum.FormFactor.Symmetric
				Head.formFactor = Enum.FormFactor.Symmetric

				HeadMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
				face.Name = "face"
				face.Texture = "http://www.roblox.com/asset/?id=405705854"

				Torso.Name = "Torso"
				Torso.Color = Color3.new(0.227451, 0.490196, 0.0823529)
				Torso.Size = Vector3.new(2, 2, 1)
				Torso.BrickColor = BrickColor.new("Camo")
				Torso.LeftParamA = 0
				Torso.LeftParamB = 0
				Torso.LeftSurface = Enum.SurfaceType.Weld
				Torso.Locked = true
				Torso.RightParamA = 0
				Torso.RightParamB = 0
				Torso.RightSurface = Enum.SurfaceType.Weld
				Torso.brickColor = BrickColor.new("Camo")
				Torso.FormFactor = Enum.FormFactor.Symmetric
				Torso.formFactor = Enum.FormFactor.Symmetric

				RightShoulder.Name = "Right Shoulder"
				RightShoulder.MaxVelocity = 0.10000000149011612
				RightShoulder.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				RightShoulder.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				RightShoulder.Part0 = Torso
				RightShoulder.Part1 = RightArm

				LeftShoulder.Name = "Left Shoulder"
				LeftShoulder.MaxVelocity = 0.10000000149011612
				LeftShoulder.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				LeftShoulder.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				LeftShoulder.Part0 = Torso
				LeftShoulder.Part1 = LeftArm

				RightHip.Name = "Right Hip"
				RightHip.MaxVelocity = 0.10000000149011612
				RightHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				RightHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
				RightHip.Part0 = Torso
				RightHip.Part1 = RightLeg

				LeftHip.Name = "Left Hip"
				LeftHip.MaxVelocity = 0.10000000149011612
				LeftHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				LeftHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				LeftHip.Part0 = Torso
				LeftHip.Part1 = LeftLeg

				Neck.Name = "Neck"
				Neck.MaxVelocity = 0.10000000149011612
				Neck.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
				Neck.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
				Neck.Part0 = Torso
				Neck.Part1 = Head

				LeftArm.Name = "Left Arm"
				LeftArm.Color = Color3.new(0.960784, 0.803922, 0.188235)
				LeftArm.Size = Vector3.new(1, 2, 1)
				LeftArm.BrickColor = BrickColor.new("Bright yellow")
				LeftArm.CanCollide = false
				LeftArm.Locked = true
				LeftArm.brickColor = BrickColor.new("Bright yellow")
				LeftArm.FormFactor = Enum.FormFactor.Symmetric
				LeftArm.formFactor = Enum.FormFactor.Symmetric

				RightArm.Name = "Right Arm"
				RightArm.Color = Color3.new(0.960784, 0.803922, 0.188235)
				RightArm.Size = Vector3.new(1, 2, 1)
				RightArm.BrickColor = BrickColor.new("Bright yellow")
				RightArm.CanCollide = false
				RightArm.Locked = true
				RightArm.brickColor = BrickColor.new("Bright yellow")
				RightArm.FormFactor = Enum.FormFactor.Symmetric
				RightArm.formFactor = Enum.FormFactor.Symmetric

				LeftLeg.Name = "Left Leg"
				LeftLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
				LeftLeg.Size = Vector3.new(1, 2, 1)
				LeftLeg.BottomSurface = Enum.SurfaceType.Smooth
				LeftLeg.BrickColor = BrickColor.new("Bright blue")
				LeftLeg.CanCollide = false
				LeftLeg.Locked = true
				LeftLeg.brickColor = BrickColor.new("Bright blue")
				LeftLeg.FormFactor = Enum.FormFactor.Symmetric
				LeftLeg.formFactor = Enum.FormFactor.Symmetric

				RightLeg.Name = "Right Leg"
				RightLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
				RightLeg.Size = Vector3.new(1, 2, 1)
				RightLeg.BottomSurface = Enum.SurfaceType.Smooth
				RightLeg.BrickColor = BrickColor.new("Bright blue")
				RightLeg.CanCollide = false
				RightLeg.Locked = true
				RightLeg.brickColor = BrickColor.new("Bright blue")
				RightLeg.FormFactor = Enum.FormFactor.Symmetric
				RightLeg.formFactor = Enum.FormFactor.Symmetric
				Humanoid.LeftLeg = LeftLeg
				Humanoid.RightLeg = RightLeg
				Humanoid.Torso = RootPart
				Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

				RootPart.Name = "HumanoidRootPart"
				RootPart.Transparency = 1
				RootPart.Size = Vector3.new(2, 2, 1)
				RootPart.BottomSurface = Enum.SurfaceType.Smooth
				RootPart.CanCollide = false
				RootPart.LeftParamA = 0
				RootPart.LeftParamB = 0
				RootPart.Locked = true
				RootPart.RightParamA = 0
				RootPart.RightParamB = 0
				RootPart.TopSurface = Enum.SurfaceType.Smooth
				RootPart.FormFactor = Enum.FormFactor.Symmetric
				RootPart.formFactor = Enum.FormFactor.Symmetric

				RootJoint.Name = "RootJoint"
				RootJoint.MaxVelocity = 0.10000000149011612
				RootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
				RootJoint.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
				RootJoint.Part0 = RootPart
				RootJoint.Part1 = Torso

				Animate.Name = "Animate"
				Animate.Parent = FakeRig

				Idle.Name = "idle"
				Idle.Parent = Animate

				Animation31.Name = "Animation1"
				Animation31.Parent = Idle
				Animation31.AnimationId = "http://www.roblox.com/asset/?id=180435571"

				NumberValue32.Name = "Weight"
				NumberValue32.Parent = Animation31
				NumberValue32.Value = 9

				Animation33.Name = "Animation2"
				Animation33.Parent = Idle
				Animation33.AnimationId = "http://www.roblox.com/asset/?id=180435792"

				NumberValue34.Name = "Weight"
				NumberValue34.Parent = Animation33
				NumberValue34.Value = 1

				StringValue35.Name = "walk"
				StringValue35.Parent = Animate

				Animation36.Name = "WalkAnim"
				Animation36.Parent = StringValue35
				Animation36.AnimationId = "http://www.roblox.com/asset/?id=180426354"

				StringValue37.Name = "run"
				StringValue37.Parent = Animate

				Animation38.Name = "RunAnim"
				Animation38.Parent = StringValue37
				Animation38.AnimationId = "http://www.roblox.com/asset/?id=180426354"

				StringValue39.Name = "jump"
				StringValue39.Parent = Animate

				Animation40.Name = "JumpAnim"
				Animation40.Parent = StringValue39
				Animation40.AnimationId = "http://www.roblox.com/asset/?id=125750702"

				StringValue41.Name = "climb"
				StringValue41.Parent = Animate

				Animation42.Name = "ClimbAnim"
				Animation42.Parent = StringValue41
				Animation42.AnimationId = "http://www.roblox.com/asset/?id=180436334"

				StringValue43.Name = "toolnone"
				StringValue43.Parent = Animate

				Animation44.Name = "ToolNoneAnim"
				Animation44.Parent = StringValue43
				Animation44.AnimationId = "http://www.roblox.com/asset/?id=182393478"

				StringValue45.Name = "fall"
				StringValue45.Parent = Animate

				Animation46.Name = "FallAnim"
				Animation46.Parent = StringValue45
				Animation46.AnimationId = "http://www.roblox.com/asset/?id=180436148"

				StringValue47.Name = "sit"
				StringValue47.Parent = Animate

				Animation48.Name = "SitAnim"
				Animation48.Parent = StringValue47
				Animation48.AnimationId = "http://www.roblox.com/asset/?id=178130996"

				NumberValue49.Name = "ScaleDampeningPercent"
				NumberValue49.Parent = Animate
				NumberValue49.Value = 0.4000000059604645

				BodyColors50.Parent = FakeRig
				BodyColors50.HeadColor = BrickColor.new("Bright yellow")
				BodyColors50.HeadColor3 = Color3.new(0.960784, 0.803922, 0.188235)
				BodyColors50.LeftArmColor = BrickColor.new("Bright yellow")
				BodyColors50.LeftArmColor3 = Color3.new(0.960784, 0.803922, 0.188235)
				BodyColors50.LeftLegColor3 = Color3.new(0.0509804, 0.411765, 0.67451)
				BodyColors50.RightArmColor = BrickColor.new("Bright yellow")
				BodyColors50.RightArmColor3 = Color3.new(0.960784, 0.803922, 0.188235)
				BodyColors50.RightLegColor3 = Color3.new(0.0509804, 0.411765, 0.67451)
				BodyColors50.TorsoColor = BrickColor.new("Camo")
				BodyColors50.TorsoColor3 = Color3.new(0.227451, 0.490196, 0.0823529)

				Global.R6Rig = FakeRig

				RootPart.Parent = FakeRig
				Head.Parent = FakeRig
				Torso.Parent = FakeRig
				LeftArm.Parent = FakeRig
				RightArm.Parent = FakeRig
				LeftLeg.Parent = FakeRig
				RightLeg.Parent = FakeRig

				HeadMesh.Parent = Head
				face.Parent = Head

				Neck.Parent = Torso
				RootJoint.Parent = RootPart
				LeftShoulder.Parent = Torso
				RightShoulder.Parent = Torso
				LeftHip.Parent = Torso
				RightHip.Parent = Torso

				Humanoid.Parent = FakeRig
			end
			Character = FakeRig:Clone()
		end
		Character.Parent = workspace
		Notify("Applying Character Description",3)
		do -- [[ Applying Appearance ]] -- 
			local HumanoidDescription = Players:GetHumanoidDescriptionFromUserId(Player.UserId)
			do  -- [[ Remove Hats ]] -- 
				HumanoidDescription.BackAccessory = ""
				HumanoidDescription.FaceAccessory = ""
				HumanoidDescription.FrontAccessory = ""
				HumanoidDescription.HairAccessory = ""
				HumanoidDescription.HatAccessory = ""
				HumanoidDescription.NeckAccessory = ""
				HumanoidDescription.ShouldersAccessory = ""
				HumanoidDescription.WaistAccessory = ""
				HumanoidDescription:SetAccessories({},false)
			end
			Character.Humanoid:ApplyDescription(HumanoidDescription) --OriginalRig:FindFirstChild("HumanoidDescription",true) or 
			for i,v in ipairs(OriginalRig:GetChildren()) do
				if v:IsA("Accessory") then
					local clonehats = v:Clone()
					clonehats.Parent = Character
					for p,g in ipairs(R15Offsets) do
						if g[v.Handle.AccessoryWeld.Part1.Name] then
							clonehats.Handle.AccessoryWeld.Part1 = Character[p]
						end
					end
				end
			end
		end
		Character:PivotTo(OriginalRig.HumanoidRootPart.CFrame)
	else
		Player.Character.Archivable = true
		Character = Player.Character:Clone()
		Player.Character.Archivable = false
		Character.Parent = workspace
	end
end

wait()
Character.Name = "ExProReanimate"
local CharacterDescendants = Character:GetDescendants()

local OriginCameraCFrame = workspace.CurrentCamera.CFrame

OriginalRig.Parent = Character
Player.Character = Character

Global.RealRig = OriginalRig
Global.CloneRig = Character

do -- [[ Set Character States ]] -- 
	OriginalRig.Humanoid:ChangeState(16)
	Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	workspace.CurrentCamera.CameraSubject = Character.Humanoid
	task.spawn(function()
		RunService.RenderStepped:Wait()
		workspace.CurrentCamera.CFrame = OriginCameraCFrame
	end)
	pcall(function() OriginalRig.Head.FaceCenterAttachment:Destroy() end)
end

do -- [[ GodMode ]] -- 
	if Global.GodMode then
		Asset.Spawn(function()
			--task.wait(Players.RespawnTime+Ping:GetValue()/750)
			task.wait(Players.RespawnTime+.1) -- temporary, will be changed in rewrite
			if Global.HatCollision then
				for i,v in ipairs({OriginalRig.HumanoidRootPart,OriginalRig.Torso,OriginalRig["Body Colors"]}) do
					v.Parent = nil
				end
			else
				local neck = OriginalRig:FindFirstChild("Neck",true)
				if OriginalRig:FindFirstChild("Neck",true) then 
					OriginalRig.Humanoid:ChangeState(15)
					neck.Parent = nil
					Notify("Permadeath On",6) 
				end
			end
		end)
	end
end

do -- [[ Claim 2 ]] -- 
	if Global.Claim2 then
		repeat wait()
			pcall(function()
				local pos = OriginalRig.HumanoidRootPart.Position + Vector3.new(math.random(-1500,1500),100,math.random(-1500,1500))
				local check = true
				for i,v in ipairs(Players:GetPlayers()) do
					if v~= Player and v.Character and v.Character:FindFirstChild("Head") then
						if (v.Character.HumanoidRootPart.Position-pos).magnitude <= 1000 then
							check = false
						end
					end
				end
				if check then
					FoundPos = pos
				end
			end)
		until FoundPos
		FoundPos = CFrame.new(FoundPos)
		OriginalRig.HumanoidRootPart.CFrame = FoundPos
		task.wait(1/22+Ping:GetValue()/750)
		Character.Head.CFrame = FoundPos
		Character.Head.Anchored = true
	end
end

do -- [[ Joints ]] -- 
	if not Global.HatCollision then
		Asset.Spawn(function()
			for i,v in ipairs(OriginalRigDescendants) do
				Asset.Spawn(function()
					if v.Name ~= "Neck" then
						if v:IsA("Motor6D") or v:IsA("Weld") or v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then
							v:Destroy() 
						end
					end
				end)
			end
		end)
	end
	if RigType == Enum.HumanoidRigType.R15 and Global.R6 then
		Character.DescendantRemoving:Connect(function(p)
			if p.Name == "AccessoryWeld" then
				p:Clone().Parent = p.Parent
			end
		end)
	end
end

do -- [[ Netless Claim ]] -- 
	for i,Part in ipairs(OriginalRigDescendants) do
		Asset.Spawn(function()
			if Part:IsA("BasePart") then
				local NetlessHB

				local BodyVelocity = Instance.new("BodyVelocity")
				BodyVelocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge); BodyVelocity.P = math.huge; BodyVelocity.Velocity = Velocity
				local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
				BodyAngularVelocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); BodyAngularVelocity.P = math.huge; BodyAngularVelocity.AngularVelocity = Part.Name == Global.Fling and Global.EnableSpin and Vector3.new(2147483646,2147483646,2147483646) or Vector3.new(0,0,0)

				Part:ApplyImpulse(Velocity)
				Part.Massless = true
				Part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
				Part.RootPriority = 127

				local selectionbox = Instance.new("SelectionBox")
				selectionbox.Adornee = Part; selectionbox.Transparency = 1; selectionbox.Parent = Part
				BodyVelocity.Parent = Part; BodyAngularVelocity.Parent = Part

				NetlessHB = event:Connect(function()
					if Part and Part.Parent and Part:IsDescendantOf(workspace) then
						--Part:ApplyImpulse(Velocity) [[ Velocity can stack and make parts much more unstable ]]
						Part.Velocity = Velocity
						if BodyAngularVelocity.AngularVelocity == Vector3.new(0,0,0) then
							Part.AssemblyAngularVelocity = Vector3.new()
						end
						if Part.Name == "Head" and not Global.GodMode then
							selectionbox.SurfaceTransparency = 1
						elseif isnetworkowner(Part) then
							selectionbox.SurfaceTransparency = 1
						else
							selectionbox.SurfaceTransparency = 0
						end

						if Global.AllowSleep then 
							sethiddenproperty(Part, "NetworkIsSleeping", false) 
						end
					else
						NetlessHB:Disconnect()
					end
				end)

				table.insert(Events,NetlessHB)
				table.insert(BodyVel,BodyVelocity)

				do -- [[ Find CloneHats ]]
					if Part.Parent:IsA("Accessory") then
						for i,v in ipairs(Character:GetChildren()) do
							if v:IsA("Accessory") then
								local meshid1 = v.Handle:FindFirstChildOfClass("SpecialMesh") or v.Handle
								local meshid2 = Part:FindFirstChildOfClass("SpecialMesh") or Part
								local texture1 = v.Handle:FindFirstChildOfClass("SpecialMesh") and v.Handle:FindFirstChildOfClass("SpecialMesh").TextureId or v.Handle.TextureID
								local texture2 = Part:FindFirstChildOfClass("SpecialMesh") and Part:FindFirstChildOfClass("SpecialMesh").TextureId or Part.TextureID
								if meshid1.MeshId == meshid2.MeshId and texture1 == texture2 then
									local CloneHat = Instance.new("ObjectValue",Part)
									CloneHat.Value = v.Handle
									CloneHat.Name = "CloneHat"
								end
							end
						end
					end
				end
			end
		end)
	end
end

do -- [[ Movement Velocity ]] -- 
	if Global.MovementVelocity then
		table.insert(Events,Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
			local Vector = Character.Humanoid.MoveDirection * Global.Velocity
			local X,Z = Vector.X,Vector.Z
			if Vector.X == 0 and Vector.Z == 0 then X = Global.Velocity Z = Global.Velocity end
			Velocity = Vector3.new(X,0,Z)
			if Velocity.Magnitude < 28 then 
				Velocity = Velocity*(28/Velocity.Magnitude)
			end
			for i,v in ipairs(BodyVel) do
				v.Velocity = Velocity
			end
		end))
	end
end

do -- [[ Collisions ]] -- 
	if PhysicsService then
		for i,v in ipairs(CharacterDescendants) do
			Asset.Spawn(function()
				if v:IsA("BasePart") then
					PhysicsService:SetPartCollisionGroup(v, "NoCollide")
				end
			end)
		end
		for i,v in ipairs(OriginalRigDescendants) do
			Asset.Spawn(function()
				if v:IsA("BasePart") then
					PhysicsService:SetPartCollisionGroup(v, "NoCollide")
				end
			end)
		end
	end
	if not Global.Collisions then
		for i,v in ipairs(CharacterDescendants) do
			Asset.Spawn(function()
				if v:IsA("BasePart") then
					local CollideStep
					CollideStep = RunService.Stepped:Connect(function()
						if v and v.Parent and v:IsDescendantOf(workspace) then
							v.CanCollide = false
						else
							CollideStep:Disconnect()
						end
					end)
					table.insert(Events,CollideStep)
				end
			end)
		end
	end
	for i,v in ipairs(OriginalRigDescendants) do
		Asset.Spawn(function()
			if v:IsA("BasePart") then
				local CollideStep
				CollideStep = RunService.Stepped:Connect(function()
					if v and v.Parent and v:IsDescendantOf(workspace) then
						v.CanCollide = false
					else
						CollideStep:Disconnect()
					end
				end)
				table.insert(Events,CollideStep)
			end
		end)
	end
end

do -- [[ Claim 2; Electric Boogaloo ]] -- 
	if Global.Claim2 then
		Notify("Claim2; Found Pos",3)
		local ClaimTick = tick()
		repeat 
			for i,v in ipairs(OriginalRigDescendants) do
				if v:IsA("BasePart") then
					if v.Name == "Head" and not isnetworkowner(v) then
					else
						v.CFrame = FoundPos
					end
				end
			end
			wait()
		until tick() - ClaimTick >= 1/22+Ping:GetValue()/750
		local A = 0
		Notify("Claim2; Returning Parts",3)
		Asset.Spawn(function()
			repeat 
				for i,v in ipairs(OriginalRigDescendants) do
					if v:IsA("BasePart") then
						if v.Name == "Head" and not isnetworkowner(v) then
						else
							v.CFrame = FoundPos:Lerp(Character.Head.CFrame,A)
						end
					end
				end
				wait()
			until A == 1
		end)
		for i=1,100 do
			A = i/100
			task.wait(1/60)
		end
		Notify("Claim2; Finished",3)
		Character.Head.Anchored = false
	end
end

do -- [[ Reclaim Parts ]] -- 
	local ReclaimPart = function(Part)
		ReclaimingParts = true
		Notify("Attempting to Reclaim " .. Part.Name,5)
		repeat
			for i,v in ipairs(OriginalRigDescendants) do
				if v:IsA("BasePart") and isnetworkowner(v) then
					v.CFrame = Part.CFrame
				end
			end
			wait()
		until isnetworkowner(Part) or not Part:IsDescendantOf(workspace) or not Character
		ReclaimingParts = false
		Notify("Reclaimed " .. Part.Name,5)
	end
	Global.ReclaimPart = ReclaimPart

	if Global.AutoReclaim then
		Asset.Spawn(function()
			while task.wait(1) and Character do
				for i,v in ipairs(OriginalRigDescendants) do
					if v:IsA("BasePart") and not isnetworkowner(v) and v:IsDescendantOf(workspace) then
						if v.Name == "Head" then
						elseif Global.HatCollision and OriginalRig:FindFirstChild("Neck",true) then
						else
							ReclaimPart(v)
							wait()
						end
					end
				end
			end
		end)
	end
end

do -- [[ Keep Fling Part in Statis ]] -- 
	if OriginalRig:FindFirstChild(Global.Fling) then
		Asset.Spawn(function()
			while Claim2 and OriginalRig:FindFirstChild(Global.Fling) do
				OriginalRig[Global.Fling].CFrame = Global.Fling == "HumanoidRootPart" and OriginalRig.Head.CFrame or OriginalRig.HumanoidRootPart.CFrame
				wait()
			end
		end)
	end
end

do -- [[ FakeGod/HatCollisions Hat Replacements ]] -- 
	local function GetHatBodyPart(Table)
		for i,Hat in ipairs(OriginalRigDescendants) do
			if Hat:IsA("Accessory") then
				local Texture = Hat.Handle:FindFirstChildOfClass("SpecialMesh") and Hat.Handle:FindFirstChildOfClass("SpecialMesh").TextureId
				--print(Texture,Hat)
				if not Texture then
					Notify("Error Loading; no mesh?")
					pcall(function() 
						Player.Character = OriginalRig; 
						OriginalRig.Parent = workspace; 
						if Character then Character:Destroy() end
						for i,v in ipairs(Events) do
							v:Disconnect()
						end
						Character = nil
					end) 
				end
				for i,v in ipairs(Table) do
					if v[1] == string.match(Texture,"%d+") then
						table.remove(Table,i)
						return {Hat.Handle,v[2]}
					end
				end
			end
		end
	end

	pcall(function()
		if Global.FakeGod then
			FakeTorso = GetHatBodyPart(TorsoHats)
			FakeHead = GetHatBodyPart(HeadHats)
			if not FakeTorso then
				FakeTorso = GetHatBodyPart(SplitTorsoHats)
				FakeTorso1 = GetHatBodyPart(SplitTorsoHats)

				FakeTorso1[1].CloneHat.Value.Transparency = 1
				FakeTorso1[1]:FindFirstChildOfClass("SpecialMesh"):Destroy();

				FakeTorso1[1].Name = "Fake Torso"
			end
			FakeTorso[1].CloneHat.Value.Transparency = 1
			FakeTorso[1]:FindFirstChildOfClass("SpecialMesh"):Destroy();
			FakeTorso[1].Name = "Fake Torso"

			FakeHead[1].Name = "Fake Head"

			FakeHead[1].Parent = OriginalRig
			FakeTorso[1].Parent = OriginalRig
		end

		if Global.HatCollision then
			FakeTorso = GetHatBodyPart(TorsoHats)
			if not FakeTorso then
				FakeTorso = GetHatBodyPart(SplitTorsoHats)
				FakeTorso1 = GetHatBodyPart(SplitTorsoHats)
				FakeTorso1[1].CloneHat.Value.Transparency = 1
				FakeTorso1[1]:FindFirstChildOfClass("SpecialMesh"):Destroy();
				FakeTorso1[1].Name = "Fake Torso"
			end
			FakeTorso[1].CloneHat.Value.Transparency = 1
			FakeTorso[1]:FindFirstChildOfClass("SpecialMesh"):Destroy();
			FakeTorso[1].Name = "Fake Torso"

			FakeTorso[1].Parent = OriginalRig
		end
	end)
end

do -- [[ Hide Other Character ]] -- 
	for i,v in ipairs(Global.ShowReal and Character:GetChildren() or OriginalRig:GetChildren()) do
		Asset.Spawn(function()
			if v:IsA("BasePart") or v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("Accessory") or v:IsA("Tool") then
				v.Handle.Transparency = 1
			end
		end)
	end
end

do -- [[ Animation ]] -- 
	if Global.AutoAnimate then
		if RigType == Enum.HumanoidRigType.R15 and Global.R6 then
			Asset.Spawn(function() 
				pcall(function() 
					local Figure = Character
					local Animatee = Figure.Animate
					local Torso = Figure:WaitForChild("Torso")
					local RightShoulder = Torso:WaitForChild("Right Shoulder")
					local LeftShoulder = Torso:WaitForChild("Left Shoulder")
					local RightHip = Torso:WaitForChild("Right Hip")
					local LeftHip = Torso:WaitForChild("Left Hip")
					local Neck = Torso:WaitForChild("Neck")
					local Humanoid = Figure:WaitForChild("Humanoid")
					local pose = "Standing"

					local currentAnim = ""
					local currentAnimInstance = nil
					local currentAnimTrack = nil
					local currentAnimKeyframeHandler = nil
					local currentAnimSpeed = 1.0
					local animTable = {}
					local animNames = { 
						idle = 	{	
							{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
							{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
						},
						walk = 	{ 	
							{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
						}, 
						run = 	{
							{ id = "run.xml", weight = 10 } 
						}, 
						jump = 	{
							{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
						}, 
						fall = 	{
							{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
						}, 
						climb = {
							{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
						}, 
						sit = 	{
							{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
						},	
						toolnone = {
							{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
						},
						toolslash = {
							{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
							--				{ id = "slash.xml", weight = 10 } 
						},
						toollunge = {
							{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
						},
						wave = {
							{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
						},
						point = {
							{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
						},
						dance1 = {
							{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
							{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
							{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
						},
						dance2 = {
							{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
							{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
							{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
						},
						dance3 = {
							{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
							{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
							{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
						},
						laugh = {
							{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
						},
						cheer = {
							{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
						},
					}
					local dances = {"dance1", "dance2", "dance3"}

					-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
					local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

					local function configureAnimationSet(name, fileList)
						if (animTable[name] ~= nil) then
							for _, connection in pairs(animTable[name].connections) do
								connection:disconnect()
							end
						end
						animTable[name] = {}
						animTable[name].count = 0
						animTable[name].totalWeight = 0	
						animTable[name].connections = {}

						-- check for config values
						local config = Animatee:FindFirstChild(name)
						if (config ~= nil) then
							--		print("Loading anims " .. name)
							table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
							table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
							local idx = 1
							for _, childPart in pairs(config:GetChildren()) do
								if (childPart:IsA("Animation")) then
									table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
									animTable[name][idx] = {}
									animTable[name][idx].anim = childPart
									local weightObject = childPart:FindFirstChild("Weight")
									if (weightObject == nil) then
										animTable[name][idx].weight = 1
									else
										animTable[name][idx].weight = weightObject.Value
									end
									animTable[name].count = animTable[name].count + 1
									animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
									--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
									idx = idx + 1
								end
							end
						end

						-- fallback to defaults
						if (animTable[name].count <= 0) then
							for idx, anim in pairs(fileList) do
								animTable[name][idx] = {}
								animTable[name][idx].anim = Instance.new("Animation")
								animTable[name][idx].anim.Name = name
								animTable[name][idx].anim.AnimationId = anim.id
								animTable[name][idx].weight = anim.weight
								animTable[name].count = animTable[name].count + 1
								animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
								--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
							end
						end
					end

					-- Setup animation objects
					local function scriptChildModified(child)
						local fileList = animNames[child.Name]
						if (fileList ~= nil) then
							configureAnimationSet(child.Name, fileList)
						end	
					end

					Animatee.ChildAdded:connect(scriptChildModified)
					Animatee.ChildRemoved:connect(scriptChildModified)


					for name, fileList in pairs(animNames) do 
						configureAnimationSet(name, fileList)
					end	

					-- ANIMATION

					-- declarations
					local toolAnim = "None"
					local toolAnimTime = 0

					local jumpAnimTime = 0
					local jumpAnimDuration = 0.3

					local toolTransitionTime = 0.1
					local fallTransitionTime = 0.3
					local jumpMaxLimbVelocity = 0.75

					-- functions

					local function stopAllAnimations()
						local oldAnim = currentAnim

						-- return to idle if finishing an emote
						if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
							oldAnim = "idle"
						end

						currentAnim = ""
						currentAnimInstance = nil
						if (currentAnimKeyframeHandler ~= nil) then
							currentAnimKeyframeHandler:disconnect()
						end

						if (currentAnimTrack ~= nil) then
							currentAnimTrack:Stop()
							currentAnimTrack:Destroy()
							currentAnimTrack = nil
						end
						return oldAnim
					end

					local function setAnimationSpeed(speed)
						if speed ~= currentAnimSpeed then
							currentAnimSpeed = speed
							currentAnimTrack:AdjustSpeed(currentAnimSpeed)
						end
					end

					local playAnimation

					local function keyFrameReachedFunc(frameName)
						if (frameName == "End") then

							local repeatAnim = currentAnim
							-- return to idle if finishing an emote
							if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
								repeatAnim = "idle"
							end

							local animSpeed = currentAnimSpeed
							playAnimation(repeatAnim, 0.0, Humanoid)
							setAnimationSpeed(animSpeed)
						end
					end

					-- Preload animations
					playAnimation = function(animName, transitionTime, humanoid) 

						local roll = math.random(1, animTable[animName].totalWeight) 
						local origRoll = roll
						local idx = 1
						while (roll > animTable[animName][idx].weight) do
							roll = roll - animTable[animName][idx].weight
							idx = idx + 1
						end
						--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
						local anim = animTable[animName][idx].anim

						-- switch animation		
						if (anim ~= currentAnimInstance) then

							if (currentAnimTrack ~= nil) then
								currentAnimTrack:Stop(transitionTime)
								currentAnimTrack:Destroy()
							end

							currentAnimSpeed = 1.0

							-- load it to the humanoid; get AnimationTrack
							currentAnimTrack = humanoid:LoadAnimation(anim)
							currentAnimTrack.Priority = Enum.AnimationPriority.Core

							-- play the animation
							currentAnimTrack:Play(transitionTime)
							currentAnim = animName
							currentAnimInstance = anim

							-- set up keyframe name triggers
							if (currentAnimKeyframeHandler ~= nil) then
								currentAnimKeyframeHandler:disconnect()
							end
							currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)

						end

					end

					-------------------------------------------------------------------------------------------
					-------------------------------------------------------------------------------------------

					local toolAnimName = ""
					local toolAnimTrack = nil
					local toolAnimInstance = nil
					local currentToolAnimKeyframeHandler = nil
					local playToolAnimation

					local function toolKeyFrameReachedFunc(frameName)
						if (frameName == "End") then
							--		print("Keyframe : ".. frameName)	
							playToolAnimation(toolAnimName, 0.0, Humanoid)
						end
					end


					playToolAnimation = function(animName, transitionTime, humanoid, priority)	 

						local roll = math.random(1, animTable[animName].totalWeight) 
						local origRoll = roll
						local idx = 1
						while (roll > animTable[animName][idx].weight) do
							roll = roll - animTable[animName][idx].weight
							idx = idx + 1
						end
						--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
						local anim = animTable[animName][idx].anim

						if (toolAnimInstance ~= anim) then

							if (toolAnimTrack ~= nil) then
								toolAnimTrack:Stop()
								toolAnimTrack:Destroy()
								transitionTime = 0
							end

							-- load it to the humanoid; get AnimationTrack
							toolAnimTrack = humanoid:LoadAnimation(anim)
							if priority then
								toolAnimTrack.Priority = priority
							end

							-- play the animation
							toolAnimTrack:Play(transitionTime)
							toolAnimName = animName
							toolAnimInstance = anim

							currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
						end
					end

					local function stopToolAnimations()
						local oldAnim = toolAnimName

						if (currentToolAnimKeyframeHandler ~= nil) then
							currentToolAnimKeyframeHandler:disconnect()
						end

						toolAnimName = ""
						toolAnimInstance = nil
						if (toolAnimTrack ~= nil) then
							toolAnimTrack:Stop()
							toolAnimTrack:Destroy()
							toolAnimTrack = nil
						end


						return oldAnim
					end

					-------------------------------------------------------------------------------------------
					-------------------------------------------------------------------------------------------


					local function onRunning(speed)
						if speed > 0.01 then
							playAnimation("walk", 0.1, Humanoid)
							if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
								setAnimationSpeed(speed / 14.5)
							end
							pose = "Running"
						else
							if emoteNames[currentAnim] == nil then
								playAnimation("idle", 0.1, Humanoid)
								pose = "Standing"
							end
						end
					end

					local function onDied()
						pose = "Dead"
					end

					local function onJumping()
						playAnimation("jump", 0.1, Humanoid)
						jumpAnimTime = jumpAnimDuration
						pose = "Jumping"
					end

					local function onClimbing(speed)
						playAnimation("climb", 0.1, Humanoid)
						setAnimationSpeed(speed / 12.0)
						pose = "Climbing"
					end

					local function onGettingUp()
						pose = "GettingUp"
					end

					local function onFreeFall()
						if (jumpAnimTime <= 0) then
							playAnimation("fall", fallTransitionTime, Humanoid)
						end
						pose = "FreeFall"
					end

					local function onFallingDown()
						pose = "FallingDown"
					end

					local function onSeated()
						pose = "Seated"
					end

					local function onPlatformStanding()
						pose = "PlatformStanding"
					end

					local function onSwimming(speed)
						if speed > 0 then
							pose = "Running"
						else
							pose = "Standing"
						end
					end

					local function getTool()	
						for _, kid in ipairs(Figure:GetChildren()) do
							if kid.className == "Tool" then return kid end
						end
						return nil
					end

					local function getToolAnim(tool)
						for _, c in ipairs(tool:GetChildren()) do
							if c.Name == "toolanim" and c.className == "StringValue" then
								return c
							end
						end
						return nil
					end

					local function animateTool()

						if (toolAnim == "None") then
							playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
							return
						end

						if (toolAnim == "Slash") then
							playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
							return
						end

						if (toolAnim == "Lunge") then
							playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
							return
						end
					end

					local function moveSit()
						RightShoulder.MaxVelocity = 0.15
						LeftShoulder.MaxVelocity = 0.15
						RightShoulder:SetDesiredAngle(3.14 /2)
						LeftShoulder:SetDesiredAngle(-3.14 /2)
						RightHip:SetDesiredAngle(3.14 /2)
						LeftHip:SetDesiredAngle(-3.14 /2)
					end

					local lastTick = 0

					local function move(time)
						local amplitude = 1
						local frequency = 1
						local deltaTime = time - lastTick
						lastTick = time

						local climbFudge = 0
						local setAngles = false

						if (jumpAnimTime > 0) then
							jumpAnimTime = jumpAnimTime - deltaTime
						end

						if (pose == "FreeFall" and jumpAnimTime <= 0) then
							playAnimation("fall", fallTransitionTime, Humanoid)
						elseif (pose == "Seated") then
							playAnimation("sit", 0.5, Humanoid)
							return
						elseif (pose == "Running") then
							playAnimation("walk", 0.1, Humanoid)
						elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
							--		print("Wha " .. pose)
							stopAllAnimations()
							amplitude = 0.1
							frequency = 1
							setAngles = true
						end

						if (setAngles) then
							local desiredAngle = amplitude * math.sin(time * frequency)

							RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
							LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
							RightHip:SetDesiredAngle(-desiredAngle)
							LeftHip:SetDesiredAngle(-desiredAngle)
						end

						-- Tool Animation handling
						local tool = getTool()
						if tool and tool:FindFirstChild("Handle") then

							local animStringValueObject = getToolAnim(tool)

							if animStringValueObject then
								toolAnim = animStringValueObject.Value
								-- message recieved, delete StringValue
								animStringValueObject.Parent = nil
								toolAnimTime = time + .3
							end

							if time > toolAnimTime then
								toolAnimTime = 0
								toolAnim = "None"
							end

							animateTool()		
						else
							stopToolAnimations()
							toolAnim = "None"
							toolAnimInstance = nil
							toolAnimTime = 0
						end
					end

					-- connect events
					Humanoid.Died:connect(onDied)
					Humanoid.Running:connect(onRunning)
					Humanoid.Jumping:connect(onJumping)
					Humanoid.Climbing:connect(onClimbing)
					Humanoid.GettingUp:connect(onGettingUp)
					Humanoid.FreeFalling:connect(onFreeFall)
					Humanoid.FallingDown:connect(onFallingDown)
					Humanoid.Seated:connect(onSeated)
					Humanoid.PlatformStanding:connect(onPlatformStanding)
					Humanoid.Swimming:connect(onSwimming)

					-- setup emote chat hook
					game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
						local emote = ""
						if msg == "/e dance" then
							emote = dances[math.random(1, #dances)]
						elseif (string.sub(msg, 1, 3) == "/e ") then
							emote = string.sub(msg, 4)
						elseif (string.sub(msg, 1, 7) == "/emote ") then
							emote = string.sub(msg, 8)
						end

						if (pose == "Standing" and emoteNames[emote] ~= nil) then
							playAnimation(emote, 0.1, Humanoid)
						end

					end)


					-- main program

					-- initialize to idle
					playAnimation("idle", 0.1, Humanoid)
					pose = "Standing"

					while Figure.Parent ~= nil and Animatee do
						if not Animatee.Disabled then
							local _, time = wait(0.1)
							move(time)
						end

					end
				end) 
			end)
		else
			Character.Animate.Disabled = true; wait() Character.Animate.Disabled = false
		end
	end
end

do -- [[ Copy CFrames ]] -- 
	if RigType == Enum.HumanoidRigType.R15 and Global.R6 then
		for R6PartName,R15PartNames in pairs(R15Offsets) do
			for i,R15PartNameOffset in pairs(R15PartNames) do
				Asset.Spawn(function()
					if Global.Fling ~= i then
						local partbeat
						partbeat = event:Connect(function(delta)
							if OriginalRig:FindFirstChild(i) then
								if isnetworkowner(OriginalRig[i]) and not ReclaimingParts then
									if i == "Head" and OriginalRig:FindFirstChild("Neck",true) then
									else
										local ExpectedPosition = Character[R6PartName].CFrame * R15PartNameOffset
										OriginalRig[i].CFrame = ExpectedPosition 
									end
								else
									OriginalRig[i].CFrame = OriginalRig.Head.CFrame
								end
							else
								partbeat:Disconnect()
							end
						end)
						table.insert(Events,partbeat)
					end
				end)
			end
		end
		for i,v in pairs(OriginalRigDescendants) do
			if v:IsA("Accessory") then
				local partbeat
				partbeat = event:Connect(function(delta)
					if not ReclaimingParts then
						if v and v.Parent and v:FindFirstChild("Handle") and v:IsDescendantOf(workspace) then
							if isnetworkowner(v.Handle) then
								v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame 
							end
						else
							partbeat:Disconnect()
						end
					else
						v.Handle.CFrame = OriginalRig.Head.CFrame
					end
				end)
				table.insert(Events,partbeat)
			end
		end
	else
		for i,v in pairs(OriginalRigDescendants) do
			Asset.Spawn(function()
				if v:IsA("BasePart") and v.Parent == OriginalRig then
					local partbeat
					partbeat = event:Connect(function(delta)
						if not ReclaimingParts then
							if v and v.Parent and v:IsDescendantOf(workspace) then
								if v.Name == "Fake Head" and isnetworkowner(FakeHead[1]) then
									FakeHead[1].CFrame = Character["Head"].CFrame
								elseif v.Name == "Fake Torso" and isnetworkowner(FakeTorso[1]) then
									if FakeTorso1 and isnetworkowner(FakeTorso1) then
										FakeTorso[1].CFrame = Character["Torso"].CFrame * FakeTorso[2] * CFrame.new(0.5,0,0) 
										FakeTorso1[1].CFrame = Character["Torso"].CFrame * FakeTorso1[2] * CFrame.new(-0.5,0,0) 
									else
										FakeTorso[1].CFrame = Character["Torso"].CFrame * FakeTorso[2]
									end
								elseif isnetworkowner(v) then
									if v.Name == Global.Fling then
									else
										v.CFrame = Character[v.Name].CFrame 
									end
								end
							else
								partbeat:Disconnect()
							end
						else
							v.CFrame = OriginalRig.Head.CFrame
						end
					end)
					table.insert(Events,partbeat)
				elseif v:IsA("Accessory") and v:FindFirstChild("Handle") then
					local partbeat
					partbeat = event:Connect(function(delta)
						if not ReclaimingParts then
							if v and v.Parent and v:FindFirstChild("Handle") and v:IsDescendantOf(workspace) then
								if isnetworkowner(v.Handle) then
									v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame 
								end
							else
								partbeat:Disconnect()
							end
						else
							v.Handle.CFrame = OriginalRig.Head.CFrame
						end
					end)
					table.insert(Events,partbeat)
				end
			end)
		end
	end
	if not Global.Claim2 then
		Claim2 = false
	end
end

do -- [[ Respawn Events ]] -- 
	Character.Humanoid.Died:Connect(function() 
		pcall(function() 
			Player.Character = OriginalRig; 
			OriginalRig.Parent = workspace; 
			if Character then Character:Destroy() end
			for i,v in ipairs(Events) do
				v:Disconnect()
			end
			Character = nil
		end) 
	end)
	Player.CharacterAdded:Connect(function() 
		if Character then Character:Destroy() end
		for i,v in ipairs(Events) do
			v:Disconnect()
		end
		Character = nil
	end) 
end

Notify("Script loaded in " .. tostring(tick() - SpeedTest) .. " Seconds",5)
