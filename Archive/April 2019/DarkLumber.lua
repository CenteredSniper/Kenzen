--[[ // METADATA

Last Modified: 4/5/2019 3:54PM
Author: ???

--]]

-- By Sky Hacks
-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local OpenFr = Instance.new("Frame")
local Open = Instance.new("TextButton")
local Main = Instance.new("Frame")
local MainTopic = Instance.new("TextLabel")
local PlayerButt = Instance.new("TextButton")
local TeleportButt = Instance.new("TextButton")
local UpdatButt = Instance.new("TextButton")
local CreditsButt = Instance.new("TextButton")
local ExitMain = Instance.new("TextButton")
local MinMain = Instance.new("TextButton")
local Teleports = Instance.new("Frame")
local TlprtTopic = Instance.new("TextLabel")
local ExitTeleports = Instance.new("TextButton")
local BoxedCars = Instance.new("TextButton")
local Swamp = Instance.new("TextButton")
local Volcano = Instance.new("TextButton")
local Spawn = Instance.new("TextButton")
local Cave = Instance.new("TextButton")
local LinkLogic = Instance.new("TextButton")
local SkiLodge = Instance.new("TextButton")
local Palm = Instance.new("TextButton")
local StrangeMan = Instance.new("TextButton")
local _2page = Instance.new("TextButton")
local Player = Instance.new("Frame")
local PlrTopic = Instance.new("TextLabel")
local ExitPlayer = Instance.new("TextButton")
local Fly = Instance.new("TextButton")
local GoldAxe = Instance.new("TextButton")
local Noclip = Instance.new("TextButton")
local Paint = Instance.new("TextButton")
local Speed = Instance.new("TextButton")
local Water = Instance.new("TextButton")
local Move = Instance.new("TextButton")
local TpTool = Instance.new("TextButton")
local Goto = Instance.new("TextButton")
local Wires = Instance.new("TextButton")
local Copy = Instance.new("TextButton")
local MaxLand = Instance.new("TextButton")
local Delete = Instance.new("TextButton")
local TeleportBox = Instance.new("TextBox")
local Dupe = Instance.new("TextButton")
local Money = Instance.new("TextButton")
local Updates = Instance.new("Frame")
local UpdatTopics = Instance.new("TextLabel")
local Updt = Instance.new("TextLabel")
local ExitUpdates = Instance.new("TextButton")
local Credits = Instance.new("Frame")
local CrdTop = Instance.new("TextLabel")
local Roblox = Instance.new("TextLabel")
local Youtube = Instance.new("TextLabel")
local ExitCredits = Instance.new("TextButton")
local Teleports2 = Instance.new("Frame")
local Tlprt2Topic = Instance.new("TextLabel")
local WoodRUS = Instance.new("TextButton")
local Endtimes = Instance.new("TextButton")
local BobShack = Instance.new("TextButton")
local TpPlpt = Instance.new("TextButton")
local _1page = Instance.new("TextButton")
--Properties:
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OpenFr.Name = "OpenFr"
OpenFr.Parent = ScreenGui
OpenFr.BackgroundColor3 = Color3.new(1, 1, 1)
OpenFr.BackgroundTransparency = 1
OpenFr.Position = UDim2.new(0.00901713222, 0, 0.468127489, 0)
OpenFr.Size = UDim2.new(0, 100, 0, 31)
OpenFr.Visible = true

Open.Name = "Open"
Open.Parent = OpenFr
Open.BackgroundColor3 = Color3.new(0, 0, 1)
Open.BorderSizePixel = 3
Open.Size = UDim2.new(0, 100, 0, 31)
Open.Font = Enum.Font.SciFi
Open.Text = "Open"
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextSize = 23
Open.TextStrokeTransparency = 0
Open.TextWrapped = true
Open.MouseButton1Down:connect(function()
	OpenFr.Visible = false
	Main.Visible = true
end)

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.new(0, 0, 1)
Main.Position = UDim2.new(0.415689796, 0, 0.229083672, 0)
Main.Size = UDim2.new(0, 187, 0, 272)
Main.Active = true
Main.Visible = false
Main.Draggable = true

MainTopic.Name = "MainTopic"
MainTopic.Parent = Main
MainTopic.BackgroundColor3 = Color3.new(0, 0, 0)
MainTopic.BorderSizePixel = 0
MainTopic.Size = UDim2.new(0, 187, 0, 33)
MainTopic.Font = Enum.Font.SciFi
MainTopic.Text = "LumberDark"
MainTopic.TextColor3 = Color3.new(1, 1, 1)
MainTopic.TextSize = 25
MainTopic.TextWrapped = true

PlayerButt.Name = "PlayerButt"
PlayerButt.Parent = Main
PlayerButt.BackgroundColor3 = Color3.new(0, 0, 0)
PlayerButt.BorderColor3 = Color3.new(1, 1, 1)
PlayerButt.Position = UDim2.new(0.0320855603, 0, 0.202205881, 0)
PlayerButt.Size = UDim2.new(0, 175, 0, 41)
PlayerButt.Font = Enum.Font.SciFi
PlayerButt.Text = "Player"
PlayerButt.TextColor3 = Color3.new(1, 1, 1)
PlayerButt.TextSize = 22
PlayerButt.TextWrapped = true
PlayerButt.MouseButton1Down:connect(function()
	Main.Visible = false
	Player.Visible = true
end)

TeleportButt.Name = "TeleportButt"
TeleportButt.Parent = Main
TeleportButt.BackgroundColor3 = Color3.new(0, 0, 0)
TeleportButt.BorderColor3 = Color3.new(1, 1, 1)
TeleportButt.Position = UDim2.new(0.0320855603, 0, 0.397058845, 0)
TeleportButt.Size = UDim2.new(0, 175, 0, 41)
TeleportButt.Font = Enum.Font.SciFi
TeleportButt.Text = "Teleports"
TeleportButt.TextColor3 = Color3.new(1, 1, 1)
TeleportButt.TextSize = 22
TeleportButt.TextWrapped = true
TeleportButt.MouseButton1Down:connect(function()
	Teleports.Visible = true
	Main.Visible = false
end)

UpdatButt.Name = "UpdatButt"
UpdatButt.Parent = Main
UpdatButt.BackgroundColor3 = Color3.new(0, 0, 0)
UpdatButt.BorderColor3 = Color3.new(1, 1, 1)
UpdatButt.Position = UDim2.new(0.0320855603, 0, 0.591911793, 0)
UpdatButt.Size = UDim2.new(0, 175, 0, 41)
UpdatButt.Font = Enum.Font.SciFi
UpdatButt.Text = "Updates"
UpdatButt.TextColor3 = Color3.new(1, 1, 1)
UpdatButt.TextSize = 22
UpdatButt.TextWrapped = true
UpdatButt.MouseButton1Down:connect(function()
	Main.Visible = false
	Updates.Visible = true
end)

CreditsButt.Name = "CreditsButt"
CreditsButt.Parent = Main
CreditsButt.BackgroundColor3 = Color3.new(0, 0, 0)
CreditsButt.BorderColor3 = Color3.new(1, 1, 1)
CreditsButt.Position = UDim2.new(0.0320855603, 0, 0.786764741, 0)
CreditsButt.Size = UDim2.new(0, 175, 0, 41)
CreditsButt.Font = Enum.Font.SciFi
CreditsButt.Text = "Credits/lnfo"
CreditsButt.TextColor3 = Color3.new(1, 1, 1)
CreditsButt.TextSize = 22
CreditsButt.TextWrapped = true
CreditsButt.MouseButton1Down:connect(function()
	Main.Visible = false
	Credits.Visible = true
end)

ExitMain.Name = "ExitMain"
ExitMain.Parent = Main
ExitMain.BackgroundColor3 = Color3.new(0, 0, 0)
ExitMain.BorderSizePixel = 0
ExitMain.Position = UDim2.new(0.919786096, 0, 0.0220588241, 0)
ExitMain.Size = UDim2.new(0, 13, 0, 7)
ExitMain.Font = Enum.Font.SciFi
ExitMain.Text = "X"
ExitMain.TextColor3 = Color3.new(1, 0, 0)
ExitMain.TextSize = 14
ExitMain.MouseButton1Down:connect(function()
	Main.Visible = false
	OpenFr.Visible = false
end)

MinMain.Name = "MinMain"
MinMain.Parent = Main
MinMain.BackgroundColor3 = Color3.new(0, 0, 0)
MinMain.BorderSizePixel = 0
MinMain.Position = UDim2.new(0.919786096, 0, 0.0845588222, 0)
MinMain.Size = UDim2.new(0, 15, 0, 3)
MinMain.Font = Enum.Font.SciFi
MinMain.Text = "-"
MinMain.TextColor3 = Color3.new(1, 1, 1)
MinMain.TextSize = 14
MinMain.MouseButton1Down:connect(function()
Main.Visible = false
OpenFr.Visible = true
end)

Teleports.Name = "Teleports"
Teleports.Parent = ScreenGui
Teleports.BackgroundColor3 = Color3.new(0, 0, 1)
Teleports.Position = UDim2.new(0.415689796, 0, 0.229083672, 0)
Teleports.Size = UDim2.new(0, 187, 0, 272)
Teleports.Active = true
Teleports.Visible = false
Teleports.Draggable = true

TlprtTopic.Name = "TlprtTopic"
TlprtTopic.Parent = Teleports
TlprtTopic.BackgroundColor3 = Color3.new(0, 0, 0)
TlprtTopic.BorderSizePixel = 0
TlprtTopic.Size = UDim2.new(0, 187, 0, 33)
TlprtTopic.Font = Enum.Font.SciFi
TlprtTopic.Text = "Teleports"
TlprtTopic.TextColor3 = Color3.new(1, 1, 1)
TlprtTopic.TextSize = 25
TlprtTopic.TextWrapped = true

ExitTeleports.Name = "ExitTeleports"
ExitTeleports.Parent = Teleports
ExitTeleports.BackgroundColor3 = Color3.new(0, 0, 0)
ExitTeleports.BorderSizePixel = 0
ExitTeleports.Position = UDim2.new(0.882352948, 0, 0.0220588241, 0)
ExitTeleports.Size = UDim2.new(0, 22, 0, 19)
ExitTeleports.Font = Enum.Font.SciFi
ExitTeleports.Text = "X"
ExitTeleports.TextColor3 = Color3.new(1, 0, 0)
ExitTeleports.TextSize = 14
ExitTeleports.MouseButton1Down:connect(function()
	Main.Visible = true
	Teleports.Visible = false
end)

BoxedCars.Name = "BoxedCars"
BoxedCars.Parent = Teleports
BoxedCars.BackgroundColor3 = Color3.new(0, 0, 0)
BoxedCars.BorderColor3 = Color3.new(1, 1, 1)
BoxedCars.Position = UDim2.new(0.0481283441, 0, 0.150735289, 0)
BoxedCars.Size = UDim2.new(0, 172, 0, 16)
BoxedCars.Font = Enum.Font.SciFi
BoxedCars.Text = "BoxedCars"
BoxedCars.TextColor3 = Color3.new(1, 1, 1)
BoxedCars.TextSize = 22
BoxedCars.TextWrapped = true
BoxedCars.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(509, 3, -1463))
end)

Swamp.Name = "Swamp"
Swamp.Parent = Teleports
Swamp.BackgroundColor3 = Color3.new(0, 0, 0)
Swamp.BorderColor3 = Color3.new(1, 1, 1)
Swamp.Position = UDim2.new(0.0481283441, 0, 0.231617659, 0)
Swamp.Size = UDim2.new(0, 172, 0, 16)
Swamp.Font = Enum.Font.SciFi
Swamp.Text = "Swamp"
Swamp.TextColor3 = Color3.new(1, 1, 1)
Swamp.TextSize = 22
Swamp.TextWrapped = true
Swamp.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1209,132,-801))
end)

Volcano.Name = "Volcano"
Volcano.Parent = Teleports
Volcano.BackgroundColor3 = Color3.new(0, 0, 0)
Volcano.BorderColor3 = Color3.new(1, 1, 1)
Volcano.Position = UDim2.new(0.0481283441, 0, 0.316176474, 0)
Volcano.Size = UDim2.new(0, 172, 0, 16)
Volcano.Font = Enum.Font.SciFi
Volcano.Text = "Volcano"
Volcano.TextColor3 = Color3.new(1, 1, 1)
Volcano.TextSize = 22
Volcano.TextWrapped = true
Volcano.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1585,622,1140))
end)

