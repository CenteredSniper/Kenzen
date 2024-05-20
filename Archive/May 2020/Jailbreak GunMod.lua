--[[ // METADATA

Last Modified: 5/15/2020 5:02AM
Author: ???

--]]

local ItemConfig = game:GetService("ReplicatedStorage").Game.ItemConfig

for i, v in pairs(ItemConfig:GetChildren()) do
  local Stats = require(v)
   if v.Name == "PlasmaPistol" then
      Stats.MagSize = 0
      Stats.FireFreq = 1000
      Stats.CamShakeMagnitude = 0
      Stats.ReloadTime = 0
      Stats.FireAuto = true
   elseif v.Name == "RocketLauncher" then
    Stats.Radius = math.huge
    Stats.ReloadTime = 0
    Stats.FireFreq = 9999999999999999999
    Stats.FireAuto = true
   elseif v.Name == "Grenade" then
    Stats.FireAuto = true
    Stats.FireFreq = 1000
       Stats.AmmoCurrent = math.huge
       Stats.ReloadTime = 0
       Stats.FuseTime = 10
   elseif v.Name == "Turret" then
      Stats.MaxHeat = math.huge
   else
    Stats.ReloadTime = 0
       Stats.MagSize = math.huge
       Stats.FireAuto = true
       Stats.FireFreq = 9999999999999999999
       Stats.CamShakeMagnitude = 0
   end
end
