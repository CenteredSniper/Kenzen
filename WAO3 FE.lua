local Particiles = game:GetObjects("rbxassetid://8475171979")[1]
local guantlet = game:GetObjects("rbxassetid://8475173248")[1]
wait(1)
local data = {
	Local=game.Players.LocalPlayer;
	User=game.Players.LocalPlayer;
}
--require(script:WaitForChild'ClientReplication')(script,script:WaitForChild'Owner'.Value)
--local req = data.Requests

--// Shortcut Variables \\--
local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local CF = {N=CFrame.new,A=CFrame.Angles,fEA=CFrame.fromEulerAnglesXYZ}
local C3 = {tRGB= function(c3) return c3.r*255,c3.g*255,c3.b*255 end,N=Color3.new,RGB=Color3.fromRGB,HSV=Color3.fromHSV,tHSV=Color3.toHSV}
local V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}
local M = {C=math.cos,R=math.rad,S=math.sin,P=math.pi,RNG=math.random,MRS=math.randomseed,H=math.huge,RRNG = function(min,max,div) return math.rad(math.random(min,max)/(div or 1)) end}
local R3 = {N=Region3.new}
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players


local Player = data.User
local Char = Player.Character
local Mouse = data.Local:GetMouse();
local Hum = Char:FindFirstChildOfClass'Humanoid'
local Torso = Char.Torso
local RArm = Char["Right Arm"]
local LArm = Char["Left Arm"]
local RLeg = Char["Right Leg"]
local LLeg = Char["Left Leg"]	
local Root = Char:FindFirstChild'HumanoidRootPart'
local Head = Char.Head
local Sine = 0;
local Change = 1
local Attack=false
local NeutralAnims=true
local timePos=30;
local walking=true;
local legAnims=true;
local attack1cooldown = false

local arm1 = Char["SniperShoulderL"].Handle
--arm1.Anchored = true
arm1.AccessoryWeld:Destroy()
local arm2 = Char["SniperShoulderR"].Handle
--arm2.Anchored = true
arm2.AccessoryWeld:Destroy()

local arm1weld = Instance.new("Weld",arm1)
arm1weld.C1 = CFrame.Angles(0,0,math.rad(180)) * CFrame.new(0,0.6,0)
arm1weld.Part1 = arm1
arm1weld.Part0 = Char["Right Arm"]

local arm2weld = Instance.new("Weld",arm1)
arm2weld.Part1 = arm2
arm2weld.Part0 = Char["Right Arm"]

local trail = Char:FindFirstChild("RockAccessory")
if trail then
	trail = trail.Handle
	trail.AccessoryWeld:Destroy()
	--trail.Anchored = true
	trail.SpecialMesh:Destroy()
	Char[Player.Name]["RockAccessory"].Handle.SpecialMesh:Destroy()
	local arm1weld = Instance.new("Weld",trail)
	arm1weld.C1 = CFrame.new(0,0.3,0)
	arm1weld.Part1 = trail
	arm1weld.Part0 = Char["Right Arm"]
end
local purple,red
for i,v in pairs(Char:GetChildren()) do
	if v.Name == "LargeTasseledScarf" then
		local bc = v.Handle:FindFirstChild("Mesh")
		if bc then
			local a = string.match(tostring(bc.TextureId) , "%d+")
			if a == "99856307" then
				red = v.Handle
			elseif a == "323400642" then
				purple = v.Handle
			end
		else
			local a = string.match(tostring(v.Handle.TextureID) , "%d+")
			if a == "99856307" then
				red = v.Handle
			elseif a == "323400642" then
				purple = v.Handle
			end
		end
	end
end

local yellow = Char["Solid1.0"].Handle
local white = Char["WhiteScarf"].Handle
--local grey = Char["Scarf_Black"].Handle
local cyan = Char["Scarf"].Handle
local scarfs = {purple,red,yellow,white,cyan}
for i,v in pairs(scarfs) do
	local origweld = Instance.new("ObjectValue",v)
	origweld.Value = v.AccessoryWeld.Part1
	origweld.Name = "OrigWeld"
	v.Anchored = true
	v.AccessoryWeld.Part1 = nil
end
white.Anchored = false
white.AccessoryWeld.Part1 = white.OrigWeld.Value

Gauntler = guantlet

for i,v in pairs(Gauntler:GetChildren()) do
	v.Transparency = 1
end

CharWeld = Gauntler.Handle

CharWeld.Anchored = false

Gauntler.Parent = Char

CoreWeld = Instance.new("Weld", Char)

CoreWeld.Part1  = RArm

CoreWeld.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))

CoreWeld.Part0 = CharWeld

local neoncolor = 0;
local neonbright = 1;

local movement = 8

local footsound=0;
local WalkSpeed=16;
local Combo=0;
--local ReColor = Char.RecolorRemote;
--local ModeValue = Char.ModeValue.Value;
local ModeValue = 1



NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

local welds = {}
local vars = {}
local Hit = {}

Char.Animate.Disabled = true
for i, track in pairs (Hum:GetPlayingAnimationTracks()) do track:Stop() end

function newMotor(P0,P1,C0,C1)
	P1.C0 = C0
	P1.C1 = C1
	return P1 --NewInstance('Motor',P0,{Part0=P0,Part1=P1,C0=C0,C1=C1})
end

table.insert(welds,newMotor(Torso,Torso.Neck,CF.N(0,1.5,0),CF.N()))
table.insert(welds,newMotor(Root,Root.RootJoint,CF.N(),CF.N()))
table.insert(welds,newMotor(Torso,Torso["Right Hip"],CF.N(.5,-1,0),CF.N(0,1,0)))
table.insert(welds,newMotor(Torso,Torso["Right Shoulder"],CF.N(1.5,.5,0),CF.N(0,.5,0)))
table.insert(welds,newMotor(Torso,Torso["Left Hip"],CF.N(-.5,-1,0),CF.N(0,1,0)))
table.insert(welds,newMotor(Torso,Torso["Left Shoulder"],CF.N(-1.5,.5,0),CF.N(0,.5,0)))

vars.WeldDefaults={}
for i = 1,#welds do
	local v=welds[i]
	vars.WeldDefaults[i]=v.C0
end

local NK,RJ,RH,RS,LH,LS=unpack(welds)

local NKC0,RJC0,RHC0,RSC0,LHC0,LSC0=unpack(vars.WeldDefaults)


function makeMusic(id,pit,timePos)
	local sound = Torso:FindFirstChild("WAO".."song")
	if(not sound)then 
		sound = NewInstance("Sound",Torso,{Name="WAO".."song",Volume=1,Pitch=(pit or 1),Looped=true})
		--NewInstance("EqualizerSoundEffect",sound,{HighGain=0,MidGain=2,LowGain=30})
	end
	if(id=='stop')then
		if(sound)then
			sound:Stop()
		end
	else
		local timePos = typeof(timePos)=='number' and timePos or sound.TimePosition
		sound.Volume = 1
		sound.Name = "WAO".."song"
		sound.Looped=true
		sound.SoundId = "rbxassetid://"..id
		sound.Pitch=(pit or 1)
		sound:Play()
		sound.TimePosition = timePos
	end
	return sound;
end




function playMusic(id,pitch,timePos)
	--req:Push("Broadcast","playMusic",id,pitch,timePos)
	return makeMusic(id,pitch,timePos)
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
	v:Stop(0);
end

-- SCRIPT STUFF --
local Frame_Speed = 60 -- The frame speed for swait. 1 is automatically divided by this
--// Artificial HB \\--

