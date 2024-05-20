local Gui,Animations,ScrollFrame,Scroll,AnimationsLabel,Preview,View,PreviewLabel,Settings,SettingsFrame,ReanimateButton,CustomID,SettingsLabel,Viewport
local Player = game:GetService("Players").LocalPlayer
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local PreviewBodyR6,PreviewBodyR15
local Camera = Instance.new("Camera")
local Global = getgenv and getgenv() or _G
local isfile = isfile or readfile and function(name) local a,b = pcall(function() readfile(name) end) if a then return a else return nil end end or function() return nil end
local readfile = readfile and function(name) if isfile(name) then return readfile(name) end end or function() return nil end
local SelectedCamera
local notify = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/notificationstuff/main/src.lua",true))()
local Animated
local FilesR6 = loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/AnimationsIndex.lua",true))()
local FilesR15 = loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/R15AnimationsIndex.lua",true))()
local Encode = loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/EncodeAnimation.lua",true))()


local function CreateInstance(cls,props)
	local inst = Instance.new(cls)
	for i,v in pairs(props) do
		inst[i] = v
	end
	return inst
end

local function notify (Arguments)
	task.spawn(function()
		local Text = Arguments.Text or "lorem ipsum"
		local Duration = Arguments.Duration or 5

		-- Instances:

		local ScreenGui = CoreGui:FindFirstChild("Error") or Instance.new("ScreenGui", CoreGui)
		local ErrorMessage = (Instance.new("Frame"))
		local TextSizeConstraint = (Instance.new("UISizeConstraint"))
		local AsspectRatioConstraint = (Instance.new("UIAspectRatioConstraint"))
		local ErrorText = (Instance.new("TextLabel"))
		local TextSizeConstraint_2 = (Instance.new("UITextSizeConstraint"))
		local SizeConstraint = (Instance.new("UISizeConstraint"))
		local ErrorIcon = (Instance.new("ImageLabel"))
		local AsspectRatioConstraint_2 = (Instance.new("UIAspectRatioConstraint"))

		--Properties:

		local Children = ScreenGui:GetChildren()
		for i,v in pairs(Children) do
			local Tween = TweenService:Create(v,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(ErrorMessage.Position.X.Scale, 0, .1, (i*v.AbsoluteSize.Y*1.2))})
			Tween:Play()
		end

		ScreenGui.Parent = CoreGui
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		ScreenGui.Name = "Error"

		ErrorMessage.Name = "ErrorMessage"
		ErrorMessage.Parent = ScreenGui
		ErrorMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ErrorMessage.BackgroundTransparency = 0.300
		ErrorMessage.BorderSizePixel = 0
		ErrorMessage.Position = UDim2.new(-1, 0, .1, 0)
		ErrorMessage.Size = UDim2.new(0.600000024, 0, 0.200000003, 0)

		TextSizeConstraint.Name = "TextSizeConstraint"
		TextSizeConstraint.Parent = ErrorMessage
		TextSizeConstraint.MaxSize = Vector2.new(432, 72)
		TextSizeConstraint.MinSize = Vector2.new(336, 56)

		AsspectRatioConstraint.Name = "AsspectRatioConstraint"
		AsspectRatioConstraint.Parent = ErrorMessage
		AsspectRatioConstraint.AspectRatio = 6.000

		ErrorText.Name = "ErrorText"
		ErrorText.Parent = ErrorMessage
		ErrorText.AnchorPoint = Vector2.new(0, 0.5)
		ErrorText.BackgroundTransparency = 1.000
		ErrorText.Position = UDim2.new(0.200000003, -10, 0.5, 0)
		ErrorText.Size = UDim2.new(0.800000012, 0, 1, 0)
		ErrorText.Font = Enum.Font.Gotham
		ErrorText.Text = Text
		ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ErrorText.TextScaled = true
		ErrorText.TextSize = 36.000
		ErrorText.TextWrapped = true
		ErrorText.TextXAlignment = Enum.TextXAlignment.Left

		TextSizeConstraint_2.Name = "TextSizeConstraint"
		TextSizeConstraint_2.Parent = ErrorText
		TextSizeConstraint_2.MaxTextSize = 36

		SizeConstraint.Name = "SizeConstraint"
		SizeConstraint.Parent = ErrorText
		SizeConstraint.MaxSize = Vector2.new(432, 46)

		ErrorIcon.Name = "ErrorIcon"
		ErrorIcon.Parent = ErrorMessage
		ErrorIcon.AnchorPoint = Vector2.new(0, 0.5)
		ErrorIcon.BackgroundTransparency = 1.000
		ErrorIcon.Position = UDim2.new(0, 10, 0.5, 0)
		ErrorIcon.Size = UDim2.new(0.200000003, -20, 1, -20)
		ErrorIcon.Image = "rbxasset://textures/ui/Emotes/ErrorIcon.png"
		ErrorIcon.Rotation = 180

		AsspectRatioConstraint_2.Name = "AsspectRatioConstraint"
		AsspectRatioConstraint_2.Parent = ErrorIcon

		Debris:AddItem(ErrorMessage, Duration+3)
		local Tween = TweenService:Create(ErrorMessage,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(0, 0, 0, ErrorMessage.AbsolutePosition.Y)})
		Tween:Play()
		task.wait(0.6)
		local IconTween = TweenService:Create(ErrorIcon,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation = 0})
		IconTween:Play()
		task.wait(0.4)
		wait(Duration)
		Tween = TweenService:Create(ErrorMessage,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(-1, 0, 0, ErrorMessage.AbsolutePosition.Y)})
		Tween:Play()
	end)
end

local function getsynassetfromurl(URL,Name)
	if not isfolder("FakeAudios") then makefolder("FakeAudios") end
	Name = "FakeAudios/" .. Name
	local getsynasset, request = getsynasset or getcustomasset or error('invalid attempt to \'getsynassetfromurl\' (custom asset retrieval function expected)'), (syn and syn.request) or (http and http.request) or (request) or error('invalid attempt to \'getsynassetfromurl\' (http request function expected)')
	if isfile(Name .. ".ogg") then
		return getsynasset(Name .. ".ogg")
	else
		notify({
			Text = "Downloading Asset data " .. Name .. ".mp3",
			Duration = 3
		})
		local Extension, Types, URL = '', {'.png', '.webm'}, assert(tostring(type(URL)) == 'string', 'invalid argument #1 to \'getsynassetfromurl\' (string [URL] expected, got '..tostring(type(URL))..')') and URL or nil
		local Response, TempFile = request({
			Url = URL,
			Method = 'GET'
		})

		if Response.StatusCode == 200 then
			Extension = Response.Body:sub(2, 4) == 'PNG' and '.png' or Response.Body:sub(25, 28) == 'webm' and '.webm' or nil
		end

		if Response.StatusCode == 200 then--and (Extension and table.find(Types, Extension)) then
			for i = 1, 15 do
				local Letter, Lower = string.char(math.random(65, 90)), math.random(1, 5) == 3 and true or false
			end

			writefile(Name..".ogg", Response.Body)

			return getsynasset(Name..".ogg")
		elseif Response.StatusCode ~= 200 or not Extension then
			warn('unexpected \'getsynassetfromurl\' Status Error: ' .. Response.StatusMessage .. ' ('..URL..')')
		elseif not (Extension) then
			warn('unexpected \'getsynassetfromurl\' Error: (PNG or webm file expected)')
		end
	end
