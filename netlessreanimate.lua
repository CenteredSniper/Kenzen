
-- // Modules/Setup
loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))()

if _G.Fling == nil then _G.Fling = false end
if _G.ShowReal == nil then _G.ShowReal = false end
if _G.FakeGod == nil then _G.FakeGod = false end
if _G.GodMode == nil then _G.GodMode = true end
if _G.R15toR6 == nil then _G.R15toR6 = true end
if _G.Tools == nil then _G.Tools = true end
if _G.Velocity == nil then _G.Velocity = -25.05 end
if _G.Collisions == nil then _G.Collisions = true end
if _G.Network == nil then _G.Network = true end

settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
game.Players.LocalPlayer.MaximumSimulationRadius=1000
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",1000)

-- // Variables
local PhysicsService = game:GetService("PhysicsService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local velocityoffset = 0.0167664670659*_G.Velocity
local plr = Players.LocalPlayer
local Character,originalrig
local FakeTorso,FakeTorso1,FakeHead
local cr,cc = coroutine.resume,coroutine.create
local rigtype = plr.Character.Humanoid.RigType
local networkownership = isnetworkowner

local offsets = {
	["Left Arm"] = {["LeftUpperArm"] = CFrame.new(0,0.39,0),
		["LeftLowerArm"] = CFrame.new(0,-0.15,0),
		["LeftHand"] = CFrame.new(0,-0.85,0)
	},
	["Right Arm"] = {["RightUpperArm"] = CFrame.new(0,0.39,0),
		["RightLowerArm"] = CFrame.new(0,-0.15,0),
		["RightHand"] = CFrame.new(0,-0.85,0)
	},
	["Torso"] = {["UpperTorso"] = CFrame.new(0,0.2,0),
		["LowerTorso"] = CFrame.new(0,-0.8,0),
	},
	["Left Leg"] = {["LeftUpperLeg"] = CFrame.new(0,0.5,0),
		["LeftLowerLeg"] = CFrame.new(0,-0.05,0),
		["LeftFoot"] = CFrame.new(0,-0.85,0)
	},
	["Right Leg"] = {["RightUpperLeg"] = CFrame.new(0,0.5,0),
		["RightLowerLeg"] = CFrame.new(0,-0.05,0),
		["RightFoot"] = CFrame.new(0,-0.85,0)
	},
	["Head"] = {["Head"] = CFrame.new(0,0,0)},
}

-- // Collisions
local check; pcall(function() check = PhysicsService:GetCollisionGroupId("NoCollide") end)
if not check then PhysicsService:CreateCollisionGroup("NoCollide") end
PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)

if _G.FakeGod and rigtype == Enum.HumanoidRigType.R6 then _G.GodMode = false end

-- // RigType
if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
	originalrig = plr.Character
	Character = game:GetObjects("rbxassetid://8232772380")[1]:Clone()
	Character.Parent = workspace
	Character.Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(plr.UserId))
	Character.Name = "Clone " .. originalrig.Name
	Character.HumanoidRootPart.CFrame = originalrig.HumanoidRootPart.CFrame
	RunService.RenderStepped:Wait()
	for i,v in pairs(originalrig:GetChildren()) do
		if v:IsA("Tool") then
			v:Clone().Parent = Character
		end
	end
else
	plr.Character.Archivable = true
	Character = plr.Character:Clone()
	plr.Character.Archivable = false
	originalrig = plr.Character
	Character.Parent = workspace
	Character.Name = "FakeBody"
end

-- // Hat Matching Value
local function findmatchingaccessory(hat)
	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
				if v.Handle:FindFirstChildOfClass("SpecialMesh").MeshId == hat.MeshId and v.Handle:FindFirstChildOfClass("SpecialMesh").TextureId == hat.TextureID then
					local origweld = Instance.new("ObjectValue",hat)
					origweld.Value = v.Handle
					origweld.Name = "CloneHat"
				end
			else
				if v.Handle:FindFirstChildOfClass("SpecialMesh").MeshId == hat:FindFirstChildOfClass("SpecialMesh").MeshId and v.Handle:FindFirstChildOfClass("SpecialMesh").TextureId == hat:FindFirstChildOfClass("SpecialMesh").TextureId then
					local origweld = Instance.new("ObjectValue",hat)
					origweld.Value = v.Handle
					origweld.Name = "CloneHat"
				end
			end
		end
	end
end

-- // Netless claiming
for i,v in pairs(originalrig:GetDescendants()) do
	cr(cc(function()
		if v:IsA("BasePart") then
			v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
			local a = Instance.new("BodyVelocity",v)
			a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(_G.Velocity,_G.Velocity,_G.Velocity)
			local a = Instance.new("BodyAngularVelocity",v)
			a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
			if v.Parent:IsA("Accessory") then
				findmatchingaccessory(v)
			end
		end
	end))
end

wait(0.1) -- adding a wait as extra safety

-- // Weld Removing
for i,v in pairs(originalrig:GetDescendants()) do
	cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" then v:Destroy() end end))
end

-- // Turning Chosen Rig Invisible
local invisrig = _G.ShowReal and Character or originalrig
for i,v in pairs(invisrig:GetDescendants()) do
	cr(cc(function()
		if v:IsA("BasePart") or v:IsA("Decal") then
			v.Transparency = 1
			if v:IsA("BasePart") then
				local selectionbox = Instance.new("SelectionBox",v)
				selectionbox.Transparency = 1; selectionbox.Adornee = v;
			end
		elseif v:IsA("Accessory") or v:IsA("Tool") then
			v.Handle.Transparency = 1
		end
	end))