local ArtificialHB = script:FindFirstChild'Heartbeat' or IN("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

local tf = 0
local allowframeloss = true
local tossremainder = true
local lastframe = tick()
local frame = 1/Frame_Speed
ArtificialHB:Fire()

game:GetService("RunService").Stepped:connect(function(s, p)
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

--// Effects \\--


if(workspace:FindFirstChild("WAO"..'Effects'))then
	workspace["WAO"..'Effects']:destroy()
end

local Effects=NewInstance("Folder",Char)
Effects.Name="WAO"..'Effects'

function ShowDamage(Pos, Text, Time, Color)
	local Pos = Pos or V3.N(0, 0, 0)
	local Text = tostring(Text or "")
	local Time = Time or 2
	local Color = Color or C3.N(1, 0, 1)
	local EffectPart = Part(Effects,Color,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),CFrame.new(Pos),true,false)
	EffectPart.Transparency=1
	local BillboardGui = NewInstance("BillboardGui",EffectPart,{
		Size = UDim2.new(3,0,3,0),
		Adornee = EffectPart,
	})

	local TextLabel = NewInstance("TextLabel",BillboardGui,{
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		TextColor3 = Color,
		TextScaled = true,
		Font = Enum.Font.ArialBold, 
	})
	S.Debris:AddItem(EffectPart, Time+.5)
	delay(0, function()
		local rot=math.random(-10,10)/15
		local raise=.2
		local Frames = Time/Frame_Speed
		for i=0,1.1,.02 do
			swait()
			TextLabel.Rotation=TextLabel.Rotation+rot
			raise=raise-.008
			EffectPart.Position = EffectPart.Position + Vector3.new(0, raise, 0)
			TextLabel.TextTransparency=i
			TextLabel.TextStrokeTransparency=i
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end

--req:AddReciever("ShowDamage",ShowDamage)


local baseSound = IN("Sound")
function Sound(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = baseSound:Clone()
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or Torso
	return Sound
end
function Part(parent,color,material,size,cframe,anchored,cancollide)
	local part = IN("Part")
	part.Parent = parent or Char
	part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface,part.BottomSurface=10,10
	part.Size = size or V3.N(1,1,1)
	part.CFrame = cframe or CF.N(0,0,0)
	part.CanCollide = cancollide or false
	part.Anchored = anchored or false
	return part
end

function Weld(part0,part1,c0,c1)
	local weld = IN("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or CF.N()
	weld.C1 = c1 or CF.N()
	return weld
end

function Mesh(parent,meshtype,meshid,textid,scale,offset)
	local part = IN("SpecialMesh")
	part.MeshId = meshid or ""
	part.TextureId = textid or ""
	part.Scale = scale or V3.N(1,1,1)
	part.Offset = offset or V3.N(0,0,0)
	part.MeshType = meshtype or Enum.MeshType.Sphere
	part.Parent = parent
	return part
end

function GotEffect(data)
	-- just for easy reference
	local color = data.Color or Color3.new(.7,.7,.7);
	local endcolor = data.EndColor or nil;
	local mat = data.Material or Enum.Material.SmoothPlastic;
	local cframe = data.CFrame or CFrame.new();
	local endpos = data.EndPos or nil;
	local meshdata = data.Mesh or {}
	local sounddata = data.Sound or {}
	local size = data.Size or Vector3.new(1,1,1)
	local endsize = data.EndSize or Vector3.new(6,6,6)
	local rotinc = data.RotInc or {0,0,0} -- ONLY FOR LEGACY SYSTEM
	local transparency = data.Transparency or NumberRange.new(0,1)
	local acceleration = data.Acceleration or nil; -- ONLY FOR LEGACY SYSTEM
	local endrot = data.EndRotation or {0,0,0} -- ONLY FOR EXPERIMENTAL SYSTEM
	local style = data.Style or false; -- ONLY FOR EXPERIMENTAL SYSTEM
	local lifetime = data.Lifetime or 1;
	local system = data.FXSystem;
	local S,PM;

	local P = Part(workspace,color,mat,Vector3.new(1,1,1),cframe,true,false)

	if(meshdata == "Blast")then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://20329976','',size,Vector3.new(0,0,-size.X/8))
	elseif(meshdata == 'Ring')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://559831844','',size,Vector3.new(0,0,0))
	elseif(meshdata == 'Slash1')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(size.X/10,.001,size.Z/10),Vector3.new(0,0,0))
	elseif(meshdata == 'Slash2')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(size.X/1000,size.Y/100,size.Z/100),Vector3.new(0,0,0))
	elseif(meshdata == 'Tornado1')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://443529437','',size/10,Vector3.new(0,0,0))
	elseif(meshdata == 'Tornado2')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://168892432','',size/4,Vector3.new(0,0,0))
	elseif(meshdata == 'Skull')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://4770583','',size*2,Vector3.new(0,0,0))
	elseif(meshdata == 'Crystal')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://9756362','',size,Vector3.new(0,0,0))
	elseif(meshdata == 'Cloud')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://1095708','',size,Vector3.new(0,0,0))
	elseif(typeof(meshdata) == 'table')then
		local Type = meshdata.Type or Enum.MeshType.Brick
		local ID = meshdata.ID or '';
		local Tex = meshdata.Texture or '';
		local Offset = meshdata.Offset or Vector3.new(0,0,0)
		PM = Mesh(P,Type,ID,Tex,size,Offset)
	else
		PM = Mesh(P,Enum.MeshType.Brick,'','',size)
	end

	local startTrans = typeof(transparency) == 'number' and transparency or typeof(transparency) == 'NumberRange' and transparency.Min or typeof(transparency) == 'table' and transparency[1] or 0
	local endTrans = typeof(transparency) == 'NumberRange' and transparency.Max or typeof(transparency) == 'table' and transparency[2] or 1


	P.Transparency = startTrans
	local random = Random.new();
	game:service'Debris':AddItem(P,lifetime+3)


	-- actual effect stuff
	local mult = 1;
	if(PM.MeshId == 'rbxassetid://20329976')then
		PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
	elseif(PM.MeshId == 'rbxassetid://4770583')then
		mult = 2
	elseif(PM.MeshId == 'rbxassetid://168892432')then
		mult = .25
	elseif(PM.MeshId == 'rbxassetid://443529437')then
		mult = .1
	elseif(PM.MeshId == 'rbxassetid://443529437')then
		mult = .1
	end

	coroutine.wrap(function()
		if(system == 'Legacy' or system == 1 or system == nil)then
			local frames = (typeof(lifetime) == 'NumberRange' and random:NextNumber(lifetime.Min,lifetime.Max) or typeof(lifetime) == 'number' and lifetime or 1)*Frame_Speed
			for i = 0, frames do
				local div = (i/frames)
				P.Transparency=(startTrans+(endTrans-startTrans)*div)

				PM.Scale = size:lerp(endsize*mult,div)

				local RotCF=CFrame.Angles(0,0,0)

				if(rotinc == 'random')then
					RotCF=CFrame.Angles(math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)))
				elseif(typeof(rotinc) == 'table')then
					RotCF=CFrame.Angles(unpack(rotinc))
				end

				if(PM.MeshId == 'rbxassetid://20329976')then
					PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
				end

				if(endpos and typeof(endpos) == 'CFrame')then
					P.CFrame=cframe:lerp(endpos,div)*RotCF
				elseif(acceleration and typeof(acceleration) == 'table' and acceleration.Force)then
					local force = acceleration.Force;
					if(typeof(force)=='CFrame')then
						force=force.p;
					end
					if(typeof(force)=='Vector3')then
						if(acceleration.LookAt)then
							P.CFrame=(CFrame.new(P.Position,force)+force)*RotCF
						else
							P.CFrame=(P.CFrame+force)*RotCF
						end
					end
				else
					P.CFrame=P.CFrame*RotCF
				end

				if(endcolor and typeof(endcolor) == 'Color3')then
					P.Color = color:lerp(endcolor,div)
				end
				swait()
			end
			P:destroy()
		elseif(system == 'Experimental' or system == 2)then
			local info = TweenInfo.new(lifetime,style,Enum.EasingDirection.InOut,0,false,0)
			local info2 = TweenInfo.new(lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
			if(style == Enum.EasingStyle.Elastic)then
				info = TweenInfo.new(lifetime*2,style,Enum.EasingDirection.Out,0,false,0)
			elseif(style == Enum.EasingStyle.Bounce)then
				info = TweenInfo.new(lifetime,style,Enum.EasingDirection.Out,0,false,0)
			end
			local tweenPart = game:service'TweenService':Create(P,info2,{
				CFrame=(typeof(endpos) == 'CFrame' and endpos or P.CFrame)*CFrame.Angles(unpack(endrot)),
				Color=typeof(endcolor) == 'Color3' and endcolor or color,
				Transparency=endTrans,
			})
			local off = Vector3.new(0,0,0)
			if(PM.MeshId == 'rbxassetid://20329976')then off=Vector3.new(0,0,(endsize*mult).Z/8) end

			local tweenMesh = game:service'TweenService':Create(PM,info,{
				Scale=endsize*mult,
				Offset=off,
			})
			tweenPart:Play()
			tweenMesh:Play()
		end
	end)()
end

function Effect(data)
	if(data.User==data.Local)then
		--req:Push("Broadcast","effect",data)
		GotEffect(data)
	end
end

function Trail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			Effect(data)
			swait()
		end	
	end)()
