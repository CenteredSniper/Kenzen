--[[ // METADATA

Last Modified: 11/13/2020 5:35AM
Author: Me

--]]

local function turnoffcollide(location,partstrue)
    for _,g in pairs(location:GetChildren()) do
        if partstrue then
            if g:IsA("Part") then
                g.CanCollide = false
            end
        end
        if g:IsA("Accessory") then
            g:WaitForChild("Handle").CanCollide = false
        end
    end
end
workspace.ChildAdded:Connect(function(v)
    if v:IsA("Accessory") then
        v.Handle.CanCollide = false
    end
end)
turnoffcollide(workspace,false)
game.Players.PlayerAdded:Connect(function(v)
    repeat wait(1) until v.Character ~= nil
            turnoffcollide(v.Character,true)
        v.CharacterAdded:Connect(function(g)
            repeat wait(1) until v.Character ~= nil
            turnoffcollide(v.Character,true)
        end)
end)
for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        turnoffcollide(v.Character,true)
        v.CharacterAdded:Connect(function(g)
            repeat wait(1) until v.Character ~= nil
            turnoffcollide(v.Character,true)
        end)
    end
end
