--// AnimZ, by ProductionTakeOne#3999

--local wait = fwait or loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/fe5cbdbc396630374041f0c2d156a747/raw/5491a28fd72ed7e11c9fa3f9141df033df3ed5a9/fastwait.lua",true))()
local Global = (getgenv and getgenv() or shared)

local Encode = Global.Encoding or loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/EncodeAnimation.lua",true))()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/GetObjectsPatcher.lua",true))()

local isfile = isfile or readfile and function(name) local a,b = pcall(function() readfile(name) end) if a then return a else return nil end end or function() return nil end
local readfile = readfile and function(name) if isfile(name) then return readfile(name) end end or function() return nil end

local function DecodeCFrame(tbl)
	return CFrame.new(unpack(tbl))
end

local function Create(Name,Data)
	if Name then
		local Obj = Instance.new(Name)
		if Data then
			for i,v in pairs(Data) do
				Obj[i] = v
			end
		end
		return Obj
	end
end

local HTTP = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Root = Character.HumanoidRootPart
local Humanoid = Character.Humanoid

local Sound = Create("Sound",{["Volume"] = 1,["RollOffMaxDistance"] = 100,["Looped"] = true,["Parent"] = Root})

local Animations,Connections,Dancing,RunningSpeed = {},{},nil,0

local Joints = {}; do
	for i,v in pairs(Character:GetDescendants()) do
		if v:IsA("Motor6D") and v.Part0 and v.Part1 then
			if Global.RealRig and not v:IsDescendantOf(Global.RealRig) or not Global.RealRig then
				Joints[v.Part1.Name] = v
			end
		end
	end
end

--[[{
	['Torso'] = Root['RootJoint'];
	['Left Arm'] = Torso['Left Shoulder'];
	['Right Arm'] = Torso['Right Shoulder'];
	['Left Leg'] = Torso['Left Hip'];
	['Right Leg'] = Torso['Right Hip'];
	['Head'] = Torso['Neck']
}]]

-- ripped from the original; I have no idea why this works better then a task.wait
if not RunService:FindFirstChild('Delta') then
	local Delta = Create("BindableEvent",{["Name"] = "Delta",["Parent"] = RunService})
	local A, B = 0, tick()
	RunService.Delta:Fire(); RunService.Heartbeat:Connect(function(C, D)
		A = A + C
		if A >= (1/60) then
			for I = 1, math.floor(A / (1/60)) do
				RunService.Delta:Fire()
			end
			B = tick()
			A = A - (1/60) * math.floor(A / (1/60))
		end
	end)
end
local Delta = RunService.Delta["Event"]

