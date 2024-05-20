--[[ // METADATA

Last Modified: 6/29/2020 6:03PM
Author: K1LL0X

--]]

-- << K1LL0X >> --


local UIS = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()


function GetCharacter()
    return game.Players.LocalPlayer.Character
end

function Teleport(pos)
    local Char = GetCharacter()
    if Char then
        Char:MoveTo(pos)
    end
end


UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        Teleport(Mouse.Hit.p)
    end
end)
