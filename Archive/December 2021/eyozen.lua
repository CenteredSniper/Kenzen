--[[ // METADATA

Last Modified: 12/17/2021 5:11PM
Author: ???

--]]

_G.Fling = true
_G.GodMode = true
_G.Tools = true
_G.FakeGod = false
_G.Collisions = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua"))()
wait(0.1)
-----------------------
--[[ Name : Eyozen, the Eye ]]--
-------------------------------------------------------

--[[ "Haha, I'm a funny guy, but once you anger me..." ]]--
--[[ "There's no coming back =)" ]]--

--A script By makhail07

--Discord Creterisk#2958 

--NOTE THIS SCRIPT WAS PURELY MADE FROM MY FUCKING IMAGINATION
--IF IT HAPPENS TO LOOK LIKE ANOTHER SCRIPT
--DONT CALL IT A FUCKING BOOTLEG THANK YOU AND ENJOY THE SCRIPT
--YOU FUCKING SKIDS,
--For Those who log/decompile this, If you sell or trade this,
--and I find out who you are, i will take massive action.
-------------------------------------------------------

local FavIDs = {
	340106355, --Nefl Crystals
	927529620, --Dimension
	876981900, --Fantasy
	398987889, --Ordinary Days
	1117396305, --Oh wait, it's you.
	885996042, --Action Winter Journey
	919231299, --Sprawling Idiot Effigy
	743466274, --Good Day Sunshine
	727411183, --Knife Fight
	1402748531, --The Earth Is Counting On You!
	595230126 --Robot Language
}

local RAWStand, LAWStand, RLWStand, LLWStand

--The reality of my life isn't real but a Universe -makhail07
wait()
local plr = game:service'Players'.LocalPlayer
print('Local User is '..plr.Name)
local char = plr.Character
local hum = char.Humanoid
local hed = char.Head
local root = char.HumanoidRootPart
local rootj = root.RootJoint
local tors = char.Torso
local ra = char["Right Arm"]
local la = char["Left Arm"]
local rl = char["Right Leg"]
local ll = char["Left Leg"]
local neck = tors["Neck"]
local mouse = plr:GetMouse()
local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)
local maincolor = BrickColor.new("Institutional white")

-------------------------------------------------------
--Start Good Stuff--
-------------------------------------------------------
cam = game.Workspace.CurrentCamera
CF = CFrame.new
angles = CFrame.Angles
attack = false
Euler = CFrame.fromEulerAnglesXYZ
Rad = math.rad
IT = Instance.new
BrickC = BrickColor.new
Cos = math.cos
Acos = math.acos
Sin = math.sin
Asin = math.asin
Abs = math.abs
Mrandom = math.random
Floor = math.floor
-------------------------------------------------------
--End Good Stuff--
-------------------------------------------------------
necko = CF(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
RSH, LSH = nil, nil 
RW = Instance.new("Weld") 
LW = Instance.new("Weld")
RH = tors["Right Hip"]
LH = tors["Left Hip"]
RSH = tors["Right Shoulder"] 
LSH = tors["Left Shoulder"] 
RSH.Parent = nil 
LSH.Parent = nil 
RW.Name = "RW"
RW.Part0 = tors 
RW.C0 = CF(1.5, 0.5, 0)
RW.C1 = CF(0, 0.5, 0) 
RW.Part1 = ra
RW.Parent = tors 
LW.Name = "LW"
LW.Part0 = tors 
LW.C0 = CF(-1.5, 0.5, 0)
LW.C1 = CF(0, 0.5, 0) 
LW.Part1 = la
LW.Parent = tors
Effects = {}

RAWStand = RW.C0
LAWStand = LW.C0
RLWStand = RH.C0
LLWStand = LH.C0
-------------------------------------------------------
--Start HeartBeat--
-------------------------------------------------------
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false


lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
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
-------------------------------------------------------
--End HeartBeat--
-------------------------------------------------------

-------------------------------------------------------
--Start Important Functions--
-------------------------------------------------------
function swait(num)
	if num == 0 or num == nil then
		--game:service("RunService").Stepped:wait(0)
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			--game:service("RunService").Stepped:wait(0)
			ArtificialHB.Event:wait()
		end
	end
end
function thread(f)
	coroutine.resume(coroutine.create(f))
end
function clerp(a, b, t)
	local qa = {
		QuaternionFromCFrame(a)
	}
	local qb = {
		QuaternionFromCFrame(b)
	}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end
function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m00 < m11 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s
			return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp
	if cosTheta >= 1.0E-4 then
		if 1 - cosTheta > 1.0E-4 then
			local theta = math.acos(cosTheta)
			local invSinTheta = 1 / Sin(theta)
			startInterp = Sin((1 - t) * theta) * invSinTheta
			finishInterp = Sin(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	elseif 1 + cosTheta > 1.0E-4 then
		local theta = math.acos(-cosTheta)
		local invSinTheta = 1 / Sin(theta)
		startInterp = Sin((t - 1) * theta) * invSinTheta
		finishInterp = Sin(t * theta) * invSinTheta
	else
		startInterp = t - 1
		finishInterp = t
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end
function rayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end

-------------------------------------------------------
--Start Damage Function--
-------------------------------------------------------
function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)

end
-------------------------------------------------------
--End Damage Function--
-------------------------------------------------------

-------------------------------------------------------
--Start Damage Function Customization--
-------------------------------------------------------
function ShowDamage(Pos, Text, Time, Color)
end
-------------------------------------------------------
--End Damage Function Customization--
-------------------------------------------------------

function MagniDamage(Part, magni, mindam, maxdam, knock, Type)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if magni >= mag and c.Name ~= plr.Name then
					--Damage(head, head, mindam, maxdam, knock, Type, root, 0.1, "http://www.roblox.com/asset/?id=0", 1.2)
				end
			end
		end
	end
end


function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end



-------------------------------------------------------
--Start Effect Function--
-------------------------------------------------------
EffectModel = Instance.new("Model", char)
function part(formfactor ,parent, reflectance, transparency, brickcolor, name, size)
	local fp = IT("Part")
	fp.formFactor = formfactor 
	fp.Parent = parent
	fp.Reflectance = reflectance
	fp.Transparency = transparency
	fp.CanCollide = false 
	fp.Locked = true
	fp.BrickColor = brickcolor
	fp.Name = name
	fp.Size = size
	fp.Position = tors.Position 
	RemoveOutlines(fp)
	fp.Material = "SmoothPlastic"
	fp:BreakJoints()
	return fp 
end 

function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh = IT(Mesh) 
	mesh.Parent = part
	if Mesh == "SpecialMesh" then
		mesh.MeshType = meshtype
		if meshid ~= "nil" then
			mesh.MeshId = "http://www.roblox.com/asset/?id="..meshid
		end
	end
	mesh.Offset = offset
	mesh.Scale = scale
	return mesh
end

function Magic(bonuspeed, type, pos, scale, value, color, MType)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = MType
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, scaler2 * bonuspeed, scaler2 * bonuspeed)
		end
		rng:Destroy()
	end))
