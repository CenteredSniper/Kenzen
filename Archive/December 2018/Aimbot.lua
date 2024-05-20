--[[ // METADATA

Last Modified: 12/30/2018 10:44PM
Author: ???

--]]

local plrs    = game:GetService("Players")
local plr     = plrs.LocalPlayer
repeat wait() until plr.Character
local char    = plr.Character
local cam     = workspace.CurrentCamera
local mse     = plr:GetMouse()
local toggled = false
local maxDist = 300

--// CONFIGS ///////////////
    local key    = "q"  --//
    local Update = 0.01  --//    
--//////////////////////////

function rayCheck(plrName)
   local ray = Ray.new(cam.CFrame.p, (plrs[plrName].Character["Head"].Position - cam.CFrame.p).unit*999)
   local hit,pos=workspace:FindPartOnRay(ray, plr.Character)
   if hit and hit.Parent.Name == plrName then
      return true
   end
end

function findNearest()
   local nearest = math.huge
   local cPlr    = ""
   for i,v in pairs(game:GetService("Players"):GetChildren()) do
      local head = v.Character:FindFirstChild("Head")
      if head and v.Name ~= plr.Name then
      local dist = (head.Position - plr.Character.Head.Position).magnitude
         if plr.TeamColor == v.TeamColor == false and dist < nearest and rayCheck(v.Name) and v.Character:FindFirstChild("Humanoid").Health > 0 then
                cPlr    = v.Name
                nearest = dist
            end
        end
   end
   return cPlr
end

function aimAt(playerName)
    if playerName == "" then return end
    local target = game:GetService("Players")[playerName].Character.Head.Position
    cam.CFrame = CFrame.new(cam.CFrame.p, target)
end

mse.KeyDown:connect(function(k)
    if k == key then
        toggled = not toggled
        if toggled then
            while wait(Update) and toggled do
                pcall(function()
                aimAt(findNearest())
                end)
            end
        else 
            return
        end
    end
end)

print('AIMBOT LOADED.')
