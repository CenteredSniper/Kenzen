-- [[ https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330 & nul#3174 ]] --
-- [[ Zendey Reanimate // By ProductionTakeOne#3330 // Additional support from nul#3174 and Iamverybored#9941 ]] --

local SpeedTest = tick()

local Global = getgenv and getgenv() or shared

do -- [[ Default Settings ]] -- 
	local function CheckSetting(Var,DefaultValue)
		if Global[Var] == nil then
			Global[Var] = DefaultValue
		end
	end

	CheckSetting("Velocity",-17.72)
	CheckSetting("VelocityVector",Vector3.new(1,0,1))
	CheckSetting("MovementVelocity",false)
	CheckSetting("WhitelistHead",true)
	CheckSetting("EnsureClaim",false)

	CheckSetting("SimRadius",true)
	CheckSetting("AutoReclaim",false)
	CheckSetting("AntiSleep",true)

	CheckSetting("Fling","")
	CheckSetting("EnableSpin",false)

	CheckSetting("R15ToR6",true)
	CheckSetting("R15ToR6M2",false)
	CheckSetting("PartText",true)
	CheckSetting("PartGUI",false)
	CheckSetting("ShowReal",false)
	CheckSetting("DestroyHatWelds",true)
	CheckSetting("R15AdjustOffsets",true)

	CheckSetting("PermaDeath",true)
	CheckSetting("PermaDelay",0)
	CheckSetting("Headless",false)
	CheckSetting("Healthless",false)
	CheckSetting("RejectCharacterDeletionsPatch",false)

	CheckSetting("Collisions",true)
	CheckSetting("TorsoDelayFix",true)
	CheckSetting("AntiVoid",false)
	CheckSetting("AutoAnimate",true)
	CheckSetting("Notifications",true)
	CheckSetting("GameOptimize",false)
	CheckSetting("MultiThread",true)
	CheckSetting("AlignsEnabled",false)
	CheckSetting("ArtificialHeartBeat",{"PreRender","PreAnimation","PreSimulation","PostSimulation"})
end

do -- [[ Checks ]] --
	if not game:IsLoaded("Workspace") then -- scriptware uses isloaded args
		game.Loaded:Wait()
	end
	if workspace:FindFirstChild(" " .. game.PlaceVersion .. "𝚉𝚎𝚗𝚍𝚎𝚢") then 
		return
	end
	if Global.GameOptimize and pcall(function() loadstring("")() end) then
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/GameOptimizer/main/src.lua", true))()
	end
	if Global.ArtificialHeartBeat == true then
		Global.ArtificialHeartBeat = {"PreRender","PreAnimation","PreSimulation","PostSimulation"}
	end
end

local safecloneref,GetService; do
	local CachedServices = {}

	safecloneref = function(ref)
		if type(ref) ~= "userdata" then
			return nil
		else
			local success, err = pcall(function()
				tostring(ref)
			end)
			if type(ref) == "userdata" and success then
				return cloneref and cloneref(ref) or ref
			else
				return nil
			end
		end
	end

	GetService = function(s)
		if not CachedServices[s] then
			local temp = safecloneref(game:GetService(tostring(s)))
			if temp then
				CachedServices[s] = temp
				return CachedServices[s]
			end
		else
			return CachedServices[s]
		end
	end
end

local Players = GetService("Players")
local RunService = GetService("RunService")
local TweenService = GetService("TweenService")
local Player = getlocalplayer and getlocalplayer() or Players.LocalPlayer

local RealRig = getcharacter and getcharacter() or Player.Character or Player.CharacterAdded:Wait()
local RigType = RealRig:WaitForChild("Humanoid").RigType
local RealChildren = RealRig:GetChildren()
local RealDescendants = RealRig:GetDescendants()

local setfflag = setfflag or function(flag,bool) game:DefineFastFlag(flag,bool) end
local isnetworkowner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
local printconsole = printconsole or printuiconsole or print

local Ping = GetService("Stats").Network.ServerStatsItem["Data Ping"]

local Events = {}
local BaseParts = {}
local Accessories = {}
local BodyVel = {}
local ArtificialSingleEvents,SteppedSingleEvents = {},{}

local Event = Global.Event
local Velocity = Global.VelocityVector * Global.Velocity

local PartToReclaim = nil

local TorsoDelay,HealthHide = 0.026,0

local FakeRig,FakeChildren,sethiddenproperty,Notify

do -- [[ Artificial Heartbeat, original by 4eyedfool ]] --
	if not Event then
		local BindEvent = safecloneref(Instance.new("BindableEvent"))
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
	do -- SingleThreadding
		if not Global.MultiThread then
			table.insert(Events,Event:Connect(function()
				for i,v in pairs(ArtificialSingleEvents) do
					v[1](unpack(v[2]))
				end
			end))
			table.insert(Events,RunService.PreSimulation:Connect(function()
				for i,v in pairs(SteppedSingleEvents) do
					v[1](unpack(v[2]))
				end
			end))
		end
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
		Global.AutoReclaim = false
		task.defer(function()
			wait(1)
			Global.AutoReclaim = true
		end)
	end
	if Global.R15ToR6M2 and not Global.R15ToR6 then
		Global.R15ToR6M2 = false
	end
	if not Global.DestroyHatWelds and RigType == Enum.HumanoidRigType.R6 then
		Global.DestroyHatWelds = true
	end
end

do -- [[ Optimizations ]] -- 
	settings()["Physics"].PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	settings()["Physics"].AllowSleep = false
	settings()["Physics"].ForceCSGv2 = false
	settings()["Physics"].DisableCSGv2 = true
	settings()["Physics"].UseCSGv2 = false
	settings()["Physics"].ThrottleAdjustTime = math.huge

	if Global.GameOptimize then
		settings()["Rendering"].QualityLevel = 1
	end

	sethiddenproperty(workspace,"PhysicsSteppingMethod",Enum.PhysicsSteppingMethod.Fixed)
	sethiddenproperty(workspace,"PhysicsSimulationRateReplicator",Enum.PhysicsSimulationRate.Fixed240Hz)
	sethiddenproperty(workspace,"PhysicsSimulationRate",Enum.PhysicsSimulationRate.Fixed240Hz)
	sethiddenproperty(workspace, "SignalBehavior", "Immediate")

	Player.ReplicationFocus = workspace -- probably replicates parts faster
	workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Disabled
	workspace.Retargeting = "Disabled"
end

math.randomseed(tick())

do -- [[ Network ]]
	Player.MaximumSimulationRadius=math.random(1e9, 2e9)*math.random(1, 25)
	sethiddenproperty(Player,"SimulationRadius",math.random(1e9, 2e9)*math.random(1, 25))
	if Global.MultiThread then
		table.insert(Events,RunService.Stepped:Connect(function()
			Player.MaximumSimulationRadius=math.random(1e9, 2e9)*math.random(1, 25)
			sethiddenproperty(Player,"SimulationRadius",math.random(1e9, 2e9)*math.random(1, 25))
		end))
	else
		table.insert(SteppedSingleEvents,{function()
			Player.MaximumSimulationRadius=math.random(1e9, 2e9)*math.random(1, 25)
			sethiddenproperty(Player,"SimulationRadius",math.random(1e9, 2e9)*math.random(1, 25))
		end,{}})
	end

end

do -- [[ Notification Service, original by quirky anime boy#5506 ]] --
	local notification = Global.ErrorNotify
	if not notification then
		local CoreGui = GetService("CoreGui")
		local Debris = GetService("Debris")

		notification = function(Arguments)
			task.defer(function()
				local Text = Arguments.Text or "lorem ipsum"
				local Duration = Arguments.Duration or 5

				-- Instances:
				local SecureContainer = gethui and gethui() or gethiddengui and gethiddengui() or CoreGui:FindFirstChild("RobloxGui") or CoreGui:FindFirstChildOfClass("ScreenGui") or CoreGui:FindFirstChildOfClass("Folder") or CoreGui
				local ScreenGui = Global.NotificationGUI or SecureContainer:FindFirstChild("Error"); if not ScreenGui then
					ScreenGui = Instance.new("ScreenGui"); do 
						Global.NotificationGUI = ScreenGui
						ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						ScreenGui.Name = "Error"
						ScreenGui.Parent = SecureContainer
					end
				end

				local ErrorMessage = safecloneref(Instance.new("Frame"))
				local TextSizeConstraint = safecloneref(Instance.new("UISizeConstraint"))
				local AsspectRatioConstraint = safecloneref(Instance.new("UIAspectRatioConstraint"))
				local ErrorText = safecloneref(Instance.new("TextLabel"))
				local TextSizeConstraint_2 = safecloneref(Instance.new("UITextSizeConstraint"))
				local SizeConstraint = safecloneref(Instance.new("UISizeConstraint"))
				local ErrorIcon = safecloneref(Instance.new("ImageLabel"))
				local AsspectRatioConstraint_2 = (Instance.new("UIAspectRatioConstraint"))

				--Properties:

				local Children = ScreenGui:GetChildren()
				for i,v in pairs(Children) do
					local Tween = TweenService:Create(v,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(ErrorMessage.Position.X.Scale, 0, .1, (i*v.AbsoluteSize.Y*1.2))})
					Tween:Play()
				end

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
		Global.ErrorNotify = notification
	end
	Notify = function(title,duration)
		printconsole("Zendey // "..tostring(title))
		if Global.Notifications then
			notification({
				Text = title,
				Duration = duration
			})
		end
	end
end

if Global.EnsureClaim then
	local pos = RealRig.HumanoidRootPart.CFrame
	RealRig:MoveTo(pos.Position+Vector3.new(0,50,0))
	wait(0.1)
	task.defer(function()
		wait(0.1)
		FakeRig.HumanoidRootPart.CFrame = pos
	end)
end

do -- [[ Create Fake Rig ]]
	if RigType == Enum.HumanoidRigType.R15 and Global.R15ToR6 then
		--Character = loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/R6Rig.lua",true))()--game:GetObjects("rbxassetid://8232772380")[1]:Clone()
		do -- [[ Creating R6 Rig ]] -- 
			local FakeCharacter = Global.R6Rig

			if not Global.R6Rig then
				local function Create(Name,Properties)
					local NewInstance = safecloneref(Instance.new(Name)); do
						for i,v in pairs(Properties) do
							NewInstance[i] = v
						end
					end return NewInstance
				end

				FakeCharacter = Create("Model",{})

				local Head = Create("Part",{Size=Vector3.new(2, 1, 1),Name="Head",Parent=FakeCharacter}); do
					Create("SpecialMesh",{Scale=Vector3.new(1.25, 1.25, 1.25),Parent=Head})
					Create("Decal",{Texture="rbxasset://textures/face.png",Name="face",Parent=Head})
					FakeCharacter.PrimaryPart = Head 
				end
				local Torso = Create("Part",{Size=Vector3.new(2, 2, 1),Name="Torso",Parent=FakeCharacter})
				local Root = Torso:Clone(); Root.Transparency = 1; Root.Name = "HumanoidRootPart"; Root.Parent = FakeCharacter
				local LeftLeg = Create("Part",{Size=Vector3.new(1, 2, 1),Name="Left Leg",Parent=FakeCharacter})
				local RightLeg = Create("Part",{Size=Vector3.new(1, 2, 1),Name="Right Leg",Parent=FakeCharacter})
				local LeftArm = Create("Part",{Size=Vector3.new(1, 2, 1),Name="Left Arm",Parent=FakeCharacter})
				local RightArm = Create("Part",{Size=Vector3.new(1, 2, 1),Name="Right Arm",Parent=FakeCharacter})

				local RightShoulder = Create("Motor6D",{Name="Right Shoulder",MaxVelocity=0.1,C0=CFrame.new(1, 0.5, 0) * CFrame.Angles(0, math.rad(90), 0),C1=CFrame.new(-0.5, 0.5, 0)* CFrame.Angles(0, math.rad(90), 0),Part0=Torso,Part1=RightArm,Parent=Torso})
				local LeftShoulder = RightShoulder:Clone(); LeftShoulder.Name="Left Shoulder"; LeftShoulder.C0=CFrame.new(-1, 0.5, 0) * CFrame.Angles(0, -math.rad(90), 0); LeftShoulder.C1=CFrame.new(0.5, 0.5, 0) * CFrame.Angles(0, -math.rad(90), 0); LeftShoulder.Part1=LeftArm; LeftShoulder.Parent=Torso
				local RightHip = RightShoulder:Clone(); RightHip.Name="Right Hip"; RightHip.C0=CFrame.new(1, -1, 0) * CFrame.Angles(0, math.rad(90), 0); RightHip.C1=CFrame.new(0.5, 1, 0) * CFrame.Angles(0, math.rad(90), 0); RightHip.Part1=RightLeg; RightHip.Parent=Torso
				local LeftHip = RightShoulder:Clone(); LeftHip.Name="Left Hip"; LeftHip.C0=CFrame.new(-1, -1, 0) * CFrame.Angles(0, -math.rad(90), 0); LeftHip.C1=CFrame.new(-0.5, 1, 0) * CFrame.Angles(0, -math.rad(90), 0); LeftHip.Part1=LeftLeg; LeftHip.Parent=Torso
				local Neck = RightShoulder:Clone(); Neck.Name="Neck"; Neck.C0=CFrame.new(0, 1, 0)*CFrame.Angles(-math.rad(90),0,-math.rad(180)); Neck.C1=CFrame.new(0, -0.5, 0)*CFrame.Angles(-math.rad(90),0,-math.rad(180)); Neck.Part1=Head; Neck.Parent=Torso
				local RootJoint = RightShoulder:Clone(); RootJoint.Name="RootJoint"; RootJoint.C0=CFrame.Angles(-math.rad(90),0,-math.rad(180)); RootJoint.C1=CFrame.Angles(-math.rad(90),0,-math.rad(180)); RootJoint.Part0=Root; RootJoint.Part1=Torso; RootJoint.Parent=Root

				local FaceCenterAttachment = Create("Attachment",{Axis=Vector3.new(1,0,0),SecondaryAxis=Vector3.new(0,1,0),Name="FaceCenterAttachment",Parent=Head})
				local FaceFrontAttachment = FaceCenterAttachment:Clone(); FaceFrontAttachment.Name="FaceFrontAttachment" FaceFrontAttachment.Position = Vector3.new(0, 0, -0.6); FaceFrontAttachment.Parent = Head
				local HairAttachment = FaceCenterAttachment:Clone(); HairAttachment.Name="HairAttachment" HairAttachment.Position = Vector3.new(0, 0.6, 0); HairAttachment.Parent = Head
				local HatAttachment = FaceCenterAttachment:Clone(); HatAttachment.Name="HatAttachment" HatAttachment.Position = Vector3.new(0, 0.6, 0); HatAttachment.Parent = Head
				local RootAttachment = FaceCenterAttachment:Clone(); RootAttachment.Name="RootAttachment" RootAttachment.Position = Vector3.new(0, 0, 0); RootAttachment.Parent = Root
				local RightGripAttachment = FaceCenterAttachment:Clone(); RightGripAttachment.Name="RightGripAttachment" RightGripAttachment.Position = Vector3.new(0, -1, 0); RightGripAttachment.Parent = RightArm
				local RightShoulderAttachment = FaceCenterAttachment:Clone(); RightShoulderAttachment.Name="RightShoulderAttachment" RightShoulderAttachment.Position = Vector3.new(0, 1, 0); RightShoulderAttachment.Parent = RightArm
				local LeftGripAttachment = FaceCenterAttachment:Clone(); LeftGripAttachment.Name="LeftGripAttachment" LeftGripAttachment.Position = Vector3.new(0, -1, 0); LeftGripAttachment.Parent = LeftLeg
				local LeftShoulderAttachment = FaceCenterAttachment:Clone(); LeftShoulderAttachment.Name="LeftShoulderAttachment" LeftShoulderAttachment.Position = Vector3.new(0, 1, 0); LeftShoulderAttachment.Parent = LeftArm
				local LeftFootAttachment = FaceCenterAttachment:Clone(); LeftFootAttachment.Name="LeftFootAttachment" LeftFootAttachment.Position = Vector3.new(0, -1, 0); LeftFootAttachment.Parent = LeftArm
				local RightFootAttachment = FaceCenterAttachment:Clone(); RightFootAttachment.Name="RightFootAttachment" RightFootAttachment.Position = Vector3.new(0, -1, 0); RightFootAttachment.Parent = RightLeg
				local BodyBackAttachment = FaceCenterAttachment:Clone(); BodyBackAttachment.Name="BodyBackAttachment" BodyBackAttachment.Position = Vector3.new(0, 0, 0.5); BodyBackAttachment.Parent = Torso
				local BodyFrontAttachment = FaceCenterAttachment:Clone(); BodyFrontAttachment.Name="BodyFrontAttachment" BodyFrontAttachment.Position = Vector3.new(0, 0, -0.5); BodyFrontAttachment.Parent = Torso
				local LeftCollarAttachment = FaceCenterAttachment:Clone(); LeftCollarAttachment.Name="LeftCollarAttachment" LeftCollarAttachment.Position = Vector3.new(-1, 1, 0); LeftCollarAttachment.Parent = Torso
				local NeckAttachment = FaceCenterAttachment:Clone(); NeckAttachment.Name="NeckAttachment" NeckAttachment.Position = Vector3.new(0, 1, 0); NeckAttachment.Parent = Torso
				local RightCollarAttachment = FaceCenterAttachment:Clone(); RightCollarAttachment.Name="RightCollarAttachment" RightCollarAttachment.Position = Vector3.new(1, 1, 0); RightCollarAttachment.Parent = Torso
				local WaistBackAttachment = FaceCenterAttachment:Clone(); WaistBackAttachment.Name="WaistBackAttachment" WaistBackAttachment.Position = Vector3.new(0, -1, 0.5); WaistBackAttachment.Parent = Torso
				local WaistCenterAttachment = FaceCenterAttachment:Clone(); WaistCenterAttachment.Name="WaistCenterAttachment" WaistCenterAttachment.Position = Vector3.new(0, -1, 0); WaistCenterAttachment.Parent = Torso
				local WaistFrontAttachment = FaceCenterAttachment:Clone(); WaistFrontAttachment.Name="WaistFrontAttachment" WaistFrontAttachment.Position = Vector3.new(0, -1, -0.5); WaistFrontAttachment.Parent = Torso

				Create("LocalScript",{Name="Animate",Parent=FakeCharacter})
				Create("BodyColors",{Parent=FakeCharacter})
				Create("Humanoid",{Parent=FakeCharacter})



				Global.R6Rig = FakeCharacter
			end
			FakeRig = FakeCharacter:Clone()
		end
		FakeRig.Parent = workspace
		--Notify("Applying Character Description",3)
		do -- [[ Applying Appearance ]] -- 
			local HumanoidDescription = RealRig:WaitForChild("Humanoid"):FindFirstChild("HumanoidDescription") or Players:GetHumanoidDescriptionFromUserId(Player.UserId)
			if HumanoidDescription.Head == 0 and HumanoidDescription.LeftArm == 0 and HumanoidDescription.LeftLeg == 0 and HumanoidDescription.RightArm == 0 and HumanoidDescription.RightLeg == 0 and HumanoidDescription.Torso == 0 then
				FakeRig.Head.face.Texture = RealRig.Head.face.Texture
				if RealRig:FindFirstChild("Shirt") then RealRig.Shirt:Clone().Parent = FakeRig end
				if RealRig:FindFirstChild("Pants") then RealRig.Pants:Clone().Parent = FakeRig end
				if RealRig:FindFirstChild("Shirt Graphic") then RealRig["Shirt Graphic"]:Clone().Parent = FakeRig end
				if FakeRig:FindFirstChild("BodyColors") then
					if RealRig:FindFirstChild("BodyColors") then 
						FakeRig.BodyColors:Destroy() 
						RealRig.BodyColors:Clone().Parent = FakeRig
					else
						FakeRig.BodyColors.HeadColor = HumanoidDescription.HeadColor
						FakeRig.BodyColors.LeftArmColor = HumanoidDescription.LeftArmColor
						FakeRig.BodyColors.LeftLegColor = HumanoidDescription.LeftLegColor
						FakeRig.BodyColors.RightArmColor = HumanoidDescription.RightArmColor
						FakeRig.BodyColors.RightLegColor = HumanoidDescription.RightLegColor
						FakeRig.BodyColors.TorsoColor = HumanoidDescription.TorsoColor
					end
				else
					FakeRig.Head.Color = HumanoidDescription.HeadColor
					FakeRig["Left Arm"].Color = HumanoidDescription.LeftArmColor
					FakeRig["Left Leg"].Color = HumanoidDescription.LeftLegColor
					FakeRig["Right Arm"].Color = HumanoidDescription.RightArmColor
					FakeRig["Right Leg"].Color = HumanoidDescription.RightLegColor
					FakeRig.Torso.Color = HumanoidDescription.TorsoColor
				end
			else
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
		end
		FakeRig:PivotTo(RealRig.HumanoidRootPart.CFrame)
	else
		Player.Character.Archivable = true
		FakeRig = Player.Character:Clone()
		Player.Character.Archivable = false

		for i,v in pairs(FakeRig:GetChildren()) do if v:IsA("Accessory") or v:IsA("Tool") then v:Destroy() end end
		--FakeRig:WaitForChild("Humanoid"):RemoveAccessories()
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
end

do -- [[ Set Character States ]] -- 
	if Global.PermaDeath then
		task.defer(function()
			--task.wait(Players.RespawnTime+Ping:GetValue()/750)
			wait(Players.RespawnTime+Global.PermaDelay+Ping:GetValue()/750)
			if Global.R6HatCollision and not Global.RejectCharacterDeletionsPatch then
				for i,v in pairs({RealRig.HumanoidRootPart,RealRig.Torso,RealRig["Body Colors"]}) do
					v.Parent = nil
				end
			else
				RealRig.Humanoid:ChangeState(15)
				if Global.RejectCharacterDeletionsPatch then
					RealRig.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
					RealRig.Humanoid:TakeDamage(9e9 + 9e9 + 9e9 + 9e9); RealRig.Humanoid.Health = 0
					if firesignal then firesignal(RealRig.Humanoid.Died) end
				elseif Global.Headless then
					RealRig.Head:Destroy()
				else
					local neck = RealRig:FindFirstChild("Neck",true)
					if RealRig:FindFirstChild("Neck",true) then 
						neck.Parent = nil
					end
				end
				Notify("Permadeath enabled in " .. string.sub(tostring(tick()-SpeedTest),1,string.find(tostring(tick()-SpeedTest),".")+5),6) 
			end
		end)
	end
	RealRig.Humanoid:ChangeState(16)
	FakeRig.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	workspace.CurrentCamera.CameraSubject = FakeRig.Humanoid
	task.defer(function()
		RunService.RenderStepped:Wait()
		workspace.CurrentCamera.CFrame = OriginCameraCFrame
	end)
	if Global.R15ToR6M2 and not Global.RejectCharacterDeletionsPatch then RealRig.Humanoid.BreakJointsOnDeath = false end
	if RealRig:FindFirstChild("FaceCenterAttachment",true) and not Global.RejectCharacterDeletionsPatch then RealRig.Head.FaceCenterAttachment:Destroy() end
	if RealRig:FindFirstChild("Animate") then RealRig.Animate.Disabled = true end
	for i,v in pairs(RealRig.Humanoid:GetPlayingAnimationTracks()) do v:Stop() end
end

do -- [[ Joints ]] -- 
	if not Global.RejectCharacterDeletionsPatch then
		task.defer(function()
			for i,v in pairs(RealDescendants) do
				task.defer(function()
					if v:IsA("Weld") and v.Name ~= "AccessoryWeld" or v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then
						v:Destroy()
					elseif Global.R15ToR6M2 and v:IsA("Motor6D") and RigType == Enum.HumanoidRigType.R15 then
						if v.Name == "RightHip" or v.Name == "LeftHip" or v.Name == "RightShoulder" or v.Name == "LeftShoulder" or v.Name == "Root" then
							v:Destroy()
						end
					elseif v:IsA("Motor6D") and v.Name ~= "Neck" then
						v:Destroy() 
					end
				end)
			end
		end)
	end
	task.defer(function()
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
						BaseParts[v] = {FakeRig:FindFirstChild("Left Arm"),Global.R15AdjustOffsets and CFrame.new((1-RealRig.LeftUpperArm.Size.X)*2,0.369*(RealRig.LeftUpperArm.Size.Y/1.169),0) or CFrame.new(0,0.369,0)}
					elseif v.Name == "LeftLowerArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Arm"),Global.R15AdjustOffsets and CFrame.new((1-RealRig.LeftLowerArm.Size.X)*2,-0.224*(RealRig.LeftLowerArm.Size.Y/1.052) or CFrame.new(0,-0.224,0),0)}
					elseif v.Name == "LeftHand" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Arm"),Global.R15AdjustOffsets and CFrame.new((1-RealRig.LeftHand.Size.X)*2,-0.85*(RealRig.LeftHand.Size.Y/0.3) or CFrame.new(0,-0.85,0),0)}
					elseif v.Name == "RightUpperArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Arm"),Global.R15AdjustOffsets and CFrame.new(-(1-RealRig.RightUpperArm.Size.X)*2,0.369*(RealRig.RightUpperArm.Size.Y/1.169) or CFrame.new(0,0.369,0),0)}
					elseif v.Name == "RightLowerArm" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Arm"),Global.R15AdjustOffsets and CFrame.new(-(1-RealRig.RightLowerArm.Size.X)*2,-0.224*(RealRig.RightLowerArm.Size.Y/1.052) or CFrame.new(0,-0.224,0),0)}
					elseif v.Name == "RightHand" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Arm"),Global.R15AdjustOffsets and CFrame.new(-(1-RealRig.RightHand.Size.X)*2,-0.85*(RealRig.RightHand.Size.Y/0.3) or CFrame.new(0,-0.85,0),0)}
					elseif v.Name == "LeftUpperLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Leg"),Global.R15AdjustOffsets and CFrame.new((1-RealRig.LeftUpperLeg.Size.X)/2,0.579*(RealRig.LeftUpperLeg.Size.Y/1.217) or CFrame.new(0,0.579,0),0)}
					elseif v.Name == "LeftLowerLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Leg"),Global.R15AdjustOffsets and CFrame.new((1-RealRig.LeftLowerLeg.Size.X)/2,-0.201*(RealRig.LeftLowerLeg.Size.Y/1.193) or CFrame.new(0,-0.201,0),0)}
					elseif v.Name == "LeftFoot" then
						BaseParts[v] = {FakeRig:FindFirstChild("Left Leg"),Global.R15AdjustOffsets and CFrame.new((1-RealRig.LeftFoot.Size.X)/2,-0.85*(RealRig.LeftFoot.Size.Y/0.3) or CFrame.new(0,-0.85,0),0)}
					elseif v.Name == "RightUpperLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Leg"),Global.R15AdjustOffsets and CFrame.new(-(1-RealRig.RightUpperLeg.Size.X)/2,0.579*(RealRig.RightUpperLeg.Size.Y/1.217) or CFrame.new(0,0.579,0),0)}
					elseif v.Name == "RightLowerLeg" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Leg"),Global.R15AdjustOffsets and CFrame.new(-(1-RealRig.RightLowerLeg.Size.X)/2,-0.201*(RealRig.RightLowerLeg.Size.Y/1.193) or CFrame.new(0,-0.201,0),0)}
					elseif v.Name == "RightFoot" then
						BaseParts[v] = {FakeRig:FindFirstChild("Right Leg"),Global.R15AdjustOffsets and CFrame.new(-(1-RealRig.RightFoot.Size.X)/2,-0.85*(RealRig.RightFoot.Size.Y/0.3) or CFrame.new(0,-0.85,0),0)}
					elseif v.Name == "UpperTorso" then
						BaseParts[v] = {FakeRig:FindFirstChild("Torso"),Global.R15AdjustOffsets and CFrame.new(0,0.2*(RealRig.UpperTorso.Size.Y/1.6) or CFrame.new(0,0.2,0),0)}
					elseif v.Name == "LowerTorso" then
						BaseParts[v] = {FakeRig:FindFirstChild("Torso"),Global.R15AdjustOffsets and CFrame.new(0,-0.8*(RealRig.LowerTorso.Size.Y/0.4) or CFrame.new(0,-0.8,0),0)}
					elseif v.Name == "HumanoidRootPart" then
						BaseParts[v] = {FakeRig:FindFirstChild("HumanoidRootPart"),CFrame.new()}
					elseif v.Name == "Head" then
						BaseParts[v] = {FakeRig:FindFirstChild("Head"),CFrame.new()}
					end
				else
					BaseParts[v] = {FakeRig:FindFirstChild(v.Name),CFrame.new()}
				end
			elseif v:IsA("Accessory") and v:FindFirstChild("Handle") then
				if v.Handle:FindFirstChildOfClass("WrapLayer") then
					v:Destroy()
				else
					local Clone = v:Clone()
					Accessories[v:WaitForChild("Handle")] = {Clone:WaitForChild("Handle"),CFrame.new()}
					local Weld = Clone:WaitForChild("Handle"):FindFirstChild("AccessoryWeld");
					if Weld then
						Weld.Part1 = Weld.Part1.Name == "UpperTorso" and Global.R15ToR6 and FakeRig.Torso
							or Weld.Part1.Name == "LowerTorso" and Global.R15ToR6 and FakeRig.Torso
							or Weld.Part1.Name == "Head" and Global.R15ToR6 and FakeRig.Head
							or Weld.Part1.Name == "RightUpperArm" and Global.R15ToR6 and FakeRig["Right Arm"]
							or Weld.Part1.Name == "LeftUpperArm" and Global.R15ToR6 and FakeRig["Left Arm"]
							or FakeRig:FindFirstChild(Weld.Part1.Name)
					end
					if v.Handle:FindFirstChild("AccessoryWeld") and Global.DestroyHatWelds and not Global.RejectCharacterDeletionsPatch then
						v.Handle.AccessoryWeld:Destroy()	
					end
					Clone.Parent = FakeRig	
				end
			elseif v:IsA("Tool") and v:FindFirstChild("Handle") then
				local Clone = v:Clone()
				Accessories[v:WaitForChild("Handle")] = {Clone:WaitForChild("Handle"),CFrame.new()}
				Clone.Parent = Player:WaitForChild("Backpack")
			end
		end)
	end
