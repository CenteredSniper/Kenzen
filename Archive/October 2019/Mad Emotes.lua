--[[ // METADATA

Last Modified: 10/14/2019 6:25PM
Author: ???

Notes: is this clickbait? wtf?

--]]

game.Players.LocalPlayer.Name = "nic10telf"
game.Players.LocalPlayer.Character.Head:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.Changed:connect(function ()
game.Players.LocalPlayer.Name = "nic10telf"
print(game.Players.LocalPlayer.Name)
end)