Spawn.Name = "Spawn"
Spawn.Parent = Teleports
Spawn.BackgroundColor3 = Color3.new(0, 0, 0)
Spawn.BorderColor3 = Color3.new(1, 1, 1)
Spawn.Position = UDim2.new(0.0481283441, 0, 0.400735289, 0)
Spawn.Size = UDim2.new(0, 172, 0, 16)
Spawn.Font = Enum.Font.SciFi
Spawn.Text = "Spawn"
Spawn.TextColor3 = Color3.new(1, 1, 1)
Spawn.TextSize = 22
Spawn.TextWrapped = true
Spawn.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(155,3,74))
end)

Cave.Name = "Cave"
Cave.Parent = Teleports
Cave.BackgroundColor3 = Color3.new(0, 0, 0)
Cave.BorderColor3 = Color3.new(1, 1, 1)
Cave.Position = UDim2.new(0.0481283404, 0, 0.485294104, 0)
Cave.Size = UDim2.new(0, 172, 0, 16)
Cave.Font = Enum.Font.SciFi
Cave.Text = "Cave"
Cave.TextColor3 = Color3.new(1, 1, 1)
Cave.TextSize = 22
Cave.TextWrapped = true
Cave.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(3581,-179,500))
end)

LinkLogic.Name = "LinkLogic"
LinkLogic.Parent = Teleports
LinkLogic.BackgroundColor3 = Color3.new(0, 0, 0)
LinkLogic.BorderColor3 = Color3.new(1, 1, 1)
LinkLogic.Position = UDim2.new(0.0481283404, 0, 0.569852948, 0)
LinkLogic.Size = UDim2.new(0, 172, 0, 16)
LinkLogic.Font = Enum.Font.SciFi
LinkLogic.Text = "LinksLogic"
LinkLogic.TextColor3 = Color3.new(1, 1, 1)
LinkLogic.TextSize = 22
LinkLogic.TextWrapped = true
LinkLogic.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(4607,7.5,-798))
end)

SkiLodge.Name = "SkiLodge"
SkiLodge.Parent = Teleports
SkiLodge.BackgroundColor3 = Color3.new(0, 0, 0)
SkiLodge.BorderColor3 = Color3.new(1, 1, 1)
SkiLodge.Position = UDim2.new(0.0481283404, 0, 0.658088267, 0)
SkiLodge.Size = UDim2.new(0, 172, 0, 16)
SkiLodge.Font = Enum.Font.SciFi
SkiLodge.Text = "SkiLodge"
SkiLodge.TextColor3 = Color3.new(1, 1, 1)
SkiLodge.TextSize = 22
SkiLodge.TextWrapped = true
SkiLodge.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1244, 62, 2306))
end)

Palm.Name = "Palm"
Palm.Parent = Teleports
Palm.BackgroundColor3 = Color3.new(0, 0, 0)
Palm.BorderColor3 = Color3.new(1, 1, 1)
Palm.Position = UDim2.new(0.0481283404, 0, 0.746323586, 0)
Palm.Size = UDim2.new(0, 172, 0, 16)
Palm.Font = Enum.Font.SciFi
Palm.Text = "Palm"
Palm.TextColor3 = Color3.new(1, 1, 1)
Palm.TextSize = 22
Palm.TextWrapped = true
Palm.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(2549, -5, -42))
end)

StrangeMan.Name = "StrangeMan"
StrangeMan.Parent = Teleports
StrangeMan.BackgroundColor3 = Color3.new(0, 0, 0)
StrangeMan.BorderColor3 = Color3.new(1, 1, 1)
StrangeMan.Position = UDim2.new(0.0481283404, 0, 0.834558904, 0)
StrangeMan.Size = UDim2.new(0, 172, 0, 16)
StrangeMan.Font = Enum.Font.SciFi
StrangeMan.Text = "StrangeMan"
StrangeMan.TextColor3 = Color3.new(1, 1, 1)
StrangeMan.TextSize = 22
StrangeMan.TextWrapped = true
StrangeMan.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1061, 16, 1131))
end)

_2page.Name = "2.page"
_2page.Parent = Teleports
_2page.BackgroundColor3 = Color3.new(0, 0, 1)
_2page.BorderSizePixel = 3
_2page.Position = UDim2.new(0.352941185, 0, 0.933823526, 0)
_2page.Size = UDim2.new(0, 46, 0, 12)
_2page.Font = Enum.Font.SciFi
_2page.Text = "2"
_2page.TextColor3 = Color3.new(1, 1, 1)
_2page.TextSize = 14
_2page.MouseButton1Down:connect(function()
	Teleports.Visible = false
	Teleports2.Visible = true
end)

Player.Name = "Player"
Player.Parent = ScreenGui
Player.BackgroundColor3 = Color3.new(0, 0, 1)
Player.Position = UDim2.new(0.416573197, 0, 0.229083672, 0)
Player.Size = UDim2.new(0, 187, 0, 272)
Player.Active = true
Player.Visible = false
Player.Draggable = true

PlrTopic.Name = "PlrTopic"
PlrTopic.Parent = Player
PlrTopic.BackgroundColor3 = Color3.new(0, 0, 0)
PlrTopic.BorderSizePixel = 0
PlrTopic.Size = UDim2.new(0, 187, 0, 33)
PlrTopic.Font = Enum.Font.SciFi
PlrTopic.Text = "Player"
PlrTopic.TextColor3 = Color3.new(1, 1, 1)
PlrTopic.TextSize = 25
PlrTopic.TextWrapped = true

ExitPlayer.Name = "ExitPlayer"
ExitPlayer.Parent = Player
ExitPlayer.BackgroundColor3 = Color3.new(0, 0, 0)
ExitPlayer.BorderSizePixel = 0
ExitPlayer.Position = UDim2.new(0.882352948, 0, 0.0220588241, 0)
ExitPlayer.Size = UDim2.new(0, 22, 0, 19)
ExitPlayer.Font = Enum.Font.SciFi
ExitPlayer.Text = "X"
ExitPlayer.TextColor3 = Color3.new(1, 0, 0)
ExitPlayer.TextSize = 14
ExitPlayer.MouseButton1Down:connect(function()
	Player.Visible = false
	Main.Visible = true
end)

Fly.Name = "Fly"
Fly.Parent = Player
Fly.BackgroundColor3 = Color3.new(0, 0, 0)
Fly.BorderColor3 = Color3.new(1, 1, 1)
Fly.Position = UDim2.new(0.0427807495, 0, 0.14705883, 0)
Fly.Size = UDim2.new(0, 82, 0, 20)
Fly.Font = Enum.Font.SciFi
Fly.Text = "Soon"
Fly.TextColor3 = Color3.new(1, 1, 1)
Fly.TextSize = 22
Fly.TextWrapped = true
Fly.MouseButton1Down:connect(function()
	
end)

GoldAxe.Name = "GoldAxe"
GoldAxe.Parent = Player
GoldAxe.BackgroundColor3 = Color3.new(0, 0, 0)
GoldAxe.BorderColor3 = Color3.new(1, 1, 1)
GoldAxe.Position = UDim2.new(0.518716574, 0, 0.14705883, 0)
GoldAxe.Size = UDim2.new(0, 82, 0, 20)
GoldAxe.Font = Enum.Font.SciFi
GoldAxe.Text = "Soon"
GoldAxe.TextColor3 = Color3.new(1, 1, 1)
GoldAxe.TextSize = 22
GoldAxe.TextWrapped = true
GoldAxe.MouseButton1Down:connect(function()
	
end)

Noclip.Name = "Noclip"
Noclip.Parent = Player
Noclip.BackgroundColor3 = Color3.new(0, 0, 0)
Noclip.BorderColor3 = Color3.new(1, 1, 1)
Noclip.Position = UDim2.new(0.0427807495, 0, 0.26838237, 0)
Noclip.Size = UDim2.new(0, 82, 0, 20)
Noclip.Font = Enum.Font.SciFi
Noclip.Text = "Soon"
Noclip.TextColor3 = Color3.new(1, 1, 1)
Noclip.TextSize = 22
Noclip.TextWrapped = true
Noclip.MouseButton1Down:connect(function()
	
end)

Paint.Name = "Paint"
Paint.Parent = Player
Paint.BackgroundColor3 = Color3.new(0, 0, 0)
Paint.BorderColor3 = Color3.new(1, 1, 1)
Paint.Position = UDim2.new(0.518716574, 0, 0.26838237, 0)
Paint.Size = UDim2.new(0, 82, 0, 20)
Paint.Font = Enum.Font.SciFi
Paint.Text = "EspV2"
Paint.TextColor3 = Color3.new(1, 1, 1)
Paint.TextSize = 22
Paint.TextWrapped = true
Paint.MouseButton1Down:connect(function()
	local gui = Instance.new("BillboardGui");
gui.Name = "";
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
local frame = Instance.new("Frame", gui);
frame.BackgroundColor3 = Color3.fromRGB(170, 0, 0);
frame.Size = UDim2.new(1, 0, 1, 0);
frame.BorderSizePixel = 4;
frame.BorderColor3 = Color3.fromRGB(0, 0, 0);
local gi = gui:Clone();
local body = frame:Clone();
body.Parent = gi;
body.BackgroundColor3 = Color3.fromRGB(0, 170, 170);

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name and v.Character and v.Character:FindFirstChild("Head") then
        gui:Clone().Parent = v.Character.Head;
    end
end
end)

Speed.Name = "Speed"
Speed.Parent = Player
Speed.BackgroundColor3 = Color3.new(0, 0, 0)
Speed.BorderColor3 = Color3.new(1, 1, 1)
Speed.Position = UDim2.new(0.0427807495, 0, 0.39338237, 0)
Speed.Size = UDim2.new(0, 82, 0, 20)
Speed.Font = Enum.Font.SciFi
Speed.Text = "	Speed[T]"
Speed.TextColor3 = Color3.new(1, 1, 1)
Speed.TextSize = 14
Speed.TextWrapped = true
Speed.MouseButton1Down:connect(function()
	  local walkspeedplayer = game:GetService("Players").LocalPlayer
    local walkspeedmouse = walkspeedplayer:GetMouse()
    
    local walkspeedenabled = false
    
    function x_walkspeed(key)
        if (key == "t") then
            if walkspeedenabled == false then
                _G.WS = 200;
                local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
                Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                Humanoid.WalkSpeed = _G.WS;
                end)
                Humanoid.WalkSpeed = _G.WS;
                
                walkspeedenabled = true
            elseif walkspeedenabled == true then
                _G.WS = 20;
                local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
                Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                Humanoid.WalkSpeed = _G.WS;
                end)
                Humanoid.WalkSpeed = _G.WS;
                
                walkspeedenabled = false
            end
        end
    end
    
    walkspeedmouse.KeyDown:connect(x_walkspeed)
end)

Water.Name = "Water"
Water.Parent = Player
Water.BackgroundColor3 = Color3.new(0, 0, 0)
Water.BorderColor3 = Color3.new(1, 1, 1)
Water.Position = UDim2.new(0.0427807495, 0, 0.514705896, 0)
Water.Size = UDim2.new(0, 82, 0, 20)
Water.Font = Enum.Font.SciFi
Water.Text = "WaterW"
Water.TextColor3 = Color3.new(1, 1, 1)
Water.TextSize = 22
Water.TextWrapped = true
Water.MouseButton1Down:connect(function()
	if WCollide == "Nothing" then
		WCollide = "On"
		Water.BackgroundColor3 = Color3.new(0, 0.5, 0)
        Water.Text = "Water is Solid"
		for i,v in pairs(game.Workspace.Water:GetChildren()) do
			if v:IsA("Part") then
				v.CanCollide = true
			end
		end
	else
		WCollide = "Nothing"
		Water.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        Water.Text = "Walk on Water"
		for i,v in pairs(game.Workspace.Water:GetChildren()) do
			if v:IsA("Part") then
				v.CanCollide = false
			end
		end
	end
end)

