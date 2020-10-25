if not game:IsLoaded() then
	local notLoaded = Instance.new("Message",workspace)
	notLoaded.Text = 'waiting for game to load fully'
	game.Loaded:Wait()
	notLoaded:Destroy()
end
local dacolor = Color3.new(0.262745, 0.137255, 0.0196078)
local player = game.Players.LocalPlayer
local prefix = '!'
local staffonline = 0
local minimized = false

local FinalStandGUI = Instance.new("ScreenGui")
local Bar = Instance.new("Frame")
local FinalStand = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local Main = Instance.new("ImageLabel")
local FullButton = Instance.new("TextButton")
local PartialButton = Instance.new("TextButton")
local info = Instance.new("TextButton")
local StaffOnline = Instance.new("TextLabel")

Bar.Name = "Bar"
Bar.Parent = FinalStandGUI
Bar.Position = UDim2.new(0.0610263534, 0, 0.191881925, 0)
Bar.Size = UDim2.new(0.0500000007, 150, 0.00999999978, 12)
Bar.BackgroundColor = BrickColor.new("Black metallic")
Bar.BackgroundColor3 = Color3.new(0.12549, 0.133333, 0.145098)
Bar.BorderSizePixel = 0
Bar.ZIndex = 999999798

FinalStand.Name = "Final Stand"
FinalStand.Parent = Bar
FinalStand.Size = UDim2.new(1, 0, 1, 0)
FinalStand.BackgroundColor = BrickColor.new("Institutional white")
FinalStand.BackgroundColor3 = Color3.new(1, 1, 1)
FinalStand.BackgroundTransparency = 1
FinalStand.ZIndex = 999999799
FinalStand.Font = Enum.Font.SourceSans
FinalStand.FontSize = Enum.FontSize.Size14
FinalStand.Text = "  Mens of Iron: Final Stand"
FinalStand.TextColor = BrickColor.new("Deep orange")
FinalStand.TextColor3 = Color3.new(1, 0.635294, 0)
FinalStand.TextScaled = true
FinalStand.TextSize = 14
FinalStand.TextWrap = true
FinalStand.TextWrapped = true
FinalStand.TextXAlignment = Enum.TextXAlignment.Left

Minimize.Name = "Minimize"
Minimize.Parent = Bar
Minimize.Position = UDim2.new(1, 0, 0, 0)
Minimize.Size = UDim2.new(0.100000001, 0, 1, 0)
Minimize.AnchorPoint = Vector2.new(1, 0)
Minimize.BackgroundColor = BrickColor.new("Institutional white")
Minimize.BackgroundColor3 = Color3.new(1, 1, 1)
Minimize.BackgroundTransparency = 1
Minimize.ZIndex = 999999799
Minimize.Font = Enum.Font.GothamBold
Minimize.FontSize = Enum.FontSize.Size60
Minimize.Text = "-"
Minimize.TextColor = BrickColor.new("Deep orange")
Minimize.TextColor3 = Color3.new(1, 0.635294, 0)
Minimize.TextScaled = true
Minimize.TextSize = 50
Minimize.TextWrap = true
Minimize.TextWrapped = true

Main.Name = "Main"
Main.Parent = Bar
Main.Size = UDim2.new(1, 0, 0.5, 125)
Main.BackgroundColor = BrickColor.new("Institutional white")
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.BackgroundTransparency = 1
Main.ZIndex = 999999750
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Color3.new(0.211765, 0.223529, 0.247059)
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.04
Main.ClipsDescendants = true

FullButton.Name = "Full Button"
FullButton.Parent = Main
FullButton.Position = UDim2.new(0.5, 0, 0.170000002, 0)
FullButton.Size = UDim2.new(0.949999988, 0, 0.25, 0)
FullButton.AnchorPoint = Vector2.new(0.5, 0)
FullButton.BackgroundColor = BrickColor.new("Institutional white")
FullButton.BackgroundColor3 = Color3.new(1, 1, 1)
FullButton.BackgroundTransparency = 1
FullButton.BorderSizePixel = 0
FullButton.ZIndex = 999999752
FullButton.Font = Enum.Font.SourceSans
FullButton.FontSize = Enum.FontSize.Size28
FullButton.Text = "patched, use partial"
FullButton.TextColor = BrickColor.new("Deep orange")
FullButton.TextColor3 = Color3.new(1, 0.635294, 0)
FullButton.TextSize = 25

