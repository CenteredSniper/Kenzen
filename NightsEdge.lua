local Player = game.Players.LocalPlayer
local SW = game:GetObjects("rbxassetid://8865152844")[1]
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,cotan=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})

--// Shortcuts
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local cotan=math.cotan
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--// Basic functions
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1,Pitch=Pitch or 1,MaxDistance=MaxDistance or 500,EmitterSize=EmitterSize or 5,Looped=Looped or false,SoundId="rbxassetid://"..Id,Parent=Parent})
	S:Resume()
	coroutine.wrap(function()
		if S.Looped then return end
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
--// Setup 1
for i,v in pairs(Player.Character:GetDescendants()) do
	if (v.Name=="Animate" and v:IsA("LocalScript")) or v:IsA("Animator") then
		Instance.Remove(v)
	end
end


--// Character indexing
local LockWS,LockJP=false,false
local Type="R6"
Char,char=Player.Character,Player.Character
local Hum,hum=Char:FindFirstChildOfClass("Humanoid"),Char:FindFirstChildOfClass("Humanoid")
local hrp,HRP=Char.HumanoidRootPart,Char.HumanoidRootPart
local h,t,ra,la,rl,ll
local nec,rs,ls,rh,lh,rutj
local necC0,necC1=cf(),cf()
local rutjC0,rutjC1=cf(),cf()
local rsC0,rsC1=cf(),cf()
local lsC0,lsC1=cf(),cf()
local rhC0,rhC1=cf(),cf()
local lhC0,lhC1=cf(),cf()
local h,ut,lt,rua,rla,rh,lua,lla,lh,rul,rll,rf,lul,lll,lf
local CFs={}
local Joints={}
BLOODPARENT=workspace.Terrain
if Type=="R6" then
	h,t,ra,la,rl,ll=char.Head,char.Torso,char["Right Arm"],char["Left Arm"],char["Right Leg"],char["Left Leg"]
	nec,rutj,rs,ls,rh,lh=t.Neck,hrp.RootJoint,t["Right Shoulder"],t["Left Shoulder"],t["Right Hip"],t["Left Hip"]
	necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
	rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
	rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
	lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
	rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
	lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	--Instance.Remove({nec,rutj,rs,ls,rh,lh})
	nec=ins("Motor6D",{Name="Neck",Part0=t,Part1=h,C0=necC0,C1=necC1,Parent=t,})
	rutj=ins("Motor6D",{Name="RootJoint",Part0=hrp,Part1=t,C0=rutjC0,C1=rutjC1,Parent=hrp,})
	rs=ins("Motor6D",{Name="Right Shoulder",Part0=t,Part1=ra,C0=rsC0,C1=rsC1,Parent=t,})
	ls=ins("Motor6D",{Name="Left Shoulder",Part0=t,Part1=la,C0=lsC0,C1=lsC1,Parent=t,})
	rh=ins("Motor6D",{Name="Right Hip",Part0=t,Part1=rl,C0=rhC0,C1=rhC1,Parent=t,})
	lh=ins("Motor6D",{Name="Left Hip",Part0=t,Part1=ll,C0=lhC0,C1=lhC1,Parent=t,})
elseif Type=="R15" then
	h,hrp=Char.Head,Char.HumanoidRootPart
	ut,lt=Char.UpperTorso,Char.LowerTorso
	rua,rla,rh=Char.RightUpperArm,Char.RightLowerArm,Char.RightHand
	lua,lla,lh=Char.LeftUpperArm,Char.LeftLowerArm,Char.LeftHand
	rul,rll,rf=Char.RightUpperLeg,Char.RightLowerLeg,Char.RightFoot
	lul,lll,lf=Char.LeftUpperLeg,Char.LeftLowerLeg,Char.LeftFoot
	for i,v in pairs(Char:GetDescendants()) do
		if v:IsA("Motor6D") then
			local CFData={C0=cf(v.C0.Position),C1=cf(v.C1.Position),Part0=v.Part0,Part1=v.Part1,Parent=v.Parent}
			local Joint=ins("Motor6D",{C0=CFData.C0,C1=CFData.C1,Part0=CFData.Part0,Part1=CFData.Part1,Name=v.Name,Parent=CFData.Parent,})
			CFs[v.Name]=CFData
			Joints[v.Name]=setmetatable({Object=Joint,Link=CFData,Remove=function(Time) Instance.Remove(Joint,Time) end},{__index=Joint,__newindex=function(self,k,v) Joint[k]=v end})
			v.Parent=nil
			Instance.Remove(v)
		end
	end
end
--// Variables
local Using,Muted=false,false
local Id,Vol,Pitch,TimePos=4615964997,.25,1,0
local Sine,Change=0,1
local WS,JP=16,50
local Combo=1
local Step="R"
local StepSounds={Plastic=2812418291,SmoothPlastic=2812418291,Neon=2812418291,ForceField=2812418291,Metal=2812417769,DiamondPlate=2812417769,CorrodedMetal=2812417769,Foil=2812417769,Sand=619188333,Grass=619188333,Slate=941640049,Concrete=941640049,Granite=941640049,Pebble=941640049,Marble=941640049,Cobblestone=941640049,Brick=941640049,Water=685857471,Wood=2812419402,WoodPlanks=2812419402,Fabric=133705377,Snow=619083295}
local Anims= {
	Swing1={
		Waits={
			[1]=.1,
			[2]=.05,
			[3]=.075,
			[4]=.075
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(-10),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.1,0)*CFrame.Angles(math.rad(-10),math.rad(40),math.rad(5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.3,-0.35,-0.75)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(75),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(20))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.1,0.05)*CFrame.Angles(math.rad(-5),math.rad(10),math.rad(-5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-5),math.rad(-30),math.rad(0))*CFrame.new(0,0.05,-0.2)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.1)*CFrame.Angles(math.rad(5),math.rad(-5),math.rad(-5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-25),math.rad(0))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.Angles(math.rad(-7.5),math.rad(25),math.rad(2.5))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.2,-0.35,-0.75)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(50),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(20))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.1,0.075)*CFrame.Angles(math.rad(-7.5),math.rad(15),math.rad(-10))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))*CFrame.new(0,0,-0.2)},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.3,-0.3)*CFrame.Angles(math.rad(-10),math.rad(5),math.rad(-2.5))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}}
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(10))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.05,0)*CFrame.Angles(math.rad(-7.5),math.rad(0),math.rad(2.5))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.4,-0.35,-0.25)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(-50),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.1,0.075)*CFrame.Angles(math.rad(-15),math.rad(25),math.rad(-10))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-2.5),math.rad(-15),math.rad(0))*CFrame.new(0,0,-0.2)},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.25)*CFrame.Angles(math.rad(10),math.rad(10),math.rad(-7.5))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-5,0,0,true)},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}}
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(25),math.rad(7.5))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.05,0)*CFrame.Angles(math.rad(-1.5),math.rad(-25),math.rad(2.5))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.5,-0.35,0)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(10))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.3,-0.2,0.25)*CFrame.Angles(math.rad(-25),math.rad(25),math.rad(-10))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(7.5),math.rad(15),math.rad(-5))*CFrame.new(0,0,-0.2)},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.3)*CFrame.Angles(math.rad(-10),math.rad(25),math.rad(-7.5))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-15,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[5]={
			{"nec",{C1=CFrame.Angles(math.rad(-2.5),math.rad(26),math.rad(5))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.05,0)*CFrame.Angles(math.rad(-1.5),math.rad(-20),math.rad(2.5))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=CFrame.new(0.5,-0.35,-0.05)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(-85),math.rad(0),math.rad(10))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.3,-0.175,0.225)*CFrame.Angles(math.rad(-20),math.rad(20),math.rad(-10))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(5),math.rad(15),math.rad(-5))*CFrame.new(0,0,-0.2)},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.3)*CFrame.Angles(math.rad(-7.5),math.rad(25),math.rad(-7.5))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		}
	},
	Swing2={
		Waits={
			[1]=.075,
			[2]=.1,
			[3]=.075,
			[4]=.05
		},
		[1]={
			{"rh",{C1=CFrame.new(0,.15,-0.15)*CFrame.Angles(math.rad(-15),math.rad(-5),math.rad(0))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-10),math.rad(50),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.2,0.2)*CFrame.Angles(math.rad(-15),math.rad(-50),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.5,0,-0.5)*CFrame.Angles(math.rad(10),math.rad(50),math.rad(5))*CFrame.Angles(math.rad(-5),math.rad(0),math.rad(2.5))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.15,-0.1)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(-10))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(-5),math.rad(-15),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.25,0)*CFrame.Angles(math.rad(0),math.rad(40),math.rad(-5))*CFrame.Angles(math.rad(1),math.rad(0),math.rad(0))*CFrame.new(0,0,-0.35)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,0.05)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(0.65,0.1,-0.35)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(200),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.15,-0.1)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(20))*CFrame.Angles(math.rad(0),math.rad(-40),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-7.5),math.rad(-15),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.Angles(math.rad(0),math.rad(5),math.rad(-5))*CFrame.Angles(math.rad(-2.5),math.rad(0),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(35,0,0,true)},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}}
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.125,0.15)*CFrame.Angles(math.rad(15),math.rad(40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.15,0.5,-0.5)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(-50))*CFrame.Angles(math.rad(0),math.rad(200),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.15,-0.1)*CFrame.Angles(math.rad(65),math.rad(0),math.rad(70))*CFrame.Angles(math.rad(0),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-15),math.rad(-15),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.125,-0.25)*CFrame.Angles(math.rad(-10),math.rad(25),math.rad(-7.5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-25,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[5]={
			{"nec",{C1=CFrame.Angles(math.rad(-2.5),math.rad(-40),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.125,0.15)*CFrame.Angles(math.rad(10),math.rad(40),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=CFrame.new(-0.15,0.4,-0.5)*CFrame.Angles(math.rad(140),math.rad(0),math.rad(-50))*CFrame.Angles(math.rad(0),math.rad(200),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.15,-0.1)*CFrame.Angles(math.rad(45),math.rad(0),math.rad(50))*CFrame.Angles(math.rad(0),math.rad(-40),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-10),math.rad(-15),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.125,-0.25)*CFrame.Angles(math.rad(-5),math.rad(25),math.rad(-7.5))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-20,0,0,true)},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		}
	},
	Swing3={
		Waits={
			[1]=.1,
			[2]=.1,
			[3]=.1
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(-10),math.rad(40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.1,0)*CFrame.Angles(math.rad(-5),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.35,0.65,0.1)*CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(90))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,-0.1)*CFrame.Angles(math.rad(10),math.rad(-20),math.rad(-10))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(5),math.rad(-20),math.rad(5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.1,-0.15)*CFrame.Angles(math.rad(0),math.rad(35),math.rad(0))*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-2),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(0,0.65,-0.5)*CFrame.Angles(math.rad(0),math.rad(-10),math.rad(90))*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,0.1)*CFrame.Angles(math.rad(-5),math.rad(-20),math.rad(-15))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0.25,-0.2)*CFrame.Angles(math.rad(-5),math.rad(-10),math.rad(2.5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(0),math.rad(35),math.rad(0))*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(15,0,0,true)},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}}
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-45),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.215)*CFrame.Angles(math.rad(-5),math.rad(45),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.25,0.65,-0.5)*CFrame.Angles(math.rad(15),math.rad(-10),math.rad(80))*CFrame.Angles(math.rad(170),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,0.2)*CFrame.Angles(math.rad(-15),math.rad(10),math.rad(-15))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(10),math.rad(-25),math.rad(7.5))*CFrame.new(0,0,-0.15)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(0),math.rad(15),math.rad(0))*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-25,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-45),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.215)*CFrame.Angles(math.rad(-5),math.rad(45),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.25,0.65,-0.5)*CFrame.Angles(math.rad(15),math.rad(-10),math.rad(80))*CFrame.Angles(math.rad(170),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,0.2)*CFrame.Angles(math.rad(-15),math.rad(10),math.rad(-15))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(10),math.rad(-25),math.rad(7.5))*CFrame.new(0,0,-0.15)},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(0),math.rad(15),math.rad(0))*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-25,0,0,true)},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		}
	}
}
--// Setup 2
local Theme=Sound(Id,Vol,Pitch,t,150,7.5,true)
local Effects=ins("Model",{Name="Effects",Parent=Char,})
ins("ForceField",{Parent=char,Visible=false,})
--local SW=script.Data.Models.NightsEdge SW.Parent=char
SW.Parent=char
local Handle,Blade=SW.Handle,SW.Blade
local HW=ins("Motor6D",{Part0=ra,Part1=Handle,C0=cf(-.25,-.8,0),Parent=Handle})
local backacc = Char["Back_AccAccessory"].Handle.AccessoryWeld
backacc.Part1 = SW.Blade
backacc.C1 = CFrame.new(0,-1,0) * CFrame.Angles(math.rad(180),math.rad(90),math.rad(45))
backacc.C0 = CFrame.new() * CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0))

