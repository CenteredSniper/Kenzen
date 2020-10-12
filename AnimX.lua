if _G.AnimX then
	error("AnimX is already running!",0)
	return
end
_G.AnimX = true
if not game:IsLoaded() then
	local notLoaded = Instance.new("Message",workspace)
	notLoaded.Text = 'waiting for game to load fully'
	game.Loaded:Wait()
	notLoaded:Destroy()
end
local speedlol = 1
local toggleanimations = true
local togglecustomid = false
local characterlol = game.Players.LocalPlayer.Character
local sound
--
local AnimXUi = Instance.new("ScreenGui")
local TopBar = Instance.new("Frame")
local Minimize = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local ScrollFrame = Instance.new("ScrollingFrame")
local Animations = Instance.new("Frame")
local ListLayout = Instance.new("UIListLayout")
local CustomID = Instance.new("TextButton")
local AnimationID = Instance.new("TextBox")
local AnimSpeed = Instance.new("TextBox")
--
AnimXUi.Name = "AnimX"
AnimXUi.ResetOnSpawn = false
AnimXUi.DisplayOrder = 999999950

TopBar.Name = "TopBar"
TopBar.Parent = AnimXUi
TopBar.Position = UDim2.new(0.0485436879, 0, 0.0645756423, 0)
TopBar.Size = UDim2.new(0.100000001, 75, 0.0399999991, 0)
TopBar.BackgroundColor = BrickColor.new("Black metallic")
TopBar.BackgroundColor3 = Color3.new(0.12549, 0.133333, 0.145098)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 999999751

Minimize.Name = "Minimize"
Minimize.Parent = TopBar
Minimize.Position = UDim2.new(0.75, 0, 0, 0)
Minimize.Size = UDim2.new(0.100000001, 0, 1, 0)
Minimize.BackgroundColor = BrickColor.new("Institutional white")
Minimize.BackgroundColor3 = Color3.new(1, 1, 1)
Minimize.BackgroundTransparency = 1
Minimize.ZIndex = 999999798
Minimize.Font = Enum.Font.Fantasy
Minimize.FontSize = Enum.FontSize.Size32
Minimize.Text = "-"
Minimize.TextColor = BrickColor.new("Deep orange")
Minimize.TextColor3 = Color3.new(1, 0.615686, 0)
Minimize.TextSize = 30
Minimize.TextWrap = true
Minimize.TextWrapped = true

Title.Name = "Title"
Title.Parent = TopBar
Title.Position = UDim2.new(1, 0, 0, 0)
Title.Size = UDim2.new(0.970000029, 0, 1, 0)
Title.AnchorPoint = Vector2.new(1, 0)
Title.BackgroundColor = BrickColor.new("Institutional white")
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.ZIndex = 999999798
Title.Font = Enum.Font.GothamBold
Title.FontSize = Enum.FontSize.Size24
Title.Text = "AnimX"
Title.TextColor = BrickColor.new("Deep orange")
Title.TextColor3 = Color3.new(1, 0.615686, 0)
Title.TextSize = 20
Title.TextWrap = true
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Animations.Name = "Animations"
Animations.Parent = TopBar
Animations.Position = UDim2.new(0, 0, 0.899999976, 0)
Animations.Size = UDim2.new(1, 0, 10, 0)
Animations.BackgroundColor = BrickColor.new("Dark taupe")
Animations.BackgroundColor3 = Color3.new(0.25098, 0.266667, 0.294118)
Animations.BorderSizePixel = 0
Animations.ZIndex = 999999700

ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = Animations
ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ZIndex = 999999701
ScrollFrame.ScrollBarThickness = 6

ListLayout.Parent = ScrollFrame
ListLayout.SortOrder = Enum.SortOrder.Name

CustomID.Name = "CustomId"
CustomID.Parent = TopBar
CustomID.Position = UDim2.new(0.879999995, 0, 0, 0)
CustomID.Size = UDim2.new(0.100000001, 3, 1, 0)
CustomID.BackgroundColor = BrickColor.new("Institutional white")
CustomID.BackgroundColor3 = Color3.new(1, 1, 1)
CustomID.BackgroundTransparency = 1
CustomID.ZIndex = 999999799
CustomID.Font = Enum.Font.Fantasy
CustomID.FontSize = Enum.FontSize.Size32
CustomID.Text = ">"
CustomID.TextColor = BrickColor.new("Deep orange")
CustomID.TextColor3 = Color3.new(1, 0.615686, 0)
CustomID.TextSize = 30
CustomID.TextWrap = true
CustomID.TextWrapped = true

