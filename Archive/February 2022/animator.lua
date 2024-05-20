--[[ // METADATA

Last Modified: 2/8/2022 8:43AM
Author: ???

--]]

local gui = game:GetObjects("rbxassetid://8723881573")[1]
gui.Parent = game.CoreGui
local frametomove = gui.Frame
local movingframe = gui.Frame.Drag

local function updateInput(input)
	local Delta = input.Position - dragStart
	local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	frametomove.Position = Position
end
movingframe.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
		dragToggle = true
		dragStart = input.Position
		startPos = frametomove.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)
movingframe.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragToggle then
		updateInput(input)
	end
end)
local player     = game.Players.LocalPlayer
repeat wait() until player.Character
------------DISABLING DEFAULT ANIMATIONS-------------
local character = player.Character
character:WaitForChild("Animate"):Destroy() 
character:WaitForChild("Humanoid").Animator:Destroy()
-----------------------------------------------------
local Mode = "Idle"

local Sine = 0
local SineIncrement = 1

local RunService = game:GetService("RunService")

spawn(function()
	while task.wait() do
		Sine = Sine + SineIncrement
	end
end)

local RootJoint     = character.HumanoidRootPart["RootJoint"]
local LeftHip       = character.Torso["Left Hip"]
local RightHip      = character.Torso["Right Hip"]
local LeftShoulder  = character.Torso["Left Shoulder"]
local RightShoulder = character.Torso["Right Shoulder"]
local Neck            = character.Torso["Neck"]

local rootjoint,leftleg,rightleg,leftarm,rightarm,head = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)

RootJoint.C0 = rootjoint
LeftHip.C0 = leftleg
RightHip.C0 = rightleg
LeftShoulder.C0  = leftarm
RightShoulder.C0 = rightarm
Neck.C0 = head

local format = "%s.C0 = %s.C0:lerp(%s*CFrame.new(%d+%d*math.cos(Sine/%d),%d+%d*math.cos(Sine/%d),%d+%d*math.cos(Sine/%d))*CFrame.Angles(math.rad(%d+%d*math.cos(Sine/%d)),math.rad(%d+%d*math.cos(Sine/%d)),math.rad(%d+%d*math.cos(Sine/%d)))"

local values = {
	["Torso"] = {
		["X"] = 0,
		["Y"] = 0,
		["Z"] = 0,
		["X1"] = 0,
		["Y1"] = 0,
		["Z1"] = 0,
		["XSine"] = 0,
		["YSine"] = 0,
		["ZSine"] = 0,
		["X1Sine"] = 0,
		["Y1Sine"] = 0,
		["Z1Sine"] = 0,
		["Sine"] = 0,
		["Divider"] = 1,
	},
	["Left Arm"] = {
		["X"] = 0,
		["Y"] = 0,
		["Z"] = 0,
		["X1"] = 0,
		["Y1"] = 0,
		["Z1"] = 0,
		["XSine"] = 0,
		["YSine"] = 0,
		["ZSine"] = 0,
		["X1Sine"] = 0,
		["Y1Sine"] = 0,
		["Z1Sine"] = 0,
		["Sine"] = 0,
		["Divider"] = 1,
	},
	["Right Arm"] = {
		["X"] = 0,
		["Y"] = 0,
		["Z"] = 0,
		["X1"] = 0,
		["Y1"] = 0,
		["Z1"] = 0,
		["XSine"] = 0,
		["YSine"] = 0,
		["ZSine"] = 0,
		["X1Sine"] = 0,
		["Y1Sine"] = 0,
		["Z1Sine"] = 0,
		["Sine"] = 0,
		["Divider"] = 1,
	},
	["Right Leg"] = {
		["X"] = 0,
		["Y"] = 0,
		["Z"] = 0,
		["X1"] = 0,
		["Y1"] = 0,
		["Z1"] = 0,
		["XSine"] = 0,
		["YSine"] = 0,
		["ZSine"] = 0,
		["X1Sine"] = 0,
		["Y1Sine"] = 0,
		["Z1Sine"] = 0,
		["Sine"] = 0,
		["Divider"] = 1,
	},
	["Left Leg"] = {
		["X"] = 0,
		["Y"] = 0,
		["Z"] = 0,
		["X1"] = 0,
		["Y1"] = 0,
		["Z1"] = 0,
		["XSine"] = 0,
		["YSine"] = 0,
		["ZSine"] = 0,
		["X1Sine"] = 0,
		["Y1Sine"] = 0,
		["Z1Sine"] = 0,
		["Sine"] = 0,
		["Divider"] = 1,
	},
	["Head"] = {
		["X"] = 0,
		["Y"] = 0,
		["Z"] = 0,
		["X1"] = 0,
		["Y1"] = 0,
		["Z1"] = 0,
		["XSine"] = 0,
		["YSine"] = 0,
		["ZSine"] = 0,
		["X1Sine"] = 0,
		["Y1Sine"] = 0,
		["Z1Sine"] = 0,
		["Sine"] = 0,
		["Divider"] = 1,
	},
}

