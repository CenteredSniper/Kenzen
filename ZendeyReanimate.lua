-- [[ https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330 & nul#3174 ]] --
-- [[ Zendey Reanimate // By ProductionTakeOne#3330 // Additional support from nul#3174 and Iamverybored#9941 ]] --

local SpeedTest = tick()

local Global = getgenv and getgenv() or shared

local R6 = true

do -- [[ Create Global Table ]]
	if not Global['0'] then
		Global['0'] = {}
	end
	Global = Global['0']
end

do -- [[ Default Settings ]] -- 
	local function CheckSetting(Var,DefaultValue)
		if Global[Var] == nil then
			Global[Var] = DefaultValue
		end
	end

	CheckSetting("Velocity",-17.72)
	CheckSetting("VelocityVector",Vector3.new(1,0,1))
	CheckSetting("MovementVelocity",false)

	CheckSetting("SimRadius",true)
	CheckSetting("AutoReclaim",false)
	CheckSetting("AntiSleep",true)

	CheckSetting("Fling","")
	CheckSetting("EnableSpin",false)

	CheckSetting("R15ToR6",true)
	CheckSetting("PartGUI",false)
	CheckSetting("ShowReal",false)

	CheckSetting("PermaDeath",true)
	CheckSetting("PermaDelay",0)

	CheckSetting("Collisions",true)

	CheckSetting("AutoAnimate",true)
	CheckSetting("Notifications",true)
	CheckSetting("GameOptimize",false)
	CheckSetting("AlignsEnabled",false)
	CheckSetting("ArtificialHeartBeat",{"PreRender","PreAnimation","Stepped","Heartbeat"}) -- 
end

do -- [[ Checks ]] --
	if not game:IsLoaded("Workspace") then -- scriptware uses isloaded args
		game.Loaded:Wait()
	end
	if workspace:FindFirstChild(" " .. game.PlaceVersion .. "𝚉𝚎𝚗𝚍𝚎𝚢") then 
		error("Already Reanimated?") 
	end
	if Global.GameOptimize and pcall(function() loadstring("")() end) then
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/GameOptimizer/main/src.lua", true))()
	end
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local RealRig = Player.Character
local RigType = RealRig:WaitForChild("Humanoid").RigType
local RealChildren = RealRig:GetChildren()
local RealDescendants = RealRig:GetDescendants()

local setfflag = setfflag or function(flag,bool) game:DefineFastFlag(flag,bool) end
local isnetworkowner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
local printconsole = printconsole or printuiconsole or print

local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]

local Events = {}
local BaseParts = {}
local Accessories = {}
local BodyVel = {}

local Event = Global.Event
local Velocity = Global.VelocityVector * Global.Velocity

local PartToReclaim = nil

local FakeRig,FakeChildren,sethiddenproperty,Notify

do -- [[ Enabling Extra Runservice Signals ]] --
	pcall(function() setfflag("NewRunServiceSignals", "true") end) 
	pcall(function() setfflag("NewRunServiceSignals", true) end) 
end

do -- [[ Artificial Heartbeat, original by 4eyedfool ]] --
	if not Event then
		local BindEvent = Instance.new("BindableEvent")
		local Tick = tick()
		for _,RunEvent in pairs(Global.ArtificialHeartBeat) do
			RunService[RunEvent]:Connect(function()
				Tick = tick()
				BindEvent:Fire(tick()-Tick)
			end)
		end 
		Event = BindEvent.Event
		Global.Event = BindEvent.Event
	end
end

local function wait(Time)
	if Time and typeof(Time) == "number" and Time > 0 then
		local Tick = tick()
		repeat Event:Wait() until tick() - Tick >= Time
	else
		Event:Wait()
	end
end

do -- [[ SetHiddenProperty Compatability ]]
	local shp = sethiddenproperty or set_hidden_property or sethiddenprop or setscriptable and function(loc,prop,val)
		if not loc then
			return true
		end 
		if not pcall(function() local a = loc[prop] end)  then
			setscriptable(loc,prop,true)
		end 
		loc[prop] = val
	end or function() end

	sethiddenproperty = function(loc,prop,val) -- krnl has a broken sethiddenproperty
		pcall(function()
			shp(loc,prop,val)
		end)
	end
end

do -- [[ Global Variable Fixes ]] -- 
	if Global.Fling == true then
		Global.Fling = "HumanoidRootPart"
	end
	if Global.TorsoFling then 
		if RigType == Enum.HumanoidRigType.R15 then 
			Global.Fling = "LowerTorso" 
		else 
			Global.Fling = "Torso" 
		end 
	end
	if Global.AutoReclaim then
		task.spawn(function()
			Global.AutoReclaim = false
			wait(1)
			Global.AutoReclaim = true
		end)
	end
end

do -- [[ Optimizations ]] -- 
	settings()["Physics"].PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	settings()["Physics"].AllowSleep = false
	settings()["Physics"].ForceCSGv2 = false
	settings()["Physics"].DisableCSGv2 = true
	settings()["Physics"].UseCSGv2 = false
	settings()["Physics"].ThrottleAdjustTime = math.huge

	settings()["Rendering"].QualityLevel = 1

	sethiddenproperty(workspace,"InterpolationThrottling",Enum.InterpolationThrottlingMode.Disabled)

	sethiddenproperty(workspace,"PhysicsSteppingMethod",Enum.PhysicsSteppingMethod.Fixed)
	sethiddenproperty(workspace,"PhysicsSimulationRateReplicator",Enum.PhysicsSimulationRate.Fixed240Hz)
	sethiddenproperty(workspace,"PhysicsSimulationRate",Enum.PhysicsSimulationRate.Fixed240Hz)

	Player.ReplicationFocus = workspace -- probably replicates parts faster
end

do -- [[ Network ]]
	Player.MaximumSimulationRadius=2022
	sethiddenproperty(Player,"SimulationRadius",2022)
	table.insert(Events,RunService.Stepped:Connect(function()
		Player.MaximumSimulationRadius=2022
		sethiddenproperty(Player,"SimulationRadius",2022)
	end))
end

do -- [[ Notification Service, original by quirky anime boy#5506 ]] --
	local notification
	do
		local CoreGui = game:GetService("CoreGui")
		local Debris = game:GetService("Debris")

		notification = function(Arguments)
			task.spawn(function()
				local Text = Arguments.Text or "lorem ipsum"
				local Duration = Arguments.Duration or 5

				-- Instances:

				local ScreenGui = CoreGui:FindFirstChild("Error") or Instance.new("ScreenGui", CoreGui)
				local ErrorMessage = (Instance.new("Frame"))
				local TextSizeConstraint = (Instance.new("UISizeConstraint"))
				local AsspectRatioConstraint = (Instance.new("UIAspectRatioConstraint"))
				local ErrorText = (Instance.new("TextLabel"))
				local TextSizeConstraint_2 = (Instance.new("UITextSizeConstraint"))
				local SizeConstraint = (Instance.new("UISizeConstraint"))
				local ErrorIcon = (Instance.new("ImageLabel"))
				local AsspectRatioConstraint_2 = (Instance.new("UIAspectRatioConstraint"))

				--Properties:

				local Children = ScreenGui:GetChildren()
				for i,v in pairs(Children) do
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
			end)
		end
	end
	Notify = function(title,duration)
		if Global.Notifications then
			notification({
				Text = title,
				Duration = duration
			})
		end
		printconsole("Zendey // "..tostring(title))
	end
end

do -- [[ Create Fake Rig ]]
	if RigType == Enum.HumanoidRigType.R15 and Global.R15ToR6 then
		--Character = loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/R6Rig.lua",true))()--game:GetObjects("rbxassetid://8232772380")[1]:Clone()
		do -- [[ Creating R6 Rig ]] -- 
			local FakeCharacter = Global.R6Rig

			if not Global.R6Rig then
				FakeCharacter = Instance.new("Model")

				local Humanoid = Instance.new("Humanoid")

				local Head = Instance.new("Part")
				local HeadMesh = Instance.new("SpecialMesh")
				local face = Instance.new("Decal")

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

				local FaceCenterAttachment = Instance.new("Attachment")
				local FaceFrontAttachment = Instance.new("Attachment")
				local HairAttachment = Instance.new("Attachment")
				local HatAttachment = Instance.new("Attachment")
				local LeftShoulderAttachment = Instance.new("Attachment")
				local RightShoulderAttachment = Instance.new("Attachment")
				local BodyBackAttachment = Instance.new("Attachment")
				local BodyFrontAttachment = Instance.new("Attachment")
				local LeftCollarAttachment = Instance.new("Attachment")
				local RightCollarAttachment = Instance.new("Attachment")
				local NeckAttachment = Instance.new("Attachment")
				local WaistCenterAttachment = Instance.new("Attachment")
				local WaistFrontAttachment = Instance.new("Attachment")
				local WaistBackAttachment = Instance.new("Attachment")

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

				FakeCharacter.Name = " "
				FakeCharacter.PrimaryPart = Head

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

				Idle.Name = "idle"

				FaceFrontAttachment.Position = Vector3.new(0,0,-0.6)
				FaceFrontAttachment.Name = "FaceFrontAttachment"
				HairAttachment.Position = Vector3.new(0,0.6,0)
				HairAttachment.Name = "HairAttachment"
				HatAttachment.Position = Vector3.new(0,0.6,0)
				HatAttachment.Name = "HatAttachment"
				LeftShoulderAttachment.Position = Vector3.new(0,1,0)
				LeftShoulderAttachment.Name = "LeftShoulderAttachment"
				RightShoulderAttachment.Position = Vector3.new(0,1,0)
				RightShoulderAttachment.Name = "RightShoulderAttachment"
				BodyBackAttachment.Position = Vector3.new(0,0,0.5)
				BodyBackAttachment.Name = "BodyBackAttachment"
				BodyFrontAttachment.Position = Vector3.new(0,0,-0.5)
				BodyFrontAttachment.Name = "BodyFrontAttachment"
				LeftCollarAttachment.Position = Vector3.new(-1,1,0)
				LeftCollarAttachment.Name = "LeftCollarAttachment"
				NeckAttachment.Position = Vector3.new(0,1,0)
				NeckAttachment.Name = "NeckAttachment"
				RightCollarAttachment.Position = Vector3.new(1,1,0)
				RightCollarAttachment.Name = "RightCollarAttachment"
				WaistBackAttachment.Position = Vector3.new(0,-1,0.5)
				WaistBackAttachment.Name = "WaistBackAttachment"
				WaistCenterAttachment.Position = Vector3.new(0,-1,0)
				WaistCenterAttachment.Name = "WaistCenterAttachment"
				WaistFrontAttachment.Position = Vector3.new(0,-1,-0.5)
				WaistFrontAttachment.Name = "WaistFrontAttachment"

				Animation31.Name = "Animation1"
				Animation31.AnimationId = "http://www.roblox.com/asset/?id=180435571"
				NumberValue32.Name = "Weight"
				NumberValue32.Value = 9

				Animation33.Name = "Animation2"
				Animation33.AnimationId = "http://www.roblox.com/asset/?id=180435792"
				NumberValue34.Name = "Weight"
				NumberValue34.Value = 1

				StringValue35.Name = "walk"
				Animation36.Name = "WalkAnim"
				Animation36.AnimationId = "http://www.roblox.com/asset/?id=180426354"

				StringValue37.Name = "run"
				Animation38.Name = "RunAnim"
				Animation38.AnimationId = "http://www.roblox.com/asset/?id=180426354"

				StringValue39.Name = "jump"
				Animation40.Name = "JumpAnim"
				Animation40.AnimationId = "http://www.roblox.com/asset/?id=125750702"

				StringValue41.Name = "climb"
				Animation42.Name = "ClimbAnim"
				Animation42.AnimationId = "http://www.roblox.com/asset/?id=180436334"

				StringValue43.Name = "toolnone"
				Animation44.Name = "ToolNoneAnim"
				Animation44.AnimationId = "http://www.roblox.com/asset/?id=182393478"

				StringValue45.Name = "fall"
				Animation46.Name = "FallAnim"
				Animation46.AnimationId = "http://www.roblox.com/asset/?id=180436148"

				StringValue47.Name = "sit"
				Animation48.Name = "SitAnim"
				Animation48.AnimationId = "http://www.roblox.com/asset/?id=178130996"
				NumberValue49.Name = "ScaleDampeningPercent"
				NumberValue49.Value = 0.4000000059604645

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

				FaceCenterAttachment.Parent = Head
				FaceFrontAttachment.Parent = Head
				HairAttachment.Parent = Head
				HatAttachment.Parent = Head
				LeftShoulderAttachment.Parent = LeftArm
				RightShoulderAttachment.Parent = RightArm
				BodyBackAttachment.Parent = Torso
				BodyFrontAttachment.Parent = Torso
				LeftCollarAttachment.Parent = Torso
				RightCollarAttachment.Parent = Torso
				NeckAttachment.Parent = Torso
				WaistCenterAttachment.Parent = Torso
				WaistFrontAttachment.Parent = Torso
				WaistBackAttachment.Parent = Torso

				RootPart.Parent = FakeCharacter
				Head.Parent = FakeCharacter
				Torso.Parent = FakeCharacter
				LeftArm.Parent = FakeCharacter
				RightArm.Parent = FakeCharacter
				LeftLeg.Parent = FakeCharacter
				RightLeg.Parent = FakeCharacter

				HeadMesh.Parent = Head
				face.Parent = Head

				Neck.Parent = Torso
				RootJoint.Parent = RootPart
				LeftShoulder.Parent = Torso
				RightShoulder.Parent = Torso
				LeftHip.Parent = Torso
				RightHip.Parent = Torso

				Animate.Parent = FakeCharacter
				Idle.Parent = Animate
				Animation31.Parent = Idle
				NumberValue32.Parent = Animation31
				Animation33.Parent = Idle
				NumberValue34.Parent = Animation33
				StringValue35.Parent = Animate
				Animation36.Parent = StringValue35
				StringValue37.Parent = Animate
				Animation38.Parent = StringValue37
				StringValue39.Parent = Animate
				Animation40.Parent = StringValue39
				StringValue41.Parent = Animate
				Animation42.Parent = StringValue41
				StringValue43.Parent = Animate
				Animation44.Parent = StringValue43
				StringValue45.Parent = Animate
				Animation46.Parent = StringValue45
				StringValue47.Parent = Animate
				Animation48.Parent = StringValue47
				NumberValue49.Parent = Animate

				BodyColors50.Parent = FakeCharacter

				Humanoid.Parent = FakeCharacter

				warn(LeftShoulderAttachment:GetFullName())
			end
			FakeRig = FakeCharacter:Clone()
		end
		FakeRig.Parent = workspace
		--Notify("Applying Character Description",3)
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
			FakeRig.Humanoid:ApplyDescription(HumanoidDescription) --RealRig:FindFirstChild("HumanoidDescription",true) or 
		end
		FakeRig:PivotTo(RealRig.HumanoidRootPart.CFrame)
	else
		Player.Character.Archivable = true
		FakeRig = Player.Character:Clone()
		Player.Character.Archivable = false
		FakeRig:WaitForChild("Humanoid"):RemoveAccessories()
		FakeRig.Parent = workspace
	end
end

--wait()
FakeRig.Name = " " .. game.PlaceVersion .. "𝚉𝚎𝚗𝚍𝚎𝚢"
FakeChildren = FakeRig:GetChildren()

local OriginCameraCFrame = workspace.CurrentCamera.CFrame

RealRig.Parent = FakeRig
Player.Character = FakeRig

do -- [[ Set CloneRig and RealRig Globals ]]
	Global.RealRig = RealRig
	Global.CloneRig = FakeRig
	local Global = getgenv and getgenv() or shared['0']
	Global.RealRig = RealRig
	Global.CloneRig = FakeRig
end

do -- [[ Set Character States ]] -- 
	if Global.PermaDeath then
		task.spawn(function()
			--task.wait(Players.RespawnTime+Ping:GetValue()/750)
			wait(Players.RespawnTime+Global.PermaDelay+Ping:GetValue()/750)
			if Global.R6HatCollision then
				for i,v in pairs({RealRig.HumanoidRootPart,RealRig.Torso,RealRig["Body Colors"]}) do
					v.Parent = nil
				end
			else
				local neck = RealRig:FindFirstChild("Neck",true)
				if RealRig:FindFirstChild("Neck",true) then 
					RealRig.Humanoid:ChangeState(15)
					neck.Parent = nil
					Notify("Permadeath On",6) 
				end
			end
		end)
	end
	RealRig.Humanoid:ChangeState(16)
	FakeRig.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	workspace.CurrentCamera.CameraSubject = FakeRig.Humanoid
	task.spawn(function()
		RunService.RenderStepped:Wait()
		workspace.CurrentCamera.CFrame = OriginCameraCFrame
	end)
	pcall(function() RealRig.Head.FaceCenterAttachment:Destroy() end)
end

do -- [[ Joints ]] -- 
	if not Global.R6HatCollision then
		task.spawn(function()
			for i,v in pairs(RealDescendants) do
				task.spawn(function()
					if v.Name ~= "Neck" then
						if v:IsA("Motor6D") or v:IsA("Weld") and v.Name ~= "AccessoryWeld" or v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then
							v:Destroy() 
						end
					end
				end)
			end
		end)
	end
	task.spawn(function()
		wait()
		if RigType == Enum.HumanoidRigType.R15 and Global.R15ToR6 then
			table.insert(Events,FakeRig.DescendantRemoving:Connect(function(p)
				if p.Name == "AccessoryWeld" then
					p:Clone().Parent = p.Parent
				end
			end))
		end
	end)
end

do -- [[ Create Dictionaries ]]
	for i,v in pairs(RealChildren) do
		task.spawn(function()
			if v:IsA("BasePart") then
				if RigType == Enum.HumanoidRigType.R15 and Global.R15ToR6 then
					if v.Name == "LeftUpperArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Arm"),CFrame.new((1-RealRig.LeftUpperArm.Size.X)*2,0.369*(RealRig.LeftUpperArm.Size.Y/1.169),0)}
					elseif v.Name == "LeftLowerArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Arm"),CFrame.new(-(1-RealRig.LeftLowerArm.Size.X)*2,-0.224*(RealRig.LeftLowerArm.Size.Y/1.052),0)}
					elseif v.Name == "LeftHand" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Arm"),CFrame.new((1-RealRig.LeftHand.Size.X)*2,-0.85*(RealRig.LeftHand.Size.Y/0.3),0)}
					elseif v.Name == "RightUpperArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Arm"),CFrame.new((1-RealRig.RightUpperArm.Size.X)*2,0.369*(RealRig.RightUpperArm.Size.Y/1.169),0)}
					elseif v.Name == "RightLowerArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Arm"),CFrame.new(-(1-RealRig.RightLowerArm.Size.X)*2,-0.224*(RealRig.RightLowerArm.Size.Y/1.052),0)}
					elseif v.Name == "RightHand" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Arm"),CFrame.new((1-RealRig.RightHand.Size.X)*2,-0.85*(RealRig.RightHand.Size.Y/0.3),0)}
					elseif v.Name == "LeftUpperLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Leg"),CFrame.new((1-RealRig.LeftUpperLeg.Size.X)/2,0.579*(RealRig.LeftUpperLeg.Size.Y/1.217),0)}
					elseif v.Name == "LeftLowerLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Leg"),CFrame.new((1-RealRig.LeftLowerLeg.Size.X)/2,-0.201*(RealRig.LeftLowerLeg.Size.Y/1.193),0)}
					elseif v.Name == "LeftFoot" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Leg"),CFrame.new((1-RealRig.LeftFoot.Size.X)/2,-0.85*(RealRig.LeftFoot.Size.Y/0.3),0)}
					elseif v.Name == "RightUpperLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Leg"),CFrame.new((1-RealRig.RightUpperLeg.Size.X)/2,0.579*(RealRig.RightUpperLeg.Size.Y/1.217),0)}
					elseif v.Name == "RightLowerLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Leg"),CFrame.new((1-RealRig.RightLowerLeg.Size.X)/2,-0.201*(RealRig.RightLowerLeg.Size.Y/1.193),0)}
					elseif v.Name == "RightFoot" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Leg"),CFrame.new((1-RealRig.RightFoot.Size.X)/2,-0.85*(RealRig.RightFoot.Size.Y/0.3),0)}
					elseif v.Name == "UpperTorso" then
						BaseParts[v] = {FakeRig:FindFirstChild("Torso"),CFrame.new(0,0.2*(RealRig.UpperTorso.Size.Y/1.6),0)}
					elseif v.Name == "LowerTorso" then
						BaseParts[v] = {FakeRig:FindFirstChild("Torso"),CFrame.new(0,-0.8*(RealRig.LowerTorso.Size.Y/0.4),0)}
					elseif v.Name == "HumanoidRootPart" then
						BaseParts[v] = {FakeRig:FindFirstChild("HumanoidRootPart"),CFrame.new()}
					elseif v.Name == "Head" then
						BaseParts[v] = {FakeRig:FindFirstChild("Head"),CFrame.new()}
					end
				else
					BaseParts[v] = {FakeRig:FindFirstChild(v.Name),CFrame.new()}
				end
			elseif v:IsA("Accessory") and v:FindFirstChild("Handle") then
				local Clone = v:Clone()
				Accessories[v:WaitForChild("Handle")] = {Clone:WaitForChild("Handle"),CFrame.new()}
				local Weld = Clone:WaitForChild("Handle"):FindFirstChild("AccessoryWeld")
				Weld.Part1 = Weld.Part1.Name == "UpperTorso" and FakeRig.Torso
					or Weld.Part1.Name == "LowerTorso" and FakeRig.Torso
					or Weld.Part1.Name == "Head" and FakeRig.Head
					or Weld.Part1.Name == "RightUpperArm" and FakeRig["Right Arm"]
					or Weld.Part1.Name == "LeftUpperArm" and FakeRig["Left Arm"]
					or FakeRig:FindFirstChild(Weld.Part1.Name)
				v.Handle.AccessoryWeld:Destroy()
				Clone.Parent = FakeRig
			end
		end)
	end
