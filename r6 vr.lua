settings().Rendering.EagerBulkExecution = true
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
settings().Physics.ForceCSGv2 = false
settings().Physics.DisableCSGv2 = true
settings().Physics.UseCSGv2 = false
settings().Physics.ThrottleAdjustTime = math.huge
settings().Network.TrackPhysicsDetails = true
settings().Network.TrackDataTypes = true
game.Players.LocalPlayer.MaximumSimulationRadius=1000
workspace.InterpolationThrottling = "Disabled"
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",1000)
local cr,cc = coroutine.resume,coroutine.create
local function netless(part)
	local a = Instance.new("BodyVelocity",part)
	a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(30,30,30)
	local a = Instance.new("BodyAngularVelocity",part)
	a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
	part.Velocity = Vector3.new(30,30,30)
	--[[
	cr(cc(function()
		while task.wait() do
			part.Velocity = Vector3.new(30,30,30)
		end
	end))]]
end
local VR = game:GetService("VRService")
game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 0)
game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)
local input = game:GetService("UserInputService")
local cam = workspace.CurrentCamera
cam.CameraType = "Scriptable"
cam.HeadScale = 5
local char = game.Players.LocalPlayer.Character
char.Torso.Anchored = true
local head,larm,rarm = char.Head,char["Left Arm"],char["Right Arm"]
local clonehead = head:Clone()
clonehead:ClearAllChildren()
clonehead.Parent = head
netless(head)
netless(larm)
netless(rarm)
netless(char.HumanoidRootPart)
char.Archivable = true
local char2 = char:Clone()
char2.Parent = workspace
task.wait()
char.Parent = char2
game.Players.LocalPlayer.Character = char2
--char2.Torso.Neck.Parent = nil
local hats = {}
local welds = {}
wait(game.Players.RespawnTime+1)
--char.Torso.Neck.Parent = nil
--char:BreakJoints()
--for i,v in pairs(char:GetDescendants()) do
--    cr(cc(function() if v:IsA("Motor6D") or v:IsA("Weld") then v.Parent = nil end end))
--end
for i,v in pairs(char:GetChildren()) do
	if v:IsA("Accessory") then
		local handle = v.Handle
		--handle.Transparency = 1
		local clone = handle:Clone()
		clone.Transparency = 1
		handle.Transparency = 1
		clone.Name = "Fake"
		clone.Parent = v
		clone:ClearAllChildren()
		local weld = Instance.new("Weld",workspace)
		weld.Part0 = clone
		weld.Part1 = handle.AccessoryWeld.Part1 == char.Head and clonehead or char.HumanoidRootPart
		weld.C0 = handle.AccessoryWeld.C0
		weld.C1 = handle.AccessoryWeld.C1
		if handle:FindFirstChildOfClass("Weld") then
			handle:FindFirstChildOfClass("Weld"):Destroy()
		end
		netless(handle)
		table.insert(hats,handle)
		table.insert(welds,weld)
	end
end
char.Torso:Destroy()
head.Transparency = 1
clonehead.Transparency = 1
local hcfr,larmcfr,rarmcfr
input.UserCFrameChanged:connect(function(Input,Move) -- Ty daddy sked <3
	if Input == Enum.UserCFrame.Head then
		hcfr = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move)
	elseif Input == Enum.UserCFrame.LeftHand then
		larmcfr = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move) * CFrame.Angles(math.rad(90),0,0)
	elseif Input == Enum.UserCFrame.RightHand then
		rarmcfr = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move) * CFrame.Angles(math.rad(90),0,0)
	end
end)

local r1down = false
local r2down = false
local KeyboardActive = false
keyboardDB = false

input.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.ButtonX then
		if cam.HeadScale > 2 then
			cam.HeadScale = cam.HeadScale - 1
		end
	elseif key.KeyCode == Enum.KeyCode.ButtonY then
		if cam.HeadScale < 7 then
			cam.HeadScale = cam.HeadScale + 1
		end
	end
end)

game.Players.PlayerAdded:connect(function(v)
	v.Chatted:connect(function(Message)
		game:GetService("Chat"):Chat(v.Character.Head,Message)
	end)
end)

for i,v in pairs(game.Players:GetPlayers()) do
	v.Chatted:connect(function(Message)
		game:GetService("Chat"):Chat(v.Character.Head,Message)
	end)
end

game:GetService('RunService').Stepped:connect(function()
	for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		cr(cc(function()
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end))
	end
	game.Players.LocalPlayer.MaximumSimulationRadius=1000
	sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",1000)
end)

