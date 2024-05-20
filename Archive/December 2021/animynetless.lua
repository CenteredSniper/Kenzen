--[[ // METADATA

Last Modified: 12/31/2021 4:07AM
Author: Me

--]]


-- ProductionTakeOne#3330 //

-- AnimY [Remastered AnimX] // 

-- Loading\Services //

local tween_service = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local run_service = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local gui = game:GetObjects("rbxassetid://7113228606")[1]
local partgui = game:GetObjects("rbxassetid://7866869891")[1]
local animationslist = game:GetObjects("rbxassetid://7979581499")[1] --7979526466")[1] --7948728902")[1] --7113399253")[1]
local dancing,dancingplay,can_collide,cframetoggle,fakehead,godmode = false,false,true,false,true,false
local play_the_animation, joints, anims, connections, character, dragToggle, dragInput, dragStart, selected, sound, boombox
repeat task.wait() until gui and partgui
local frametomove,dragSpeed,closed = gui.Drag,0,true

-- Functions //

for i,v in pairs(partgui.Frame:GetChildren()) do
	if v:IsA("TextLabel") then
		v.Text = v.Name
	end
end
partgui.ResetOnSpawn = false; partgui.Parent = game.CoreGui

local function runanimation(button)
	if selected == button.Name then
		dancing = false; selected = nil; if sound then sound:Destroy() sound = nil end
		if boombox then character[game.Players.LocalPlayer.Name]:FindFirstChild("Remote",true):FireServer("PlaySong", "0") end
	else
		if play_the_animation ~= nil then
			selected = button.Name
			local theidslol = button.Name:split(" ")
			play_the_animation(theidslol[1],theidslol[2])
		else
			if printconsole then printconsole("Please use /load!"); else warn("Please use /load!") end
			wait(0.1)
			game.StarterGui:SetCore("ChatMakeSystemMessage",{Text = "{AnimY}: Please use /load or /e load!"})
		end
	end
end

local Create = function(Obj,Parent)
	local I = Instance.new(Obj); I['Parent'] = Parent; return I
end

local Contains = function(Table,KV)
	for K,V in next, Table do 
		if rawequal(KV,K) or rawequal(KV,V) then 
			return true;
		end
	end
	return false
end

local checkstyle = function(dastyle)
	if tostring(Style):split('.')[3] ~= "Linear" or
		tostring(Style):split('.')[3] ~= "Sine" and
		tostring(Style):split('.')[3] ~= "Back" and
		tostring(Style):split('.')[3] ~= "Quad" and
		tostring(Style):split('.')[3] ~= "Quart" and
		tostring(Style):split('.')[3] ~= "Quint" and
		tostring(Style):split('.')[3] ~= "Bounce" and
		tostring(Style):split('.')[3] ~= "Elastic" and
		tostring(Style):split('.')[3] ~= "Exponential" and
		tostring(Style):split('.')[3] ~= "Circular" and
		tostring(Style):split('.')[3] ~= "Cubic" then
		return true
	end
end

local Edit = function(Part,Value,Duration,Style,Direction)
	if checkstyle(Style) then Style = 'Enum.EasingStyle.Linear' end
	Style = Style or 'Enum.EasingStyle.Linear'; Direction = Direction or 'Enum.EasingDirection.In'
	local Attachment = Part--:FindFirstChild('CFAttachment0')
	if Attachment ~= nil then
		Attachment = joints[Part.Name]
		--Attachment.Transform = Value
		if cframetoggle then
			Attachment.Transform = Value
		else
			tween_service:Create(Attachment,TweenInfo.new(Duration,Enum['EasingStyle'][tostring(Style):split('.')[3]],Enum['EasingDirection'][tostring(Direction):split('.')[3]],0,false,0),{Transform = Value}):Play()
		end
		
		--if cframetoggle then
		--	Attachment.CFrame = Value
		--else
			--tween_service:Create(Attachment,TweenInfo.new(Duration,Enum['EasingStyle'][tostring(Style):split('.')[3]],Enum['EasingDirection'][tostring(Direction):split('.')[3]],0,false,0),{CFrame = Value}):Play()
		--end
		
	end
