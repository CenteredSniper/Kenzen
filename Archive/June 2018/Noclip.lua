--[[ // METADATA

Last Modified: 6/25/2018 9:38PM
Author: ???

--]]

game:getService("RunService"):BindToRenderStep("",0,function()
if not game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid") then return end
if game:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V) then
game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
end
end)
