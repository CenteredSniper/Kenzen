-- https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330 & nul#3174

-- // Modules/Setup
loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))()

if getgenv().Fling == nil then getgenv().Fling = false end
if getgenv().TorsoFling == nil then getgenv().TorsoFling = false end
if getgenv().ShowReal == nil then getgenv().ShowReal = false end
if getgenv().FakeGod == nil then getgenv().FakeGod = false end
if getgenv().GodMode == nil then getgenv().GodMode = true end
if getgenv().AutoAnimate == nil then getgenv().AutoAnimate = true end
if getgenv().Tools == nil then getgenv().Tools = true end
if getgenv().Velocity == nil then getgenv().Velocity = -25.05 end
if getgenv().Collisions == nil then getgenv().Collisions = true end
if getgenv().CheckForDeath == nil then getgenv().CheckForDeath = true end
if getgenv().Network == nil then getgenv().Network = true end
if getgenv().Netless2 == nil then getgenv().Netless2 = false end
if getgenv().Claim2 == nil then getgenv().Claim2 = false end
if getgenv().ExtremeNetless == nil then getgenv().ExtremeNetless = false end
if getgenv().Notification == nil then getgenv().Notification = true end
if getgenv().DynamicVelocity == nil then getgenv().DynamicVelocity = false end
if getgenv().AntiSleep == nil then getgenv().AntiSleep = false end
if getgenv().MovementVelocity == nil then getgenv().MovementVelocity = false end


-- Preformance Values
settings().Rendering.EagerBulkExecution = true
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
settings().Physics.ForceCSGv2 = false
settings().Physics.DisableCSGv2 = true
settings().Physics.UseCSGv2 = false
settings().Physics.ThrottleAdjustTime = math.huge
workspace.InterpolationThrottling = "Disabled"

-- // Variables
local PhysicsService = game:GetService("PhysicsService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local FakeTorso,FakeTorso1,FakeHead
local cr,cc = coroutine.resume,coroutine.create
local RigType = Player.Character.Humanoid.RigType
local SetHiddenProperty = sethiddenproperty or sethiddenprop
local OriginalRig = Player.Character

local Character,R15Offsets,Claim2Heartbeat

-- Storing the Velocity Variable for netless, needed because dynamic velocity and movement velocity
local Velocity = Vector3.new(getgenv().Velocity, getgenv().Velocity, getgenv().Velocity)

-- Setting Sim Radius, useful for claiming parts
if getgenv().Network then
	game:GetService("Players").LocalPlayer.MaximumSimulationRadius=1000
	SetHiddenProperty(game:GetService("Players").LocalPlayer,"SimulationRadius",1000)
end

-- Not all exploits have isnetworkowner
local function networkownership(obj)
	if isnetworkowner then
		return isnetworkowner(obj)
	else
		return true
	end
end

local notify = loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/5aacd41c762304c92802ed4ad714cc98/raw/e8c9b25cb3660028793342728553efdb24e72bec/NotificationService.lua",true))()
-- // Notification Function
local function createnotification(title,duration)
	if getgenv().Notification then
		--[[
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title;
			Text = desc;
			Duration = duration;
		})]]
		notify({
			Text = title,
			Duration = duration
		})
	end
end

-- // Collisions
local check; pcall(function() check = PhysicsService:GetCollisionGroupId("NoCollide") end)
if not check then PhysicsService:CreateCollisionGroup("NoCollide") end
PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)


if getgenv().FakeGod and RigType == Enum.HumanoidRigType.R6 then getgenv().GodMode = false end
if getgenv().TorsoFling then getgenv().Fling = false end
if getgenv().MovementVelocity then getgenv().DynamicVelocity = false end

