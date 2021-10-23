-- ProductionTakeOne#3330 //

-- AnimY [Remastered AnimX] // 

-- Loading\Services //

local tween_service = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local run_service = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local gui = game:GetObjects("rbxassetid://7113228606")[1]
local dancing,dancingplay,can_collide,cframetoggle = false,false,true,false
local play_the_animation, joints, anims, connections, character, dragToggle, dragInput, dragStart, selected, sound, boombox
repeat wait() until gui
local frametomove,dragSpeed,closed = gui.Drag,0,true

-- Functions //

local function runanimation(button)
	if selected == button.Name then
		dancing = false; selected = nil; if sound then sound:Destroy() sound = nil end
		if boombox then boombox.Remote:FireServer("PlaySong", "0") end
	else
		if play_the_animation ~= nil then
			selected = button.Name
			local theidslol = button.Name:split(" ")
			play_the_animation(theidslol[1],theidslol[2])
		else
			printconsole("Please use /load!"); warn("Please use /load!")
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
	local Attachment = Part:FindFirstChild('CFAttachment0')
	if Attachment ~= nil then
		if cframetoggle then
			Attachment.CFrame = Value
		else
			tween_service:Create(Attachment,TweenInfo.new(Duration,Enum['EasingStyle'][tostring(Style):split('.')[3]],Enum['EasingDirection'][tostring(Direction):split('.')[3]],0,false,0),{CFrame = Value}):Play()
		end
	end
end

local PoseToCF = function(Pose,Motor)
	return (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] * Motor['C1']:Inverse()):ToObjectSpace(Motor['Part0'].CFrame)
end

