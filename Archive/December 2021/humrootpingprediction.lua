--[[ // METADATA

Last Modified: 12/29/2021 6:45AM
Author: Me

--]]

local realplayer = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):Clone()
realplayer:ClearAllChildren()
realplayer.Anchored = true
realplayer.Parent = workspace
realplayer.CanCollide = false
local selection = Instance.new("SelectionBox",realplayer)
selection.Adornee = realplayer; selection.Color3 = Color3.new(1,0,0)
game["Run Service"].Heartbeat:Connect(function(delta)
    local deserialized = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    wait(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()/500)
	realplayer.CFrame = deserialized
end)