-- // RigType
if RigType == Enum.HumanoidRigType.R15 then
	-- R15Offsets for the r15 to r6, now scale-accessible!
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
		["Head"] = {["Head"] = CFrame.new(0,0,0)
		},
	}

	Character = game:GetObjects("rbxassetid://8232772380")[1]:Clone()
	Character.Parent = workspace
	Character.Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(Player.UserId))
	--task.wait()
	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			v:Destroy()
		end
	end
	for i,v in pairs(OriginalRig:GetChildren()) do
		if v:IsA("Accessory") then
			local clonehats = v:Clone()
			clonehats.Parent = Character
			for _,g in pairs(R15Offsets) do
				if g[v.Handle.AccessoryWeld.Part1.Name] then
					clonehats.Handle.AccessoryWeld.Part1 = Character[_]
				end
				--task.wait()
			end
			--clonehats.Handle.AccessoryWeld.Part1 = Character[v.Handle.AccessoryWeld.Part1.Name]
		end
		--task.wait()
	end
	Character.HumanoidRootPart.CFrame = OriginalRig.HumanoidRootPart.CFrame
	--task.wait()
	for i,v in pairs(OriginalRig:GetChildren()) do
		if v:IsA("Tool") then
			v:Clone().Parent = Character
		end
		--task.wait()
	end
	task.wait()
else
	Player.Character.Archivable = true
	Character = Player.Character:Clone()
	Player.Character.Archivable = false
	Character.Parent = workspace
	task.wait()
end
Character.Name = "FakeBody"

getgenv().RealRig = OriginalRig
getgenv().CloneRig = Character

-- // Hat Matching Value
local function findmatchingaccessory(hat)
	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			if RigType == Enum.HumanoidRigType.R15 then
				if v.Handle.MeshId == hat.MeshId and v.Handle.TextureID == hat.TextureID then
					local CloneHat = Instance.new("ObjectValue",hat)
					CloneHat.Value = v.Handle
					CloneHat.Name = "CloneHat"
				end
			else
				if v.Handle:FindFirstChildOfClass("SpecialMesh").MeshId == hat:FindFirstChildOfClass("SpecialMesh").MeshId and v.Handle:FindFirstChildOfClass("SpecialMesh").TextureId == hat:FindFirstChildOfClass("SpecialMesh").TextureId then
					local CloneHat = Instance.new("ObjectValue",hat)
					CloneHat.Value = v.Handle
					CloneHat.Name = "CloneHat"
				end
			end
		end
	end
end

-- // Claim 2
OriginalRig.Humanoid:ChangeState(16)
--Player.Character.Humanoid.PlatformStand = true

if getgenv().Claim2 then
	Character.HumanoidRootPart.Anchored = true
	--OriginalPosition = Player.Character.HumanoidRootPart.CFrame
	local actualpos
	repeat task.wait() 
		pcall(function()
			local pos = Player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-1500,1500),100,math.random(-1500,1500))
			local check = true
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
					if (v.Character.HumanoidRootPart.Position-pos).magnitude <= 1000 then
						check = false
					end
				end
			end
			if check then
				actualpos = pos
			end
		end)
	until actualpos
	Player.Character.HumanoidRootPart.CFrame = CFrame.new(actualpos)
	Claim2Heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
		for i,v in pairs(OriginalRig:GetDescendants()) do
			cr(cc(function()
				if v:IsA("BasePart") then
					--v.Velocity = Velocity
					v:ApplyImpulse(Velocity)
				end
			end))
		end
	end)
	createnotification("Claim2; Found Pos",6)
end

-- // Netless claiming
for i,v in pairs(OriginalRig:GetDescendants()) do
	cr(cc(function()
		if v:IsA("BasePart") then
			--v.Velocity = Velocity
			v:ApplyImpulse(Velocity)
			if getgenv().Netless2 then
				local a = Instance.new("BodyVelocity",v)
				a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(0,0,0)
				local a = Instance.new("BodyAngularVelocity",v)
				a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
			else
				local a = Instance.new("BodyVelocity",v)
				a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(getgenv().Velocity,getgenv().Velocity,getgenv().Velocity)
				local a = Instance.new("BodyAngularVelocity",v)
				a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
			end
			v.Massless = true
			v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
			local selectionbox = Instance.new("SelectionBox",v)
			selectionbox.Transparency = 1; selectionbox.Adornee = v;
			if v.Parent:IsA("Accessory") then
				findmatchingaccessory(v)
			end
		end
	end))
end
createnotification("Netless Claimed",6)

-- keeping the tools so they dont lose ownership
local tools = {}
for i,v in pairs(OriginalRig:GetChildren()) do
	if v:IsA("Tool") then
		v.Parent = Player.Backpack
		table.insert(tools,v)
	end
