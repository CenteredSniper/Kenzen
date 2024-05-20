--[[ // METADATA

Last Modified: 1/24/2022 8:36PM
Author: Me

--]]

_G.AutoAnimate = false
_G.ShowReal = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua"))()
task.wait()
local player     = game.Players.LocalPlayer
------------DISABLING DEFAULT ANIMATIONS-------------
local character = player.Character
character:WaitForChild("Animate"):Destroy() 
character:WaitForChild("Humanoid").Animator:Destroy()
-----------------------------------------------------

local Mode = "Idle"
local Attack = false

local RunService = game:GetService("RunService")

local Frame_Speed = 60
--// Artificial HB \\--

local ArtificialHB = script:FindFirstChild'Heartbeat' or Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

local tf = 0
local allowframeloss = true
local tossremainder = true
local lastframe = tick()
local frame = 1/Frame_Speed
ArtificialHB:Fire()

RunService.Heartbeat:connect(function(p)
	tf = tf + p
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

local sine = 0

-- // Rigging
local trail = character.RockAccessory.Handle
local moon = character["Nebula Blade"].Handle
trail.AccessoryWeld:Destroy()
trail.SpecialMesh:Destroy()
character[player.Name].RockAccessory.Handle.SpecialMesh:Destroy()
local trailweld = Instance.new("Weld",trail)
trailweld.Name = "trailweld"
trailweld.C0 = CFrame.new(1.7682123184204102, 0.038167476654052734, -0.004489898681640625, 1, -1.2246468525851679e-16, 0, 1.2246468525851679e-16, 1, 1.2246468525851679e-16, 0, -1.2246468525851679e-16, 1)
trailweld.Part1 = trail
trailweld.Part0 = moon

moon.AccessoryWeld.C0 = moon.AccessoryWeld.C0 * CFrame.new(0,0,-.5)

local sword = character.Back_AccAccessory.Handle
sword.AccessoryWeld:Destroy()
local swordweld = Instance.new("Weld",sword)
swordweld.Name = "swordweld"
swordweld.C0 = CFrame.new(0.12621212005615234, -0.697235107421875, -1.4804964065551758, -1.2246468525851679e-16, -1.2246468525851679e-16, 1, 0.7660444378852844, -0.6427876353263855, 1.5094603576104463e-17, 0.6427876353263855, 0.7660444378852844, 1.7253218073089784e-16)
swordweld.Parent = sword
swordweld.Part1 = sword
swordweld.Part0 = character["Right Arm"]

RunService.Heartbeat:Connect(function()
	if character then
		moon.AccessoryWeld.C0 = moon.AccessoryWeld.C0 * CFrame.Angles(0,0,math.rad(0 - 10 * math.cos(sine / 60)))
		local velocity = character.HumanoidRootPart.Velocity
		--print(Mode)
		if velocity.Y > 1 then
			Mode = "Jumping"
		elseif velocity.Y < -1 then
			Mode = "Falling"
		elseif velocity.magnitude > 2 then
			Mode = "Walking"
		else
			Mode = "Idle"
		end
	end
end)

local RootJoint     = character.HumanoidRootPart["RootJoint"]
local LeftHip       = character.Torso["Left Hip"]
local RightHip      = character.Torso["Right Hip"]
local LeftShoulder  = character.Torso["Left Shoulder"]
local RightShoulder = character.Torso["Right Shoulder"]
local Neck            = character.Torso["Neck"]

local rootjoint,leftleg,rightleg,leftarm,rightarm,head = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)