end

local function Drag(Frame,FrameToMove)
	local frametomove = FrameToMove
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

do -- [[ GUI ]]
	Gui = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='ScreenGui', Parent=CoreGui})
	Animations = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.258824, 0.258824, 0.258824),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 82, 0, 44),Rotation=0,Selectable=false,Size=UDim2.new(0, 250, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=5,Name = 'Animations',Parent = Gui})
	ScrollFrame = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.258824, 0.258824, 0.258824),BackgroundTransparency=0.5,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(1, 0, 0, 300),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'Frame',Parent = Animations})
	Scroll = CreateInstance('ScrollingFrame',{BottomImage='rbxassetid://158348114',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 0, 0),MidImage='rbxassetid://158348114',ScrollBarThickness=6,ScrollingEnabled=true,TopImage='rbxassetid://158348114',Active=true,AnchorPoint=Vector2.new(0, 1),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0, 0, 1, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, 0, 0, 280),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ScrollingFrame',AutomaticCanvasSize=Enum.AutomaticSize.Y,Parent = ScrollFrame})
	AnimationsLabel = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='Animations',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0.959999979, 0, 1, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=6,Name='TextLabel',Parent = Animations})
	Preview = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.258824, 0.258824, 0.258824),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 346, 0, 44),Rotation=0,Selectable=false,Size=UDim2.new(0, 210, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=5,Name = 'Preview',Parent = Gui})
	View = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.258824, 0.258824, 0.258824),BackgroundTransparency=0.5,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(1, 0, 0, 230),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'Frame',Parent = Preview})
	PreviewLabel = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='Preview',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0.959999979, 0, 1, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=6,Name='TextLabel',Parent = Preview})
	Settings = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.258824, 0.258824, 0.258824),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 346, 0, 280),Rotation=0,Selectable=false,Size=UDim2.new(0, 210, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=5,Name = 'Settings',Parent = Gui})
	SettingsFrame = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.258824, 0.258824, 0.258824),BackgroundTransparency=0.5,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(1, 0, 0, 65),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'Frame',Parent = Settings})
	ReanimateButton = CreateInstance('TextButton',{Font=Enum.Font.GothamMedium,FontSize=Enum.FontSize.Size12,Text='Reanimate',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=12,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0.5),BackgroundColor3=Color3.new(0.196078, 0.196078, 0.196078),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0380952395, 0, 0.284615397, 20),Rotation=0,Selectable=true,Size=UDim2.new(0, 71, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TextButton',Parent = SettingsFrame})
	CustomID = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 1, 1), PlaceholderText='Custom ID', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0.5),BackgroundColor3=Color3.new(0.196078, 0.196078, 0.196078),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.428000003, 0, 0.284999996, 20),Rotation=0,Selectable=true,Size=UDim2.new(0, 108, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TextBox',Parent = SettingsFrame})
	SettingsLabel = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='Settings',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0.959999979, 0, 1, 0),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=6,Name='TextLabel',Parent = Settings})
	local ViewportFrame = CreateInstance("ViewportFrame",{AnchorPoint=Vector2.new(0,1),BackgroundTransparency=1,Position=UDim2.new(0,0,1,0),Size=UDim2.new(1,0,0,210),Parent=View})	
	Viewport = CreateInstance("WorldModel",{Parent = ViewportFrame})
	local ListLayout = CreateInstance("UIListLayout",{SortOrder = Enum.SortOrder.LayoutOrder,Parent = Scroll})
	Drag(Animations,Animations) Drag(Preview,Preview) Drag(Settings,Settings)
end
	
local ExampleButton = CreateInstance("TextButton",{BackgroundColor3 = Color3.fromRGB(50,50,50),Size = UDim2.new(1,0,0,15),Font=Enum.Font.GothamMedium,Text = "",TextScaled = true,TextColor3 = Color3.new(1,1,1),BorderSizePixel=0})

if not fwait then local Bind = Instance.new("BindableEvent") local RunService = game:GetService("RunService") for i,v in ipairs({RunService.RenderStepped,RunService.PreAnimation,RunService.Stepped,RunService.Heartbeat}) do v:Connect(function() Bind:Fire() end) end fwait = Bind.Event local function FastWait(Num) if Num and Num > 0 then local Tick = tick() repeat Tick += Bind.Event:Wait() until Tick >= Num return Tick else return Bind.Event:Wait() end end end

Camera.CFrame = CFrame.new(0,-0.5,-6) * CFrame.Angles(0,math.rad(180),0)
Viewport.Parent.CurrentCamera = Camera