end

task.wait(0.1) -- adding a wait as extra safety

-- old dynvelocity, feel free to edit and use this if u want
local function dynvelocity()
	local humrootpos = Character.HumanoidRootPart.Position
	local smallestmag = 22.5
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game:GetService("Players").LocalPlayer and v.Character then
			local humroot = v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Head")
			if humroot then
				local mag = (humroot.Position-humrootpos).magnitude
				if mag <= smallestmag then
					smallestmag = mag
				end
			end
		end
	end
	getgenv().Velocity = 45-smallestmag*2
	for i,v in pairs(OriginalRig:GetDescendants()) do
		if v:IsA("BodyVelocity") then
			v.Velocity = Vector3.new(45-smallestmag*2,45-smallestmag*2,45-smallestmag*2)
		end
	end
end

-- changes velocity based on other players position to the player
local OriginalVelocity = getgenv().Velocity
local function dynvelocity2()
	local humrootpos = Character.HumanoidRootPart.Position
	local boolthing = false
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game:GetService("Players").LocalPlayer and v.Character then
			local humroot = v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Head")
			if humroot then
				local mag = (humroot.Position-humrootpos).magnitude
				if mag <= 22.5 then
					--smallestmag = mag
					--getgenv().Velocity = OriginalVelocity
					Velocity = OriginalVelocity
					for i,v in pairs(OriginalRig:GetDescendants()) do
						if v:IsA("BodyVelocity") then
							v.Velocity = Vector3.new(OriginalVelocity,OriginalVelocity,OriginalVelocity)
						end
					end
				else
					Velocity = Vector3.new(0.01,0.01,0.01)
					for i,v in pairs(OriginalRig:GetDescendants()) do
						if v:IsA("BodyVelocity") then
							v.Velocity = Vector3.new(0.01,0.01,0.01)
						end
					end
				end
			end
		end
	end
end

-- changes velocity based on player movement
if getgenv().MovementVelocity then
	--local savedvel = getgenv().Velocity
	Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		local x,y,z = Character.Humanoid.MoveDirection.X,Character.Humanoid.MoveDirection.Y,Character.Humanoid.MoveDirection.Z
		local vector = Vector3.new(x*OriginalVelocity,y*OriginalVelocity,z*OriginalVelocity)
		if vector.X == 0 and vector.Y == 0 and vector.Z == 0 then vector = Vector3.new(OriginalVelocity,OriginalVelocity,OriginalVelocity) end
		Velocity = vector
		for i,v in pairs(OriginalRig:GetDescendants()) do
			if v:IsA("BodyVelocity") then
				v.Velocity = vector
			end
		end
		--print(Velocity)
	end)
end

-- // Master Stepped; Handles collisions, simradius, etc.
local Noclip = RunService.Stepped:Connect(function(delta)
	if getgenv().DynamicVelocity then
		coroutine.wrap(dynvelocity2)()
	end
	settings().Rendering.EagerBulkExecution = true
	settings().Physics.AllowSleep = false
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	settings().Physics.ForceCSGv2 = false
	settings().Physics.DisableCSGv2 = true
	settings().Physics.UseCSGv2 = false
	settings().Physics.ThrottleAdjustTime = math.huge
	if getgenv().Network then
		game:GetService("Players").LocalPlayer.MaximumSimulationRadius=6969
		SetHiddenProperty(game:GetService("Players").LocalPlayer,"SimulationRadius",6969)
	end
	if typeof(getgenv().Collisions) == "boolean" then
		local Collisionrig = getgenv().Collisions and OriginalRig or Character
		for i,v in pairs(Collisionrig:GetDescendants()) do
			cr(cc(function()
				if v:IsA("BasePart") then
					if networkownership(v) then v.CanCollide = false end
					if getgenv().AllowSleep and SetHiddenProperty then SetHiddenProperty(v, "NetworkIsSleeping", false) end
					if v:IsDescendantOf(OriginalRig) and getgenv().ExtremeNetless then
						v:ApplyImpulse(Velocity)
						--v.Velocity = Velocity
					end
				end
			end))
		end
	end
end)