end

function ClientTrail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			GotEffect(data)
			swait()
		end	
	end)()
end

function syncStuff(data)
	local neut,legwelds,c0s,c1s,sine,mov,walk,inc=unpack(data)
	local head0,torso0,rleg0,rarm0,lleg0,larm0=unpack(c0s)
	local head1,torso1,rleg1,rarm1,lleg1,larm1=unpack(c1s)
	legAnims=legwelds
	NeutralAnims=neut
	if(not neut)then
		NK.C0=head0
		RJ.C0=torso0
		RH.C0=rleg0
		RS.C0=rarm0
		LH.C0=lleg0
		LS.C0=larm0

		NK.C1=head1
		RJ.C1=torso1
		RH.C1=rleg1
		RS.C1=rarm1
		LH.C1=lleg1
		LS.C1=larm1
	end
	movement=mov
	walking=walk
	Change=inc
	if(Sine-sine>.8 or Sine-sine<-.8)then
		Sine=sine
	end
end

BillboardGui0 = Instance.new("BillboardGui")
ModeName = Instance.new("TextLabel")
BillboardGui0.Parent = Char.Head
BillboardGui0.Size = UDim2.new(4.5, 0, 2, 0)
BillboardGui0.ClipsDescendants = true
BillboardGui0.ResetOnSpawn = false
BillboardGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui0.StudsOffset = Vector3.new(0, 2, 0)
BillboardGui0.Name = "Wooh"
ModeName.Parent = BillboardGui0
ModeName.Position = UDim2.new(0, 0, -0.0500000007, 0)
ModeName.Size = UDim2.new(1, 0, 1, 0)
ModeName.BackgroundColor = BrickColor.new("Institutional white")
ModeName.BackgroundColor3 = Color3.new(1, 1, 1)
ModeName.BackgroundTransparency = 1
ModeName.Font = Enum.Font.SciFi
ModeName.FontSize = Enum.FontSize.Size60
ModeName.Text = "Normal"
ModeName.TextColor = BrickColor.new("Institutional white")
ModeName.TextColor3 = Color3.new(1, 1, 1)
ModeName.TextScaled = true
ModeName.TextSize = 50
ModeName.TextStrokeTransparency = 0
ModeName.TextWrap = true
ModeName.TextWrapped = true

local Change = 0.5

function ReColorStuff(Color,ModeName,Font,Particle,ModeValuee,SongId,Pitch,Ws,ChangeProperty,Movement)
	--ReColor:FireServer(Color,ModeName,Font,Particle,ModeValue,ChangeProperty)
	local Change = ChangeProperty
	for i,v in pairs(Gauntler:GetChildren())do
		if string.lower(v.Name) == "neon" then
			v.Color = Color
		end
		if string.lower(v.Name) == "handle" then
			for _,x in pairs(v:GetChildren())do
				if x:IsA("ParticleEmitter")then
					x:Destroy()
				end
			end	
		end
	end

	for i,v in pairs(Particiles:GetChildren())do
		if v.Name == tostring(Particle)then
			for _,x in pairs(v:GetChildren())do
				Part = x:Clone()
				Part.Parent = Gauntler.Handle
			end
		end
	end

	--ModeName.Text = tostring(ModeName)
	--ModeName.Font = Font
	--ModeName.TextColor3 = Color

	ModeValue = tonumber(ModeValuee)
	playMusic(SongId,Pitch)
	WalkSpeed = Ws
	movement = tonumber(Movement)
	Head.Wooh.TextLabel.TextColor3 = Color
	Head.Wooh.TextLabel.Font = Font
	Head.Wooh.TextLabel.Text = tostring(ModeName)
	for i,v in pairs(Char.Gaunter:GetChildren())do
		if string.lower(v.Name) == "neon" then
			v.Color = Color
		end	
	end

end

ReColorStuff(Color3.new(1,1,1),"Normal",Enum.Font.SciFi,"Normal",1,1557258673,1.01,16,0.5,8)


function DealDamage(...)
	--req:Push("Damage",...)
end

function getRegion(point,range,ignore)
	return workspace:FindPartsInRegion3WithIgnoreList(R3.N(point-V3.N(1,1,1)*range/2,point+V3.N(1,1,1)*range/2),ignore,100)
end
function AOEDamage(where,range,options)
	local hit = {}
	for _,v in next, getRegion(where,range,{Char}) do
		if(v.Parent and v.Parent:FindFirstChildOfClass'Humanoid' and not hit[v.Parent:FindFirstChildOfClass'Humanoid'])then
			local callTable = {Who=v.Parent}
			hit[v.Parent:FindFirstChildOfClass'Humanoid'] = true
			for _,v in next, options do callTable[_] = v end
			DealDamage(callTable)
		end
	end
	return hit
end


function AttackTest()
	Attack = true
	legAnims = false
	NeutralAnims = false
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 3

	for i = 0,15 do
		swait()
		local Alpha = .2
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.7)*CF.A(math.rad(15),math.rad(-50),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.5,0.4,0.3)*CF.A(math.rad(61.4),math.rad(-22.4),math.rad(9.9)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.4,0.3)*CF.A(math.rad(70),math.rad(0),math.rad(35)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-13),math.rad(39.3),math.rad(8.3)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.8,-1.2,-0.3)*CF.A(math.rad(-33.4),math.rad(39.9),math.rad(22.9)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0.1)*CF.A(math.rad(0),math.rad(-45),math.rad(25)),Alpha)
	end

	--Sound(RArm)

	for i = 0,10 do
		swait()
		AOEDamage(RArm.CFrame.p,2,{
			DamageColor=Char.Gaunter.neon;
			MinimumDamage=15;
			MaximumDamage=19;
			HitSound=199149409;
			HitPitch=.5;
		})
		--Effect()
		local Alpha = .5
		RJ.C0 = RJ.C0:lerp(CF.N(0.3,-0.4,-1.8)*CF.A(math.rad(-25),math.rad(25),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.5,0.6,0.2)*CF.A(math.rad(-24),math.rad(-24.2),math.rad(-18.3)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.4,-0.3)*CF.A(math.rad(96.6),math.rad(-14.5),math.rad(3.4)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(-20),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.3,-0.6,-0.5)*CF.A(math.rad(41.8),math.rad(-15.2),math.rad(13.2)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-0.8,0.2)*CF.A(math.rad(-60.4),math.rad(-5),math.rad(-8.7)),Alpha)
	end



	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false
end

function AttackTest2()
	Attack = true
	legAnims = false
	NeutralAnims = false
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 3


	for i = 0,15 do
		local Alpha = .2  
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,-0.5,0.4)*CF.A(math.rad(-35),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.4,0,0.1)*CF.A(math.rad(60),math.rad(0),math.rad(0)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.4,-0.3)*CF.A(math.rad(30),math.rad(0),math.rad(5)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(15),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.3,-0.5)*CF.A(math.rad(40),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,-0.5)*CF.A(math.rad(-35),math.rad(0),math.rad(0)),Alpha)
	end

	for i = 0,10 do
		swait()
		local Alpha = .5

		AOEDamage(RLeg.CFrame.p,2,{
			DamageColor=Char.Gaunter.neon;
			MinimumDamage=15;
			MaximumDamage=22;
			HitSound=199149409;
			HitPitch=.5;
		})
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.5)*CF.A(math.rad(25),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.5,0.4,0.3)*CF.A(math.rad(-45),math.rad(0),math.rad(0)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.5,0.4,0.3)*CF.A(math.rad(-45),math.rad(0),math.rad(0)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.2,-0.5)*CF.A(math.rad(-40),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,-0.1)*CF.A(math.rad(70),math.rad(0),math.rad(0)),Alpha)
	end



	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false	
end

function AttackTest3()
	legAnims = false
	NeutralAnims = false
	Attack = true
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 0



	for i = 0,10 do
		local Alpha = .5
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(10),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.1,0.6,-0.2)*CF.A(math.rad(59.1),math.rad(2.9),math.rad(64.9)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.7,0.7,-0.4)*CF.A(math.rad(14.1),math.rad(32.9),math.rad(11.2)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,0.2,-0.9)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1,-0.3)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
	end


	AOEDamage(LLeg.CFrame.p,5,{
		DamageColor=Char.Gaunter.neon;
		MinimumDamage=20;
		MaximumDamage=34;
		HitSound=199149409;
		HitPitch=.5;
	})


	for i = 0,7 do
		local Alpha = .5
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.1)*CF.A(math.rad(-15),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.5,0.6,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(-10)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.6,0.6,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(10)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.9,-0.5)*CF.A(math.rad(25),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.1)*CF.A(math.rad(-5),math.rad(0),math.rad(0)),Alpha)
	end




	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false