end

local PoseToCF = function(Pose,Motor)
	return (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] * Motor['C1']:Inverse()):ToObjectSpace(Motor['Part0'].CFrame)
end

local animspeed = 1

local PreloadAnimation = function(AssetId)
	local Sequence = game:GetObjects('rbxassetid://'..tostring(AssetId))[1]; assert(Sequence:IsA('KeyframeSequence'),'Instance is not a KeyframeSequence.')
	repeat task.wait() until Sequence
	local Class = {}
	--Class['Speed'] = animspeed
	local Keyframes = Sequence:GetKeyframes()
	local Yield = function(Seconds)
		local Time = Seconds * (60.8) --+ Keyframes[#Keyframes].Time)
		for I = 1,Time,animspeed do 
			run_service.Delta['Event']:Wait()
		end
	end
	Class['Stopped'] = false;
	Class['Complete'] = Instance.new('BindableEvent')
	Class['Play'] = function()
		Class['Stopped'] = false
		if boombox and dancing then
			repeat task.wait() until boombox.Handle.Sound.Playing and boombox.Handle.Sound.TimeLength ~= 0
		elseif sound and dancing then
			--print(sound) print(sound.SoundId)
			repeat task.wait() until sound.Playing
		end
		coroutine.wrap(function()
			repeat
				for K = 1,#Keyframes do 
					local K0, K1, K2 = Keyframes[K-1], Keyframes[K], Keyframes[K+1]
					if Class['Stopped'] ~= true and player.Character.Humanoid.Health > 0 then
						if K0 ~= nil then 
							Yield(K1['Time'] - K0['Time'])
						end
						coroutine.wrap(function()
							for I = 1,#K1:GetDescendants() do 
								local Pose = K1:GetDescendants()[I]
								if Contains(joints,Pose['Name']) and player.Character:FindFirstChild(Pose['Name']) then 
									local Duration = K2 ~= nil and (K2['Time'] - K1['Time'])/animspeed or .5
									--Edit(player.Character[Pose['Name']],PoseToCF(Pose,joints[Pose['Name']]),Duration,Pose['EasingStyle'],Pose['EasingDirection'])
									Edit(player.Character[Pose['Name']],Pose.CFrame,Duration,Pose['EasingStyle'],Pose['EasingDirection'])
								end
							end
						end)()
					end
				end
				Class['Complete']:Fire()
			until Sequence['Loop'] ~= true or Class['Stopped'] ~= false or player.Character.Humanoid.Health < 1
		end)()
	end
	Class['Stop'] = function()
		Class['Stopped'] = true;
	end
	Class['Reset'] = function()
		coroutine.wrap(function()
			wait(.02)
			assert(Class['Stopped'],'Track Must Be Stopped First!')
			for K,V in next, joints do 
				local Part = Char[K]
				if Part ~= nil then 
					local Attachment = Part:FindFirstChild('CFAttachment0')
					if Attachment ~= nil then 
						Attachment['CFrame'] = V['C1'] * V['C0']:Inverse()
					end
				end
			end
		end)()
	end
	return Class
end

local StopAll = function()
	for K,V in next, anims do 
		if V['Stopped'] ~= true then 
			V:Stop()
		end
	end
end

local cframey = CFrame.new(0,-2.3,0)
local cframey2 = CFrame.Angles(math.rad(90),math.rad(90),math.rad(90))
local cframey3 = CFrame.new(0,-1.5,1)
local cframey4 = CFrame.Angles(math.rad(180),math.rad(0),math.rad(110))
local boomlocation = "Right Arm"
local miclocation = "Right Arm"
local A1 = nil
local A2 = nil
local claim2 = false
--_G.CFramey = CFrame.new(0,-2.3,0)
--_G.CFramey2 = CFrame.Angles(math.rad(90),math.rad(90),math.rad(90))
local function CFrameBypass(pos,location)
	local Arm = game.Players.LocalPlayer.Character[location].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
	local cframe = Arm:toObjectSpace(pos):inverse()
	--tool.Parent = game.Players.LocalPlayer.Backpack
	--tool.Grip = cframe
	--tool.Parent = game.Players.LocalPlayer.Character
	return cframe
end
local function NoFall(Part)
	Instance.new("BodyForce",Part).Force = Vector3.new(0,196.2,0)
	Instance.new("BodyAngularVelocity",Part).AngularVelocity = Vector3.new(0,0,0)
end
---_G.Value1,_G.Value2,_G.Value3 = 180,90,0

local function fakeheadfun()
	local head = game.Players.LocalPlayer.Character.Head
	local a = head:Clone(); a.Name = "Head"; head.Name = "FakeHead"; a.Parent = game.Players.LocalPlayer.Character; a.CanCollide = false
	local b = game.Players.LocalPlayer.Character.Torso.Neck:Clone(); b.Name = "FakeNeck"; b.Part1 = a; b.Parent = game.Players.LocalPlayer.Character.Torso
	head.Transparency = 1; head.face:Destroy()
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA("Accessory") then if v.Handle.AccessoryWeld.Part1 == head then v.Handle.AccessoryWeld.Part1 = a end end end
end

local function god()
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
end

local function respawn()
	local char = player.Character
	if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	plr.Character = newChar
	wait()
	plr.Character = char
	newChar:Destroy()
end

local function AnimationLoader()
	if fakehead then fakeheadfun() end
	local hatinfoforgod = {}
	if godmode then
		for i,v in pairs(player.Character:GetChildren()) do
			if v:IsA("Accessory") then
				local AP, AO, A0 = Create('AlignPosition',v.Handle), Create('AlignOrientation',v.Handle), Create('Attachment',v.Handle)
				A2 = Create('Attachment',v.Handle.AccessoryWeld.Part1)
				AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A2; AO['Attachment0'] = A0; AO['Attachment1'] = A2;
				A0['Name'] = 'HatCFAttachment0'; A2['Name'] = 'HatCFAttachment0'; 
				A0.CFrame = v.Handle.AccessoryWeld.C0
				A2.CFrame = v.Handle.AccessoryWeld.C1
				table.insert(hatinfoforgod,{A0,A2})
				v.Handle.AccessoryWeld:Destroy()
			end
		end
		god()
	end
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	settings().Physics.AllowSleep = false
	boombox = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Remote",true)
	microphone = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microphone")
	if claim2 then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart"then
				NoFall(v)
			end
		end
	end
	if boombox then
		repeat 
			boombox = boombox.Parent
			task.wait()
		until boombox:IsA("Tool")
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightGrip",true):Destroy()
		--NoFall(boombox.Handle)
		--local AP, AO, A0 = Create('AlignPosition',boombox.Handle), Create('AlignOrientation',boombox.Handle), Create('Attachment',boombox.Handle)
		--A1 = Create('Attachment',game.Players.LocalPlayer.Character[boomlocation])
		--AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		--A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; 
	end
	if microphone then
		--NoFall(microphone.Handle)
		microphone.Handle.AccessoryWeld:Destroy()
		local AP, AO, A0 = Create('AlignPosition',microphone.Handle), Create('AlignOrientation',microphone.Handle), Create('Attachment',microphone.Handle)
		A2 = Create('Attachment',game.Players.LocalPlayer.Character[miclocation])
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A2; AO['Attachment0'] = A0; AO['Attachment1'] = A2;
		A0['Name'] = 'CFAttachment0'; A2['Name'] = 'CFAttachment1'; 
	end
	local deltt = 0
	local renderstp  = game:GetService("RunService").Heartbeat:Connect(function(delta)
		deltt = deltt + delta
		if boombox then
			if boombox.Handle.CanCollide then boombox.Handle.CanCollide = false end
			--boombox.Handle.Velocity = Vector3.new(0x1e,0,0)
			--boombox.Handle.Velocity = Vector3.new(-30,0,0)
			--boombox.Handle:FindFirstChild('CFAttachment0').CFrame = CFrameBypass(player.Character[boomlocation].CFrame * cframey * cframey2)
			--tween_service:Create(boombox.Handle:FindFirstChild('CFAttachment0'),TweenInfo.new((delta)),{CFrame = CFrameBypass(player.Character[boomlocation].CFrame * cframey * cframey2,boomlocation)}):Play()
			--print(boomlocation)
			boombox.Handle.CFrame = player.Character:WaitForChild("Torso").CFrame*CFrame.new(Vector3.new(0,0,1))*CFrame.Angles(0,math.rad(180),math.rad(45))--player.Character[boomlocation].CFrame * cframey * cframey2 * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
			if isnetworkowner(boombox.Handle) then
				partgui.Frame.boombox.BackgroundColor3 =  Color3.new(0,1,0)
			else
				partgui.Frame.boombox.BackgroundColor3 =  Color3.new(1,0,0)
			end
		end
		if microphone then
			if microphone.Handle.CanCollide then microphone.Handle.CanCollide = false end
			--microphone.Handle.Velocity = Vector3.new(0x1e,0,0)
			--microphone.Handle.Velocity = Vector3.new(-30,0,0)
			tween_service:Create(microphone.Handle:FindFirstChild('CFAttachment0'),TweenInfo.new((delta)),{CFrame = CFrameBypass(player.Character[miclocation].CFrame * cframey3 * cframey4,miclocation)}):Play()
			if isnetworkowner(microphone.Handle) then
				partgui.Frame.microphone.BackgroundColor3 =  Color3.new(0,1,0)
			else
				partgui.Frame.microphone.BackgroundColor3 =  Color3.new(1,0,0)
			end
		end
		if godmode then
			for _,g in pairs(hatinfoforgod) do
				for i,v in pairs(g) do
					game:GetService("TweenService"):Create(v,TweenInfo.new(delta),{CFrame = v.CFrame}):Play()
				end
				--g[1].Parent.Velocity = Vector3.new(-30,0,0)
				if g[1].Parent:FindFirstChild("AccessoryWeld") then
					g[1].Parent.AccessoryWeld:Destroy()
				end
			end
		end
	end)
	warn(1)
	character = player['Character']
	local torso, root, humanoid = character['Torso'], character['HumanoidRootPart'], character['Humanoid']
	joints = {
		['Torso'] = root['RootJoint'];
		['Left Arm'] = torso['Left Shoulder'];
		['Right Arm'] = torso['Right Shoulder'];
		['Left Leg'] = torso['Left Hip'];
		['Right Leg'] = torso['Right Hip'];
	}
	warn(1)
	if fakehead then joints['Head'] = torso['FakeNeck'] end
	coroutine.wrap(function()
		root['Anchored'] = true;
		wait(.8)
		root['Anchored'] = false;
	end)()
	if godmode then joints['Head'] = torso['Neck']; root['Anchored'] = true; 
		game.StarterGui:SetCore("SendNotification",{Title = "Please wait " .. tostring(game.Players.RespawnTime + 2) .. " seconds",Text = "godmode method is cringe Lol."})
		--wait(4); root['Anchored'] = false
		wait(game.Players.RespawnTime + 2); root['Anchored'] = false
	end
	warn(1)
	--[[
	for K,V in next, joints do 
		local AP, AO, A0, A1 = Create('AlignPosition',V['Part1']), Create('AlignOrientation',V['Part1']), Create('Attachment',V['Part1']), Create('Attachment',V['Part0'])
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; A0['CFrame'] = V['C1'] * V['C0']:Inverse(); V.Parent = nil --V:Remove()
	end
	]]
	character.Animate.Disabled = true

	-- Stop all playing animations
	for i, track in pairs (humanoid:GetPlayingAnimationTracks()) do
		track:Stop()
	end
	warn(1)
	if not run_service:FindFirstChild('Delta') then
		local Delta = Create('BindableEvent',run_service); Delta['Name'] = 'Delta'
		local A, B = 0, tick()
		run_service.Delta:Fire(); run_service.Heartbeat:Connect(function(C, D)
			A = A + C
			if A >= (1/60) then
				for I = 1, math.floor(A / (1/60)) do
					run_service.Delta:Fire()
				end
				B = tick()
				A = A - (1/60) * math.floor(A / (1/60))
			end
		end)
	end
	warn(1)
	local randomidle = {180435571,7840378308}
	randomidle = randomidle[math.random(1,2)]
	anims = {
		['Idle'] = PreloadAnimation(randomidle,true,character); --5183986020
		['Walk'] = PreloadAnimation(6606119539,true,character);  --5053650512,180426354
		['Run'] = PreloadAnimation(180426354,true,character); --5053715968
		['Jump'] = PreloadAnimation(125750702,true,character); --4073859368
		['Fall'] = PreloadAnimation(180436148,true,character); --3323393688
	}

	--wait(1)
	task.wait()
	warn(1)
	connections = {};
	anims['Idle']:Play(); dancing = false; anims['Walk'].Stopped = true; anims['Run'].Stopped = true

	connections['Run'] = humanoid['Running']:Connect(function(Speed)
		if Speed > 6 and dancing ~= true and anims['Walk'].Stopped ~= false then
			anims['Idle']:Stop()
			anims['Jump']:Stop()
			anims['Fall']:Stop()
			anims['Run']:Stop()
			anims['Walk']:Play()
		elseif Speed < 5 and dancing ~= true and anims['Walk'].Stopped ~= true then
			anims['Walk']:Stop()
			anims['Jump']:Stop()
			anims['Fall']:Stop()
			anims['Run']:Stop()
			anims['Idle']:Play()
		elseif Speed < 5 and dancing ~= true and anims['Jump'].Stopped ~= true or anims['Fall'].Stopped ~= true then
			anims['Walk']:Stop()
			anims['Jump']:Stop()
			anims['Fall']:Stop()
			anims['Run']:Stop()
			anims['Idle']:Play()
		end
	end)

	connections['Jumping'] = humanoid['Jumping']:Connect(function(active)
		if active and dancing ~= true and anims['Jump'].Stopped ~= false then
			anims['Idle']:Stop()
			anims['Walk']:Stop()
			anims['Fall']:Stop()
			anims['Run']:Stop()
			anims['Jump']:Play()
		end
	end)
	connections['FreeFalling'] = humanoid['FreeFalling']:Connect(function(active)
		if active and dancing ~= true and anims['Jump'].Stopped ~= false then
			anims['Idle']:Stop()
			anims['Walk']:Stop()
			anims['Jump']:Stop()
			anims['Run']:Stop()
			anims['Fall']:Play()
		end
	end)
	warn(1)
	wait(0.5)
	play_the_animation = function(animationid,soundid)
		if boombox == nil and soundid then
			if sound then sound:Destroy() sound = nil end
			sound = Instance.new("Sound",root)
			sound.SoundId = "rbxassetid://" .. soundid
			sound.Volume = 1; sound.RollOffMaxDistance = 100; sound.Looped = true
		end
		local Animation = PreloadAnimation(animationid,character)
		if dancing then dancing = false end
		repeat task.wait() until dancingplay == false
		wait(0.1) 
		StopAll(); wait(.1); Animation:Play() Animation['Speed'] = 1
		dancing = true
		--warn(boombox)
		if boombox == nil and sound then
			sound:Play()
		else
			character[game.Players.LocalPlayer.Name]:FindFirstChild("Remote",true):FireServer("PlaySong", soundid)
		end
		repeat task.wait() until dancing == false Animation:Stop()
		dancingplay = false
	end
	warn(1)
	coroutine.wrap(function()
		repeat
			torso.CanCollide = false
			if character:FindFirstChild("Head") then character.Head.CanCollide = false end
			game.Players.LocalPlayer.MaximumSimulationRadius=math.pow(math.huge,math.huge)
			sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge*math.huge)
			run_service.Stepped:Wait()
		until humanoid.Health < 1
		if sound then sound:Destroy() end
		if boombox then boombox = nil end
		if play_the_animation then play_the_animation = nil end
		if renderstp then renderstp:Disconnect() end
		if A1 then A1 = nil end
		if A2 then A2 = nil end
		for K,V in next, character:GetDescendants() do 
			if V['Name']:match('Align') then 
				V:Destroy()
			end
		end
	end)()
