--[[ // METADATA

Last Modified: 2/17/2020 8:37PM
Author: ???

--]]

local Vegie_IlIilII = Instance.new("ScreenGui")
local header010100 = Instance.new("TextLabel")
local status01100iliI = Instance.new("TextButton")
local bar0110 = Instance.new("Frame")
local Vegie_iIliIli = Instance.new("Frame")
local aimbot = Instance.new("TextButton")
local InfiniteJump = Instance.new("TextButton")
local ctrldel = Instance.new("TextButton")

Vegie_IlIilII.Name = "Vegie_IlIilII"
Vegie_IlIilII.Parent = game.CoreGui
Vegie_IlIilII.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

header010100.Name = "header010100"
header010100.Parent = Vegie_IlIilII
header010100.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
header010100.BorderColor3 = Color3.fromRGB(30, 30, 30)
header010100.BorderSizePixel = 0
header010100.Position = UDim2.new(0.41799438, 0, 0.143327847, 0)
header010100.Size = UDim2.new(0, 175, 0, 24)
header010100.Font = Enum.Font.Code
header010100.Text = "Vegie Essentials"
header010100.TextColor3 = Color3.fromRGB(255, 255, 255)
header010100.TextSize = 16.000

status01100iliI.Name = "status01100iliI"
status01100iliI.Parent = header010100
status01100iliI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
status01100iliI.BackgroundTransparency = 1.000
status01100iliI.BorderSizePixel = 0
status01100iliI.Position = UDim2.new(0.857142866, 0, 0, 0)
status01100iliI.Size = UDim2.new(0, 25, 0, 24)
status01100iliI.Font = Enum.Font.SourceSans
status01100iliI.Text = "-"
status01100iliI.TextColor3 = Color3.fromRGB(255, 255, 255)
status01100iliI.TextScaled = true
status01100iliI.TextSize = 21.000
status01100iliI.TextWrapped = true
status01100iliI.TextYAlignment = Enum.TextYAlignment.Top

bar0110.Name = "bar0110"
bar0110.Parent = header010100
bar0110.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
bar0110.BorderSizePixel = 0
bar0110.Position = UDim2.new(0, 0, 0.98678863, 0)
bar0110.Size = UDim2.new(0, 175, 0, 2)

Vegie_iIliIli.Name = "Vegie_iIliIli"
Vegie_iIliIli.Parent = bar0110
Vegie_iIliIli.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Vegie_iIliIli.BorderColor3 = Color3.fromRGB(30, 30, 30)
Vegie_iIliIli.BorderSizePixel = 0
Vegie_iIliIli.Position = UDim2.new(-0.0084026223, 0, 0.634765625, 0)
Vegie_iIliIli.Size = UDim2.new(0, 175, 0, 166)

aimbot.Name = "aimbot"
aimbot.Parent = bar0110
aimbot.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
aimbot.BorderColor3 = Color3.fromRGB(60, 60, 60)
aimbot.Position = UDim2.new(0.0685714483, 0, 9.23571777, 0)
aimbot.Size = UDim2.new(0, 150, 0, 26)
aimbot.Font = Enum.Font.Code
aimbot.Text = "Aimbot"
aimbot.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbot.TextSize = 18.000

InfiniteJump.Name = "InfiniteJump"
InfiniteJump.Parent = bar0110
InfiniteJump.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InfiniteJump.BorderColor3 = Color3.fromRGB(60, 60, 60)
InfiniteJump.Position = UDim2.new(0.0685714185, 0, 32.5857162, 0)
InfiniteJump.Size = UDim2.new(0, 150, 0, 26)
InfiniteJump.Font = Enum.Font.Code
InfiniteJump.Text = "Infinite Jump"
InfiniteJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJump.TextSize = 18.000

ctrldel.Name = "ctrldel"
ctrldel.Parent = bar0110
ctrldel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ctrldel.BorderColor3 = Color3.fromRGB(60, 60, 60)
ctrldel.Position = UDim2.new(0.0685714483, 0, 57.9071426, 0)
ctrldel.Size = UDim2.new(0, 150, 0, 26)
ctrldel.Font = Enum.Font.Code
ctrldel.Text = "CTRL+Del"
ctrldel.TextColor3 = Color3.fromRGB(255, 255, 255)
ctrldel.TextSize = 18.000

