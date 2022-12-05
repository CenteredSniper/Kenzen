--[[

notify({
	Text = "hello world",
	Duration = 5
})

]]--

local Global = getgenv and getgenv() or shared

local Notify = Global.ErrorNotify

if not Notify then
	local Debris = game:GetService("Debris")
	local TweenService = game:GetService("TweenService")
	local CoreGui = game:GetService("CoreGui")
	
	local fwait = fwait or task.wait

	Notify = function(Arguments)
		task.defer(function()
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
			fwait(0.6)
			local IconTween = TweenService:Create(ErrorIcon,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation = 0})
			IconTween:Play()
			fwait(0.4)
			fwait(Duration)
			Tween = TweenService:Create(ErrorMessage,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position = UDim2.new(-1, 0, 0, ErrorMessage.AbsolutePosition.Y)})
			Tween:Play()
		end)
	end
	Global.ErrorNotify = Notify
end
return Notify