end

-- // FakeGod
if _G.FakeGod then
	if originalrig:FindFirstChild("SeeMonkey") then
		FakeTorso = originalrig.SeeMonkey.Handle
	else
		FakeTorso1 = originalrig["Kate Hair"].Handle
		FakeTorso1.Mesh:Destroy();
		FakeTorso = originalrig.Robloxclassicred.Handle
	end
	if originalrig:FindFirstChild("Dummy_Head") then
		FakeHead = originalrig.Dummy_Head.Handle
	else
		FakeHead = originalrig.MediHood.Handle
	end
	FakeTorso.Mesh:Destroy();
	for i,v in pairs(originalrig:GetChildren()) do
		if v:IsA("Accessory") then
			v.Handle.AccessoryWeld:Destroy()
		end
	end
end

-- // Setting player onto the fake rig
plr.Character.Parent = Character; plr.Character = Character
workspace.CurrentCamera.CameraSubject = Character.Humanoid

-- // Animating the fake rig
if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
	cr(cc(function()
		_G.ForHonor = Character.Animate
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/Animate"))()
	end))
else
	Character.Animate.Disabled = true; wait() Character.Animate.Disabled = false
end

-- // Making Characters not collide
for i,v in pairs(Character:GetDescendants()) do
	cr(cc(function()
		if v:IsA("BasePart") then
			PhysicsService:SetPartCollisionGroup(v, "NoCollide")
		end
	end))
end

-- // Noclip Rigs; forgot why i have this but im keeping it
local Noclip = RunService.Stepped:Connect(function(delta)
	local Collisionrig = _G.Collisions and originalrig or Character
	for i,v in pairs(Collisionrig:GetDescendants()) do
		cr(cc(function()
			if v:IsA("BasePart") then
				v.CanCollide = false
				if v:IsDescendantOf(originalrig) then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
				end
			end
		end))
	end
end)

-- You're probably wondering, why have two runservices? stepped is the only way to have cancollide off permananetly, but renderstepped is better for physics based things like cframing and velocity.

-- // Round
local function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

-- // Conversion
local Conversion = RunService.RenderStepped:Connect(function(delta)
	if _G.Network then 
		plr.MaximumSimulationRadius=1000
		sethiddenproperty(plr,"SimulationRadius",1000)
	end
	velocityoffset = round(delta,3)*_G.Velocity
	if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
		for R6PartName,R15PartNames in pairs(offsets) do
			for i,R15PartNameOffset in pairs(R15PartNames) do
				cr(cc(function()
					if originalrig:FindFirstChild(i) and networkownership(originalrig[i]) then
						local ExpectedPosition = Character[R6PartName].CFrame * R15PartNameOffset
						originalrig[i].CFrame = ExpectedPosition - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
					end
				end))
			end
		end
		for i,v in pairs(originalrig:GetChildren()) do
			cr(cc(function()
				if v:IsA("BasePart") then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
				elseif v:IsA("Accessory") and networkownership(v.Handle) then
					v.Handle.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
					v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
				end
			end))
		end
		if originalrig:FindFirstChild("HumanoidRootPart") and networkownership(originalrig["HumanoidRootPart"]) and not _G.Fling then
			originalrig["HumanoidRootPart"].CFrame = Character["HumanoidRootPart"].CFrame - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
		end
	else
		for i,v in pairs(originalrig:GetChildren()) do
			cr(cc(function()
				if v:IsA("BasePart") and networkownership(v) then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
					if v.Name == "HumanoidRootPart" and _G.Fling then
					elseif _G.FakeGod and v.Name == "Head" then
						FakeHead.CFrame = Character["Head"].CFrame - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
					elseif _G.FakeGod and v.Name == "Torso" then
						if FakeTorso1 then
							FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0.5,0,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
							FakeTorso1.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(-0.5,0,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
						else
							FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
						end
					else
						v.CFrame = Character[v.Name].CFrame - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
					end
				elseif v:IsA("Accessory") and v.Handle ~= FakeTorso and v.Handle ~= FakeTorso1 and v.Handle ~= FakeHead and networkownership(v.Handle) then
					v.Handle.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
					v.Handle.CFrame = v.Handle.CloneHat.Value.CFrame - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
				end
			end))
		end
	end
	if _G.Tools then
		for i,v in pairs(originalrig:GetChildren()) do
			cr(cc(function()
				if v:IsA("Tool") and Character:FindFirstChild(v.Name) then
					v.Handle.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
					v.Handle.CFrame = 	Character[v.Name].Handle.CFrame - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
				elseif v:IsA("Tool") then
					v.Handle.CFrame = Character["Left Leg"].CFrame * CFrame.new(0,-5,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
					v.Handle.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
				end
			end))
		end
	end
end)

-- // Check for death
Character.Humanoid.Died:Connect(function() pcall(function() Noclip:Disconnect(); Conversion:Disconnect(); plr.Character = originalrig; originalrig:ClearAllChildren(); originalrig.Parent = workspace; Character:Destroy() end) end) -- checking for resetting
plr.CharacterAdded:Connect(function() Noclip:Disconnect(); Conversion:Disconnect(); Character:Destroy() end) -- checking to see if server respawned you

-- // God Mode
if _G.GodMode then wait(game.Players.RespawnTime + 1); originalrig:FindFirstChild("Neck",true).Parent = nil end