end

do -- [[ Part Manipulation ]]
	for _,v in pairs({BaseParts,Accessories}) do
		for Part,v in pairs(v) do
			task.defer(function()
				local NetlessHB,IsOwnerHB,Collisions,BodyAngularVelocity
				local IsOwner = true

				if Global.AlignsEnabled then
					local Attach0 = safecloneref(Instance.new("Attachment")); do
						Attach0.Parent = Part
					end
					local Attach1 = safecloneref(Instance.new("Attachment")); do
						Attach1.CFrame = v[2]
						Attach1.Parent = v[1]
					end
					local Position = safecloneref(Instance.new("AlignPosition")); do
						Position.Attachment0 = Attach0 
						Position.Attachment1 = Attach1
						Position.MaxForce = math.huge; 
						Position.Responsiveness = 200;
						Position.Parent = Part
					end
					local Orientation = safecloneref(Instance.new("AlignOrientation")); do
						Orientation.Attachment0 = Attach0 
						Orientation.Attachment1 = Attach1
						Orientation.MaxTorque = math.huge; 
						Orientation.Responsiveness = 200;
						Orientation.Parent = Part
					end
				else
					local BodyVelocity = safecloneref(Instance.new("BodyVelocity")); do
						BodyVelocity.MaxForce = Vector3.new(1,1,1) * math.huge; 
						BodyVelocity.P = math.huge; 
						BodyVelocity.Velocity = Part.Name == "Head" and Global.WhitelistHead and RigType == Enum.HumanoidRigType.R6 and Vector3.new() or Velocity;
						BodyVelocity.Parent = Part;
					end
					BodyAngularVelocity = safecloneref(Instance.new("BodyAngularVelocity")); do
						BodyAngularVelocity.MaxTorque = Vector3.new(1,1,1) * math.huge;
						BodyAngularVelocity.P = math.huge; 
						BodyAngularVelocity.AngularVelocity = Part.Name == Global.Fling and Global.EnableSpin and Vector3.new(2147483646,2147483646,2147483646) or Vector3.new(0,0,0)
						BodyAngularVelocity.Parent = Part
					end
					table.insert(BodyVel,BodyVelocity)
				end

				--Part:ApplyImpulse(Velocity) -- https://fflag.eryn.io/history/PCDesktopClient/DFFlagSimApplyImpulseTakeOwnership
				Part.Massless = true
				Part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
				Part.RootPriority = 127
				if Global.GameOptimize then
					Part.Size = Vector3.new(0,0,0)
				end

				local SelectionBox = safecloneref(Instance.new("SelectionBox")); do
					SelectionBox.Adornee = Part; 
					SelectionBox.Transparency = 1; 
					SelectionBox.Parent = Part
				end

				local SelectionBillboard; do
					if Global.PartText then
						SelectionBillboard = safecloneref(Instance.new("BillboardGui")); do
							SelectionBillboard.StudsOffset = Vector3.new(0,Part.Size.Y,0)
							SelectionBillboard.Size = UDim2.new(3,0,1,0)
							local TextLabel = Instance.new("TextLabel"); do
								TextLabel.BackgroundTransparency = 1
								TextLabel.Text = Part.Name
								TextLabel.TextScaled = true
								TextLabel.TextColor3 = Color3.new(1,1,1)
								TextLabel.TextStrokeTransparency = 0
								TextLabel.Size = UDim2.new(1,0,1,0)
								TextLabel.Font = Enum.Font.IndieFlower
								TextLabel.Parent = SelectionBillboard
							end
							SelectionBillboard.Parent = Part
						end
					end
				end

				do -- NetlessHB
					local TempFunction = function(Part,v,BodyAngularVelocity,SelectionBillboard,SelectionBox)
						if Part and Part.Parent and v[1] and v[1].Parent then
							if Part.Name == "Head" and Global.WhitelistHead and RigType == Enum.HumanoidRigType.R6 then
							else
								--Part:ApplyImpulse(Velocity) -- https://fflag.eryn.io/history/PCDesktopClient/DFFlagSimApplyImpulseTakeOwnership
								Part.Velocity = Velocity
							end

							if IsOwner and not Global.AlignsEnabled then
								if Global.Fling == Part.Name then
								elseif PartToReclaim then
									Part.CFrame = PartToReclaim.CFrame
								elseif Part.Name == "HumanoidRootPart" and Global.TorsoDelayFix then
									Part.CFrame = v[1].CFrame * v[2] * CFrame.new(0,TorsoDelay,0)
									TorsoDelay *= -1
								elseif Part.Name == "Head" and Global.PermaDeath and Global.Healthless then
									Part.CFrame = v[1].CFrame * v[2] * CFrame.new(0,HealthHide,0)
								elseif Part.Parent:IsA("Tool") and v[1].Parent.Parent ~= FakeRig then
									Part.CFrame = FakeRig:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,-4,0)
								else
									Part.CFrame = v[1].CFrame * v[2]
								end
							end

							if BodyAngularVelocity then
								Part.AssemblyAngularVelocity = BodyAngularVelocity.AngularVelocity
							end

							if Part.Name == "Head" and not Global.PermaDeath or IsOwner or Part:FindFirstChildOfClass("Motor6D") or Part.Name == "LowerTorso" and RealRig:FindFirstChild("Waist",true) then
								SelectionBox.SurfaceTransparency = 1
								if SelectionBillboard then SelectionBillboard.Enabled = false end
							else
								SelectionBox.SurfaceTransparency = 0
								if SelectionBillboard then SelectionBillboard.Enabled = true end
							end

							if Global.AllowSleep then 
								sethiddenproperty(Part, "NetworkIsSleeping", false) 
							end
						else
							NetlessHB:Disconnect()
						end
					end
					if Global.MultiThread then
						NetlessHB = Event:Connect(function()
							TempFunction(Part,v,BodyAngularVelocity,SelectionBillboard,SelectionBox)
						end)
					else
						table.insert(ArtificialSingleEvents,{TempFunction,{Part,v,BodyAngularVelocity,SelectionBillboard,SelectionBox}})
					end
				end

				do -- Collisions
					local TempFunction = function(Part)
						if Part and Part.Parent then
							Part.CanCollide = false
							if not Global.Collisions and v[1] and v[1].Parent then
								v[1].CanCollide = false
							end
						else
							Collisions:Disconnect()
						end
					end
					if Global.MultiThread then
						Collisions = RunService.Stepped:Connect(function() 
							TempFunction(Part)
						end)
					else
						table.insert(SteppedSingleEvents,{TempFunction,{Part}})
					end
				end

				do -- IsOwnerHB
					local TempFunction = function(Part)
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
					end
					if Global.MultiThread then
						IsOwnerHB = RunService.Stepped:Connect(function() 
							TempFunction(Part)
						end)
					else
						table.insert(SteppedSingleEvents,{TempFunction,{Part}})
					end
				end

				if IsOwnerHB then table.insert(Events,IsOwnerHB) end
				if NetlessHB then table.insert(Events,NetlessHB) end
				if Collisions then table.insert(Events,Collisions) end
			end)
		end

	end
