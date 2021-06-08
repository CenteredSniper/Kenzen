local screenxD = Instance.new("ScreenGui",game.CoreGui)
screenxD.DisplayOrder = 500
screenxD.ResetOnSpawn = false
screenxD.Name = "🗿"
local drag = Instance.new("Frame",screenxD)
drag.BackgroundColor3 = Color3.fromRGB(114,137,218)
drag.BorderSizePixel = 0
drag.Position = UDim2.new(0.107,0,0.216,0)
drag.Size = UDim2.new(0,256,0,20)
local scroll = Instance.new("ScrollingFrame",drag)
scroll.BackgroundColor3 = Color3.fromRGB(44,47,51)
scroll.BorderSizePixel = 0
scroll.Position = UDim2.new(0,0,1,0)
scroll.Size = UDim2.new(1,0,0,319)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 4
local uilist = Instance.new("UIListLayout",scroll)
uilist.Padding = UDim.new(0,1)

local UIS = game:GetService("UserInputService")
local function dragify(Frame,boool)
	local frametomove = Frame
	local dragToggle,dragInput,dragStart,startPos
	local dragSpeed = 0
	local function updateInput(input)
		local Delta = input.Position - dragStart
		frametomove.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
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
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(drag)

local function createbutton(id)
	local str = string.match(tostring(id) , "%d+")
	local button = Instance.new("TextButton",scroll)
	button.BorderSizePixel = 0
	button.BackgroundColor3 = Color3.fromRGB(35,39,42)
	button.Size = UDim2.new(1,0,0,50)
	button.Text = ""
	local name = Instance.new("TextLabel",button)
	name.BackgroundTransparency = 1
	name.Size = UDim2.new(1,0,0.5,0)
	name.TextSize = 16
	name.Font = Enum.Font.Gotham
	name.TextColor3 = Color3.fromRGB(255,255,255)
	name.TextXAlignment = Enum.TextXAlignment.Left
	local id = name:Clone()
	id.Parent = button
	id.AnchorPoint = Vector2.new(0,1)
	id.Position = UDim2.new(0,0,1,0)
	id.Text = str
	name.Text = game:GetService("MarketplaceService"):GetProductInfo(tonumber(str)).Name
	button.Activated:Connect(function()
		setclipboard(str)
	end)
end

local animationtabl = {}

while wait(0.1) do
	local localPlayer = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
	if localPlayer then
		local a = localPlayer:GetPlayingAnimationTracks()
		for i, track in pairs(a) do
			local pass = true
			for _,v in pairs(animationtabl) do
				if v == track.Animation.AnimationId then
					pass = false
				end
			end
			if pass then
				table.insert(animationtabl,track.Animation.AnimationId)
				createbutton(track.Animation.AnimationId)
			end
		end
	end
end