local IdleKeyframes = {
	["Torso"] = CFrame.Angles(0, 0, 0),
	["Head"] = CFrame.Angles(0, 0, 0),
	["Left Leg"] = CFrame.Angles(0, math.rad(10.027), 0),
	["Right Leg"] = CFrame.Angles(0, math.rad(-10.027), 0),
	["Right Arm"] = CFrame.Angles(0, math.rad(-20.027), 0),
	["Left Arm"] = CFrame.Angles(0, math.rad(10.027), 0),
}
local walkanim = {
	["Torso"] = CFrame.Angles(0, 0, math.rad(-10.027)),
	["Head"] = CFrame.Angles(0, 0, math.rad(10.027)),
	["Left Leg"] = CFrame.new(-0.197, 0, 0.035) * CFrame.Angles(math.rad(-0.859), math.rad(0.057), math.rad(-4.927)),
	["Right Leg"] = CFrame.Angles(math.rad(-0.859), math.rad(0.057), math.rad(-4.927)),
	["Left Arm"] = CFrame.Angles(math.rad(0.458), math.rad(5.042), math.rad(4.927)),
	["Right Arm"] = CFrame.Angles(0, math.rad(-30.023), 0)
}

local fallanim = {
	["Torso"] = CFrame.Angles(0, 0, 0),
	["Left Leg"] = CFrame.Angles(math.rad(-1.49), 0, 0),
	["Right Leg"] = CFrame.Angles(math.rad(-1.49), 0, 0),
	["Left Arm"] = CFrame.Angles(math.rad(-6.985), math.rad(10.027), 0),
	["Head"] = CFrame.Angles(math.rad(35.008), 0, 0),
	["Right Arm"] = CFrame.Angles(math.rad(-6.985), math.rad(-22.002), 0),
}

local jumpanim = {
	["Torso"] = CFrame.Angles(0, 0, 0),
	["Left Leg"] = CFrame.Angles(math.rad(-4.985), 0, 0),
	["Right Leg"] = CFrame.Angles(math.rad(-4.985), 0, 0),
	["Left Arm"] = CFrame.Angles(math.rad(-24.027), math.rad(10.027), 0),
	["Right Arm"] = CFrame.Angles(math.rad(-24.985), math.rad(-22.002), 0),
	["Head"] = CFrame.Angles(math.rad(-10.008), 0, 0),
}


SitKeyframes = {
	[0] = {
		["Torso"] = CFrame.new(0, 0, -0.5),
		["Left Leg"] = CFrame.new(0, 0, 0),
		["Right Leg"] = CFrame.new(0.4, 0, 0) * CFrame.Angles(0, 0, math.rad(-15.011)),
		["Head"] = CFrame.Angles(0, 0, math.rad(30.023)),
		["Left Arm"] = CFrame.Angles(0, 0, math.rad(19.996)),
		["Right Arm"] = CFrame.Angles(0, 0, math.rad(19.996)),
	},
	[1] = {
		["Torso"] = CFrame.new(0, 0.2, -1.2),
		["Left Leg"] = CFrame.Angles(0, 0, math.rad(-79.985)),
		["Right Leg"] = CFrame.new(0.9, 1.1, 0) * CFrame.Angles(0, 0, math.rad(-15.011)),
		["Head"] = CFrame.Angles(0, 0, math.rad(64.973)),
		["Left Arm"] = CFrame.new(0.2, -0.4, 0) * CFrame.Angles(0, 0, math.rad(24.981)),
		["Right Arm"] = CFrame.Angles(math.rad(-5.73), math.rad(-29.507), math.rad(8.48)),
	},
	[2] = {
		["Torso"] = CFrame.new(0, 0.6, -2),
		["Left Leg"] = CFrame.new(-0.2, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-79.985)),
		["Right Leg"] = CFrame.new(0.7, 1.5, 0) * CFrame.Angles(0, 0, math.rad(15.011)),
		["Head"] = CFrame.Angles(0, 0, math.rad(15.011)),
		["Left Arm"] = CFrame.new(0.2, -0.2, 0) * CFrame.Angles(0, 0, math.rad(30.023)),
		["Right Arm"] = CFrame.new(0, -0.2, 0) * CFrame.Angles(math.rad(-7.678), math.rad(-49.389), math.rad(5.5)),
	},
}


