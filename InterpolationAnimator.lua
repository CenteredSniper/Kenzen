local tic = tick()

-- | Initial Setup
local drag = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/drag.lua",true))()
local Tween = game:GetService("TweenService")
local Player = game:GetService("Players").LocalPlayer
Player.Character.Archivable = true
local Character = Player.Character:Clone()
Character.Parent = workspace

-- / Variables
local writefile = writefile or setclipboard and function(_,str) setclipboard(str) end or print
local isfile = isfile or function() return false end

local Welds = {}
local Sine = 1
local Index = 0
local Selected = 0

local mouse = Player:GetMouse()
local Events = {}
local Increment = 10
local lastCFrame = nil
local Rotating = true

local MasterModify

local Parent = Player.PlayerGui
local Success,Log = pcall(function() Instance.new("Part",game.CoreGui) end)
if Success then Parent = game.CoreGui end

local Format = "%s.C0 = %s.C0:lerp(%s*CFrame.new(%f+%f*math.cos(Sine/%f),%f+%f*math.cos(Sine/%f),%f+%f*math.cos(Sine/%f))*CFrame.Angles(math.rad(%f+%f*math.cos(Sine/%f)),math.rad(%f+%f*math.cos(Sine/%f)),math.rad(%f+%f*math.cos(Sine/%f))), .1)"

-- / Functions

local roundDecimals = function(num, places)
	places = math.pow(10, places or 0)
	num = num * places
	if num >= 0 then 
		num = math.floor(num + 0.5) 
	else 
		num = math.ceil(num - 0.5) 
	end
	return num / places
end

local function AngleFromAxis(axis,rA)
	return math.rad(roundDecimals(math.deg(rA),Increment))
end

local function IsSelectable(part,hit)
	if part and Player.Character:FindFirstChild("Head") then
		if not part.Locked and (hit - Player.Character.Head.Position).magnitude < 60 then return true end
	end
	return false
end

local function SetIncrement(p)
	Increment = p < 1 and 1 or p > 360 and 360 or p
end

local function AxisToDirection(p)
	if p == Enum.NormalId.Left or p == Enum.NormalId.Right then
		return "X"
	elseif p == Enum.NormalId.Top or p == Enum.NormalId.Bottom then
		return "Y"
	elseif p == Enum.NormalId.Front or p == Enum.NormalId.Back then
		return "Z"
	end
end

local function IsNegative(p)
	if p == Enum.NormalId.Left or p == Enum.NormalId.Front or p == Enum.NormalId.Bottom then
		return -1
	else
		return 1
	end
end

local function Create(Name,Parent,Properties)
	local NewInstance = Instance.new(Name)
	for i,v in pairs(Properties) do
		NewInstance[i] = v
	end
	NewInstance.Parent = Parent
	return NewInstance
end

-- / Sine
task.spawn(function()
	while true do
		Sine = Sine + 1
		task.wait(1/60)
	end
end)

-- | GUI Setup

local GUI = Create("ScreenGui",Parent,{
	["ResetOnSpawn"] = false
})

-- / Main Frame
local MainFrame = Create("Frame",GUI,{
	["BackgroundColor3"] = Color3.fromRGB(71,71,71),
	["Position"] = UDim2.new(0.05,0,0,GUI.AbsoluteSize.Y/2),
	["Size"] = UDim2.new(0,129,0,213),
	["AnchorPoint"] = Vector2.new(0,0.5),
	["BorderSizePixel"] = 0,
})

local MainDrag = Create("Frame",MainFrame,{
	["BackgroundColor3"] = Color3.fromRGB(52, 52, 52),
	["Size"] = UDim2.new(0,129,0,21),
	["BorderSizePixel"] = 0,
})