end

function Eviscerate(dude)

end

function FindNearestHead(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return Distance > (SinglePlayer.Torso.CFrame.p - Position).magnitude
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v:findFirstChild("Head") and v ~= char and Distance >= (v.Head.Position - Position).magnitude then
			table.insert(List, v)
		end
	end
	return List
end

function Aura(bonuspeed, FastSpeed, type, pos, x1, y1, z1, value, color, outerpos, MType)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector * outerpos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = MType
	rngm.Scale = Vector3.new(x1, y1, z1)
	local scaler2 = 1
	local speeder = FastSpeed
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
			speeder = speeder - 0.01 * FastSpeed * bonuspeed
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector * speeder * bonuspeed
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, scaler2 * bonuspeed, 0)
		end
		rng:Destroy()
	end))
end

function SoulSteal(dude)

end
function FaceMouse()
	local	Cam = workspace.CurrentCamera
	return {
		CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, char.Torso.Position.y, mouse.Hit.p.z)),
		Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
	}
end
-------------------------------------------------------
--End Effect Function--
-------------------------------------------------------
function Cso(ID, PARENT, VOLUME, PITCH)
	local NSound = nil
	coroutine.resume(coroutine.create(function()
		NSound = IT("Sound", PARENT)
		NSound.Volume = VOLUME
		NSound.Pitch = PITCH
		NSound.SoundId = "http://www.roblox.com/asset/?id="..ID
		swait()
		NSound:play()
		game:GetService("Debris"):AddItem(NSound, 10)
	end))
	return NSound
end
function CameraEnshaking(Length, Intensity)
	coroutine.resume(coroutine.create(function()
		local intensity = 1 * Intensity
		local rotM = 0.01 * Intensity
		for i = 0, Length, 0.1 do
			swait()
			intensity = intensity - 0.05 * Intensity / Length
			rotM = rotM - 5.0E-4 * Intensity / Length
			hum.CameraOffset = Vector3.new(Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)))
			cam.CFrame = cam.CFrame * CF(Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity)), Rad(Mrandom(-intensity, intensity))) * Euler(Rad(Mrandom(-intensity, intensity)) * rotM, Rad(Mrandom(-intensity, intensity)) * rotM, Rad(Mrandom(-intensity, intensity)) * rotM)
		end
		hum.CameraOffset = Vector3.new(0, 0, 0)
	end))
end
-------------------------------------------------------
--End Important Functions--
-------------------------------------------------------


