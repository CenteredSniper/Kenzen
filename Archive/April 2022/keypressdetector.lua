--[[ // METADATA

Last Modified: 4/17/2022 8:43AM
Author: Me

--]]

local Keybinds = { -- settings!!
	["Z"] = {
		["Color"] = Color3.fromRGB(0,0,0),
		["Number"] = 1,
		["DisplayName"] = "Z",
		["Pressed"] = false, -- Don't edit
	},
	["X"] = {
		["Color"] = Color3.fromRGB(0,0,0),
		["Number"] = 2,
		["DisplayName"] = "X",
		["Pressed"] = false, -- Don't edit
	},
	["KeypadTwo"] = {
		["Color"] = Color3.fromRGB(73,0,147),
		["Number"] = 3,
		["DisplayName"] = "Num2",
		["Pressed"] = false, -- Don't edit
	},
	["KeypadThree"] = {
		["Color"] = Color3.fromRGB(73,0,147),
		["Number"] = 4,
		["DisplayName"] = "Num3",
		["Pressed"] = false, -- Don't edit
	},
}

local GUI = Instance.new("ScreenGui")
GUI.ResetOnSpawn = false
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0,200,0,50)
Frame.Position = UDim2.new(0.049,0,0.731,0)
Frame.BackgroundTransparency = 1

local Label = Instance.new("TextLabel")
Label.BorderSizePixel = 3
Label.BackgroundColor3 = Color3.new(0,0,0)
Label.Position = UDim2.new(0,0,0.1,0)
Label.Size = UDim2.new(0,40,0,40)
Label.TextTruncate = Enum.TextTruncate.AtEnd
Label.TextColor3 = Color3.new(1,1,1)

local Keystroke = Instance.new("Frame")
Keystroke.Size = UDim2.new(1,0,0,0)
Keystroke.ZIndex = 0
Keystroke.BorderSizePixel = 0
Keystroke.AnchorPoint = Vector2.new(0,1)

local keystrokes = {}
local userinput = game:GetService("UserInputService")
local renderstepped = game:GetService("RunService").RenderStepped

for i,v in pairs(Keybinds) do
	if Enum.KeyCode[i] then
		local key = Enum.KeyCode[i]
		
		local newlabel = Label:Clone()
		newlabel.Name = tostring(v["Number"])
		newlabel.Position = UDim2.new((v["Number"]*27-27)/100,0,0.1,0) 
		newlabel.Text = v["DisplayName"]
		newlabel.BorderColor3 = v["Color"]
		
		userinput.InputBegan:Connect(function(Key)
			if Key.KeyCode == key then
				v["Pressed"] = true
				local newframe = Keystroke:Clone()
				newframe.BackgroundColor3 = v["Color"]
				newframe.Parent = newlabel
				repeat
					newframe.Size = newframe.Size + UDim2.new(0,0,0,1)
					renderstepped:Wait()
				until not v["Pressed"]
				repeat 
					newframe.Position = newframe.Position - UDim2.new(0,0,0,1)
					newframe.Transparency = newframe.Transparency + 0.005
					renderstepped:Wait()
				until newframe.Transparency >= 1
			end
		end)
		userinput.InputEnded:Connect(function(Key)
			if Key.KeyCode == key then
				v["Pressed"] = false
			end
		end)
		newlabel.Parent = Frame
	end
end

Frame.Parent = GUI
GUI.Parent = game.CoreGui