Move.Name = "Move"
Move.Parent = Player
Move.BackgroundColor3 = Color3.new(0, 0, 0)
Move.BorderColor3 = Color3.new(1, 1, 1)
Move.Position = UDim2.new(0.0427807495, 0, 0.632352948, 0)
Move.Size = UDim2.new(0, 82, 0, 20)
Move.Font = Enum.Font.SciFi
Move.Text = "InfJump"
Move.TextColor3 = Color3.new(1, 1, 1)
Move.TextSize = 22
Move.TextWrapped = true
Move.MouseButton1Down:connect(function()
		    game:GetService("UserInputService").JumpRequest:connect(function()
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")       
    end)
end)

TpTool.Name = "TpTool"
TpTool.Parent = Player
TpTool.BackgroundColor3 = Color3.new(0, 0, 0)
TpTool.BorderColor3 = Color3.new(1, 1, 1)
TpTool.Position = UDim2.new(0.0427807495, 0, 0.753676474, 0)
TpTool.Size = UDim2.new(0, 82, 0, 20)
TpTool.Font = Enum.Font.SciFi
TpTool.Text = "TpTool"
TpTool.TextColor3 = Color3.new(1, 1, 1)
TpTool.TextSize = 22
TpTool.TextWrapped = true
TpTool.MouseButton1Down:connect(function()
	
	local Tele = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
	Tele.RequiresHandle = false
	Tele.RobloxLocked = true
	Tele.Name = "TPTool"
	Tele.ToolTip = "Teleport Tool"
	Tele.Equipped:connect(function(Mouse)
		Mouse.Button1Down:connect(function()
			if Mouse.Target then
				game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.CFrame = (CFrame.new(Mouse.Hit.x, Mouse.Hit.y + 5, Mouse.Hit.z))
			end
		end)
	end)
end)

Goto.Name = "Goto"
Goto.Parent = Player
Goto.BackgroundColor3 = Color3.new(0, 0, 0)
Goto.BorderColor3 = Color3.new(1, 1, 1)
Goto.BorderSizePixel = 0
Goto.Position = UDim2.new(0.679144382, 0, 0.952205896, 0)
Goto.Size = UDim2.new(0, 52, 0, 13)
Goto.Font = Enum.Font.SciFi
Goto.Text = "GotoPlr"
Goto.TextColor3 = Color3.new(1, 1, 1)
Goto.TextSize = 15
Goto.TextWrapped = true
Goto.MouseButton1Down:connect(function()
	 local target = game.Players:FindFirstChild(PN.Text)
    local yes = target.Character.HumanoidRootPart.CFrame
   
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    print("You just tp'd to "..TeleportBox.Text.." yesyes")
end)

Wires.Name = "Wires"
Wires.Parent = Player
Wires.BackgroundColor3 = Color3.new(0, 0, 0)
Wires.BorderColor3 = Color3.new(1, 1, 1)
Wires.Position = UDim2.new(0.518716574, 0, 0.39338237, 0)
Wires.Size = UDim2.new(0, 82, 0, 20)
Wires.Font = Enum.Font.SciFi
Wires.Text = "InfWires"
Wires.TextColor3 = Color3.new(1, 1, 1)
Wires.TextSize = 22
Wires.TextWrapped = true
Wires.MouseButton1Down:connect(function()
	for i,v in next,game.ReplicatedStorage.Purchasables.WireObjects:GetChildren() do
  if v:FindFirstChild("Type") then
      if v.Type.Value == "Wire" then
          v.Type.Parent.OtherInfo.MaxLength.Value = math.huge
      end
  end
end
end)

Copy.Name = "Copy"
Copy.Parent = Player
Copy.BackgroundColor3 = Color3.new(0, 0, 0)
Copy.BorderColor3 = Color3.new(1, 1, 1)
Copy.Position = UDim2.new(0.518716574, 0, 0.514705896, 0)
Copy.Size = UDim2.new(0, 82, 0, 20)
Copy.Font = Enum.Font.SciFi
Copy.Text = "BTools"
Copy.TextColor3 = Color3.new(1, 1, 1)
Copy.TextSize = 15
Copy.TextWrapped = true
Copy.MouseButton1Down:connect(function()
	Copy.Text = "WaitUpdate1" 
        
end)

MaxLand.Name = "MaxLand"
MaxLand.Parent = Player
MaxLand.BackgroundColor3 = Color3.new(0, 0, 0)
MaxLand.BorderColor3 = Color3.new(1, 1, 1)
MaxLand.Position = UDim2.new(0.518716574, 0, 0.753676474, 0)
MaxLand.Size = UDim2.new(0, 82, 0, 20)
MaxLand.Font = Enum.Font.SciFi
MaxLand.Text = "MaxLand"
MaxLand.TextColor3 = Color3.new(1, 1, 1)
MaxLand.TextSize = 22
MaxLand.TextWrapped = true
MaxLand.MouseButton1Down:connect(function()
	for i, v in pairs(game:GetService("Workspace").Properties:GetChildren()) do
		if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
			base = v
			square = v.OriginSquare
			end
		end
	function makebase(pos)
		local Event = game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty
		Event:FireServer(base, pos)
		end
	spos = square.Position
	makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z))
	makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z))
	makebase(CFrame.new(spos.X, spos.Y, spos.Z + 40))
	makebase(CFrame.new(spos.X, spos.Y, spos.Z - 40))
	makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z + 40))
	makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z - 40))
	makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z + 40))
	makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z - 40))
	makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z))
	makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z))
	makebase(CFrame.new(spos.X, spos.Y, spos.Z + 80))
	makebase(CFrame.new(spos.X, spos.Y, spos.Z - 80))
--Corners--
	makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z + 80))
	makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z - 80))
	makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z + 80))
	makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z - 80))
--Corners--
	makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z + 80))
	makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z + 80))
	makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z + 40))
	makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z - 40))
	makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z + 40))
	makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z - 40))
	makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z - 80))
	makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z - 80))
end)

Delete.Name = "Delete"
Delete.Parent = Player
Delete.BackgroundColor3 = Color3.new(0, 0, 0)
Delete.BorderColor3 = Color3.new(1, 1, 1)
Delete.Position = UDim2.new(0.518716574, 0, 0.632352948, 0)
Delete.Size = UDim2.new(0, 82, 0, 20)
Delete.Font = Enum.Font.SciFi
Delete.Text = "Soon"
Delete.TextColor3 = Color3.new(1, 1, 1)
Delete.TextSize = 22
Delete.TextWrapped = true
Delete.MouseButton1Down:connect(function()
	
end)

TeleportBox.Name = "TeleportBox"
TeleportBox.Parent = Player
TeleportBox.BackgroundColor3 = Color3.new(1, 1, 1)
TeleportBox.Position = UDim2.new(0.684491992, 0, 0.860294163, 0)
TeleportBox.Size = UDim2.new(0, 51, 0, 18)
TeleportBox.Font = Enum.Font.SourceSans
TeleportBox.Text = ""
TeleportBox.TextColor3 = Color3.new(0, 0, 0)
TeleportBox.TextSize = 14

Dupe.Name = "Dupe"
Dupe.Parent = Player
Dupe.BackgroundColor3 = Color3.new(0, 0, 0.498039)
Dupe.BorderColor3 = Color3.new(1, 1, 1)
Dupe.Position = UDim2.new(0.0427807495, 0, 0.860294104, 0)
Dupe.Size = UDim2.new(0, 106, 0, 18)
Dupe.Font = Enum.Font.SciFi
Dupe.Text = "ItemDupe"
Dupe.TextColor3 = Color3.new(1, 1, 1)
Dupe.TextSize = 22
Dupe.TextWrapped = true
Dupe.MouseButton1Down:connect(function()
	plr = game:GetService("Players").LocalPlayer
slot = plr.CurrentSaveSlot
if Option == false then
if slot.Value == -1 then
Option = true
slot.RobloxLocked = true
Dupe.BackgroundColor3 = Color3.new(0, 1, 0)
PlrTopic.Text = "Save Not save"
end
else
Option = false
slot.RobloxLocked = false
Dupe.BackgroundColor3 = Color3.new(0.7, 0, 0)
PlrTopic.Text = "Save Will Save"
end
end)

