--[[ // METADATA

Last Modified: 3/12/2019 12:31PM
Author: ???

--]]

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local TeleportGUI = Instance.new("ScreenGui")
local Gui = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local TP = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local Open = Instance.new("TextButton")
--Properties:
TeleportGUI.Name = "TeleportGUI"
TeleportGUI.Parent = game.CoreGui
TeleportGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Gui.Name = "Gui"
Gui.Parent = TeleportGUI
Gui.BackgroundColor3 = Color3.new(0, 0, 0)
Gui.BorderSizePixel = 0
Gui.Position = UDim2.new(0.385374188, 0, 0.336101025, 0)
Gui.Size = UDim2.new(0, 243, 0, 116)
Gui.Visible = false
Gui.Draggable = true
Gui.Active = true

Credits.Name = "Credits"
Credits.Parent = Gui
Credits.BackgroundColor3 = Color3.new(1, 0.333333, 0)
Credits.BorderSizePixel = 0
Credits.Size = UDim2.new(0, 243, 0, 47)
Credits.Font = Enum.Font.Code
Credits.Text = "Player Teleporter"
Credits.TextColor3 = Color3.new(1, 1, 1)
Credits.TextSize = 14

Exit.Name = "Exit"
Exit.Parent = Gui
Exit.BackgroundColor3 = Color3.new(1, 0.333333, 0)
Exit.BorderColor3 = Color3.new(1, 0.333333, 0)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.851851881, 0, 0.0752664357, 0)
Exit.Size = UDim2.new(0, 29, 0, 29)
Exit.Font = Enum.Font.Code
Exit.Text = "X"
Exit.TextColor3 = Color3.new(1, 1, 1)
Exit.TextSize = 14

TP.Name = "TP"
TP.Parent = Gui
TP.BackgroundColor3 = Color3.new(1, 0.333333, 0)
TP.BorderSizePixel = 0
TP.Position = UDim2.new(0, 0, 0.684933007, 0)
TP.Size = UDim2.new(0, 243, 0, 37)
TP.Font = Enum.Font.Code
TP.Text = "Teleport"
TP.TextColor3 = Color3.new(1, 1, 1)
TP.TextSize = 14

TextBox.Parent = Gui
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.411822021, 0)
TextBox.Size = UDim2.new(0, 243, 0, 32)
TextBox.Font = Enum.Font.Code
TextBox.PlaceholderColor3 = Color3.new(1, 0.333333, 0)
TextBox.PlaceholderText = "Player Name"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1, 0.333333, 0)
TextBox.TextSize = 14

Open.Name = "Open"
Open.Parent = TeleportGUI
Open.BackgroundColor3 = Color3.new(1, 0.333333, 0)
Open.BorderColor3 = Color3.new(0, 0, 0)
Open.BorderSizePixel = 5
Open.Position = UDim2.new(0.443811208, 0, 0.956295013, 0)
Open.Size = UDim2.new(0, 85, 0, 23)
Open.Font = Enum.Font.SourceSans
Open.Text = "Open"
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextSize = 14
-- Scripts:
Open.MouseButton1Click:Connect(function()
    Gui.Visible = true
    Open.Visible = false
end)

Exit.MouseButton1Click:Connect(function()
    Open.Visible = true
	Gui.Visible = false
end)

TP.MouseButton1Click:Connect(function()
	local target = game.Players:FindFirstChild(TextBox.Text)
	local player = target.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player
end)