do -- [[ Make Preview R6 PreviewBodyR15 ]]
	PreviewBodyR6 = Instance.new("Model")

	local Humanoid = Instance.new("Humanoid")

	local Head = Instance.new("Part")
	local HeadMesh = Instance.new("SpecialMesh")
	local face = Instance.new("Decal")

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

	local FaceCenterAttachment = Instance.new("Attachment")
	local FaceFrontAttachment = Instance.new("Attachment")
	local HairAttachment = Instance.new("Attachment")
	local HatAttachment = Instance.new("Attachment")
	local LeftShoulderAttachment = Instance.new("Attachment")
	local RightShoulderAttachment = Instance.new("Attachment")
	local BodyBackAttachment = Instance.new("Attachment")
	local BodyFrontAttachment = Instance.new("Attachment")
	local LeftCollarAttachment = Instance.new("Attachment")
	local RightCollarAttachment = Instance.new("Attachment")
	local NeckAttachment = Instance.new("Attachment")
	local WaistCenterAttachment = Instance.new("Attachment")
	local WaistFrontAttachment = Instance.new("Attachment")
	local WaistBackAttachment = Instance.new("Attachment")

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

	PreviewBodyR6.Name = " "
	PreviewBodyR6.PrimaryPart = Head

	Head.Name = "Head"
	Head.Color = Color3.new(0.5,0.5,0.5) -- = Color3.new(0.960784, 0.803922, 0.188235)
	Head.Size = Vector3.new(2, 1, 1)
	Head.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright yellow")
	Head.Locked = true
	Head.TopSurface = Enum.SurfaceType.Smooth
	Head.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright yellow")
	Head.FormFactor = Enum.FormFactor.Symmetric
	Head.formFactor = Enum.FormFactor.Symmetric

	HeadMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
	face.Name = "face"
	face.Texture = "http://www.roblox.com/asset/?id=7074972"

	Torso.Name = "Torso"
	Torso.Color = Color3.new(0.5,0.5,0.5) -- = Color3.new(0.227451, 0.490196, 0.0823529)
	Torso.Size = Vector3.new(2, 2, 1)
	Torso.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Camo")
	Torso.LeftParamA = 0
	Torso.LeftParamB = 0
	Torso.LeftSurface = Enum.SurfaceType.Weld
	Torso.Locked = true
	Torso.RightParamA = 0
	Torso.RightParamB = 0
	Torso.RightSurface = Enum.SurfaceType.Weld
	Torso.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Camo")
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
	LeftArm.Color = Color3.new(0.5,0.5,0.5) -- = Color3.new(0.960784, 0.803922, 0.188235)
	LeftArm.Size = Vector3.new(1, 2, 1)
	LeftArm.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright yellow")
	LeftArm.CanCollide = false
	LeftArm.Locked = true
	LeftArm.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright yellow")
	LeftArm.FormFactor = Enum.FormFactor.Symmetric
	LeftArm.formFactor = Enum.FormFactor.Symmetric

	RightArm.Name = "Right Arm"
	RightArm.Color = Color3.new(0.5,0.5,0.5) -- = Color3.new(0.960784, 0.803922, 0.188235)
	RightArm.Size = Vector3.new(1, 2, 1)
	RightArm.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright yellow")
	RightArm.CanCollide = false
	RightArm.Locked = true
	RightArm.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright yellow")
	RightArm.FormFactor = Enum.FormFactor.Symmetric
	RightArm.formFactor = Enum.FormFactor.Symmetric

	LeftLeg.Name = "Left Leg"
	LeftLeg.Color = Color3.new(0.5,0.5,0.5) -- = Color3.new(0.0509804, 0.411765, 0.67451)
	LeftLeg.Size = Vector3.new(1, 2, 1)
	LeftLeg.BottomSurface = Enum.SurfaceType.Smooth
	LeftLeg.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright blue")
	LeftLeg.CanCollide = false
	LeftLeg.Locked = true
	LeftLeg.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright blue")
	LeftLeg.FormFactor = Enum.FormFactor.Symmetric
	LeftLeg.formFactor = Enum.FormFactor.Symmetric

	RightLeg.Name = "Right Leg"
	RightLeg.Color = Color3.new(0.5,0.5,0.5) -- = Color3.new(0.0509804, 0.411765, 0.67451)
	RightLeg.Size = Vector3.new(1, 2, 1)
	RightLeg.BottomSurface = Enum.SurfaceType.Smooth
	RightLeg.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright blue")
	RightLeg.CanCollide = false
	RightLeg.Locked = true
	RightLeg.BrickColor = BrickColor.new("Grey") -- = BrickColor.new("Bright blue")
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
	RootPart.Anchored = true

	RootJoint.Name = "RootJoint"
	RootJoint.MaxVelocity = 0.10000000149011612
	RootJoint.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
	RootJoint.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
	RootJoint.Part0 = RootPart
	RootJoint.Part1 = Torso

	Animate.Name = "Animate"

	Idle.Name = "idle"

	FaceFrontAttachment.Position = Vector3.new(0,0,-0.6)
	FaceFrontAttachment.Name = "FaceFrontAttachment"
	HairAttachment.Position = Vector3.new(0,0.6,0)
	HairAttachment.Name = "HairAttachment"
	HatAttachment.Position = Vector3.new(0,0.6,0)
	HatAttachment.Name = "HatAttachment"
	LeftShoulderAttachment.Position = Vector3.new(0,1,0)
	LeftShoulderAttachment.Name = "LeftShoulderAttachment"
	RightShoulderAttachment.Position = Vector3.new(0,1,0)
	RightShoulderAttachment.Name = "RightShoulderAttachment"
	BodyBackAttachment.Position = Vector3.new(0,0,0.5)
	BodyBackAttachment.Name = "BodyBackAttachment"
	BodyFrontAttachment.Position = Vector3.new(0,0,-0.5)
	BodyFrontAttachment.Name = "BodyFrontAttachment"
	LeftCollarAttachment.Position = Vector3.new(-1,1,0)
	LeftCollarAttachment.Name = "LeftCollarAttachment"
	NeckAttachment.Position = Vector3.new(0,1,0)
	NeckAttachment.Name = "NeckAttachment"
	RightCollarAttachment.Position = Vector3.new(1,1,0)
	RightCollarAttachment.Name = "RightCollarAttachment"
	WaistBackAttachment.Position = Vector3.new(0,-1,0.5)
	WaistBackAttachment.Name = "WaistBackAttachment"
	WaistCenterAttachment.Position = Vector3.new(0,-1,0)
	WaistCenterAttachment.Name = "WaistCenterAttachment"
	WaistFrontAttachment.Position = Vector3.new(0,-1,-0.5)
	WaistFrontAttachment.Name = "WaistFrontAttachment"

	Animation31.Name = "Animation1"
	Animation31.AnimationId = "http://www.roblox.com/asset/?id=180435571"
	NumberValue32.Name = "Weight"
	NumberValue32.Value = 9

	Animation33.Name = "Animation2"
	Animation33.AnimationId = "http://www.roblox.com/asset/?id=180435792"
	NumberValue34.Name = "Weight"
	NumberValue34.Value = 1

	StringValue35.Name = "walk"
	Animation36.Name = "WalkAnim"
	Animation36.AnimationId = "http://www.roblox.com/asset/?id=180426354"

	StringValue37.Name = "run"
	Animation38.Name = "RunAnim"
	Animation38.AnimationId = "http://www.roblox.com/asset/?id=180426354"

	StringValue39.Name = "jump"
	Animation40.Name = "JumpAnim"
	Animation40.AnimationId = "http://www.roblox.com/asset/?id=125750702"

	StringValue41.Name = "climb"
	Animation42.Name = "ClimbAnim"
	Animation42.AnimationId = "http://www.roblox.com/asset/?id=180436334"

	StringValue43.Name = "toolnone"
	Animation44.Name = "ToolNoneAnim"
	Animation44.AnimationId = "http://www.roblox.com/asset/?id=182393478"

	StringValue45.Name = "fall"
	Animation46.Name = "FallAnim"
	Animation46.AnimationId = "http://www.roblox.com/asset/?id=180436148"

	StringValue47.Name = "sit"
	Animation48.Name = "SitAnim"
	Animation48.AnimationId = "http://www.roblox.com/asset/?id=178130996"
	NumberValue49.Name = "ScaleDampeningPercent"
	NumberValue49.Value = 0.4000000059604645

	BodyColors50.HeadColor = BrickColor.new("Grey")
	BodyColors50.HeadColor3 = Color3.new(0.5,0.5,0.5)
	BodyColors50.LeftArmColor = BrickColor.new("Grey")
	BodyColors50.LeftArmColor3 = Color3.new(0.5,0.5,0.5)
	BodyColors50.LeftLegColor3 = Color3.new(0.5,0.5,0.5)
	BodyColors50.RightArmColor = BrickColor.new("Grey")
	BodyColors50.RightArmColor3 = Color3.new(0.5,0.5,0.5)
	BodyColors50.RightLegColor3 = Color3.new(0.5,0.5,0.5)
	BodyColors50.TorsoColor = BrickColor.new("Grey")
	BodyColors50.TorsoColor3 = Color3.new(0.5,0.5,0.5)

	RootPart.Parent = PreviewBodyR6
	Head.Parent = PreviewBodyR6
	Torso.Parent = PreviewBodyR6
	LeftArm.Parent = PreviewBodyR6
	RightArm.Parent = PreviewBodyR6
	LeftLeg.Parent = PreviewBodyR6
	RightLeg.Parent = PreviewBodyR6

	HeadMesh.Parent = Head
	face.Parent = Head

	Neck.Parent = Torso
	RootJoint.Parent = RootPart
	LeftShoulder.Parent = Torso
	RightShoulder.Parent = Torso
	LeftHip.Parent = Torso
	RightHip.Parent = Torso

	Animate.Parent = PreviewBodyR6
	Idle.Parent = Animate
	Animation31.Parent = Idle
	NumberValue32.Parent = Animation31
	Animation33.Parent = Idle
	NumberValue34.Parent = Animation33
	StringValue35.Parent = Animate
	Animation36.Parent = StringValue35
	StringValue37.Parent = Animate
	Animation38.Parent = StringValue37
	StringValue39.Parent = Animate
	Animation40.Parent = StringValue39
	StringValue41.Parent = Animate
	Animation42.Parent = StringValue41
	StringValue43.Parent = Animate
	Animation44.Parent = StringValue43
	StringValue45.Parent = Animate
	Animation46.Parent = StringValue45
	StringValue47.Parent = Animate
	Animation48.Parent = StringValue47
	NumberValue49.Parent = Animate

	FaceCenterAttachment.Parent = Head
	FaceFrontAttachment.Parent = Head
	HairAttachment.Parent = Head
	HatAttachment.Parent = Head
	LeftShoulderAttachment.Parent = LeftArm
	RightShoulderAttachment.Parent = RightArm
	BodyBackAttachment.Parent = Torso
	BodyFrontAttachment.Parent = Torso
	LeftCollarAttachment.Parent = Torso
	RightCollarAttachment.Parent = Torso
	NeckAttachment.Parent = Torso
	WaistCenterAttachment.Parent = Torso
	WaistFrontAttachment.Parent = Torso
	WaistBackAttachment.Parent = Torso

	BodyColors50.Parent = PreviewBodyR6

	Humanoid.Parent = PreviewBodyR6

	PreviewBodyR6.Parent = workspace
	fwait()
	PreviewBodyR6.Parent = Viewport
