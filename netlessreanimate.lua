-- https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330

-- // Modules/Setup
loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))()

if _G.Fling == nil then _G.Fling = false end
if _G.TorsoFling == nil then _G.TorsoFling = false end
if _G.ShowReal == nil then _G.ShowReal = false end
if _G.FakeGod == nil then _G.FakeGod = false end
if _G.GodMode == nil then _G.GodMode = true end
if _G.R15toR6 == nil then _G.R15toR6 = true end
if _G.AutoAnimate == nil then _G.AutoAnimate = true end
if _G.Tools == nil then _G.Tools = true end
if _G.Velocity == nil then _G.Velocity = -25.05 end
if _G.Collisions == nil then _G.Collisions = true end
if _G.Network == nil then _G.Network = true end
if _G.CheckForDeath == nil then _G.CheckForDeath = true end
if _G.Netless2 == nil then _G.Netless2 = false end
if _G.Claim2 == nil then _G.Claim2 = false end
if _G.ExtremeNetless == nil then _G.ExtremeNetless = false end
if _G.Notification == nil then _G.Notification = false end

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
local function networkownership(obj)
    if isnetworkowner then
        return isnetworkowner(obj)
    else
        return true
    end
end

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

-- // Notification Function
local function createnotification(title,desc,duration)
	if _G.Notification then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title;
			Text = desc;
			Duration = duration;
		})
	end
end

-- // Collisions
local check; pcall(function() check = PhysicsService:GetCollisionGroupId("NoCollide") end)
if not check then PhysicsService:CreateCollisionGroup("NoCollide") end
PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)

if _G.FakeGod and rigtype == Enum.HumanoidRigType.R6 then _G.GodMode = false end
if _G.TorsoFling then _G.Fling = false end

-- // RigType
if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
	originalrig = plr.Character
	Character = game:GetObjects("rbxassetid://8232772380")[1]:Clone()
	Character.Parent = workspace
	Character.Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(plr.UserId))
	task.wait()
	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			v:Destroy()
		end
	end
	for i,v in pairs(originalrig:GetChildren()) do
		if v:IsA("Accessory") then
			local clonehats = v:Clone()
			clonehats.Parent = Character
			for _,g in pairs(offsets) do
				if g[v.Handle.AccessoryWeld.Part1.Name] then
					clonehats.Handle.AccessoryWeld.Part1 = Character[_]
				end
			end
			--clonehats.Handle.AccessoryWeld.Part1 = Character[v.Handle.AccessoryWeld.Part1.Name]
		end
	end
	Character.Name = "Clone " .. originalrig.Name
	Character.HumanoidRootPart.CFrame = originalrig.HumanoidRootPart.CFrame
	task.wait()
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
				if v.Handle.MeshId == hat.MeshId and v.Handle.TextureID == hat.TextureID then
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

-- // Claim 2

local origpos

plr.Character.Humanoid.PlatformStand = true

if _G.Claim2 then
	origpos = plr.Character.HumanoidRootPart.CFrame
	local actualpos
	repeat wait() 
		pcall(function()
			local pos = plr.Character.HumanoidRootPart.Position + Vector3.new(math.random(-1500,1500),100,math.random(-1500,1500))
			local check = true
			for i,v in pairs(game.Players:GetPlayers()) do
				if v~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
					if (v.Character.HumanoidRootPart.Position-pos).magnitude <= gethiddenproperty(v, "SimulationRadius") then
						check = false
					end
				end
			end
			if check then
				actualpos = pos
			end
		end)
	until actualpos
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(actualpos)
	createnotification("Claim2","Found Position outside of other's net sims",6)
end

-- // Netless claiming
for i,v in pairs(originalrig:GetDescendants()) do
	cr(cc(function()
		if v:IsA("BasePart") then
			v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
			if _G.Netless2 then
				local a = Instance.new("BodyVelocity",v)
				a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(0,0,0)
				local a = Instance.new("BodyAngularVelocity",v)
				a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
			else
				local a = Instance.new("BodyVelocity",v)
				a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(_G.Velocity,_G.Velocity,_G.Velocity)
				local a = Instance.new("BodyAngularVelocity",v)
				a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
			end
			v.Massless = true
			v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
			if v.Parent:IsA("Accessory") then
				findmatchingaccessory(v)
			end
		end
	end))