end

do -- [[ Hide Other Character ]] -- 
	local Hidden = Global.ShowReal and FakeChildren or RealChildren
	for i,v in pairs(Hidden) do
		task.defer(function()
			if v:IsA("BasePart") then
				v.Transparency = 1
				if v:FindFirstChild("face") then
					v.face.Transparency = 1
				end
			elseif v:IsA("Accessory") or v:IsA("Tool") then
				v.Handle.Transparency = 1
			end
		end)
	end
end

do -- [[ Animation ]] -- 
	if Global.AutoAnimate then
		task.defer(function() 
			if RigType == Enum.HumanoidRigType.R15 and Global.R15ToR6 then
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
			else
				FakeRig.Animate.Disabled = true; FakeRig.Animate.Disabled = false
			end
		end)
	end
end

do -- [[ Movement Velocity + Healthless ]]
	if Global.MovementVelocity then 
		if Global.MultiThread then
			table.insert(Events,RunService.Stepped:Connect(function()
				local Direction = FakeRig.HumanoidRootPart.Velocity*Global.Velocity
				Velocity = Direction == Vector3.new() and Global.VelocityVector * Global.Velocity or Direction*(25.5/Direction.Magnitude)
				for i,v in pairs(BodyVel) do v.Velocity = Velocity end
			end))
		else
			table.insert(SteppedSingleEvents,{function()
				local Direction = FakeRig.HumanoidRootPart.Velocity*Global.Velocity
				Velocity = Direction == Vector3.new() and Global.VelocityVector * Global.Velocity or Direction*(25.5/Direction.Magnitude)
				for i,v in pairs(BodyVel) do v.Velocity = Velocity end
			end,{}})
		end

	end
	if Global.Healthless and Global.PermaDeath then
		task.defer(function()
			repeat wait() until not RealRig or not RealRig:FindFirstChild("Neck",true)
			while RealRig and RealRig:FindFirstChild("Head") do
				HealthHide = 0
				wait(5)
				HealthHide = 200
				wait(.5+Ping:GetValue()/750)
			end
		end)
	end
