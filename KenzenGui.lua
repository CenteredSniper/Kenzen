
if getgenv().GuiLoaded then printconsole("Already loaded?") error("Already loaded?") return end
local gui = game:GetObjects("rbxassetid://9013635661")[1]
getgenv().GuiLoaded = true
if not game:IsLoaded() then game.Loaded:Wait() end
gui.Parent = game.CoreGui
local script = gui.Frame.LocalScript
local wait = task.wait
local TweenService = game:GetService("TweenService")

local fps = game.Stats.Workspace.FPS

local notify = loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/5aacd41c762304c92802ed4ad714cc98/raw/e8c9b25cb3660028793342728553efdb24e72bec/NotificationService.lua",true))()
local function notification(title,duration) notify({Text = title,Duration = duration}) end

local function dragify(Frame)
	local frametomove = Frame
	local dragToggle,dragInput,dragStart,startPos
	local dragSpeed = 0
	local function updateInput(input)
		local Delta = input.Position - dragStart
		--frametomove.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		local fpsval
		pcall(function() fpsval = fps:GetValue() end)
		fpsval = fpsval or 60
		TweenService:Create(frametomove, TweenInfo.new(1/fpsval), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)}):Play()
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

coroutine.resume(coroutine.create(function()
	wait(1)
	TweenService:Create(script.Parent, TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In), {Size = UDim2.new(0,200,0,25)}):Play() -- resize
	local icon = TweenService:Create(script.Parent.ImageLabel, TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In), {Size = UDim2.new(0,25,0,25)}) -- resize icon
	icon:Play()
	icon.Completed:Wait()
	TweenService:Create(script.Parent.Frame, TweenInfo.new(.7,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {Size = UDim2.new(1,0,0,150)}):Play()
	TweenService:Create(script.Parent.Minimize.TextButton, TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.In), {Position = UDim2.new(0,0,0,0)}):Play()
	wait(0.2)
	for i,v in pairs(script.Parent.Frame:GetChildren()) do
		if v:IsA("TextButton") then
			TweenService:Create(v, TweenInfo.new(.4+(v.Position.Y.Offset/200),Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {Position = UDim2.new(0,0,0,v.Position.Y.Offset)}):Play()
			if script.Parent.Parent:FindFirstChild(v.Name) then
				v.Activated:Connect(function()
					script.Parent.Parent[v.Name].Visible = not script.Parent.Parent[v.Name].Visible
				end)
			end
		end
	end
end))

for i,v in pairs(script.Parent.Parent:GetChildren()) do
	dragify(v)
	v.Minimize.TextButton.Activated:Connect(function()
		if v.Frame.Size.Y.Offset <= 3 then
			TweenService:Create(v.Frame, TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {Size = UDim2.new(1,0,0,v.FrameSize.Value)}):Play()
		else
			TweenService:Create(v.Frame, TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In), {Size = UDim2.new(1,0,0,0)}):Play()
		end
	end)
	if v.Name ~= "Frame" then v.Visible = false end
end

-- Kenzen
script.Parent.Frame.Kenzen.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/KenzenScript.lua",true))()
end)

-- Reanimate
script.Parent.Parent.Reanimate.Frame.TextButton.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua",true))()
end)

for i,v in pairs(script.Parent.Parent.Reanimate.Frame.ScrollingFrame:GetChildren()) do
	if v:IsA("Frame") then
		v.TextLabel.Text = v.Name
		v.ImageButton.Image = v.Activated.Value and "rbxassetid://4458804262" or "rbxassetid://4458801905"
		v.ImageButton.Activated:Connect(function()
			v.Activated.Value = not v.Activated.Value
			v.ImageButton.Image = v.Activated.Value and "rbxassetid://4458804262" or "rbxassetid://4458801905"
			getgenv()[v.Name] = v.Activated.Value
		end)
	end
end

--Netless Scripts