local function NKECF_fake_script() -- status01100iliI.LocalScript 
	local script = Instance.new('LocalScript', status01100iliI)

	print("By Your God Truly, Vegie#3295")
	
	local frame = script.Parent.Parent.bar0110.Vegie_iIliIli
	local button = script.Parent
	local bar = script.Parent.Parent.bar0110
	local visible = true
	
	script.Parent.Parent.Active = true;
	script.Parent.Parent.Draggable = true;
	
	button.MouseButton1Click:Connect(function()
		wait (0.1)
		if visible == true then
			frame.Parent.aimbot.Visible = false
			frame.Parent.InfiniteJump.Visible = false
			frame.Parent.ctrldel.Visible = false
			wait(0.1)
			frame:TweenSize(UDim2.new(0,175,0, 0), "Out", "Bounce", 0.2)
			bar.BackgroundColor3 = Color3.new(255, 0, 0)
			button.Text = "+"
			visible = false
		else if visible == false then
			frame:TweenSize(UDim2.new(0,175,0, 166), "Out", "Bounce", 0.2)
			bar.BackgroundColor3 = Color3.new(0, 255, 0)
			button.Text = "-"
			wait(0.1)
			frame.Parent.aimbot.Visible = true
			frame.Parent.InfiniteJump.Visible = true
			frame.Parent.ctrldel.Visible = true
			visible = true
		end
		end
	end)
	
end
coroutine.wrap(NKECF_fake_script)()

aimbot.MouseButton1Click:Connect(function()
	-- Gui to Lua
-- Version: 3

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0, 0, 0.876175702, 0)
Frame.Size = UDim2.new(0, 100, 0, 84)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.Size = UDim2.new(0, 100, 0, 34)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Press E To Lock-On"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 11

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.Position = UDim2.new(0, 0, 0.40476191, 0)
TextLabel_2.Size = UDim2.new(0, 100, 0, 25)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "Press T To Start ESP"
TextLabel_2.TextColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextSize = 11

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.Position = UDim2.new(0, 0, 0.702380955, 0)
TextLabel_3.Size = UDim2.new(0, 100, 0, 25)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Press L To Loop-ESP"
TextLabel_3.TextColor3 = Color3.new(0, 0, 0)
TextLabel_3.TextSize = 10
pcall(function()
local espcolor = Color3.fromRGB(140, 69, 102)
local wallhack_esp_transparency = .4
local gui_hide_button = {Enum.KeyCode.LeftControl, "h"}
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local TeamBased = true ; local teambasedswitch = "o"
local presskeytoaim = true; local aimkey = "e"
aimbothider = false; aimbothiderspeed = .5
local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "z"}
local espupdatetime = 5; autoesp = false; local charmsesp = true
local movementcounting = true




local mouselock = false
local canaimat = true
local lockaim = true; local lockangle = 5
local ver = "2.4"
local cam = game.Workspace.CurrentCamera
local BetterDeathCount = true
local ballisticsboost = 0

local mouse = lplr:GetMouse()
local switch = false
local key = "k"
local aimatpart = nil
local lightesp = false

local abs = math.abs

local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextBox")
local Name = Instance.new("TextLabel")
--Properties:

Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")


local aimbotstatus = {"qc", "qr", "qe", "qd", "qi", "qt", "qs", "dd", "sp", "ql", "qa", "qd", "qs"}
local gotstring = 0
local function getrandomstring()
    gotstring = gotstring+666
    local str = ""
    local randomstring = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "g", "k", "l", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
         "?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?", "`", "$", 
        "0","1","2","3","4","5","6","7","8","9", }
    local counting123 = 0
    for i, v in ipairs(randomstring) do
        counting123 = i
    end
    do
        math.randomseed(tick()+gotstring)
        for i = 3, math.random(1,100) do
                math.randomseed(i+tick()+gotstring)
                
                local oneortwo = math.random(1,2)
                if oneortwo == 2 then
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..randomstring[math.random(1, counting123)]
                else
                    math.randomseed(i+tick()+gotstring)
                    str = str..""..string.upper(randomstring[math.random(1, counting123)])
                end
            
        end
    end
    return str