AnimationID.Name = "AnimationID"
AnimationID.Parent = CustomID
AnimationID.Position = UDim2.new(-4, 0, 0, 0)
AnimationID.Size = UDim2.new(5, 0, 0.800000012, 0)
AnimationID.BackgroundColor = BrickColor.new("Dark taupe")
AnimationID.BackgroundColor3 = Color3.new(0.25098, 0.266667, 0.294118)
AnimationID.BorderSizePixel = 0
AnimationID.Font = Enum.Font.SourceSans
AnimationID.FontSize = Enum.FontSize.Size18
AnimationID.Text = ""
AnimationID.TextColor = BrickColor.new("Deep orange")
AnimationID.TextColor3 = Color3.new(1, 0.615686, 0)
AnimationID.TextSize = 18
AnimationID.TextWrap = true
AnimationID.TextWrapped = true
AnimationID.PlaceholderColor3 = Color3.new(1, 0.615686, 0)
AnimationID.PlaceholderText = "AnimationID"

AnimSpeed.Name = "AnimSpeed"
AnimSpeed.Parent = AnimationID
AnimSpeed.Position = UDim2.new(0, 0, 1, 0)
AnimSpeed.Size = UDim2.new(1, 0, 1, 0)
AnimSpeed.BackgroundColor = BrickColor.new("Dark taupe")
AnimSpeed.BackgroundColor3 = Color3.new(0.25098, 0.266667, 0.294118)
AnimSpeed.BorderSizePixel = 0
AnimSpeed.Font = Enum.Font.SourceSans
AnimSpeed.FontSize = Enum.FontSize.Size18
AnimSpeed.Text = ""
AnimSpeed.TextColor = BrickColor.new("Deep orange")
AnimSpeed.TextColor3 = Color3.new(1, 0.615686, 0)
AnimSpeed.TextSize = 18
AnimSpeed.TextWrap = true
AnimSpeed.TextWrapped = true
AnimSpeed.PlaceholderColor3 = Color3.new(1, 0.615686, 0)
AnimSpeed.PlaceholderText = "AnimSpeed"
--
local function QOZY_fake_script() -- meme.Script 
	local Frame = (60)
	
	Service = setmetatable(
		{
			Get = function(Self, Serv)
				if Service[Serv] then return Service[Serv] end
				local S = game:GetService(Serv)
				if S then Service[Serv] = S end
				return S
			end;
		}, {
			__index = function(Self, Index)
				local S = game:GetService(Index)
				if S then Service[Index] = S end
				return S
			end;
		})
	
	local LP = Service['Players'].LocalPlayer; local Char = LP['Character']
	local Torso, Root, Humanoid = Char['Torso'], Char['HumanoidRootPart'], Char['Humanoid']
	local TService, UIS = Service['TweenService'], Service['UserInputService']
	
	coroutine.wrap(function()
		Root['Anchored'] = true;
		wait(.8)
		Root['Anchored'] = false;
	end)()
	
	
	local SetSimulationRadius = setsimulationradius
	
	
	
	game.RunService.Stepped:Connect(function()
		
		SetSimulationRadius(math.huge, math.huge)
		
	end)
	
	
	
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
	
	local PoseToCF = function(Pose,Motor)
		return (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] * Motor['C1']:Inverse()):ToObjectSpace(Motor['Part0'].CFrame)
	end
	
	local Joints = {
		['Torso'] = Root['RootJoint'];
		['Left Arm'] = Torso['Left Shoulder'];
		['Right Arm'] = Torso['Right Shoulder'];
		['Left Leg'] = Torso['Left Hip'];
		['Right Leg'] = Torso['Right Hip'];
		['Head'] = Torso['Neck'];
	}
	
	for K,V in next, Char:GetChildren() do 
		if V:IsA('BasePart') then 
			coroutine.wrap(function()
				 repeat
				 	V['CanCollide'] = false
				 	Service['RunService'].Stepped:Wait()
				 	 --wait(0.000001)
				until Humanoid['Health'] < 1
			end)()
		end
	end
	
	for K,V in next, Joints do 
		local AP, AO, A0, A1 = Create('AlignPosition',V['Part1']), Create('AlignOrientation',V['Part1']), Create('Attachment',V['Part1']), Create('Attachment',V['Part0'])
		AP['RigidityEnabled'] = true; AO['RigidityEnabled'] = true; AP['Attachment0'] = A0; AP['Attachment1'] = A1; AO['Attachment0'] = A0; AO['Attachment1'] = A1;
		A0['Name'] = 'CFAttachment0'; A1['Name'] = 'CFAttachment1'; A0['CFrame'] = V['C1'] * V['C0']:Inverse(); V:Remove()
	end
	
	local Edit = function(Part,Value,Duration,Style,Direction)
		Style = Style or 'Enum.EasingStyle.Linear'; Direction = Direction or 'Enum.EasingDirection.In'
		local Attachment = Part:FindFirstChild('CFAttachment0')
		if Attachment ~= nil then
			TService:Create(Attachment,TweenInfo.new(Duration,Enum['EasingStyle'][tostring(Style):split('.')[3]],Enum['EasingDirection'][tostring(Direction):split('.')[3]],0,false,0),{CFrame = Value}):Play()
		end
	end
	
	if not Service['RunService']:FindFirstChild('Delta') then
		local Delta = Create('BindableEvent',Service['RunService']); Delta['Name'] = 'Delta'
		local A, B = 0, tick()
		Service['RunService'].Delta:Fire(); Service['RunService'].Heartbeat:Connect(function(C, D)
			A = A + C
			if A >= (1/Frame) then
				for I = 1, math.floor(A / (1/Frame)) do
					Service['RunService'].Delta:Fire()
				end
				B = tick()
				A = A - (1/Frame) * math.floor(A / (1/Frame))
			end
		end)
	end
	
	coroutine.wrap(function()
		Humanoid['Died']:Wait()
		for K,V in next, Char:GetDescendants() do 
			if V['Name']:match('Align') then 
				V:Destroy()
			end
		end
	end)()
	
	local PreloadAnimation = function(AssetId)
		local Sequence = game:GetObjects('rbxassetid://'..AssetId)[1]; assert(Sequence:IsA('KeyframeSequence'),'Instance is not a KeyframeSequence.')
		wait(.06)
		local Class = {}
		Class['Speed'] = 1
		local Yield = function(Seconds)
			local Time = Seconds * (Frame + Sequence:GetKeyframes()[#Sequence:GetKeyframes()].Time)
			for I = 1,Time,Class['Speed'] do 
				Service['RunService'].Delta['Event']:Wait()
			end
		end
		Class['Stopped'] = false;
		Class['Complete'] = Instance.new('BindableEvent')
		Class['Play'] = function()
			Class['Stopped'] = false
			coroutine.wrap(function()
				repeat
					for K = 1,#Sequence:GetKeyframes() do 
						local K0, K1, K2 = Sequence:GetKeyframes()[K-1], Sequence:GetKeyframes()[K], Sequence:GetKeyframes()[K+1]
						if Class['Stopped'] ~= true and Humanoid['Health'] > 0 then
							if K0 ~= nil then 
								Yield(K1['Time'] - K0['Time'])
							end
							coroutine.wrap(function()
								for I = 1,#K1:GetDescendants() do 
									local Pose = K1:GetDescendants()[I]
									if Contains(Joints,Pose['Name']) then 
										local Duration = K2 ~= nil and (K2['Time'] - K1['Time'])/Class['Speed'] or .5
										Edit(Char[Pose['Name']],PoseToCF(Pose,Joints[Pose['Name']]),Duration,Pose['EasingStyle'],Pose['EasingDirection'])
									end
								end
							end)()
						end
					end
					Class['Complete']:Fire()
				until Sequence['Loop'] ~= true or Class['Stopped'] ~= false or Humanoid['Health'] < 1
			end)()
		end
		Class['Stop'] = function()
			Class['Stopped'] = true;
		end
		Class['Reset'] = function()
			coroutine.wrap(function()
				wait(.02)
				assert(Class['Stopped'],'Track Must Be Stopped First!')
				for K,V in next, Joints do 
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
	
	Humanoid.WalkSpeed = 11
	
	local Anims = {
		['Idle'] = PreloadAnimation(5183986020);
		['Walk'] = PreloadAnimation(5053650512);
		['Run'] = PreloadAnimation(5053715968);
		['Jump'] = PreloadAnimation(4073859368);
		['Fall'] = PreloadAnimation(3323393688);
	}
	
	wait(1)
	local Connections = {};
	
	local Mouse = LP:GetMouse()
	local Dancing, Running = false, false;
	
	local StopAll = function()
		for K,V in next, Anims do 
			if V['Stopped'] ~= true then 
				V:Stop()
			end
		end
	end
	       sound = Instance.new("Sound")
	       sound.Parent = game.Players.LocalPlayer.Character.Torso
	       sound.Volume = 5
	       sound.Looped = true
	       sound.MaxDistance = 1000
	Anims['Idle']:Play(); Dancing = false; Anims['Walk'].Stopped = true; Anims['Run'].Stopped = true
	
	Connections['Run'] = Humanoid['Running']:Connect(function(Speed)
		if Speed > 6 and Dancing ~= true and Anims['Walk'].Stopped ~= false and runnning ~= true then
			Anims['Idle']:Stop()
			Anims['Jump']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Walk']:Play()
		elseif Speed < 5 and Dancing ~= true and Anims['Walk'].Stopped ~= true and runnning ~= true then
			Anims['Walk']:Stop()
			Anims['Jump']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Idle']:Play()
		elseif Speed < 5 and Dancing ~= true and Anims['Jump'].Stopped ~= true or Anims['Fall'].Stopped ~= true then
			Anims['Walk']:Stop()
			Anims['Jump']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Idle']:Play()
		end
	end)
	Connections['Jumping'] = Humanoid['Jumping']:Connect(function(active)
		if active and Dancing ~= true and Anims['Jump'].Stopped ~= false then
			Anims['Idle']:Stop()
			Anims['Walk']:Stop()
			Anims['Fall']:Stop()
			Anims['Run']:Stop()
			Anims['Jump']:Play()
		end
	end)
	Connections['FreeFalling'] = Humanoid['FreeFalling']:Connect(function(active)
		if active and Dancing ~= true and Anims['Jump'].Stopped ~= false then
			Anims['Idle']:Stop()
			Anims['Walk']:Stop()
			Anims['Jump']:Stop()
			Anims['Run']:Stop()
			Anims['Fall']:Play()
		end
	end)
	
	Mouse.KeyDown:connect(function(key)
		if key:lower() == string.char(48) then --string.char(48) is just shift
			if Humanoid and Anims['Walk'].Stopped ~= true then
				Anims['Walk']:Stop()
				Anims['Jump']:Stop()
				Anims['Fall']:Stop()
				Anims['Idle']:Stop()
				Anims['Run']:Play()
				runnning = true
				Humanoid.WalkSpeed = 18
			end
		end
	end)
	
	--When button is lifted
	Mouse.KeyUp:connect(function(key)
		if key:lower() == string.char(48) then --string.char(48) is just shift
			if Humanoid then
				runnning = false
				Humanoid.WalkSpeed = 11
			end
		end
	end)
	
	wait(1)
	--[[
	local Bind = function(Id,Key,Speed)
		Speed = Speed or 1
		local Animation = PreloadAnimation(Id)
		table.insert(Anims,Animation)
		local V = UIS.InputBegan:Connect(function(Input,P)
			if Input.KeyCode == Enum.KeyCode[Key] and P ~= true then 
				if Dancing ~= true then Dancing = true;
					StopAll(); wait(.1); Animation:Play() Animation['Speed'] = Speed
				else Dancing = false;
					StopAll(); wait(.1); Anims['Idle']:Play()
				end
			end
		end)
	end ]]
	local function createtauntbutton(Name)
		local examplebutton = Instance.new("TextButton")
		local examplekeybind = Instance.new("TextBox")
		
		examplebutton.Name = Name
		examplebutton.Parent = ScrollFrame
		examplebutton.Size = UDim2.new(0.8, 0, 0, 20)
		examplebutton.BackgroundColor = BrickColor.new("Earth green")
		examplebutton.BackgroundColor3 = Color3.new(0.211765, 0.223529, 0.247059)
		examplebutton.BorderSizePixel = 0
		examplebutton.ZIndex = 999999702
		examplebutton.Font = Enum.Font.SourceSans
		examplebutton.FontSize = Enum.FontSize.Size24
		examplebutton.Text = Name
		examplebutton.TextColor = BrickColor.new("Deep orange")
		examplebutton.TextColor3 = Color3.new(1, 0.615686, 0)
		examplebutton.TextSize = 24
		examplebutton.TextWrap = true
		examplebutton.TextWrapped = true
		
		examplekeybind.Name = "Keybind"
		examplekeybind.Parent = examplebutton
		examplekeybind.Position = UDim2.new(1, 0, 0, 0)
		examplekeybind.Size = UDim2.new(0.25, 0, 1, 0)
		examplekeybind.BackgroundColor = BrickColor.new("Earth green")
		examplekeybind.BackgroundColor3 = Color3.new(0.211765, 0.223529, 0.247059)
		examplekeybind.BorderSizePixel = 0
		examplekeybind.ZIndex = 999999702
		examplekeybind.Font = Enum.Font.SourceSans
		examplekeybind.FontSize = Enum.FontSize.Size14
		examplekeybind.Text = ""
		examplekeybind.TextColor = BrickColor.new("Deep orange")
		examplekeybind.TextColor3 = Color3.new(1, 0.615686, 0)
		examplekeybind.TextSize = 14
		examplekeybind.TextWrap = true
		examplekeybind.TextWrapped = true
		examplekeybind.PlaceholderColor3 = Color3.new(1, 0.615686, 0)
		examplekeybind.PlaceholderText = "*"
		
		local returntable = {examplebutton,examplekeybind}
		return returntable
	end
	local Bind = function(Id,Name,songlel)
		ScrollFrame.CanvasSize = ScrollFrame.CanvasSize + UDim2.new(0,0,0,25)
		local Animation = PreloadAnimation(Id)
		table.insert(Anims,Animation)
		local returnedtable = createtauntbutton(Name)
		local examplebutton = returnedtable[1]
		local examplekeybind = returnedtable[2]
		local keybind
		examplebutton.MouseButton1Click:Connect(function()
			if Dancing ~= true then Dancing = true;
				    sound.SoundId = "rbxassetid://" ..songlel
				    sound:Play()
                wait(0.3)
		    StopAll(); wait(.1); Animation:Play() Animation['Speed'] = speedlol
			else Dancing = false;
				StopAll(); wait(.1); Anims['Idle']:Play()
				    sound:Stop()
			end
		end)
		examplekeybind.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				local keybindlol = examplekeybind.Text
				if #keybindlol == 1 then
					keybindlol = string.upper(keybindlol)
					keybind = keybindlol
					local V = UIS.InputBegan:Connect(function(Input,P)
						if keybind ~= keybindlol then
							return
						end
						if Input.KeyCode == Enum.KeyCode[keybindlol] and P ~= true then 
							if Dancing ~= true then Dancing = true;
								StopAll(); wait(.1); Animation:Play() Animation['Speed'] = speedlol
							else Dancing = false;
								StopAll(); wait(.1); Anims['Idle']:Play()
							end
						end
					end)
				end
			end
		end)
		local function removeguiondeath()
	game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
 		    wait(game.Players.RespawnTime + 3)
    examplebutton:Destroy()
		removeguiondeath()
	end)
end
removeguiondeath()
	end
	--[[
	Bind(4686555525,'Renegade') wait(0.1)
	Bind(5813142376,'Jerk it 2') wait(0.1)
	Bind(4558409610,'Breakdown') wait(0.1)
	Bind(3259216638,'Default') wait(0.1)
	Bind(3450125501,'S M U G') wait(0.1)
	Bind(4109162757,'Torture Dance') wait(0.1)
	Bind(4835795413,'unnamed') wait(0.1)
	Bind(5813273319,'Bend') wait(0.1)
	Bind(3619935462,'ElectroShuffle') wait(0.1)
	Bind(3643129020,'Crabby') wait(0.1)
	Bind(5238669868,'Goopie') wait(0.1)
	Bind(3262592866,'Orange Justice') wait(0.1)
	Bind(5813270580,'Suck') wait(0.1)
	Bind(5813333594, 'Thrust') wait(0.1)
	Bind(5362230261, 'cruise') wait(0.1)
	Bind(5713511509, 'whip') wait(0.1)
	Bind(5813332505, 'Jerk it') wait(0.1)
	Bind(4300223810, 'R6 Garry Dance') wait(0.1)
	Bind(4787449997, 'KAZOTSKY') wait(0.1) ]]
	for i,v in pairs(_G.animationstoadd) do
		Bind(v[1],v[2],v[3])
		wait(0.1)
	end
	AnimationID.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local Animation = PreloadAnimation(tonumber(AnimationID.Text))
			table.insert(Anims,Animation)
			if Dancing ~= true then Dancing = true;
				StopAll(); wait(.1); Animation:Play() Animation['Speed'] = speedlol
			else Dancing = false;
				StopAll(); wait(.1); Anims['Idle']:Play()
			end
		end
	end)
	AnimSpeed.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			speedlol = tonumber(AnimSpeed.Text)
		end
	end)