if Char:FindFirstChild("RockAccessory") then
	if Char["RockAccessory"].Handle:FindFirstChildOfClass("SpecialMesh") then
		local trail = Char.RockAccessory.Handle.AccessoryWeld
		trail.Part1 = SW.Blade
		trail.C1 = CFrame.new()
		trail.C0 = CFrame.new()
		Char["RockAccessory"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
		if getgenv().RealRig then
			getgenv().RealRig["RockAccessory"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
		end
	end
end
for i,v in pairs(SW:GetChildren()) do
	v.Transparency = 1
end
--// Functions
function PlayAnimSingle(...)
	local Joints_={nec=nec,rutj=rutj,rs=rs,ls=ls,rh=rh,lh=lh,sw=HW}
	local CFs_={necC0=necC0,necC1=necC1,rutjC0=rutjC0,rutjC1=rutjC1,rsC0=rsC0,rsC1=rsC1,lsC0=lsC0,lsC1=lsC1,rhC0=rhC0,rhC1=rhC1,lhC0=lhC0,lhC1=lhC1,swC0=cf(-.25,-.8,0),swC1=cf()}
	for i,v in pairs({...}) do
		if Joints_[v[1]] then
			local T={}
			table.foreach(v[2],function(i,v) T[i]=v end)
			local C0=((CFs_[v[1].."C0"] or cf(0,0,0))*(T.C0 or cf(0,0,0))) or CFs_[v[1].."C0"]
			local C1=((CFs_[v[1].."C1"] or cf(0,0,0))*((T.C1 or cf(0,0,0))):Inverse())
			for i,v in pairs(T) do if i=="C0" then T.C0=C0 elseif i=="C1" then T.C1=C1 end end
			Tween(Joints_[v[1]],T,v[3])
		end
	end
end
function PlayAnim(Table,AddFuncs)
	AddFuncs=AddFuncs or {}
	local Waits=Table.Waits
	for i=1,#Table do
		local v=Table[i]
		if i~="Waits" and Waits[i] then
			local WaitTime=Waits[i]
			PlayAnimSingle(unpack(v))
			wait(WaitTime)
			if AddFuncs[i] then AddFuncs[i]() end
		end
	end
end
--// Moves
local function LookToClosestChar()
	local Chars,CharsDist={},{}
	for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(HRP.Position-Vector3.new(5,5,5),HRP.Position+Vector3.new(5,5,5)),{Char},100)) do
		if v.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM=v.Parent:FindFirstChildOfClass("Humanoid")
			local T=HUM.Parent:FindFirstChild("Torso") or HUM.Parent:FindFirstChild("UpperTorso")
			if T then
				table.insert(Chars,T)
				table.insert(CharsDist,(HRP.Position-T.Position).Magnitude)
			end
		end
	end
	if #Chars==0 then return end
	local Closest=math.min(unpack(CharsDist))
	for i=1,#Chars do
		if (HRP.Position-Chars[i].Position).Magnitude==Closest then
			HRP.CFrame=CFrame.new(HRP.Position,Vector3.new(Chars[i].Position.X,HRP.Position.Y,Chars[i].Position.Z))
			return
		end
	end