PartialButton.Name = "Partial Button"
PartialButton.Parent = Main
PartialButton.Position = UDim2.new(0.5, 0, 0.449999988, 0)
PartialButton.Size = UDim2.new(0.949999988, 0, 0.25, 0)
PartialButton.AnchorPoint = Vector2.new(0.5, 0)
PartialButton.BackgroundColor = BrickColor.new("Institutional white")
PartialButton.BackgroundColor3 = Color3.new(1, 1, 1)
PartialButton.BackgroundTransparency = 1
PartialButton.BorderSizePixel = 0
PartialButton.ZIndex = 999999752
PartialButton.Font = Enum.Font.SourceSans
PartialButton.FontSize = Enum.FontSize.Size28
PartialButton.Text = "Map/Partial Paint"
PartialButton.TextColor = BrickColor.new("Deep orange")
PartialButton.TextColor3 = Color3.new(1, 0.635294, 0)
PartialButton.TextSize = 25

info.Name = "info"
info.Parent = Main
info.Position = UDim2.new(0.980000019, 0, 0.949999988, 0)
info.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
info.AnchorPoint = Vector2.new(1, 1)
info.BackgroundColor = BrickColor.new("Institutional white")
info.BackgroundColor3 = Color3.new(1, 1, 1)
info.BackgroundTransparency = 1
info.BorderSizePixel = 0
info.ZIndex = 999999752
info.Font = Enum.Font.SourceSans
info.FontSize = Enum.FontSize.Size28
info.Text = "info"
info.TextColor = BrickColor.new("Deep orange")
info.TextColor3 = Color3.new(1, 0.635294, 0)
info.TextSize = 25

StaffOnline.Parent = Main
StaffOnline.Position = UDim2.new(0.0199999996, 0, 0.949999988, 0)
StaffOnline.Size = UDim2.new(0.699999988, 0, 0.200000003, 0)
StaffOnline.AnchorPoint = Vector2.new(0, 1)
StaffOnline.BackgroundColor = BrickColor.new("Institutional white")
StaffOnline.BackgroundColor3 = Color3.new(1, 1, 1)
StaffOnline.BackgroundTransparency = 1
StaffOnline.ZIndex = 999999752
StaffOnline.Font = Enum.Font.SourceSans
StaffOnline.FontSize = Enum.FontSize.Size14
StaffOnline.Text = "Staff Online:"
StaffOnline.TextColor = BrickColor.new("Deep orange")
StaffOnline.TextColor3 = Color3.new(1, 0.635294, 0)
StaffOnline.TextScaled = true
StaffOnline.TextSize = 14
StaffOnline.TextWrap = true
StaffOnline.TextWrapped = true
StaffOnline.TextXAlignment = Enum.TextXAlignment.Left

local function shfghgfsdhgfsdhfgsdhfd(obj, prop)
	return ({pcall(function()if(typeof(obj[prop])=="Instance")then error()end end)})[1]
end

local function check4property(obj)
	return shfghgfsdhgfsdhfgsdhfd(obj,"Color")
end

local function checkforpaint()
	if player.Character:FindFirstChild("Paint") == nil and player.Backpack:FindFirstChild("Paint") then
		player.Character.Humanoid:EquipTool(player.Backpack:WaitForChild("Paint"))
		return true
	elseif player.Character:FindFirstChild("Paint") then
		return true
	else
		return false
	end
end

local function transformToColor3(col) --Function to convert, just cuz c;
	local r = col.r --Red value
	local g = col.g --Green value
	local b = col.b --Blue value
	return Color3.new(r,g,b); --Color3 datatype, made of the RGB inputs
end

local function colorcheck(name)
	if BrickColor.new(name) then
		dacolor = transformToColor3(BrickColor.new(name))
	end
end 

local function Roundify(parent)
	local RoundifyElement = Instance.new("ImageLabel",parent)
	RoundifyElement.Name = "Roundify"
	RoundifyElement.Position = UDim2.new(0.5, 0, 0.5, 0)
	RoundifyElement.Size = UDim2.new(1, 0, 1, 0)
	RoundifyElement.Active = true
	RoundifyElement.AnchorPoint = Vector2.new(0.5, 0.5)
	RoundifyElement.BackgroundColor = BrickColor.new("Institutional white")
	RoundifyElement.BackgroundColor3 = Color3.new(1, 1, 1)
	RoundifyElement.BackgroundTransparency = 1
	RoundifyElement.Selectable = true
	RoundifyElement.ZIndex = 999999751
	RoundifyElement.Image = "rbxassetid://3570695787"
	RoundifyElement.ImageColor3 = Color3.new(0.231373, 0.243137, 0.270588)
	RoundifyElement.ScaleType = Enum.ScaleType.Slice
	RoundifyElement.SliceCenter = Rect.new(100, 100, 100, 100)
	RoundifyElement.SliceScale = 0.04