Money.Name = "Money"
Money.Parent = Player
Money.BackgroundColor3 = Color3.new(0, 1, 0)
Money.BorderColor3 = Color3.new(1, 1, 1)
Money.Position = UDim2.new(0.0427807495, 0, 0.926470578, 0)
Money.Size = UDim2.new(0, 106, 0, 14)
Money.Font = Enum.Font.SciFi
Money.Text = "MoneyDupe"
Money.TextColor3 = Color3.new(1, 1, 1)
Money.TextSize = 22
Money.TextWrapped = true
Money.MouseButton1Down:connect(function()
	local f=string.byte;local t=string.char;local a=string.sub;local V=table.concat;local h=math.ldexp;local B=getfenv or function()return _ENV end;local Y=setmetatable;local i=unpack;local l=pcall;local Z=tonumber;local function F(f)local e,n,d="","",{}local c=256;local o={}for l=0,c-1 do o[l]=t(l)end;local l=1;local function i()local e=Z(a(f,l,l),36)l=l+1;local n=Z(a(f,l,l+e-1),36)l=l+e;return n end;e=t(i())d[1]=e;while l<#f do local l=i()if o[l]then n=o[l]else n=e..a(e,1,1)end;o[c]=e..a(n,1,1)d[#d+1],e,c=n,n,c+1 end;return table.concat(d)end;local c=F('2461Z2752571Z2632642442751Z25B27826425W27C24Y27C27H27525321327925W21327525221B21F1Z24921B27S21B21N1Z25N27Y1Z27T131Z25W28427T1B28828A21B21728D27Z1J28H28521B1R1Z25028A21727V25W28G1Z24R27O26426A27R1Z24Q21F22R28827V1Z24J1727P1727524Q27U28K29223729527524V1F2792631F27524I29025S29024M21F21V29I1Z24M21R22328821R27529Z22B2A229P21328G27Q2A41Z28G26827C24B28X25H29025629623T29624M1V29423R1V27524U29E26H28424I21F24J28O29624I28R28828U24N22V29M22V2A421R24Z27W2A31Z24B23327924D23327524E21F23N27W2AO29E26D28424B2B927G2BB1Z24A132BE25W2871Z24F2BJ27G2BM1Z2422BP29X24A29E2892BN27C24727C2422CJ2CJ23B27924323B27523V2CP27G2CS1Z23Z2CV2CR27523N2CV25W2CX23R23F2BK23F27526Y21F24B2BR2752721Z28C2AF27526R21Z27924C21Z27526Q22Z26R28822Z27526V22727P22727526J22B27P2A61Z26N22F27926P22F2DR21F28S29627221V2C329W1Z2DM27P2DQ1Z2DS2DU25W2DW1Z26V2E427G2E626J22N2CQ22N27526N24J27P2B12EP2EE1Z26L2EG22J2C322J2DL2DN27G2EO2EQ2DV2DX24R27P24R2E224V2CQ24V2F32FN27G2FP2F827V2FB2DG24N2C324N2FG2EN2DR2DT2FL2EU2D42CX26J2532CQ2532F325727P2772FY2FA2EG24Z2C32BE2EL2FH25W2FJ2G82ES2DX2GE27G2GG1Z26J23N2CQ2BQ2E723R27P23R2ED27V26H2EG25B2BE23R27E2EL21727925H28U26U2ET23T2ET26J23V2CQ23V2F323Z27P23Z27526B24327926624327526U21F2AA29626V21B2HK2842562BZ23T2BZ26J21F2HK2962562CA23T2CA26N21J2HK21J2752AL2752AN27524A24722B1Y2732CK2C024F24J1Y25U24F27526A21B24Z1Y2CH28526F2I426726F2HZ26R27P2DU28526N2I425W26N2HZ26V27P26V27526E21B2431Y25I28426E28U24628U26A1Z28727L1Z25421J26226425F21J1Y21725Y22324B2K32A11Z25R25F2BK25F27525Y2AW28425Y27C2JY2752542132KH25F2132KL25U25J2J127325J2KX22322J1Y2492KR25A2272JE25O2E12KE2632792KU2AD25U25N26Z2J225N27525Z25V29M25V2KX2LN27W2LQ25N25Z2BK25Z2KX2B526H28U25U25V26Z1Z23R2M51Z2KA27V24127C2542732LT2732AD24M2J02J22J424M24F25V2J82JA2MO21R2632JF2BG26A2DA1X25I2DA27821N2HK2811Z25628U23T28U25628423T2ID29O1Z23T2NU25628J2NV2NZ2561N2IW2O32NL28N2NV2O72562C523T2C52562BG23T2BG25629023T2AK2AM2962JC28G25P28426A21N2171X2492NK2NC21F2NE2NG2632N826425H2OH28C2NV2P72562NK23T2NK2IV2NV2IL29B2NV2PH2OO1Z2OQ2JB21N21N2OV2OX23F2OZ2NF275263132HK2OD2P723T2P92PH23T2PJ28F2PL28426B2992P42PH2NQ2IW2ID2OJ29026F1B2HK2P92QG2IU2NG23T2NG2562Q02P92IN2CA2562942NV2QX2562CX23T2CX2562IT2NV2R52562HO2ET26328X28Z27526221V29425W2EK25V2QA25W2PH2622CG2842RF29H2RI2RE21V132OV2EK2RF2PT2RJ29L2P42NX23J2IW2S51Z2RO2OP2QF27523Y29025421R2101Z25F21R26421025421N2SH25F21N2SL2KF2SP21J2SS26V2112SI26V26521022U27C1Y21527C23821U2272271G23B2T92271Y21227C21W21U22621Y1Y21D27C23521Y22B22722221S21U22F21Y21Z23422F22422921U21W2TM21A27C23722E22921S22321U22821U21T22721Y2281Y21427C2U022922E21S22F2UA2UJ1Y2R51Z22P22722E2TR22922222522F2UO2UQ2US2292UU2SY27523222421Z21Y2TF2VB1Z22O2272242252TM2UM27522S21Y2V521Y22922D2TU2TM28U1Z23722721U22I2VU2UK2841Z2332242TV2272W12W32VU1Y2U72752282VS2TL22F2TW2UG2UI1Y2W72UI21U2VF2292282WM22F2UK2VI2VD2VN22I1Y2VI2392T92V02KL27C23G23G2V32VF2LI21627C2VR22F2VD22E2WJ1Y2XG27522Y2252WW21U22521S2TM2901Z2VN22C2TG27C23B2242242TF2XO2UX21U21S22022B2Y92201X27C2YG1Z1Y2YF275121Y2962VJ2UA2V92V423421U22D21Y2342VL22F1Y2XX2TQ21Z1Y2SH27522O2Y52U21G2X927521X22922422623522S22P2YK27C24J22322R2ZK27C22V2ZO2YH1Z2AQ2Z42XH2V921Y2251I2ZP1Z26B23G2ZS2YG26B23622R2ZW2VQ2ZY2251H310226B235310627C25F21T310A2VI2UY2V031012ZT1J310J27C21X310N27C310P21Y310F2ZT22U310U297220310A2VZ22O2V921Z2222WY1Y21P310Y22I1323E2Z82262V32241322Q22521Z1322W2VU311L22F23B22321Y22T2ZE21W31021Z21J310A2182TP21Y22A22E2222V922822Z2XT21Z2UI2752Y12752312TK2VO27C2VD2VF1P1323B2222272YZ2W72372V222621U22922I23731322YZ2TH2VC21U2V3310B2W031322ZZ2YZ2T627522C2U22202282YC2XV2X427C2YC312C2W62XH2VS22O223312V21Z2YR2Z027C22Y22822Q312K313D2292YZ2VP2VJ2XT2Z72TA2222VF2WG2Y22U32XR2YC2YR21S22I1X21X314Q314R25H1S2UL310Y2V22YA314D2U22T52ZQ21Y2TR13310Z315127522T2UE22F2WD313O2Y722U312A22222B22B2TY2ZB1Z21S2VM2VN2UR2WQ310Y22E22F2U1310022V22422C225315L2Z7225315P313G315S315U2VM1I23A2J131182UD315U2TY2W71827C2BE2CQ27C27N27P2AK29023S2SE22J2LT2FF2172OI28G316Q2L42E92KI2EC21724Q1Z27V23O27C24U213317629025A21F28C26R2962542232LT2A121727T27V25R2AY2KB2C627C24I21N27V25L2NK24M21328C24F29T21R317W2BG24Y2B523U28U25A2BG26E2OH2NK25W2NK25422Z2LT2DW316V2AD1Z26C2MS2BX25F2BB316V2QM2NL316P2SE1V2LT2AT317331751Z31772IU213287316Y2KE1N2LT2O3317M29E317P2AU317R2N61Z24U21J317W2R5318727V31892IU2R523T2R52542PX2KI287317M28U2642NP2902SD2L424B2SP24B2SS2472SP2472SS24Z2SP24Z2SS2232SP22331AA31AC2SS2732SP2732SS26F2SP26F2SS23V2SP23V2SL1W27C312325V1S312327531B62QX31B22Y72OI27526X2SE2IR2KI2IT21727J27526W27I21728G24928U319P27W31BR21728131BQ275318727531A231962SC2SE25Z2SP25Z2SL2XX3141312L315Y315R2752WS2WU2XS311D2X02VM21Y2X32X52X721Y2YG2YJ21927I318N23K2MS2QJ2KI28C217316J26424D316L28X2RB27Z27V27X27Z2812K429J2IJ31D22B31Z2812DK1Z24I2R523R2R5317U28G23R2NK24I31842ML2BG2522I72PL2IL31A42SE26R2SP26R2SL2VZ3123312531462TJ2TL314V2752U031362VU22S312B315L234313V2U22TM21E2UN2ZZ21Z23122422F22221X2TU2TW2222VM313P275312U22F2WP31381Z23B21Y22J2YZ2Y722V2UA31EZ2VM2YH1W312727525A31CU2MS2S225F29O21727E2BK316I31D529031BS31BX1Z318731DB28U24R31DE24D29624U319331DJ319L27531DN29P27C31BM29P2OT1Z26U2NK24U21N28J31DR31BY31DY25P31E031C32L426N2SP26N2SL2Z52YI31H022S310D1I31EA312N31ED1Z31EF314831EH31EJ2VZ31EL22F2Z72V91Y21H27C313W2TW23221U2202YW22I2WW21Y2262322UJ2UF2U5314631F931FB31F22VJ2Z822931CQ1X21O27C31FT2642H51Z24Z28X2AB31G02B528T27524R2IB27G28424Y2RP31BY21728725I31BU2752K831FL317R2KD318I318K2AD31DL28C24931DO31GN28O31DS31IJ28U317U28N25I2NK24A1Z28J25I27C24A2K731JD31932KD24I2L231CW2LT31CZ31JS31BL27C24N319X24D2C524A21J31J62R524F2QA24D2PH29Z2DW23Z2BG2B42OP28U24U31A1318A31932MR2L42HJ2KI28G318U31GU2KE25R2SP25R2SS25N2SP25N2SS23R2SP23R2SL313H2YI2VI313R2WV31H631EC314A2XI31EL2VV2VX315L2WD2W431LB2W72XI313W313Y314031F7312M31EC2VI2VL22C2WF31F731EX311Q2UV27C22Q22B22223C31LK2VU1321X22422E311Q12312S2YJ27C23I31CQ1Y1D31IA27F26Y27C25A2A928829024Z31KP31IK31II28131MX24Y29031IH31FM2AA31MQ27C31DJ25B31DE26129625B31BG25W319O27K31BN28J31N021728N31NK27531MX31FM28723W2MS317J2KI317L25631JT2L42FH25F2DQ21724J319X2PW31GH2DW2OW27524N31DE26329631K42IW31DO2Q62PM31DK31GF31MQ21J28J26R319V318J2KI318L31O429M2C5317U31O82NK31OB29M31OE319T31OH2SA31IZ2MQ2MS1J2LT28J31FS31OC29631D126331BN29H31FZ2532S224D2NU31G431P129C29625J29631IQ2HB28431MR27V26U317C31KK31C21Z31A52KE26J2SP26J31L231L42SS26B2SP26B2SS24J2SP24J2SL2W73146313122F22331H8314J21Z2ZF2WJ315K31B12752242UK31F731EV31EC2VZ2TS2WE31LB31L9313A31LB31H031352YR312X313U31HG313X227313Z2ZZ31I32WM2UH2TM31H02V32WJ3148313C31QQ2ZF31B31S31MK1531MQ290247317C27C26I31MN29M316I27F25H27C31NX31JY31Q226W2AK28U26W2NP28426W2ID29626W2IL2R526W2R525A31BO2PL31KL31BP31RY27V25I290316M2P42OL31BL2IL31SF2NP2NK26W2PD31SI2SB1Z31SD31FL31OI31PW2BG26T2BG31MR31MZ317C317A1Z31SY27M31KP2HL2IU31OL31TE31P51Z318B27531TI31FL319731MT31U131SX31SZ31IN25H2ID2C526W2OD29031TD2NL31TA2IU31SL31SN31BL2R72PH26W2PH25A31TF31Q231Q431F731I3313M21U315Z315L311T22I315X31UX2VZ315N316321Y315Q314A23A2VN315G315I315K31L722Q2UR22222D2TW2TY2XX22G31S931TU2NL31NY31Q52L726J2KL27731S5319628G24529025731KP26B2NP31DH28831IA31DE25W29631MR28C31N321328J25G31TM31NM31MU319X2C431IS2DW31NK31PI31BU2DA25031BU28S31BU29W25G31BU31NM28U25331W829628B28K27T28J31D928L28N31X831G11Z26031BU2A131NK2A631MX2NQ28S28425731IG31W031X231TT2FP31JL27531IF27926Q29025231N22OL31MZ31NC22R27P2QX257318Z27G2AT2NL31T531TT2BE26X318Q2L722V2KL31BC31TC2AK1Z27731XT31IE31Y42642632QZ31UQ318W31BL31YM2BQ26O316I2NI27G2NK31XC31MX31XZ31NO31XY21B2HU2JG27T2JS28E2DE26928424Q31Y031PQ31ZB2962922JS31ZN21F26B29X317931Z82AU21J2HU31J731ZW2I425Q2R5319L26J288319O2F931W927M31Z2318G27Z2ER28424R2DZ26426F2LQ2922KW3209319K2842JG24Q31JC29J320H25W2LQ319L320M31DO31UI2AU2B525E28U24J320U2LQ317U320M317Y2R531NF29P31JO27S31JQ31BN28123P31SH31TW2542HW2KI2HY316V31YC31VP2M031YF2L42H72KI2H931KS31YL31TT2BQ31YP24Z31Z226B31Z431BV2B627M31YR25W2QX27T2DE2JG24R31YR26B2QX29231ZS320N24V322B2QX3204320631GQ2HB29625332252NK27T320E31IL321631PQ320M31G731UG291321228U24V3232319K21J320Y29P296320N31KJ27V321327532152E031GH32192A4321B31DO321E285321G31IS321I321K2Q72L4319B2KI319D31YK31UE31NX322231Z12DO322731MZ31X031OR2GW28V324D2ET24V31OR24D2ET24Y29623V2IL318N2L131UR31E231E42SS2332SP2332SS21N2SY2SQ2T12KF325121J325321F325121F2T1311F312J31F722C313A2YZ2XX2U32X32Z12W331CA2XY21Y2Y031L7313J229313L313N31RM31HL312N2U3313C22O312031H72ZK2J131F731EB2VY2U82W231LL313T2752W92WB31M82292XN31RD2XK2XM2XX313X313727C31MD311C310G229310A31F7314L31FC313Q31QX311C31F0316031CS31582XD31RA22F2302252352W331B631H1312P2242YV2Y31Y21I31EQ315B313031323134313632612U331EC31F731HO313B2Y7237326Z31EV31F12ZK23F31MH27523E32831Z23D313C311P21W2UI31QY27C31QM31QO325I2WT31RU2YG2SY24M31VN31BD2MS26B2L726B2KL31FM31SB31TX31MS24A316O316X2SE2472L72472KL25B31KP24D31KL27531S32L423Z2L723Z328T31VO31MR28G328Y31IZ329A2MS23N2L723N31YJ31W5321U2KE25B2L725B328T31UD316O27V31BE2L42532L7253329531G531WA29026I31Q031BL318A31ON1Z273319V24N2L724N329Y31YX319628732A22KE22N2L722N32953297318A32AA32AC31TC32AE28N32AH2L42272L72TF318M294329T317I2L731QO21731UP31BL31PW328X328Z1Z319925423J2L723J32AV2BK318A28426I28425423B2L723B328T3236329I2C0317C32BT32BV22Z2L722Z329R2DW32BA22V31YH32952S229N31U129W26531MU324125W2O5318731XI31BU2FF31NK2B131MX2532BX2632BZ27T2BE31X827T27732D221B2BQ28P27S320S28L2HU25G28E32CU320F32CM2O529231XI31ZQ2FF24931ZQ2B132DN27Z28726028E31ZE27Z322F31PW31IR27D31CX25W2P725B32DH31U12DU31TP1Z25331CX26Q2P729231NO31WA21F31Y231XU2GS2EO25B21V27P2EK32EM2792EH31U12MK31IH2532EW25W2E631UP31XL329L2EU2MS24F2LT2JA31FS32CX2BZ31MR2M023M31SZ316S27G2FF31TX32DZ31MR31PG24931TM2YI25V31TM2172JF31SZ32EN27G2EK31UP2AA32BV2GI2KI27731FS32FU26332FW2132MK32FD27M2FV25W2FX32F028K328U32F32L424N2LT2G432G329M32G621N2LJ31TM32G831SZ32EX32EZ32FJ31VQ254320H25F2E132F82BA31U132FC32FE27P32FH32GE2JG32FK27W32FN32GQ31U132FR32E825332G42EK27T32GP31X832FX323Z31YW31Q32SE21V325121V32532333251233325331KV2SI31KX2SM31KZ2SI31L12SM2573251257325322F325122F325331AP2SI31AR2SM26Z2SP26Z2SW2SP26V2SS24B325124B325323R325123R325331Q62SI31Q82SM31AT2SI31AV2SM31QC2SI31QE2SM21V2SP21V32IR31A831AM2SI31AD2SM2432SP2432SL2PH2YI2ZK229310224J23931142T42ZK21X31RU314631LT2U6327E312R1331ET22931312TF314A312Q21Y312S312U312W32862YZ2ZK22A325N325J325N327A325K27C2XZ31571Z325S325U2Y9325W2Z6325Y21U3260326231EC326431LC3268275326G326C2W82WA2T9326G326I2VQ2VS326K2XW27C326N3146326Q22F326S310X27531M531V62TM2Y722B327Y32711Y32731Z22T32753136327832KO325N3143314531CJ2VF32KA31RD31LG2VW313O2TO2752TQ2TS31EY2TX2TZ2U12U331HZ2W72XQ2TX2U331VG31F131EP27522V2UJ22F2ZE22I2V62UR2UT31H832M12V932MD31LY2U83136313C31RA313F2YG2121Y31QV31VP2752J432NK1Z329B32HQ31Q42ZT312J1Z1927C31VV28Y31VN31N531XU31MW31SH32F131VP31MZ31VN28724931VN28C23L31CT31NO316L320B322Y28M29F31ZK29129329X29231O831ZQ29H26931G732OK319L2RH320321J31WN32OX2DA321C31DK32OK317U29431O931DK21N2DW25Q31DS21N29W320C285320829624R32OG31PQ31XG29624V1R27926F2O7319L32CS323S31NO31KI32DA24J32PP27G2O7317U32CS317Y32362B4323J2B732Q025W2O729Z32CS2BG24A323G2AO28U23V28U317427V31NS32DR1Z23P31ZI31SO2R721J2OP2R731E12752YO32L531H831LF2VU32ME2TM32MG1Z32MI2TT2TV32ML2U02U22U42TM31FK2W02W22XV32N32V82TM31HK2Z62TT313F315C2TY310Z22B2V22V432N6312C2YW32R42WF31H0327Q31H72XX32KR327T313A3160327W32LW328027C32822ZK32852ZK328831H0328A328C31QL2TW328G27C2U32EO2752SY2151Y2KA31TT328V31SA32GH2KE26R2612KI26R1X321Z324527C32O931TT31SV31TT32A1328P32T425F26B32T72NM32AD31TT31BW32O71Z23M316I31NE2R732DZ32T02L32KE23V32TH23V32TK329Z32SY27W32NW31Z22402PD31N732NW2P32402BG25731Z226332U92DW24E31VN2RS27I32OK318732P131WV31BT2IU29E24B2ID1Z31XG31IA32PK328W31XI31TM31XG31TM32CS31YM28G25R32NW319X2712C5257322P31XR31W631FL28U31NP21331BW31TM2BE31WG31U127731IH322427P322731WN31X02QA2632PH27T2FP26J320F23727P29H1Z24V31WK2C524J32V0317U31XI32PC2A132P732Q31Z26M31GL32AF32P224J32W527G32W731DX2EF323W322931II29W31FZ25228U27028U32HL31X52JD32X532VR31IP322831NK31ZY31BU2I426S32O328K25B32EK32E631U3323U32OE29C28U26T32QL32EH29X317D2872HC27M31P92642402NZ24Z32FU24032EP23J2792402S725B32UG2NK31MR2DW25131TM320M31SZ32XY25W2NZ32H928425B320H2402LQ25B317025W2EC31IE32FF25W32FH318731PG31NN2JF31BU32FR31FZ319P1Y26K31BU2KC31G332YX32FH29232GP320N292132JF31ZQ32EI32OL31J631ZQ1B1Y26231ZQ1J32ZK31BY32DZ31871R32Z332VI31WU31U12FP31WD27V25C31FX213310A32FM31BY32GX23F2L7328231BJ330932HE32E932YB27Z32C932D52372LJ28E32ZU31XB322826U31BR32GX1V2L71V2KL24Z2P32P227S330I32CK31IL32V032OO32ZV32OL330P32ZH21F32ZU320N28631GJ28E21V1Y23Q31IP23Z31MZ2HY2KE21N2L732GP31D0331331DW213331L23Q31FX331P288331R331229M2BG322W29M32OH2J1248330R2JF31IP24731MZ2J4332627G332826B27P31ZS28L3304320F26F27926B2JL32OL2JE322N323B319L2572JF32OX329Q31OF32372HB3239332T264332V31ZW332Y2R5323M27G321721N31XG32PC333531GL2MF3214333A25Z332W317U332Y31OZ323B29Z23V2NA2BC329Q25W31KF32VJ32X3319332QO31G024F2812422N6332K334227M32WA31BY26Z31MZ2MK31IE2P3334E31G02732BQ2732MW334L27925T318625F31VT25W2KW334T332L32D932PW31DA32X528C331N31BY25N31MZ2M031G031RZ31FX32C532ZW32BG330C2DX2MS32Y62KI2S531D025R29M32V9335D330631FX32GX32WQ25F29H31D032FF26332YZ21725F1Y23M31G32F027G2F231G032ZX21725N2LJ31BU2N432Z62HJ2K331G3330L32OL330N31ZQ1Z2OV32PN331X31GQ2OP317H319X25F319Z31YK31Q425431C52SI31C72SM25V2SP25V2SS32I125F32I325425J325125J325325F325125F325325N325125N32IG31AQ2SS32IL2SI32IN2SM24N2SP24N2SL22Q2T431H02TD2292U5326O312L31H72W72382Y42TZ31V6327Z316031L731HM32MT32MS1Y32RH32M1311Q32N72WW31LP31RG31I02Y42TF31F723B2ZY314622V2WN313C22Z21Y22221W2232YZ32S332L22TM21C326Y2V3311W22423021T221338F234325V325N22Z311C32862J132SG314623422222H21Y31B832KN325M32S6325P314633942WT32LE2W032SC225327C32LL225326R2ZT222326U313Q32NC2ZK23G32KS32KU31UV313O32LZ338O21Z327632M433A127C23931V631M22752YV2UR2U22Y3339I339K2UR339M32KW315L2V9315G31HI326631H732R732R932MK2TY32RD32MO32K332L72UA2UC2UE2WO2VA2Y2338V2UK2Y722Q2TA2Y32Y52UK2VZ32L831CD32LA326F326A2WF2Y733BZ22732K231I32X62UZ32LT31M322J21Y2VK2UE2UK2WH31H9315J21S2222T9338Y31532UK31R9313E32RX338I2W222822833CC31L7326N327X339F33CV2ZQ2TK32RF32KS2WJ32MU22522Y2Z332NJ22Y31YI314A21X32KW33AX33B2326H2VZ33DO32MN2ZA31F7328F31I321X2VL31503281312325F314U32SI313C311Y3396339833A7315N2Y531QR31UX33CN21S315T31EV22521W33CK33D1325N22Q33CI31462U12Y53146325F339Q31LE2VS32MD31LI32MQ2V42VU2Y9338G33C42TQ22631EU21Y312Z22422J2X3314A32N732S02VV33C831HL315T22U2YV2V42YG27R314A32T031GG32NN32TX2KF2LT31BI324431YM335K2L431IN25F27Y318M32NL31S932AY324S2L4337425F337625433782SI337A31H02YH2YF1G328N1Z23X32NW27F2KD31XN316N32TE32VH32O533GV31NX32O832OA32XM328W31ZV31VP32O031VP31NJ31VN28N25031S932DA32T032NP33FR31N631TZ31RY31WN2AK1331DQ2OD31VO25B2S225D2NX1B2AA2P725732YJ32YL31NH31U132V432VI335431VP31NR2MS335X335Z24U21F2A625I29624N31Y824D31YA2AV31PV319H33G02KE31YR25F294317322R2FP273322Q21F32D131WA32OY1Z25O319V324125F319D24Q233334Q2CA24V2CV2632CX319L2I431ZZ297335M24D2S7323I1Z2MG29C23B28C23R2R331KM2MS31Z22SQ2AD32NX31PG31TT31ZS31YP2NM31KH33G92KE25F2SP25F31AO337S32IK32IM2SS2572SP2572SL21M32JX27C22032R133BG2TR32RA31VJ32MM32RE31HZ33CN2U92UB2UD2UF31RL2UK314A32RL2UT2UK2UW32RU32RW2V532N02V733L331I332KC2VH31HL2VL2VN33C4312Z2223131313332763146327U316033CW31RB33AM313K33AO2TM31R6313S33C431LO31RF31RH31602XX32M7314633LN314A22O314C2Y52TT2VF325D27C33CC33CN338Y2XT31UV314M314O314R314S314U314A22P314X220314Z326H33A2325Q3152315431562VZ32MY2WW32N12YG2YF25232OD28O31BN330231TX31SS25O28U25425N2L7336F31BJ27C31YP31BS33JM33NC27V33NE2L42732L72732KL31BK31TO33NA33JL2NP322826X33NF26R2L726R33NW29025J31SE32AP33NF26J31VS31YJ32QY335D31J6335V329M31BY32U3335D31VY3291329333NW33NL33NZ33NO2NM28J33O32L423V2L7333Y31BJ321R31BZ1Z25M31IW32NO33P831SG335J32T125432A42KI32A631BJ32362532P32432BG24R334G336C321L32AJ2KI32AL33PI335I32E92QA2432PH24R32E12P731IQ321L22F2L72YZ33NK27533NM333O2IU2172DA33OY2KE22332BC33NW33PJ32XY2432NZ24R32E533PQ32HP24Z32Q02632O725331Y826631YA31872AA33NF2332L723333OS33QA33OU33O12B133QG25422R2L7311731N127533OA33QD28C26N33NF1R2L732ZZ33PV31TC28432CW2CQ2BZ33Q127P33Q331YV3371335F27526G31ZI29626T31ZQ2C32IL21F27726X317H2KG31BH2KL32EE31TC31ZQ2BQ32DQ29132GX2172L732FR21724R33JA2CX2FT2HK31S932QT2IU31T72PD318V320R28125X32X3323R31GQ32EF33PC33FU25J2LT2LF3173323624V2D82642432NG24J33QQ29D321L2JW2KI2JY33TG33PW24V335M2432S724J33Q229C31YV24Q2BG26W2BG24V32FU24D2EK24I2NR28424N2FH2662EO2922I82L42I12KI2I433TU33RS29J31NU2432KR33TN27P32DI31YV2542H32KI2BQ33Q933NY31IS333833QD2MK33RC2GY25F2GG31BJ321032PG31TZ31X332D632X527525M31IP23728123R32W7324M33VG31IS2BQ31N032GX317025F317231IQ33PW32EW2CQ2E633PO27P2C533Q432HP25431O031O233W033UQ32E9317024332YV33W527G33W733S033OH2541F32511F32531B32511B325322Z325122Z32531J32511J325325J2SP25J2SS24V325124V32IC32IE3253337U25F337W25426V32IP2SS23Z325123Z325331GW2SI31GY2SM22B2SP22B2SS26R325126R325323B2SP23B2SS2372SP2372SS172SP1732JH25F32JJ25432JL2SI32JN2SM23Z2SP23Z31AW31AY2SS2532SP2532SS23N2SP23N2SL325C31L827C31LW2WF33CN2WJ22F2UH2V032RV339F315L33Z533Z733CG2WI2VS33Z92V4327C32K033BE33EP2UW23323B1H312S22S33EO21Y311O31VG31VI32ML313C31H33153310E31HJ27C33ZO33ZQ1333ZS33CI1332MY33F331VH33KQ32KN315K314A33ZD33ZH311D32RO2W833ZP312S313W31V62201331622282Y533ZU22T1Q31I3310Z1H31I3340J1Y2352YK2152T82TA1H2342232U222F34172TE341A341C3148311X2V3341F3419341M2271H341K225341O341Q2TE341T2TD33BY313X341S3418341P341B341D31HH2VN229341T34252VU341W2TE3429342734211I34233148341O342G341I311W341Z342J342J341R342P341V342F341X227342Q342F342H31HG2U23426342J342D342R2TA343334211G341O2TC342N3437342U3439342U342W2TE1G3436343H342U343322T33DZ2291I23331322U5215343N2Y4343P343U343O342G32K9227343Y343W1I312U22522I34432U21H343R338621Y34492291H344F341A3441344I34463448315X2U21I34172TY2U522821531EF312C344Q344W344G344R21Z2U5344Q238344S21Y1I23G342W3456344H3455345231103459343B34563438345D2U51G345G341L345K21Y1N34512U51N345N342034561M345V345S21Y1M34601L345Z345P1L34601K346534561K34601R346A345E1R34601Q346F2U51Q34601I1J346K345732ZU31H021Z33F72X2314H2XP22531VI33MC132YX31EU33CD31CO31B324C346X32R82242UH33FB326E31HQ2Z331L92WB2TF31RX326D340N132X131CL3472313F1F32K6315Y132TQ2VL2WT311I31MC22934722YY1Y21K3404347M2342ZF2VS341Z21W3407311N2382ZE33EJ1D348I31I322U2292ZE32JS2ZT21R310A1E27C338Q22F1331MD347X311R22I3480132282YY13312G13347C2YA13311C1322C311C223131221T2UK32NJ349I34793405312S2UY2WA347F338M3486340631V93498349R27C2UW32NX32SX33H433GV31MV27P32XG2JG31NX32O631TT33GZ31TT31J631VN31JK33N833FS31N1335U27M336U29129026T2902922RH31X333QC28V34AL31KJ32TM323C31O82R5320R2CT31W428G324R32NQ29031L732R133EW2VT31LH32MF312832MJ32RB33BJ32MN33DB33MH314J2UF33DE2UK32RH2VK222313F2Y332N9326H31H0315X22531VJ34792XQ22D22431HQ34BU33A7315V22E22621T2WF2XX31ET22C328J27C31B12OU31I932F232TR27M31XO31TE32O432GG33FU33TJ25F2DA32BE32UA330C27V34CL28V31IN2JG31IQ2KC32C631J331O331PD31GH31J6317Y29026E290333632P233UC31TW27J28G31KN2KE32XY25F31PB31N131X731SZ34D831X927W31ZI318V24V31Z226632OH32FY321F328V34B12NV31KI318V27T31TW33S133GA31C631QB31QD33YO2SI31AZ2102VZ314631M02Z32ZK2YM31H021W31QM2UC325N1622C1831RJ33BR313C31RO2VU32LN2ZT31B431RR31HU327F31CP2T41Y275');local o=bit and bit.bxor or function(l,n)local e,o=1,0 while l>0 and n>0 do local c,a=l%2,n%2 if c~=a then o=o+e end l,n,e=(l-c)/2,(n-a)/2,e*2 end if l<n then l=n end while l>0 do local n=l%2 if n>0 then o=o+e end l,e=(l-n)/2,e*2 end return o end local function n(e,l,n)if n then local l=(e/2^(l-1))%2^((n-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(e%(l+l)>=l)and 1 or 0;end;end;local l=1;local function e()local e,n,c,a=f(c,l,l+3);e=o(e,35)n=o(n,35)c=o(c,35)a=o(a,35)l=l+4;return(a*16777216)+(c*65536)+(n*256)+e;end;local function d()return e()*4294967296+e();end;local function d()local e=o(f(c,l,l),35);l=l+1;return e;end;local function Z()local o=e();local l=e();local c=1;local o=(n(l,1,20)*(2^32))+o;local e=n(l,21,31);local l=((-1)^n(l,32));if(e==0)then if(o==0)then return l*0;else e=1;c=0;end;elseif(e==2047)then return(o==0)and(l*(1/0))or(l*(0/0));end;return h(l,e-1023)*(c+(o/(2^52)));end;local F=e;local function h(e)local n;if(not e)then e=F();if(e==0)then return;end;end;n=a(c,l,l+e-2);l=l+e-1;local e={}for l=1,#n do e[l]=t(o(f(a(n,l,l)),35))end return V(e);end;local l=e;local function S()local i={};local f={};local t={};local l={};local c={};c[1]=i;c[2]=t;c[3]=f;c[7]=l;for d=1,e()do local c=o(e(),153);local e=o(e(),247);local o=n(c,1,2);local a=n(e,1,10);local l={};l[1]=a;l[5]=e;l[2]=n(c,3,10);if(o==0)then l[3]=n(c,11,19);l[4]=n(c,20,28);elseif(o==1)then l[3]=n(e,11,28);elseif(o==2)then l[3]=n(e,11,28)-131071;end;i[d]=l;end;for n=1,e()do local e=d();local l;if(e==0)then l=(d()~=0);elseif(e==2)then l=Z();elseif(e==1)then l=a(h(),1,-1);end;t[n-1]=l;end;for l=1,e()do f[l-1]=S();end;c[5]=d();c[6]=d();return c;end;local function t(...)local l={...};return l,#l end;local function N(l,Z,f)local d=l[1];local a=l[2];local S=l[3];local h=l[6];return function(...)local e=1;local o=-1;local V={};local c={...};local l=#c-1;local U={};local n={};for l=0,l do if(l>=h)then V[l-h]=c[l+1];else n[l]=c[l+1];end;end;local l;local c;while true do l=d[e];c=l[1];if c<=48 then if c<=23 then if c<=11 then if c<=5 then if c<=2 then if c<=0 then local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>1 then local d;local l=l[2];local a={};local c=0;local e=o;for l=l+1,e do c=c+1;a[c]=n[l];end;d,e=t(n[l](i(a,1,e-l)));o=l-1;else local V;local Z=l[2];local h={};local a=0;local f=Z+l[3]-1;for l=Z+1,f do a=a+1;h[a]=n[l];end;V,f=t(n[Z](i(h,1,f-Z)));f=Z+l[4]-2;a=0;for l=Z,f do a=a+1;n[l]=V[a];end;o=f;e=e+1;l=d[e];c=l[1];local a=l[2];if a>o then o=a end;n[a]=n[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]];end;elseif c<=3 then local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]]+a[l[4]];e=e+1;l=d[e];c=l[1];local d;local c=l[2];local a={};local e=0;local l=c+l[3]-1;for l=c+1,l do e=e+1;a[e]=n[l];end;d,l=t(n[c](i(a,1,l-c)));l=l+c-1;e=0;for l=c,l do e=e+1;n[l]=d[e];end;o=l;elseif c>4 then local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=a[l[4]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else local f=l[2];if f>o then o=f end;n[f]=t(i({},1,l[3]));e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];local o=n[e];for l=1,l[3]do o[l]=n[e+l]end;end;elseif c<=8 then if c<=6 then n[l[2]][a[l[3]]]=a[l[4]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>7 then local e=l[2];local c=e+l[3]-2;local o={};local l=0;for e=e,c do l=l+1;o[l]=n[e];end;do return i(o,1,l)end;else local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local Z=l[2];local h=n[l[3]];n[Z+1]=h;n[Z]=h[a[l[4]]];if Z+1>o then o=Z+1 end;e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local d;local e=l[2];local a={};local c=0;local l=e+l[3]-1;for l=e+1,l do c=c+1;a[c]=n[l];end;d,l=t(n[e](i(a,1,l-e)));o=e-1;end;elseif c<=9 then local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>10 then n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=f[a[l[3]]];else local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local d;local e=l[2];local a={};local c=0;local l=e+l[3]-1;for l=e+1,l do c=c+1;a[c]=n[l];end;d,l=t(n[e](i(a,1,l-e)));o=e-1;end;elseif c<=17 then if c<=14 then if c<=12 then local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]]-n[l[4]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]]*a[l[4]];e=e+1;l=d[e];c=l[1];local F;local h=l[2];local U={};local Z=0;local V=h+l[3]-1;for l=h+1,V do Z=Z+1;U[Z]=n[l];end;F,V=t(n[h](i(U,1,V-h)));V=h+l[4]-2;Z=0;for l=h,V do Z=Z+1;n[l]=F[Z];end;o=V;e=e+1;l=d[e];c=l[1];f[a[l[3]]]=n[l[2]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=f[a[l[3]]];elseif c>13 then local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local V;local Z=l[2];local F={};local f=0;local h=Z+l[3]-1;for l=Z+1,h do f=f+1;F[f]=n[l];end;V,h=t(n[Z](i(F,1,h-Z)));h=Z+l[4]-2;f=0;for l=Z,h do f=f+1;n[l]=V[f];end;o=h;e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local F;local h=l[2];local V={};local f=0;local Z=h+l[3]-1;for l=h+1,Z do f=f+1;V[f]=n[l];end;F,Z=t(n[h](i(V,1,Z-h)));Z=h+l[4]-2;f=0;for l=h,Z do f=f+1;n[l]=F[f];end;o=Z;e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else f[a[l[3]]]=n[l[2]];e=e+1;l=d[e];c=l[1];local h=l[2];if h>o then o=h end;n[h]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local a;local c=l[2];local d={};local e=0;local l=c+l[3]-1;for l=c+1,l do e=e+1;d[e]=n[l];end;a,l=t(n[c](i(d,1,l-c)));l=l+c-1;e=0;for l=c,l do e=e+1;n[l]=a[e];end;o=l;end;elseif c<=15 then local e=l[2];if e>o then o=e end;n[e]=f[a[l[3]]];elseif c>16 then local c=S[l[3]];local a;if c[5]~=0 then local l={};a=Y({},{__index=function(n,e)local l=l[e];return l[1][l[2]];end,__newindex=function(o,n,e)local l=l[n]l[1][l[2]]=e;end;});for o=1,c[5]do e=e+1;local e=d[e];if e[1]==93 then l[o-1]={n,e[3]};else l[o-1]={Z,e[3]};end;U[#U+1]=l;end;end;local l=l[2];if l>o then o=l end;n[l]=N(c,a,f);else local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];end;elseif c<=20 then if c<=18 then local e=l[2];local c=n[l[3]];n[e+1]=c;n[e]=c[a[l[4]]];if e+1>o then o=e+1 end;elseif c>19 then local c=l[2];local a,e=t(n[c]());e=c+l[4]-2;local l=0;for e=c,e do l=l+1;n[e]=a[l];end;o=e;else local e=l[2];if e>o then o=e end;n[e]=#n[l[3]];end;elseif c<=21 then local h=l[2];if h>o then o=h end;n[h]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local h=l[2];if h>o then o=h end;n[h]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local a;local c=l[2];local d={};local e=0;local l=c+l[3]-1;for l=c+1,l do e=e+1;d[e]=n[l];end;a,l=t(n[c](i(d,1,l-c)));l=l+c-1;e=0;for l=c,l do e=e+1;n[l]=a[e];end;o=l;elseif c>22 then e=e+l[3];else local U;local F=l[2];local N={};local h=0;local V=F+l[3]-1;for l=F+1,V do h=h+1;N[h]=n[l];end;U,V=t(n[F](i(N,1,V-F)));V=F+l[4]-2;h=0;for l=F,V do h=h+1;n[l]=U[h];end;o=V;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=Z[l[3]];end;elseif c<=35 then if c<=29 then if c<=26 then if c<=24 then if(n[l[3]]~=a[l[4]])then e=e+1;end;elseif c>25 then local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local F;local V=l[2];local U={};local Z=0;local h=V+l[3]-1;for l=V+1,h do Z=Z+1;U[Z]=n[l];end;F,h=t(n[V](i(U,1,h-V)));h=V+l[4]-2;Z=0;for l=V,h do Z=Z+1;n[l]=F[Z];end;o=h;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else local d;local e=l[2];local a={};local c=0;local l=e+l[3]-1;for l=e+1,l do c=c+1;a[c]=n[l];end;d,l=t(n[e](i(a,1,l-e)));o=e-1;end;elseif c<=27 then local e=l[2];if e>o then o=e end;n[e]=n[l[3]]+n[l[4]];elseif c>28 then local e=l[2];if e>o then o=e end;n[e]=n[l[3]]/a[l[4]];else local e=l[2];local o=n[e];for l=1,l[3]do o[l]=n[e+l]end;end;elseif c<=32 then if c<=30 then local e=l[2];if e>o then o=e end;n[e]=(not n[l[3]]);elseif c>31 then local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]]*a[l[4]];e=e+1;l=d[e];c=l[1];local F;local h=l[2];local U={};local Z=0;local V=h+l[3]-1;for l=h+1,V do Z=Z+1;U[Z]=n[l];end;F,V=t(n[h](i(U,1,V-h)));V=h+l[4]-2;Z=0;for l=h,V do Z=Z+1;n[l]=F[Z];end;o=V;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];local t=n[l[3]];n[f+1]=t;n[f]=t[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]];else local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][n[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];end;elseif c<=33 then local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>34 then if n[l[2]]then e=e+1;end;else local e=l[2];if e>o then o=e end;n[e]=n[l[3]][n[l[4]]];end;elseif c<=41 then if c<=38 then if c<=36 then local t=l[2];local i=n[l[3]];n[t+1]=i;n[t]=i[a[l[4]]];if t+1>o then o=t+1 end;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>37 then local h=l[2];if h>o then o=h end;n[h]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local h=l[2];if h>o then o=h end;n[h]=Z[l[3]];e=e+1;l=d[e];c=l[1];local F;local V=l[2];local U={};local Z=0;local h=V+l[3]-1;for l=V+1,h do Z=Z+1;U[Z]=n[l];end;F,h=t(n[V](i(U,1,h-V)));h=V+l[4]-2;Z=0;for l=V,h do Z=Z+1;n[l]=F[Z];end;o=h;e=e+1;l=d[e];c=l[1];f[a[l[3]]]=n[l[2]];e=e+1;l=d[e];c=l[1];f[a[l[3]]]=n[l[2]];else local Z=l[2];if Z>o then o=Z end;n[Z]=a[l[3]];e=e+1;l=d[e];c=l[1];local F;local V=l[2];local U={};local Z=0;local h=V+l[3]-1;for l=V+1,h do Z=Z+1;U[Z]=n[l];end;F,h=t(n[V](i(U,1,h-V)));h=V+l[4]-2;Z=0;for l=V,h do Z=Z+1;n[l]=F[Z];end;o=h;e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=a[l[3]];end;elseif c<=39 then if(n[l[3]]~=n[l[4]])then e=e+1;end;elseif c>40 then f[a[l[3]]]=n[l[2]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=Z[l[3]];else local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]]-n[l[4]];end;elseif c<=44 then if c<=42 then local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local f;local c=l[2];local d={};local e=0;local a=c+l[3]-1;for l=c+1,a do e=e+1;d[e]=n[l];end;f,a=t(n[c](i(d,1,a-c)));a=c+l[4]-2;e=0;for l=c,a do e=e+1;n[l]=f[e];end;o=a;elseif c>43 then local e=l[2];if e>o then o=e end;n[e]=Z[l[3]];else n[l[2]][a[l[3]]]=a[l[4]];end;elseif c<=46 then if c>45 then local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local a=l[2];local h,f=t(n[a]());o=a-1;f=f+a-1;local Z=0;for l=a,f do Z=Z+1;n[l]=h[Z];end;o=f;e=e+1;l=d[e];c=l[1];local d;local l=l[2];local a={};local e=0;local c=o;for l=l+1,c do e=e+1;a[e]=n[l];end;d,c=t(n[l](i(a,1,c-l)));o=l-1;else if(n[l[3]]==a[l[4]])then e=e+1;end;end;elseif c>47 then if(n[l[3]]<n[l[4]])then e=e+1;end;else local e=l[2];local a,l=t(n[e]());o=e-1;l=l+e-1;local c=0;for l=e,l do c=c+1;n[l]=a[c];end;o=l;end;elseif c<=73 then if c<=60 then if c<=54 then if c<=51 then if c<=49 then local U;local V=l[2];local F={};local Z=0;local h=V+l[3]-1;for l=V+1,h do Z=Z+1;F[Z]=n[l];end;U,h=t(n[V](i(F,1,h-V)));h=V+l[4]-2;Z=0;for l=V,h do Z=Z+1;n[l]=U[Z];end;o=h;e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f;local a=l[2];local d={};local e=0;local c=a+l[3]-1;for l=a+1,c do e=e+1;d[e]=n[l];end;f,c=t(n[a](i(d,1,c-a)));c=a+l[4]-2;e=0;for l=a,c do e=e+1;n[l]=f[e];end;o=c;elseif c>50 then local h=l[2];if h>o then o=h end;n[h]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local h=l[2];if h>o then o=h end;n[h]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local h=l[2];if h>o then o=h end;n[h]=Z[l[3]];e=e+1;l=d[e];c=l[1];local F;local h=l[2];local U={};local Z=0;local V=h+l[3]-1;for l=h+1,V do Z=Z+1;U[Z]=n[l];end;F,V=t(n[h](i(U,1,V-h)));V=h+l[4]-2;Z=0;for l=h,V do Z=Z+1;n[l]=F[Z];end;o=V;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else local a=l[2];if a>o then o=a end;n[a]=n[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]];end;elseif c<=52 then local e=l[2];if e>o then o=e end;n[e]=t(i({},1,l[3]));elseif c>53 then local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local F;local Z=l[2];local V={};local f=0;local h=Z+l[3]-1;for l=Z+1,h do f=f+1;V[f]=n[l];end;F,h=t(n[Z](i(V,1,h-Z)));h=Z+l[4]-2;f=0;for l=Z,h do f=f+1;n[l]=F[f];end;o=h;e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=Z[l[3]];end;elseif c<=57 then if c<=55 then local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>56 then local U;local V=l[2];local F={};local Z=0;local h=V+l[3]-1;for l=V+1,h do Z=Z+1;F[Z]=n[l];end;U,h=t(n[V](i(F,1,h-V)));h=V+l[4]-2;Z=0;for l=V,h do Z=Z+1;n[l]=U[Z];end;o=h;e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=a[l[3]];else local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];local i=n[l[3]];n[t+1]=i;n[t]=i[a[l[4]]];if t+1>o then o=t+1 end;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];end;elseif c<=58 then local f=l[2];if f>o then o=f end;n[f]=n[l[3]]/a[l[4]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]]-n[l[4]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local V;local Z=l[2];local h={};local a=0;local f=Z+l[3]-1;for l=Z+1,f do a=a+1;h[a]=n[l];end;V,f=t(n[Z](i(h,1,f-Z)));f=Z+l[4]-2;a=0;for l=Z,f do a=a+1;n[l]=V[a];end;o=f;e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]]*n[l[4]];elseif c>59 then for l=l[2],l[3]do n[l]=nil;end;else if(n[l[3]]<a[l[4]])then e=e+1;end;end;elseif c<=66 then if c<=63 then if c<=61 then local d;local c=l[2];local f={};local e=0;local a=c+l[3]-1;for l=c+1,a do e=e+1;f[e]=n[l];end;d,a=t(n[c](i(f,1,a-c)));a=c+l[4]-2;e=0;for l=c,a do e=e+1;n[l]=d[e];end;o=a;elseif c>62 then local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=a[l[3]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else Z[l[3]]=n[l[2]];end;elseif c<=64 then local i=S[l[3]];local h;if i[5]~=0 then local l={};h=Y({},{__index=function(n,e)local l=l[e];return l[1][l[2]];end,__newindex=function(o,n,e)local l=l[n]l[1][l[2]]=e;end;});for o=1,i[5]do e=e+1;local e=d[e];if e[1]==93 then l[o-1]={n,e[3]};else l[o-1]={Z,e[3]};end;U[#U+1]=l;end;end;local t=l[2];if t>o then o=t end;n[t]=N(i,h,f);e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=a[l[3]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=(l[3]~=0);e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=f[a[l[3]]];elseif c>65 then local h;local Z=l[2];local V={};local f=0;local a=Z+l[3]-1;for l=Z+1,a do f=f+1;V[f]=n[l];end;h,a=t(n[Z](i(V,1,a-Z)));a=a+Z-1;f=0;for l=Z,a do f=f+1;n[l]=h[f];end;o=a;e=e+1;l=d[e];c=l[1];local d;local a=l[2];local f={};local e=0;local c=o;for l=a+1,c do e=e+1;f[e]=n[l];end;d,c=t(n[a](i(f,1,c-a)));c=a+l[4]-2;e=0;for l=a,c do e=e+1;n[l]=d[e];end;o=c;else local l=l[2];n[l]();o=l-1;end;elseif c<=69 then if c<=67 then local e=l[2];if e>o then o=e end;n[e]=(l[3]~=0);elseif c>68 then local o=l[2];local c=l[4];local l=o+2;local a={n[o](n[o+1],n[l])};for e=1,c do n[l+e]=a[e];end;local o=n[o+3];if o then n[l]=o else e=e+1;end;else f[a[l[3]]]=n[l[2]];end;elseif c<=71 then if c>70 then local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=a[l[3]];else n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=f[a[l[3]]];end;elseif c>72 then local e=l[2];if e>o then o=e end;n[e]=a[l[3]];else local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=a[l[3]];end;elseif c<=85 then if c<=79 then if c<=76 then if c<=74 then local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];local t=n[l[3]];n[f+1]=t;n[f]=t[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>75 then local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else local e=l[2];if e>o then o=e end;n[e]=n[l[3]]-n[l[4]];end;elseif c<=77 then local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>78 then local U;local h=l[2];local F={};local Z=0;local V=h+l[3]-1;for l=h+1,V do Z=Z+1;F[Z]=n[l];end;U,V=t(n[h](i(F,1,V-h)));V=h+l[4]-2;Z=0;for l=h,V do Z=Z+1;n[l]=U[Z];end;o=V;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]]/a[l[4]];else local e=l[2];if e>o then o=e end;n[e]=n[l[3]]+a[l[4]];end;elseif c<=82 then if c<=80 then local e=l[2];if e>o then o=e end;n[e]=n[l[3]]%a[l[4]];elseif c>81 then local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];n[l[2]][a[l[3]]]=n[l[4]];else local e=l[2];if e>o then o=e end;n[e]=n[l[3]]*n[l[4]];end;elseif c<=83 then n[l[2]][a[l[3]]]=n[l[4]];elseif c>84 then local t=l[2];local i=n[l[3]];n[t+1]=i;n[t]=i[a[l[4]]];if t+1>o then o=t+1 end;e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=Z[l[3]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else if not n[l[2]]then e=e+1;end;end;elseif c<=91 then if c<=88 then if c<=86 then local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local f;local c=l[2];local d={};local e=0;local a=c+l[3]-1;for l=c+1,a do e=e+1;d[e]=n[l];end;f,a=t(n[c](i(d,1,a-c)));a=c+l[4]-2;e=0;for l=c,a do e=e+1;n[l]=f[e];end;o=a;elseif c>87 then local f;local a=l[2];local d={};local e=0;local c=o;for l=a+1,c do e=e+1;d[e]=n[l];end;f,c=t(n[a](i(d,1,c-a)));c=a+l[4]-2;e=0;for l=a,c do e=e+1;n[l]=f[e];end;o=c;else local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=a[l[3]];e=e+1;l=d[e];c=l[1];local d;local a=l[2];local f={};local e=0;local c=a+l[3]-1;for l=a+1,c do e=e+1;f[e]=n[l];end;d,c=t(n[a](i(f,1,c-a)));c=a+l[4]-2;e=0;for l=a,c do e=e+1;n[l]=d[e];end;o=c;end;elseif c<=89 then local t=l[2];if t>o then o=t end;n[t]=Z[l[3]];e=e+1;l=d[e];c=l[1];f[a[l[3]]]=n[l[2]];e=e+1;l=d[e];c=l[1];local t=l[2];if t>o then o=t end;n[t]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];elseif c>90 then local c=l[3];local e=n[c]for l=c+1,l[4]do e=e..n[l];end;local l=l[2];if l>o then o=l end;n[l]=e;else do return end;end;elseif c<=94 then if c<=92 then if(a[l[3]]<n[l[4]])then e=e+1;end;elseif c>93 then local e=l[2];if e>o then o=e end;n[e]=n[l[3]]*a[l[4]];else local e=l[2];if e>o then o=e end;n[e]=n[l[3]];end;elseif c<=96 then if c>95 then local f=l[2];local Z=n[l[3]];n[f+1]=Z;n[f]=Z[a[l[4]]];if f+1>o then o=f+1 end;e=e+1;l=d[e];c=l[1];local d;local a=l[2];local f={};local e=0;local c=a+l[3]-1;for l=a+1,c do e=e+1;f[e]=n[l];end;d,c=t(n[a](i(f,1,c-a)));c=a+l[4]-2;e=0;for l=a,c do e=e+1;n[l]=d[e];end;o=c;else local d;local c=l[2];local a={};local e=0;local l=c+l[3]-1;for l=c+1,l do e=e+1;a[e]=n[l];end;d,l=t(n[c](i(a,1,l-c)));l=l+c-1;e=0;for l=c,l do e=e+1;n[l]=d[e];end;o=l;end;elseif c>97 then local f=l[2];if f>o then o=f end;n[f]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=Z[l[3]];e=e+1;l=d[e];c=l[1];local f=l[2];if f>o then o=f end;n[f]=n[l[3]][n[l[4]]];e=e+1;l=d[e];c=l[1];local e=l[2];if e>o then o=e end;n[e]=n[l[3]][a[l[4]]];else local Z=l[2];if Z>o then o=Z end;n[Z]=n[l[3]][a[l[4]]];e=e+1;l=d[e];c=l[1];local Z=l[2];local h=n[l[3]];n[Z+1]=h;n[Z]=h[a[l[4]]];if Z+1>o then o=Z+1 end;e=e+1;l=d[e];c=l[1];local Z=l[2];if Z>o then o=Z end;n[Z]=f[a[l[3]]];e=e+1;l=d[e];c=l[1];local f;local c=l[2];local d={};local e=0;local a=c+l[3]-1;for l=c+1,a do e=e+1;d[e]=n[l];end;f,a=t(n[c](i(d,1,a-c)));a=c+l[4]-2;e=0;for l=c,a do e=e+1;n[l]=f[e];end;o=a;end;e=e+1;end;end;end;return N(S(),{},B())();
end)