end

do -- [[ Respawn Events ]] -- 
	if Global.MultiThread then
		table.insert(Events,RunService.Heartbeat:Connect(function() 
			if FakeRig.HumanoidRootPart.Position.Y <= workspace.FallenPartsDestroyHeight+3 then
				if Global.AntiVoid then
					local SpawnPoint = workspace:FindFirstChildOfClass("SpawnLocation",true) and workspace:FindFirstChildOfClass("SpawnLocation",true) or CFrame.new(0,20,0)
					FakeRig:MoveTo(SpawnPoint.Position)
				else
					pcall(function() 
						Player.Character = RealRig; 
						RealRig.Parent = workspace; 
						if FakeRig then FakeRig:Destroy() end
						for i,v in pairs(Events) do
							v:Disconnect()
						end
						FakeRig = nil
					end) 
				end
			end
		end))
	else
		table.insert(SteppedSingleEvents,{function() 
			if FakeRig.HumanoidRootPart.Position.Y <= workspace.FallenPartsDestroyHeight+3 then
				if Global.AntiVoid then
					local SpawnPoint = workspace:FindFirstChildOfClass("SpawnLocation",true) and workspace:FindFirstChildOfClass("SpawnLocation",true) or CFrame.new(0,20,0)
					FakeRig:MoveTo(SpawnPoint.Position)
				else
					pcall(function() 
						Player.Character = RealRig; 
						RealRig.Parent = workspace; 
						if FakeRig then FakeRig:Destroy() end
						for i,v in pairs(Events) do
							v:Disconnect()
						end
						FakeRig = nil
					end) 
				end
			end
		end,{}})
	end

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
Notify(Ping:GetValue() < 50 and "Ping is ".. math.round(Ping:GetValue()) .. "ms, most likely stable" or
	Ping:GetValue() < 100 and "Ping is " .. math.round(Ping:GetValue()) .. "ms, might jitter but stable" or
	"Ping is " .. math.round(Ping:GetValue()) .. "ms, possibly unstable/delayed")
