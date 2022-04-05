-- R6 Rig (GetObjects can cause lagspikes if not cached)
cors = {}
local FakeRig = Instance.new("Model")

local Humanoid = Instance.new("Humanoid")

local Head = Instance.new("Part")
local HeadMesh = Instance.new("SpecialMesh")
--local face = Instance.new("Decal")

local Torso = Instance.new("Part")
local Neck = Instance.new("Motor6D")

local LeftArm = Instance.new("Part")
local LeftShoulder = Instance.new("Motor6D")

local RightArm = Instance.new("Part")
local RightShoulder = Instance.new("Motor6D")

local LeftLeg = Instance.new("Part")
local LeftHip = Instance.new("Motor6D")

local RightLeg = Instance.new("Part")
local RightHip = Instance.new("Motor6D")

local RootPart = Instance.new("Part")
local RootJoint = Instance.new("Motor6D")

-- not gonna bother naming all of these
local Animate = Instance.new("LocalScript")
local Idle = Instance.new("StringValue")
local Animation31 = Instance.new("Animation")
local NumberValue32 = Instance.new("NumberValue")
local Animation33 = Instance.new("Animation")
local NumberValue34 = Instance.new("NumberValue")
local StringValue35 = Instance.new("StringValue")
local Animation36 = Instance.new("Animation")
local StringValue37 = Instance.new("StringValue")
local Animation38 = Instance.new("Animation")
local StringValue39 = Instance.new("StringValue")
local Animation40 = Instance.new("Animation")
local StringValue41 = Instance.new("StringValue")
local Animation42 = Instance.new("Animation")
local StringValue43 = Instance.new("StringValue")
local Animation44 = Instance.new("Animation")
local StringValue45 = Instance.new("StringValue")
local Animation46 = Instance.new("Animation")
local StringValue47 = Instance.new("StringValue")
local Animation48 = Instance.new("Animation")
local NumberValue49 = Instance.new("NumberValue")
local BodyColors50 = Instance.new("BodyColors")

FakeRig.Name = " "
FakeRig.PrimaryPart = Head

Head.Name = "Head"
Head.Color = Color3.new(0.960784, 0.803922, 0.188235)
Head.Size = Vector3.new(2, 1, 1)
Head.BrickColor = BrickColor.new("Bright yellow")
Head.Locked = true
Head.TopSurface = Enum.SurfaceType.Smooth
Head.brickColor = BrickColor.new("Bright yellow")
Head.FormFactor = Enum.FormFactor.Symmetric
Head.formFactor = Enum.FormFactor.Symmetric

HeadMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
--face.Name = "face"
--face.Texture = "http://www.roblox.com/asset/?id=405705854"

Torso.Name = "Torso"
Torso.Color = Color3.new(0.227451, 0.490196, 0.0823529)
Torso.Size = Vector3.new(2, 2, 1)
Torso.BrickColor = BrickColor.new("Camo")
Torso.LeftParamA = 0
Torso.LeftParamB = 0
Torso.LeftSurface = Enum.SurfaceType.Weld
Torso.Locked = true
Torso.RightParamA = 0
Torso.RightParamB = 0
Torso.RightSurface = Enum.SurfaceType.Weld
Torso.brickColor = BrickColor.new("Camo")
Torso.FormFactor = Enum.FormFactor.Symmetric
Torso.formFactor = Enum.FormFactor.Symmetric

RightShoulder.Name = "Right Shoulder"
RightShoulder.MaxVelocity = 0.10000000149011612
RightShoulder.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
RightShoulder.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
RightShoulder.Part0 = Torso
RightShoulder.Part1 = RightArm

LeftShoulder.Name = "Left Shoulder"
LeftShoulder.MaxVelocity = 0.10000000149011612
LeftShoulder.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
LeftShoulder.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
LeftShoulder.Part0 = Torso
LeftShoulder.Part1 = LeftArm