end
local mousedown = false
local isonmovething = false
local mouseoffset = Vector2.new()
local mousedown = false
local bspeed = 3584
local aimbotoffset = {dd = ":", sp = " ", qa = "a", qb = "b",qc = "c", qd = "d", qe = "e", qf = "f", qg = "g" , qh = "h" , qi = "i", qj = "j", qk = "k", ql = "l", qm = "m", qn = "n", qo = "o", qp = "p", qq = "q", qr = "r", qs = "s", qt = "t", qu = "u", qv = "w", qx = "x", qy = "y", qz = "z"}



Gui.Name = getrandomstring()

Move.Name = getrandomstring()
Move.Draggable = true
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.0431373, 1, 0.0745098)
Move.BackgroundTransparency = 0.40000000596046
Move.BorderSizePixel = 0
Move.Position = UDim2.new(0.5, 0,0.018, 0)
Move.Size = UDim2.new(0, 320, 0, 30)

Move.MouseEnter:Connect(function()
    
    isonmovething = true
    
end)
Move.MouseLeave:Connect(function()
    
    isonmovething = mousedown and true or false
end)
mouse.Button1Down:connect(function()
    mousedown = true
    mouseoffset = Move.AbsolutePosition - Vector2.new(mouse.X, mouse.Y)
end)
mouse.Button1Up:connect(function()
    mousedown = false
end)

mouse.Move:Connect(function()
    if isonmovething == true and mousedown then
        Move.Position = UDim2.new(0, mouseoffset.X + mouse.X, 0, mouseoffset.Y + mouse.Y)
    end
end)
local function uc (st)
    local ast = ""
    for i, v in ipairs(st) do
        local let = aimbotoffset[v]
        ast = ast..let
    end
    return ast
end

Main.Name = getrandomstring()
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
Main.Position = UDim2.new(0, 0, 0.995670795, 0)
Main.Size = UDim2.new(1.0000006, 0, 11.2, 0)