end

function Shockwave()
	attack1cooldown = true
	legAnims = false
	NeutralAnims = false
	Attack = true
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 0



	for i = 0,30 do
		local Alpha = .1
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(10),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.1,0.6,-0.2)*CF.A(math.rad(144),math.rad(-30),math.rad(50)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(150),math.rad(20),math.rad(-57)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,0.2,-0.9)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1,-0.3)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
	end

	Effect({color=Char.Gaunter.neon,
		endcolor=Char.Gaunter.neon;
		mat=Enum.Material.Neon;
		cframe=CFrame.new(LLeg.CFrame.p);
		endpos=CFrame.new(LLeg.CFrame.p);
		sounddata=data.Sound;
		size=Vector3.new(2,2,2);
		endsize=Vector3.new(11,11,11);
	})

	AOEDamage(LLeg.CFrame.p,19,{
		DamageColor=Char.Gaunter.neon;
		MinimumDamage=35;
		MaximumDamage=65;
		HitSound=199149409;
		HitPitch=.4;
	})


	for i = 0,11 do
		local Alpha = .6
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.1)*CF.A(math.rad(-15),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.5,0.3,-0.1)*CF.A(math.rad(20),math.rad(0),math.rad(-60)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.6,0.3,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(60.7)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.9,-0.5)*CF.A(math.rad(25),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.1)*CF.A(math.rad(-5),math.rad(0),math.rad(0)),Alpha)
	end


	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false

	wait(4)
	attack1cooldown = false
end


function WarlockFist() --MAY OR MAY NOT BE A ROGUE LINEAGE REFRENCE
	attack1cooldown = true
	legAnims = true
	NeutralAnims = false
	Attack = true
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 7

	Effect({
		Color = Color3.new(0,1,0), -- The Starting Color, Or The Only Color If The EndColor Value Isin't Specified    
		EndColor = Color3.new(0,0,0), -- The Ending Color
		Material = Enum.Material.Neon, -- The  Material Of The Effect
		CFrame = RArm.CFrame, -- The Starting CFrame Of The Effect, Or The Only CFrame If The EndPos Value Isin't Specified
		EndPos = RArm.CFrame, -- The Ending CFrame

		Mesh = { -- The Meshes Data Is A Table, Don't Forget It
			Type = Enum.MeshType.Torso, -- The NeshType Of The Mesh
			ID = "", -- The MeshId Of The Mesh, Only Use This When The MeshType Is A FileMesh
			Tex = "" -- The TextureID Of The Mesh, Only Use This When The MeshType Is A FileMesh    
		},

		Size = Vector3.new(0.1,0.1,0.1), -- The Starting Size, Or The Only Size If The EndSize Value Isin't Specified    
		EndSize = Vector3.new(3,3,3), -- The End Size
		Transparency = NumberRange.new(0,1), -- The Transparency Of The Part, It Rages From The First From The Second (Going From A, To B)
		LifeTime = 0.1 -- The Time That The Effect Will Last For

	})


	for i = 0,65 do
		local Alpha = .1
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(0),math.rad(-60),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-0.5,0.6,-0.2)*CF.A(math.rad(90),math.rad(-26),math.rad(90)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(104),math.rad(14),math.rad(-70)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(70),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.5)*CF.A(math.rad(-0),math.rad(150),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1,-0.5)*CF.A(math.rad(-0),math.rad(150),math.rad(0)),Alpha)
	end

	AOEDamage(LLeg.CFrame.p,4,{
		DamageColor=Char.Gaunter.neon;
		MinimumDamage=65;
		MaximumDamage=90;
		HitSound=697997892;
		HitPitch=.7;
	})

	legAnims = false

	WalkSpeed = 0

	for i = 0,20 do
		local Alpha = .9
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(0),math.rad(53),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-0.4,0.6,-0.2)*CF.A(math.rad(90),math.rad(-26),math.rad(80)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(104),math.rad(14),math.rad(25)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(-52),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.9,-0.5)*CF.A(math.rad(-0),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.1)*CF.A(math.rad(-0),math.rad(0),math.rad(0)),Alpha)
	end


	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false

	wait(4)
	attack1cooldown = false
end


function EnergyField()
	attack1cooldown = true
	legAnims = true
	NeutralAnims = false
	Attack = true
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 17


	for i = 0,30 do
		local Alpha = .3
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(0),math.rad(-0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-0.5,0.6,-0.2)*CF.A(math.rad(128),math.rad(-0),math.rad(30)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(147),math.rad(25),math.rad(-0)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
	end

	AOEDamage(LLeg.CFrame.p,4,{
		DamageColor=Char.Gaunter.neon;
		MinimumDamage=20;
		MaximumDamage=35;
		HitSound=697997892;
		HitPitch=.7;
	})

	for i = 0,100 do
		local Alpha = .9
		AOEDamage(LLeg.CFrame.p,13,{
			DamageColor=Char.Gaunter.neon;
			MinimumDamage=3;
			MaximumDamage=8;
			HitSound=588732660;
			HitPitch=.7;
		})
		Effect({
			Color = Color3.fromRGB(107, 50, 124), -- The Starting Color, Or The Only Color If The EndColor Value Isin't Specified    
			EndColor = Color3.new(0,0,0), -- The Ending Color
			Material = Enum.Material.Neon, -- The  Material Of The Effect
			CFrame = RArm.CFrame, -- The Starting CFrame Of The Effect, Or The Only CFrame If The EndPos Value Isin't Specified
			EndPos = RArm.CFrame, -- The Ending CFrame

			Mesh = { -- The Meshes Data Is A Table, Don't Forget It
				Type = Enum.MeshType.Torso, -- The NeshType Of The Mesh
				ID = "", -- The MeshId Of The Mesh, Only Use This When The MeshType Is A FileMesh
				Tex = "" -- The TextureID Of The Mesh, Only Use This When The MeshType Is A FileMesh    
			},

			Size = Vector3.new(2,2,2), -- The Starting Size, Or The Only Size If The EndSize Value Isin't Specified    
			EndSize = Vector3.new(12,12,12), -- The End Size
			Transparency = NumberRange.new(0.7,1), -- The Transparency Of The Part, It Rages From The First From The Second (Going From A, To B)
			Lifetime = 0.1 -- The Time That The Effect Will Last For
		})
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(0),math.rad(-0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-0.5,0.6,-0.2)*CF.A(math.rad(65),math.rad(-10),math.rad(30)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(84),math.rad(25),math.rad(-0)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
	end


	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false

	wait(4)
	attack1cooldown = false
end


function soontobehellfireskill()
	attack1cooldown = true
	legAnims = true
	NeutralAnims = false
	Attack = true
	CurrentWS = tonumber(WalkSpeed)
	WalkSpeed = 17


	for i = 0,30 do
		local Alpha = .3
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(0),math.rad(-0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-0.5,0.6,-0.2)*CF.A(math.rad(128),math.rad(-0),math.rad(30)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(147),math.rad(25),math.rad(-0)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.5)*CF.A(math.rad(-0),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1,-0.5)*CF.A(math.rad(-0),math.rad(0),math.rad(0)),Alpha)
	end

	AOEDamage(LLeg.CFrame.p,4,{
		DamageColor=Char.Gaunter.neon;
		MinimumDamage=20;
		MaximumDamage=35;
		HitSound=697997892;
		HitPitch=.7;
	})

	for i = 0,100 do
		local Alpha = .9
		AOEDamage(LLeg.CFrame.p,13,{
			DamageColor=Char.Gaunter.neon;
			MinimumDamage=3;
			MaximumDamage=8;
			HitSound=588732660;
			HitPitch=.7;
		})
		Effect({color=Char.Gaunter.neon,
			endcolor=Char.Gaunter.neon;
			mat=Enum.Material.Neon;
			cframe=CFrame.new(RArm.CFrame.p);
			endpos=CFrame.new(RArm.CFrame.p);
			sounddata=data.Sound;
			size=Vector3.new(2,2,2);
			endsize=Vector3.new(11,11,11);
		})
		swait()
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(0),math.rad(-0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-0.5,0.6,-0.2)*CF.A(math.rad(65),math.rad(-10),math.rad(30)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.1,0.7,-0.4)*CF.A(math.rad(84),math.rad(25),math.rad(-0)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.2)*CF.A(math.rad(-0),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1,-0.2)*CF.A(math.rad(-0),math.rad(0),math.rad(0)),Alpha)
	end


	WalkSpeed = CurrentWS
	legAnims = true
	NeutralAnims = true
	Attack = false

	wait(4)
	attack1cooldown = false
