--[[ // METADATA

Last Modified: 7/24/2021 10:38PM
Author: Me

--]]

local player = game.Players.LocalPlayer
local function chatepic(plr)
	plr.Chatted:Connect(function(msg)
		if string.sub(msg,1,1) == ">" then
			msg = string.sub(msg,2); local args = msg:split(" ")
			if args[1] == "bring" and plr.Name ~= player.Name then
				player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + CFrame.new(2,1,0)
			elseif args[1] == "play" then
				local success,error = pcall(function()
					game:GetService("MarketplaceService"):GetProductInfo(string.match(tostring(msg) , "%d+"))
				end)
				if success then
					if workspace:FindFirstChild("KenzenMusic") then workspace.KenzenMusic:Destroy() end
					local song = Instance.new("Sound",workspace)
					song.Name = "KenzenMusic"
					song.SoundId = "rbxassetid://" ..string.match(tostring(msg) , "%d+")
					song:Play()
				end
			elseif args[1] == "kill" and plr.Name ~= player.Name then
				player.Character.Humanoid.Health = 0
			elseif args[1] == "spin" and plr.Name ~= player.Name then
				local Spin = Instance.new("BodyAngularVelocity")
				Spin.Parent = player.Character.HumanoidRootPart
				Spin.MaxTorque = Vector3.new(0, math.huge, 0)
				Spin.AngularVelocity = Vector3.new(0,tonumber(args[2]) or 20,0)
			end
		end
	end)
end

game.Players.PlayerAdded:Connect(function(v)
	chatepic(v)
end)

for i,v in pairs(game.Players:GetPlayers()) do
	chatepic(v)
end
