--bra 

--[[
	Needed Hats;

	https://www.roblox.com/catalog/12565541/Motocross-76-Old-Glory
	https://www.roblox.com/catalog/5858810459/Black-Blindfold
	https://www.roblox.com/catalog/14463468/Motocross-77-The-Sting
	https://www.roblox.com/catalog/11679229/Motocross-62-Fire
	https://www.roblox.com/catalog/11142504/Motocross-48-Old-Skool
	https://www.roblox.com/catalog/7744911570/Cool-Blindfold-in-Black
]]

local player = game.Players.LocalPlayer
--local lastpos = nil

local function boobie(char)
	--if lastpos then char.HumanoidRootPart.CFrame = lastpos wait(1) end
	local root = char.Torso
	
	local parts = {
		["Boob1"] = char["Racing Helmet Flames"].Handle,
		["Boob2"] = char["Racing Helmet"].Handle,
		["Bra1"] = char["Meshes/BlindfoldAccessory"].Handle,
		["Bra2"] = char["Meshes/CoolBlindfoldAccessory"].Handle,
		["Ass1"] = char["Stinger77"].Handle,
		["Ass2"] = char["Racing Helmet USA"].Handle,
	}
	
	parts["Boob1"]:FindFirstChild("Mesh"):Destroy()
	parts["Boob2"]:FindFirstChild("Mesh"):Destroy()
	parts["Ass1"]:FindFirstChild("Mesh"):Destroy()
	parts["Ass2"]:FindFirstChild("Mesh"):Destroy()
	
	local function NoFall(Part)
		Instance.new("BodyForce",Part).Force = Vector3.new(0,196.2,0)
		Instance.new("BodyAngularVelocity",Part).AngularVelocity = Vector3.new(0,0,0)
	end
	
	local Create = function(Obj,Parent)
		local I = Instance.new(Obj); I['Parent'] = Parent; return I
	end
	
	for i,v in pairs(parts) do
		NoFall(v)
		v:FindFirstChildOfClass("Attachment"):Destroy(); 
		local AP, AO, A0 = Create('AlignPosition',v), Create('AlignOrientation',v), Create('Attachment',v)
		local A1 = Create('Attachment',root)
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; 
		v:FindFirstChildOfClass("Weld"):Destroy(); 
	end
	
	local function CFrameBypass(pos)
		local Arm = root.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
		local cframe = Arm:toObjectSpace(pos):inverse()
		--tool.Parent = game.Players.LocalPlayer.Backpack
		--tool.Grip = cframe
		--tool.Parent = game.Players.LocalPlayer.Character
		return cframe
	 end
	local deltt = 0
	local a = game["Run Service"].RenderStepped:Connect(function(delta)
		deltt = deltt + delta
		local rootcf = root.CFrame * CFrame.new(0,-1.2,0) * CFrame.Angles(math.rad(-90),0,0)
		--parts["Boob1"].CFAttachment0.CFrame = CFrameBypass(rootcf * CFrame.new(-0.412, 0.307, -0.268) * CFrame.Angles(0,math.rad(-1.28),0))
		--parts["Boob2"].CFAttachment0.CFrame = CFrameBypass(rootcf * CFrame.new(0.343, 0.307, -0.268) * CFrame.Angles(0,math.rad(-1.28),0))
		--parts["Bra1"].CFAttachment0.CFrame = CFrameBypass(rootcf * CFrame.new(-0.432, 0.017, -0.04) * CFrame.Angles(math.rad(-25.54), math.rad(1.08), math.rad(-11.01)))
		--parts["Bra2"].CFAttachment0.CFrame = CFrameBypass(rootcf * CFrame.new(0.456, -0.082, 0.079) * CFrame.Angles(math.rad(-21.94), math.rad(-14.12), math.rad(19.3)))
		game:GetService("TweenService"):Create(parts["Boob1"].CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(rootcf * CFrame.new(-0.412, 0.307, -0.268) * CFrame.Angles(0,math.rad(-1.28),0))}):Play()
		game:GetService("TweenService"):Create(parts["Boob2"].CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(rootcf * CFrame.new(0.343, 0.307, -0.268) * CFrame.Angles(0,math.rad(-1.28),0))}):Play()
		game:GetService("TweenService"):Create(parts["Bra1"].CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(rootcf * CFrame.new(-0.432, 0.017, -0.04) * CFrame.Angles(math.rad(-25.54), math.rad(1.08), math.rad(-11.01)))}):Play()
		game:GetService("TweenService"):Create(parts["Bra2"].CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(rootcf * CFrame.new(0.456, -0.082, 0.079) * CFrame.Angles(math.rad(-21.94), math.rad(-14.12), math.rad(19.3)))}):Play()
		game:GetService("TweenService"):Create(parts["Ass1"].CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(rootcf * CFrame.new(0.456, -0.96, 0.6))}):Play()
		game:GetService("TweenService"):Create(parts["Ass2"].CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(rootcf * CFrame.new(-0.484, -0.96, 0.6))}):Play()
		if delta <= 0.01 then return end
		for i,v in pairs(parts) do
			v.Velocity = Vector3.new(-30,0,0)
		end
	end)
	--[[
	char.Humanoid.Died:Connect(function()
		a:Disconnect()
		lastpos = char.HumanoidRootPart.CFrame
	end)]]
end
--[[
player.CharacterAdded:Connect(function(v)
	wait(1)
	boobie(v)
end)
]]

boobie(player.Character)