-------------------------------------------------------
--Start Customization--
-------------------------------------------------------
local Player_Size = 1
if Player_Size ~= 1 then
	root.Size = root.Size * Player_Size
	tors.Size = tors.Size * Player_Size
	hed.Size = hed.Size * Player_Size
	ra.Size = ra.Size * Player_Size
	la.Size = la.Size * Player_Size
	rl.Size = rl.Size * Player_Size
	ll.Size = ll.Size * Player_Size
	----------------------------------------------------------------------------------
	rootj.Parent = root
	neck.Parent = tors
	RW.Parent = tors
	LW.Parent = tors
	RH.Parent = tors
	LH.Parent = tors
	----------------------------------------------------------------------------------
	rootj.C0 = RootCF * CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0))
	rootj.C1 = RootCF * CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0))
	--neck.C0 = necko * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * angles(Rad(0), Rad(0), Rad(0))
	neck.C1 = CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * angles(Rad(-90), Rad(0), Rad(180))
	RW.C0 = CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0)) --* RIGHTSHOULDERC0
	LW.C0 = CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(0), Rad(0)) --* LEFTSHOULDERC0
	----------------------------------------------------------------------------------
	RH.C0 = CF(1 * Player_Size, -1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
	LH.C0 = CF(-1 * Player_Size, -1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(-90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
	RH.C1 = CF(0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
	LH.C1 = CF(-0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * angles(Rad(0), Rad(-90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
	--hat.Parent = Character
end
----------------------------------------------------------------------------------
local SONG = 1494452913
local SONG2 = 1130685064
local Music = Instance.new("Sound",tors)
Music.Volume = 2.5
Music.Looped = true
Music.Pitch = 1 --Pitcher
----------------------------------------------------------------------------------
local equipped = false
local idle = 0
local change = 1
local val = 0
local toim = 0
local idleanim = 0.4
local sine = 0
local Sit = 1
----------------------------------------------------------------------------------
hum.WalkSpeed = 10
hum.JumpPower = 57
hum.Animator.Parent = nil
----------------------------------------------------------------------------------
local naeeym2 = IT("BillboardGui",char)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(5,35,2,15)
naeeym2.StudsOffset = Vector3.new(0,2,0)
naeeym2.MaxDistance = 75
naeeym2.Adornee = hed
naeeym2.Name = "Name"
--naeeym2.PlayerToHideFrom = Player
local tecks2 = IT("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = "Eyo-zen"
tecks2.Font = "Fantasy"
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(1,1,1)
tecks2.TextStrokeColor3 = Color3.fromRGB(177, 167, 255)
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2
local top = Instance.new("Shirt")
top.ShirtTemplate = "rbxassetid://338740550"
top.Parent = char
top.Name = "Cloth"
local bottom = Instance.new("Pants")
bottom.PantsTemplate = "rbxassetid://338750779"
bottom.Parent = char
bottom.Name = "Cloth"
----------------------------------------------------------------------------------
--[[
		Thanks for using Build-To-Lua by jarredbcv.
]]--

New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end

Eyo = New("Model",char,"Eyo",{})
Eye = New("Part",Eyo,"Eye",{BrickColor = BrickColor.new("Institutional white"),Shape = Enum.PartType.Ball,Size = Vector3.new(1.96000075, 1.96000075, 1.96000075),CFrame = CFrame.new(-137.175568, 1.33095813, -17.0833168, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Pupil = New("Part",Eyo,"Pupil",{BrickColor = BrickColor.new("Black"),Shape = Enum.PartType.Ball,Size = Vector3.new(0.37000075, 0.37000075, 0.37000075),CFrame = CFrame.new(-137.235779, 1.42530513, -18.0334377, 1.00000072, -7.15256022e-07, 3.57628181e-07, -7.15256022e-07, 1.00000036, 2.01165761e-07, 3.57628181e-07, 2.01165761e-07, 1.00000215),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
mot = New("Motor",Pupil,"mot",{Part0 = Pupil,Part1 = Eye,C0 = CFrame.new(0, 0, 0, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),C1 = CFrame.new(-0.0602111816, 0.0943470001, -0.950120926, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),})
TopHat2 = New("Part",Eyo,"TopHat2",{BrickColor = BrickColor.new("Really black"),Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.0500000007, 1, 1),CFrame = CFrame.new(-137.740799, 2.24810791, -17.0272255, 0.458347857, 0.877660632, -0.140108809, -0.888243496, 0.446898967, -0.106327571, -0.0307050757, 0.173186749, 0.984412611),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
mot = New("Motor",TopHat2,"mot",{Part0 = TopHat2,Part1 = Eye,C0 = CFrame.new(0, 0, 0, 0.458347201, -0.88824302, -0.0307050198, 0.877660394, 0.446899265, 0.173186243, -0.140109047, -0.106327735, 0.98441118),C1 = CFrame.new(-0.565231323, 0.917149663, 0.0560913086, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),})
TopHat1 = New("Part",Eyo,"TopHat1",{BrickColor = BrickColor.new("Really black"),Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.54000056, 1.80000043, 0.780000567),CFrame = CFrame.new(-138.100586, 2.94428444, -17.0250435, 0.457500041, 0.889210463, 3.57628181e-07, -0.88921082, 0.45749861, 2.01165761e-07, -1.52640816e-08, 4.10039718e-07, 1.00000215),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
mot = New("Motor",TopHat1,"mot",{Part0 = TopHat1,Part1 = Eye,C0 = CFrame.new(0, 0, 0, 0.457499385, -0.889210343, -5.08804376e-09, 0.889210224, 0.457498908, 1.36679802e-07, 1.1920929e-07, 6.70552254e-08, 1.00000072),C1 = CFrame.new(-0.925018311, 1.61332572, 0.0582733154, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),})
OuterPupil = New("Part",Eyo,"OuterPupil",{BrickColor = BrickColor.new("Alder"),Material = Enum.Material.Neon,Shape = Enum.PartType.Ball,Size = Vector3.new(1.0000006, 1.0000006, 1.0000006),CFrame = CFrame.new(-137.20755, 1.40179217, -17.6748943, 1.00000072, -7.15256022e-07, 3.57628181e-07, -7.15256022e-07, 1.00000036, 2.01165761e-07, 3.57628181e-07, 2.01165761e-07, 1.00000215),BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.705882, 0.501961, 1),})
mot = New("Motor",OuterPupil,"mot",{Part0 = OuterPupil,Part1 = Eye,C0 = CFrame.new(0, 0, 0, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),C1 = CFrame.new(-0.0319824219, 0.0708340406, -0.59157753, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),})
TopHat3 = New("Part",Eyo,"TopHat3",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.779999912, 0.5, 0.769999981),CFrame = CFrame.new(-138.460098, 3.63034701, -17.0150394, -0.258819818, -0.455481321, 0.851792634, -5.44427401e-08, 0.881841302, 0.471547186, -0.965928435, 0.122045919, -0.228237376),CanCollide = false,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",TopHat3,"Mesh",{MeshType = Enum.MeshType.Sphere,})
mot = New("Motor",TopHat3,"mot",{Part0 = TopHat3,Part1 = Eye,C0 = CFrame.new(0, 0, 0, -0.258819461, -4.83165614e-08, -0.965926886, -0.455480665, 0.881840825, 0.122045726, 0.851792514, 0.471547544, -0.228237316),C1 = CFrame.new(-1.28453064, 2.29938841, 0.068277359, 1.00000024, -2.38418579e-07, 1.1920929e-07, -2.38418579e-07, 1.00000012, 6.70552254e-08, 1.1920929e-07, 6.70552254e-08, 1.00000072),})

local NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance,parent)
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

local HW = NewInstance('Weld',char,{Part0=tors, Part1=Eye, C0 = CF(0,4,0) * angles(0,0,0)})
for i,v in pairs(char:children()) do
	if v:IsA("Hat") then
		v:Destroy()
	end
end
for i,v in pairs(char:children()) do
	if v:IsA("Accessory") then
		if v.Name ~= "Metashard" and v.Name ~= "MeshPartAccessory" then
			v:Destroy()
		end

	end
end
hed.Transparency = 1
hed.face:Remove()
-------------------------------------------------------
--End Customization--
-------------------------------------------------------

local humrootattack,atpositi = false,nil

-------------------------------------------------------
--Start Attacks N Stuff--
-------------------------------------------------------
function Taunt1()
	attack = true
	hum.WalkSpeed = 0
	for i = 0, 9, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(15), Rad(0), Rad(0)), 0.15)
		--tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(0), Rad(78), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(15)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-78), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-15)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-9), Rad(0), Rad(155 + 25 * Sin(sine / 2.5))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	attack = false
	hum.WalkSpeed = 10
end
function Taunt2()
	attack = true
	hum.WalkSpeed = 0
	--Cso("221057812", hed, 10, 1.1)
	for i = 0, 2, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.5 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.6 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.6 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(-25 + 2.5 * Sin(sine / 20)), Rad(-55 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, .2 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * CF(0, 0, 2) * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.15)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -1.2 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -1.2 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(35), Rad(-25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(-55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 4 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0 - 255.45 * i), Rad(0), Rad(0)), 0.15)
	end
	for i = 0, 2, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.5 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.6 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.6 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(-25 + 2.5 * Sin(sine / 20)), Rad(-55 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 1.8, 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	attack = false
	hum.WalkSpeed = 10
end
function Astigmatism()
	attack = true
	hum.WalkSpeed = 0
	local Ring1 = Instance.new("Part", char)
	Ring1.Anchored = true
	Ring1.BrickColor = maincolor
	Ring1.CanCollide = false
	Ring1.FormFactor = 3
	Ring1.Name = "Ring"
	Ring1.Material = "Neon"
	Ring1.Size = Vector3.new(1, 0.05, 1)
	Ring1.Transparency = 1
	Ring1.TopSurface = 0
	Ring1.BottomSurface = 0
	local Ring1Mesh = Instance.new("SpecialMesh", Ring1)
	Ring1Mesh.MeshType = "Brick"
	Ring1Mesh.Name = "SizeMesh"
	Ring1Mesh.Scale = Vector3.new(0, 1, 0)
	local InnerRing1 = Ring1:Clone()
	InnerRing1.Parent = char
	InnerRing1.Transparency = 0
	InnerRing1.BrickColor = BrickColor.new("New Yeller")
	InnerRing1.Size = Vector3.new(1, 1, 1)
	local InnerRing1Mesh = InnerRing1.SizeMesh
	InnerRing1Mesh.Scale = Vector3.new(0, 0, 0)
	InnerRing1Mesh.MeshType = "Sphere"
	Ring1:Destroy()
	for i = 0, 6, 0.1 do
		swait()
		--orb.CFrame = Pupil.CFrame
		Aura(7, 0.12, "Add", Pupil.CFrame * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 0.5, 0.5, 5, -0.005, maincolor, 0, "Sphere")
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * CF(0, 0, 1) * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-35), Rad(0), Rad(165 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-35), Rad(0), Rad(-165 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 3 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	InnerRing1.Transparency = 1
	InnerRing1.CFrame = Pupil.CFrame + root.CFrame.lookVector * 5
	Cso("294188875", char, 2.3, 1)
	local a = IT("Part", char)
	a.Name = "Direction"
	a.Anchored = true
	a.BrickColor = BrickC("Pastel violet")
	a.Material = "SmoothPlastic"
	a.Transparency = 0
	a.Shape = "Cylinder"
	a.CanCollide = false
	local a2 = IT("Part", char)
	a2.Name = "Direction"
	a2.Anchored = true
	a2.BrickColor = maincolor
	a2.Color = maincolor.Color
	a2.Material = "Neon"
	a2.Transparency = 0.7
	a2.Shape = "Cylinder"
	a2.CanCollide = false
	local ba = IT("Part", char)
	ba.Name = "HitDirect"
	ba.Anchored = true
	ba.BrickColor = maincolor
	ba.Material = "Neon"
	ba.Transparency = 1
	ba.CanCollide = false

	local ray = Ray.new(InnerRing1.CFrame.p, (mouse.Hit.p - InnerRing1.CFrame.p).unit * 1000)
	atpositi = mouse.Hit.p
	humrootattack = true
	local ignore = char
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	a2.BottomSurface = 10
	a2.TopSurface = 10
	local distance = (InnerRing1.CFrame.p - position).magnitude
	a.Size = Vector3.new(distance, 1, 1)
	a.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
	a2.Size = Vector3.new(distance, 1, 1)
	a2.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
	ba.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance)
	a.CFrame = a.CFrame * angles(0, Rad(90), 0)
	a2.CFrame = a2.CFrame * angles(0, Rad(90), 0)
	game:GetService("Debris"):AddItem(a, 20)
	game:GetService("Debris"):AddItem(a2, 20)
	game:GetService("Debris"):AddItem(ba, 20)
	local msh = Instance.new("SpecialMesh", a)
	msh.MeshType = "Brick"
	msh.Scale = Vector3.new(1, 5, 5)
	local msh2 = Instance.new("SpecialMesh", a2)
	msh2.MeshType = "Brick"
	msh2.Scale = Vector3.new(1, 7, 7)
	for i = 0, 10, 0.1 do
		swait()
		CameraEnshaking(1, 5)
		a2.Color = maincolor.Color
		root.CFrame = FaceMouse()[1]
		InnerRing1.CFrame = Pupil.CFrame + root.CFrame.lookVector * 4
		ray = Ray.new(InnerRing1.CFrame.p, (mouse.Hit.p - InnerRing1.CFrame.p).unit * 1000)
		atpositi = mouse.Hit.p
		humrootattack = true
		hit, position, normal = workspace:FindPartOnRay(ray, ignore)
		distance = (InnerRing1.CFrame.p - position).magnitude
		a.Size = Vector3.new(distance, 1, 1)
		a.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
		a2.Size = Vector3.new(distance, 1, 1)
		a2.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance / 2)
		ba.CFrame = CF(InnerRing1.CFrame.p, position) * CF(0, 0, -distance)
		a.CFrame = a.CFrame * angles(0, Rad(90), 0)
		a2.CFrame = a2.CFrame * angles(0, Rad(90), 0)
		msh.Scale = msh.Scale - Vector3.new(0, 0.05, 0.05)
		msh2.Scale = msh2.Scale - Vector3.new(0, 0.03, 0.03)
		Aura(5, 0.15, "Add", ba.CFrame * angles(Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360)), Rad(Mrandom(-360, 360))), 15, 15, 25, -0.15, maincolor, 0, "Sphere")
		for i, v in pairs(FindNearestHead(ba.CFrame.p, 14.5)) do
			if v:FindFirstChild("Head") then
				Eviscerate(v)
			end
		end
	end
	a:Destroy()
	a2:Destroy()
	ba:Destroy()
	InnerRing1:Destroy()
	attack = false
	humrootattack = false
	hum.WalkSpeed = 10
	hum.CameraOffset = Vector3.new(0,0,0)
end
function EyeThrow()
	attack = true
	hum.WalkSpeed = 3.01
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.7 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(0), Rad(215 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	local Head01 = Eye:Clone()
	Head01.Parent = char
	Head01.Name = "CloneEye"
	Head01.Touched:connect(function(hit)
		if(not char:IsAncestorOf(hit))then
			local hum = (hit and hit.Parent and hit.Parent:FindFirstChildOfClass'Humanoid')
			local hedder = (hit and hit.Parent and hit.Parent:FindFirstChild'Head')
			if(hum and hedder and hum.Health > 0)then
				for i=1,5 do
					Head01.CFrame = hedder.CFrame
					swait()
				end
			end
		end
	end)
	Eye.Transparency = 1
	local weldHead01 = IT("Weld")
	weldHead01.Parent = Head01
	weldHead01.Part0 = ra
	weldHead01.Part1 = Head01
	weldHead01.C1 = CF(0, 0, 1.2) * angles(Rad(90), Rad(0), Rad(0))
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(-20)), 0.2)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(20)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.2)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.2)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(0), Rad(145 + 2.5 * Sin(sine / 20))), 0.2)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(25), Rad(0), Rad(-15)), 0.2)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(20), Rad(0)), 0.1)
	end
	local A = IT("Attachment",Head01)
	A.Position = Vector3.new(-0, 0.2, 0.136)
	local B = IT("Attachment",Head01)
	B.Position = Vector3.new(-0, -0.95, -0.982)
	local Trail = IT("Trail",Head01)
	Trail.Attachment0 = B
	Trail.Attachment1 = A
	Trail.Lifetime = 0.6
	Trail.Transparency = NumberSequence.new(0.5, 1)
	Trail.Texture = "http://www.roblox.com/asset/?id=1472703539"
	Trail.Enabled = true
	weldHead01:Destroy()
	Head01.CanCollide = true

	local bodyVelocity2 = Instance.new("BodyVelocity",Head01)
	bodyVelocity2.Velocity = (mouse.Hit.p - Head01.CFrame.p).unit * 165
	bodyVelocity2.P = 5000
	bodyVelocity2.maxForce = Vector3.new(8000, 8000, 8000)
	game:GetService("Debris"):AddItem(bodyVelocity2, 0.05)
	for i = 0, 2, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(40)), 0.2)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(-40)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.2)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.2)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-134), Rad(0), Rad(145 + 2.5 * Sin(sine / 20))), 0.2)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(45), Rad(0), Rad(-15)), 0.1)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(-40), Rad(0)), 0.2)
	end
	for i = 0, 6, 0.1 do
		swait()
		Eye.Transparency = Eye.Transparency - 0.05
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(40)), 0.2)
	--	neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(-40)), 0.2)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.2)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.2)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-134), Rad(0), Rad(145 + 2.5 * Sin(sine / 20))), 0.2)
		LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(45), Rad(0), Rad(-15)), 0.2)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(-40), Rad(0)), 0.1)
	end
	coroutine.resume(coroutine.create(function() 
		for i = 0, 1.8, 0.05 do
			swait()
			Head01.Transparency = i
		end
		Head01:Destroy()
	end))
	--Head01:Destory()
	attack = false
	Trail.Enabled = false
	hum.WalkSpeed = 10