-- // Claim 2 Bring back
local keepingparts = true
if getgenv().Claim2 then
	local KeepInPlace = OriginalRig.HumanoidRootPart.CFrame
	local frametime = tick() task.wait() frametime = tick() - frametime 
	for i=1,1/(frametime/1) do
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = KeepInPlace
		task.wait(frametime)
	end
	-- :BreakJoints breaks the neck, not good for non-godmode
	for i,v in pairs(OriginalRig:GetDescendants()) do
		cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" or v:IsA("Weld") and v.Name ~= "Neck" then v:Destroy() end end))
	end
	cr(cc(function()
		while keepingparts and task.wait() do
			for i,v in pairs(OriginalRig:GetDescendants()) do
				if v:IsA("BasePart") and v.Name ~= "Head" and v.Name ~= "HumanoidRootPart" then
					v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
	end))
	task.wait(0.5)
	local animat = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(5), {CFrame = Character.HumanoidRootPart.CFrame})
	animat:Play()
	animat.Completed:wait()
	Claim2Heartbeat:Disconnect()
	Character.HumanoidRootPart.Anchored = false
else
	for i,v in pairs(OriginalRig:GetDescendants()) do
		cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" or v:IsA("Weld") and v.Name ~= "Neck" then v:Destroy() end end))
	end
end

--[[
-- // Weld Removing
for i,v in pairs(OriginalRig:GetDescendants()) do
	cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" then v:Destroy() end end))
end]]

-- // Godmode Keep Fling Part in place
if getgenv().GodMode and OriginalRig:FindFirstChild("Neck",true) then
	if getgenv().Fling then
		local savepos = OriginalRig.HumanoidRootPart.CFrame
		cr(cc(function()
			while keepingparts and task.wait() do
				OriginalRig.HumanoidRootPart.CFrame = savepos
			end
		end))
	elseif getgenv().TorsoFling then
		local savepos = OriginalRig.HumanoidRootPart.CFrame
		cr(cc(function()
			while keepingparts and task.wait() do
				if RigType == Enum.HumanoidRigType.R6 then
					OriginalRig.Torso.CFrame = savepos
				else
					OriginalRig["LowerTorso"].CFrame = savepos
				end

			end
		end))
	end
end

-- // FakeGod
if getgenv().FakeGod then
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

-- // Setting player onto the fake rig
for i,v in pairs(tools) do
	if v:IsA("Tool") then
		v.Parent = OriginalRig
	end
end
task.wait()
Player.Character.Parent = Character; Player.Character = Character
workspace.CurrentCamera.CameraSubject = Character.Humanoid
createnotification("Set Character to Fake Rig",6)

-- // Turning Chosen Rig Invisible
local invisrig = getgenv().ShowReal and Character or OriginalRig
for i,v in pairs(invisrig:GetChildren()) do
	cr(cc(function()
		if v:IsA("BasePart") or v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("Accessory") or v:IsA("Tool") then
			v.Handle.Transparency = 1
		end
	end))
end

-- // Animating the fake rig
if getgenv().AutoAnimate then
	if RigType == Enum.HumanoidRigType.R15 then
		cr(cc(function()
			--getgenv().ForHonor = Character.Animate
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/Animate"))()
		end))
	else
		Character.Animate.Disabled = true; task.wait() Character.Animate.Disabled = false
	end
end


-- // Making Characters not collide
for i,v in pairs(Character:GetDescendants()) do
	cr(cc(function()
		if v:IsA("BasePart") then
			PhysicsService:SetPartCollisionGroup(v, "NoCollide")
		end
	end))
end

--[[
	if you're confused about the differences between runservice events
	refer to; https://doy2mn9upadnk.cloudfront.net/uploads/default/original/3X/2/d/2d8a74483027f44c4f05080bc9437408f461737a.png
]]

