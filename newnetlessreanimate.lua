-- https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330 & nul#3174
if not game:IsLoaded() then game.Loaded:Wait() end

if workspace:FindFirstChild("ExProReanimate") then 
	error("Already Reanimated?") 
end

local TickTest = tick()

local EmptyFunction = function() end

local Global = getgenv and getgenv() or _G
local sethiddenproperty = sethiddenproperty or sethiddenprop or EmptyFunction
local isnetworkowner = isnetworkowner or function() return true end
local cloneref = cloneref or function(ref) return ref end
local printconsole = printconsole or print

local loadstring = pcall(function() loadstring("")() end) and loadstring or EmptyFunction

local notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/notificationstuff/main/src.lua",true))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))()

local TweenService = cloneref(game:GetService("TweenService"))
local PhysicsService = game:GetService("PhysicsService")
local RunService = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local Stats = cloneref(game:GetService("Stats"))

local Player = Players.LocalPlayer
local RigType = Player.Character.Humanoid.RigType
local OriginalRig = Player.Character
local OriginalRigDescendants = OriginalRig:GetDescendants()

local FPS = Stats.Workspace.FPS
local Ping = Stats.Network.ServerStatsItem["Data Ping"]

local Asset,Events,BodyVel,Tools = {},{},{},{}

local FakeTorso,FakeTorso1,FakeHead,Character,R15Offsets,Claim2Heartbeat,FoundPos

Asset.Spawn = function(func)
	return task.spawn(coroutine.create(func))
end

-- Default Values
if Global.Optimizer == nil then Global.Optimizer = false end
if Global.Fling == true then Global.Fling = "HumanoidRootPart" end
if not Global.Fling then Global.Fling = "" end
if Global.PartGUI == nil then Global.PartGUI = false end
if Global.ShowReal == nil then Global.ShowReal = false end
if Global.FakeGod == nil then Global.FakeGod = false end
if Global.GodMode == nil then Global.GodMode = true end
if Global.AutoAnimate == nil then Global.AutoAnimate = true end
if Global.Velocity == nil then Global.Velocity = -25.05 end
if Global.Collisions == nil then Global.Collisions = true end
if Global.Network == nil then Global.Network = true end
if Global.Claim2 == nil then Global.Claim2 = false end
if Global.Notification == nil then Global.Notification = true end
if Global.AntiSleep == nil then Global.AntiSleep = false end
if Global.MovementVelocity == nil then Global.MovementVelocity = false end
if Global.ArtificialHeartBeat == nil then Global.ArtificialHeartBeat = true end
if Global.R6 == nil then Global.R6 = true end
if Global.AutoReclaim == nil then Global.AutoReclaim = false end

settings().Rendering.EagerBulkExecution = true
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
settings().Physics.ForceCSGv2 = false
settings().Physics.DisableCSGv2 = true
settings().Physics.UseCSGv2 = false
settings().Physics.ThrottleAdjustTime = math.huge
workspace.InterpolationThrottling = "Disabled"
Player.ReplicationFocus = workspace

if Global.Optimizer then
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
end

local function Notify(title,duration)
	if Global.Notification then
		notification({
			Text = title,
			Duration = duration
		})
	end
	printconsole("Zendey // "..tostring(title))
end

if Global.Network then
	Player.MaximumSimulationRadius=1000
	sethiddenproperty(Player,"SimulationRadius",1000)
	if not Global.SimRadius then
		Global.SimRadius = RunService.Stepped:Connect(function()
			Player.MaximumSimulationRadius=1000
			sethiddenproperty(Player,"SimulationRadius",1000)
		end)
	end
end

local event = Global.MiliWait
if not event then
	local fastwait = loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/fe5cbdbc396630374041f0c2d156a747/raw/5491a28fd72ed7e11c9fa3f9141df033df3ed5a9/fastwait.lua"))()
	if Global.ArtificialHeartBeat and fastwait then
		local BindEvent = Instance.new("BindableEvent")
		Asset.Spawn(function()
			while true do
				for i=1,math.max(FPS:GetValue()/27.5,1) do
					task.spawn(coroutine.create(function()
						BindEvent:Fire()
						fastwait(0.1)
					end))
				end
				fastwait(0/1)
			end
		end)
		event = BindEvent.Event
	else
		event = RunService.Heartbeat
	end
	Global.MiliWait = event