RightHip.Name = "Right Hip"
RightHip.MaxVelocity = 0.10000000149011612
RightHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
RightHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
RightHip.Part0 = Torso
RightHip.Part1 = RightLeg

LeftHip.Name = "Left Hip"
LeftHip.MaxVelocity = 0.10000000149011612
LeftHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
LeftHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
LeftHip.Part0 = Torso
LeftHip.Part1 = LeftLeg

Neck.Name = "Neck"
Neck.MaxVelocity = 0.10000000149011612
Neck.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Neck.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Neck.Part0 = Torso
Neck.Part1 = Head

LeftArm.Name = "Left Arm"
LeftArm.Color = Color3.new(0.960784, 0.803922, 0.188235)
LeftArm.Size = Vector3.new(1, 2, 1)
LeftArm.BrickColor = BrickColor.new("Bright yellow")
LeftArm.CanCollide = false
LeftArm.Locked = true
LeftArm.brickColor = BrickColor.new("Bright yellow")
LeftArm.FormFactor = Enum.FormFactor.Symmetric
LeftArm.formFactor = Enum.FormFactor.Symmetric

RightArm.Name = "Right Arm"
RightArm.Color = Color3.new(0.960784, 0.803922, 0.188235)
RightArm.Size = Vector3.new(1, 2, 1)
RightArm.BrickColor = BrickColor.new("Bright yellow")
RightArm.CanCollide = false
RightArm.Locked = true
RightArm.brickColor = BrickColor.new("Bright yellow")
RightArm.FormFactor = Enum.FormFactor.Symmetric
RightArm.formFactor = Enum.FormFactor.Symmetric

LeftLeg.Name = "Left Leg"
LeftLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
LeftLeg.Size = Vector3.new(1, 2, 1)
LeftLeg.BottomSurface = Enum.SurfaceType.Smooth
LeftLeg.BrickColor = BrickColor.new("Bright blue")
LeftLeg.CanCollide = false
LeftLeg.Locked = true
LeftLeg.brickColor = BrickColor.new("Bright blue")
LeftLeg.FormFactor = Enum.FormFactor.Symmetric
LeftLeg.formFactor = Enum.FormFactor.Symmetric

RightLeg.Name = "Right Leg"
RightLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
RightLeg.Size = Vector3.new(1, 2, 1)
RightLeg.BottomSurface = Enum.SurfaceType.Smooth
RightLeg.BrickColor = BrickColor.new("Bright blue")
RightLeg.CanCollide = false
RightLeg.Locked = true
RightLeg.brickColor = BrickColor.new("Bright blue")
RightLeg.FormFactor = Enum.FormFactor.Symmetric
RightLeg.formFactor = Enum.FormFactor.Symmetric
Humanoid.LeftLeg = LeftLeg
Humanoid.RightLeg = RightLeg
Humanoid.Torso = RootPart
Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

RootPart.Name = "HumanoidRootPart"
RootPart.Transparency = 1
RootPart.Size = Vector3.new(2, 2, 1)
RootPart.BottomSurface = Enum.SurfaceType.Smooth
RootPart.CanCollide = false
RootPart.LeftParamA = 0
RootPart.LeftParamB = 0
RootPart.Locked = true
RootPart.RightParamA = 0
RootPart.RightParamB = 0
RootPart.TopSurface = Enum.SurfaceType.Smooth
RootPart.FormFactor = Enum.FormFactor.Symmetric
RootPart.formFactor = Enum.FormFactor.Symmetric

RootJoint.Name = "RootJoint"
RootJoint.MaxVelocity = 0.10000000149011612
RootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
RootJoint.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
RootJoint.Part0 = RootPart
RootJoint.Part1 = Torso

Animate.Name = "Animate"
Animate.Parent = FakeRig

Idle.Name = "idle"
Idle.Parent = Animate

