--[[ // METADATA

Last Modified: 8/14/2020 6:59PM
Author: ???

--]]

--[[
   Original creator might be: not sure
   Edit by: dak#1111

   Made it less aids to read + some quality of life changes. :p
   (Who ever made this, for the love of god learn to not make spaghetti.)
--]]

-- Variables and setting up the character
local rs = game:GetService("RunService")

local plr  = game:GetService("Players").LocalPlayer
local char = plr.Character
char.Archivable = true
local cam  = workspace:WaitForChild("Camera")

local fakechar = char:Clone()
fakechar.Head.face.Texture = ""
fakechar.Parent = workspace
cam.CameraSubject = fakechar:FindFirstChildOfClass("Humanoid")

local connections = {}
local kill = false

-- Align function
local function Align(Part1, Part0, Position, Angle)
   Part1.CanCollide = false

   local AlignPos = Instance.new("AlignPosition")
   AlignPos.ApplyAtCenterOfMass = true
   AlignPos.MaxForce = 100000
   AlignPos.MaxVelocity = math.huge
   AlignPos.ReactionForceEnabled = false
   AlignPos.Responsiveness = 200
   AlignPos.RigidityEnabled = false
   AlignPos.Parent = Part1

   local AlignOri = Instance.new("AlignOrientation")
   AlignOri.MaxAngularVelocity = math.huge
   AlignOri.MaxTorque = 100000
   AlignOri.PrimaryAxisOnly = false
   AlignOri.ReactionTorqueEnabled = false
   AlignOri.Responsiveness = 200
   AlignOri.RigidityEnabled = false
   AlignOri.Parent = Part1

   local at1 = Instance.new("Attachment")
   at1.Parent = Part1
   local at2 = Instance.new("Attachment")
   at2.Parent = Part0
at2.Orientation = Angle
   at2.Position = Position
   
   AlignPos.Attachment0 = at1
   AlignPos.Attachment1 = at2
   AlignOri.Attachment0 = at1
   AlignOri.Attachment1 = at2
end

local success, fail = pcall(function()
   -- Make the fake character invisible
   for _,v in pairs(fakechar:GetDescendants()) do
       if v:IsA("Part") then
           v.Transparency = 1
       elseif v:IsA("SpecialMesh") then
           v.MeshId = "rbxassetid://0"
       end
   end

   -- Networking
   spawn(function()
       while rs.Stepped:wait() and not kill do
           settings().Physics.AllowSleep = false
           
           sethiddenproperty(plr, "MaximumSimulationRadius", math.pow(math.huge,math.huge) * math.huge)
           sethiddenproperty(plr, "SimulationRadius", math.pow(math.huge,math.huge) * math.huge)
       end
   end)
   
   -- Noclipping
   table.insert(connections, rs.Stepped:Connect(function()
       fakechar:FindFirstChild("Head").CanCollide = false
       fakechar:FindFirstChild("Torso").CanCollide = false
       char.Head.CanCollide = false
       char.Torso.CanCollide = false
   end))
   table.insert(connections, rs.Heartbeat:Connect(function()
       fakechar:FindFirstChild("Head").CanCollide = false
       fakechar:FindFirstChild("Torso").CanCollide = false
       char.Head.CanCollide = false
       char.Torso.CanCollide = false
   end))
   table.insert(connections, rs.RenderStepped:Connect(function()
       fakechar:FindFirstChild("Head").CanCollide = false
       fakechar:FindFirstChild("Torso").CanCollide = false
       char.Head.CanCollide = false
       char.Torso.CanCollide = false
   end))
   
   -- Rigging
   char.Torso["Right Shoulder"]:Destroy()
   char.Torso["Left Shoulder"]:Destroy()
   char.Torso["Right Hip"]:Destroy()
   char.Torso["Left Hip"]:Destroy()
   char.HumanoidRootPart["RootJoint"]:Destroy()
   char.HumanoidRootPart.Anchored = true
   char.Humanoid.PlatformStand = true
   fakechar["Torso"].Position = char["Torso"].Position

   -- Align
   for _,v in pairs(char:GetChildren()) do
       if v:IsA("Part") and v.Name ~= "Head" then
           if v.Name == "Torso" then
               Align(char[v.Name], fakechar[v.Name], Vector3.new(0,0.5,0),Vector3.new(0,0,0))
           else
               Align(char[v.Name], fakechar[v.Name], Vector3.new(0,0,0),Vector3.new(0,0,0))
           end
       end
   end
end)
if fail then
   warn(fail)
   plr.Character = char
   char:BreakJoints()
   fakechar:Destroy()

   kill = true
   return
end

-- Cleanup
fakechar.Humanoid.Died:Connect(function()
   plr.Character = char
   char:BreakJoints()
   fakechar:Destroy()

   kill = true

   for _,v in pairs(connections) do v:Disconnect() end
end)
char.Humanoid.Died:Connect(function()
   plr.Character = char
   char:BreakJoints()
   fakechar:Destroy()

   kill = true

   for _,v in pairs(connections) do v:Disconnect() end
end)

plr.Character = fakechar