local MainScrollFrame = Create("ScrollingFrame",MainFrame,{
	["BackgroundTransparency"] = 1,
	["Size"] = UDim2.new(1, 0, 0, 191),
	["Position"] = UDim2.new(0, 0, 0, 22),
	["ScrollBarThickness"] = 0,
	["ScrollingDirection"] = Enum.ScrollingDirection.Y,
	["CanvasSize"] = UDim2.new(0,0,0,0),
	["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
})

local UIListLayout = Create("UIListLayout",MainScrollFrame,{})

local ExampleButton = Create("TextButton",nil,{
	["BackgroundColor3"] = Color3.fromRGB(71, 71, 71),
	["Size"] = UDim2.new(1, 0,0, 20),
	["BorderSizePixel"] = 0,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
})

local Image = Create("ImageLabel",ExampleButton,{
	["BackgroundTransparency"] = 1,
	["Size"] = UDim2.new(0, 20,1, 0),
	["Image"] = "http://www.roblox.com/asset/?id=413369028",
})

-- / Export Frame

local ExportFrame = Create("Frame",GUI,{
	["BackgroundColor3"] = Color3.fromRGB(71,71,71),
	["Position"] = UDim2.new(0.05,0,0,GUI.AbsoluteSize.Y/2-150),
	["Size"] = UDim2.new(0,129,0,71),
	["AnchorPoint"] = Vector2.new(0,0.5),
	["BorderSizePixel"] = 0,
})

local ExportDrag = Create("Frame",ExportFrame,{
	["BackgroundColor3"] = Color3.fromRGB(52, 52, 52),
	["Size"] = UDim2.new(0,129,0,21),
	["BorderSizePixel"] = 0,
})

local ExportButton = Create("TextButton",ExportFrame,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["Position"] = UDim2.new(0.97, 0,0.95, 0),
	["AnchorPoint"] = Vector2.new(1,1),
	["Size"] = UDim2.new(0.45, 0,0, 20),
	["BorderSizePixel"] = 0,
	["Text"] = "Export",
	["TextColor3"] = Color3.new(1,1,1),
})

local ClearButton = Create("TextButton",ExportFrame,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["Position"] = UDim2.new(0.03, 0,0.95, 0),
	["AnchorPoint"] = Vector2.new(0,1),
	["Size"] = UDim2.new(0.45, 0,0, 20),
	["BorderSizePixel"] = 0,
	["Text"] = "Clear",
	["TextColor3"] = Color3.new(1,1,1),
})

local InputBox = Create("TextBox",ExportFrame,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["Position"] = UDim2.new(0.5, 0,0.35, 0),
	["AnchorPoint"] = Vector2.new(0.5,0),
	["Size"] = UDim2.new(0.9, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["PlaceholderText"] = "FileName",
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),
})

-- / Modify Frame

local ModifyFrame = Create("Frame",GUI,{
	["BackgroundColor3"] = Color3.fromRGB(71,71,71),
	["Position"] = UDim2.new(0.05,0,0,GUI.AbsoluteSize.Y/2+155),
	["Size"] = UDim2.new(0,240,0,85),
	["AnchorPoint"] = Vector2.new(0,0.5),
	["BorderSizePixel"] = 0,
})

local ModifyDrag = Create("Frame",ModifyFrame,{
	["BackgroundColor3"] = Color3.fromRGB(52, 52, 52),
	["Size"] = UDim2.new(1,0,0.15,0),
	["BorderSizePixel"] = 0,
})

MasterModify = Create("Frame",ModifyFrame,{
	["BackgroundTransparency"] = 1,
	["Position"] = UDim2.new(0,0,1,0),
	["Size"] = UDim2.new(1, 0,0.85, 0),
	["AnchorPoint"] = Vector2.new(0,1),
	["BorderSizePixel"] = 0,
})

local XButton = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "X",
	["Position"] = UDim2.new(0.02, 0,0.06, 0),
})

local YButton = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Y",
	["Position"] = UDim2.new(0.18, 0,0.06, 0),
})

local ZButton = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Z",
	["Position"] = UDim2.new(0.34, 0,0.06, 0),
})

local XSin = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(1,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "XSin",
	["Position"] = UDim2.new(0.66, 0,0.06, 0),
})

local YSin = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(1,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "YSin",
	["Position"] = UDim2.new(0.82, 0,0.06, 0),
})

local ZSin = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(1,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "ZSin",
	["Position"] = UDim2.new(0.98, 0,0.06, 0),
})

local X1 = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "X1",
	["Position"] = UDim2.new(0.02, 0,0.4, 0),
})

local Y1 = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Y1",
	["Position"] = UDim2.new(0.18, 0,0.4, 0),
})

local Z1 = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Z1",
	["Position"] = UDim2.new(0.34, 0,0.4, 0),
})