end
coroutine.wrap(QOZY_fake_script)()
-- setup
local function dragify(Frame)
	local frametomove = Frame
	dragToggle = nil
	local dragSpeed = 0
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		--	        TweenService:Create(frametomove, TweenInfo.new(0.25), {Position = Position}):Play()
		frametomove.Position = Position
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
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
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(TopBar)
local PARENT = nil
local function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end
if (not is_sirhurt_closure) and (syn and syn.protect_gui) then
	local Main = AnimXUi
	Main.Name = randomString()
	syn.protect_gui(Main)
	Main.Parent = game:GetService("CoreGui")
	PARENT = Main
elseif PROTOSMASHER_LOADED and get_hidden_gui then
	local Main = AnimXUi
	Main.Name = randomString()
	Main.Parent = get_hidden_gui()
	PARENT = Main
elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
	PARENT = game:GetService("CoreGui").RobloxGui
else
	local Main = AnimXUi
	Main.Name = randomString()
	Main.Parent = game:GetService("CoreGui")
	PARENT = Main
end	
TopBar.Parent = PARENT

Minimize.MouseButton1Click:Connect(function()
	toggleanimations = not toggleanimations
	local goal
	local easingdirection
	if toggleanimations then
		goal = UDim2.new(1,0,10,0)
		easingdirection = Enum.EasingDirection.In
		Minimize.Text = "+"
	elseif toggleanimations == false then
		goal = UDim2.new(1,0,0,0)
		easingdirection = Enum.EasingDirection.Out
		Minimize.Text = "-"
	end
	Animations:TweenSize(goal,easingdirection,Enum.EasingStyle.Quad,0.5)
end)
CustomID.MouseButton1Click:Connect(function()
	togglecustomid = not togglecustomid
	local goal
	local easingdirection
	if togglecustomid then
		goal = UDim2.new(1,0,0,0)
		easingdirection = Enum.EasingDirection.In
		CustomID.Text = "<"
	elseif togglecustomid == false then
		goal = UDim2.new(-4,0,0,0)
		easingdirection = Enum.EasingDirection.Out
		CustomID.Text = ">"
	end
	AnimationID.Visible = true
	AnimationID:TweenPosition(goal,easingdirection,Enum.EasingStyle.Quad,1)
	wait(1)
	if togglecustomid == false then AnimationID.Visible = false end
end)
local function respawnresetscript()
	game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
 		wait(game.Players.RespawnTime + 2)
		coroutine.wrap(QOZY_fake_script)()
		respawnresetscript()
	end)
end
respawnresetscript()