-- // Conversion
local Conversion = RunService.Heartbeat:Connect(function(delta)
	for i,v in pairs(OriginalRig:GetDescendants()) do
		cr(cc(function()
			if v:IsA("BasePart") then
				v:ApplyImpulse(Velocity)
				--v.Velocity = Velocity
				if v.Name == "Head" and not getgenv().GodMode then
				    v.SelectionBox.Transparency = 1
				else
				    if not networkownership(v) then
				    	v.SelectionBox.Transparency = 0
				    else
				    	v.SelectionBox.Transparency = 1
			    	    end
				end
			end
		end))
	end
	if RigType == Enum.HumanoidRigType.R15 then
		for R6PartName,R15PartNames in pairs(R15Offsets) do
			for i,R15PartNameOffset in pairs(R15PartNames) do
				cr(cc(function()
					if OriginalRig:FindFirstChild(i) and networkownership(OriginalRig[i]) then
						if i == "LowerTorso" and getgenv().TorsoFling then
						elseif i == "Torso" and getgenv().TorsoFling then
						else
							local ExpectedPosition = Character[R6PartName].CFrame * R15PartNameOffset
							OriginalRig[i].CFrame = ExpectedPosition 
						end
					end
				end))
			end
		end
		for i,v in pairs(OriginalRig:GetChildren()) do
			cr(cc(function()
				if v:IsA("Accessory") and networkownership(v.Handle) then
					v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame 
				end
			end))
		end
		if OriginalRig:FindFirstChild("HumanoidRootPart") and networkownership(OriginalRig["HumanoidRootPart"]) and not getgenv().Fling then
			OriginalRig["HumanoidRootPart"].CFrame = Character["HumanoidRootPart"].CFrame 
		end
	else
		for i,v in pairs(OriginalRig:GetChildren()) do
			cr(cc(function()
				if v:IsA("BasePart") then
					if v.Name == "HumanoidRootPart" and getgenv().Fling and networkownership(v) then
					elseif getgenv().TorsoFling and v.Name == "Torso" or v.Name == "LowerTorso" and networkownership(FakeHead)  then	
					elseif getgenv().FakeGod and v.Name == "Head" and networkownership(FakeHead)  then
						FakeHead.CFrame = Character["Head"].CFrame
					elseif getgenv().FakeGod and v.Name == "Torso" and networkownership(FakeTorso)  then
						if FakeTorso1 then
							FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0.5,0,0) 
							FakeTorso1.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(-0.5,0,0) 
						else
							FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) 
						end
					elseif networkownership(v) then
						v.CFrame = Character[v.Name].CFrame 
					end
				elseif v:IsA("Accessory") and v.Handle ~= FakeTorso and v.Handle ~= FakeTorso1 and v.Handle ~= FakeHead and networkownership(v.Handle) then
					v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame 
				end
			end))
		end
	end
	if getgenv().Tools then
		for i,v in pairs(tools) do
			if Character:FindFirstChild(v.Name) and networkownership(v.Handle) then
				v.Handle.CFrame = Character[v.Name].Handle.CFrame 
			elseif networkownership(v.Handle) then
				v.Handle.CFrame = Character["Head"].CFrame + Vector3.new(0,-5,0) 
			end
		end
	end
end)

keepingparts = false

-- // Extreme Claiming
if getgenv().ExtremeNetless then
	cr(cc(function()
		while RunService.RenderStepped:Wait() and Character do
			for i,v in pairs(OriginalRig:GetDescendants()) do
				if v:IsA("BasePart") then
					v:ApplyImpulse(Velocity)
					--v.Velocity = Velocity
				end
			end
		end
	end))
	cr(cc(function()
		while task.wait() and Character do
			for i,v in pairs(OriginalRig:GetDescendants()) do
				if v:IsA("BasePart") then
					v:ApplyImpulse(Velocity)
					--v.Velocity = Velocity
				end
			end
		end
	end))
end

-- // Check for death
if getgenv().CheckForDeath then -- changed OriginalRig:ClearAllChildren because some games have a ac against it
	Character.Humanoid.Died:Connect(function() pcall(function() Noclip:Disconnect(); Conversion:Disconnect(); Player.Character = OriginalRig; OriginalRig.Parent = workspace; Character:Destroy() end) end) -- checking for resetting
	Player.CharacterAdded:Connect(function() Noclip:Disconnect(); Conversion:Disconnect(); Character:Destroy() end) -- checking to see if server respawned you
end

-- // God Mode
if getgenv().GodMode and OriginalRig:FindFirstChild("Neck",true) then wait(game.Players.RespawnTime + 1); OriginalRig:FindFirstChild("Neck",true).Parent = nil keepinplace = false createnotification("Permadeath On",6) end