Updates.Name = "Updates"
Updates.Parent = ScreenGui
Updates.BackgroundColor3 = Color3.new(0, 0, 1)
Updates.Position = UDim2.new(0.415689796, 0, 0.229083672, 0)
Updates.Size = UDim2.new(0, 187, 0, 272)
Updates.Active = true
Updates.Visible = false
Updates.Draggable = true

UpdatTopics.Name = "UpdatTopics"
UpdatTopics.Parent = Updates
UpdatTopics.BackgroundColor3 = Color3.new(0, 0, 0)
UpdatTopics.BorderSizePixel = 0
UpdatTopics.Size = UDim2.new(0, 187, 0, 33)
UpdatTopics.Font = Enum.Font.SciFi
UpdatTopics.Text = "Updates"
UpdatTopics.TextColor3 = Color3.new(1, 1, 1)
UpdatTopics.TextSize = 25
UpdatTopics.TextWrapped = true

Updt.Name = "Updt"
Updt.Parent = Updates
Updt.BackgroundColor3 = Color3.new(1, 1, 1)
Updt.BackgroundTransparency = 1
Updt.Position = UDim2.new(0, 0, 0.121323526, 0)
Updt.Size = UDim2.new(0, 187, 0, 239)
Updt.Font = Enum.Font.SciFi
Updt.Text = "ComingSoon"
Updt.TextColor3 = Color3.new(0, 0, 0)
Updt.TextScaled = true
Updt.TextSize = 14
Updt.TextWrapped = true