end
function Call_Upon_The_Eyes()
	attack = true
	hum.WalkSpeed = 0
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(145), Rad(0), Rad(15 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 3.5 + 0.2 * Cos(sine / 20), 0) * angles(Rad(90), Rad(0), Rad(0)), 0.1)
	end
	Magic(5, "Add", mouse.Hit * CFrame.new(0, -2.9, 0), Vector3.new(0, 0, 0), 1, maincolor, "Sphere")
	Magic(10, "Add", mouse.Hit * CFrame.new(0, -2.9, 0), Vector3.new(0, 0, 0), 2, maincolor, "Sphere")
	Magic(1, "Add", mouse.Hit, Vector3.new(1, 100000, 1), 0.5, maincolor, "Sphere")
	Magic(1, "Add", mouse.Hit, Vector3.new(1, 1, 1), 0.75, maincolor, "Sphere")
	CameraEnshaking(4, 25)
	atpositi = mouse.Hit.p
	humrootattack = true
	for i, v in pairs(FindNearestHead(mouse.Hit.p, 14.5)) do
		if v:FindFirstChild("Head") then
			Eviscerate(v)
		end
	end
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.4 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -.8 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -.8 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(45), Rad(0), Rad(15 + 2.5 * Sin(sine / 20))), 0.2)
		LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 3 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0 - 255.45 * i), Rad(0), Rad(0)), 0.15)
	end
	attack = false
	humrootattack = false
	hum.WalkSpeed = 10
