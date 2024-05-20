--[[ // METADATA

Last Modified: 8/17/2020 5:03PM
Author: ???

--]]

warn("Executed Anti-AFK")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	warn("Player idled, spoofing activity.")
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