ExitUpdates.Name = "ExitUpdates"
ExitUpdates.Parent = Updates
ExitUpdates.BackgroundColor3 = Color3.new(0, 0, 0)
ExitUpdates.BorderSizePixel = 0
ExitUpdates.Position = UDim2.new(0.882352948, 0, 0.0220588241, 0)
ExitUpdates.Size = UDim2.new(0, 22, 0, 19)
ExitUpdates.Font = Enum.Font.SciFi
ExitUpdates.Text = "X"
ExitUpdates.TextColor3 = Color3.new(1, 0, 0)
ExitUpdates.TextSize = 14
ExitUpdates.MouseButton1Down:connect(function()
	Main.Visible = true
	Updates.Visible = false
end)

Credits.Name = "Credits"
Credits.Parent = ScreenGui
Credits.BackgroundColor3 = Color3.new(0, 0, 1)
Credits.Position = UDim2.new(0.415689796, 0, 0.229083672, 0)
Credits.Size = UDim2.new(0, 187, 0, 272)
Credits.Active = true
Credits.Visible = false
Credits.Draggable = true

CrdTop.Name = "CrdTop"
CrdTop.Parent = Credits
CrdTop.BackgroundColor3 = Color3.new(0, 0, 0)
CrdTop.BorderSizePixel = 0
CrdTop.Size = UDim2.new(0, 187, 0, 33)
CrdTop.Font = Enum.Font.SciFi
CrdTop.Text = "Info"
CrdTop.TextColor3 = Color3.new(1, 1, 1)
CrdTop.TextSize = 25
CrdTop.TextWrapped = true