end

function soontobeenergeticskill()
	attack1cooldown = true
	legAnims = false
	NeutralAnims = false
	Attack = true
	Hum.JumpPower = 0
	CurrentWS = tonumber(WalkSpeed)

	for i = 0,300 do
		local Alpha = .3
		swait()
		Effect({
			Color = Color3.new(1,1,0),  
			EndColor = Color3.new(0,0,0),
			Material = Enum.Material.Neon,
			CFrame = LLeg.CFrame,
			EndPos = LLeg.CFrame,

			Mesh = { -- The Meshes Data Is A Table, Don't Forget It
				Type = Enum.MeshType.Torso, -- The NeshType Of The Mesh
				ID = "", -- The MeshId Of The Mesh, Only Use This When The MeshType Is A FileMesh
				Tex = "" -- The TextureID Of The Mesh, Only Use This When The MeshType Is A FileMesh    
			},

			Size = Vector3.new(0.1,0.1,0.1), -- The Starting Size, Or The Only Size If The EndSize Value Isin't Specified    
			EndSize = Vector3.new(3,3,3), -- The End Size
			Transparency = NumberRange.new(0,1), -- The Transparency Of The Part, It Rages From The First From The Second (Going From A, To B)
			LifeTime = 0.1 -- The Time That The Effect Will Last For
		})
		Effect({
			Color = Color3.new(1,1,0),  
			EndColor = Color3.new(0,0,0),
			Material = Enum.Material.Neon,
			CFrame = RLeg.CFrame,
			EndPos = RLeg.CFrame,

			Mesh = { -- The Meshes Data Is A Table, Don't Forget It
				Type = Enum.MeshType.Torso, -- The NeshType Of The Mesh
				ID = "", -- The MeshId Of The Mesh, Only Use This When The MeshType Is A FileMesh
				Tex = "" -- The TextureID Of The Mesh, Only Use This When The MeshType Is A FileMesh    
			},

			Size = Vector3.new(0.1,0.1,0.1), -- The Starting Size, Or The Only Size If The EndSize Value Isin't Specified    
			EndSize = Vector3.new(3,3,3), -- The End Size
			Transparency = NumberRange.new(0,1), -- The Transparency Of The Part, It Rages From The First From The Second (Going From A, To B)
			LifeTime = 0.1 -- The Time That The Effect Will Last For
		})
		Root.Velocity = Root.CFrame.lookVector * 120
		AOEDamage(Torso.CFrame.p,6,{
			DamageColor=Char.Gaunter.neon;
			MinimumDamage=8;
			MaximumDamage=14;
			HitSound=697997892;
			HitPitch=.7;
		})
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0.2)*CF.A(math.rad(-20 + 2 * math.sin(Sine/2)),math.rad(-0),math.rad(0)),Alpha)
		NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(20),math.rad(0),math.rad(0)),Alpha)
		LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+160*(4/8)*M.S(Sine/4))*1,0,M.R(-5-5*M.C(Sine/4))),Alpha)
		RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0,0)*CF.A(M.R(0-160*(4/8)*M.S(Sine/4))*1,0,M.R(0+5*M.C(Sine/4))),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.2)*CF.A(math.rad(-0 - 110 * math.sin(Sine/2)),math.rad(0),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1,-0.2)*CF.A(math.rad(-0 + 110 * math.sin(Sine/2)),math.rad(0),math.rad(0)),Alpha)
	end
	WalkSpeed = CurrentWS
	legAnims = true
	Hum.JumpPower = 50
	NeutralAnims = true
	Attack = false

	wait(4)
	attack1cooldown = false
end


--local ComboVal = Char.ComboVal.Value
local ComboVal = 1

--local ComboValRemote = Char.ComboValRemote

function AttackController()

	if game.Players.LocalPlayer == Player then
		--ComboVal = Char.ComboVal.Value

		if ComboVal == 1 then
			ComboVal =  tonumber(2)
			--ComboValRemote:FireServer(2)
			AttackTest()
		elseif ComboVal == 2 then
			ComboVal =  tonumber(3)
			--ComboValRemote:FireServer(3)
			AttackTest2()
		elseif ComboVal == 3 then
			ComboVal =  tonumber(1)
			--ComboValRemote:FireServer(1)
			AttackTest3()
		end
	end

end


