loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))()
if _G.Fling == nil then _G.Fling = false end
if _G.ShowReal == nil then _G.ShowReal = false end
if _G.GodMode == nil then _G.GodMode = true end
local PhysicsService = game:GetService("PhysicsService")
local check
pcall(function() check = PhysicsService:GetCollisionGroupId("NoCollide") end)
if not check then
    PhysicsService:CreateCollisionGroup("NoCollide")
end
PhysicsService:CollisionGroupSetCollidable("NoCollide", "NoCollide", false)

local plr = game.Players.LocalPlayer

plr.Character.Archivable = true
local Character = plr.Character:Clone()
plr.Character.Archivable = false
local originalrig = plr.Character
Character.Parent = workspace
Character.Name = "FakeBody"

for i,v in pairs(originalrig:GetDescendants()) do
    if v:IsA("Motor6D") and v.Name ~= "Neck" then v:Destroy()
    elseif v:IsA("BasePart") then
        local a = Instance.new("BodyVelocity",v)
    a.MaxForce = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.Velocity = Vector3.new(-25.05,-25.05,-25.05)
    local a = Instance.new("BodyAngularVelocity",v)
    a.MaxTorque = Vector3.new(math.huge,math.huge,math.huge); a.P = math.huge; a.AngularVelocity = Vector3.new(0,0,0)
    end
end

local invisrig = _G.ShowReal and Character or originalrig
for i,v in pairs(invisrig:GetChildren()) do
    if v:IsA("BasePart") then
        v.Transparency = 1
        local selectionbox = Instance.new("SelectionBox",v)
        selectionbox.Transparency = 1; selectionbox.Adornee = v;
    elseif v:IsA("Accessory") then
        v.Handle.Transparency = 1
    end
end

plr.Character.Parent = Character
plr.Character = Character
Character.Animate.Disabled = true; wait() Character.Animate.Disabled = false
workspace.CurrentCamera.CameraSubject = Character.Humanoid
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") then
        PhysicsService:SetPartCollisionGroup(v, "NoCollide")
    end
end

--originalrig.Torso.Neck.Parent = nil

game["Run Service"].RenderStepped:Connect(function(delta)
    for i,v in pairs(originalrig:GetChildren()) do
        coroutine.resume(coroutine.create(function()
            if v:IsA("BasePart") then
                v.Velocity = Vector3.new(-25.05, -25.05, -25.05)
                    if v.Name == "HumanoidRootPart" and _G.Fling then
                        --nothing
                    else
                        game:GetService("TweenService"):Create(v,TweenInfo.new((delta)),{CFrame = Character[v.Name].CFrame * CFrame.new(0.42,0.42,0.42)}):Play()
                    end
            elseif v:IsA("Accessory") then
                v.Handle.Velocity = Vector3.new(-25.05, -25.05, -25.05)
                game:GetService("TweenService"):Create(v.Handle,TweenInfo.new((delta)),{CFrame = Character[v.Name].Handle.CFrame * CFrame.new(0.42,0.42,0.42)}):Play()
            end
        end))
    end
end)

plr.Chatted:Connect(function(msg)
    if string.sub(msg,1,6) == "/parts" then
        for i,v in pairs(originalrig:GetChildren()) do
            if v:IsA("BasePart") then
                if v.SelectionBox.Transparency == 0 then v.SelectionBox.Transparency = 1 else
                    v.SelectionBox.Transparency = 0 end
            end
        end
    end
end)

Character.Humanoid.Died:Connect(function()
    plr.Character = originalrig
    originalrig:ClearAllChildren()
    originalrig.Parent = workspace
    Character:Destroy()
end)

if _G.GodMode then
wait(game.Players.RespawnTime + 1)
originalrig.Torso.Neck.Parent = nil
end
