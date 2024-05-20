local Global = getgenv and getgenv() or shared
if not Global.Encoding then
	local HTTP = game:GetService("HttpService")
	local writefile = writefile or function() return nil end 
	local Joints = {
		['Torso'] = 'RootJoint',
		['Left Arm'] = 'Left Shoulder',
		['Right Arm'] = 'Right Shoulder',
		['Left Leg'] = 'Left Hip',
		['Right Leg'] = 'Right Hip',
		['Head'] = 'Neck',
		["LowerTorso"] = "Root",
		["UpperTorso"] = "Waist",
		["RightUpperArm"] = "RightShoulder",
		["RightLowerArm"] = "RightElbow",
		["RightHand"] = "RightWaist",
		["RightUpperLeg"] = "RightHip",
		["RightLowerLeg"] = "RightKnee",
		["RightFoot"] = "RightAnkle",
		["LeftUpperArm"] = "LeftShoulder",
		["LeftLowerArm"] = "LeftElbow",
		["LeftHand"] = "LeftWaist",
		["LeftUpperLeg"] = "LeftHip",
		["LeftLowerLeg"] = "LeftKnee",
		["LeftFoot"] = "LeftAnkle",
	}

	local function EncodeCFrame(cfr)
		return {cfr:components()}
	end

	Global.Encoding = function(Animation,Name)
		local AnimationTable = {}
		AnimationTable.Keyframes = {}
		for i,v in pairs(Animation:GetKeyframes()) do
			local Table = {}
			for i,v in pairs(v:GetDescendants()) do
				if Joints[v.Name] then
					Table[v.Name] = {}
					Table[v.Name].Style = tostring(v.EasingStyle)
					Table[v.Name].Direction = tostring(v.EasingDirection)
					Table[v.Name].CFrame = EncodeCFrame(v.CFrame)
				end
			end
			AnimationTable.Keyframes[i] = {}
			AnimationTable.Keyframes[i].Joints = Table
			AnimationTable.Keyframes[i].Time = v.Time
		end
		AnimationTable.Loop = Animation.Loop
		local Encode = HTTP:JSONEncode(AnimationTable)
		if isfolder then
			if not isfolder("FakeAudios") then
				makefolder("FakeAudios")
			end
			writefile("FakeAudios/" .. Name .. ".Anim",Encode)
		else
			writefile(Name .. ".Anim",Encode)
		end
		return Encode
	end
end

return Global.Encoding