end
function Eyeyeyeyeyeyey_Slammo()
	attack = true
	hum.WalkSpeed = 0
	local Blobby = IT("Part", char)
	Blobby.Name = "Blob"
	Blobby.CanCollide = false
	Blobby.BrickColor = BrickC("Really black")
	Blobby.Transparency = 0
	Blobby.Material = "Plastic"
	Blobby.Size = Vector3.new(1, 1, 2)
	Blobby.TopSurface = Enum.SurfaceType.Smooth
	Blobby.BottomSurface = Enum.SurfaceType.Smooth

	local Weld = IT("Weld", Blobby)
	Weld.Part0 = hed
	Weld.Part1 = Blobby
	Weld.C1 = CF(0, -17.6, 1.4)
	Weld.C0 = angles(Rad(0),0,0)

	local M2 = IT("SpecialMesh")
	M2.Parent = Blobby
	M2.MeshId = "http://www.roblox.com/asset/?id=1185246"
	M2.TextureId = "http://www.roblox.com/asset/?id=28301750"
	M2.Scale = Vector3.new(45.65, 45.65, 45.65)
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.2)
		--neck.C0 = clerp(neck.C0, necko * CF(0, 0, 1) * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-35), Rad(0), Rad(165 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-35), Rad(0), Rad(-165 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	Magic(1, "Add", root.CFrame * CF(0, -1.9, -20), Vector3.new(1, 1, 1), 0.75, maincolor, "Sphere")
	Magic(5, "Add", root.CFrame * CF(0, -1.9, -20), Vector3.new(0, 0, 0), 1, maincolor, "Sphere")
	Magic(10, "Add", root.CFrame * CF(0, -1.9, -20), Vector3.new(0, 0, 0), 2, maincolor, "Sphere")
	for i, v in pairs(FindNearestHead(root.CFrame.p, 25.5)) do
		if v:FindFirstChild("Head") then
			Eviscerate(v)
		end
	end
	CameraEnshaking(4, 25)
	for i = 0, 6, 0.1 do
		swait()
		rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(90 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
		--neck.C0 = clerp(neck.C0, necko * CF(0, 0, 1) * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
		RH.C0 = clerp(RH.C0, CF(1* Player_Size, -1.3 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(90)), 0.15)
		LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -1.3 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-90)), 0.15)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-35), Rad(0), Rad(165 + 2.5 * Sin(sine / 20))), 0.12)
		LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-35), Rad(0), Rad(-165 + 2.5 * Sin(sine / 20))), 0.12)
		HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
	end
	Blobby:Destroy()
	attack = false
	hum.WalkSpeed = 10
end
function getAllParts(from)
	local t = {}
	local function getParts(where)
		for i, v in pairs(where:children()) do
			if v:IsA("BasePart") then
				if v.Parent ~= char and v.Parent.Parent ~= char then
					table.insert(t, v)
				end
			end
			getParts(v)
		end
	end
	getParts(workspace)
	return t
end
function RayCast(pos1, pos2, maxDist, forward)
	local list = getAllParts(workspace)
	local pos0 = pos1
	for dist = 1, maxDist, forward do
		pos0 = (CFrame.new(pos1, pos2) * CFrame.new(0, 0, -dist)).p
		for _, v in pairs(list) do
			local pos3 = v.CFrame:pointToObjectSpace(pos0)
			local s = v.Size
			if pos3.x > -(s.x/2) and pos3.x < (s.x/2) and pos3.y > -(s.y/2) and pos3.y < (s.y/2) and pos3.z > -(s.z/2) and pos3.x < (s.z/2) and v.CanCollide and v:GetMass() > 14 then
				return pos0, v
			end
		end
	end
	return pos0, nil