st1.Name = getrandomstring()
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0, 0, 0, 0)
st1.Size = UDim2.new(1, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
st1.Text = uc(aimbotstatus)
st1.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1.TextScaled = true
st1.TextSize = 14
st1.TextWrapped = true

st1_2.Name = getrandomstring()
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0, 0, 0.375590861, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
st1_2.TextXAlignment = Enum.TextXAlignment.Left
st1_2.Text = "Current ballistics: 0"
st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_2.TextScaled = true
st1_2.TextSize = 14
st1_2.TextWrapped = true

local aimbothiderbox = Instance.new("TextBox")
aimbothiderbox.Name = getrandomstring()
aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
aimbothiderbox.Size = UDim2.new(1, 0,0.162, 0)
aimbothiderbox.TextScaled = true
aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
aimbothiderbox.Position = UDim2.new(0, 0,0.853, 0)
aimbothiderbox.BackgroundTransparency = 1
aimbothiderbox.Parent = Main

st1_3.Name = getrandomstring()
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0, 0, 0.18558608, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.ArialBold
st1_3.Text = "Bullet speed = 3584"
st1_3.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
st1_3.TextScaled = true
st1_3.TextSize = 14
st1_3.TextWrapped = true
local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = Main
teambasedstatus.TextScaled = true
teambasedstatus.Position = UDim2.new(0, 0,.7, 0)
teambasedstatus.Size = UDim2.new(1, 0,.1, 0)
teambasedstatus.Name = getrandomstring()
teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
local espstatustext = teambasedstatus:Clone()
espstatustext.Name = getrandomstring()
espstatustext.Position = UDim2.new(0, 0,0.58, 0)
espstatustext.Text = "Esp loop :"..tostring(autoesp)
espstatustext.Parent = Main
local hide = Instance.new("TextButton")
hide.Text = "_"
hide.BackgroundTransparency = 1
hide.TextScaled = true
hide.TextWrapped = true
hide.Size = UDim2.new(0.1, 0,1, 0)
hide.Position = UDim2.new(0.9, 0,-0.15, 0)
hide.Name = getrandomstring()
hide.Parent = Move
Name.Name = getrandomstring()
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(0.838, 0, 1, 0)
Name.Font = Enum.Font.Arial
Name.Text = "FPS gui v"..ver
Name.TextColor3 = Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
local scr = Instance.new("ScrollingFrame")
scr.Size = Main.Size
scr.Position = Main.Position
scr.ScrollBarThickness = 0
scr.BackgroundTransparency = 1
scr.Name = getrandomstring()
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Position = UDim2.new(0,0,0,0)
Main.Parent = scr
scr.Parent = Move
startpos = Main.Position
Move.Active = true
Move:Destroy()
-- Scripts:
hided = true
hide.MouseButton1Click:Connect(function()
    if hided == false then
        hided = true
        Main:TweenPosition(UDim2.new(0, 0, -1.5, 0))
    else
        hided = false
        Main:TweenPosition(startpos)
    end
end)


aimbothiderbox.FocusLost:Connect(function()
    local numb = tonumber(aimbothiderbox.Text)
    if aimbothider == true then
        aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
    else
        aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
    end
    if numb ~= nil then
        aimbothiderspeed = numb
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    else
        if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
    end
end)


local plrsforaim = {}


Move.Draggable = true
Gui.ResetOnSpawn = false
--Gui.Name = "Chat"
Gui.DisplayOrder = 999
pcall(function()
if not game:GetService("CoreGui") then
    Gui.Parent = plrs.LocalPlayer.PlayerGui
else
    Gui.Parent = game:GetService("CoreGui")
end
end)
local espheadthing
do
local BillboardGui = Instance.new("BillboardGui")
local PName = Instance.new("TextLabel")
local Pdist = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
--Properties:
--BillboardGui.Parent = game.Workspace.Part
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 0
BillboardGui.Size = UDim2.new(0, 100, 0, 46)
BillboardGui.Name = "headoverthing"
PName.Name = "PName"
PName.Parent = BillboardGui
PName.BackgroundColor3 = espcolor
PName.BackgroundTransparency = 0.55000001192093
PName.BorderSizePixel = 0
PName.Size = UDim2.new(0, 100, 0, 23)
PName.Font = Enum.Font.SourceSans
PName.Text = "urmom"
PName.TextColor3 = Color3.new(0, 0, 0)
PName.TextScaled = true
PName.TextSize = 14
PName.TextWrapped = true
st1.Text = uc(aimbotstatus)
Pdist.Name = "Pdist"
Pdist.Parent = BillboardGui
Pdist.AnchorPoint = Vector2.new(0.5, 0)
Pdist.BackgroundColor3 = espcolor
Pdist.BackgroundTransparency = 0.55000001192093
Pdist.BorderSizePixel = 0
Pdist.Position = UDim2.new(0.5, 0, 0.5, 0)
Pdist.Size = UDim2.new(0, 70, 0, 23)
Pdist.Font = Enum.Font.SourceSans
Pdist.Text = "666"
Pdist.TextColor3 = Color3.new(0, 0, 0)
Pdist.TextScaled = true
Pdist.TextSize = 14
Pdist.TextWrapped = true

ImageLabel.Parent = BillboardGui
ImageLabel.BackgroundColor3 = Color3.new(0.298039, 1, 0)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = espcolor
ImageLabel.Position = UDim2.new(1, -15, 0.5, 0)
ImageLabel.Rotation = 180
ImageLabel.Size = UDim2.new(0, 15, 0, 23)
ImageLabel.Image = "rbxassetid://2832171824"
ImageLabel.ImageColor3 = espcolor
ImageLabel.ImageTransparency = 0.55000001192093

ImageLabel_2.Parent = BillboardGui
ImageLabel_2.BackgroundColor3 = espcolor
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.new(0.298039, 1, 0)
ImageLabel_2.Position = UDim2.new(0, 0, 0.5, 0)
ImageLabel_2.Rotation = 180
ImageLabel_2.Size = UDim2.new(0, 15, 0, 23)
ImageLabel_2.Image = "rbxassetid://2832177613"
ImageLabel_2.ImageColor3 = espcolor
ImageLabel_2.ImageTransparency = 0.55000001192093
espheadthing = BillboardGui
end



f = {}
f.UpdateHeadUI = function(v)
    
        
            if v.Adornee and v.Adornee ~= nil then
                local destr = false
                if TeamBased then
                    destr = true
                    local plr = plrs:GetPlayerFromCharacter(v.Adornee.Parent)
                    if plr and plr.Team and plr.Team.Name ~= lplr.Team.Name then
                        destr = false
                    end
                end
                if lightesp == true then
                    v.Pdist.TextColor3 = Color3.new(1,1,1)
                    v.PName.TextColor3 = Color3.new(1,1,1)
                else
                    v.Pdist.TextColor3 = Color3.new(0,0,0)
                    v.PName.TextColor3 = Color3.new(0,0,0)
                end
                local d = math.floor((cam.CFrame.p - v.Adornee.CFrame.p).magnitude)
                v.Pdist.Text = tostring(d)
                if d < 14 then
                    v.Enabled = false
                else
                    v.Enabled = true
                end
                v.StudsOffset = Vector3.new(0,.6+d/14,0)
                if destr then
                    v:Destroy()
                end
            else
                v:Destroy()
            end
        
    
end
st1.Text = uc(aimbotstatus)
local espforlder
local partconverter = Instance.new("Part")
--local headsupdatelist = {}
st1_3.FocusLost:connect(function()
    if tonumber(st1_3.Text) then
        bspeed = tonumber(st1_3.Text)
    else
        
    end
end)
f.addesp = function()
    pcall(function()
    --print("ESP ran")
    if espforlder then
        espforlder:Destroy()
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    else
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    end
    for i, v in pairs(espforlder:GetChildren()) do
        v:Destroy()
    end
    for _, plr in pairs(plrs:GetChildren()) do
        if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
            if TeamBased == true then
                
                if plr.Team.Name ~= plrs.LocalPlayer.Team.Name  then
                    pcall(function()
                    local e = espforlder:FindFirstChild(plr.Name)
                    if not e then
                        local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = partconverter.Color
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        --table.insert(headsupdatelist, ht)
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        ht.Parent = p
                                    end
                                end
                                end
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                        
                    end
                    end)
                end
            else
                local e = espforlder:FindFirstChild(plr.Name)
                if not e then
                    local fold = Instance.new("Folder", espforlder)
                        fold.Name = plr.Name
                        
                        --partconverter.BrickColor = plr.Team.Color
                        --local teamc = Move.BackgroundColor3
                        for i, p in pairs(plr.Character:GetChildren()) do
                            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                                pcall(function()
                                if charmsesp then
                                local urmom = Instance.new("BoxHandleAdornment")
                                urmom.ZIndex = 10
                                urmom.AlwaysOnTop = true
                                urmom.Color3 = espcolor
                                urmom.Size = p.Size
                                urmom.Adornee = p
                                urmom.Name = tick().." Ur mom has big gay"
                                urmom.Transparency = wallhack_esp_transparency
                                urmom.Parent = fold
                                end
                                if p.Name == "Head" then
                                    local th = p:FindFirstChild("headoverthing")
                                    if not th then
                                        local ht = espheadthing:Clone()
                                        ht.PName.Text = p.Parent.Name
                                        ht.Adornee = p
                                        delay(0, function()
                                            while wait(0.08) and plr and p do
                                                f.UpdateHeadUI(ht)
                                            end
                                        end)
                                        --table.insert(headsupdatelist, ht)
                                        ht.Parent = p
                                    end
                                end
                                end)
                            end
                        end
                        plr.Character.Humanoid.Died:Connect(function()
                            fold:Destroy()
                        end)
                end
            end
            
            
        end
    end
    end)
end

local uis = game:GetService("UserInputService")
local bringall = false
local hided2 = false
local upping = false
local downing = false
mouse.KeyDown:Connect(function(a)
    
    if a == "t" then
        --print("worked1")
        f.addesp()
    elseif a == gui_hide_button[2] and uis:IsKeyDown(gui_hide_button[1]) then
        if hided2 == false then
            hided2 = true
            autoesp =false
            if espforlder then
                espforlder:Destroy()
            end
            Gui.Enabled = false
        else
            Gui.Enabled = true
            hided2 = false
        end
            
    elseif a == "" then
        if aimbothider == false then
            aimbothider = true
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        else
            
            aimbothider = false
            if aimbothider == true then
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." on"
        else
            aimbothiderbox.Text = "Speed :"..tostring(aimbothiderspeed).." off"
        end
        end
        if aimbothider == true then
            aimbothiderbox.TextColor3 =Color3.fromRGB(11, 255, 19)
        else
            aimbothiderbox.TextColor3 =Color3.fromRGB(255, 0, 0)
        end
    elseif a == "l" then
        if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
            if autoesp == false then
                autoesp = true
            else
                autoesp = false
            end
        else
            if lightesp == true then
                lightesp = false
            else
                lightesp = true
            end
        end
    elseif a == "]" then
        upping = true
        downing = false
    elseif a== "[" then
        downing = true
        upping = false
    elseif a == Aim_Assist_Key[2] and uis:IsKeyDown(Aim_Assist_Key[1]) then
        if Aim_Assist == true then
            Aim_Assist = false
            --print("disabled")
        else
            Aim_Assist = true
        end
    end
    if a == "j" then
        if mouse.Target then
            mouse.Target:Destroy()
        end
    end
    if a == key then
        if switch == false then
            switch = true
        else
            switch = false
            if aimatpart ~= nil then
                aimatpart = nil
            end
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and not uis:IsKeyDown(Enum.KeyCode.R) then
        if movementcounting then
            movementcounting = false
        else
            movementcounting = true
        end
    elseif a == teambasedswitch then
        if TeamBased == true then
            TeamBased = false
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        else
            TeamBased = true
            teambasedstatus.Text = "Team Based: "..tostring(TeamBased)
        end
    elseif a == "b" and uis:IsKeyDown(Enum.KeyCode.LeftControl) and uis:IsKeyDown(Enum.KeyCode.R) then
        ballisticsboost = 0
    elseif a == aimkey then
        if not aimatpart then
            local maxangle = math.rad(20)
            for i, plr in pairs(plrs:GetChildren()) do
                if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1 then
                    if TeamBased == true then
                        if plr.Team.Name ~= lplr.Team.Name then
                            local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                        end
                    else
                        local an = checkfov(plr.Character.Head)
                            if an < maxangle then
                                maxangle = an
                                aimatpart = plr.Character.Head
                            end
                            --print(plr)
                    end
                    local old = aimatpart
                    plr.Character.Humanoid.Died:Connect(function()
                        --print("died")
                        if aimatpart and aimatpart == old then
                            aimatpart = nil
                        end
                    end)
                    
                end
            end
        else
            aimatpart = nil
            canaimat = false
            delay(1.1, function()
                canaimat = true
            end)
        end
    end
end)

function getfovxyz (p0, p1, deg)
    local x1, y1, z1 = p0:ToOrientation()
    local cf = CFrame.new(p0.p, p1.p)
    local x2, y2, z2 = cf:ToOrientation()
    local d = math.deg
    if deg then
        return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
    else
        return Vector3.new((x1-x2), (y1-y2), (z1-z2))
    end
end


function aimat(part)
    if part then
        --print(part)
        local d = (cam.CFrame.p - part.CFrame.p).magnitude
        local calculatedrop
        local timetoaim = 0
        local pos2 = Vector3.new()
        if movementcounting == true then
            timetoaim = d/bspeed
            pos2 = part.Velocity * timetoaim
        end
        local minuseddrop = (ballisticsboost+50)/50
        if ballisticsboost ~= 0 then
            calculatedrop = d - (d/minuseddrop)
            
        else
            calculatedrop = 0
        end
        --print(calculatedrop)
        local addative = Vector3.new()
        if movementcounting then
            addative = pos2
        end
        local cf = CFrame.new(cam.CFrame.p, (addative + part.CFrame.p+ Vector3.new(0, calculatedrop, 0)))
        if aimbothider == true or Aim_Assist == true then
            cam.CFrame = cam.CFrame:Lerp(cf, aimbothiderspeed)
        else
            
            cam.CFrame = cf
        end
        --print(cf)
    end
end
function checkfov (part)
    local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
    local angle = math.abs(fov.X) + math.abs(fov.Y)
    return angle
end
pcall(function()
    delay(0, function()
        while wait(.32) do
            if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
                for i, plr in pairs(plrs:GetChildren()) do
                    
                    
                        local minangle = math.rad(5.5)
                        local lastpart = nil
                        local function gg(plr)
                            pcall(function()
                            if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
                                local raycasted = false
                                local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
                                local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
                                local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                                local dist = (plr.Character.Head.CFrame.p- pos).magnitude
                                if dist < 4 then
                                    raycasted = true
                                end
                                if raycasted == true then
                                    local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
                                    local an = abs(an1.X) + abs(an1.Y)
                                    if an < minangle then
                                        minangle = an
                                        lastpart = plr.Character.Head
                                    end
                                end
                            end
                            end)
                        end
                        if TeamBased then
                            if plr.Team.Name ~= lplr.Team.Name then
                                gg(plr)
                            end
                        else
                            gg(plr)
                        end
                        --print(math.deg(minangle))
                        if lastpart then
                            aimatpart = lastpart
                            aimatpart.Parent.Humanoid.Died:Connect(function()
                                if aimatpart == lastpart then
                                    aimatpart = nil
                                end
                            end)
                        
                    end
                end
            end
        end
    end)
end)
local oldheadpos
local lastaimapart
game:GetService("RunService").RenderStepped:Connect(function(dt)
    if uis:IsKeyDown(Enum.KeyCode.RightBracket) or uis:IsKeyDown(Enum.KeyCode.LeftBracket) then
        if upping then
            ballisticsboost = ballisticsboost + dt/1.9
        elseif downing then
            ballisticsboost = ballisticsboost - dt/1.9
        end
    end
    if movementcounting then
        st1_2.TextColor3 = Color3.new(0.0431373, 1, 0.0745098)
        st1_2.Text = "Current ballistics: "..tostring(math.floor(ballisticsboost*10)/10)
    else
        st1_2.TextColor3 = Color3.new(1,0,0)
    end
    espstatustext.Text = "Esp loop :"..tostring(autoesp)
    if aimatpart and lplr.Character and lplr.Character.Head then
        if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
            local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
            if dist > 40 then
                aimatpart = nil
            end
        end
        lastaimapart = aimatpart
        oldheadpos = lastaimapart.CFrame.p
        do 
            if aimatpart.Parent == plrs.LocalPlayer.Character then
                aimatpart = nil
            end
            aimat(aimatpart)
            pcall(function()
                if Aim_Assist == true then
                    local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
                    local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
                    local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
                    local dist = (aimatpart.CFrame.p- pos).magnitude
                    if obj then
                        --print(obj:GetFullName())
                    end
                    if not obj or dist > 6 then
                        aimatpart = nil
                        --print("ooof")
                    end
                    canaimat = false
                    delay(.5, function()
                        canaimat = true
                    end)
                end
            end)
        end
        
        
        
    end
end)


delay(0, function()
    while wait(espupdatetime) do
        if autoesp == true then
            pcall(function()
            f.addesp()
            end)
        end
    end
end)
--warn("loaded")
end)
end)

InfiniteJump.MouseButton1Click:Connect(function()
	local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)

ctrldel.MouseButton1Click:Connect(function()
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Mouse.Target:Destroy()
end)
end)