end

do -- [[ Make Preview R15 PreviewBodyR15 ]]
	PreviewBodyR15 = Instance.new("Model")

	local HumanoidRootPart = Instance.new("Part")

	local Head = Instance.new("Part")
	local HeadMesh = Instance.new("SpecialMesh")
	local face = Instance.new("Decal")

	local LeftHand = Instance.new("Part")
	local LeftLowerArm = Instance.new("Part")
	local LeftUpperArm = Instance.new("Part")
	local RightLowerArm = Instance.new("Part")
	local RightUpperArm = Instance.new("Part")
	local RightHand = Instance.new("Part")
	local UpperTorso = Instance.new("Part")
	local LeftFoot = Instance.new("Part")
	local LeftLowerLeg = Instance.new("Part")
	local LeftUpperLeg = Instance.new("Part")
	local RightFoot = Instance.new("Part")
	local RightLowerLeg = Instance.new("Part")
	local RightUpperLeg = Instance.new("Part")
	local LowerTorso = Instance.new("Part")
	local Root = Instance.new("Motor6D")
	local Neck = Instance.new("Motor6D")

	local LeftWrist = Instance.new("Motor6D")
	local LeftElbow = Instance.new("Motor6D")
	local LeftShoulder = Instance.new("Motor6D")

	local RightWrist = Instance.new("Motor6D")
	local RightElbow = Instance.new("Motor6D")
	local RightShoulder = Instance.new("Motor6D")
	local Waist = Instance.new("Motor6D")
	local LeftAnkle = Instance.new("Motor6D")
	local LeftKnee = Instance.new("Motor6D")
	local LeftHip = Instance.new("Motor6D")
	local RightAnkle = Instance.new("Motor6D")
	local RightKnee = Instance.new("Motor6D")
	local RightHip = Instance.new("Motor6D")

	local BodyColors = Instance.new("BodyColors")
	local Humanoid = Instance.new("Humanoid")

	local function CreateMesh(Part,ID)
		local Mesh = Instance.new("SpecialMesh")
		Mesh.MeshType = Enum.MeshType.FileMesh
		Mesh.MeshId = ID
		Mesh.Parent = Part
	end

	do -- [[ Properties ]]
		PreviewBodyR15.Name = " "
		PreviewBodyR15.PrimaryPart = HumanoidRootPart

		HumanoidRootPart.Name = "HumanoidRootPart"
		HumanoidRootPart.CFrame = CFrame.new(43.0321655, 3, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		HumanoidRootPart.Position = Vector3.new(43.03216552734375, 3, -2.9007568359375)
		HumanoidRootPart.Transparency = 1
		HumanoidRootPart.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		HumanoidRootPart.Size = Vector3.new(2, 2, 1)
		HumanoidRootPart.Anchored = true

		LeftHand.Name = "LeftHand"
		LeftHand.CFrame = CFrame.new(41.5321655, 2.1500001, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LeftHand.Position = Vector3.new(41.53216552734375, 2.1500000953674316, -2.9007568359375)
		LeftHand.Color = Color3.new(0.992157, 0.917647, 0.552941)
		LeftHand.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LeftHand.Size = Vector3.new(0.9999997615814209, 0.29999998211860657, 0.9999998807907104)
		LeftHand.BrickColor = BrickColor.new("Cool yellow")
		LeftHand.CanCollide = false
		LeftHand.brickColor = BrickColor.new("Cool yellow")
		CreateMesh(LeftHand,"http://www.roblox.com/asset/?id=532219986")

		LeftWrist.Name = "LeftWrist"
		LeftWrist.C0 = CFrame.new(0.000478506088, -0.549999952, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftWrist.C1 = CFrame.new(0.000478863716, 0.149999991, 5.96046448e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftWrist.Part0 = LeftLowerArm
		LeftWrist.Part1 = LeftHand

		LeftLowerArm.Name = "LeftLowerArm"
		LeftLowerArm.CFrame = CFrame.new(41.5321655, 2.85000014, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LeftLowerArm.Position = Vector3.new(41.53216552734375, 2.8500001430511475, -2.9007568359375)
		LeftLowerArm.Color = Color3.new(0.992157, 0.917647, 0.552941)
		LeftLowerArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LeftLowerArm.Size = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
		LeftLowerArm.BrickColor = BrickColor.new("Cool yellow")
		LeftLowerArm.CanCollide = false
		LeftLowerArm.brickColor = BrickColor.new("Cool yellow")
		CreateMesh(LeftLowerArm,"http://www.roblox.com/asset/?id=532219991")

		LeftElbow.Name = "LeftElbow"
		LeftElbow.C0 = CFrame.new(0.000479102135, -0.200000167, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftElbow.C1 = CFrame.new(0.000478506088, 0.25000003, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftElbow.Part0 = LeftUpperArm
		LeftElbow.Part1 = LeftLowerArm

		LeftUpperArm.Name = "LeftUpperArm"
		LeftUpperArm.CFrame = CFrame.new(41.5321655, 3.30000043, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LeftUpperArm.Position = Vector3.new(41.53216552734375, 3.3000004291534424, -2.9007568359375)
		LeftUpperArm.Color = Color3.new(0.992157, 0.917647, 0.552941)
		LeftUpperArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LeftUpperArm.Size = Vector3.new(0.9999997615814209, 1.4000003337860107, 0.9999999403953552)
		LeftUpperArm.BrickColor = BrickColor.new("Cool yellow")
		LeftUpperArm.CanCollide = false
		LeftUpperArm.brickColor = BrickColor.new("Cool yellow")
		CreateMesh(LeftUpperArm,"http://www.roblox.com/asset/?id=532219996")

		LeftShoulder.Name = "LeftShoulder"
		LeftShoulder.C0 = CFrame.new(-1.24989128, 0.549999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftShoulder.C1 = CFrame.new(0.250109196, 0.449999809, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftShoulder.Part0 = UpperTorso
		LeftShoulder.Part1 = LeftUpperArm

		RightHand.Name = "RightHand"
		RightHand.CFrame = CFrame.new(44.5321655, 2.1500001, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		RightHand.Position = Vector3.new(44.53216552734375, 2.1500000953674316, -2.9007568359375)
		RightHand.Color = Color3.new(0.992157, 0.917647, 0.552941)
		RightHand.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		RightHand.Size = Vector3.new(0.9999998807907104, 0.29999998211860657, 0.9999998807907104)
		RightHand.BrickColor = BrickColor.new("Cool yellow")
		RightHand.CanCollide = false
		RightHand.brickColor = BrickColor.new("Cool yellow")
		CreateMesh(RightHand,"http://www.roblox.com/asset/?id=532219997")

		RightWrist.Name = "RightWrist"
		RightWrist.C0 = CFrame.new(1.1920929e-07, -0.549999952, -6.86244753e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightWrist.C1 = CFrame.new(3.57627869e-07, 0.149999991, 5.96046448e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightWrist.Part0 = RightLowerArm
		RightWrist.Part1 = RightHand

		RightLowerArm.Name = "RightLowerArm"
		RightLowerArm.CFrame = CFrame.new(44.5321655, 2.85000014, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		RightLowerArm.Position = Vector3.new(44.53216552734375, 2.8500001430511475, -2.9007568359375)
		RightLowerArm.Color = Color3.new(0.992157, 0.917647, 0.552941)
		RightLowerArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		RightLowerArm.Size = Vector3.new(0.9999997615814209, 1.200000286102295, 1)
		RightLowerArm.BrickColor = BrickColor.new("Cool yellow")
		RightLowerArm.CanCollide = false
		RightLowerArm.brickColor = BrickColor.new("Cool yellow")
		CreateMesh(RightLowerArm,"http://www.roblox.com/asset/?id=532219999")

		RightElbow.Name = "RightElbow"
		RightElbow.C0 = CFrame.new(-5.96046448e-07, -0.200000167, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightElbow.C1 = CFrame.new(1.1920929e-07, 0.25000003, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightElbow.Part0 = RightUpperArm
		RightElbow.Part1 = RightLowerArm

		RightUpperArm.Name = "RightUpperArm"
		RightUpperArm.CFrame = CFrame.new(44.5321655, 3.30000043, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		RightUpperArm.Position = Vector3.new(44.53216552734375, 3.3000004291534424, -2.9007568359375)
		RightUpperArm.Color = Color3.new(0.992157, 0.917647, 0.552941)
		RightUpperArm.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		RightUpperArm.Size = Vector3.new(0.9999996423721313, 1.4000003337860107, 0.9999999403953552)
		RightUpperArm.BrickColor = BrickColor.new("Cool yellow")
		RightUpperArm.CanCollide = false
		RightUpperArm.brickColor = BrickColor.new("Cool yellow")
		CreateMesh(RightUpperArm,"http://www.roblox.com/asset/?id=532219996")

		RightShoulder.Name = "RightShoulder"
		RightShoulder.C0 = CFrame.new(1.24998045, 0.549999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightShoulder.C1 = CFrame.new(-0.250020266, 0.449999809, 8.94069672e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightShoulder.Part0 = UpperTorso
		RightShoulder.Part1 = RightUpperArm

		UpperTorso.Name = "UpperTorso"
		UpperTorso.CFrame = CFrame.new(43.0321655, 3.20000029, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		UpperTorso.Position = Vector3.new(43.03216552734375, 3.200000286102295, -2.9007568359375)
		UpperTorso.Color = Color3.new(0.156863, 0.498039, 0.278431)
		UpperTorso.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		UpperTorso.Size = Vector3.new(2, 1.6000001430511475, 1.0000003576278687)
		UpperTorso.BrickColor = BrickColor.new("Dark green")
		UpperTorso.brickColor = BrickColor.new("Dark green")
		CreateMesh(UpperTorso,"http://www.roblox.com/asset/?id=532220007")

		Waist.Name = "Waist"
		Waist.C0 = CFrame.new(-1.1920929e-07, 0.550000072, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Waist.C1 = CFrame.new(-5.96046448e-08, -0.450000018, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Waist.Part0 = LowerTorso
		Waist.Part1 = UpperTorso

		LeftFoot.Name = "LeftFoot"
		LeftFoot.CFrame = CFrame.new(42.5321655, 0.150000334, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LeftFoot.Position = Vector3.new(42.53216552734375, 0.15000033378601074, -2.9007568359375)
		LeftFoot.Color = Color3.new(0.0509804, 0.411765, 0.67451)
		LeftFoot.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LeftFoot.Size = Vector3.new(1, 0.3000001907348633, 1)
		LeftFoot.BrickColor = BrickColor.new("Bright blue")
		LeftFoot.CanCollide = false
		LeftFoot.brickColor = BrickColor.new("Bright blue")
		CreateMesh(LeftFoot,"http://www.roblox.com/asset/?id=532220012")

		LeftAnkle.Name = "LeftAnkle"
		LeftAnkle.C0 = CFrame.new(-1.78813934e-07, -0.749997616, 6.29340548e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftAnkle.C1 = CFrame.new(-2.38418579e-07, 0.0500025749, 8.08154482e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftAnkle.Part0 = LeftLowerLeg
		LeftAnkle.Part1 = LeftFoot

		LeftLowerLeg.Name = "LeftLowerLeg"
		LeftLowerLeg.CFrame = CFrame.new(42.5321655, 0.950000525, -2.9007566, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LeftLowerLeg.Position = Vector3.new(42.53216552734375, 0.950000524520874, -2.900756597518921)
		LeftLowerLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
		LeftLowerLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LeftLowerLeg.Size = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
		LeftLowerLeg.BrickColor = BrickColor.new("Bright blue")
		LeftLowerLeg.CanCollide = false
		LeftLowerLeg.brickColor = BrickColor.new("Bright blue")
		CreateMesh(LeftLowerLeg,"http://www.roblox.com/asset/?id=532220017")

		LeftKnee.Name = "LeftKnee"
		LeftKnee.C0 = CFrame.new(5.96046448e-08, -0.299999952, -1.63912773e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftKnee.C1 = CFrame.new(-0, 0.249999642, -1.78813934e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftKnee.Part0 = LeftUpperLeg
		LeftKnee.Part1 = LeftLowerLeg

		LeftUpperLeg.Name = "LeftUpperLeg"
		LeftUpperLeg.CFrame = CFrame.new(42.5321655, 1.50000012, -2.9007566, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LeftUpperLeg.Position = Vector3.new(42.53216552734375, 1.5000001192092896, -2.900756597518921)
		LeftUpperLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
		LeftUpperLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LeftUpperLeg.Size = Vector3.new(1.0000003576278687, 1.499999761581421, 0.9999998807907104)
		LeftUpperLeg.BrickColor = BrickColor.new("Bright blue")
		LeftUpperLeg.CanCollide = false
		LeftUpperLeg.brickColor = BrickColor.new("Bright blue")
		CreateMesh(LeftUpperLeg,"http://www.roblox.com/asset/?id=532220018")

		LeftHip.Name = "LeftHip"
		LeftHip.C0 = CFrame.new(-0.500000119, -0.199999958, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftHip.C1 = CFrame.new(5.96046448e-08, 0.5, -1.63912773e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		LeftHip.Part0 = LowerTorso
		LeftHip.Part1 = LeftUpperLeg

		RightFoot.Name = "RightFoot"
		RightFoot.CFrame = CFrame.new(43.5321655, 0.150000334, -2.90075707, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		RightFoot.Position = Vector3.new(43.53216552734375, 0.15000033378601074, -2.900757074356079)
		RightFoot.Color = Color3.new(0.0509804, 0.411765, 0.67451)
		RightFoot.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		RightFoot.Size = Vector3.new(0.9999999403953552, 0.3000001907348633, 1)
		RightFoot.BrickColor = BrickColor.new("Bright blue")
		RightFoot.CanCollide = false
		RightFoot.brickColor = BrickColor.new("Bright blue")
		CreateMesh(RightFoot,"http://www.roblox.com/asset/?id=532220020")

		RightAnkle.Name = "RightAnkle"
		RightAnkle.C0 = CFrame.new(-0, -0.750000477, 9.82746205e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightAnkle.C1 = CFrame.new(-0, 0.0499997139, 9.84534345e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightAnkle.Part0 = RightLowerLeg
		RightAnkle.Part1 = RightFoot

		RightLowerLeg.Name = "RightLowerLeg"
		RightLowerLeg.CFrame = CFrame.new(43.5321655, 0.950000525, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		RightLowerLeg.Position = Vector3.new(43.53216552734375, 0.950000524520874, -2.9007568359375)
		RightLowerLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
		RightLowerLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		RightLowerLeg.Size = Vector3.new(0.9999999403953552, 1.5000003576278687, 1.0000001192092896)
		RightLowerLeg.BrickColor = BrickColor.new("Bright blue")
		RightLowerLeg.CanCollide = false
		RightLowerLeg.brickColor = BrickColor.new("Bright blue")
		CreateMesh(RightLowerLeg,"http://www.roblox.com/asset/?id=532220027")

		RightKnee.Name = "RightKnee"
		RightKnee.C0 = CFrame.new(-0, -0.299999952, 4.36005103e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightKnee.C1 = CFrame.new(-0, 0.249999642, 4.35260044e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightKnee.Part0 = RightUpperLeg
		RightKnee.Part1 = RightLowerLeg

		RightUpperLeg.Name = "RightUpperLeg"
		RightUpperLeg.CFrame = CFrame.new(43.5321655, 1.50000012, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		RightUpperLeg.Position = Vector3.new(43.53216552734375, 1.5000001192092896, -2.9007568359375)
		RightUpperLeg.Color = Color3.new(0.0509804, 0.411765, 0.67451)
		RightUpperLeg.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		RightUpperLeg.Size = Vector3.new(1.0000004768371582, 1.499999761581421, 0.9999998807907104)
		RightUpperLeg.BrickColor = BrickColor.new("Bright blue")
		RightUpperLeg.CanCollide = false
		RightUpperLeg.brickColor = BrickColor.new("Bright blue")
		CreateMesh(RightUpperLeg,"http://www.roblox.com/asset/?id=532220031")

		RightHip.Name = "RightHip"
		RightHip.C0 = CFrame.new(0.499999881, -0.199999958, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightHip.C1 = CFrame.new(-0, 0.5, -1.04308128e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		RightHip.Part0 = LowerTorso
		RightHip.Part1 = RightUpperLeg

		LowerTorso.Name = "LowerTorso"
		LowerTorso.CFrame = CFrame.new(43.0321655, 2.20000005, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		LowerTorso.Position = Vector3.new(43.03216552734375, 2.200000047683716, -2.9007568359375)
		LowerTorso.Color = Color3.new(0.156863, 0.498039, 0.278431)
		LowerTorso.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		LowerTorso.Size = Vector3.new(1.999999761581421, 0.3999999761581421, 1.0000001192092896)
		LowerTorso.BrickColor = BrickColor.new("Dark green")
		LowerTorso.brickColor = BrickColor.new("Dark green")
		CreateMesh(LowerTorso,"http://www.roblox.com/asset/?id=532220036")

		Root.Name = "Root"
		Root.C0 = CFrame.new(-0, -0.649999976, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Root.C1 = CFrame.new(-1.1920929e-07, 0.150000036, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Root.Part0 =HumanoidRootPart
		Root.Part1 = LowerTorso

		Humanoid.HipHeight = 2
		Humanoid.LeftLeg = LeftUpperLeg
		Humanoid.RigType = Enum.HumanoidRigType.R15
		Humanoid.RightLeg = RightUpperLeg
		Humanoid.Torso =HumanoidRootPart

		Head.Name = "Head"
		Head.CFrame = CFrame.new(43.0321655, 4.5, -2.90075684, 1, 6.83440315e-31, 0, 6.83440315e-31, 1, 0, 0, 0, 1)
		Head.Position = Vector3.new(43.03216552734375, 4.5, -2.9007568359375)
		Head.Color = Color3.new(0.992157, 0.917647, 0.552941)
		Head.Velocity = Vector3.new(-1.401298464324817e-45, 0, 1.401298464324817e-45)
		Head.Size = Vector3.new(2, 1, 1)
		Head.BottomSurface = Enum.SurfaceType.Smooth
		Head.BrickColor = BrickColor.new("Cool yellow")
		Head.TopSurface = Enum.SurfaceType.Smooth
		Head.brickColor = BrickColor.new("Cool yellow")

		HeadMesh.Scale = Vector3.new(1.25, 1.25, 1.25)

		Neck.Name = "Neck"
		Neck.C0 = CFrame.new(-5.96046448e-08, 0.799999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Neck.C1 = CFrame.new(0, -0.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		Neck.Part0 = UpperTorso
		Neck.Part1 = Head

		face.Name = "face"
		face.Texture = "rbxassetid://7074972"

		BodyColors.HeadColor = BrickColor.new("Grey")
		BodyColors.HeadColor3 = Color3.new(0.631373, 0.647059, 0.635294)
		BodyColors.LeftArmColor = BrickColor.new("Grey")
		BodyColors.LeftArmColor3 = Color3.new(0.631373, 0.647059, 0.635294)
		BodyColors.LeftLegColor = BrickColor.new("Grey")
		BodyColors.LeftLegColor3 = Color3.new(0.631373, 0.647059, 0.635294)
		BodyColors.RightArmColor = BrickColor.new("Grey")
		BodyColors.RightArmColor3 = Color3.new(0.631373, 0.647059, 0.635294)
		BodyColors.RightLegColor = BrickColor.new("Grey")
		BodyColors.RightLegColor3 = Color3.new(0.631373, 0.647059, 0.635294)
		BodyColors.TorsoColor = BrickColor.new("Grey")
		BodyColors.TorsoColor3 = Color3.new(0.631373, 0.647059, 0.635294)
	end

	do -- [[ Parents ]]
		HeadMesh.Parent = Head
		face.Parent = Head

		Head.Parent = PreviewBodyR15
		HumanoidRootPart.Parent = PreviewBodyR15
		UpperTorso.Parent = PreviewBodyR15
		LowerTorso.Parent = PreviewBodyR15
		LeftUpperArm.Parent = PreviewBodyR15
		LeftLowerArm.Parent = PreviewBodyR15
		LeftHand.Parent = PreviewBodyR15
		RightUpperArm.Parent = PreviewBodyR15
		RightLowerArm.Parent = PreviewBodyR15
		RightHand.Parent = PreviewBodyR15
		LeftUpperLeg.Parent = PreviewBodyR15
		LeftLowerLeg.Parent = PreviewBodyR15
		LeftFoot.Parent = PreviewBodyR15
		RightUpperLeg.Parent = PreviewBodyR15
		RightLowerLeg.Parent = PreviewBodyR15
		RightFoot.Parent = PreviewBodyR15

		Neck.Parent = Head
		Root.Parent = LowerTorso
		Waist.Parent = UpperTorso
		LeftShoulder.Parent = LeftUpperArm
		LeftElbow.Parent = LeftLowerArm
		LeftWrist.Parent = LeftHand
		RightShoulder.Parent = RightUpperArm
		RightElbow.Parent = RightLowerArm
		RightWrist.Parent = RightHand
		LeftHip.Parent = LeftUpperLeg
		LeftKnee.Parent = LeftLowerLeg
		LeftAnkle.Parent = LeftFoot
		RightHip.Parent = RightUpperLeg
		RightKnee.Parent = RightLowerLeg
		RightAnkle.Parent = RightFoot

		Humanoid.Parent = PreviewBodyR15
		BodyColors.Parent = PreviewBodyR15
		
		PreviewBodyR15.Parent = Viewport
	end
	PreviewBodyR15:SetPrimaryPartCFrame(CFrame.new())
end

local function ChangePreview(Char)
	Animated = nil
	if Char:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then
		for i,v in ipairs(PreviewBodyR6:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		for i,v in ipairs(PreviewBodyR15:GetChildren()) do
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
				v.Transparency = 0
			end
		end
		PreviewBodyR6.Head.face.Transparency = 1
		PreviewBodyR15.Head.face.Transparency = 0
		SelectedCamera = PreviewBodyR15
		for i,v in ipairs(Scroll:GetChildren()) do
			if v.Name == "R6" then
				v.Visible = false
			elseif v.Name == "R15" then
				v.Visible = true
			end
		end
	else
		for i,v in ipairs(PreviewBodyR15:GetChildren()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		for i,v in ipairs(PreviewBodyR6:GetChildren()) do
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
				v.Transparency = 0
			end
		end
		PreviewBodyR6.Head.face.Transparency = 0
		PreviewBodyR15.Head.face.Transparency = 1
		SelectedCamera = PreviewBodyR15
		for i,v in ipairs(Scroll:GetChildren()) do
			if v.Name == "R6" then
				v.Visible = true
			elseif v.Name == "R15" then
				v.Visible = false
			end
		end
	end
end

local function Animate(Character)
	--// AnimZ, by ProductionTakeOne#3999

	local wait = fwait or loadstring(game:HttpGet("https://gist.githubusercontent.com/CenteredSniper/fe5cbdbc396630374041f0c2d156a747/raw/5491a28fd72ed7e11c9fa3f9141df033df3ed5a9/fastwait.lua",true))()

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

	local Player = game:GetService("Players"):FindFirstChild(Character.Name) or nil
	local Character = Character
	local Humanoid = Character.Humanoid
	
	local function Motor(name)
		return Character:FindFirstChild(name,true)
	end

	local Sound = Create("Sound",{["Volume"] = 1,["RollOffMaxDistance"] = 100,["Looped"] = true,["Parent"] = Character:WaitForChild("HumanoidRootPart")})

	local Animations,Connections,Dancing = {},{},nil
	local Joints
	
	if Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
		Joints = {
			['Torso'] = Motor("RootJoint");
			['Left Arm'] = Motor("Left Shoulder");
			['Right Arm'] = Motor("Right Shoulder");
			['Left Leg'] = Motor("Left Hip");
			['Right Leg'] = Motor("Right Hip");
			['Head'] = Motor("Neck");
		}
	else
		

		Joints = {
			["LowerTorso"] = Motor("Root"),
			["UpperTorso"] = Motor("Waist"),
			["RightUpperArm"] = Motor("RightShoulder"),
			["RightLowerArm"] = Motor("RightElbow"),
			["RightHand"] = Motor("RightWaist"),
			["RightUpperLeg"] = Motor("RightHip"),
			["RightLowerLeg"] = Motor("RightKnee"),
			["RightFoot"] = Motor("RightAnkle"),
			["LeftUpperArm"] = Motor("LeftShoulder"),
			["LeftLowerArm"] = Motor("LeftElbow"),
			["LeftHand"] = Motor("LeftWaist"),
			["LeftUpperLeg"] = Motor("LeftHip"),
			["LeftLowerLeg"] = Motor("LeftKnee"),
			["LeftFoot"] = Motor("LeftAnkle"),
			["Head"] = Motor("Neck"),
		}
	end
	

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
		local Sequence = readfile(tostring(Asset) .. ".Anim") or Encode(game:GetObjects('rbxassetid://'..tostring(Asset))[1],tostring(Asset))
		Sequence = HTTP:JSONDecode(Sequence)
		wait(0/1)
		if Global.LoopAnims then Sequence.Loop = true end

		--local Keyframes = Sequence:GetKeyframes()
		local Keyframes = Sequence.Keyframes

		local Animation = {}

		Animation.Ended = true
		Animation.Reset = function()
			Animation.Ended = true
			for i,v in pairs(Joints) do
				if Character:FindFirstChild(i) and v then
					v.Transform = CFrame.new()
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
								task.spawn(function()
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
				wait(0/1)
			end
		end
	end
	
	if Character:FindFirstChild("Animate") then
		Character.Animate.Disabled = true
	end
	for i, track in pairs (Humanoid:GetPlayingAnimationTracks()) do
		track:Stop()
	end
	
	local Anims
	if Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
		Anims = {
			['Idle'] = LoadAnimation(180435571); --5183986020
			['Walk'] = LoadAnimation(6606119539);  --5053650512,180426354,8966021183
			['Run'] = LoadAnimation(180426354); --5053715968
			['Jump'] = LoadAnimation(125750702); --4073859368
			['Fall'] = LoadAnimation(180436148); --3323393688
		}
	else
		Anims = {
			['Idle'] = LoadAnimation(2510197257); --5183986020
			['Walk'] = LoadAnimation(2510198475);  --5053650512,180426354,8966021183
			['Run'] = LoadAnimation(2510198475); --5053715968
			['Jump'] = LoadAnimation(2510197830); --4073859368
			['Fall'] = LoadAnimation(2510195892); --3323393688
		}
	end
	

	wait(0/1)

	Anims['Idle'].Play()

	Anims['Run'] = Humanoid.Running:Connect(function(Speed)
		if not Dancing and Speed > 6 and Anims['Walk'].Ended then
			EndPlaying()
			Sound.SoundId = ""
			Anims['Walk'].Play()
		elseif not Dancing and Speed < 6 and not Anims['Walk'].Ended then
			EndPlaying()
			Sound.SoundId = ""
			Anims['Idle'].Play()
		end
	end)

	Anims['Jumping'] = Humanoid.Jumping:Connect(function(Active)
		if not Dancing and Active and Anims['Jump'].Ended then
			EndPlaying()
			Sound.SoundId = ""
			Anims['Jump'].Play()
		end
	end)
	Anims['FreeFalling'] = Humanoid.FreeFalling:Connect(function(Active)
		if not Dancing and Active and Anims['Jump'].Ended then
			EndPlaying()
			Sound.SoundId = ""
			Anims['Fall'].Play()
		end
	end)

	local RunAnimation = function(AnimationID,SoundID)
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
	
	if Player then
		table.insert(Connections,Humanoid.Died:Connect(function()
			for i,v in pairs(Connections) do
				v:Disconnect()
			end
		end))

		table.insert(Connections,Player.CharacterAdded:Connect(function()
			for i,v in pairs(Connections) do
				v:Disconnect()
			end
		end))
	end

	table.insert(Connections,Anims["Run"])
	table.insert(Connections,Anims["Jumping"])
	table.insert(Connections,Anims["FreeFalling"])
	return RunAnimation
end

local R6Animate = Animate(PreviewBodyR6)
local R15Animate = Animate(PreviewBodyR15) 

ReanimateButton.Activated:Connect(function()
	if not Animated then
		Global.AutoAnimate = false
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua",true))()
	end
end)

local SelectedAnim
for im,v in pairs({FilesR6,FilesR15}) do
	for i,v in pairs(v) do
		task.spawn(function()
			local Tool = ExampleButton:Clone()
			Tool.Text = not v[3] and v[2] == "" and i .. "(NS) " or i
			Tool.Name = im == 2 and "R15" or "R6"
			local Color = isfile(tostring(v[1]) .. ".Anim") and Color3.new(1, 1, 1) or Color3.fromRGB(178, 178, 178)
			Tool.TextColor3 = Color
			Tool.Parent = Scroll
			wait()
			local ToolPlaying = false
			Tool.Activated:Connect(function()
				if ToolPlaying then
					Animated()
					Tool.TextColor3 = Color
					ToolPlaying = false
					SelectedAnim = nil
				else
					if not Animated then
						Animated = Animate(Player.Character)
					end
					local SoundID = v[3] and getsynassetfromurl(v[3],v[1]) or v[2]
					ToolPlaying = true
					SelectedAnim = v[1]
					Tool.TextColor3 = Color3.fromRGB(255, 127, 0)
					Animated(v[1],SoundID)
					repeat wait() until SelectedAnim ~= v[1]
					ToolPlaying = false
					Tool.TextColor3 = Color
				end
			end)
			Tool.MouseButton2Click:Connect(function()
				if Tool.Name == "R6" then
					R6Animate(v[1])
				elseif Tool.Name == "R15" then
					R15Animate(v[1])
				end
			end)
		end)
	end
end

CustomID.FocusLost:Connect(function(enter)
	if enter and Animated then
		Animated(CustomID)
	end
end)

Player.CharacterAdded:Connect(ChangePreview)
ChangePreview(Player.Character or Player.CharacterAdded:Wait())