end
function ComputePos(pos1, pos2)
	local pos3 = Vector3.new(pos2.x, pos1.y, pos2.z)
	return CFrame.new(pos1, pos3)
end
local resting = false
function rest()
	if attack then return end
	attack = true
	resting = true
	local Orig = tors.CFrame
	local CF = ComputePos(Orig.p, Orig * CFrame.new(0, 0, -5).p)
	local p, t = RayCast(CF.p, CF * CFrame.new(0, -6, 0.5).p, 6, 0.5)
	if t then
		local bg = Instance.new("BodyGyro",tors)
		bg.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bg.P = 14000
		local bp = Instance.new("BodyPosition",tors)
		bp.maxForce = Vector3.new(math.huge, 0, math.huge)
		bp.P = 14000
		bp.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		bp.position = CF.p
		bg.cframe = CF
		--attach()
		local cen = CF * CFrame.new(0, -2.3, 0)
		hum.PlatformStand = true
		local standup = function()
			tors.Anchored = false
			bp.Parent = tors
			cen = ComputePos(tors.CFrame.p, tors.CFrame * CFrame.new(0, 0, -5).p) * CFrame.new(0, 0, -2.5)
			for i = 1, 0, -0.12 do
				RW.C0 = RAWStand * CFrame.Angles(-math.rad(25), -math.rad(-20-20*i), -math.rad(20*i))
				LW.C0 = LAWStand * CFrame.Angles(-math.rad(-40-70*i), 0, -math.rad(-30-10*i)) * CFrame.new(0, -0.6*i, 0.4+0.2*i)
				RH.C0 = RLWStand * CFrame.Angles(0, 0, math.rad(55+25*i)) * CFrame.new(0, -0.4*i, 0)--* CFrame.Angles(-math.rad(55+25*i), 0, -math.rad(15)) * CFrame.new(0, 0, -0.4)
				LH.C0 = LLWStand  * CFrame.new(-0.8*i, 1.5*i, 0) --* CFrame.Angles(-math.rad(55+25*i), 0, -math.rad(-15)) * CFrame.new(0, 0, -0.4)
				--neck.C0 = necko * CFrame.Angles(math.rad(10-15*i), 0, 0)
				--HW.C0 = HWStand * CFrame.Angles(math.rad(40*i), 0, 0) * CFrame.new(0, 0, 0.2+0.8*i)
				bg.cframe = CF * CFrame.Angles(math.rad(-10+20*i), 0, 0)
				bp.position = cen * CFrame.Angles(math.rad(180+45+45*i), 0, 0) * CFrame.new(0, -2.5, 0.4*i).p
				wait()
			end
			for i = 1, 0, -0.17 do
				RW.C0 = RAWStand * CFrame.Angles(-math.rad(25*i), -math.rad(-20*i), 0)
				LW.C0 = LAWStand * CFrame.Angles(-math.rad(-40*i), 0, -math.rad(-30*i)) * CFrame.new(0, 0, 0.4*i)
				RH.C0 = RLWStand * CFrame.Angles(0, 0, math.rad(55*i)) * CFrame.new(0, 0, 0) --* CFrame.Angles(-math.rad(55*i), 0, -math.rad(15*i)) * CFrame.new(0, -0.4*i, -0.4*i)
				LH.C0 = LLWStand --* CFrame.Angles(-math.rad(55*i), 0, -math.rad(-15*i)) * CFrame.new(0, -0.4*i, -0.4*i)

				--neck.C0 = necko * CFrame.Angles(math.rad(10*i), 0, 0)
				--HW.C0 = HWStand * CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0.2*i)
				bg.cframe = CF * CFrame.Angles(math.rad(-10*i), 0, 0)
				bp.position = cen * CFrame.Angles(math.rad(180+45*i), 0, 0) * CFrame.new(0, -2.5, 0).p
				wait()
			end
			wait()
			hum.PlatformStand = false
			bg:remove()
			bp:remove()
			attack = false
		end
		for i = 0, 1, 0.1 do
			RW.C0 = RAWStand * CFrame.Angles(-math.rad(25*i), -math.rad(-20*i), 0)
			LW.C0 = LAWStand * CFrame.Angles(-math.rad(-40*i), 0, -math.rad(-30*i)) * CFrame.new(0, 0, 0.4*i)
			RH.C0 = RLWStand * CFrame.Angles(0,0, math.rad(55*i)) * CFrame.new(0, 0, 0) --* CFrame.Angles(-math.rad(55*i), 0, -math.rad(15*i)) * CFrame.new(0, 0, -0.4*i)
			LH.C0 = LLWStand * CFrame.new(0, 0, 0) --* CFrame.Angles(-math.rad(55*i), 0, -math.rad(-15*i)) * CFrame.new(0, 0, -0.4*i)
			--neck.C0 = necko * CFrame.Angles(math.rad(10*i), 0, 0)
			--HW.C0 = HWStand * CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0.2*i)
			bg.cframe = CF * CFrame.Angles(math.rad(-10*i), 0, 0)
			bp.position = cen * CFrame.Angles(math.rad(180+45*i), 0, 0) * CFrame.new(0, -2.5, 0).p
			wait()
		end
		for i = 0, 1, 0.07 do
			RW.C0 = RAWStand * CFrame.Angles(-math.rad(25), -math.rad(-20-20*i), math.rad(20*i))
			LW.C0 = LAWStand * CFrame.Angles(-math.rad(-40-70*i), 0, -math.rad(-30-10*i)) * CFrame.new(0, -0.6*i, 0.4+0.2*i)
			RH.C0 = RLWStand * CFrame.Angles(0, 0, math.rad(55+25*i)) * CFrame.new(0, -0.4*i, 0)--* CFrame.Angles(-math.rad(55+25*i), 0, -math.rad(15)) * CFrame.new(0, -0.4*i, -0.4)
			LH.C0 = LLWStand * CFrame.new(-0.8*i, 1.5*i, 0) --* CFrame.Angles(-math.rad(55+25*i), 0, -math.rad(-15)) * CFrame.new(0, -0.4*i, -0.4)
			--neck.C0 = necko * CFrame.Angles(math.rad(10-15*i), 0, 0)
			--HW.C0 = HWStand * CFrame.Angles(math.rad(40*i), 0, 0) * CFrame.new(0, 0, 0.2+0.8*i)
			bg.cframe = CF * CFrame.Angles(math.rad(-10+20*i), 0, 0)
			bp.position = cen * CFrame.Angles(math.rad(180+45+45*i), 0, 0) * CFrame.new(0, -2.5, 0.4*i).p
			wait()
		end
		wait(0.4) tors.Anchored = true bp.Parent = nil
		repeat wait() until not resting
		standup()
	end