Animation31.Name = "Animation1"
Animation31.Parent = Idle
Animation31.AnimationId = "http://www.roblox.com/asset/?id=180435571"

NumberValue32.Name = "Weight"
NumberValue32.Parent = Animation31
NumberValue32.Value = 9

Animation33.Name = "Animation2"
Animation33.Parent = Idle
Animation33.AnimationId = "http://www.roblox.com/asset/?id=180435792"

NumberValue34.Name = "Weight"
NumberValue34.Parent = Animation33
NumberValue34.Value = 1

StringValue35.Name = "walk"
StringValue35.Parent = Animate

Animation36.Name = "WalkAnim"
Animation36.Parent = StringValue35
Animation36.AnimationId = "http://www.roblox.com/asset/?id=180426354"

StringValue37.Name = "run"
StringValue37.Parent = Animate

Animation38.Name = "RunAnim"
Animation38.Parent = StringValue37
Animation38.AnimationId = "http://www.roblox.com/asset/?id=180426354"

StringValue39.Name = "jump"
StringValue39.Parent = Animate

Animation40.Name = "JumpAnim"
Animation40.Parent = StringValue39
Animation40.AnimationId = "http://www.roblox.com/asset/?id=125750702"

StringValue41.Name = "climb"
StringValue41.Parent = Animate

Animation42.Name = "ClimbAnim"
Animation42.Parent = StringValue41
Animation42.AnimationId = "http://www.roblox.com/asset/?id=180436334"

StringValue43.Name = "toolnone"
StringValue43.Parent = Animate

Animation44.Name = "ToolNoneAnim"
Animation44.Parent = StringValue43
Animation44.AnimationId = "http://www.roblox.com/asset/?id=182393478"

StringValue45.Name = "fall"
StringValue45.Parent = Animate

Animation46.Name = "FallAnim"
Animation46.Parent = StringValue45
Animation46.AnimationId = "http://www.roblox.com/asset/?id=180436148"

StringValue47.Name = "sit"
StringValue47.Parent = Animate

Animation48.Name = "SitAnim"
Animation48.Parent = StringValue47
Animation48.AnimationId = "http://www.roblox.com/asset/?id=178130996"

NumberValue49.Name = "ScaleDampeningPercent"
NumberValue49.Parent = Animate
NumberValue49.Value = 0.4000000059604645

BodyColors50.Parent = FakeRig
BodyColors50.HeadColor = BrickColor.new("Bright yellow")
BodyColors50.HeadColor3 = Color3.new(0.960784, 0.803922, 0.188235)
BodyColors50.LeftArmColor = BrickColor.new("Bright yellow")
BodyColors50.LeftArmColor3 = Color3.new(0.960784, 0.803922, 0.188235)
BodyColors50.LeftLegColor3 = Color3.new(0.0509804, 0.411765, 0.67451)
BodyColors50.RightArmColor = BrickColor.new("Bright yellow")
BodyColors50.RightArmColor3 = Color3.new(0.960784, 0.803922, 0.188235)
BodyColors50.RightLegColor3 = Color3.new(0.0509804, 0.411765, 0.67451)
BodyColors50.TorsoColor = BrickColor.new("Camo")
BodyColors50.TorsoColor3 = Color3.new(0.227451, 0.490196, 0.0823529)

RootPart.Parent = FakeRig
Head.Parent = FakeRig
Torso.Parent = FakeRig
LeftArm.Parent = FakeRig
RightArm.Parent = FakeRig
LeftLeg.Parent = FakeRig
RightLeg.Parent = FakeRig

HeadMesh.Parent = Head
face.Parent = Head

Neck.Parent = Torso
RootJoint.Parent = RootPart
LeftShoulder.Parent = Torso
RightShoulder.Parent = Torso
LeftHip.Parent = Torso
RightHip.Parent = Torso

Humanoid.Parent = FakeRig

local Clone = FakeRig:Clone()
FakeRig:Destroy()
return Clone