Roblox.Name = "Roblox"
Roblox.Parent = Credits
Roblox.BackgroundColor3 = Color3.new(1, 1, 1)
Roblox.BackgroundTransparency = 1
Roblox.Position = UDim2.new(0, 0, 0.246323526, 0)
Roblox.Size = UDim2.new(0, 187, 0, 50)
Roblox.Font = Enum.Font.SciFi
Roblox.Text = "Roblox: FullinstaYt"
Roblox.TextColor3 = Color3.new(1, 1, 1)
Roblox.TextSize = 22

Youtube.Name = "Youtube"
Youtube.Parent = Credits
Youtube.BackgroundColor3 = Color3.new(1, 1, 1)
Youtube.BackgroundTransparency = 1
Youtube.Position = UDim2.new(0, 0, 0.430147052, 0)
Youtube.Size = UDim2.new(0, 187, 0, 50)
Youtube.Font = Enum.Font.SciFi
Youtube.Text = "Youtube: Sky Hacks"
Youtube.TextColor3 = Color3.new(1, 1, 1)
Youtube.TextSize = 22

ExitCredits.Name = "ExitCredits"
ExitCredits.Parent = Credits
ExitCredits.BackgroundColor3 = Color3.new(0, 0, 0)
ExitCredits.BorderSizePixel = 0
ExitCredits.Position = UDim2.new(0.882352948, 0, 0.0220588241, 0)
ExitCredits.Size = UDim2.new(0, 22, 0, 19)
ExitCredits.Font = Enum.Font.SciFi
ExitCredits.Text = "X"
ExitCredits.TextColor3 = Color3.new(1, 0, 0)
ExitCredits.TextSize = 14
ExitCredits.MouseButton1Down:connect(function()
	Main.Visible = true
	Credits.Visible = false
end)