local X1Sin = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(1,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "X1Sin",
	["Position"] = UDim2.new(0.66, 0,0.4, 0),
})

local Y1Sin = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(1,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Y1Sin",
	["Position"] = UDim2.new(0.82, 0,0.4, 0),
})

local Z1Sin = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(1,0),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Z1Sin",
	["Position"] = UDim2.new(0.98, 0,0.4, 0),
})

local SinBox = Create("TextBox",MasterModify,{
	["BackgroundColor3"] = Color3.fromRGB(42, 42, 42),
	["AnchorPoint"] = Vector2.new(0.5,1),
	["Size"] = UDim2.new(0.15, 0,0, 20),
	["BorderSizePixel"] = 0,
	["ClearTextOnFocus"] = false,
	["Text"] = "",
	["TextColor3"] = Color3.new(1,1,1),
	["PlaceholderColor3"] = Color3.fromRGB(194, 194, 194),

	["PlaceholderText"] = "Sin",
	["Position"] = UDim2.new(0.5, 0,0.98, 0),
})

ClearButton.Activated:Connect(function()
	for i,v in pairs(Welds) do
		v[2] = {
			["X"] = 0,
			["Y"] = 0,
			["Z"] = 0,
			["XSin"] = 0,
			["ZSin"] = 0,
			["YSin"] = 0,
			["X1"] = 0,
			["Y1"] = 0,
			["Z1"] = 0,
			["X1Sin"] = 0,
			["Y1Sin"] = 0,
			["Z1Sin"] = 0,
			["Sin"] = 1,
		}
	end
end)

ExportButton.Activated:Connect(function()
	if InputBox.Text == "" then
		for i = 1, 5 do
			InputBox.Text = InputBox.Text .. string.char(math.random(97,122))
		end
	elseif isfile(InputBox.Text .. ".Anima") then
		InputBox.Text = ""
		for i = 1, 5 do
			InputBox.Text = InputBox.Text .. string.char(math.random(97,122))
		end
	end
	if not isfile(InputBox.Text .. ".Anima") then
		local MasterString = ""
		for i,v in pairs(Welds) do
			local name = v[1].Parent.Parent:IsA("Accessory") and v[1].Parent.Parent.Name or v[1].Part1.Name
			MasterString = MasterString.."\n" .. string.format(Format, name,name,name .. "C0",
				v[2]["X"],v[2]["XSin"],v[2]["Sin"],
				v[2]["Y"],v[2]["YSin"],v[2]["Sin"],
				v[2]["Z"],v[2]["ZSin"],v[2]["Sin"],
				v[2]["X1"],v[2]["X1Sin"],v[2]["Sin"],
				v[2]["Y1"],v[2]["Y1Sin"],v[2]["Sin"],
				v[2]["Z1"],v[2]["Z1Sin"],v[2]["Sin"])
		end
		writefile(InputBox.Text .. ".Anima",MasterString)
	end
end)