game:GetService('RunService').Heartbeat:connect(function()
	head.Velocity = Vector3.new(30,30,30)
	larm.Velocity = Vector3.new(30,30,30)
	rarm.Velocity = Vector3.new(30,30,30)
	char.HumanoidRootPart.Velocity = Vector3.new(30,30,30)
	if hcfr then
		head.CFrame = hcfr
		clonehead.CFrame = hcfr
	end
	if larmcfr then
		larm.CFrame = larmcfr
	end
	if rarmcfr then
		rarm.CFrame = rarmcfr
	end
	if r1down then
		--workspace.CurrentCamera.CFrame * CFrame.new(0,0,-math.abs(0.5*1))
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(workspace.CurrentCamera.CoordinateFrame+(head.CFrame).LookVector * workspace.CurrentCamera.HeadScale/2, 0.5)
	end
	if r2down then
		--workspace.CurrentCamera.CFrame * CFrame.new(0,0,-math.abs(0.5*1))
		--workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(workspace.CurrentCamera.CFrame * CFrame.Angles(0,math.rad(1),0), 0.5)
	end
	char.HumanoidRootPart.CFrame = head.CFrame
	for i,v in pairs(hats) do
		cr(cc(function()
			v.Velocity = Vector3.new(30,30,30)
			v.CFrame = v.Parent.Fake.CFrame
			if v:FindFirstChildOfClass("Weld") then
				v:FindFirstChildOfClass("Weld"):Destroy()
			end
		end))
	end
	for i,v in pairs(welds) do
		cr(cc(function()
			v.Parent = workspace
		end))
	end
end)

-- chat and viewport, credit to gorilla vr
--=========[Keyboard]==========--
local Keyboard = game:GetObjects("rbxassetid://8609404226")[1]; Keyboard.Parent = workspace
local Caps = false

for _,key in pairs(Keyboard:GetChildren()) do
	if key.Name == "Board" then continue end
	local display = key:FindFirstChild("Display");
	if display and display:FindFirstChild("Key") then
		display.Key.TextScaled = true
	end
	key.Touched:Connect(function(part)
		if KeyboardActive then
			if part == larm or part == rarm then
				if key.Name:find("Key") then
					game.Players:Chat(display.Key.Text)
					game.ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(display.Key.Text,"All")
					KeyboardActive = false	
				elseif key.Name == "Exit" then
					KeyboardActive = false
				end
			end
		end
	end)
end

function handleKeyboard()
	if (char.HumanoidRootPart.Position - Keyboard.PrimaryPart.Position).Magnitude > 20 then
		KeyboardActive = false
	end
	if KeyboardActive then
		Keyboard.Parent = workspace
		--Keyboard:SetPrimaryPartCFrame(Keyboard.PrimaryPart.CFrame:lerp(Keyboard.PrimaryPart.CFrame * (header.CFrame - header.Position), .01))
		Keyboard:SetPrimaryPartCFrame(Keyboard.PrimaryPart.CFrame:lerp(CFrame.lookAt(Keyboard.PrimaryPart.Position, workspace.CurrentCamera.CFrame.Position) * CFrame.Angles(0,math.rad(180),0), .01))
	else
		Keyboard.Parent = game.ReplicatedStorage
	end
end
game.RunService.RenderStepped:Connect(handleKeyboard)

input.InputChanged:connect(function(key)
	if key.KeyCode == Enum.KeyCode.ButtonR1 then
		if key.Position.Z > 0.9 then
			r1down = true
		else
			r1down = false
		end
	elseif key.KeyCode == Enum.KeyCode.ButtonR2 then
		if key.Position.Z > 0.9 then
			warn("activating fling on " ..rarm)
			rarm.BodyAngularVelocity.AngularVelocity = Vector3.new(69000000,69000000,69000000)
		else
			warn("deactivating fling on " ..rarm)
			rarm.BodyAngularVelocity.AngularVelocity = Vector3.new(0,0,0)
		end
	elseif key.KeyCode == Enum.KeyCode.ButtonL2 then
		if key.Position.Z > 0.9 then
			warn("activating fling on " ..larm)
			larm.BodyAngularVelocity.AngularVelocity = Vector3.new(69000000,69000000,69000000)
		else
			warn("deactivating fling on " ..larm)
			larm.BodyAngularVelocity.AngularVelocity = Vector3.new(0,0,0)
		end
	end
end)

input.InputBegan:Connect(function(Input, Processed)
	print(Input.KeyCode)
		if Input.KeyCode == Enum.KeyCode.ButtonA and not keyboardDB then
			keyboardDB = true
			Keyboard:SetPrimaryPartCFrame((workspace.CurrentCamera.CFrame + Vector3.new(0,1,0)) * CFrame.new(0,0,-3))
			KeyboardActive = not KeyboardActive
			wait(.5)
			keyboardDB = false
		end
end)