local PreloadAnimation = function(AssetId)
	local Sequence = game:GetObjects('rbxassetid://'..tostring(AssetId))[1]; assert(Sequence:IsA('KeyframeSequence'),'Instance is not a KeyframeSequence.')
	repeat run_service.RenderStepped:Wait() until Sequence
	local Class = {}
	Class['Speed'] = 1
	local Keyframes = Sequence:GetKeyframes()
	local Yield = function(Seconds)
		local Time = Seconds * (60.8) --+ Keyframes[#Keyframes].Time)
		for I = 1,Time,Class['Speed'] do 
			run_service.Delta['Event']:Wait()
		end
	end
	Class['Stopped'] = false;
	Class['Complete'] = Instance.new('BindableEvent')
	Class['Play'] = function()
		Class['Stopped'] = false
		if boombox and dancing then
			repeat wait() until boombox.Handle.Sound.Playing and boombox.Handle.Sound.TimeLength ~= 0
		elseif sound and dancing then
			print(sound) print(sound.SoundId)
			repeat wait() until sound.Playing
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
								if Contains(joints,Pose['Name']) then 
									local Duration = K2 ~= nil and (K2['Time'] - K1['Time'])/Class['Speed'] or .5
									Edit(player.Character[Pose['Name']],PoseToCF(Pose,joints[Pose['Name']]),Duration,Pose['EasingStyle'],Pose['EasingDirection'])
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

local cframey,cframey2,boomlocation,A1 = CFrame.new(0,-2.3,0),CFrame.Angles(math.rad(90),math.rad(90),math.rad(90)),"Right Arm",nil
--_G.CFramey = CFrame.new(0,-2.3,0)
--_G.CFramey2 = CFrame.Angles(math.rad(90),math.rad(90),math.rad(90))
local function CFrameBypass(pos)
	local Arm = game.Players.LocalPlayer.Character[boomlocation].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
	local cframe = Arm:toObjectSpace(pos):inverse()
	--tool.Parent = game.Players.LocalPlayer.Backpack
	--tool.Grip = cframe
	--tool.Parent = game.Players.LocalPlayer.Character
	return cframe
 end

---_G.Value1,_G.Value2,_G.Value3 = 180,90,0
local function AnimationLoader()
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
	settings().Physics.AllowSleep = false
	boombox = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Remote",true)
	if boombox then
		repeat 
			boombox = boombox.Parent
			wait()
		until boombox:IsA("Tool")
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("RightGrip",true):Destroy()
		local AP, AO, A0 = Create('AlignPosition',boombox.Handle), Create('AlignOrientation',boombox.Handle), Create('Attachment',boombox.Handle)
		A1 = Create('Attachment',game.Players.LocalPlayer.Character[boomlocation])
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; 
	end
	game:GetService("RunService").Heartbeat:connect(function()
		if boombox then
			if boombox.Handle.CanCollide then boombox.Handle.CanCollide = false end
			boombox.Handle.Velocity = Vector3.new(0x1e,0,0)
			--boombox.Handle:FindFirstChild('CFAttachment0').CFrame = CFrameBypass(player.Character['Right Arm'].CFrame * CFrame.new(0,-2.3,0) * CFrame.Angles(math.rad(90),math.rad(90),math.rad(90)))--math.rad(_G.Value1),math.rad(_G.Value3),math.rad(_G.Value2)))
			boombox.Handle:FindFirstChild('CFAttachment0').CFrame = CFrameBypass(player.Character[boomlocation].CFrame * cframey * cframey2)
		end
		for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
			if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then
					v.Velocity = Vector3.new(0x1e,0,0)
			end
		end
	end)
	character = player['Character']
	local torso, root, humanoid = character['Torso'], character['HumanoidRootPart'], character['Humanoid']

	joints = {
		['Torso'] = root['RootJoint'];
		['Left Arm'] = torso['Left Shoulder'];
		['Right Arm'] = torso['Right Shoulder'];
		['Left Leg'] = torso['Left Hip'];
		['Right Leg'] = torso['Right Hip'];
	}

	coroutine.wrap(function()
		root['Anchored'] = true;
		wait(.8)
		root['Anchored'] = false;
	end)()

	for K,V in next, joints do 
		local AP, AO, A0, A1 = Create('AlignPosition',V['Part1']), Create('AlignOrientation',V['Part1']), Create('Attachment',V['Part1']), Create('Attachment',V['Part0'])
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; A0['CFrame'] = V['C1'] * V['C0']:Inverse(); V:Remove()
	end

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

	anims = {
		['Idle'] = PreloadAnimation(180435571,true,character); --5183986020
		['Walk'] = PreloadAnimation(6606119539,true,character);  --5053650512,180426354
		['Run'] = PreloadAnimation(180426354,true,character); --5053715968
		['Jump'] = PreloadAnimation(125750702,true,character); --4073859368
		['Fall'] = PreloadAnimation(180436148,true,character); --3323393688
	}

	wait(1)
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
	wait(0.5)
	play_the_animation = function(animationid,soundid)
		if boombox == nil then
			if sound then sound:Destroy() sound = nil end
			sound = Instance.new("Sound",root)
			sound.SoundId = "rbxassetid://" .. soundid
			sound.Volume = 1; sound.RollOffMaxDistance = 100; sound.Looped = true
		end
		local Animation = PreloadAnimation(animationid,character)
		if dancing then dancing = false end
		repeat wait() until dancingplay == false
		wait(0.1) 
		StopAll(); wait(.1); Animation:Play() Animation['Speed'] = 1
		dancing = true
		if boombox == nil then
			sound:Play()
		else
			boombox.Remote:FireServer("PlaySong", soundid)
		end
		repeat wait(0.05) until dancing == false Animation:Stop()
		dancingplay = false
	end
	coroutine.wrap(function()
		repeat
			torso.CanCollide = false
			character.Head.CanCollide = false
			run_service.Stepped:Wait()
			game.Players.LocalPlayer.MaximumSimulationRadius=math.pow(math.huge,math.huge)
			sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge*math.huge)
		until humanoid.Health < 1
		if sound then sound:Destroy() end
		if boombox then boombox = nil end
		if play_the_animation then play_the_animation = nil end
		if A1 then A1 = nil end
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
_G.YAYAYAYA = CFrame.Angles(math.rad(90),math.rad(90),math.rad(90))
player.Chatted:Connect(function(msg)
	if string.sub(string.lower(msg),1,5) == "/load" or string.sub(string.lower(msg),1,7) == "/e load" then
		coroutine.wrap(AnimationLoader)()
	elseif string.sub(string.lower(msg),1,5) == "/head" or string.sub(string.lower(msg),1,7) == "/e head" then
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
	elseif string.sub(string.lower(msg),1,7) == "/cframe" or string.sub(string.lower(msg),1,9) == "/e cframe" then
		cframetoggle = not cframetoggle
		printconsole("Cframe: " .. tostring(cframetoggle))
	elseif string.sub(string.lower(msg),1,5) == "/boom" or string.sub(string.lower(msg),1,7) == "/e boom" then
		if A1 then
			if boomlocation == "Torso" then
				boomlocation = "Left Arm"
				cframey = CFrame.new(0,-2.3,0)
				cframey2 = _G.YAYAYAYA
				A1.Parent = game.Players.LocalPlayer.Character[boomlocation]
			elseif boomlocation == "Right Arm" then
				boomlocation = "Torso"
				cframey = CFrame.new(0,-0.1,0)
				cframey2 = CFrame.Angles(math.rad(90),math.rad(0),math.rad(135))
				A1.Parent = game.Players.LocalPlayer.Character[boomlocation]
			else 
				boomlocation = "Right Arm"
				cframey = CFrame.new(0,-2.3,0)
				cframey2 = CFrame.Angles(math.rad(90),math.rad(90),math.rad(90))
				A1.Parent = game.Players.LocalPlayer.Character[boomlocation]
			end
		end
	end
end)
local dummy = frametomove.Main.ScrollingFrame.ScrollingFrame.TextButton
local animationslist = game:GetObjects("rbxassetid://7113399253")[1]
for i,v in pairs(animationslist:GetChildren()) do
	spawn(function()
		repeat wait() until v:FindFirstChildOfClass("Sound")
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