local function Yield(Seconds)
	local Time = Seconds * (60.8) --+ Keyframes[#Keyframes].Time)
	if (1/Time) > 1 then Time = 1 end
	for I = 1,Time,1 do 
		Delta:Wait()
		--task.wait(1/60.8)
	end
end

local function TableContains(Table,Inst)
	for i,v in next, Table do 
		if rawequal(Inst,v) or rawequal(Inst,i) then 
			return true;
		end
	end
	return false
end

local function CheckValidStyle(Style)
	local Success,Detail = pcall(function() local Temp = Enum['EasingStyle'][tostring(Style):split('.')[3]] end)
	return Success
end

local function EditCFrame(Data)
	if Data.Part and Joints[Data.Part.Name] then
		local ValidStyle = CheckValidStyle(Data.Style)
		--print(IsConstant)
		if ValidStyle then
			TweenService:Create(Joints[Data.Part.Name],TweenInfo.new(Data.Duration,Enum['EasingStyle'][tostring(Data.Style):split('.')[3]],Data.Direction,0,false,0),{Transform = Data.CFrame}):Play()
		else
			Joints[Data.Part.Name].Transform = Data.CFrame
		end
	end
end

local function LoadAnimation(Asset)
	local Sequence = isfolder and isfolder("FakeAudios") and readfile("FakeAudios/" .. tostring(Asset) .. ".Anim") or readfile(tostring(Asset) .. ".Anim") or Encode(Global.GetObjects('rbxassetid://'..tostring(Asset))[1],tostring(Asset))
	Sequence = HTTP:JSONDecode(Sequence)
	--wait(0/1)
	if Global.LoopAnims then Sequence.Loop = true end

	--local Keyframes = Sequence:GetKeyframes()
	local Keyframes = Sequence.Keyframes

	local Animation = {}

	Animation.Ended = true
	Animation.Reset = function()
		Animation.Ended = true
		for i,v in pairs(Joints) do
			if Character:FindFirstChild(i) and v then
				--v.Transform = CFrame.new()
			end
		end
	end
	Animation.Play = function()
		Animation.Ended = false
		if Sound.SoundId ~= "" and not Sound.Playing then
			Sound:GetPropertyChangedSignal("Playing"):Wait()
		end
		task.spawn(function()
			repeat
				for K = 1,#Keyframes do 
					local Frame = Keyframes[K]
					if not Animation.Ended and Character.Humanoid.Health > 1 then
						if Keyframes[K-1] then
							Yield(Frame.Time - Keyframes[K-1].Time)
						end
						for i,Pose in pairs(Frame.Joints) do
							task.defer(function()
								--local Pose = Frame.Joints[I]
								if TableContains(Joints,i) and Character:FindFirstChild(i) then 
									local Data = {}
									Data.Part = Character[i]
									Data.CFrame = DecodeCFrame(Pose.CFrame)
									Data.Duration = Keyframes[K+1] and (Keyframes[K+1].Time - Frame.Time) or (1/60)
									Data.Style = Pose.Style
									Data.Direction = Enum['EasingDirection'][tostring(Pose.Direction):split('.')[3]]
									EditCFrame(Data)
								end
							end)
						end
					end
				end
			until not Sequence.Loop or Animation.Ended or Character.Humanoid.Health < 1
			Animation.Reset()
		end)
	end
	table.insert(Animations,Animation)
	return Animation
end

local function EndPlaying()
	for i,v in pairs(Animations) do
		if not v.Ended then
			v.Reset()
			--wait(0/1)
		end
	end
end

Character.Animate.Disabled = true
for i, track in pairs (Humanoid:GetPlayingAnimationTracks()) do
	track:Stop()
end

local Anims = {
	['Idle'] = LoadAnimation(180435571); --5183986020
	['Walk'] = LoadAnimation(6606119539);  --5053650512,180426354,8966021183
	['Run'] = LoadAnimation(180426354); --5053715968
	['Jump'] = LoadAnimation(125750702); --4073859368
	['Fall'] = LoadAnimation(180436148); --3323393688
}

--wait(0/1)

Anims['Idle'].Play()

table.insert(Connections,Humanoid.Running:Connect(function(Speed)
	RunningSpeed = Speed
	if not Dancing and Speed > 6 and Anims['Walk'].Ended then
		EndPlaying()
		Sound.SoundId = ""
		Anims['Walk'].Play()
	elseif not Dancing and Speed < 6 and not Anims['Walk'].Ended then
		EndPlaying()
		Sound.SoundId = ""
		Anims['Idle'].Play()
	end
end))

table.insert(Connections,Humanoid.Jumping:Connect(function(Active)
	if not Dancing and Active and Anims['Jump'].Ended then
		EndPlaying()
		Sound.SoundId = ""
		Anims['Jump'].Play()
	end
end))
table.insert(Connections,Humanoid.FreeFalling:Connect(function(Active)
	if not Dancing and Active and Anims['Jump'].Ended then
		EndPlaying()
		Sound.SoundId = ""
		Anims['Fall'].Play()
	end
end))

table.insert(Connections,Humanoid.StateChanged:Connect(function(Old,New)
	if not Dancing and New == Enum.HumanoidStateType.Landed and Anims['Fall'].Ended then
		EndPlaying()
		Sound.SoundId = ""
		Anims[RunningSpeed > 6 and 'Walk' or 'Idle'].Play()
	end
end))

Global.RunAnimation = function(AnimationID,SoundID)
	if AnimationID == "Stop" or not AnimationID then
		Dancing = false
		EndPlaying()
		Sound.SoundId = ""
		Anims["Idle"].Play()
	else
		if SoundID then
			Sound.SoundId = SoundID
			task.spawn(function()
				if not Sound.IsLoaded then
					Sound.Loaded:Wait()
				end
				Sound.TimePosition = 0
				Sound.Playing = true
			end)
		else
			Sound.SoundId = ""
		end
		local Animation = LoadAnimation(AnimationID)
		Dancing = true
		EndPlaying()
		Animation.Play()
	end
end

table.insert(Connections,Humanoid.Died:Connect(function()
	Global.RunAnimation = nil
	for i,v in pairs(Connections) do
		v:Disconnect()
	end
end))

table.insert(Connections,Player.CharacterAdded:Connect(function()
	Global.RunAnimation = nil
	for i,v in pairs(Connections) do
		v:Disconnect()
	end
end))
