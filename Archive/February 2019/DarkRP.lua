--[[ // METADATA

Last Modified: 2/15/2019 9:27AM
Author: ???

--]]


--[[
    GUI made by RRReality#2294/brokenszies
    Scripts made by CharWar
--]]
local main = Instance.new("ScreenGui")
local gui = Instance.new("Frame")
local BOX = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")
local CLOSE = Instance.new("TextButton")
local kill = Instance.new("TextButton")
local printer = Instance.new("TextButton")
local SHIP = Instance.new("TextButton")
local OPEN = Instance.new("TextButton")
local DElETE = Instance.new("TextButton")
--Properties:
main.Name = "main"
main.Parent = game.CoreGui

gui.Name = "gui"
gui.Parent = main
gui.BackgroundColor3 = Color3.new(0, 0.666667, 1)
gui.BackgroundTransparency = 0.30000001192093
gui.BorderColor3 = Color3.new(0, 0.490196, 0.737255)
gui.BorderSizePixel = 4
gui.Position = UDim2.new(0.0161054153, 0, 0.361328125, 0)
gui.Size = UDim2.new(0, 189, 0, 212)

BOX.Name = "BOX"
BOX.Parent = gui
BOX.BackgroundColor3 = Color3.new(0.219608, 0.658824, 0.658824)
BOX.BackgroundTransparency = 0.30000001192093
BOX.BorderColor3 = Color3.new(0.364706, 0.866667, 0.807843)
BOX.BorderSizePixel = 2
BOX.Position = UDim2.new(0.0793650821, 0, 0.688679218, 0)
BOX.Size = UDim2.new(0, 159, 0, 57)
BOX.Font = Enum.Font.SourceSansSemibold
BOX.Text = "Player Username"
BOX.TextColor3 = Color3.new(0, 0, 0)
BOX.TextScaled = true
BOX.TextSize = 14
BOX.TextStrokeColor3 = Color3.new(1, 1, 1)
BOX.TextStrokeTransparency = 0
BOX.TextWrapped = true

TextLabel.Parent = gui
TextLabel.BackgroundColor3 = Color3.new(0.101961, 0.184314, 0.709804)
TextLabel.BorderColor3 = Color3.new(0, 0.490196, 0.737255)
TextLabel.BorderSizePixel = 4
TextLabel.Position = UDim2.new(-0.0317460336, 0, -0.047169812, 0)
TextLabel.Size = UDim2.new(0, 201, 0, 19)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "RRReality's ESDRP GUI"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 16
TextLabel.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel.TextStrokeTransparency = 0
TextLabel.TextWrapped = true

CLOSE.Name = "CLOSE"
CLOSE.Parent = TextLabel
CLOSE.BackgroundColor3 = Color3.new(1, 1, 1)
CLOSE.BackgroundTransparency = 1
CLOSE.Position = UDim2.new(0.895522416, 0, 0, 0)
CLOSE.Size = UDim2.new(0, 20, 0, 19)
CLOSE.Font = Enum.Font.SourceSansBold
CLOSE.Text = "X"
CLOSE.TextColor3 = Color3.new(0.294118, 0.988235, 1)
CLOSE.TextScaled = true
CLOSE.TextSize = 14
CLOSE.TextStrokeTransparency = 0
CLOSE.TextWrapped = true

kill.Name = "kill"
kill.Parent = gui
kill.BackgroundColor3 = Color3.new(0.219608, 0.658824, 0.658824)
kill.BorderColor3 = Color3.new(0.364706, 0.866667, 0.807843)
kill.BorderSizePixel = 2
kill.Position = UDim2.new(0.042328041, 0, 0.495283037, 0)
kill.Size = UDim2.new(0, 173, 0, 31)
kill.Font = Enum.Font.Highway
kill.Text = "Kill (MUST HAVE M1911)"
kill.TextColor3 = Color3.new(0, 0, 0)
kill.TextScaled = true
kill.TextSize = 14
kill.TextStrokeColor3 = Color3.new(1, 1, 1)
kill.TextStrokeTransparency = 0
kill.TextWrapped = true

printer.Name = "printer"
printer.Parent = gui
printer.BackgroundColor3 = Color3.new(0.219608, 0.658824, 0.658824)
printer.BorderColor3 = Color3.new(0.364706, 0.866667, 0.807843)
printer.BorderSizePixel = 2
printer.Position = UDim2.new(0.042328041, 0, 0.301886797, 0)
printer.Size = UDim2.new(0, 173, 0, 31)
printer.Font = Enum.Font.Highway
printer.Text = "PRINTERS STEAL"
printer.TextColor3 = Color3.new(0, 0, 0)
printer.TextScaled = true
printer.TextSize = 14
printer.TextStrokeColor3 = Color3.new(1, 1, 1)
printer.TextStrokeTransparency = 0
printer.TextWrapped = true

SHIP.Name = "SHIP"
SHIP.Parent = gui
SHIP.BackgroundColor3 = Color3.new(0.219608, 0.658824, 0.658824)
SHIP.BorderColor3 = Color3.new(0.364706, 0.866667, 0.807843)
SHIP.BorderSizePixel = 2
SHIP.Position = UDim2.new(0.042328041, 0, 0.113207549, 0)
SHIP.Size = UDim2.new(0, 173, 0, 31)
SHIP.Font = Enum.Font.Highway
SHIP.Text = "SHIPMENT STEAL"
SHIP.TextColor3 = Color3.new(0, 0, 0)
SHIP.TextScaled = true
SHIP.TextSize = 14
SHIP.TextStrokeColor3 = Color3.new(1, 1, 1)
SHIP.TextStrokeTransparency = 0
SHIP.TextWrapped = true

