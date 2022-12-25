local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer


-- Prevents flinging from others
local function CharacterAdded(Character)
	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") then
			v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
			local Stepped; Stepped = RunService.PreSimulation:Connect(function()
				if v and v.Parent then
					if v.AssemblyAngularVelocity.Magnitude > 50 or v.AssemblyLinearVelocity.Magnitude > 100 then
						v.CanCollide = false
						v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
						v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
						v.Material = Enum.Material.ForceField -- to seperate fling parts
						v.Transparency = 0
					end
				else
					Stepped:Disconnect()
				end
			end)
		end
	end
end

local function PlayerFunc(Plr)
	if Plr ~= LocalPlayer then
		Plr.CharacterAdded:Connect(CharacterAdded)
		if Plr.Character then CharacterAdded(Plr.Character) end
	end
end

-- Return to Position

local Event = Global and Global.Event or getgenv and getgenv().Event or shared and shared.Event or RunService.PostSimulation

local function AntiTP(Character)
	local Root = Character:WaitForChild("HumanoidRootPart")
	local PreviousPosition = Root.CFrame
	Event:Connect(function()
		if (Root.Position - Root.Position).Magnitude < -2 or (Root.Position - Root.Position).Magnitude > 2 then
			Root.CFrame = PreviousPosition
			Root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			Root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		end
		PreviousPosition = Root.CFrame
	end)
end


Players.PlayerAdded:Connect(PlayerFunc)
for i,v in pairs(Players:GetPlayers()) do PlayerFunc(v) end
LocalPlayer.CharacterAdded:Connect(AntiTP)
if LocalPlayer.Character then AntiTP(LocalPlayer.Character) end
