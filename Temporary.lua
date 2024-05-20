local Gui = game:GetObjects("rbxassetid://9234973824")[1]
local DragFunc = loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/drag.lua",true))()
if not game:IsLoaded() then game.Loaded:Wait() end
local LoadTick = tick()

local wait = task.wait
local getgenv = getgenv and getgenv() or _G
local TweenService = game:GetService("TweenService")
local InputService = game:GetService("UserInputService")
local Camera = workspace.Camera
local Fullscreen = Gui.Fullscreen

-- // Asset Library
local Asset = {}

Asset.new = function(name,properties)
	local NewAsset = Instance.new(name)
	for i,v in pairs(properties) do
		NewAsset[i] = v
	end
	return NewAsset
end

Asset.delay = function(asset,property,value,delaytime)
	task.spawn(function() 
		task.wait(delaytime)
		asset[property] = value
	end)
end

Asset.spawn = function(funct)
	return task.spawn(function() 
		funct()
	end)
end

-- // Main GUI

local GuiIndex = {}
local GuiToggle = false

local Blur = Asset.new("BlurEffect",{["Size"]=12,["Enabled"]=false,["Name"]="KenzenBlur",["Parent"]=game.Lighting})

InputService.InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.LeftBracket and not gameProcessedEvent then
		GuiToggle = not GuiToggle
		Blur.Enabled = GuiToggle
		if GuiToggle then
			Asset.delay(Fullscreen,"Visible",true,0)
			local Fov = Camera.FieldOfView
			TweenService:Create(Camera,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{FieldOfView = Fov+10}):Play()
			for i,v in pairs(GuiIndex) do
				if v:IsA("TextLabel") or v:IsA("TextButton") then
					TweenService:Create(v,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = v:GetAttribute("Transparency")}):Play()
					if v:GetAttribute("BackgroundTransparency") then
						TweenService:Create(v,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = v:GetAttribute("Transparency")}):Play()
					end
				elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
					TweenService:Create(v,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{ImageTransparency = v:GetAttribute("Transparency")}):Play()
				else
					TweenService:Create(v,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = v:GetAttribute("Transparency")}):Play()
				end
			end
		else
			Asset.delay(Fullscreen,"Visible",false,0.15)
			local Fov = Camera.FieldOfView
			TweenService:Create(Camera,TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{FieldOfView = Fov-10}):Play()
			for i,v in pairs(GuiIndex) do
				if v:IsA("TextLabel") or v:IsA("TextButton") then
					TweenService:Create(v,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					if v:GetAttribute("BackgroundTransparency") then
						TweenService:Create(v,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
					end
				elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
					TweenService:Create(v,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
				else
					TweenService:Create(v,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				end
			end
		end
	end 
end)

Asset.spawn(function()
	wait(2)
	for i,v in pairs(Fullscreen:GetDescendants()) do
		if v:IsA("GuiObject") then
			if v.Name == "Drag" then
				DragFunc(v,v.Parent)
			else
				table.insert(GuiIndex,v)
				if not v:GetAttribute("Transparency") then
					v:SetAttribute("Transparency",0)
				end
			end
		end
	end
end)

-- // System Info

Asset.spawn(function()
	while wait(1) do
		Fullscreen.SystemInfo.Ping.Text = game:GetService("Stats").PerformanceStats.Ping:GetValue() .. "ms"
		Fullscreen.SystemInfo.Memory.Text = game:GetService("Stats").PerformanceStats.Memory:GetValueString() .. "mb"
	end
end)

-- // Reanimate

local ReanimateVariables = {
	["Fling"] = false,
	["TorsoFling"] = false,
	["ShowReal"] = false,
	["GodMode"] = true,
	["Tools"] = true,
	["Collisions"] = true,
	["Claim2"] = false,
	["Notification"] = true,
	["AutoAnimate"] = true,
	["DynamicVelocity"] = false,
	["Network"] = true,
	["AntiSleep"] = false,
	["Netless2"] = false,
	["MovementVelocity"] = false,
	["R6toR15"] = false,
	["DynamicVelocityExperimental"] = false,
}

local ReanimateScripts = {
	{"Star Platinum",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/StarPlatinum.lua",true))()
	end},
	{"Star Platinum+Fling",function() 
		loadstring(game:HttpGet("https://github.com/AwsZFvR4Fh6/Ya/blob/main/StarPlatinumFling.lua",true))()
	end},
	{"Nights Edge",function() 
		getgenv.AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua",true))()
		wait(0/1)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/NightsEdge.lua",true))()
	end},
	{"Nights Edge+Fling",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/NightsEdgeFling.lua",true))()
	end},
	{"Tool Dances",function() 
		getgenv.reanimate = true
		getgenv.preloadanimations = true
		getgenv.loadtime = 0
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/toolanimations.lua",true))()
	end},
	{"Wao3",function() 
		getgenv.AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua",true))()
		wait(0/1)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/WAO3%20FE.lua",true))()
	end},
	{"Wao",function() 
		getgenv.AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua",true))()
		wait(0/1)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/WAO%20FE.txt",true))()
	end},
	{"Majora Mask",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/Majora%20Mask.txt",true))()
	end},
	{"Eyozen",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/eyozen.txt",true))()
	end},
}

Asset.spawn(function()
	local ReanimateFrame = Fullscreen.Reanimate.Frame.ScrollingFrame
	for i,v in pairs(ReanimateVariables) do
		local Clone = ReanimateFrame.ImageButton:Clone()
		Clone.Visible = true
		Clone.Name = i
		Clone.TextLabel.Text = i
		if not v then Clone.Selection.Visible = false end
		Clone.Activated:Connect(function()
			Clone.Selection.Visible = not Clone.Selection.Visible
			getgenv[i] = Clone.Selection.Visible
		end)
		
		Clone.Parent = ReanimateFrame
	end
end)

Asset.spawn(function()
	local ReanimateScriptsFrame = Fullscreen.Reanimate.Scripts.ScrollingFrame
	for i,v in pairs(ReanimateScripts) do
		local Clone = ReanimateScriptsFrame.TextButton:Clone()
		Clone.Visible = true
		Clone.Name = v[1]
		Clone.Text = v[1]
		Clone.Activated:Connect(v[2])

		Clone.Parent = ReanimateScriptsFrame
	end
end)

Fullscreen.Reanimate.TextButton.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua",true))()
end)

-- // Script Hub

local MiscScripts = {
	{"Ping Predict",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/pingpredict.lua",true))()
	end},
	{"Kaiju Anti-Grab",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/antigrab",true))()
	end},
	{"Statistics",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/message%20(18).txt",true))()
	end},
	{"Animation Grabber",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimationStealer.lua",true))()
	end},
	{"CFrame Animator",function() 
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/CFrameAnimator.lua'),true))()
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
		while wait(0/1) do
			if (humroot.Position - prevpos.Position).Magnitude < -2 or (humroot.Position - prevpos.Position).Magnitude > 2 then
				humroot.CFrame = prevpos
			end
			prevpos = humroot.CFrame
		end
	end},
	{"Antifling",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/L8X/phys/main/antifling.lua",true))()
	end},
	{"GetAutoExecute",function() 
		if writefile then
			if not isfolder("AutoexecFiles") then
				makefolder("AutoexecFiles")
			end
			writefile("AutoexecFiles/one'sautoexec.txt",game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/extra/one'sautoexec.txt",true))
		end
	end},
	{"KenzenScript",function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/KenzenScript.lua",true))()
	end},
}

Asset.spawn(function()
	local MiscScriptsFrame = Fullscreen.Scripts.Frame.ScrollingFrame
	for i,v in pairs(ReanimateScripts) do
		local Clone = MiscScriptsFrame.TextButton:Clone()
		Clone.Visible = true
		Clone.Name = v[1]
		Clone.Text = v[1]
		Clone.Activated:Connect(v[2])

		Clone.Parent = MiscScriptsFrame
	end
end)

Asset.spawn(function()
	local function randomString()
		local length = math.random(10,20)
		local array = {}
		for i = 1, length do
			array[i] = string.char(math.random(32, 126))
		end
		return table.concat(array)
	end

	Gui.Name = randomString()
	if syn then
		syn.protect_gui(Gui)
		Gui.Parent = game:GetService("CoreGui")
	elseif get_hidden_gui or gethui then
		local hiddenUI = get_hidden_gui or gethui
		Gui.Parent = hiddenUI()
	elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
		Gui.Parent = game:GetService("CoreGui").RobloxGui
	else
		Gui.Parent = game:GetService("CoreGui")
	end
end)

return LoadTick
