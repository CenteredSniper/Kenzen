--[[ // METADATA

Last Modified: 7/22/2021 3:29PM
Author: ???

--]]

local song = Instance.new("Sound",workspace)
song.SoundId = "rbxassetid://7090296295"
song.Volume = 2
local function playsong(msg)
    if msg == "DESTROY MARIO" then
        if song.IsPlaying then
            song:Stop()
        end
        song:Play()
    end
end

game.Players.PlayerAdded:Connect(function(v)
    v.Chatted:Connect(function(msg)
        playsong(msg)
    end)
end)

for i,v in pairs(game.Players:GetPlayers()) do
    v.Chatted:Connect(function(msg)
        playsong(msg)
    end)
end
