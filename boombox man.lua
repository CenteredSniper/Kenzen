local player = game.Players.LocalPlayer
local boombox = player.Character.BoomBox
    local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, player.Character
	local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
	local nHuman = Human.Clone(Human)
	nHuman.Parent, player.Character = Char, nil
	nHuman.SetStateEnabled(nHuman, 15, false)
	nHuman.SetStateEnabled(nHuman, 1, false)
	nHuman.SetStateEnabled(nHuman, 0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	player.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
	nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local Script = Char.FindFirstChild(Char, "Animate")
	if Script then
		Script.Disabled = true
		wait()
		Script.Disabled = false
	end
	nHuman.Health = nHuman.MaxHealth
wait(5)

local function NoFall(Part)
	Instance.new("BodyForce",Part).Force = Vector3.new(0,196.2,0)
	Instance.new("BodyAngularVelocity",Part).AngularVelocity = Vector3.new(0,0,0)
end

local Create = function(Obj,Parent)
	local I = Instance.new(Obj); I['Parent'] = Parent; return I
end

NoFall(player.Character["Right Leg"]); NoFall(player.Character["Left Leg"]); NoFall(boombox.Handle)

local function createweld(weld)
	if weld:IsA("Motor6D") then
		local AP, AO, A0 = Create('AlignPosition',weld.Part1), Create('AlignOrientation',weld.Part1), Create('Attachment',weld.Part1)
		local A1 = Create('Attachment',player.Character.HumanoidRootPart)
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = weld.Name; 
		A0.CFrame = weld.C0; A1.CFrame = weld.C1; A1.Position = A1.Position + Vector3.new(0,-4,0); weld:Destroy()
	else
		local AP, AO, A0 = Create('AlignPosition',weld), Create('AlignOrientation',weld), Create('Attachment',weld)
		local A1 = Create('Attachment',player.Character.HumanoidRootPart)
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = weld.Parent.Name; 
	end
end

createweld(player.Character.Torso["Left Hip"]); createweld(player.Character.Torso["Right Hip"]); createweld(boombox.Handle)

local function CFrameBypass(pos)
	local Arm = game.Players.LocalPlayer.Character["HumanoidRootPart"].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
	local cframe = Arm:toObjectSpace(pos):inverse()
	--tool.Parent = game.Players.LocalPlayer.Backpack
	--tool.Grip = cframe
	--tool.Parent = game.Players.LocalPlayer.Character
	return cframe
 end

local running = false

player.Character.Humanoid['Running']:Connect(function(Speed)
	running = Speed >= 6
end)

game["Run Service"].RenderStepped:Connect(function(delta)
	--[[
	game:GetService("TweenService"):Create(player.Character["Left Leg"].CFAttachment0,TweenInfo.new(delta),{CFrame = player.Character["Left Leg"].CFAttachment0.CFrame}):Play()
	game:GetService("TweenService"):Create(player.Character["Right Leg"].CFAttachment0,TweenInfo.new(delta),{CFrame = player.Character["Right Leg"].CFAttachment0.CFrame}):Play()
	game:GetService("TweenService"):Create(player.Character["HumanoidRootPart"]["Left Hip"],TweenInfo.new(delta),{CFrame = player.Character["HumanoidRootPart"]["Left Hip"].Value.Value * CFrame.new(0,-3,0)}):Play()
	game:GetService("TweenService"):Create(player.Character["HumanoidRootPart"]["Right Hip"],TweenInfo.new(delta),{CFrame = player.Character["HumanoidRootPart"]["Right Hip"].Value.Value * CFrame.new(0,-3,0)}):Play()
	]]
	if boombox.Handle.CanCollide then boombox.Handle.CanCollide = false end
	game:GetService("TweenService"):Create(boombox.Handle.CFAttachment0,TweenInfo.new(delta),{CFrame = CFrameBypass(player.Character["HumanoidRootPart"].CFrame * CFrame.new(0,-1,0.2) * CFrame.Angles(math.rad(-90),0,0))}):Play()
	if delta <= 0.01 then return end
	player.Character["Right Leg"].Velocity = Vector3.new(-30,0,0)
	player.Character["Left Leg"].Velocity = Vector3.new(-30,0,0)
end)

local switch = false

for i,v in pairs(player.Character:GetChildren()) do
	if v:IsA("BasePart") and v.Name:split(" ")[2] ~= "Leg" and v.Name ~= "HumanoidRootPart" then
		v.Parent = nil
	end
end

player.Chatted:Connect(function(msg)
	msg = msg:split(" ")
	if msg[1] == "/song" and msg[2] and msg[2] ~= "" and tonumber(msg[2]) then
		boombox.Remote:FireServer("PlaySong", msg[2])
	end
end)

while wait(0.5) do
	if running then
		if switch then
			switch = false
			player.Character["HumanoidRootPart"]["Left Hip"].Orientation = Vector3.new(0,90,-25)
			player.Character["HumanoidRootPart"]["Left Hip"].Position = Vector3.new(0.5,-2.9,0.9)
			player.Character["HumanoidRootPart"]["Right Hip"].Orientation = Vector3.new(0,90,25)
			player.Character["HumanoidRootPart"]["Right Hip"].Position = Vector3.new(1.5,-2.9,-0.9)
		else
			switch = true
			player.Character["HumanoidRootPart"]["Left Hip"].Orientation = Vector3.new(0,90,25)
			player.Character["HumanoidRootPart"]["Left Hip"].Position = Vector3.new(0.5,-2.9,-0.9)
			player.Character["HumanoidRootPart"]["Right Hip"].Orientation = Vector3.new(0,90,-25)
			player.Character["HumanoidRootPart"]["Right Hip"].Position = Vector3.new(1.5,-2.9,0.9)
		end
	else
		player.Character["HumanoidRootPart"]["Left Hip"].Orientation = Vector3.new(0,90,0)
		player.Character["HumanoidRootPart"]["Left Hip"].Position = Vector3.new(0.5,-3,0)
		player.Character["HumanoidRootPart"]["Right Hip"].Orientation = Vector3.new(0,90,0)
		player.Character["HumanoidRootPart"]["Right Hip"].Position = Vector3.new(1.5,-3,0)
	end
end