ChatHUDFunc = function()
	--[[
		Variables
	--]]

	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")

	local VRService = game:GetService("VRService")

	local Players = game:GetService("Players")
	local Client = Players.LocalPlayer

	local ChatHUD = game:GetObjects("rbxassetid://4476067885")[1]
	local GlobalFrame = ChatHUD.GlobalFrame
	local Template = GlobalFrame.Template
	--Template.TextSize = Enum.FontSize.Size48
	--Template.User.TextSize = Enum.FontSize.Size48
	local LocalFrame = ChatHUD.LocalFrame
	local Global = ChatHUD.Global
	local Local = ChatHUD.Local

	local Camera = workspace.CurrentCamera

	Template.Parent = nil
	ChatHUD.Parent = game:GetService("CoreGui")

	--[[
		Code
	--]]

	local Highlight = Global.Frame.BackgroundColor3
	local Deselected = Local.Frame.BackgroundColor3

	local OpenGlobalTab = function()
		Global.Frame.BackgroundColor3 = Highlight
		Local.Frame.BackgroundColor3 = Deselected

		Global.Font = Enum.Font.SourceSansBold
		Local.Font = Enum.Font.SourceSans

		GlobalFrame.Visible = true
		LocalFrame.Visible = false
	end

	local OpenLocalTab = function()
		Global.Frame.BackgroundColor3 = Deselected
		Local.Frame.BackgroundColor3 = Highlight

		Global.Font = Enum.Font.SourceSans
		Local.Font = Enum.Font.SourceSansBold

		GlobalFrame.Visible = false
		LocalFrame.Visible = true
	end

	Global.MouseButton1Down:Connect(OpenGlobalTab)
	Local.MouseButton1Down:Connect(OpenLocalTab)
	Global.MouseButton1Click:Connect(OpenGlobalTab)
	Local.MouseButton1Click:Connect(OpenLocalTab)

	OpenLocalTab()

	--

	local function GetPlayerDistance(Sender)
		if Sender.Character and Sender.Character:FindFirstChild("Head") then
			return math.floor((Sender.Character.Head.Position - Camera:GetRenderCFrame().p).Magnitude + 0.5)
		end
	end

	local function NewGlobal(Message, Sender, Color)
		local Frame = Template:Clone()

		Frame.Text = ("[%s]: %s"):format(Sender.Name, Message)
		Frame.User.Text = ("[%s]:"):format(Sender.Name)
		Frame.User.TextColor3 = Color
		Frame.BackgroundColor3 = Color
		Frame.Parent = GlobalFrame

		delay(60, function()
			Frame:Destroy()
		end)
	end

	local function NewLocal(Message, Sender, Color, Dist)
		local Frame = Template:Clone()

		Frame.Text = ("(%s) [%s]: %s"):format(tostring(Dist), Sender.Name, Message)
		Frame.User.Text = ("(%s) [%s]:"):format(tostring(Dist), Sender.Name)
		Frame.User.TextColor3 = Color
		Frame.BackgroundColor3 = Color
		Frame.Parent = LocalFrame

		delay(60, function()
			Frame:Destroy()
		end)
	end

	local function OnNewChat(Message, Sender, Color)
		if not ChatHUD or not ChatHUD.Parent then return end

		NewGlobal(Message, Sender, Color)

		local Distance = GetPlayerDistance(Sender)

		if Distance and Distance <= 70 then
			NewLocal(Message, Sender, Color, Distance)
		end
	end

	local function OnPlayerAdded(Player)
		if not ChatHUD or not ChatHUD.Parent then return end

		local Color = BrickColor.Random().Color

		Player.Chatted:Connect(function(Message)
			OnNewChat(Message, Player, Color)
		end)
	end

	Players.PlayerAdded:Connect(OnPlayerAdded)

	for _, Player in pairs(Players:GetPlayers()) do
		OnPlayerAdded(Player)
	end

	--

	local ChatPart = ChatHUD.Part

	ChatHUD.Adornee = ChatPart

		ChatHUD.Parent = game:GetService("CoreGui")
		ChatHUD.Enabled = true
		ChatHUD.AlwaysOnTop = true

		local OnInput = UserInputService.InputBegan:Connect(function(Input, Processed)
			if not Processed then
				if Input.KeyCode == Enum.KeyCode.ButtonB then
					ChatHUD.Enabled = not ChatHUD.Enabled
				end
			end
		end)

		local RenderStepped = RunService.RenderStepped:Connect(function()

		ChatPart.CFrame = larm.CFrame * CFrame.Angles(math.rad(-90),math.rad(0), math.rad(0)) * CFrame.new(0,-0.85,0)
		end)

		local CharacterAdded

		CharacterAdded = Client.CharacterAdded:Connect(function()
			OnInput:Disconnect()
			RenderStepped:Disconnect()
			CharacterAdded:Disconnect()

			ChatHUD:Destroy()
			ChatHUD = nil
		end)
end;

