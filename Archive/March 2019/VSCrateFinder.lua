--[[ // METADATA

Last Modified: 3/4/2019 4:24PM
Author: ???

--]]

local crates = workspace:getChildren()
for i=1,#crates do
if crates[i].ClassName == "Model" then
local crates2 = crates[i]:getChildren()
for i=1,#crates2 do
if crates2[i].ClassName == "Model" then
local crates3 = crates2[i]:getChildren()
for i=1,#crates3 do
if crates3[i].ClassName == "MeshPart" then
if crates3[i]:findFirstChild("Smoke") then
wait(4)
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(crates3[i].Position.X+20,crates3[i].Position.Y,crates3[i].Position.Z))
wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(crates3[i].Position.X,crates3[i].Position.Y,crates3[i].Position.Z))
end
end
end
end
end
end
end