OPEN.Name = "OPEN"
OPEN.Parent = main
OPEN.BackgroundColor3 = Color3.new(0, 0.666667, 1)
OPEN.BackgroundTransparency = 0.30000001192093
OPEN.BorderSizePixel = 2
OPEN.Position = UDim2.new(0, 0,1.861, 0)
OPEN.Size = UDim2.new(0, 82, 0, 19)
OPEN.Font = Enum.Font.SourceSansSemibold
OPEN.Text = "OPEN"
OPEN.TextColor3 = Color3.new(0, 0, 0)
OPEN.TextScaled = true
OPEN.TextSize = 14
OPEN.TextStrokeColor3 = Color3.new(1, 1, 1)
OPEN.TextStrokeTransparency = 0
OPEN.TextWrapped = true

DElETE.Name = "DElETE"
DElETE.Parent = OPEN
DElETE.BackgroundColor3 = Color3.new(0, 0.666667, 1)
DElETE.BackgroundTransparency = 0.30000001192093
DElETE.BorderSizePixel = 2
DElETE.Position = UDim2.new(0, 0, 1, 0)
DElETE.Size = UDim2.new(0, 82, 0, 9)
DElETE.Font = Enum.Font.SourceSansSemibold
DElETE.Text = "DEL GUI"
DElETE.TextColor3 = Color3.new(0, 0, 0)
DElETE.TextScaled = true
DElETE.TextSize = 14
DElETE.TextStrokeColor3 = Color3.new(1, 1, 1)
DElETE.TextStrokeTransparency = 0
DElETE.TextWrapped = true
-- Scripts:
function printa()
   local a = game.Workspace.MoneyPrinters:GetChildren()
for i=1,#a do
if a[i]:FindFirstChild("Int2") then else
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a[i].Main.CFrame
wait(1)
game.ReplicatedStorage.Events.ToolsEvent:FireServer(9)
wait(0.25)
game.ReplicatedStorage.Events.ToolsEvent:FireServer(1, a[i])
wait(1)
game.ReplicatedStorage.Events.PickUpEvent:FireServer(a[i])
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings[game.Players.LocalPlayer.Name].Node.PrimaryPart.CFrame + Vector3.new(0,10,0)
wait(1)
game.ReplicatedStorage.Events.PickUpEvent:FireServer(a[i])
end
end
end
function shipument()
   local a = game.Workspace.Entities:GetChildren()
for i=1,#a do
if a[i]:FindFirstChild("Int2") then else
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a[i].PrimaryPart.CFrame
wait(1)
game.ReplicatedStorage.Events.ToolsEvent:FireServer(9)
wait(0.25)
game.ReplicatedStorage.Events.ToolsEvent:FireServer(1, a[i])
wait(1)
game.ReplicatedStorage.Events.PickUpEvent:FireServer(a[i])
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings[game.Players.LocalPlayer.Name].Node.PrimaryPart.CFrame + Vector3.new(0,10,0)
wait(1)
game.ReplicatedStorage.Events.PickUpEvent:FireServer(a[i])
end
end
end
function killua()
   local YourWeapon = "M1911"
local Victim = BOX.Text

for i=1,25 do
local A_1 = game.Players[Victim].Character.Head.CFrame
local A_2 = 2
local A_3 = game.Workspace[Victim].Humanoid
local A_4 = 24
local A_5 = game.Players.LocalPlayer.Backpack[YourWeapon]
local Event = game:GetService("ReplicatedStorage").Events.ProjHitEvent
Event:FireServer(A_1, A_2, A_3, A_4, A_5)
end
end
function openn()
   SHIP.Visible=true
   printer.Visible=true
   BOX.Visible=true
   kill.Visible=true
   TextLabel.Visible=true
   gui.Visible=true
   OPEN:TweenPosition(UDim2.new(0, 0,1.861, 0))
   gui:TweenSize(UDim2.new(0, 189,0, 212))
   SHIP:TweenSize(UDim2.new(0, 173,0, 31))
   printer:TweenSize(UDim2.new(0, 173,0, 31))
   kill:TweenSize(UDim2.new(0, 173,0, 31)) -- 0, 173,0, 31
   BOX:TweenSize(UDim2.new(0, 159,0, 57))
   TextLabel:TweenSize(UDim2.new(0, 201,0, 19))
   CLOSE:TweenSize(UDim2.new(0, 20,0, 19))
end
function closen()
   OPEN:TweenPosition(UDim2.new(0,0,0.861, 0))
   gui:TweenSize(UDim2.new(0,0,0))
   SHIP:TweenSize(UDim2.new(0,0,0))
   printer:TweenSize(UDim2.new(0,0,0))
   kill:TweenSize(UDim2.new(0,0,0)) -- 0, 173,0, 31
   BOX:TweenSize(UDim2.new(0,0,0))
   TextLabel:TweenSize(UDim2.new(0,0,0))
   CLOSE:TweenSize(UDim2.new(0,0,0))
wait(1)
   SHIP.Visible=false
   printer.Visible=false
   BOX.Visible=false
   kill.Visible=false
   TextLabel.Visible=false
   gui.Visible=false
end
function delgui()
   DElETE:TweenSize(UDim2.new(0,0,0))
   OPEN:TweenSize(UDim2.new(0,0,0))
   wait(1)
   game.CoreGui.main:Remove()
   print("Succesfully deleted!")
end
kill.MouseButton1Click:connect(killua)
printer.MouseButton1Click:connect(printa)
SHIP.MouseButton1Click:connect(shipument)
CLOSE.MouseButton1Click:connect(closen)
OPEN.MouseButton1Click:connect(openn)
DElETE.MouseButton1Click:connect(delgui)
-- the end v0.1
