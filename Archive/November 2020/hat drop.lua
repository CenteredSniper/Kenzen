--[[ // METADATA

Last Modified: 11/13/2020 5:36AM
Author: ???

--]]

    local SetSimulationRadius = setsimulationradius
    game.RunService.Stepped:Connect(function()
        game.Players.LocalPlayer.MaximumSimulationRadius = math.huge;
        SetSimulationRadius(math.huge, math.huge)
    end)
    _G.ScriptToggle = true
game:GetService("UserInputService").InputBegan:Connect(function(Input,P)
    if Input.KeyCode == Enum.KeyCode.Equals and _G.ScriptToggle then 
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Accessory") then
                v.Parent = workspace
                wait(0.04)
            end
		end
	end
end)