game:service'UserInputService'.InputBegan:connect(function(io,gpe)
	if(gpe or Attack or data.User~=data.Local)then return end
	if(io.UserInputType==Enum.UserInputType.MouseButton1 and Attack == false)then
		AttackController()
	end
	if(io.KeyCode==Enum.KeyCode.Q and Attack == false and ModeValue ~= 1)then
		ReColorStuff(Color3.new(1,1,1),"Normal",Enum.Font.SciFi,"Normal",1,1557258673,1.01,16,0.5,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		white.Anchored = false
		white.AccessoryWeld.Part1 = white.OrigWeld.Value	
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and ModeValue == 1 and attack1cooldown == false)then
		-- Disabled bc lazy --Shockwave()
	elseif(io.KeyCode==Enum.KeyCode.E and Attack == false and ModeValue ~= 2)then
		ReColorStuff(Color3.fromRGB(85, 255, 0),"Nuclear",Enum.Font.Antique,"Nuclear",2,415886279,1.01,16,0.5,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		yellow.Anchored = false
		yellow.AccessoryWeld.Part1 = yellow.OrigWeld.Value
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and ModeValue == 2 and attack1cooldown == false)then
		-- Disabled bc lazy --WarlockFist()
	elseif(io.KeyCode==Enum.KeyCode.M and Attack == false and ModeValue == 2)then
		ReColorStuff(Color3.fromRGB(44, 101, 29),"Radioactive",Enum.Font.Antique,"Radioactive",23,415189505,1.01,16,0.5,8)	
	elseif(io.KeyCode==Enum.KeyCode.T and Attack == false and ModeValue ~= 3)then
		ReColorStuff(Color3.fromRGB(170, 85, 0),"Incendiary",Enum.Font.Garamond,"Incendiary",3,432493949,1.01,16,0.5,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		red.Anchored = false
		red.AccessoryWeld.Part1 = red.OrigWeld.Value	
	elseif(io.KeyCode==Enum.KeyCode.R and Attack == false and ModeValue ~= 4)then
		ReColorStuff(Color3.fromRGB(107, 50, 124),"Revolution",Enum.Font.Code,"Revolution",4,754133145,1.01,24,0.6,12)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		purple.Anchored = false
		purple.AccessoryWeld.Part1 = purple.OrigWeld.Value	
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and ModeValue == 4 and attack1cooldown == false)then
		-- Disabled bc lazy --EnergyField()
	elseif(io.KeyCode==Enum.KeyCode.Y and Attack == false and ModeValue ~= 5)then
		ReColorStuff(Color3.fromRGB(255, 0, 0),"Hellfire",Enum.Font.Bodoni,"Hellfire",5,202697708,1.01,40,0.8,14)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		red.Anchored = false
		red.AccessoryWeld.Part1 = red.OrigWeld.Value		
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and ModeValue == 5 and attack1cooldown == false)then
		-- Disabled bc lazy --soontobehellfireskill()
	elseif(io.KeyCode==Enum.KeyCode.U and Attack == false and ModeValue ~= 6)then
		ReColorStuff(Color3.fromRGB(255, 255, 0),"Energetic",Enum.Font.SciFi,"Energetic",6,885342933,1.01,16,0.5,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		yellow.Anchored = false
		yellow.AccessoryWeld.Part1 = yellow.OrigWeld.Value		
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and ModeValue == 6 and attack1cooldown == false)then
		-- Disabled bc lazy --soontobeenergeticskill()
	elseif(io.KeyCode==Enum.KeyCode.P and Attack == false and ModeValue ~= 7)then
		ReColorStuff(Color3.fromRGB(170, 0, 170),"Love",Enum.Font.Cartoon,"Love",7,1426028386,1.01,12,0.4,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		cyan.Anchored = false
		cyan.AccessoryWeld.Part1 = cyan.OrigWeld.Value		
	elseif(io.KeyCode==Enum.KeyCode.F and Attack == false and ModeValue ~= 8)then
		ReColorStuff(Color3.fromRGB(33, 84, 185),"Ascended",Enum.Font.SciFi,"Ascended",8,502270913,1.01,40,0.8,14)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		cyan.Anchored = false
		cyan.AccessoryWeld.Part1 = cyan.OrigWeld.Value			
	elseif(io.KeyCode==Enum.KeyCode.J and Attack == false and ModeValue ~= 9)then
		ReColorStuff(Color3.fromRGB(0, 32, 96),"Water",Enum.Font.Cartoon,"Water",9,233580752,1.01,16,0.5,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		purple.Anchored = false
		purple.AccessoryWeld.Part1 = purple.OrigWeld.Value		
	elseif(io.KeyCode==Enum.KeyCode.K and Attack == false)then
		ReColorStuff(Color3.fromRGB(255, 255, 255),"Radio",Enum.Font.SciFi,"Radio",1,635559294,1.01,16,0.5,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = true
			v.AccessoryWeld.Part1 = nil
		end
		white.Anchored = false
		white.AccessoryWeld.Part1 = white.OrigWeld.Value			
	elseif(io.KeyCode==Enum.KeyCode.G and Attack == false and ModeValue ~= 11)then
		ReColorStuff(Color3.fromRGB(255, 255, 255),"Prismatic",Enum.Font.Arcade,"Prismatic",11,1747430851,1.01,16,0.7,8)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = false
			v.AccessoryWeld.Part1 = v.OrigWeld.Value
		end
	elseif(io.KeyCode==Enum.KeyCode.H and Attack == false and ModeValue ~= 010)then
		ReColorStuff(Color3.fromRGB(math.random(0,155),math.random(0,155),math.random(0,155)),"N_N3Ex1sTAnc3",Enum.Font.SciFi,"N_N3Ex1sTAnc3",010,1119709168,1.01,70,0.9,17)
		for i,v in pairs(scarfs) do
			local origweld = Instance.new("ObjectValue",v)
			origweld.Value = v.AccessoryWeld.Part1
			origweld.Name = "OrigWeld"
			v.Anchored = false
			v.AccessoryWeld.Part1 = v.OrigWeld.Value
		end
	end
end)

local footstepSounds = {
	[Enum.Material.Grass]=510933218;
	[Enum.Material.Metal]=1263161138;
	[Enum.Material.CorrodedMetal]=1263161138;
	[Enum.Material.DiamondPlate]=1263161138;
	[Enum.Material.Wood]=2452053757;
	[Enum.Material.WoodPlanks]=2452053757;
	[Enum.Material.Sand]=134456884;
	[Enum.Material.Snow]=2452051182;
}

spawn((function()
	while true do
		swait()
		if neoncolor > 1 then
			neoncolor = 0
		else
			neoncolor = neoncolor + 0.004
		end
	end
end))

Player.Chatted:Connect(function(msg)
	if msg:split(" ")[1] == "/song" and Head.Wooh.TextLabel.Text == "Radio" then
		Torso:FindFirstChild("WAO".."song").SoundId = "rbxassetid://" .. msg:split(" ")[2]
	end
end)

coroutine.resume(coroutine.create(function()
	while task.wait() do
		for i,v in pairs(scarfs) do
			v.CFrame = Char["Torso"].CFrame * CFrame.new(0,-5,0)
		end
	end
end))

local boombox = Char:FindFirstChild("Remote",true)
if boombox then
	repeat 
		boombox = boombox.Parent
		wait()
	until boombox:IsA("Tool")
	Char[Player.Name][boombox.Name].Remote:FireServer("PlaySong", "1557258673")
	boombox.Handle.Anchored = true
	RArm["RightGrip"]:Destroy()
end

Torso:FindFirstChild("WAO".."song"):GetPropertyChangedSignal("SoundId"):Connect(function()
	Char[Player.Name][boombox.Name].Remote:FireServer("PlaySong", string.match(tostring(Torso:FindFirstChild("WAO".."song").SoundId) , "%d+"))
end)	

while true do
	swait()
	Sine=Sine+Change
	--ModeValue = Char.ModeValue.Value

	local hitfloor,posfloor = workspace:FindPartOnRayWithIgnoreList(Ray.new(Root.CFrame.p,((CFrame.new(Root.Position,Root.Position - Vector3.new(0,1,0))).lookVector).unit * (4)), {Effects,Char})
	local Walking = (math.abs(Root.Velocity.x) > 1 or math.abs(Root.Velocity.z) > 1)
	local State = (Hum.PlatformStand and 'Paralyzed' or Hum.Sit and 'Sit' or not hitfloor and Root.Velocity.y < -1 and "Fall" or not hitfloor and Root.Velocity.y > 1 and "Jump" or hitfloor and Walking and "Walk" or hitfloor and "Idle")
	Hum.WalkSpeed = WalkSpeed
	local sidevec = math.clamp((Root.Velocity*Root.CFrame.rightVector).X+(Root.Velocity*Root.CFrame.rightVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local forwardvec =  math.clamp((Root.Velocity*Root.CFrame.lookVector).X+(Root.Velocity*Root.CFrame.lookVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local sidevelocity = sidevec/Hum.WalkSpeed
	local forwardvelocity = forwardvec/Hum.WalkSpeed

	local lhit,lpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(LLeg.CFrame.p,((CFrame.new(LLeg.Position,LLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char})
	local rhit,rpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(RLeg.CFrame.p,((CFrame.new(RLeg.Position,RLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char})
	
	if boombox then
		boombox.Handle.CFrame = Torso.CFrame * CFrame.new(3,3,1) * CFrame.Angles(math.rad(-30),math.rad(30),0)
	end
	
	if ModeValue == 11 then
		Head.Wooh.TextLabel.TextColor3 = Color3.fromHSV(neoncolor,1,neonbright)
		for i,v in pairs(Char.Gaunter:GetChildren())do
			if string.lower(v.Name) == "neon" then
				v.Color = Color3.fromHSV(neoncolor,1,neonbright)
			end	
		end
	end

	if ModeValue == 010 then
		local Fonts = {Enum.Font.Garamond,Enum.Font.SciFi,Enum.Font.Arcade,Enum.Font.Arial,Enum.Font.Highway,Enum.Font.Arcade,Enum.Font.Bodoni,Enum.Font.Code}
		FontDecider = math.random(1,8)
		local GrammearYes = {"N_N3Ex1sTAnc3","n_N3EX1sTAnc3","N_Ne4x11sdAfnc3","N-N3Ex1skgh3","N_N3Ex1_#]c3","NonExistance","momeXistsTAnC","nOnEXiSTaNCe","nil","NILCOMMENT","NILRESPONSE"}
		GrammmerDecider = math.random(1,8)
		for i,v in pairs(Fonts)do
			if i == FontDecider  then
				Head.Wooh.TextLabel.Font = v
			end
		end	
		for i,v in pairs(GrammearYes)do
			if i == FontDecider  then
				Head.Wooh.TextLabel.Text = v
			end
		end
		Head.Wooh.TextLabel.TextColor3 = Color3.fromRGB(math.random(0,155),math.random(0,155),math.random(0,155))
		for i,v in pairs(Char.Gaunter:GetChildren())do
			if string.lower(v.Name) == "neon" then
				v.Color = Color3.fromRGB(math.random(0,155),math.random(0,155),math.random(0,155))
			end	
		end
	end

	if(State == 'Idle')then
		--Change=.7
		if ModeValue == 1 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 +.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-30),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4 + 0.1 * math.sin(Sine/16),0)*CF.A(math.rad(60.1+ 5 * math.sin(Sine/16)),math.rad(-1.3 + 2 * M.C(Sine/16)),math.rad(4.8)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.2,0.5 + 0.1 * math.sin(Sine/16),-0.4)*CF.A(math.rad(85 + 5 * math.sin(Sine/16)),math.rad(0 - 2 * M.C(Sine/16)),math.rad(-25)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 + 3 * M.S(Sine/16)),math.rad(20),math.rad(-1 + 2 * M.C(Sine/16))),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(20),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-20),math.rad(0)),Alpha)
			end
		elseif ModeValue == 2 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.4,0.5 + 0.1  * M.S(Sine/16),-0.2)*CF.A(math.rad(-10.1 ),math.rad(-10+ 4 * M.C(Sine/16) ),math.rad(-0.9+ 2 * M.S(Sine/16))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.4,0.4 + 0.1  * M.S(Sine/16),0)*CF.A(math.rad(74.3 + 10 * M.S(Sine/16)),math.rad(-10.5),math.rad(44+ 2 * M.S(Sine/16))),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 - 2 * M.S(Sine/16)),math.rad(5),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
			end
		elseif ModeValue == 23 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.4,0.64 + 0.1  * M.S(Sine/16),-0.2)*CF.A(math.rad(-10.1),math.rad(-10+ 4 * M.C(Sine/16) ),math.rad(-40+ 2 * M.S(Sine/16))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.8,0.8 + 0.02  * M.S(Sine/16),0)*CF.A(math.rad(162 + 4 * M.S(Sine/16)),math.rad(-0),math.rad(-23+ 2 * M.S(Sine/16))),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(8 - 2 * M.S(Sine/16)),math.rad(-30 - 1 * M.S(Sine/16)),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
			end
		elseif ModeValue == 21 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.4,0.5 + 0.1  * M.S(Sine/16),-0.2)*CF.A(math.rad(-10.1 ),math.rad(-10+ 4 * M.C(Sine/16) ),math.rad(-0.9+ 2 * M.S(Sine/16))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.4,0.4 + 0.1  * M.S(Sine/16),0)*CF.A(math.rad(74.3 + 10 * M.S(Sine/16)),math.rad(-10.5),math.rad(44+ 2 * M.S(Sine/16))),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 - 2 * M.S(Sine/16)),math.rad(5),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - .1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
			end
		elseif ModeValue == 3 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + .13 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(10),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.5,0.5 + 0.1  * math.sin(Sine/16),0)*CF.A(math.rad(5),math.rad(-0.4 - 5 * math.cos(Sine/16)),math.rad(-5)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.1,0.3 + 0.1  * math.sin(Sine/16),-0.6)*CF.A(math.rad(80 - 6 * math.sin(Sine/16)),math.rad(0),math.rad(-80+ 4 * math.cos(Sine/16))),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 - 1 * math.cos(Sine/16)),math.rad(-10 - 5 * math.sin(Sine/16)),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1- .13 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1- .13 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-10),math.rad(0)),Alpha)
			end
		elseif ModeValue == 4 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + 0.09 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(5),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.6,0.6,0)*CF.A(math.rad(0 - 5 * math.sin(Sine/16)),math.rad(-15 - 10 * math.cos(Sine/16)),math.rad(-10)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.6,0.6,-0.2)*CF.A(math.rad(-0.9 - 5 * math.sin(Sine/16)),math.rad(20 + 10 * math.cos(Sine/16)),math.rad(15.2)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 - 5 * math.sin(Sine/16)),math.rad(0 + 1 * math.cos(Sine/16)),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - 0.09 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - 0.09 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
			end
		elseif ModeValue == 5 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + 0.12 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-5),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.4,0.5 + 0.1 * math.sin(Sine/16),0)*CF.A(math.rad(0),math.rad(5),math.rad(5)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.5,0.5 + 0.1 * math.sin(Sine/16),-0.2)*CF.A(math.rad(-5.2),math.rad(14.9),math.rad(1.3)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 + 5 * math.sin(Sine/16)),math.rad(5),math.rad(0)),Alpha)
				if math.random(1,10) == 10 then
					NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(math.random(-45,45)),math.rad(math.random(-45,45)),math.rad(math.random(-45,45))),.3)
				end
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1- 0.12 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(30),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1- 0.12 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-15),math.rad(0)),Alpha)
			end
		elseif ModeValue == 6 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + 0.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-15),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1,0.3 + 0.1 * math.sin(Sine/16),-0.6)*CF.A(math.rad(69.3),math.rad(-1.4),math.rad(75.3)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.7,0.3 +  0.1 * math.sin(Sine/16),-0.6)*CF.A(math.rad(70.9),math.rad(-4.2),math.rad(-80.3)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 + 2 * math.sin(Sine/16)),math.rad(15 + 3 * math.cos(Sine/16)),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 -  0.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(20),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 -  0.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-15),math.rad(0)),Alpha)
			end
		elseif ModeValue == 7 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + 0.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-0.9,0.5 + 0.04 * math.sin(Sine/16),-0.4)*CF.A(math.rad(0),math.rad(0),math.rad(20)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.8,0.5 + 0.04 * math.sin(Sine/16),-0.4)*CF.A(math.rad(0),math.rad(0),math.rad(-20)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10),math.rad(25 - 7 * math.sin(Sine/16)),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - 0.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(10),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - 0.1 * math.cos(Sine/16),0)*CF.A(math.rad(0),math.rad(-15),math.rad(0)),Alpha)
			end
		elseif ModeValue == 8 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + 0.1 * math.cos(Sine/14),0)*CF.A(math.rad(0),math.rad(25),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.6,0.6 + 0.06 * math.sin(Sine/14),0.4)*CF.A(math.rad(11.4),math.rad(30.5),math.rad(-11.1)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.5,0.4 + 0.06 * math.sin(Sine/14),-0.7)*CF.A(math.rad(118.2),math.rad(-4.5),math.rad(-62.1)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 + 4 * math.sin(Sine/14)),math.rad(-20 - 5 * math.cos(Sine/14)),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - 0.1 * math.cos(Sine/14),0)*CF.A(math.rad(0),math.rad(13),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - 0.1 * math.cos(Sine/14),0.1)*CF.A(math.rad(0),math.rad(-27),math.rad(0)),Alpha)
			end
		elseif ModeValue == 9 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,0 + 0.12 * math.cos(Sine/11),0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.2,0.2 + 0.1 * math.sin(Sine/11),0.3)*CF.A(math.rad(-30),math.rad(0),math.rad(30)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.2,0.2 + 0.1 * math.sin(Sine/11),0.3)*CF.A(math.rad(-30),math.rad(0),math.rad(-30)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0 + 5 * math.sin(Sine/11)),math.rad(0),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - 0.12 * math.cos(Sine/11),0)*CF.A(math.rad(0),math.rad(20),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1 - 0.12 * math.cos(Sine/11),0)*CF.A(math.rad(0),math.rad(-20),math.rad(0)),Alpha)
			end
		elseif ModeValue == 11 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,3 + 0.4 * math.cos(Sine/16),0.2)*CF.A(math.rad(25 - 10 * math.sin(Sine/16)),math.rad(0),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.6,0.4 + 0.1 * math.sin(Sine/16),-0.4)*CF.A(math.rad(-40.4),math.rad(-19.3),math.rad(-15.9)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.5,0.6 + 0.1 * math.sin(Sine/16),0)*CF.A(math.rad(-27.5),math.rad(19.8),math.rad(19.2)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.6,-0.4)*CF.A(math.rad(-40 + 10 * math.cos(Sine/16)),math.rad(0),math.rad(0)),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1 - 0.1 * math.cos(Sine/16),-0.8 + 0.14 * math.sin(Sine/16))*CF.A(math.rad(-45),math.rad(0),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1.1 - 0.1 * math.cos(Sine/16),-0.1 + 0.14 * math.sin(Sine/16))*CF.A(math.rad(-35),math.rad(0),math.rad(0)),Alpha)
			end
		elseif ModeValue == 010 then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,-0.9 + 0.1 * math.cos(Sine/16),-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.7,0.1,0.1)*CF.A(math.rad(0+ math.random(-5,5)),math.rad(20+ math.random(-5,5)),math.rad(20+ math.random(-5,5))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.5,0.8,-0.1)*CF.A(math.rad(138.5+ math.random(-5,5)),math.rad(-24.1+ math.random(-5,5)),math.rad(-41.9+ math.random(-5,5))),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10 + math.random(-5,5)),math.rad(0 + math.random(-5,5)),math.rad(0 + math.random(-5,5))),Alpha)
				if math.random(1,5) == 5 then
					NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(math.random(-45,45)),math.rad(math.random(-45,45)),math.rad(math.random(-45,45))),.3)
				end
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7 - 0.1 * math.cos(Sine/16),-1)*CF.A(math.rad(-50),math.rad(0),math.rad(0)),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-0.2 - 0.1 * math.cos(Sine/16),-0.4)*CF.A(math.rad(35),math.rad(0),math.rad(0)),Alpha)
			end
		end
	elseif(State == 'Walk')then
		local wsVal = 4
		local Alpha = .2
		if(NeutralAnims)then
			if ModeValue == 3 then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-2.8,0.2+.07  * math.sin(Sine/10),0)*CF.N(1.4,0.5,0.1)*CF.A(math.rad(-3 + 13 * math.sin(Sine/10)),math.rad(7),math.rad(-10))*CFrame.Angles(0,0,math.rad(-0)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.6+.05 * math.sin(Sine/6),-0.1+.09 * math.sin(Sine/4),-0.6)*CF.N(-1.1,0.5,-0.3)*CF.A(math.rad(-65),math.rad(-30),math.rad(74))*CFrame.Angles(0,0,math.rad(190 + 3 * math.sin(Sine/4))),Alpha)
			elseif ModeValue == 23 then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-17 - 2 * M.S(Sine/16)),math.rad(-17 - 1 * M.S(Sine/16)),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,M.R(-5-5*M.C(Sine/wsVal))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.8,0.8 + 0.08  * M.S(Sine/3),0)*CF.A(math.rad(162 + 4 * M.S(Sine/16)),math.rad(-0),math.rad(-47+ 2 * M.S(Sine/16))),Alpha)
			elseif ModeValue == 7 then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-0.9,0.5 + 0.04 * math.sin(Sine/16),-0.4)*CF.A(math.rad(0),math.rad(0),math.rad(20)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(0.8,0.5 + 0.04 * math.sin(Sine/16),-0.4)*CF.A(math.rad(0),math.rad(0),math.rad(-20)),Alpha)
			elseif ModeValue == 5 then		
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				if math.random(1,10) == 10 then
					NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(math.random(-45,45)),math.rad(math.random(-45,45)),math.rad(math.random(-45,45))),.3)
				end
				LS.C0 = LS.C0:lerp(CF.N(-2.3,0+.1 * math.sin(Sine/3),0)*CF.N(1.4,0.5,0.1)*CF.A(math.rad(76),math.rad(-27),math.rad(46))*CFrame.Angles(0,0,math.rad(-0)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(2.7,0,0.3)*CF.N(-1.1,0.5,-0.3)*CF.A(math.rad(-60+20 * math.sin(Sine/3)),math.rad(-170),math.rad(-10+5 * math.sin(Sine/7)))*CFrame.Angles(0,0,math.rad(0)),Alpha)
			elseif ModeValue == 6 then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-2.1,-0.3+.1 * math.sin(Sine/3),-0.41)*CF.N(1.4,0.5,0.1)*CF.A(math.rad(30 + 8 * math.sin(Sine/9)),math.rad(20),math.rad(-0))*CFrame.Angles(0,0,math.rad(66)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.9,-0.1+.1 * math.sin(Sine/3),-0.32)*CF.N(-1.1,0.5,-0.3)*CF.A(math.rad(-20 - 9 * math.sin(Sine/9)),math.rad(-3),math.rad(-0))*CFrame.Angles(0,0,math.rad(-84)),Alpha)
			elseif ModeValue == 8 then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,M.R(-5-5*M.C(Sine/wsVal))),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.5,0.4 + 0.15 * math.cos(Sine/wsVal),-0.7)*CF.A(math.rad(118.2),math.rad(-4.5),math.rad(-62.1)),Alpha)
			elseif ModeValue == 9 then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-2.2,-0.2+.1 * math.sin(Sine/3),-0.2)*CF.N(1.1,0.5,0.3)*CF.A(math.rad(-20 + 13 * math.sin(Sine/114)),math.rad(-180),math.rad(-20 - 3 * math.sin(Sine/4)))*CFrame.Angles(0,0,math.rad(0)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(2.4,-0.2+.1 * math.sin(Sine/3),0.4)*CF.N(-1.1,0.5,-0.3)*CF.A(math.rad(-20 + 13 * math.sin(Sine/11)),math.rad(-180),math.rad(20 + 3 * math.sin(Sine/4)))*CFrame.Angles(0,0,math.rad(-0)),Alpha)
			elseif ModeValue == 11 then
				RJ.C0 = RJ.C0:lerp(CF.N(0,2.7 + 0.4 * math.cos(Sine/16),-0.5)*CF.A(math.rad(-65 - 10 * math.sin(Sine/16)),math.rad(0),math.rad(0)),Alpha)
				LS.C0 = LS.C0:lerp(CF.N(-1.3,0.4,-0.2+ 0.2 * math.sin(Sine/16))*CF.A(math.rad(-25.1 + 10 * math.cos(Sine/16)),math.rad(-12.8),math.rad(-21.4)),Alpha)
				RS.C0 = RS.C0:lerp(CF.N(1.3,0.6,0 + 0.2 * math.sin(Sine/16))*CF.A(math.rad(8.7 + 10 * math.cos(Sine/16)),math.rad(18.1),math.rad(163.6)),Alpha)
				NK.C0 =NK.C0:lerp(CF.N(0,1.2,0.6)*CF.A(math.rad(50),math.rad(0),math.rad(0)),Alpha)
			else
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,M.R(-5-5*M.C(Sine/wsVal))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0,0)*CF.A(M.R(0-55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,M.R(0+5*M.C(Sine/wsVal))),Alpha)
			end
		end

		if(legAnims)then 
			if ModeValue ~= 11 then
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				local footstepIds = {141491460,141491460}
				if(lhit and lhit.CanCollide and footstepSounds[lhit.Material])then
					if(lhit.Material==Enum.Material.Sand and lhit.Color.r*255>=160 and lhit.Color.g*255>=160 and lhit.Color.b*255>=160)then
						footstepIds[1] = footstepSounds[Enum.Material.Snow]
					else
						footstepIds[1] = footstepSounds[lhit.Material]
					end
				end

				if(rhit and rhit.CanCollide and footstepSounds[rhit.Material])then
					if(rhit.Material==Enum.Material.Sand and rhit.Color.r*255>=160 and rhit.Color.g*255>=160 and rhit.Color.b*255>=160)then
						footstepIds[2] = footstepSounds[Enum.Material.Snow]
					else
						footstepIds[2] = footstepSounds[rhit.Material]
					end
				end


				if(M.C(Sine/wsVal)/2>=.2 and footsound==0 and lhit)then
					--local step = Part(Effects,lhit.Color,lhit.Material,V3.N(1,.1,1),CF.N(lpos),true,false)
					--step.Transparency=(footstepIds[1]==footstepSounds[Enum.Material.Snow] and 0 or 1)
					local snd = Sound(Char,footstepIds[1],M.RNG(80,100)/100,1,false,true,true)
					footsound=1
					--S.Debris:AddItem(step,snd.TimeLength+2)
				elseif(M.C(Sine/wsVal)/2<=-.2 and footsound==1 and rhit)then
					--local step = Part(Effects,rhit.Color,rhit.Material,V3.N(1,.1,1),CF.N(rpos),true,false)
					--step.Transparency=(footstepIds[2]==footstepSounds[Enum.Material.Snow] and 0 or 1)
					local snd = Sound(Char,footstepIds[2],M.RNG(80,100)/100,1,false,true,true)
					footsound=0
					--S.Debris:AddItem(step,snd.TimeLength+2)
				end
			elseif ModeValue == 11 then
				LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.2)*CF.A(math.rad(-30 - 6 * math.sin(Sine/16)),math.rad(-15 + 15 * math.cos(Sine/16)),math.rad(-13 - 3 * math.sin(Sine/16))),Alpha)
				RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.2)*CF.A(math.rad(-30 - 6 * math.sin(Sine/16)),math.rad(25 - 15 * math.cos(Sine/16)),math.rad(13 + 3 * math.sin(Sine/16))),Alpha)
			end
		end
	elseif(State == 'Jump')then
		local Alpha = .1
		local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)),Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
			RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
		end
	elseif(State == 'Fall')then
		local Alpha = .1
		local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)+idk),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)-idk),Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
			RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
		end
	elseif(State == 'Paralyzed')then
		local Alpha = .1
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0,Alpha)
			RS.C0 = RS.C0:lerp(RSC0,Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0,Alpha)
			NK.C0 = NK.C0:lerp(NKC0,Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0,Alpha)
			RH.C0 = RH.C0:lerp(RHC0,Alpha)
		end
	elseif(State == 'Sit')then

	end
end
