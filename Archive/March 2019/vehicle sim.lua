--[[ // METADATA

Last Modified: 3/2/2019 9:39AM
Author: ???

--]]

print("Commands for admin:")
print("/e maxspeed:(N) *Sets the maxspeed for your car to (N)")
print("/e torque:(N) *Sets the torque for your car to (N)")
print("/e toggle:infnitro *Toggles infinite nitro (Dont add any arguments it will toggle it on itsself according to the set bool)")
print("/e nitrospeed:(N) *Sets the nitro speed for your car to (N)")
print("/e nitroforce:(N) *Sets the nitro force for your car to (N)")
print("/e racingmode *Makes your car's setting fitted for winning almost any race!!!")
local plr = game.Players.LocalPlayer
local inftoggle = false
function getvehicle()
for i,v in pairs(game.Workspace.Vehicles:GetChildren()) do
if v:IsA("Model") then
if v.owner.Value == plr.Name then
return v
end
end
end
return nil
end
function hint(txt, t)
if t then
local h = Instance.new("Hint",plr.PlayerGui)
h.Text = txt
wait(t)
h:remove()
else
local h = Instance.new("Hint",plr.PlayerGui)
h.Text = txt
wait(2)
h:remove()
end
end

plr.Chatted:connect(function(msg)
if msg:lower():sub(1,10) == "/e toggle:" then
local ins = msg:lower():sub(11)
local vehicle = getvehicle()
if vehicle then
if ins == "infnitro" then
if inftoggle == true then
inftoggle = false
hint("(-)Disabled Infinite Nitro!(-)")
else
inftoggle = true
hint("(+)Enabled Infinite Nitro!(+)")
end
end
else
hint("(-)You do not have a vehicle spawned!(-)")
end
elseif msg:lower():sub(1,14) == "/e nitrospeed:" then
local num = msg:sub(15)
local vehicle = getvehicle()
if vehicle then
vehicle.Handling.Nitro.NitroSpeed.Value = tonumber(num)
else
hint("(-)You do not have a vehicle spawned!(-)")
end
elseif msg:lower():sub(1,14) == "/e nitroforce:" then
local num = msg:sub(1,15)
local vehicle = getvehicle()
if vehicle then
vehicle.Handling.Nitro.NitroForce.Value = tonumber(num)
else
hint("(-)You do not have a vehicle spawned!(-)")
end
elseif msg:lower():sub(1,12) == "/e maxspeed:" then
local num = msg:sub(13)
local vehicle = getvehicle()
if vehicle then
vehicle.Handling.MaxSpeed.Value = tonumber(num)
else
hint("(-)You do not have a vehicle spawned!(-)")
end
elseif msg:lower():sub(1,10) == "/e torque:" then
local num = msg:sub(11)
local vehicle = getvehicle()
if vehicle then
vehicle.Handling.Torque.Value = tonumber(num)
else
hint("(-)You do not have a vehicle spawned!(-)")
end
elseif msg:lower():sub(1,12) == "/e friction:" then
local num = msg:sub(13)
local vehicle = getvehicle()
if vehicle then
vehicle.Handling.FrictionOffroad.Value = tonumber(num)
vehicle.Handling.FrictionRoad.Value = tonumber(num)
else
hint("(-)You do not have a vehicle spawned!(-)")
end
elseif msg:lower():sub(1,13) == "/e racingmode" then
local vehicle = getvehicle()
if vehicle then
han = vehicle.Handling
han.MaxSpeed.Value = 10000
han.Torque.Value = 20000
han.SteeringRadiusConstant.Value = 12000
han.FrictionOffroad.Value = 200
han.FrictionRoad.Value = 200
han.Nitro.NitroSpeed.Value = 300
han.Nitro.NitroForce.Value = 8000
inftoggle = true
else
hint("(-)You do not have a vehicle spawned!(-)")
end
end
end)
wait(0.5)
while inftoggle == true do
wait(0.02)
local vehicle = getvehicle()
if vehicle then
vehicle.Handling.Nitro.NitroAmount.Value = 250
end
end
