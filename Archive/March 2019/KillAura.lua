--[[ // METADATA

Last Modified: 3/12/2019 4:48PM
Author: ???

--]]

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local Killaura = Instance.new("ScreenGui")
local heybud = Instance.new("Frame")
local credits = Instance.new("TextLabel")
local status = Instance.new("TextLabel")
local target = Instance.new("TextBox")
local on = Instance.new("TextButton")
local off = Instance.new("TextButton")
local exit = Instance.new("TextButton")
local start = Instance.new("Frame")
local StartScript = Instance.new("TextButton")
local opengui = Instance.new("Frame")
local open = Instance.new("TextButton")
--Properties:
Killaura.Name = "Killaura"
Killaura.Parent = game.CoreGui
Killaura.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

heybud.Name = "heybud"
heybud.Parent = Killaura
heybud.BackgroundColor3 = Color3.new(0, 0, 0)
heybud.Position = UDim2.new(0.911420226, 0, 0.755218148, 0)
heybud.Size = UDim2.new(0, 121, 0, 129)
heybud.Visible = false
heybud.Draggable = true

credits.Name = "credits"
credits.Parent = heybud
credits.BackgroundColor3 = Color3.new(1, 0.333333, 0)
credits.Position = UDim2.new(0, 0, -0.00310559571, 0)
credits.Size = UDim2.new(0, 121, 0, 17)
credits.Font = Enum.Font.SciFi
credits.Text = "Made By MooTheCow111"
credits.TextColor3 = Color3.new(0, 0, 0)
credits.TextSize = 10

status.Name = "status"
status.Parent = heybud
status.BackgroundColor3 = Color3.new(0, 0, 0)
status.Position = UDim2.new(0, 0, 0.126294017, 0)
status.Size = UDim2.new(0, 121, 0, 17)
status.Font = Enum.Font.SciFi
status.Text = "Status: Off"
status.TextColor3 = Color3.new(1, 0, 0)
status.TextSize = 17

target.Name = "target"
target.Parent = heybud
target.BackgroundColor3 = Color3.new(0, 0, 0)
target.BorderColor3 = Color3.new(1, 1, 1)
target.Position = UDim2.new(0, 0, 0.301587313, 0)
target.Size = UDim2.new(0, 121, 0, 19)
target.Font = Enum.Font.SourceSans
target.PlaceholderText = "Player Name"
target.Text = ""
target.TextColor3 = Color3.new(1, 1, 1)
target.TextSize = 14

on.Name = "on"
on.Parent = heybud
on.BackgroundColor3 = Color3.new(0, 0, 0)
on.BorderColor3 = Color3.new(0, 0, 0)
on.Position = UDim2.new(0, 0, 0.515873015, 0)
on.Size = UDim2.new(0, 121, 0, 22)
on.Font = Enum.Font.SourceSans
on.Text = "On"
on.TextColor3 = Color3.new(0.333333, 1, 0)
on.TextSize = 14

off.Name = "off"
off.Parent = heybud
off.BackgroundColor3 = Color3.new(0, 0, 0)
off.Position = UDim2.new(0, 0, 0.690476179, 0)
off.Size = UDim2.new(0, 121, 0, 22)
off.Font = Enum.Font.SourceSans
off.Text = "Off"
off.TextColor3 = Color3.new(1, 0, 0)
off.TextSize = 14

exit.Name = "exit"
exit.Parent = heybud
exit.BackgroundColor3 = Color3.new(0, 0, 0)
exit.BorderColor3 = Color3.new(0, 0, 0)
exit.Position = UDim2.new(0, 0, 0.861019015, 0)
exit.Size = UDim2.new(0, 121, 0, 17)
exit.Font = Enum.Font.SourceSans
exit.Text = "Close"
exit.TextColor3 = Color3.new(1, 1, 1)
exit.TextSize = 14

start.Name = "start"
start.Parent = Killaura
start.BackgroundColor3 = Color3.new(1, 1, 1)
start.Position = UDim2.new(0.949487567, 0, 0, 0)
start.Size = UDim2.new(0, 69, 0, 28)

StartScript.Name = "StartScript"
StartScript.Parent = start
StartScript.BackgroundColor3 = Color3.new(0.666667, 0, 1)
StartScript.Size = UDim2.new(0, 69, 0, 28)
StartScript.Font = Enum.Font.SciFi
StartScript.Text = "Start"
StartScript.TextColor3 = Color3.new(1, 1, 1)
StartScript.TextSize = 14

opengui.Name = "opengui"
opengui.Parent = Killaura
opengui.BackgroundColor3 = Color3.new(1, 1, 1)
opengui.Position = UDim2.new(0.949487567, 0, 0, 0)
opengui.Size = UDim2.new(0, 69, 0, 28)
opengui.Visible = false

open.Name = "open"
open.Parent = opengui
open.BackgroundColor3 = Color3.new(0.666667, 0, 1)
open.Size = UDim2.new(0, 69, 0, 28)
open.Font = Enum.Font.SciFi
open.Text = "Open"
open.TextColor3 = Color3.new(1, 1, 1)
open.TextSize = 14
-- Scripts:
StartScript.MouseButton1Click:connect(function()
	StartScript.Visible = false
	heybud.Visible = true
	while wait() do
	if  status.Text == "Status: On" then
	local target = game.Players:FindFirstChild(target.Text)
	local player = target.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player
end
end
end)

exit.MouseButton1Click:connect(function()
	heybud.Visible = false
	opengui.Visible = true
end)

off.MouseButton1Click:connect(function()
	status.Text = "Status: Off"
	status.TextColor3 = Color3.new(1, 0, 0)
end)

on.MouseButton1Click:connect(function()
	status.Text = "Status: On"
	status.TextColor3 = Color3.new(85, 255, 0)
end)

open.MouseButton1Click:connect(function()
	heybud.Visible = true
	opengui.Visible = false
end)