end

local Velocity = Vector3.new(Global.Velocity, Global.Velocity, Global.Velocity)
local wait = function(Time)
	event:Wait()
end

if not pcall(function() PhysicsService:GetCollisionGroupId("NoCollide") end) then 
	PhysicsService:CreateCollisionGroup("NoCollide")
	PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)
end

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

		for i,v in pairs(OriginalRigDescendants) do
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

	Character = loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/R6Rig.lua",true))()--game:GetObjects("rbxassetid://8232772380")[1]:Clone()
	Character.Parent = workspace
	Notify("Applying Character Description",3)
	Character.Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(Player.UserId)) --OriginalRig:FindFirstChild("HumanoidDescription",true) or 
	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			v:Destroy()
		end
	end
	for i,v in pairs(OriginalRig:GetChildren()) do
		if v:IsA("Accessory") then
			local clonehats = v:Clone()
			clonehats.Parent = Character
			for p,g in pairs(R15Offsets) do
				if g[v.Handle.AccessoryWeld.Part1.Name] then
					clonehats.Handle.AccessoryWeld.Part1 = Character[p]
				end
			end
		elseif v:IsA("Tool") then
			v:Clone().Parent = Character
		end
	end
	Character:PivotTo(OriginalRig.HumanoidRootPart.CFrame)
else
	Player.Character.Archivable = true
	Character = Player.Character:Clone()
	Player.Character.Archivable = false
	Character.Parent = workspace
end

wait()
Character.Name = "ExProReanimate"

OriginalRig.Parent = Character
Player.Character = Character

local CharacterDescendants = Character:GetDescendants()

if Global.GodMode then
	Asset.Spawn(function()
		task.wait(Players.RespawnTime+Ping:GetValue()/750)
		local neck = OriginalRig:FindFirstChild("Neck",true)
		if OriginalRig:FindFirstChild("Neck",true) then 
			OriginalRig.Humanoid:ChangeState(15)
			neck.Parent = nil
			Notify("Permadeath On",6) 
		end
	end)
end


Global.RealRig = OriginalRig
Global.CloneRig = Character

OriginalRig.Humanoid:ChangeState(16)
workspace.CurrentCamera.CameraSubject = Character.Humanoid
pcall(function() OriginalRig.Head.FaceCenterAttachment:Destroy() end)

if Global.Claim2 then
	repeat wait()
		pcall(function()
			local pos = OriginalRig.HumanoidRootPart.Position + Vector3.new(math.random(-1500,1500),100,math.random(-1500,1500))
			local check = true
			for i,v in pairs(Players:GetPlayers()) do
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

Asset.Spawn(function()
	for i,v in pairs(OriginalRigDescendants) do
		Asset.Spawn(function()
			if v.Name ~= "Neck" then
				if v:IsA("Motor6D") or v:IsA("Weld") or v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then
					v:Destroy() 
				end
			end
		end)
	end
end)

for i,Part in pairs(OriginalRigDescendants) do
	Asset.Spawn(function()
		if Part:IsA("BasePart") then
			local NetlessHB

			local BodyVelocity = Instance.new("BodyVelocity",Part)
			BodyVelocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge); BodyVelocity.P = math.huge; BodyVelocity.Velocity = Velocity
			local BodyAngularVelocity = Instance.new("BodyAngularVelocity",Part)
			BodyAngularVelocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); BodyAngularVelocity.P = math.huge; BodyAngularVelocity.AngularVelocity = Vector3.new(0,0,0)

			Part.Massless = true
			Part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
			Part.RootPriority = 127

			local selectionbox = Instance.new("SelectionBox",Part)
			selectionbox.Transparency = 1; selectionbox.Adornee = Part;

			NetlessHB = event:Connect(function()
				if Part and Part.Parent and Part:IsDescendantOf(workspace) then
					Part:ApplyImpulse(Velocity)
					Part.AssemblyAngularVelocity = Vector3.new()
					if Part.Name == "Head" and not Global.GodMode then
						selectionbox.SurfaceTransparency = 1
					elseif isnetworkowner(Part) then
						selectionbox.SurfaceTransparency = 1
					else
						selectionbox.SurfaceTransparency = 0
					end
				else
					NetlessHB:Disconnect()
				end
			end)
			if Part.Parent:IsA("Accessory") then
				for i,v in pairs(Character:GetChildren()) do
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
			elseif Part.Parent:IsA("Tool") then
				Part.Parent.Parent = Player.Backpack
				table.insert(Tools,Part.Parent)
			end
			table.insert(Events,NetlessHB)
			table.insert(BodyVel,BodyVelocity)
		end
	end)