end

do -- [[ Part Manipulation ]]
	for _,v in pairs({BaseParts,Accessories}) do
		for Part,v in pairs(v) do
			task.spawn(function()
				local NetlessHB,IsOwnerHB,Collisions,BodyAngularVelocity
				local IsOwner = true

				if Global.AlignsEnabled then
					local Attach0 = Instance.new("Attachment"); do
						Attach0.Parent = Part
					end
					local Attach1 = Instance.new("Attachment"); do
						Attach1.CFrame = v[2]
						Attach1.Parent = v[1]
					end
					local Position = Instance.new("AlignPosition"); do
						Position.Attachment0 = Attach0 
						Position.Attachment1 = Attach1
						Position.MaxForce = math.huge; 
						Position.Responsiveness = 200;
						Position.Parent = Part
					end
					local Orientation = Instance.new("AlignOrientation"); do
						Orientation.Attachment0 = Attach0 
						Orientation.Attachment1 = Attach1
						Orientation.MaxTorque = math.huge; 
						Orientation.Responsiveness = 200;
						Orientation.Parent = Part
					end
				else
					local BodyVelocity = Instance.new("BodyVelocity"); do
						BodyVelocity.MaxForce = Vector3.new(1,1,1) * math.huge; 
						BodyVelocity.P = math.huge; 
						BodyVelocity.Velocity = Velocity;
						BodyVelocity.Parent = Part;
					end
					BodyAngularVelocity = Instance.new("BodyAngularVelocity"); do
						BodyAngularVelocity.MaxTorque = Vector3.new(1,1,1) * math.huge;
						BodyAngularVelocity.P = math.huge; 
						BodyAngularVelocity.AngularVelocity = Part.Name == Global.Fling and Global.EnableSpin and Vector3.new(2147483646,2147483646,2147483646) or Vector3.new(0,0,0)
						BodyAngularVelocity.Parent = Part
					end
					table.insert(BodyVel,BodyVelocity)
				end

				Part:ApplyImpulse(Velocity)
				Part.Massless = true
				Part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
				Part.RootPriority = 127

				local SelectionBox = Instance.new("SelectionBox"); do
					SelectionBox.Adornee = Part; 
					SelectionBox.Transparency = 1; 
					SelectionBox.Parent = Part
				end
				
				NetlessHB = Event:Connect(function()
					if Part and Part.Parent and v[1] and v[1].Parent then
						Part:ApplyImpulse(Velocity) -- https://fflag.eryn.io/history/PCDesktopClient/DFFlagSimApplyImpulseTakeOwnership
						Part.Velocity = Velocity

						if IsOwner and not Global.AlignsEnabled then
							if Global.Fling == Part.Name then
							elseif PartToReclaim then
								Part.CFrame = PartToReclaim.CFrame
							else
								Part.CFrame = v[1].CFrame * v[2]
							end
						end

						if BodyAngularVelocity then
							Part.AssemblyAngularVelocity = BodyAngularVelocity.AngularVelocity
						end

						if Part.Name == "Head" and not Global.GodMode then
							SelectionBox.SurfaceTransparency = 1
						elseif IsOwner then
							SelectionBox.SurfaceTransparency = 1
						else
							SelectionBox.SurfaceTransparency = 0
						end

						if Global.AllowSleep then 
							sethiddenproperty(Part, "NetworkIsSleeping", false) 
						end
					else
						NetlessHB:Disconnect()
					end
				end)

				Collisions = RunService.Stepped:Connect(function()
					if Part and Part.Parent then
						Part.CanCollide = false
						if not Global.Collisions and v[1] and v[1].Parent then
							v[1].CanCollide = false
						end
					else
						Collisions:Disconnect()
					end
				end)

				IsOwnerHB = RunService.Stepped:Connect(function()
					if Part and Part.Parent then
						IsOwner = isnetworkowner(Part)
						if Global.AutoReclaim and not IsOwner and not PartToReclaim and Part.Name ~= "Head" then
							PartToReclaim = Part
							repeat wait() until isnetworkowner(Part) or not Part or not Part.Parent
							PartToReclaim = nil
						end
					else
						IsOwnerHB:Disconnect()
					end
				end)

				table.insert(Events,IsOwnerHB)
				table.insert(Events,NetlessHB)
				table.insert(Events,Collisions)
			end)
		end
	end