end

Roundify(FullButton) Roundify(PartialButton) Roundify(info)

local function checkrank(dplayer)
	local rank = dplayer:GetRankInGroup(5445758)
	if rank >= 18 then
		return "staff"
	else
		return "justaplayer"
	end
end

local function colorobj(obj)
	if check4property(obj) then
		local ohTable1 = {
			["Part"] = obj,
			["Request"] = "Paint",
			["Color"] = dacolor
		}
		player.Character.Paint.RemoteEvent:FireServer(ohTable1)
	end
end

local function fullmap()
	checkforpaint()
	if checkforpaint() then
		for i,v in pairs(workspace:GetDescendants()) do
			colorobj(v)
		end
	end
end

local function partialmap()
	checkforpaint()
	if checkforpaint() then
		for i,v in pairs(workspace.MapParts:GetChildren()) do
			colorobj(v)
		end
	end
end

-- giving inf yield credit for helping here

local function Command(cmd)
	if string.sub(cmd,1,11) == "changecolor" then
		colorcheck(string.sub(cmd,13))
	elseif cmd == "poop" or cmd == "full" then
		fullmap()
	elseif cmd == "map" or cmd == "partial" then
		partialmap()
	end
end

local function getprfx(strn)
	if strn:sub(1,string.len(prefix))==prefix then return{'cmd',string.len(prefix)+1}
	end return
end

player.Chatted:Connect(function(msg)
	msg = msg:gsub('/e ', '')
	local t = getprfx(msg)
	if not t then return end
	msg = msg:sub(t[2])
	if t[1]=='cmd' then
		Command(msg)
	end
end)

-- ok no more infintie yield code skidding lol

local function playercheckwhatever(dplayer)
	local check = checkrank(dplayer)
	if check == "staff" then
		staffonline = staffonline + 1
		StaffOnline.Text = "Staff Online: " ..tostring(staffonline)
	end
	game.Players.PlayerRemoving:Connect(function(dplayer2)
		if check == "staff" and dplayer2 == dplayer then
			staffonline = staffonline - 1
			StaffOnline.Text = "Staff Online: " ..tostring(staffonline)
		end
	end)
end

game.Players.PlayerAdded:Connect(function(dplayer)
	playercheckwhatever(dplayer)
end)

for i,v in pairs(game.Players:GetPlayers()) do
	playercheckwhatever(v)
end

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
dragify(Bar)
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
	local Main = FinalStandGUI
	Main.Name = randomString()
	syn.protect_gui(Main)
	Main.Parent = game:GetService("CoreGui")
	PARENT = Main
elseif PROTOSMASHER_LOADED and get_hidden_gui then
	local Main = FinalStandGUI
	Main.Name = randomString()
	Main.Parent = get_hidden_gui()
	PARENT = Main
elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
	PARENT = game:GetService("CoreGui").RobloxGui
else
	local Main = FinalStandGUI
	Main.Name = randomString()
	Main.Parent = game:GetService("CoreGui")
	PARENT = Main
end	
Bar.Parent = PARENT

Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	local goal
	local easingdirection
	if minimized then
		goal = UDim2.new(1,0,0,0)
		easingdirection = Enum.EasingDirection.In
		Minimize.Text = "+"
	elseif minimized == false then
		goal = UDim2.new(1, 0, 0.5, 125)
		easingdirection = Enum.EasingDirection.Out
		Minimize.Text = "-"
	end
	Main:TweenSize(goal,easingdirection,Enum.EasingStyle.Quad,0.5)
end)

--FullButton.MouseButton1Click:Connect(function()
--	fullmap()
--end)

PartialButton.MouseButton1Click:Connect(function()
	partialmap()
end)

info.MouseButton1Click:Connect(function()
	local texttodisplay = [[Welcome to Final Stand, command list:
	!changecolor <BrickColor>
	!map/!partial
	Have Fun!]]
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = texttodisplay;
		Color = Color3.new(0.0156863, 1, 0);
		Font = Enum.Font.SourceSans;
		FontSize = Enum.FontSize.Size24;
	})
	warn(texttodisplay)
end)

warn[[Loaded PaintX
--]]