end

-- Gui //
gui.Parent = game.CoreGui

local function updateInput(input)
	local Delta = input.Position - dragStart
	local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	frametomove.Position = Position
end
frametomove.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
		dragToggle = true
		dragStart = input.Position
		startPos = frametomove.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)
frametomove.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)
UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragToggle then
		updateInput(input)
	end
end)

frametomove.Hide.Activated:Connect(function()
	closed = not closed
	if closed then
		frametomove.Main:TweenSize(
			UDim2.new(1, 0, 0, 200),  
			Enum.EasingDirection.In,    
			Enum.EasingStyle.Sine,      
			0.5,                          
			true                       
		)
		wait(0.1)
		frametomove.BackgroundTransparency = 1
	else
		frametomove.Main:TweenSize(
			UDim2.new(1, 0, 0, 0),  
			Enum.EasingDirection.In,    
			Enum.EasingStyle.Sine,      
			0.5,                          
			true                       
		)
		wait(0.45)
		frametomove.BackgroundTransparency = 0.3
	end
end)
frametomove.Close.Activated:Connect(function()
	gui:Destroy()
end)

frametomove.Main.ScrollingFrame.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
	local txt = frametomove.Main.ScrollingFrame.TextBox.Text
	if txt ~= "" then
		local info = TweenInfo.new(0.2 , Enum.EasingStyle.Quad , Enum.EasingDirection.InOut)
		local goal = {
			TextTransparency = 0
		}
		local goal2 = {
			TextTransparency = 1
		}
		for i,v in pairs(frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()) do
			if v:IsA("TextButton") then
				coroutine.resume(coroutine.create(function()
					if string.lower(string.sub(v.Text,1,#txt)) == string.lower(txt) then
						if v.TextTransparency ~= 0 then
							local tweeny = tween_service:Create(v , info , goal)
							tweeny:Play()
							tweeny.Completed:Wait()
						end
						v.Visible = true
					else
						if v.TextTransparency ~= 1 then
							local tweeny = tween_service:Create(v , info , goal2)
							tweeny:Play()
							tweeny.Completed:Wait()
						end
						v.Visible = false
					end
				end))
			end
		end
	else
		for i,v in pairs(frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()) do
			if v:IsA("TextButton") then
				v.Visible = true
				v.TextTransparency = 0
			end
		end
	end
end)
player.Chatted:Connect(function(msg)
    if string.sub(string.lower(msg),1,3) == "/e " then
        msg = string.sub(string.lower(msg),4)
    end
    if string.sub(string.lower(msg),1,1) == "/" then
        msg = string.sub(string.lower(msg),2)
    end
	if msg == "load" then
		if not play_the_animation then
			coroutine.wrap(AnimationLoader)()
		end
	elseif msg == "head" then
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
	elseif msg == "netless" then
		claim2 = not claim2
		if printconsole then printconsole("netless2: " .. tostring(claim2)) end
		wait(0.1)
		game.StarterGui:SetCore("ChatMakeSystemMessage",{Text = "{AnimY}: " .. "netless2: " .. tostring(claim2)})
	elseif msg == "cframe" then
		cframetoggle = not cframetoggle
		if printconsole then printconsole("Cframe: " .. tostring(cframetoggle)) end
		wait(0.1)
		game.StarterGui:SetCore("ChatMakeSystemMessage",{Text = "{AnimY}: " .. "Cframe: " .. tostring(cframetoggle)})
	elseif msg == "neck" then
		fakehead = not fakehead
		if godmode and fakehead then
			godmode = false
			game.StarterGui:SetCore("ChatMakeSystemMessage",{Text = "{AnimY}: " .. "God: " .. tostring(godmode)})
			if printconsole then printconsole("God: " .. tostring(godmode)) end
		end
		if printconsole then printconsole("FakeNeck: " .. tostring(fakehead)) end
		wait(0.1)
		game.StarterGui:SetCore("ChatMakeSystemMessage",{Text = "{AnimY}: " .. "FakeNeck: " .. tostring(fakehead)})
	elseif msg == "speed" then
		local msg = msg:split(" ")
		if msg[2] and tonumber(msg[2]) then
			animspeed = tonumber(msg[2])
		end
	elseif msg == "res" then
		respawn()
	elseif msg == "loadallanimations" then
	    local loadedamount = Instance.new("TextLabel",gui)
	    loadamount = 1
	    loadedamount.Text = "1/".. #frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()
	    loadedamount.AnchorPoint = Vector2.new(0.5,0)
	    loadedamount.Position = UDim2.new(0.5, 0, 0, 0)
	    loadedamount.Size = UDim2.new(0, 200, 0, 50)
	    for i,v in pairs(frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()) do
	        spawn(function()
	            local args = v.Name:split(" ")
	            local animid,soundid = args[1],args[2]
	            if soundid then
	                local soundwait = Instance.new("Sound",player)
	                soundwait.SoundId = "rbxassetid://" .. soundid
	                soundwait.Loaded:Wait()
	                soundwait:Destroy()
	            end
	            if animid then
	                pcall(function()
	                    game:GetObjects('rbxassetid://'..animid)
	                end)
	            end
	            loadamount = loadamount + 1
	            loadedamount.Text = loadamount .. "/".. #frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()
	        end)
	    end
	    repeat task.wait() until loadamount == #frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()
	    loadedamount:Destroy()
	elseif msg == "loadallsounds" then
	    local boomboxx = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Remote",true)
	    if boomboxx then
	    local loadedamount = Instance.new("TextLabel",gui)
	    loadamount = 1
	    loadedamount.Text = "1/".. #frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()
	    loadedamount.AnchorPoint = Vector2.new(0.5,0)
	    loadedamount.Position = UDim2.new(0.5, 0, 0, 0)
	    loadedamount.Size = UDim2.new(0, 200, 0, 50)
	    local soundwait = boomboxx.Parent.Handle.Sound
	    boomboxx.Parent.Handle.ChildAdded:Connect(function(newins)
	        wait()
	        soundwait = newins
	    end)
	    for i,v in pairs(frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()) do
	            local args = v.Name:split(" ")
	            local soundid = args[2]
	            if soundid then
	                boomboxx:FireServer("PlaySong", soundid)
	               	repeat task.wait() until string.match(soundwait.SoundId , "%d+") == soundid
	                repeat task.wait() until soundwait.Playing and soundwait.TimeLength ~= 0
	            end
	            loadamount = loadamount + 1
	            loadedamount.Text = loadamount .. "/".. #frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()
	    end
	    repeat task.wait() until loadamount == #frametomove.Main.ScrollingFrame.ScrollingFrame:GetChildren()
	    loadedamount:Destroy()
	    end
	end
end)
local dummy = frametomove.Main.ScrollingFrame.ScrollingFrame.TextButton
for i,v in pairs(animationslist:GetChildren()) do
	spawn(function()
		repeat task.wait() until v:FindFirstChildOfClass("Sound")
		local newbutton = dummy:Clone()
		newbutton.Text = v.Name 
		newbutton.Name = v.Value .. " " .. string.match(v:FindFirstChildOfClass("Sound").SoundId , "%d+")
		newbutton.Parent = frametomove.Main.ScrollingFrame.ScrollingFrame
		newbutton.Activated:Connect(function()
			runanimation(newbutton)
		end)
	end)
end
wait(1)
dummy:Destroy(); animationslist:Destroy()