local selectedtab = "Torso"

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Accessory") then
		local example = gui.Frame.ScrollingFrame.example:Clone()
		example.TextTruncate = Enum.TextTruncate.AtEnd
		example.Visible = true
		example.Text = v.Name
		example.Name = v.Name
		example.Hat.Value = v
		example.C0Val.Value = v.Handle.AccessoryWeld.C0
		example.valuename.Value = v.Handle:FindFirstChildOfClass("SpecialMesh").MeshId
		values[example.valuename.Value] = {
			["X"] = 0,
			["Y"] = 0,
			["Z"] = 0,
			["X1"] = 0,
			["Y1"] = 0,
			["Z1"] = 0,
			["XSine"] = 0,
			["YSine"] = 0,
			["ZSine"] = 0,
			["X1Sine"] = 0,
			["Y1Sine"] = 0,
			["Z1Sine"] = 0,
			["Sine"] = 0,
			["Divider"] = 1,
		}
		example.Parent = gui.Frame.ScrollingFrame
		example.Activated:Connect(function()
			selectedtab = example.valuename.Value
			for _,g in pairs(gui.Frame.Frame:GetChildren()) do
				if g:IsA("TextBox") then
					g.Text = tostring(values[selectedtab][g.Name])
				end
			end
			gui.Frame.Frame.ResetFrame.Text = "Reset ".. v.Name
		end)
	end
end

local defaultval = values


for _,g in pairs(gui.Frame.Frame:GetChildren()) do
	if g:IsA("TextBox") and g.Name ~= "FileName" then
		g.Text = tostring(values[selectedtab][g.Name])
	end
end
for i,v in pairs(gui.Frame:GetChildren()) do
	if v:IsA("TextButton") then
		v.Activated:Connect(function()
			selectedtab = v.Name
			for _,g in pairs(gui.Frame.Frame:GetChildren()) do
				if g:IsA("TextBox") then
					g.Text = tostring(values[selectedtab][g.Name])
				end
			end
			gui.Frame.Frame.ResetFrame.Text = "Reset ".. v.Name
		end)
	end
end
for i,v in pairs(gui.Frame.Frame:GetChildren()) do
	if v:IsA("TextBox") and v.Name ~= "FileName" then
		v:GetPropertyChangedSignal("Text"):Connect(function(enter)
			if tonumber(v.Text) then
				values[selectedtab][v.Name] = tonumber(v.Text)
			end
		end)
	end
