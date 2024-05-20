--[[ // METADATA

Last Modified: 5/15/2020 4:55AM
Author: ???

--]]

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

local Head = "Necklace" --Put a hat name here that looks like a head or something idk xd
local x = 0   --Edit Position for head
local y = -0.45   --Edit Position for head x2
local z = 0 --Edit Position for head x3

local Hats = {rightarm = Character:WaitForChild("Hat1"),
             leftarm  = Character:WaitForChild("Pal Hair"),
             rightleg = Character:WaitForChild("LavanderHair"),
             leftleg  = Character:WaitForChild("Pink Hair"),
             torso1   = Character:WaitForChild("Robloxclassicred"),
             torso2   = Character:WaitForChild("Kate Hair"),
}
for i,v in next, Hats do
v.Handle.AccessoryWeld:Remove()
for _,mesh in next, v:GetDescendants() do
if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
mesh:Remove()
end
end
end
local Network = coroutine.create(function()
while true do
game:GetService("RunService").Heartbeat:Wait()
settings().Physics.AllowSleep = false
game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge
game:GetService("Players").LocalPlayer.SimulationRadius = math.pow(math.huge,math.huge)*math.huge
end
end)
coroutine.resume(Network)
loadstring(game:HttpGet("https://pastebin.com/raw/vdyu8Q5V",true))()
Character.Head.Transparency = 1
Character.Head.face:Remove()
Character.Torso.Transparency = 1
Character["Right Arm"].Transparency = 1
Character["Left Arm"].Transparency = 1
Character["Right Leg"].Transparency = 1
Character["Left Leg"].Transparency = 1
local function align(i,v)
local att0 = Instance.new("Attachment", i)
att0.Position = Vector3.new(0,0,0)
local att1 = Instance.new("Attachment", v)
att1.Position = Vector3.new(0,0,0)
local AP = Instance.new("AlignPosition", i)
AP.Attachment0 = att0
AP.Attachment1 = att1
AP.RigidityEnabled = false
AP.ReactionForceEnabled = false
AP.ApplyAtCenterOfMass = true
AP.MaxForce = 9999999
AP.MaxVelocity = math.huge
AP.Responsiveness = 200
local AO = Instance.new("AlignOrientation", i)
AO.Attachment0 = att0
AO.Attachment1 = att1
AO.ReactionTorqueEnabled = true
AO.PrimaryAxisOnly = false
AO.MaxTorque = 9999999
AO.MaxAngularVelocity = math.huge
AO.Responsiveness = 200
end
align(Hats.torso1.Handle, Character.Torso)
align(Hats.torso2.Handle, Character.Torso)
align(Hats.rightarm.Handle, Character["Right Arm"])
align(Hats.leftarm.Handle, Character["Left Arm"])
align(Hats.rightleg.Handle, Character["Right Leg"])
align(Hats.leftleg.Handle, Character["Left Leg"])
Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,0)
Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,0)
Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)

Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment1"
Character:WaitForChild("Torso").Attachment.Position = Vector3.new(0.5,0,0)
Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-0.5,0,0)

Character:WaitForChild(Head).Handle.AccessoryWeld:Remove()
--Character:WaitForChild(Head).Handle.Mesh:Remove()
local alignpos = Instance.new("AlignPosition", Character)
local alignorien = Instance.new("AlignOrientation", Character)
local att1 = Instance.new("Attachment", Character:WaitForChild(Head).Handle)
local att2 = Instance.new("Attachment", Character:WaitForChild("Head"))
alignpos.Attachment0 = att1
alignpos.Attachment1 = att2
alignpos.RigidityEnabled = false
alignpos.ReactionForceEnabled = false
alignpos.ApplyAtCenterOfMass = true
alignpos.MaxForce = 10000000
alignpos.MaxVelocity = math.huge
alignpos.Responsiveness = 200
alignorien.Attachment0 = att1
alignorien.Attachment1 = att2
alignorien.ReactionTorqueEnabled = true
alignorien.PrimaryAxisOnly = false
alignorien.MaxTorque = 10000000
alignorien.MaxAngularVelocity = math.huge
alignorien.Responsiveness = 200
att2.Position = Vector3.new(x,y,z)