end

if Global.MovementVelocity then
	table.insert(Events,Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		local Vector = Character.Humanoid.MoveDirection * Global.Velocity
		local X,Z = Vector.X,Vector.Z
		if Vector.X == 0 and Vector.Z == 0 then X = Global.Velocity Z = Global.Velocity end
		Velocity = Vector3.new(X,Velocity,Z)
		for i,v in pairs(BodyVel) do
			v.Velocity = Velocity
		end
	end))
	table.insert(Events,Character.Humanoid.StateChanged:Connect(function(old,new)
		local Y = 0
		if new == Enum.HumanoidStateType.Jumping then
			Y = -Global.Velocity
		elseif new == Enum.HumanoidStateType.Freefall then
			Y = Global.Velocity
		end
		Velocity = Vector3.new(Velocity.X,Y,Velocity.Z)
		for i,v in pairs(BodyVel) do
			v.Velocity = Velocity
		end
	end))
end

for i,v in pairs(Global.Collisions and OriginalRigDescendants or CharacterDescendants) do
	Asset.Spawn(function()
		if v:IsA("BasePart") then
			local CollideStep
			CollideStep = RunService.Stepped:Connect(function()
				if v and v.Parent and v:IsDescendantOf(workspace) then
					v.CanCollide = false
					if Global.AllowSleep then 
						sethiddenproperty(v, "NetworkIsSleeping", false) 
					end
				else
					CollideStep:Disconnect()
				end
			end)
			table.insert(Events,CollideStep)
		end
	end)
end

local Claim2 = true
local ReclaimingParts = false
if Global.Claim2 then
	Notify("Claim2; Found Pos",3)
	local ClaimTick = tick()
	repeat 
		for i,v in pairs(OriginalRigDescendants) do
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
			for i,v in pairs(OriginalRigDescendants) do
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

local ReclaimPart = function(Part)
	ReclaimingParts = true
	Notify("Attempting to Reclaim " .. Part.Name,5)
	repeat
		for i,v in pairs(OriginalRigDescendants) do
			if v:IsA("BasePart") then
				v.CFrame = Part.CFrame
			end
		end
		wait()
	until isnetworkowner(Part) or not Part:IsDescendantOf(workspace) or not Character
	ReclaimingParts = false
	Notify("Reclaimed " .. Part.Name,5)
end
Global.ReclaimPart = ReclaimPart

if OriginalRig:FindFirstChild(Global.Fling) then
	Asset.Spawn(function()
		while Claim2 and OriginalRig:FindFirstChild(Global.Fling) do
			OriginalRig[Global.Fling].CFrame = Global.Fling == "HumanoidRootPart" and OriginalRig.Head.CFrame or OriginalRig.HumanoidRootPart.CFrame
			wait()
		end
	end)
end

