printconsole("YoutubeGUI v1.4")
local gui = game:GetObjects("rbxassetid://7521131615")[1]
gui.Parent = game.CoreGui
local filesystem = loadstring(game:HttpGetAsync('https://pastebin.com/raw/yeY05Niq'))()
gui.Frame.Frame.TextButton.Activated:Connect(function()
	gui:Destroy()
	sound:Destroy()
end)
local sound = Instance.new("Sound",workspace)
sound.Name = "YoutubeSong"
sound.Volume = 2
gui.Frame.Playback.Forward.Activated:Connect(function()
	sound.TimePosition += 10
end)
gui.Frame.Playback.Rewind.Activated:Connect(function()
	sound.TimePosition -= 10
end)
if gui.Frame.Playback:FindFirstChild("Loop") then
	gui.Frame.Playback.Loop.Activated:Connect(function()
		sound.Looped = not sound.Looped
		if sound.Looped then
			gui.Frame.Playback.Loop.ImageTransparency = 1
		else
			gui.Frame.Playback.Loop.ImageTransparency = 0
		end
	end)
end
gui.Frame.Playback.Pause.Activated:Connect(function()
	if gui.Frame.Playback.Pause.Mute.ImageTransparency == 1 then
		gui.Frame.Playback.Pause.Mute.ImageTransparency = 0
		gui.Frame.Playback.Pause.ImageTransparency = 1
		sound:Pause()
	else    
		gui.Frame.Playback.Pause.Mute.ImageTransparency = 1
		gui.Frame.Playback.Pause.ImageTransparency = 0
		sound:Resume()
	end
end)
gui.Frame.Playback.Volume.Activated:Connect(function()
	if gui.Frame.Playback.Volume.Mute.ImageTransparency == 1 then
		gui.Frame.Playback.Volume.Mute.ImageTransparency = 0
		gui.Frame.Playback.Volume.ImageTransparency = 1
		gui.Frame.Playback.Volume.ImageLabel.ImageTransparency = 1
		sound.Volume = 0
	else
		gui.Frame.Playback.Volume.Mute.ImageTransparency = 1
		gui.Frame.Playback.Volume.ImageTransparency = 0
		gui.Frame.Playback.Volume.ImageLabel.ImageTransparency = 0
		sound.Volume = 2
	end
end)
gui.Frame.Link.FocusLost:Connect(function(enterPressed)
	if enterPressed and gui.Frame.Link.Text ~= "" then
		gui.Frame.Link.Loading.ImageTransparency = 0
		gui.Frame.Link.TextEditable = false
		if isfile(gui.Frame.Link.Text .. ".mp3") then
			sound.SoundId = getsynasset(gui.Frame.Link.Text.. ".mp3")
			sound:Play()
		elseif gui.Frame.Link.Text:match("youtube") then
			_G.URL = gui.Frame.Link.Text
			local filenam = _G.URL:split("v="); filenam = filenam[#filenam]
			print(isfile(filenam .. ".mp3"))
			if isfile(filenam .. ".mp3") == false then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/findurl.lua"))()
				filesystem.new(filenam .. ".mp3",game:HttpGet(_G.URL))
			end
			repeat wait() until isfile(filenam.. ".mp3")
			sound.SoundId = getsynasset(filenam.. ".mp3")
			sound:Play()
		end
		gui.Frame.Link.Loading.ImageTransparency = 1
		gui.Frame.Link.TextEditable = true
		gui.Frame.Playback.Volume.Mute.ImageTransparency = 1
		gui.Frame.Playback.Volume.ImageTransparency = 0
		gui.Frame.Playback.Volume.ImageLabel.ImageTransparency = 0
		sound.Volume = 2
		gui.Frame.Playback.Pause.Mute.ImageTransparency = 1
		gui.Frame.Playback.Pause.ImageTransparency = 0
		gui.Frame.Playback.Bar.Frame.Size = UDim2.new(0,0,1,0)
	end
end)
gui.Frame.Link.Loading.ImageTransparency = 1; gui.Frame.Link.TextEditable = true
gui.Frame.Playback.Bar.Frame.ImageLabel.Position = UDim2.new(1,-5,0.5,0)
game["Run Service"].RenderStepped:Connect(function()
	if sound.IsPlaying and sound.TimeLength ~= 0 then
		gui.Frame.Playback.Bar.Frame.Size = UDim2.new((sound.TimePosition/sound.TimeLength)/1,0,1,0)
	end
	if gui.Frame.Link.Loading.ImageTransparency == 0 then
		gui.Frame.Link.Loading.Rotation += 2
	end
end)
local function dragify(Frame)
	local frametomove = gui.Frame
	local dragToggle,dragInput,dragStart,startPos
	local dragSpeed = 0
	local function updateInput(input)
		local Delta = input.Position - dragStart
		frametomove.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	end
	Frame.InputBegan:Connect(function(input)
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
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(gui.Frame.Frame)
