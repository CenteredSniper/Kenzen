local Global = Global or getgenv and getgenv() or shared

Global.AFCollisions = Global.AFCollisions or true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Prevents flinging from others
local function AddPart(v,Character)
	if v:IsA("BasePart") then
		v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
		local Stepped; Stepped = RunService.PreSimulation:Connect(function()
			if v and v.Parent then
				if v.AssemblyAngularVelocity.Magnitude > 50 or v.AssemblyLinearVelocity.Magnitude > 100 then
					if Global.AFCollisions then
						v.CanCollide = false
					else
						for i,v in pairs(Character:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					end
					v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
					v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					v.Material = Enum.Material.ForceField -- to seperate fling parts
					v.Transparency = 0
				else
					v.Material = Enum.Material.Plastic
					v.Transparency = v.Name == "HumanoidRootPart" and 1 or 0
				end
			else
				Stepped:Disconnect()
			end
		end)
	end
end


local function CharacterAdded(Character)
	Character.DescendantAdded:Connect(function(v) AddPart(v,Character) end)
	for i,v in pairs(Character:GetDescendants()) do AddPart(v,Character) end
end

local function PlayerFunc(Plr)
	if Plr ~= LocalPlayer then
		Plr.CharacterAdded:Connect(CharacterAdded)
		if Plr.Character then CharacterAdded(Plr.Character) end
	end
end

-- Return to Position

local Event = Global.Event or RunService.PostSimulation

local function AntiTP(Character)
	local Root = Character:WaitForChild("HumanoidRootPart")
	local PreviousPosition = Root.CFrame
	Event:Connect(function()
		if (Root.Position - PreviousPosition.Position).Magnitude < -2 or (Root.Position - PreviousPosition.Position).Magnitude > 2 then
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