end
local Combos={
	function()
		Using=true
		PlayAnim(Anims.Swing1,{[1]=function() LookToClosestChar() Sound(1306070008,.125,random(.7,.9,100),Blade,50,5) end})
		Using=false
	end,
	function()
		Using=true
		PlayAnim(Anims.Swing2,{[1]=function() LookToClosestChar() Sound(1306070008,.125,random(.7,.9,100),Blade,50,5) end})
		Using=false
	end,
	function()
		Using=true
		PlayAnim(Anims.Swing3,{[1]=function() LookToClosestChar() Sound(1306070008,.125,random(.7,.9,100),Blade,50,5) end})
		Using=false
	end
}
--// Connections
game:GetService("UserInputService").InputBegan:Connect(function(IO,L)
	print(IO)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
		if IO.KeyCode==Enum.KeyCode.M then
			Muted=not Muted
		end
	elseif IO.UserInputType==Enum.UserInputType.MouseButton1 then
		if Using then return end
		Combos[Combo]()
		Combo=Combo+1
		if Combo>#Combos then Combo=1 end
	end
end)
while task.wait(1/60) do
	if Theme.Parent~=t then Instance.Remove(Theme) Theme=Sound(Id,Vol,Pitch,t,150,7.5,true) Theme.TimePosition=TimePos end
	Theme.SoundId,Theme.Volume,Theme.Pitch="rbxassetid://"..Id,not Muted and Vol or 0,Pitch TimePos=Theme.TimePosition Theme:Resume()
	Sine=Sine+Change
	local Direction=hum.MoveDirection
	if Direction.Magnitude==0 then Direction=t.Velocity/7.5 end
	local MoveZ=clamp((Direction*t.CFrame.LookVector).X+(Direction*t.CFrame.LookVector).Z,-1,1)
	local MoveX=clamp((Direction*t.CFrame.RightVector).X+(Direction*t.CFrame.RightVector).Z,-1,1)
	local Moving=(t.Velocity*v3(1,0,1)).Magnitude>.01
	local VerY=t.Velocity.Y
	local StandR,RPos,RNID=Raycast(t.CFrame*cf(t.Size.X/4,-t.Size.Y/2,0).Position,-t.CFrame.UpVector,{char},3,false)
	local StandL,LPos,LNID=Raycast(t.CFrame*cf(-t.Size.X/4,-t.Size.Y/2,0).Position,-t.CFrame.UpVector,{char},3,false)
	local Stand=StandR or StandL
	hum.WalkSpeed,hum.JumpPower=(LockWS and WS or hum.WalkSpeed),(LockJP and JP or hum.JumpPower)
	--print(nec)
	if not Moving and Stand then
		Change=1
		local IdleVal=25
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(-sin(Sine/IdleVal)*2,cotan(Sine/(IdleVal*2))*5,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,cos(Sine/IdleVal)*.075,-sin(Sine/(IdleVal*2))*.05)*angles(-sin(Sine/(IdleVal*2))*2,0,cotan(Sine/(IdleVal*4))*2.5,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,-cos(Sine/IdleVal)*.075,-.035-cotan(Sine/IdleVal)*.05)*angles((sin(Sine/(IdleVal*2))*1)+(-cotan(Sine/(IdleVal*3))*5),sin(Sine/IdleVal)*2.5,-cotan(Sine/(IdleVal*4))*2.5,true)*cf(-.1,-.035,.025)*angles(1.5,3,-2,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,-cos(Sine/IdleVal)*.075,-.035-cotan(Sine/IdleVal)*.05)*angles((sin(Sine/(IdleVal*2))*1)+(cotan(Sine/(IdleVal*3))*5),-sin(Sine/IdleVal)*2.5,-cotan(Sine/(IdleVal*4))*2.5,true)*cf(.1,-.035,.025)*angles(1.5,-3,2,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,(-cos(Sine/IdleVal)*.075)+(-cotan(Sine/(IdleVal*4))*.05),cos(Sine/(IdleVal*2))*.035)*angles((sin(Sine/(IdleVal*2))*1.5)+(cos(Sine/(IdleVal*2))*1)-1,0,-cotan(Sine/(IdleVal*4))*3,true)*cf(0,0,0)*angles(0,-5,2.5,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,(-cos(Sine/IdleVal)*.075)+(cotan(Sine/(IdleVal*4))*.05),-cos(Sine/(IdleVal*2))*.035)*angles((sin(Sine/(IdleVal*2))*1.5)+(-cos(Sine/(IdleVal*2))*1)-1,0,-cotan(Sine/(IdleVal*4))*3,true)*cf(0,0,0)*angles(0,5,-2.5,true),.1)
		HW.C0=HW.C0:Lerp(cf(-.25,-.8,0),.1)
	elseif Moving and Stand then
		local WSVal=5/clamp(hum.WalkSpeed/16,.25,2)*t.Size.Y/2
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(-cos(Sine/WSVal)*2.5,-cos(Sine/WSVal)*15,0,true)*cf(0,0,0)*angles(0,0,0,true)*angles(5*MoveZ,-60*MoveX,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,cos(Sine/(WSVal/2))*.75,0)*angles(sin(Sine/(WSVal/2))*12.5,cos(Sine/WSVal)*15,sin(Sine/(WSVal/2))*12.5*MoveX,true)*cf(0,0,0)*angles(0,0,0,true)*angles(-10*MoveZ,0,-10*MoveX,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,sin(Sine/(WSVal/2))*.2,0)*angles(-cotan(Sine/WSVal)*25,cos(Sine/(WSVal/2))*10,0,true)*cf(0,0,0)*angles(5+10*MoveZ,5,3.5,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,MoveZ>.5 and -cos(Sine/WSVal)*.4 or 0)*angles(MoveZ>.5 and cotan(Sine/WSVal)*130 or 0,cotan(Sine/WSVal)*10,0,true)*cf(0,0,0)*angles(5,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,cos(Sine/WSVal)*.7,-.125-cos(Sine/WSVal)*.75)*angles(cotan(Sine/WSVal)*160*MoveZ,0,cotan(Sine/WSVal)*120*MoveX,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,-cos(Sine/WSVal)*.7,-.125+cos(Sine/WSVal)*.75)*angles(-cotan(Sine/WSVal)*160*MoveZ,0,-cotan(Sine/WSVal)*120*MoveX,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		HW.C0=HW.C0:Lerp(cf(-.25,-.8,0),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		--thanks to kyu or neb.. whatever
		if cos(Sine/WSVal)/2>.2 and Step=="L" then
			Step="R"
			if StandR then
				local SoundId=StepSounds[StandR.Material.Name] or 0
				if StandR.Material=="Sand" and (StandR.Color.r>.7 and StandR.Color.g>.7 and StandR.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				local SizeVal=StandR.Size*RNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		if cos(Sine/WSVal)/2<-.2 and Step=="R" then
			Step="L"
			if StandL then
				local SoundId=StepSounds[StandL.Material.Name] or 0
				if StandL.Material==Enum.Material.Sand and (StandL.Color.r>.7 and StandL.Color.g>.7 and StandL.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				local SizeVal=StandL.Size*LNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		--[[
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		
		-																									-
		
		Joints.Neck.C0=Joints.Neck.C0:Lerp(Joints.Neck.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Root.C0=Joints.Root.C0:Lerp(Joints.Root.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Waist.C0=Joints.Waist.C0:Lerp(Joints.Waist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightShoulder.C0=Joints.RightShoulder.C0:Lerp(Joints.RightShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightElbow.C0=Joints.RightElbow.C0:Lerp(Joints.RightElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightWrist.C0=Joints.RightWrist.C0:Lerp(Joints.RightWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftShoulder.C0=Joints.LeftShoulder.C0:Lerp(Joints.LeftShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftElbow.C0=Joints.LeftElbow.C0:Lerp(Joints.LeftElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftWrist.C0=Joints.LeftWrist.C0:Lerp(Joints.LeftWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightHip.C0=Joints.RightHip.C0:Lerp(Joints.RightHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightKnee.C0=Joints.RightKnee.C0:Lerp(Joints.RightKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightAnkle.C0=Joints.RightAnkle.C0:Lerp(Joints.RightAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftHip.C0=Joints.LeftHip.C0:Lerp(Joints.LeftHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftKnee.C0=Joints.LeftKnee.C0:Lerp(Joints.LeftKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftAnkle.C0=Joints.LeftAnkle.C0:Lerp(Joints.LeftAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		--]]
	elseif not Stand then
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-15,15),0,0,true),.2)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-30,20),0,0,true),.2)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,5,-7.5,true)*cf(-(clamp(hrp.Velocity.Y/20,-.45,0)),0,0)*angles((clamp(hrp.Velocity.Y*4,0,150)),0,-(clamp(hrp.Velocity.Y*4,-120,0)),true),.2)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,-5,7.5,true)*cf((clamp(hrp.Velocity.Y/20,-.45,0)),0,0)*angles((clamp(hrp.Velocity.Y*4,0,150)),0,(clamp(hrp.Velocity.Y*4,-120,0)),true),.2)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,.4,-.35)*angles(-10,-5,5,true),.2)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(clamp(-hrp.Velocity.Y,-25,35),0,0,true)*cf(0,.2,-.15)*angles(-2.5,5,-5,true),.2)
		HW.C0=HW.C0:Lerp(cf(-.25,-.8,0),.2)
	end
	if Type=="R6" then
		nec.C1=nec.C1:Lerp(necC1,.2)
		rutj.C1=rutj.C1:Lerp(rutjC1,.2)
		rs.C1=rs.C1:Lerp(rsC1,.2)
		ls.C1=ls.C1:Lerp(lsC1,.2)
		rh.C1=rh.C1:Lerp(rhC1,.2)
		lh.C1=lh.C1:Lerp(lhC1,.2)
		necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
		rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
		rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
		lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
		rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
		lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	end
end