if Global.FakeGod then
	if OriginalRig:FindFirstChild("SeeMonkey") then
		FakeTorso = OriginalRig.SeeMonkey.Handle
		Character.SeeMonkey.Handle.Transparency = 1
	else
		FakeTorso1 = OriginalRig["Kate Hair"].Handle
		FakeTorso1.Mesh:Destroy();
		FakeTorso = OriginalRig.Robloxclassicred.Handle
		Character["Kate Hair"].Handle.Transparency = 1
		Character["Robloxclassicred"].Handle.Transparency = 1
	end
	if OriginalRig:FindFirstChild("Void Head") then
		FakeHead = OriginalRig["Void Head"].Handle
		Character["Void Head"].Handle.Transparency = 1
	elseif OriginalRig:FindFirstChild("Dummy_Head") then
		FakeHead = OriginalRig["Dummy_Head"].Handle
		Character["Dummy_Head"].Handle.Transparency = 1
	else
		FakeHead = OriginalRig.MediHood.Handle
		Character["MediHood"].Handle.Transparency = 1
	end
	FakeTorso.Mesh:Destroy();
end


for i,v in pairs(Global.ShowReal and Character:GetChildren() or OriginalRig:GetChildren()) do
	Asset.Spawn(function()
		if v:IsA("BasePart") or v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("Accessory") or v:IsA("Tool") then
			v.Handle.Transparency = 1
		end
	end)
end

if Global.AutoAnimate then
	if RigType == Enum.HumanoidRigType.R15 and Global.R6 then
		Asset.Spawn(function() pcall(function() 
				loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/Animate"))()
		end) end)
	else
		Character.Animate.Disabled = true; wait() Character.Animate.Disabled = false
	end
end

for i,v in pairs(CharacterDescendants) do
	Asset.Spawn(function()
		if v:IsA("BasePart") then
			PhysicsService:SetPartCollisionGroup(v, "NoCollide")
		end
	end)
end

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
				if v and v.Parent and v:FindFirstChild("Handle") then
					if isnetworkowner(v.Handle) and not ReclaimingParts then
						v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame 
					else
						v.Handle.CFrame = OriginalRig.Head.CFrame
					end
				else
					partbeat:Disconnect()
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
							if Global.FakeGod and v.Name == "Head" and isnetworkowner(FakeHead) then
								FakeHead.CFrame = Character["Head"].CFrame
							elseif Global.FakeGod and v.Name == "Torso" and isnetworkowner(FakeTorso) then
								if FakeTorso1 and isnetworkowner(FakeTorso1) then
									FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0.5,0,0) 
									FakeTorso1.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(-0.5,0,0) 
								else
									FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) 
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
			elseif v:IsA("Accessory") and v.Handle ~= FakeTorso and v.Handle ~= FakeTorso1 and v.Handle ~= FakeHead then
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

if Global.AutoReclaim then
	Asset.Spawn(function()
		while task.wait(1) and Character do
			for i,v in pairs(OriginalRigDescendants) do
				if v:IsA("BasePart") and not isnetworkowner(v) then
					if v.Name == "Head" then
					else
						ReclaimPart(v)
						wait()
					end
				end
			end
		end
	end)
end

for i,v in pairs(Tools) do
	local partbeat
	partbeat = event:Connect(function(delta)
		if not ReclaimingParts then
			if v and v.Parent and v:FindFirstChild("Handle") then
				if Character:FindFirstChild(v.Name) and isnetworkowner(v.Handle) then
					v.Handle.CFrame = Character[v.Name].Handle.CFrame 
				elseif isnetworkowner(v.Handle) then
					v.Handle.CFrame = Character["Head"].CFrame + Vector3.new(0,-5,0) 
				end
			else
				partbeat:Disconnect()
			end
		else
			v.Handle.CFrame = OriginalRig.Head
		end
	end)
	table.insert(Events,partbeat)
end

if not Global.Claim2 then
	Claim2 = false
end
Character.Humanoid.Died:Connect(function() 
	pcall(function() 
		Player.Character = OriginalRig; 
		OriginalRig.Parent = workspace; 
		if Character then Character:Destroy() end
		for i,v in pairs(Events) do
			v:Disconnect()
		end
		Character = nil
	end) 
end)
Player.CharacterAdded:Connect(function() 
	if Character then Character:Destroy() end
	for i,v in pairs(Events) do
		v:Disconnect()
	end
	Character = nil
end) 

Notify("Script loaded in " .. tostring(tick() - TickTest) .. " Seconds",5)
