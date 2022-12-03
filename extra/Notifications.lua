--[[

notify({
	Text = "hello world",
	Duration = 5
})

]]--

local Global = getgenv and getgenv() or shared

if identifyexecutor and identifyexecutor() == "ScriptWare" then
	getrawmetatable(getfenv(0)).__index = Global
end

task.spawn(function()
	pcall(function()
		if not Global.gethiddengui then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/L8X/gethiddengui/main/src.lua"))()
		end
	end)
end)

local game = game
local task = task
local task_wait = task.wait
local task_spawn = task.spawn
local coroutine = coroutine
local coroutine_create = coroutine.create
local pcall = pcall or ypcall
local Vector2 = Vector2
local Vector2_new = Vector2.new
local Instance = Instance
local Instance_new = Instance.new
local TweenInfo = TweenInfo
local TweenInfo_new = TweenInfo.new
local UDim2 = UDim2
local UDim2_new = UDim2.new
local Color3 = Color3
local Color3_fromRGB = Color3.fromRGB
local Enum = Enum
local EasingStyle = Enum.EasingStyle
local Quad = EasingStyle.Quad
local EasingDirection = Enum.EasingDirection
local In = EasingDirection.In
local Out = EasingDirection.Out
local TextXAlignment = Enum.TextXAlignment
local Left = TextXAlignment.Left
local Font = Enum.Font
local Gotham = Font.Gotham
local ZIndexBehavior = Enum.ZIndexBehavior
local Sibling = ZIndexBehavior.Sibling

local ContentProvider = game:GetService("ContentProvider")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local CoreGui

if gethiddengui then
	CoreGui = gethiddengui()
else
	if gethui then
		CoreGui = gethui()
	else
		CoreGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui") or game:GetService("CoreGui"):FindFirstChildOfClass("ScreenGui") or game:GetService("CoreGui"):FindFirstChildOfClass("Folder")
	end
end

task_spawn(coroutine_create(function()
	pcall(function() 
		ContentProvider:Preload("rbxasset://textures/ui/Emotes/ErrorIcon.png") 
	end)
end))

return function(Arguments)
	task_spawn(coroutine_create(function()
		local Text = Arguments.Text or "lorem ipsum"
		local Duration = Arguments.Duration or 5

		-- Instances:
		
		local SecureContainer = gethui and gethui() or gethiddengui and gethiddengui() or CoreGui:FindFirstChild("RobloxGui") or CoreGui:FindFirstChildOfClass("ScreenGui") or CoreGui:FindFirstChildOfClass("Folder") or CoreGui
		local ScreenGui = Global.NotificationGUI or SecureContainer:FindFirstChild("Error"); if not ScreenGui then
			ScreenGui = Instance.new("ScreenGui"); do 
				Global.NotificationGUI = ScreenGui
				ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				ScreenGui.Name = "Error"
				ScreenGui.Parent = SecureContainer
			end
		end
		local ErrorMessage = Instance_new("Frame")
		local TextSizeConstraint = Instance_new("UISizeConstraint")
		local AsspectRatioConstraint = Instance_new("UIAspectRatioConstraint")
		local ErrorText = Instance_new("TextLabel")
		local TextSizeConstraint_2 = Instance_new("UITextSizeConstraint")
		local SizeConstraint = Instance_new("UISizeConstraint")
		local ErrorIcon = Instance_new("ImageLabel")
		local AsspectRatioConstraint_2 = Instance_new("UIAspectRatioConstraint")

		--Properties:

		local Children = ScreenGui:GetChildren()
		for i, v in next, Children do
			local Tween = TweenService:Create(v,TweenInfo_new(0.5,Quad,Out),{Position = UDim2_new(ErrorMessage.Position.X.Scale, 0, .1, (i*v.AbsoluteSize.Y*1.2))})
			Tween:Play()
		end

		ErrorMessage.Name = "ErrorMessage"
		ErrorMessage.Parent = ScreenGui
		ErrorMessage.BackgroundColor3 = Color3_fromRGB(0, 0, 0)
		ErrorMessage.BackgroundTransparency = 0.300
		ErrorMessage.BorderSizePixel = 0
		ErrorMessage.Position = UDim2_new(-1, 0, .1, 0)
		ErrorMessage.Size = UDim2_new(0.600000024, 0, 0.200000003, 0)

		TextSizeConstraint.Name = "TextSizeConstraint"
		TextSizeConstraint.Parent = ErrorMessage
		TextSizeConstraint.MaxSize = Vector2_new(432, 72)
		TextSizeConstraint.MinSize = Vector2_new(336, 56)

		AsspectRatioConstraint.Name = "AsspectRatioConstraint"
		AsspectRatioConstraint.Parent = ErrorMessage
		AsspectRatioConstraint.AspectRatio = 6.000

		ErrorText.Name = "ErrorText"
		ErrorText.Parent = ErrorMessage
		ErrorText.AnchorPoint = Vector2_new(0, 0.5)
		ErrorText.BackgroundTransparency = 1.000
		ErrorText.Position = UDim2_new(0.200000003, -10, 0.5, 0)
		ErrorText.Size = UDim2_new(0.800000012, 0, 1, 0)
		ErrorText.Font = Gotham
		ErrorText.Text = Text
		ErrorText.TextColor3 = Color3_fromRGB(255, 255, 255)
		ErrorText.TextScaled = true
		ErrorText.TextSize = 36.000
		ErrorText.TextWrapped = true
		ErrorText.TextXAlignment = Left

		TextSizeConstraint_2.Name = "TextSizeConstraint"
		TextSizeConstraint_2.Parent = ErrorText
		TextSizeConstraint_2.MaxTextSize = 36

		SizeConstraint.Name = "SizeConstraint"
		SizeConstraint.Parent = ErrorText
		SizeConstraint.MaxSize = Vector2_new(432, 46)

		ErrorIcon.Name = "ErrorIcon"
		ErrorIcon.Parent = ErrorMessage
		ErrorIcon.AnchorPoint = Vector2_new(0, 0.5)
		ErrorIcon.BackgroundTransparency = 1.000
		ErrorIcon.Position = UDim2_new(0, 10, 0.5, 0)
		ErrorIcon.Size = UDim2_new(0.200000003, -20, 1, -20)
		ErrorIcon.Image = "rbxasset://textures/ui/Emotes/ErrorIcon.png"
		ErrorIcon.Rotation = 180

		AsspectRatioConstraint_2.Name = "AsspectRatioConstraint"
		AsspectRatioConstraint_2.Parent = ErrorIcon

		Debris:AddItem(ErrorMessage, Duration+3)
		local Tween = TweenService:Create(ErrorMessage,TweenInfo_new(1,Quad,Out),{Position = UDim2_new(0, 0, 0, ErrorMessage.AbsolutePosition.Y)})
		Tween:Play()
		task_wait(0.6)
		local IconTween = TweenService:Create(ErrorIcon,TweenInfo_new(1,Quad,Out),{Rotation = 0})
		IconTween:Play()
		task_wait(0.4)
		task_wait(Duration)
		Tween = TweenService:Create(ErrorMessage,TweenInfo_new(1,Quad,In),{Position = UDim2_new(-1, 0, 0, ErrorMessage.AbsolutePosition.Y)})
		Tween:Play()
	end))
end