task.spawn(function()
	for i,v in pairs(Character:GetDescendants()) do
		if v:IsA("Motor6D") or v:IsA("Weld") then
			Index = Index + 1
			local currentindex = Index
			local newbutton = ExampleButton:Clone()
			newbutton.Text = v.Parent.Parent:IsA("Accessory") and v.Parent.Parent.Name or v.Part1.Name
			newbutton.Parent = MainScrollFrame
			newbutton.Activated:Connect(function()
				Selected = currentindex
				for i,v in pairs(MasterModify:GetChildren()) do
					v.Text = Welds[currentindex][2][v.PlaceholderText]
				end
				for _,g in pairs(MainScrollFrame:GetChildren()) do
					if g:IsA("TextButton") then
						g.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
					end
				end
				newbutton.BackgroundColor3 = Color3.fromRGB(100,100,100)
			end)
			local WeldData = 
				v.Name == "RootJoint" and {["X"] = 0,["Y"] = 0,["Z"] = 0,["XSin"] = 0,["ZSin"] = 0,["YSin"] = 0,["X1"] = -90,["Y1"] = 0,["Z1"] = 0,["X1Sin"] = 0,["Y1Sin"] = 0,["Z1Sin"] = 0,["Sin"] = 1,}
				or v.Name == "Left Hip" and {["X"] = 0.5,["Y"] = -1,["Z"] = 0.5,["XSin"] = 0,["ZSin"] = 0,["YSin"] = 0,["X1"] = 0,["Y1"] = 0,["Z1"] = 0,["X1Sin"] = 0,["Y1Sin"] = 0,["Z1Sin"] = 0,["Sin"] = 1,}
				or v.Name == "Right Hip" and {["X"] = -0.5,["Y"] = -1,["Z"] = 0.5,["XSin"] = 0,["ZSin"] = 0,["YSin"] = 0,["X1"] = 0,["Y1"] = 0,["Z1"] = 0,["X1Sin"] = 0,["Y1Sin"] = 0,["Z1Sin"] = 0,["Sin"] = 1,}
				or v.Name == "Left Shoulder" and {["X"] = -1.5,["Y"] = 0.5,["Z"] = -0.5,["XSin"] = 0,["ZSin"] = 0,["YSin"] = 0,["X1"] = 0,["Y1"] = 0,["Z1"] = 0,["X1Sin"] = 0,["Y1Sin"] = 0,["Z1Sin"] = 0,["Sin"] = 1,}
				or v.Name == "Right Shoulder" and {["X"] = 1.5,["Y"] = 0.5,["Z"] = -0.5,["XSin"] = 0,["ZSin"] = 0,["YSin"] = 0,["X1"] = 0,["Y1"] = 0,["Z1"] = 0,["X1Sin"] = 0,["Y1Sin"] = 0,["Z1Sin"] = 0,["Sin"] = 1,}
				or v.Name == "Neck" and Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and {["X"] = 0,["Y"] = 1,["Z"] = 0,["XSin"] = 0,["ZSin"] = 0,["YSin"] = 0,["X1"] = -90,["Y1"] = 0,["Z1"] = 180,["X1Sin"] = 0,["Y1Sin"] = 0,["Z1Sin"] = 0,["Sin"] = 1,}
				or {
					["X"] = roundDecimals(v.C0.Position.X,2),
					["Y"] = roundDecimals(v.C0.Position.Y,2),
					["Z"] = roundDecimals(v.C0.Position.Z,2),
					["XSin"] = 0,
					["ZSin"] = 0,
					["YSin"] = 0,
					["X1"] = roundDecimals(v.C0.Rotation.X,2),
					["Y1"] = roundDecimals(v.C0.Rotation.Y,2),
					["Z1"] = roundDecimals(v.C0.Rotation.Z,2),
					["X1Sin"] = 0,
					["Y1Sin"] = 0,
					["Z1Sin"] = 0,
					["Sin"] = 1,
				}
			table.insert(Welds,{v,WeldData})
		end
	end
end)

for i,v in pairs(MasterModify:GetChildren()) do
	v.Name = v.PlaceholderText
	v.Changed:Connect(function(Change)
		if Change == "Text" and Welds[Selected] and Welds[Selected][1] and tonumber(v.Text) then
			Welds[Selected][2][v.PlaceholderText] = tonumber(v.Text)
		end
	end)
end

drag(MainDrag,MainFrame) drag(ExportDrag,ExportFrame) drag(ModifyDrag,ModifyFrame)

task.spawn(function()
	while true do
		for i,v in pairs(Welds) do
			if v[1] then
				local data = v[2]
				local C0Data = v[1].C0:lerp(
					CFrame.new(
						data["X"] + data["XSin"] * math.cos(Sine/data["Sin"]),
						data["Y"] + data["YSin"] * math.cos(Sine/data["Sin"]),
						data["Z"] + data["ZSin"] * math.cos(Sine/data["Sin"])
					) * 
						CFrame.Angles(
							math.rad(data["X1"] + data["X1Sin"] * math.cos(Sine/data["Sin"])),
							math.rad(data["Y1"] + data["Y1Sin"] * math.cos(Sine/data["Sin"])),
							math.rad(data["Z1"] + data["Z1Sin"] * math.cos(Sine/data["Sin"]))
						)
					,.1)
				Tween:Create(v[1],TweenInfo.new(1/30),{C0=C0Data}):Play()
			end
		end
		task.wait(1/30)
	end
end)

print("Load Time:",tick()-tic)