function QuaternionFromCFrame(cf) 
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
	local trace = m00 + m11 + m22 
	if trace > 0 then 
		local s = math.sqrt(1 + trace) 
		local recip = 0.5/s 
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 
	else 
		local i = 0 
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then 
			i = 2 
		end 
		if i == 0 then 
			local s = math.sqrt(m00-m11-m22+1) 
			local recip = 0.5/s 
			return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
		elseif i == 1 then 
			local s = math.sqrt(m11-m22-m00+1) 
			local recip = 0.5/s 
			return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip 
		elseif i == 2 then 
			local s = math.sqrt(m22-m00-m11+1) 
			local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip 
		end 
	end 
end

function QuaternionToCFrame(px, py, pz, x, y, z, w) 
	local xs, ys, zs = x + x, y + y, z + z 
	local wx, wy, wz = w*xs, w*ys, w*zs 
	local xx = x*xs 
	local xy = x*ys 
	local xz = x*zs 
	local yy = y*ys 
	local yz = y*zs 
	local zz = z*zs 
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end

function QuaternionSlerp(a, b, t) 
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
	local startInterp, finishInterp; 
	if cosTheta >= 0.0001 then 
		if (1 - cosTheta) > 0.0001 then 
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((1-t)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta  
		else 
			startInterp = 1-t 
			finishInterp = t 
		end 
	else 
		if (1+cosTheta) > 0.0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((t-1)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta 
		else 
			startInterp = t-1 
			finishInterp = t 
		end 
	end 
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

function clerp(a,b,t) 
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)} 
	local ax, ay, az = a.x, a.y, a.z 
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end 

local movement,wsVal,Change = character.Humanoid.WalkSpeed,character.Humanoid.WalkSpeed/2,.5

local Sitting = false
local increment = .1
local function sit()
	if Sitting then
		character.HumanoidRootPart.Anchored = true
		for incrementsin = 0, 1, 0.1 do
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * SitKeyframes[0]["Torso"], incrementsin)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * SitKeyframes[0]["Left Leg"], incrementsin)
			RightHip.C0 = RightHip.C0:lerp(rightleg * SitKeyframes[0]["Right Leg"], incrementsin)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * SitKeyframes[0]["Left Arm"], incrementsin)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * SitKeyframes[0]["Right Arm"], incrementsin)
			Neck.C0 = Neck.C0:lerp(head * SitKeyframes[0]["Head"], incrementsin)
			swait()
		end
		for incrementsin = 0, 1, 0.1 do
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * SitKeyframes[1]["Torso"], incrementsin)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * SitKeyframes[1]["Left Leg"], incrementsin)
			RightHip.C0 = RightHip.C0:lerp(rightleg * SitKeyframes[1]["Right Leg"], incrementsin)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * SitKeyframes[1]["Left Arm"], incrementsin)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * SitKeyframes[1]["Right Arm"], incrementsin)
			Neck.C0 = Neck.C0:lerp(head * SitKeyframes[1]["Head"], incrementsin)
			swait()
		end
		for incrementsin = 0, 1, 0.1 do
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * SitKeyframes[2]["Torso"], incrementsin)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * SitKeyframes[2]["Left Leg"], incrementsin)
			RightHip.C0 = RightHip.C0:lerp(rightleg * SitKeyframes[2]["Right Leg"], incrementsin)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * SitKeyframes[2]["Left Arm"], incrementsin)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * SitKeyframes[2]["Right Arm"], incrementsin)
			Neck.C0 = Neck.C0:lerp(head * SitKeyframes[2]["Head"], incrementsin)
			swait()
		end
		while Sitting do
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * SitKeyframes[2]["Torso"]* CFrame.new(0, 0, 0 + 0.1 * math.cos(sine/24)), increment)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * SitKeyframes[2]["Left Leg"] *  CFrame.new(0, 0- 0.1 * math.cos(sine/24), 0), increment)
			RightHip.C0 = RightHip.C0:lerp(rightleg * SitKeyframes[2]["Right Leg"]* CFrame.new(0, 0- 0.1 * math.cos(sine/24),0), increment)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * SitKeyframes[2]["Left Arm"]* CFrame.new(0, 0 + 0.05 * math.cos(sine/24),0), increment)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * SitKeyframes[2]["Right Arm"]* CFrame.new(0, 0 + 0.05 * math.cos(sine/24),0), increment)
			Neck.C0 = Neck.C0:lerp(head * SitKeyframes[2]["Head"], increment)
			swait()
		end
		character.HumanoidRootPart.Anchored = false
	end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.E and not gameProcessed then
		Sitting = not Sitting
		Attack = not Attack
		swait()
		sit()
	end
