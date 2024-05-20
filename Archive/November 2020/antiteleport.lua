--[[ // METADATA

Last Modified: 11/13/2020 5:37AM
Author: Me

--]]

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local HumPosition = Character:WaitForChild("HumanoidRootPart").Position
local LastPos = nil
local LastPosMagnitude = nil
local Pos = Character:WaitForChild("HumanoidRootPart").Position
local PlayHeartBeat = 1
local Switch = true
local Enabled = false
game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.R then
        if Switch then
            Enabled = true
            Switch = false
        else
            Enabled = false
            Switch = true
        end
    end 
end)
HearbeatRunning = game:GetService("RunService").Heartbeat:Connect(function()
    CFrameLast = CFramePos
    LastPos = Pos
    Pos = Character:WaitForChild("HumanoidRootPart").Position
    CFramePos = Character:WaitForChild("HumanoidRootPart").CFrame
    if Enabled == true then
        if PlayHeartBeat > 0 then
            PlayHeartBeat = PlayHeartBeat - 1
            LastPosMagnitude = (Pos - LastPos).Magnitude
            if LastPosMagnitude > 2 then
                PlayHeartBeat = PlayHeartBeat - 1
                Character:WaitForChild("HumanoidRootPart").CFrame = CFrameLast
            end
        end
        PlayHeartBeat = PlayHeartBeat + 1
    end
end)
