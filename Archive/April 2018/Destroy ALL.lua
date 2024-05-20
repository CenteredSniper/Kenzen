--[[ // METADATA

Last Modified: 4/5/2018 4:02AM
Author: ???

--]]

for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name ~= game.Players.LocalPlayer.Name then
v:Destroy()
end
end
