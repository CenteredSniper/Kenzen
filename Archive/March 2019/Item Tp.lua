--[[ // METADATA

Last Modified: 3/8/2019 6:22PM
Author: ???

--]]

--Teleport Item Script By KKOWN#2394 Version 0.0.2
--Functions
Item = "Raw Magnitite" -- ITEM NAME HERE
local player = game.Players.LocalPlayer.Character.HumanoidRootPart
-- HOW TO USE
-- 1. Type item name ^^^^ 2.press Excute 3.Press Mouse 1 Untill it fall down 4.Press F
if game.workspace:FindFirstChild(Item) then
  player.Position = workspace[Item].Position
  warn'Teleport script by KKOWN#2394'
else
warn'There is no item'
end