end

do -- [[ Hide Other Character ]] -- 
	for i,v in pairs(Global.ShowReal and FakeChildren or RealChildren) do
		task.spawn(function()
			if v:IsA("BasePart") or v:IsA("Decal") then
				v.Transparency = 0.9999999
			elseif v:IsA("Accessory") or v:IsA("Tool") then
				v.Handle.Transparency = 0.9999999
			end
		end)
	end
end

do -- [[ Animation ]] -- 
	if Global.AutoAnimate then
		if RigType == Enum.HumanoidRigType.R15 and Global.R15ToR6 then
			task.spawn(function() 
				pcall(function() 
					local Figure = FakeRig
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

					table.insert(Events,Animatee.ChildAdded:connect(scriptChildModified))
					table.insert(Events,Animatee.ChildRemoved:connect(scriptChildModified))


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
						if not Animatee.Disabled then
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
								table.insert(Events,currentAnimKeyframeHandler)
							end
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
							table.insert(Events,currentToolAnimKeyframeHandler)
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
						for _, kid in pairs(Figure:GetChildren()) do
							if kid.className == "Tool" then return kid end
						end
						return nil
					end

					local function getToolAnim(tool)
						for _, c in pairs(tool:GetChildren()) do
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
					table.insert(Events,Humanoid.Died:connect(onDied))
					table.insert(Events,Humanoid.Running:connect(onRunning))
					table.insert(Events,Humanoid.Jumping:connect(onJumping))
					table.insert(Events,Humanoid.Climbing:connect(onClimbing))
					table.insert(Events,Humanoid.GettingUp:connect(onGettingUp))
					table.insert(Events,Humanoid.FreeFalling:connect(onFreeFall))
					table.insert(Events,Humanoid.FallingDown:connect(onFallingDown))
					table.insert(Events,Humanoid.Seated:connect(onSeated))
					table.insert(Events,Humanoid.PlatformStanding:connect(onPlatformStanding))
					table.insert(Events,Humanoid.Swimming:connect(onSwimming))

					-- setup emote chat hook
					table.insert(Events,Player.Chatted:connect(function(msg)
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

					end))


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
			FakeRig.Animate.Disabled = true; FakeRig.Animate.Disabled = false
		end
	end
end

do -- [[ Movement Velocity ]]
	if Global.MovementVelocity then 
		table.insert(Events,RunService.Stepped:Connect(function()
			local Direction = FakeRig.HumanoidRootPart.Velocity*Global.Velocity
			Velocity = Direction == Vector3.new() and Global.VelocityVector * Global.Velocity or Direction*(25.06/Direction.Magnitude)
			for i,v in pairs(BodyVel) do v.Velocity = Velocity end
		end))
	end
end

do -- [[ Respawn Events ]] -- 
	table.insert(Events,FakeRig.Humanoid.Died:Connect(function() 
		pcall(function() 
			Player.Character = RealRig; 
			RealRig.Parent = workspace; 
			if FakeRig then FakeRig:Destroy() end
			for i,v in pairs(Events) do
				v:Disconnect()
			end
			FakeRig = nil
		end) 
	end))
	table.insert(Events,Player.CharacterAdded:Connect(function() 
		if FakeRig then FakeRig:Destroy() end
		for i,v in pairs(Events) do
			v:Disconnect()
		end
		FakeRig = nil
	end))
end

Notify("Netted in " .. string.sub(tostring(tick()-SpeedTest),1,string.find(tostring(tick()-SpeedTest),".")+5),3)