end
gui.Frame.Frame.ResetFrame.Activated:Connect(function()
	values[selectedtab]["X"] = 0
	values[selectedtab]["Y"] = 0
	values[selectedtab]["Z"] = 0
	values[selectedtab]["X1"] = 0
	values[selectedtab]["Y1"] = 0
	values[selectedtab]["Z1"] = 0
	values[selectedtab]["XSine"] = 0
	values[selectedtab]["YSine"] = 0
	values[selectedtab]["ZSine"] = 0
	values[selectedtab]["X1Sine"] = 0
	values[selectedtab]["Y1Sine"] = 0
	values[selectedtab]["Z1Sine"] = 0
	values[selectedtab]["Sine"] = 0
	values[selectedtab]["Divider"] = 1
	for i,v in pairs(gui.Frame.Frame:GetChildren()) do
		if v:IsA("TextBox") then
			v.Text = ""
		end
	end
end)
gui.Frame.Frame.Reset.Activated:Connect(function()
	values = defaultval
	for i,v in pairs(gui.Frame.Frame:GetChildren()) do
		if v:IsA("TextBox") then
			v.Text = ""
		end
	end
end)


gui.Frame.Frame.SaveFile.Activated:Connect(function()
	if writefile then
		local randomname = ""
		for i = 1, 5 do
			randomname ..= string.char(math.random(97,122))
		end
		writefile(randomname .. ".One",game:GetService("HttpService"):JSONEncode(values))
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Saved file successfully";
			Text = "saved to " .. randomname .. ".One";
			Duration = 5;
		})
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "writefile not avaliable?";
			Text = "does your exploit support file functions?";
			Duration = 5;
		})
	end
end)

gui.Frame.Frame.LoadFile.Activated:Connect(function()
	if isfile and isfile(gui.Frame.Frame.FileName.Text) then
		--values = game:GetService("HttpService"):JSONDecode(readfile(gui.Frame.Frame.FileName.Text))
		local newvals = game:GetService("HttpService"):JSONDecode(readfile(gui.Frame.Frame.FileName.Text))
		for i,v in pairs(values) do
			if newvals[i] then
				values[i] = newvals[i]
			end
		end
		for _,g in pairs(gui.Frame.Frame:GetChildren()) do
			if g:IsA("TextBox") and g.Name ~= "FileName" then
				g.Text = tostring(values[selectedtab][g.Name])
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "loaded file successfully";
			Text = "changed all c0's to file!";
			Duration = 5;
		})
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "readfile not avaliable?";
			Text = "does your exploit support file functions?";
			Duration = 5;
		})
	end
end)