end

-------------------------------------------------------
--End Attacks N Stuff--
-------------------------------------------------------
mouse.KeyDown:connect(function(key)
	if attack == false then
		if key == 'q' then
			Taunt1()
		elseif key == 'e' then
			Taunt2()
		elseif key == 'z' then
			Astigmatism()
		elseif key == 'x' then
			EyeThrow()
		elseif key == 'c' then
			Call_Upon_The_Eyes()
		elseif key == 'v' then
			Eyeyeyeyeyeyey_Slammo()
		end
	end
	if key == "r" then
		resting = not resting
		if resting then
			rest()
		end
	end
end)









-------------------------------------------------------
--Start Animations--
-------------------------------------------------------
for i,v in pairs(char:GetDescendants()) do
	if v:IsA("BasePart") then
		game:GetService("PhysicsService"):SetPartCollisionGroup(v, "NoCollide")
	end
end

local boombox = char:FindFirstChild("Remote",true)
if boombox then
	repeat 
		boombox = boombox.Parent
		wait()
	until boombox:IsA("Tool")
	char[plr.Name][boombox.Name].Remote:FireServer("PlaySong", SONG)
	boombox.Handle.Anchored = true
	ra["RightGrip"]:Destroy()
end

local shownhead = char:FindFirstChild("MeshPartAccessory") or char:FindFirstChild("Metashard")
shownhead = shownhead.Handle
shownhead.AccessoryWeld:Destroy()
shownhead.Anchored = true
shownhead.Transparency = 1

if char[plr.Name][shownhead.Parent.Name].Handle:FindFirstChild("AccessoryWeld") then
	char[plr.Name][shownhead.Parent.Name].Handle.AccessoryWeld:Destroy()
end

--char[plr.Name].Head:Destroy()
--char[plr.Name].Head.Parent = nil

char[plr.Name].HumanoidRootPart.BodyAngularVelocity.AngularVelocity = Vector3.new(0,311111,0)
local selection = Instance.new("SelectionBox",char[plr.Name].HumanoidRootPart)
selection.Adornee = char[plr.Name].HumanoidRootPart; selection.Color3 = Color3.new(1,0,0)

