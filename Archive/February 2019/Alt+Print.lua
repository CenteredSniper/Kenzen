--[[ // METADATA

Last Modified: 2/17/2019 12:59PM
Author: ???

--]]

local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftAlt) then return end
if not Mouse.Target then return end
print(Mouse.Target)
end)