gui.Frame.Frame.Convert.Activated:Connect(function()
	local masterstring = ""
	masterstring = string.format(format, "RootJoint","RootJoint","RootJointC0",
		values["Torso"]["X"],values["Torso"]["XSine"],values["Torso"]["Divider"],
		values["Torso"]["Y"],values["Torso"]["YSine"],values["Torso"]["Divider"],
		values["Torso"]["Z"],values["Torso"]["ZSine"],values["Torso"]["Divider"],
		values["Torso"]["X1"],values["Torso"]["X1Sine"],values["Torso"]["Divider"],
		values["Torso"]["Y1"],values["Torso"]["Y1Sine"],values["Torso"]["Divider"],
		values["Torso"]["Z1"],values["Torso"]["Z1Sine"],values["Torso"]["Divider"])
	masterstring = masterstring.."\n" .. string.format(format, "LeftHip","LeftHip","LeftHipC0",
		values["Left Leg"]["X"],values["Left Leg"]["XSine"],values["Left Leg"]["Divider"],
		values["Left Leg"]["Y"],values["Left Leg"]["YSine"],values["Left Leg"]["Divider"],
		values["Left Leg"]["Z"],values["Left Leg"]["ZSine"],values["Left Leg"]["Divider"],
		values["Left Leg"]["X1"],values["Left Leg"]["X1Sine"],values["Left Leg"]["Divider"],
		values["Left Leg"]["Y1"],values["Left Leg"]["Y1Sine"],values["Left Leg"]["Divider"],
		values["Left Leg"]["Z1"],values["Left Leg"]["Z1Sine"],values["Left Leg"]["Divider"])
	masterstring = masterstring.."\n" .. string.format(format, "RightHip","RightHip","RightHipC0",
		values["Right Leg"]["X"],values["Right Leg"]["XSine"],values["Right Leg"]["Divider"],
		values["Right Leg"]["Y"],values["Right Leg"]["YSine"],values["Right Leg"]["Divider"],
		values["Right Leg"]["Z"],values["Right Leg"]["ZSine"],values["Right Leg"]["Divider"],
		values["Right Leg"]["X1"],values["Right Leg"]["X1Sine"],values["Right Leg"]["Divider"],
		values["Right Leg"]["Y1"],values["Right Leg"]["Y1Sine"],values["Right Leg"]["Divider"],
		values["Right Leg"]["Z1"],values["Right Leg"]["Z1Sine"],values["Right Leg"]["Divider"])
	masterstring = masterstring.. "\n" .. string.format(format, "RightShoulder","RightShoulder","RightShoulderC0",
		values["Right Arm"]["X"],values["Right Arm"]["XSine"],values["Right Arm"]["Divider"],
		values["Right Arm"]["Y"],values["Right Arm"]["YSine"],values["Right Arm"]["Divider"],
		values["Right Arm"]["Z"],values["Right Arm"]["ZSine"],values["Right Arm"]["Divider"],
		values["Right Arm"]["X1"],values["Right Arm"]["X1Sine"],values["Right Arm"]["Divider"],
		values["Right Arm"]["Y1"],values["Right Arm"]["Y1Sine"],values["Right Arm"]["Divider"],
		values["Right Arm"]["Z1"],values["Right Arm"]["Z1Sine"],values["Right Arm"]["Divider"])
	masterstring = masterstring.."\n" .. string.format(format, "LeftShoulder","LeftShoulder","LeftShoulderC0",
		values["Left Arm"]["X"],values["Left Arm"]["XSine"],values["Left Arm"]["Divider"],
		values["Left Arm"]["Y"],values["Left Arm"]["YSine"],values["Left Arm"]["Divider"],
		values["Left Arm"]["Z"],values["Left Arm"]["ZSine"],values["Left Arm"]["Divider"],
		values["Left Arm"]["X1"],values["Left Arm"]["X1Sine"],values["Left Arm"]["Divider"],
		values["Left Arm"]["Y1"],values["Left Arm"]["Y1Sine"],values["Left Arm"]["Divider"],
		values["Left Arm"]["Z1"],values["Left Arm"]["Z1Sine"],values["Left Arm"]["Divider"])
	masterstring = masterstring.."\n" .. string.format(format, "Neck","Neck","NeckC0",
		values["Head"]["X"],values["Head"]["XSine"],values["Head"]["Divider"],
		values["Head"]["Y"],values["Head"]["YSine"],values["Head"]["Divider"],
		values["Head"]["Z"],values["Head"]["ZSine"],values["Head"]["Divider"],
		values["Head"]["X1"],values["Head"]["X1Sine"],values["Head"]["Divider"],
		values["Head"]["Y1"],values["Head"]["Y1Sine"],values["Head"]["Divider"],
		values["Head"]["Z1"],values["Head"]["Z1Sine"],values["Head"]["Divider"])
	for i,v in pairs(gui.Frame.ScrollingFrame:GetChildren()) do
		if v:IsA("TextButton") and v.Name ~= "example" then
			local valuename = v.valuename.Value
			masterstring = masterstring.."\n" .. string.format(format, string.gsub(v.Name, "%s+", ""),string.gsub(v.Name, "%s+", ""),string.gsub(v.Name, "%s+", "") .. "C0",
				values[valuename]["X"],values[valuename]["XSine"],values[valuename]["Divider"],
				values[valuename]["Y"],values[valuename]["YSine"],values[valuename]["Divider"],
				values[valuename]["Z"],values[valuename]["ZSine"],values[valuename]["Divider"],
				values[valuename]["X1"],values[valuename]["X1Sine"],values[valuename]["Divider"],
				values[valuename]["Y1"],values[valuename]["Y1Sine"],values[valuename]["Divider"],
				values[valuename]["Z1"],values[valuename]["Z1Sine"],values[valuename]["Divider"])
		end
	end
	print(masterstring)
	if setclipboard then
		setclipboard(masterstring)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Copied C0's";
			Text = "Saved C0's to clipboard";
			Duration = 5;
		})
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "setclipboard not avaliable? ";
			Text = "printed c0's";
			Duration = 5;
		})
	end