local netlessscripts = {
	{"Star Platinum",function() 
		loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/be41f738db7abc8d275b956af7307e8f/raw/23f5b20a7d2361ca444e18d7c43ffa9a5264c61d/gistfile1.txt",true))()
	end},
	{"Star Platinum+Fling",function() 
		loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/a9b2f463cabc667017df63d7f72fbbaa/raw/0861da6f8db723512d84cbece5286a819c07f5aa/gistfile1.txt",true))()
	end},
	{"Nights Edge",function() 
		getgenv().AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua",true))()
		wait()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/a5cde09512ccd74e89c36a76dc5a08a9/raw/ad873487cc7120faa0aa9acdae57c6c136767fb9/nightsedge",true))()
	end},
	{"Nights Edge+Fling",function() 
		loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/f45a5ba40d9c0e58b52eac2e2b3d8207/raw/dceca0c25eec09d75b276315320a2db76c5668e9/nightsedgefling",true))()
	end},
	{"Tool Dances",function() 
		getgenv().reanimate = true
		getgenv().preloadanimations = true
		getgenv().loadtime = 0
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/toolanimations.lua",true))()
	end},
	{"Wao3",function() 
		getgenv().AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua",true))()
		wait()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/WAO3%20FE.lua",true))()
	end},
	{"Wao",function() 
		getgenv().AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua",true))()
		wait()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/WAO%20FE.txt",true))()
	end},
	{"Majora Mask",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/Majora%20Mask.txt",true))()
	end},
	{"Eyozen",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/eyozen.txt",true))()
	end},
}
local scroll = script.Parent.Parent.Netless.Frame.ScrollingFrame

for i,v in pairs(netlessscripts) do
	local clone = scroll.Example:Clone()
	clone.Name = v[1]
	clone.TextLabel.Text = v[1]
	clone.Parent = scroll
	clone.Visible = true
	clone.Activated:Connect(function()
		v[2]()
	end)
end

--Misc Scripts

local MiscScripts = {
	{"Ping Predict",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/pingpredict.lua",true))()
	end},
	{"Kaiju Anti-Grab",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/antigrab",true))()
	end},
	{"Statistics",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/message%20(18).txt",true))()
	end},
	{"Animation Grabber",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimationStealer.lua",true))()
	end},
	{"CFrame Animator",function() 
		loadstring(game:HttpGet(('https://gist.githubusercontent.com/CenteredSniper/79c80c79d8d73230d1922ce506c64827/raw/23ca64aa14faa3f5c52c6232517fe7cb558485d6/message%2520(34).txt'),true))()
	end},
	{"Backdoor Checker",function() 
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua'),true))()
	end},
	{"Hydroxide",function() 
		local owner = "Upbolt"
		local branch = "revision"

		local function webImport(file)
			return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
		end

		webImport("init")
		webImport("ui/main")
	end},
	{"Simple Aimlock/Esp",function() 
		loadstring(game:HttpGet("https://pastebin.com/raw/Zz5yB0D1", true))()
	end},
	{"AntiTeleport",function() 
		local humroot = game.Players.LocalPlayer.Character.HumanoidRootPart
		local prevpos = humroot.CFrame
		while task.wait() do
			if (humroot.Position - prevpos.Position).Magnitude < -2 or (humroot.Position - prevpos.Position).Magnitude > 2 then
				humroot.CFrame = prevpos
			end
			prevpos = humroot.CFrame
		end
	end},
	{"Antifling",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/L8X/phys/main/antifling.lua",true))()
	end},
}
local scroll2 = script.Parent.Parent.Misc.Frame.ScrollingFrame

for i,v in pairs(MiscScripts) do
	local clone = scroll2.Example:Clone()
	clone.Name = v[1]
	clone.TextLabel.Text = v[1]
	clone.Parent = scroll2
	clone.Visible = true
	clone.Activated:Connect(function()
		v[2]()
	end)
end

-- AutoExec
script.Parent.Frame.Autoexec.Activated:Connect(function()
	if writefile then
		if not isfolder("AutoexecFiles") then
			makefolder("AutoexecFiles")
		end
		writefile("AutoexecFiles/one'sautoexec.txt",game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/one'sautoexec.txt",true))
		notification("Check workspace/AutoexecFiles",3)
	else
		notification("writefile not avaliable",3)
	end
end)

-- Notification
script.Parent.Parent.Notification.Frame.TextButton.Activated:Connect(function()
	if tonumber(script.Parent.Parent.Notification.Frame.Time.Text) then
		notification(script.Parent.Parent.Notification.Frame.text.Text,tonumber(script.Parent.Parent.Notification.Frame.Time.Text))
	end 
end)
