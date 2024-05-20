--[[ // METADATA

Last Modified: 12/29/2021 6:46AM
Author: ???

--]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacker1337/legohacks/main/PhysicsServiceOnClient.lua"))()
local physics = game:GetService("PhysicsService")
local mathrand = tostring(math.random(1,1000000))
local check; pcall(function() check = physics:GetCollisionGroupId("Clone") end)
if not check then physics:CreateCollisionGroup("Clone") end
physics:CollisionGroupSetCollidable("Clone", "Clone", false)
game.Players.LocalPlayer.Character.Archivable = true
local clone = game.Players.LocalPlayer.Character:Clone()
game.Players.LocalPlayer.Character.Archivable = false
clone.Parent = workspace
clone.Name = "ServerViewClone"
for i,v in pairs(clone:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Anchored = true
		v.Material = Enum.Material.ForceField
		physics:SetPartCollisionGroup(v, "Clone")
	end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
	if v:IsA("BasePart") then
		physics:SetPartCollisionGroup(v, "Clone")
	end
end
game.Players.LocalPlayer.CharacterAdded:Connect(function(chara)
    wait()
    for i,v in pairs(chara:GetDescendants()) do
	if v:IsA("BasePart") then
		physics:SetPartCollisionGroup(v, "Clone")
	end
end
chara.DescendantAdded:Connect(function(v)
    if v:IsA("BasePart") then
		physics:SetPartCollisionGroup(v, "Clone")
	end
end)
end)
while clone do
    spawn(function()
    local tabler = {}
    for i,v in pairs(clone:GetChildren()) do
        if game.Players.LocalPlayer.Character:FindFirstChild(v.Name) then
            if v:IsA("BasePart") then
		    	--v.CFrame = game.Players.LocalPlayer.Character:FindFirstChild(v.Name).CFrame
		    	table.insert(tabler,{v,game.Players.LocalPlayer.Character:FindFirstChild(v.Name).CFrame})
		    elseif v:IsA("Tool") or v:IsA("Accessory")  then
		    	--v.Handle.CFrame = game.Players.LocalPlayer.Character:FindFirstChild(v.Name).Handle.CFrame
		    	table.insert(tabler,{v.Handle,game.Players.LocalPlayer.Character:FindFirstChild(v.Name).Handle.CFrame})
		    end
        end
	end
    wait(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()/500)
    for i,v in pairs(tabler) do
        v[1].CFrame = v[2]
    end
    end)
    wait()
end