end
createnotification("Net Claimed","Claimed parts using netless",6)

local tools = {}
for i,v in pairs(originalrig:GetChildren()) do
	if v:IsA("Tool") then
		v.Parent = plr.Backpack
		table.insert(tools,v)
	end
end

wait(0.1) -- adding a wait as extra safety

-- // Noclip Rigs; forgot why i have this but im keeping it
local Noclip = RunService.Stepped:Connect(function(delta)
	local Collisionrig = _G.Collisions and originalrig or Character
	for i,v in pairs(Collisionrig:GetDescendants()) do
		cr(cc(function()
			if v:IsA("BasePart") then
				v.CanCollide = false
				if v:IsDescendantOf(originalrig) and _G.ExtremeNetless then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
				end
			end
		end))
	end
end)

-- // Claim 2 Bring back
local keepingparts = true
if _G.Claim2 then
	for i,v in pairs(originalrig:GetDescendants()) do
		cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" or v:IsA("Weld") and v.Name ~= "Neck" then v:Destroy() end end))
	end
	cr(cc(function()
		while keepingparts and task.wait() do
			for i,v in pairs(originalrig:GetDescendants()) do
				if v:IsA("BasePart") and v.Name ~= "Head" and v.Name ~= "HumanoidRootPart" then
					v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
	end))
	wait(0.5)
	local animat = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(5), {CFrame = origpos})
	animat:Play()
	animat.Completed:wait()
else
	for i,v in pairs(originalrig:GetDescendants()) do
		cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" or v:IsA("Weld") and v.Name ~= "Neck" then v:Destroy() end end))
	end
end

--[[
-- // Weld Removing
for i,v in pairs(originalrig:GetDescendants()) do
	cr(cc(function() if v:IsA("Motor6D") and v.Name ~= "Neck" then v:Destroy() end end))
end]]

-- // Godmode Keep Humroot in place during fling
if _G.GodMode and originalrig:FindFirstChild("Neck",true) then
	if _G.Fling then
		local savepos = originalrig.HumanoidRootPart.CFrame
		cr(cc(function()
			while keepinplace and task.wait() do
				originalrig.HumanoidRootPart.CFrame = savepos
			end
		end))
	elseif _G.TorsoFling then
		local savepos = originalrig.HumanoidRootPart.CFrame
		cr(cc(function()
			while keepinplace and task.wait() do
				if rigtype == Enum.HumanoidRigType.R6 then
					originalrig.Torso.CFrame = savepos
				else
					originalrig["LowerTorso"].CFrame = savepos
				end

			end
		end))
	end
end

-- // FakeGod
if _G.FakeGod then
	if originalrig:FindFirstChild("SeeMonkey") then
		FakeTorso = originalrig.SeeMonkey.Handle
		Character.SeeMonkey.Handle.Transparency = 1
	else
		FakeTorso1 = originalrig["Kate Hair"].Handle
		FakeTorso1.Mesh:Destroy();
		FakeTorso = originalrig.Robloxclassicred.Handle
		Character["Kate Hair"].Handle.Transparency = 1
		Character["Robloxclassicred"].Handle.Transparency = 1
	end
	if originalrig:FindFirstChild("Void Head") then
		FakeHead = originalrig["Void Head"].Handle
		Character["Void Head"].Handle.Transparency = 1
	elseif originalrig:FindFirstChild("Dummy_Head") then
		FakeHead = originalrig["Dummy_Head"].Handle
		Character["Dummy_Head"].Handle.Transparency = 1
	else
		FakeHead = originalrig.MediHood.Handle
		Character["MediHood"].Handle.Transparency = 1
	end
	FakeTorso.Mesh:Destroy();
end