while true do
	swait()
	if char:FindFirstChild("CloneEye") then
		char[plr.Name].HumanoidRootPart.CFrame = char.CloneEye.CFrame
	elseif humrootattack then
		char[plr.Name].HumanoidRootPart.CFrame = CFrame.new(atpositi)
	else
		char[plr.Name].HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,-8,0)
	end
	--char[plr.Name].HumanoidRootPart.CanCollide = false
	--char[plr.Name].Head.CanCollide = false
	--char.Head.CanCollide = false

	if char:FindFirstChild("CloneEye") then
		shownhead.CFrame = char.CloneEye.CFrame
	else
		shownhead.CFrame = Eye.CFrame
	end

	if _G.FakeGod then
		char[plr.Name].Torso.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
		if not char[plr.Name].Torso:FindFirstChild("Neck") then
			char[plr.Name].Head.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,-4,0)
		end
	end

	sine = sine + change
	local torvel = (root.Velocity * Vector3.new(1, 0, 1)).magnitude
	local velderp = root.Velocity.y
	hitfloor, posfloor = rayCast(root.Position, CFrame.new(root.Position, root.Position - Vector3.new(0, 1, 0)).lookVector, 4* Player_Size, char)
	if equipped == true or equipped == false then
		if attack == false then
			idle = idle + 1
		else
			idle = 0
		end
		if attack and resting or not attack then
			TrsoLV = tors.CFrame.lookVector
			Dist = nil
			Diff = nil
			local _, Point = workspace:FindPartOnRay(Ray.new(hed.CFrame.p, mouse.Hit.lookVector), workspace, false, true)
			Dist = (hed.CFrame.p-Point).magnitude
			Diff = hed.CFrame.Y-Point.Y
			local _, Point2 = workspace:FindPartOnRay(Ray.new(la.CFrame.p, mouse.Hit.lookVector), workspace, false, true)
			Dist2 = (la.CFrame.p-Point).magnitude
			Diff2 = la.CFrame.Y-Point.Y
			--HEADLERP.C0 = CFrame.new(0, -1.5, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
			--Neck.C0 = Neck.C0:lerp(OrgnC0*CFrame.Angles((math.tan(Diff/Dist)*1), 0, (((hed.CFrame.p-Point).Unit):Cross(Torso.CFrame.lookVector)).Y*1), .1)
			HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0)*(CFrame.Angles(-(math.tan(Diff/Dist)*1), (((hed.CFrame.p-Point).Unit):Cross(tors.CFrame.lookVector)).Y*1, 0)), 0.1)
		end

		if 1 < root.Velocity.y and hitfloor == nil then
			Anim = "Jump"
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1 * Cos(sine / 20)* Player_Size) * angles(Rad(-16), Rad(0), Rad(0)), 0.15)
				--neck.C0 = clerp(neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(10 - 2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -.2 - 0.1 * Cos(sine / 20)* Player_Size, -.3* Player_Size) * RHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -.9 - 0.1 * Cos(sine / 20), -.5* Player_Size) * LHCF * angles(Rad(-2.5), Rad(0), Rad(0)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(25), Rad(-.6), Rad(13 + 4.5 * Sin(sine / 20))), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(25), Rad(-.6), Rad(-13 - 4.5 * Sin(sine / 20))), 0.1)
			end
		elseif -1 > root.Velocity.y and hitfloor == nil then
			Anim = "Fall"
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1 * Cos(sine / 20)* Player_Size) * angles(Rad(24), Rad(0), Rad(0)), 0.15)
				--neck.C0 = clerp(neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(10 - 2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -1 - 0.1 * Cos(sine / 20)* Player_Size, -.3* Player_Size) * RHCF * angles(Rad(-3.5), Rad(0), Rad(0)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -.8 - 0.1 * Cos(sine / 20)* Player_Size, -.3* Player_Size) * LHCF * angles(Rad(-3.5), Rad(0), Rad(0)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(65), Rad(-.6), Rad(45 + 4.5 * Sin(sine / 20))), 0.1)
				LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.02 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(55), Rad(-.6), Rad(-45 - 4.5 * Sin(sine / 20))), 0.1)
			end
		elseif torvel < 1 and hitfloor ~= nil then
			Anim = "Idle"
			change = .5
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(0), Rad(0)), 0.15)
				--tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 30)), Rad(0), Rad(0)), 0.3)
				RH.C0 = clerp(RH.C0, CF(1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, -.2* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
				LH.C0 = clerp(LH.C0, CF(-1* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-2 + 2 * Cos(sine / 12)), Rad(-74), Rad(0)) * angles(Rad(-2.5), Rad(0), Rad(-4)), 0.15)
				RW.C0 = clerp(RW.C0, CF(1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(-25 + 2.5 * Sin(sine / 20)), Rad(-55 + 2.5 * Sin(sine / 20))), 0.12)
				LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.06 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
				--HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
			end
		elseif torvel > 2 and torvel < 25 and hitfloor ~= nil then
			Anim = "Walk"
			change = 1
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.175 + 0.025 * Cos(sine / 3.5) + -Sin(sine / 3.5) / 7) * angles(Rad(3 - 2.5 * Cos(sine / 3.5)), Rad(0) - root.RotVelocity.Y / 75, Rad(3 * Cos(sine / 7))), 0.15)
				--tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(6 - 2.5 * Sin(sine / 7)), Rad(0), Rad(0) - hed.RotVelocity.Y / 15), 0.3)
				RH.C0 = clerp(RH.C0, CF(1, -0.8 - 0.5 * Cos(sine / 7) / 2, 0.6 * Cos(sine / 7) / 2)  * angles(Rad(-15 - 5 * Cos(sine / 7)) - rl.RotVelocity.Y / 75 + -Sin(sine / 7) / 2.5, Rad(90 - 3 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 + 2 * Cos(sine / 7)), Rad(0), Rad(0)), 0.3)
				LH.C0 = clerp(LH.C0, CF(-1, -0.8 + 0.5 * Cos(sine / 7) / 2, -0.6 * Cos(sine / 7) / 2) * angles(Rad(-15 + 5 * Cos(sine / 7)) + ll.RotVelocity.Y / 75 + Sin(sine / 7) / 2.5, Rad(-90 - 3 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 - 2 * Cos(sine / 7)), Rad(0), Rad(0)), 0.3)
				RW.C0 = clerp(RW.C0, CF(1* Player_Size, 0.3 + 0.02 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(-25 + 2.5 * Sin(sine / 20)), Rad(-55 + 2.5 * Sin(sine / 20))), 0.12)
				LW.C0 = clerp(LW.C0, CF(-1* Player_Size, 0.3 + 0.02 * Sin(sine / 20)* Player_Size, .6* Player_Size) * angles(Rad(-35), Rad(25 + 2.5 * Sin(sine / 20)), Rad(55 + 2.5 * Sin(sine / 20))), 0.12)
				--HW.C0 = clerp(HW.C0, CF(0, 2 + 0.2 * Cos(sine / 20), 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
			end
		elseif torvel >= 25 and hitfloor ~= nil then
			Anim = "Sprint"
			change = 1.35
			if attack == false then
				rootj.C0 = clerp(rootj.C0, RootCF * CF(0, 0, -0.175 + 0.025 * Cos(sine / 3.5) + -Sin(sine / 3.5) / 7) * angles(Rad(26 - 4.5 * Cos(sine / 3.5)), Rad(0) - root.RotVelocity.Y / 75, Rad(15 * Cos(sine / 7))), 0.15)
				--tors.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-2.5 * Sin(sine / 20)), Rad(0), Rad(0) - hed.RotVelocity.Y / 15), 0.3)
				RH.C0 = clerp(RH.C0, CF(1, -0.925 - 0.5 * Cos(sine / 7) / 2, 0.7 * Cos(sine / 7) / 2) * angles(Rad(-15 - 55 * Cos(sine / 7)) - rl.RotVelocity.Y / 75 + -Sin(sine / 7) / 2.5, Rad(90 - 0.1 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 + 0.1 * Cos(sine / 7)), Rad(0), Rad(0)), 0.3)
				LH.C0 = clerp(LH.C0, CF(-1, -0.925 + 0.5 * Cos(sine / 7) / 2, -0.7 * Cos(sine / 7) / 2) * angles(Rad(-15 + 55 * Cos(sine / 7)) + ll.RotVelocity.Y / 75 + Sin(sine / 7) / 2.5, Rad(-90 - 0.1 * Cos(sine / 7)), Rad(0)) * angles(Rad(0 - 0.1 * Cos(sine / 7)), Rad(0), Rad(0)), 0.3)
				RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 30), 0.34 * Cos(sine / 7)) * angles(Rad(110)  * Cos(sine / 7) , Rad(0), Rad(13) - ra.RotVelocity.Y / 75), 0.15)
				LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.05 * Sin(sine / 30), -0.34 * Cos(sine / 7)) * angles(Rad(-110)  * Cos(sine / 7) , Rad(0) ,	Rad(-13) + la.RotVelocity.Y / 75), 0.15)
			end
		end
	end
	neck.C0 = HW.C0 * CF(0,0,-0.5)
	for _, c in pairs(char:GetChildren()) do
		if c.ClassName == "Part" and c.Name ~= "Detail" then
			--c.Material = "Fabric"
			if c:FindFirstChildOfClass("ParticleEmitter") then
				c:FindFirstChildOfClass("ParticleEmitter"):remove()
			end
			if c ~= hed then
				--c.Color = C3(0,0,0)
			else
				c.Color = Color3.new(1,1,1)
			end
		elseif c.ClassName == "CharacterMesh" or c.ClassName == "Accessory" or c.Name == "Body Colors" then
			if c.Name ~= "Metashard" and c.Name ~= "MeshPartAccessory" then
				c:remove()
			end
		elseif (c.ClassName == "Shirt" or c.ClassName == "Pants") and c.Name ~= "Cloth" then
			c:remove()
		end
	end
	Music.SoundId = "rbxassetid://"..SONG
	Music.Looped = true
	Music.Pitch = 1
	if boombox then
		Music.Volume = 0
		boombox.Handle.CFrame = tors.CFrame * CFrame.new(3,3,1) * CFrame.Angles(math.rad(-30),math.rad(30),0)
	else
		Music.Volume = 5
	end

	Music.Parent = tors
	Music:Resume()
	if 0 < #Effects then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if 1 >= Thing[1].Transparency then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame + Vector3.new(0, 0, 0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)) + Vector3.new(0, 0.15, 0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Cylinder" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							local Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, 0.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
end
-------------------------------------------------------
--End Animations And Script--
-------------------------------------------------------
