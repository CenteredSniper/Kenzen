--[[ // METADATA

Last Modified: 9/3/2018 4:51AM
Author: Markophobic

--]]

plr = game.Players.LocalPlayer
mse = plr:GetMouse()
rs = game:GetService("RunService")

local speed = 2
local toggled = false
local holding = false
local cana = true

mse.KeyDown:connect(function(key)
	if key == "w" and toggled then
		holding = true
print'holding'
		while holding and wait() do
			plr.Character["HumanoidRootPart"].Anchored = true
			plr.Character["HumanoidRootPart"].CFrame = plr.Character["HumanoidRootPart"].CFrame * CFrame.new(0,0,-math.abs(0.5*speed))
		end
	end
end)

mse.KeyUp:connect(function(key)
	if key == "w" then
		holding = false
print'unholding'
	end
end)

reset = function()
	cana = false
	toggled = false
	holding = false
	repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health > 0 
	cana = true
end

mse.KeyDown:connect(function(key)
	if cana and key == "e" then
	toggled = not toggled
	if toggled then
		plr.Character["HumanoidRootPart"].Anchored = true
	while toggled do
		local a = workspace.CurrentCamera
		local lookAt = a.CFrame * CFrame.new(0,-1,-((plr.Character["HumanoidRootPart"].CFrame.p - a.CFrame.p).magnitude) - 3)
		plr.Character["HumanoidRootPart"].CFrame = CFrame.new(plr.Character["HumanoidRootPart"].Position, lookAt.p)
		rs.RenderStepped:wait()
	end
	else
		plr.Character["HumanoidRootPart"].Anchored = false
		end
	end
end)

while wait() do
		if plr.Character.Humanoid.Health == 0 then
			return reset()
		end
end