end)

while task.wait() do
	RootJoint.C0 = RootJoint.C0:lerp(rootjoint * CFrame.new(values["Torso"]["X"] + values["Torso"]["XSine"] * math.cos(Sine/values["Torso"]["Divider"]),
		values["Torso"]["Y"] + values["Torso"]["YSine"] * math.cos(Sine/values["Torso"]["Divider"]),
		values["Torso"]["Z"] + values["Torso"]["ZSine"] * math.cos(Sine/values["Torso"]["Divider"])) * CFrame.Angles(
		math.rad(values["Torso"]["X1"] + values["Torso"]["X1Sine"] * math.cos(Sine/values["Torso"]["Divider"])),
		math.rad(values["Torso"]["Y1"] + values["Torso"]["Y1Sine"] * math.cos(Sine/values["Torso"]["Divider"])),
		math.rad(values["Torso"]["Z1"] + values["Torso"]["Z1Sine"] * math.cos(Sine/values["Torso"]["Divider"]))), .1)
	LeftHip.C0 = LeftHip.C0:lerp(leftleg * CFrame.new(values["Left Leg"]["X"] + values["Left Leg"]["XSine"] * math.cos(Sine/values["Left Leg"]["Divider"]),
		values["Left Leg"]["Y"] + values["Left Leg"]["YSine"] * math.cos(Sine/values["Left Leg"]["Divider"]),
		values["Left Leg"]["Z"] + values["Left Leg"]["ZSine"] * math.cos(Sine/values["Left Leg"]["Divider"])) * CFrame.Angles(
		math.rad(values["Left Leg"]["X1"] + values["Left Leg"]["X1Sine"] * math.cos(Sine/values["Left Leg"]["Divider"])),
		math.rad(values["Left Leg"]["Y1"] + values["Left Leg"]["Y1Sine"] * math.cos(Sine/values["Left Leg"]["Divider"])),
		math.rad(values["Left Leg"]["Z1"] + values["Left Leg"]["Z1Sine"] * math.cos(Sine/values["Left Leg"]["Divider"]))), .1)
	RightHip.C0 = RightHip.C0:lerp(rightleg * CFrame.new(values["Right Leg"]["X"] + values["Right Leg"]["XSine"] * math.cos(Sine/values["Right Leg"]["Divider"]),
		values["Right Leg"]["Y"] + values["Right Leg"]["YSine"] * math.cos(Sine/values["Right Leg"]["Divider"]),
		values["Right Leg"]["Z"] + values["Right Leg"]["ZSine"] * math.cos(Sine/values["Right Leg"]["Divider"])) * CFrame.Angles(
		math.rad(values["Right Leg"]["X1"] + values["Right Leg"]["X1Sine"] * math.cos(Sine/values["Right Leg"]["Divider"])),
		math.rad(values["Right Leg"]["Y1"] + values["Right Leg"]["Y1Sine"] * math.cos(Sine/values["Right Leg"]["Divider"])),
		math.rad(values["Right Leg"]["Z1"] + values["Right Leg"]["Z1Sine"] * math.cos(Sine/values["Right Leg"]["Divider"]))), .1)
	RightShoulder.C0 = RightShoulder.C0:lerp(rightarm * CFrame.new(values["Right Arm"]["X"] + values["Right Arm"]["XSine"] * math.cos(Sine/values["Right Arm"]["Divider"]),
		values["Right Arm"]["Y"] + values["Right Arm"]["YSine"] * math.cos(Sine/values["Right Arm"]["Divider"]),
		values["Right Arm"]["Z"] + values["Right Arm"]["ZSine"] * math.cos(Sine/values["Right Arm"]["Divider"])) * CFrame.Angles(
		math.rad(values["Right Arm"]["X1"] + values["Right Arm"]["X1Sine"] * math.cos(Sine/values["Right Arm"]["Divider"])),
		math.rad(values["Right Arm"]["Y1"] + values["Right Arm"]["Y1Sine"] * math.cos(Sine/values["Right Arm"]["Divider"])),
		math.rad(values["Right Arm"]["Z1"] + values["Right Arm"]["Z1Sine"] * math.cos(Sine/values["Right Arm"]["Divider"]))), .1)
	LeftShoulder.C0 = LeftShoulder.C0:lerp(leftarm * CFrame.new(values["Left Arm"]["X"] + values["Left Arm"]["XSine"] * math.cos(Sine/values["Left Arm"]["Divider"]),
		values["Left Arm"]["Y"] + values["Left Arm"]["YSine"] * math.cos(Sine/values["Left Arm"]["Divider"]),
		values["Left Arm"]["Z"] + values["Left Arm"]["ZSine"] * math.cos(Sine/values["Left Arm"]["Divider"])) * CFrame.Angles(
		math.rad(values["Left Arm"]["X1"] + values["Left Arm"]["X1Sine"] * math.cos(Sine/values["Left Arm"]["Divider"])),
		math.rad(values["Left Arm"]["Y1"] + values["Left Arm"]["Y1Sine"] * math.cos(Sine/values["Left Arm"]["Divider"])),
		math.rad(values["Left Arm"]["Z1"] + values["Left Arm"]["Z1Sine"] * math.cos(Sine/values["Left Arm"]["Divider"]))), .1)
	Neck.C0 = Neck.C0:lerp(head * CFrame.new(values["Head"]["X"] + values["Head"]["XSine"] * math.cos(Sine/values["Head"]["Divider"]),
		values["Head"]["Y"] + values["Head"]["YSine"] * math.cos(Sine/values["Head"]["Divider"]),
		values["Head"]["Z"] + values["Head"]["ZSine"] * math.cos(Sine/values["Head"]["Divider"])) * CFrame.Angles(
		math.rad(values["Head"]["X1"] + values["Head"]["X1Sine"] * math.cos(Sine/values["Head"]["Divider"])),
		math.rad(values["Head"]["Y1"] + values["Head"]["Y1Sine"] * math.cos(Sine/values["Head"]["Divider"])),
		math.rad(values["Head"]["Z1"] + values["Head"]["Z1Sine"] * math.cos(Sine/values["Head"]["Divider"]))), .1)
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") then
			local valuename = gui.Frame.ScrollingFrame[v.Name].valuename.Value
			v.Handle.AccessoryWeld.C0 = v.Handle.AccessoryWeld.C0:lerp(gui.Frame.ScrollingFrame[v.Name].C0Val.Value * CFrame.new(values[valuename]["X"] + values[valuename]["XSine"] * math.cos(Sine/values[valuename]["Divider"]),
				values[valuename]["Y"] + values[valuename]["YSine"] * math.cos(Sine/values[valuename]["Divider"]),
				values[valuename]["Z"] + values[valuename]["ZSine"] * math.cos(Sine/values[valuename]["Divider"])) * CFrame.Angles(
				math.rad(values[valuename]["X1"] + values[valuename]["X1Sine"] * math.cos(Sine/values[valuename]["Divider"])),
				math.rad(values[valuename]["Y1"] + values[valuename]["Y1Sine"] * math.cos(Sine/values[valuename]["Divider"])),
				math.rad(values[valuename]["Z1"] + values[valuename]["Z1Sine"] * math.cos(Sine/values[valuename]["Divider"]))), .1)
		end
	end
end