ViewHUDFunc = function()
	local ViewportRange = 32
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local VRService = game:GetService("VRService")
	local Players = game:GetService("Players")
	local Client = Players.LocalPlayer
	local Mouse = Client:GetMouse()
	local Camera = workspace.CurrentCamera
	local CameraPort = Camera.CFrame
	local ViewHUD = script:FindFirstChild("ViewHUD") or game:GetObjects("rbxassetid://4480405425")[1]
	local Viewport = ViewHUD.Viewport
	local Viewcam = Instance.new("Camera")
	local ViewPart = ViewHUD.Part
	ViewHUD.Parent = game:GetService("CoreGui")
	Viewcam.Parent = Viewport
	Viewcam.CameraType = Enum.CameraType.Scriptable
	Viewport.CurrentCamera = Viewcam
	Viewport.BackgroundTransparency = 1

	--[[Code]]--

	local function Clone(Character)
		local Arc = Character.Archivable
		local Clone;

		Character.Archivable = true
		Clone = Character:Clone()
		Character.Archivable = Arc

		return Clone
	end

	local function GetPart(Name, Parent, Descendants)
		for i = 1, #Descendants do
			local Part = Descendants[i]

			if Part.Name == Name and Part.Parent.Name == Parent then
				return Part
			end
		end
	end
	
	local function OnPlayerAdded(Player)
		if not ViewHUD or not ViewHUD.Parent then return end

		local function CharacterAdded(Character)
			if not ViewHUD or not ViewHUD.Parent then return end

			Character:WaitForChild("Head")
			Character:WaitForChild("Humanoid")

			wait(3)

			local FakeChar = Clone(Character)
			local TrueRoot = Character:FindFirstChild("HumanoidRootPart") or Character:FindFirstChild("Head")
			local Root = FakeChar:FindFirstChild("HumanoidRootPart") or FakeChar:FindFirstChild("Head")
			local RenderConnection;

			local Descendants = FakeChar:GetDescendants()
			local RealDescendants = Character:GetDescendants()
			local Correspondents = {};

			FakeChar.Humanoid.DisplayDistanceType = "None"

			for i = 1, #Descendants do
				local Part = Descendants[i]
				local Real = Part:IsA("BasePart") and GetPart(Part.Name, Part.Parent.Name, RealDescendants)
				if Part:IsA("BasePart") and Real then
					Part.Anchored = true
					Part:BreakJoints()
					if not string.find(Part.Name, "Fake") and Part.Name ~= "HumanoidRootPart" then
						Part.Transparency = 0
					else 
						Part.Transparency = 1
					end
					table.insert(Correspondents, {Part, Real})
				end
			end

			RenderConnection = RunService.RenderStepped:Connect(function()
				if not Character or not Character.Parent then
					RenderConnection:Disconnect()
					FakeChar:Destroy()
					return
				end
				if (TrueRoot and (TrueRoot.Position - Camera.CFrame.p).Magnitude <= ViewportRange) or Player == Client or not TrueRoot then
					for i = 1, #Correspondents do
						local Part, Real = unpack(Correspondents[i])

						if Part and Real and Part.Parent and Real.Parent then
							Part.CFrame = Real.CFrame - Vector3.new(0,1,0)
						elseif Part.Parent and not Real.Parent then
							Part:Destroy()
						end
					end
				end
			end)
			FakeChar.Parent = Viewcam
		end
		Player.CharacterAdded:Connect(CharacterAdded)
		if Player.Character then
			spawn(function()
				CharacterAdded(Player.Character)
			end)
		end
	end
	
	OnPlayerAdded(char)
	
	ViewPart.Size = Vector3.new()

	Viewport.Position = UDim2.new(.62, 0, .89, 0)
	Viewport.Size = UDim2.new(.3, 0, .3, 0)
	Viewport.AnchorPoint = Vector2.new(.5, 1)

	local RenderStepped = RunService.RenderStepped:Connect(function()
		local Render = Camera.CFrame
		local Scale = Camera.ViewportSize
		Render = Render * VRService:GetUserCFrame(Enum.UserCFrame.Head)
		CameraPort = CFrame.new(Render.p + Vector3.new(5, 2, 0), Render.p)
		Viewport.Camera.CFrame = CameraPort
		ViewPart.CFrame = Render * CFrame.new(0, 0, -16)
		ViewHUD.Size = UDim2.new(0, Scale.X - 6, 0, Scale.Y - 6)
	end)

	--

	local CharacterAdded

	CharacterAdded = Client.CharacterAdded:Connect(function()
		RenderStepped:Disconnect()
		CharacterAdded:Disconnect()

		ViewHUD:Destroy()
		ViewHUD = nil
	end)

	wait(9e9)
end;

task.spawn(ChatHUDFunc)
task.spawn(ViewHUDFunc)