end)
while true do
	sine = sine + 1
	--print(Mode)
	local sidevec = math.clamp((character.HumanoidRootPart.Velocity*character.HumanoidRootPart.CFrame.rightVector).X+(character.HumanoidRootPart.Velocity*character.HumanoidRootPart.CFrame.rightVector).Z,-movement,movement)
	local forwardvec =  math.clamp((character.HumanoidRootPart.Velocity*character.HumanoidRootPart.CFrame.lookVector).X+(character.HumanoidRootPart.Velocity*character.HumanoidRootPart.CFrame.lookVector).Z,-movement,movement)
	local sidevelocity = sidevec/movement
	local forwardvelocity = forwardvec/movement
	if not Attack then
		if Mode == "Idle" then
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * IdleKeyframes["Torso"] * CFrame.new(0, 0, 0 + 0.1 * math.cos(sine/24)), increment)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * IdleKeyframes["Left Leg"] * CFrame.new(0, 0- 0.1 * math.cos(sine/24), 0), increment)
			RightHip.C0 = RightHip.C0:lerp(rightleg * IdleKeyframes["Right Leg"] * CFrame.new(0, 0- 0.1 * math.cos(sine/24), 0), increment)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * IdleKeyframes["Left Arm"] * CFrame.new(0, 0 + 0.05 * math.cos(sine/24), 0), increment)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * IdleKeyframes["Right Arm"] * CFrame.new(0, 0 + 0.05 * math.cos(sine/24), 0), increment)
			Neck.C0 = Neck.C0:lerp(head * IdleKeyframes["Head"] * CFrame.Angles(0, 0, math.rad(20 + 2 * math.cos(sine/24))), increment)
		elseif Mode == "Walking" then
			RightHip.C0=clerp(RightHip.C0,CFrame.new(1,-1 + 0.05 * math.cos(sine / 15),0)*CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 30)),math.rad(0 + 60 * math.cos(sine / 12))),increment)
			LeftHip.C0=clerp(LeftHip.C0,CFrame.new(-1,-1 + 0.05 * math.cos(sine / 15),0)*CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 30)),math.rad(0 + 60 * math.cos(sine / 12))),increment)
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * walkanim["Torso"] * CFrame.new(0, 0, 0 + 0.05 * math.cos(sine/24)), increment)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * walkanim["Left Arm"] * CFrame.Angles(0, 0, math.rad(0 + 45 * math.cos(sine/12))), increment)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * walkanim["Right Arm"] * CFrame.new(0, 0 + 0.05 * math.cos(sine/24),0), increment)
			Neck.C0 = Neck.C0:lerp(head * walkanim["Head"], increment)
		elseif Mode == "Jumping" then	
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * jumpanim["Torso"], increment)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * jumpanim["Left Leg"], increment)
			RightHip.C0 = RightHip.C0:lerp(rightleg * jumpanim["Right Leg"], increment)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * jumpanim["Left Arm"], increment)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * jumpanim["Right Arm"], increment)
			Neck.C0 = Neck.C0:lerp(head * jumpanim["Head"], increment)
		elseif Mode == "Falling" then	
			RootJoint.C0 = RootJoint.C0:lerp(rootjoint * fallanim["Torso"], increment)
			LeftHip.C0 = LeftHip.C0:lerp(leftleg * fallanim["Left Leg"], increment)
			RightHip.C0 = RightHip.C0:lerp(rightleg * fallanim["Right Leg"], increment)
			LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * fallanim["Left Arm"], increment)
			RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * fallanim["Right Arm"], increment)
			Neck.C0 = Neck.C0:lerp(head * fallanim["Head"], increment)
		end
	end
	swait()
end