-- // Setting player onto the fake rig
for i,v in pairs(tools) do
	if v:IsA("Tool") then
		v.Parent = originalrig
	end
end
task.wait()
plr.Character.Parent = Character; plr.Character = Character
workspace.CurrentCamera.CameraSubject = Character.Humanoid
createnotification("Fake Body","Set Character to Fake Rig",6)

-- // Turning Chosen Rig Invisible
local invisrig = _G.ShowReal and Character or originalrig
for i,v in pairs(invisrig:GetChildren()) do
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

-- // Animating the fake rig
if _G.AutoAnimate then
	if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
		cr(cc(function()
			_G.ForHonor = Character.Animate
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/Animate"))()
		end))
	else
		Character.Animate.Disabled = true; wait() Character.Animate.Disabled = false
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

-- You're probably wondering, why have two runservices? stepped is the only way to have cancollide off permananetly, but heartbeat is better for physics based things like cframing and velocity.

-- // Conversion
local Conversion = RunService.Heartbeat:Connect(function(delta)
	keepingparts = false
	if _G.Network then 
		plr.MaximumSimulationRadius=1000
		sethiddenproperty(plr,"SimulationRadius",1000)
	end
	velocityoffset = 0
	if _G.Netless2 then velocityoffset = 0 end
	if rigtype == Enum.HumanoidRigType.R15 and _G.R15toR6 then
		for R6PartName,R15PartNames in pairs(offsets) do
			for i,R15PartNameOffset in pairs(R15PartNames) do
				cr(cc(function()
					if originalrig:FindFirstChild(i) and networkownership(originalrig[i]) then
						if i == "LowerTorso" and _G.TorsoFling then
						elseif i == "Torso" and _G.TorsoFling then
						else
							local ExpectedPosition = Character[R6PartName].CFrame * R15PartNameOffset
							originalrig[i].CFrame = ExpectedPosition - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
						end
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
				if v:IsA("BasePart") then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
					if v.Name == "HumanoidRootPart" and _G.Fling and networkownership(v) then
					elseif _G.TorsoFling and v.Name == "Torso" or v.Name == "LowerTorso" and networkownership(FakeHead)  then	
					elseif _G.FakeGod and v.Name == "Head" and networkownership(FakeHead)  then
						FakeHead.CFrame = Character["Head"].CFrame
					elseif _G.FakeGod and v.Name == "Torso" and networkownership(FakeTorso)  then
						if FakeTorso1 then
							FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(0.5,0,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
							FakeTorso1.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) * CFrame.new(-0.5,0,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
						else
							FakeTorso.CFrame = Character["Torso"].CFrame * CFrame.Angles(math.rad(-90),0,0) - Vector3.new(velocityoffset,velocityoffset,velocityoffset)
						end
					elseif networkownership(v) then
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

-- // Extreme Claiming
if _G.ExtremeNetless then
	cr(cc(function()
		while RunService.RenderStepped:Wait() and Character do
			for i,v in pairs(originalrig:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
				end
			end
		end
	end))
	cr(cc(function()
		while wait() and Character do
			for i,v in pairs(originalrig:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Velocity = Vector3.new(_G.Velocity, _G.Velocity, _G.Velocity)
				end
			end
		end
	end))
end

-- // Check for death
if _G.CheckForDeath then -- changed originalrig:ClearAllChildren because some games have a ac against it
	Character.Humanoid.Died:Connect(function() pcall(function() Noclip:Disconnect(); Conversion:Disconnect(); plr.Character = originalrig; originalrig.Parent = workspace; Character:Destroy() end) end) -- checking for resetting
	plr.CharacterAdded:Connect(function() Noclip:Disconnect(); Conversion:Disconnect(); Character:Destroy() end) -- checking to see if server respawned you
end

-- // God Mode
if _G.GodMode and originalrig:FindFirstChild("Neck",true) then wait(game.Players.RespawnTime + 1); originalrig:FindFirstChild("Neck",true).Parent = nil keepinplace = false createnotification("Permadeath","God Mode Enabled",6) end