Teleports2.Name = "Teleports2"
Teleports2.Parent = ScreenGui
Teleports2.BackgroundColor3 = Color3.new(0, 0, 1)
Teleports2.Position = UDim2.new(0.415689796, 0, 0.229083672, 0)
Teleports2.Size = UDim2.new(0, 187, 0, 272)
Teleports2.Active = true
Teleports2.Visible = false
Teleports2.Draggable = true

Tlprt2Topic.Name = "Tlprt2Topic"
Tlprt2Topic.Parent = Teleports2
Tlprt2Topic.BackgroundColor3 = Color3.new(0, 0, 0)
Tlprt2Topic.BorderSizePixel = 0
Tlprt2Topic.Size = UDim2.new(0, 187, 0, 33)
Tlprt2Topic.Font = Enum.Font.SciFi
Tlprt2Topic.Text = "Teleports"
Tlprt2Topic.TextColor3 = Color3.new(1, 1, 1)
Tlprt2Topic.TextSize = 25
Tlprt2Topic.TextWrapped = true

WoodRUS.Name = "WoodRUS"
WoodRUS.Parent = Teleports2
WoodRUS.BackgroundColor3 = Color3.new(0, 0, 0)
WoodRUS.BorderColor3 = Color3.new(1, 1, 1)
WoodRUS.Position = UDim2.new(0.0481283441, 0, 0.150735289, 0)
WoodRUS.Size = UDim2.new(0, 172, 0, 16)
WoodRUS.Font = Enum.Font.SciFi
WoodRUS.Text = "WoodRUS"
WoodRUS.TextColor3 = Color3.new(1, 1, 1)
WoodRUS.TextSize = 22
WoodRUS.TextWrapped = true
WoodRUS.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(265,3,57))
end)

Endtimes.Name = "Endtimes"
Endtimes.Parent = Teleports2
Endtimes.BackgroundColor3 = Color3.new(0, 0, 0)
Endtimes.BorderColor3 = Color3.new(1, 1, 1)
Endtimes.Position = UDim2.new(0.0481283441, 0, 0.231617659, 0)
Endtimes.Size = UDim2.new(0, 172, 0, 16)
Endtimes.Font = Enum.Font.SciFi
Endtimes.Text = "EndTimes"
Endtimes.TextColor3 = Color3.new(1, 1, 1)
Endtimes.TextSize = 22
Endtimes.TextWrapped = true
Endtimes.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(113, -214, -951))
end)

BobShack.Name = "BobShack"
BobShack.Parent = Teleports2
BobShack.BackgroundColor3 = Color3.new(0, 0, 0)
BobShack.BorderColor3 = Color3.new(1, 1, 1)
BobShack.Position = UDim2.new(0.0481283441, 0, 0.316176474, 0)
BobShack.Size = UDim2.new(0, 172, 0, 16)
BobShack.Font = Enum.Font.SciFi
BobShack.Text = "BobShack"
BobShack.TextColor3 = Color3.new(1, 1, 1)
BobShack.TextSize = 22
BobShack.TextWrapped = true
BobShack.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(260, 8, -2542))
end)

TpPlpt.Name = "TpPlpt"
TpPlpt.Parent = Teleports2
TpPlpt.BackgroundColor3 = Color3.new(0, 0, 0)
TpPlpt.BorderColor3 = Color3.new(1, 1, 1)
TpPlpt.Position = UDim2.new(0.0481283441, 0, 0.400735289, 0)
TpPlpt.Size = UDim2.new(0, 172, 0, 16)
TpPlpt.Font = Enum.Font.SciFi
TpPlpt.Text = "TpPlot"
TpPlpt.TextColor3 = Color3.new(1, 1, 1)
TpPlpt.TextSize = 22
TpPlpt.TextWrapped = true
TpPlpt.MouseButton1Down:connect(function()
	for acc,bcc in
pairs(game.Workspace.Properties:GetChildren())do
if bcc.Owner.Value==game.Players.LocalPlayer then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
bcc.OriginSquare.CFrame+Vector3.new(0,10,0)end end 
end)

_1page.Name = "1.page"
_1page.Parent = Teleports2
_1page.BackgroundColor3 = Color3.new(0, 0, 1)
_1page.BorderSizePixel = 3
_1page.Position = UDim2.new(0.385026753, 0, 0.933823526, 0)
_1page.Size = UDim2.new(0, 46, 0, 12)
_1page.Font = Enum.Font.SciFi
_1page.Text = "1"
_1page.TextColor3 = Color3.new(1, 1, 1)
_1page.TextSize = 14
_1page.MouseButton1Down:connect(function()
	Teleports2.Visible = false
	Teleports.Visible = true
end)
-- Scripts:
