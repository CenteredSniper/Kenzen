local function check4property(obj, prop)
    return ({pcall(function()if(typeof(obj[prop])=="Instance")then error()end end)})[1]
end
local model = Instance.new("Model",workspace)
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Part") then
        local a = v:Clone()
        a.Parent = model
        a.Anchored = true
        a.Transparency = 0.5
    elseif v:IsA("Accessory") then
        local a = v:Clone()
        a.Parent = model
        a.Handle.Anchored = true
        a.Handle.Transparency = 0.5
    elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Bodycolors") then
        v:Clone().Parent = model
    end
end
for i,v in pairs(model:GetChildren()) do
    for _,g in pairs(v:GetChildren()) do
            if g:IsA("Motor6D") then
                local b = g.Part0
                local c = g.Part1
                g.Part0 = model:FindFirstChild(b.Name)
                g.Part1 = model:FindFirstChild(c.Name)
            elseif g.Parent:IsA("Accessory") then
                g.AccessoryWeld.Part1 = model:FindFirstChild(g.AccessoryWeld.Part1.Name)
            end
            if check4property(g, "Anchored") then g.Anchored = false end
        end
--    if v.Name ~= "HumanoidRootPart" then
       if check4property(v, "Anchored") then v.Anchored = false end
       if v.Name == "HumanoidRootPart" then v.Transparency = 1 end
--    end
end

local hum = Instance.new("Humanoid",model)
local anim = Instance.new("Animation",hum)

return model
