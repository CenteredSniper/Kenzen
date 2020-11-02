
--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
ScreenGui0 = Instance.new("ScreenGui")
Frame1 = Instance.new("Frame")
Frame2 = Instance.new("Frame")
ImageButton3 = Instance.new("ImageButton")
LocalScript4 = Instance.new("LocalScript")
ImageButton5 = Instance.new("ImageButton")
LocalScript6 = Instance.new("LocalScript")
ImageButton7 = Instance.new("ImageButton")
LocalScript8 = Instance.new("LocalScript")
ImageButton9 = Instance.new("ImageButton")
LocalScript10 = Instance.new("LocalScript")
ImageButton11 = Instance.new("ImageButton")
LocalScript12 = Instance.new("LocalScript")
NumberValue13 = Instance.new("NumberValue")
NumberValue14 = Instance.new("NumberValue")
Frame15 = Instance.new("Frame")
TextButton16 = Instance.new("TextButton")
LocalScript17 = Instance.new("LocalScript")
Frame18 = Instance.new("Frame")
UIListLayout19 = Instance.new("UIListLayout")
ImageButton20 = Instance.new("ImageButton")
Frame21 = Instance.new("Frame")
Frame22 = Instance.new("Frame")
Frame23 = Instance.new("Frame")
Frame24 = Instance.new("Frame")
Frame25 = Instance.new("Frame")
Frame26 = Instance.new("Frame")
ImageLabel27 = Instance.new("ImageLabel")
LocalScript28 = Instance.new("LocalScript")
ImageLabel29 = Instance.new("ImageLabel")
ImageLabel30 = Instance.new("ImageLabel")
ImageLabel31 = Instance.new("ImageLabel")
ImageButton32 = Instance.new("ImageButton")
Frame33 = Instance.new("Frame")
Frame34 = Instance.new("Frame")
Frame35 = Instance.new("Frame")
Frame36 = Instance.new("Frame")
Frame37 = Instance.new("Frame")
Frame38 = Instance.new("Frame")
TextLabel39 = Instance.new("TextLabel")
LocalScript40 = Instance.new("LocalScript")
ImageLabel41 = Instance.new("ImageLabel")
ImageLabel42 = Instance.new("ImageLabel")
ImageLabel43 = Instance.new("ImageLabel")
ImageButton44 = Instance.new("ImageButton")
Frame45 = Instance.new("Frame")
Frame46 = Instance.new("Frame")
Frame47 = Instance.new("Frame")
Frame48 = Instance.new("Frame")
Frame49 = Instance.new("Frame")
Frame50 = Instance.new("Frame")
ImageLabel51 = Instance.new("ImageLabel")
Frame52 = Instance.new("Frame")
Frame53 = Instance.new("Frame")
Frame54 = Instance.new("Frame")
Frame55 = Instance.new("Frame")
ImageLabel56 = Instance.new("ImageLabel")
Frame57 = Instance.new("Frame")
Frame58 = Instance.new("Frame")
Frame59 = Instance.new("Frame")
Frame60 = Instance.new("Frame")
LocalScript61 = Instance.new("LocalScript")
ImageLabel62 = Instance.new("ImageLabel")
ImageLabel63 = Instance.new("ImageLabel")
ImageLabel64 = Instance.new("ImageLabel")
Frame65 = Instance.new("Frame")
ImageLabel66 = Instance.new("ImageLabel")
TextLabel67 = Instance.new("TextLabel")
Frame68 = Instance.new("Frame")
Frame69 = Instance.new("Frame")
Frame70 = Instance.new("Frame")
ImageLabel71 = Instance.new("ImageLabel")
ImageLabel72 = Instance.new("ImageLabel")
ImageLabel73 = Instance.new("ImageLabel")
ImageLabel74 = Instance.new("ImageLabel")
ImageLabel75 = Instance.new("ImageLabel")
ImageLabel76 = Instance.new("ImageLabel")
ImageLabel77 = Instance.new("ImageLabel")
ImageLabel78 = Instance.new("ImageLabel")
Frame79 = Instance.new("Frame")
ImageLabel80 = Instance.new("ImageLabel")
ImageLabel81 = Instance.new("ImageLabel")
ImageLabel82 = Instance.new("ImageLabel")
ImageLabel83 = Instance.new("ImageLabel")
ImageLabel84 = Instance.new("ImageLabel")
ImageLabel85 = Instance.new("ImageLabel")
ImageLabel86 = Instance.new("ImageLabel")
ImageLabel87 = Instance.new("ImageLabel")
Frame88 = Instance.new("Frame")
ImageLabel89 = Instance.new("ImageLabel")
ImageLabel90 = Instance.new("ImageLabel")
ImageLabel91 = Instance.new("ImageLabel")
ImageLabel92 = Instance.new("ImageLabel")
ImageLabel93 = Instance.new("ImageLabel")
ImageLabel94 = Instance.new("ImageLabel")
ImageLabel95 = Instance.new("ImageLabel")
ImageLabel96 = Instance.new("ImageLabel")
Frame97 = Instance.new("Frame")
Frame98 = Instance.new("Frame")
Frame99 = Instance.new("Frame")
Frame100 = Instance.new("Frame")
Frame101 = Instance.new("Frame")
LocalScript102 = Instance.new("LocalScript")
Frame103 = Instance.new("Frame")
Frame104 = Instance.new("Frame")
ImageLabel105 = Instance.new("ImageLabel")
ImageLabel106 = Instance.new("ImageLabel")
ImageLabel107 = Instance.new("ImageLabel")
ImageLabel108 = Instance.new("ImageLabel")
ImageLabel109 = Instance.new("ImageLabel")
ImageLabel110 = Instance.new("ImageLabel")
ImageLabel111 = Instance.new("ImageLabel")
ImageLabel112 = Instance.new("ImageLabel")
Frame113 = Instance.new("Frame")
ImageLabel114 = Instance.new("ImageLabel")
ImageLabel115 = Instance.new("ImageLabel")
ImageLabel116 = Instance.new("ImageLabel")
ImageLabel117 = Instance.new("ImageLabel")
ImageLabel118 = Instance.new("ImageLabel")
ImageLabel119 = Instance.new("ImageLabel")
ImageLabel120 = Instance.new("ImageLabel")
ImageLabel121 = Instance.new("ImageLabel")
Frame122 = Instance.new("Frame")
ImageLabel123 = Instance.new("ImageLabel")
ImageLabel124 = Instance.new("ImageLabel")
ImageLabel125 = Instance.new("ImageLabel")
ImageLabel126 = Instance.new("ImageLabel")
ImageLabel127 = Instance.new("ImageLabel")
ImageLabel128 = Instance.new("ImageLabel")
ImageLabel129 = Instance.new("ImageLabel")
ImageLabel130 = Instance.new("ImageLabel")
Frame131 = Instance.new("Frame")
ImageLabel132 = Instance.new("ImageLabel")
ImageLabel133 = Instance.new("ImageLabel")
ImageLabel134 = Instance.new("ImageLabel")
ImageLabel135 = Instance.new("ImageLabel")
ImageLabel136 = Instance.new("ImageLabel")
ImageLabel137 = Instance.new("ImageLabel")
ImageLabel138 = Instance.new("ImageLabel")
ImageLabel139 = Instance.new("ImageLabel")
Frame140 = Instance.new("Frame")
ScrollingFrame141 = Instance.new("ScrollingFrame")
UIListLayout142 = Instance.new("UIListLayout")
Frame143 = Instance.new("Frame")
TextButton144 = Instance.new("TextButton")
ImageLabel145 = Instance.new("ImageLabel")
TextBox146 = Instance.new("TextBox")
Frame147 = Instance.new("Frame")
TextButton148 = Instance.new("TextButton")
Frame149 = Instance.new("Frame")
Frame150 = Instance.new("Frame")
Frame151 = Instance.new("Frame")
Frame152 = Instance.new("Frame")
Frame153 = Instance.new("Frame")
Frame154 = Instance.new("Frame")
TextButton155 = Instance.new("TextButton")
Frame156 = Instance.new("Frame")
Frame157 = Instance.new("Frame")
Frame158 = Instance.new("Frame")
Frame159 = Instance.new("Frame")
Frame160 = Instance.new("Frame")
Frame161 = Instance.new("Frame")
TextButton162 = Instance.new("TextButton")
Frame163 = Instance.new("Frame")
Frame164 = Instance.new("Frame")
Frame165 = Instance.new("Frame")
Frame166 = Instance.new("Frame")
Frame167 = Instance.new("Frame")
Frame168 = Instance.new("Frame")
TextButton169 = Instance.new("TextButton")
Frame170 = Instance.new("Frame")
Frame171 = Instance.new("Frame")
Frame172 = Instance.new("Frame")
Frame173 = Instance.new("Frame")
Frame174 = Instance.new("Frame")
LocalScript175 = Instance.new("LocalScript")
TextLabel176 = Instance.new("TextLabel")
TextButton177 = Instance.new("TextButton")
LocalScript178 = Instance.new("LocalScript")
Frame179 = Instance.new("Frame")
Frame180 = Instance.new("Frame")
Frame181 = Instance.new("Frame")
Frame182 = Instance.new("Frame")
Frame183 = Instance.new("Frame")
LocalScript184 = Instance.new("LocalScript")
Frame185 = Instance.new("Frame")
TextLabel186 = Instance.new("TextLabel")
ImageLabel187 = Instance.new("ImageLabel")
Frame188 = Instance.new("Frame")
Frame189 = Instance.new("Frame")
LocalScript190 = Instance.new("LocalScript")
StringValue191 = Instance.new("StringValue")
ModuleScript192 = Instance.new("ModuleScript")
BoolValue193 = Instance.new("BoolValue")
ScreenGui0.Name = "WindowDark"
ScreenGui0.Parent = game.CoreGui
ScreenGui0.AutoLocalize = false
ScreenGui0.Localize = false
ScreenGui0.ResetOnSpawn = false
ScreenGui0.DisplayOrder = 1
Frame1.Name = "Main"
Frame1.Parent = ScreenGui0
Frame1.Position = UDim2.new(0.0308325496, 0, 0.47057873, 0)
Frame1.Size = UDim2.new(0, 360, 0, 250)
Frame1.BackgroundColor = BrickColor.new("Black")
Frame1.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Frame1.BorderColor = BrickColor.new("Dark grey metallic")
Frame1.BorderColor3 = Color3.new(0.333333, 0.333333, 0.333333)
Frame2.Name = "Resize"
Frame2.Parent = Frame1
Frame2.Size = UDim2.new(1, 0, 1, 0)
Frame2.BackgroundColor = BrickColor.new("Dark taupe")
Frame2.BackgroundColor3 = Color3.new(0.301961, 0.301961, 0.301961)
Frame2.BackgroundTransparency = 1
Frame2.BorderSizePixel = 0
Frame2.ZIndex = -1
ImageButton3.Name = "RB"
ImageButton3.Parent = Frame2
ImageButton3.Position = UDim2.new(1, -8, 1, -8)
ImageButton3.Size = UDim2.new(0, 16, 0, 16)
ImageButton3.BackgroundColor = BrickColor.new("Light grey metallic")
ImageButton3.BackgroundColor3 = Color3.new(0.690196, 0.686275, 0.698039)
ImageButton3.BackgroundTransparency = 1
ImageButton3.BorderSizePixel = 0
LocalScript4.Name = "Script"
LocalScript4.Parent = ImageButton3
table.insert(cors,sandbox(LocalScript4,function()
local SizeThing = script.Parent.Parent.Parent
local Sizing = false
local x = SizeThing.Size.X.Offset
local y = SizeThing.Size.Y.Offset
local XX = SizeThing.Size.X.Scale
local YY = SizeThing.Size.Y.Scale
local Releaser = nil
local Fx
local Fy
local MinX = script.Parent.Parent.MinX
local MinY = script.Parent.Parent.MinY
function ReleaserB()
	local n = Instance.new("ImageButton")
	n.Size = UDim2.new(31, 5000, 31, 5000)
	n.Position = UDim2.new(-15, 0, -15, 0)
	n.BackgroundTransparency = 1
	n.Name = "ReleaserButton"
	n.ZIndex = 999999999
	n.Parent = script.Parent
	return n
end

function Down(xx, yy)
	Sizing = true
	x = SizeThing.Size.X.Offset
	y = SizeThing.Size.Y.Offset
	XX = SizeThing.Size.X.Scale
	YY = SizeThing.Size.Y.Scale
	Sx = xx - x
	Sy = yy - y
	--print(Sx .. ", " .. Sy)
	Releaser = ReleaserB()
	Releaser.MouseMoved:connect(function(x, y) Move(x, y) end)
	Releaser.MouseButton1Up:connect(Up)
	Releaser.MouseLeave:connect(Up)
end 

function Up()
	Sizing = false
	if Releaser == nil then return end
	Releaser:Destroy()
	Releaser.Parent = nil
	Releaser = nil
end 

function Move(xx, yy)
	if Sizing then
		local X = xx - Sx 
		local Y = yy - Sy
		if X < MinX.Value then X = MinX.Value end
		if Y < MinY.Value then Y = MinY.Value end
		local SizeThingSize = UDim2.new(XX, X, YY, Y)
		SizeThing.Size = SizeThingSize
	end
end 
script.Parent.MouseButton1Down:connect(function(x, y) Down(x, y) end)
end))
ImageButton5.Name = "B"
ImageButton5.Parent = Frame2
ImageButton5.Position = UDim2.new(0, 0, 1, -6)
ImageButton5.Size = UDim2.new(1, -8, 0, 12)
ImageButton5.BackgroundColor = BrickColor.new("Light grey metallic")
ImageButton5.BackgroundColor3 = Color3.new(0.690196, 0.686275, 0.698039)
ImageButton5.BackgroundTransparency = 1
ImageButton5.BorderSizePixel = 0
LocalScript6.Name = "Script"
LocalScript6.Parent = ImageButton5
table.insert(cors,sandbox(LocalScript6,function()
local SizeThing = script.Parent.Parent.Parent
local Sizing = false
local x = SizeThing.Size.X.Offset
local y = SizeThing.Size.Y.Offset
local XX = SizeThing.Size.X.Scale
local YY = SizeThing.Size.Y.Scale
local Releaser = nil
local Fx
local Fy
local MinX = script.Parent.Parent.MinX
local MinY = script.Parent.Parent.MinY
function ReleaserB()
	local n = Instance.new("ImageButton")
	n.Size = UDim2.new(31, 5000, 31, 5000)
	n.Position = UDim2.new(-15, 0, -15, 0)
	n.BackgroundTransparency = 1
	n.Name = "ReleaserButton"
	n.ZIndex = 999999999
	n.Parent = script.Parent
	return n
end

function Down(xx, yy)
	Sizing = true
	x = SizeThing.Size.X.Offset
	y = SizeThing.Size.Y.Offset
	XX = SizeThing.Size.X.Scale
	YY = SizeThing.Size.Y.Scale
	Sx = xx - x
	Sy = yy - y
	--print(Sx .. ", " .. Sy)
	Releaser = ReleaserB()
	Releaser.MouseMoved:connect(function(x, y) Move(x, y) end)
	Releaser.MouseButton1Up:connect(Up)
	Releaser.MouseLeave:connect(Up)
end 

function Up()
	Sizing = false
	if Releaser == nil then return end
	Releaser:Destroy()
	Releaser.Parent = nil
	Releaser = nil
end 

function Move(xx, yy)
	if Sizing then
		local X = xx - Sx 
		local Y = yy - Sy
		if X < MinX.Value then X = MinX.Value end
		if Y < MinY.Value then Y = MinY.Value end
		local SizeThingSize = UDim2.new(XX, x, YY, Y)
		SizeThing.Size = SizeThingSize
	end
end 
script.Parent.MouseButton1Down:connect(function(x, y) Down(x, y) end)
end))
ImageButton7.Name = "R"
ImageButton7.Parent = Frame2
ImageButton7.Position = UDim2.new(1, -6, 0, 20)
ImageButton7.Size = UDim2.new(0, 12, 1, -28)
ImageButton7.BackgroundColor = BrickColor.new("Light grey metallic")
ImageButton7.BackgroundColor3 = Color3.new(0.690196, 0.686275, 0.698039)
ImageButton7.BackgroundTransparency = 1
ImageButton7.BorderSizePixel = 0
LocalScript8.Name = "Script"
LocalScript8.Parent = ImageButton7
table.insert(cors,sandbox(LocalScript8,function()
local SizeThing = script.Parent.Parent.Parent
local Sizing = false
local x = SizeThing.Size.X.Offset
local y = SizeThing.Size.Y.Offset
local XX = SizeThing.Size.X.Scale
local YY = SizeThing.Size.Y.Scale
local Releaser = nil
local Fx
local Fy
local MinX = script.Parent.Parent.MinX
local MinY = script.Parent.Parent.MinY
function ReleaserB()
	local n = Instance.new("ImageButton")
	n.Size = UDim2.new(31, 5000, 31, 5000)
	n.Position = UDim2.new(-15, 0, -15, 0)
	n.BackgroundTransparency = 1
	n.Name = "ReleaserButton"
	n.ZIndex = 999999999
	n.Parent = script.Parent
	return n
end

function Down(xx, yy)
	Sizing = true
	x = SizeThing.Size.X.Offset
	y = SizeThing.Size.Y.Offset
	XX = SizeThing.Size.X.Scale
	YY = SizeThing.Size.Y.Scale
	Fx = xx - x
	Fy = yy - y

	Releaser = ReleaserB()
	Releaser.MouseMoved:connect(function(x, y) Move(x, y) end)
	Releaser.MouseButton1Up:connect(Up)
	Releaser.MouseLeave:connect(Up)
end 

function Up()
	Sizing = false
	if Releaser == nil then return end
	Releaser:Destroy()
	Releaser.Parent = nil
	Releaser = nil
end 

function Move(xx, yy)
	if Sizing then
		local X = xx - Fx 
		local Y = yy - Fy
		if X < MinX.Value then X = MinX.Value end
		if Y < MinY.Value then Y = MinY.Value end
		local SizeThingSize = UDim2.new(XX, X, YY, y)
		SizeThing.Size = SizeThingSize
	end
end 
script.Parent.MouseButton1Down:connect(function(x, y) Down(x, y) end)
end))
ImageButton9.Name = "L"
ImageButton9.Parent = Frame2
ImageButton9.Position = UDim2.new(0, -6, 0, 20)
ImageButton9.Size = UDim2.new(0, 12, 1, -28)
ImageButton9.BackgroundColor = BrickColor.new("Light grey metallic")
ImageButton9.BackgroundColor3 = Color3.new(0.690196, 0.686275, 0.698039)
ImageButton9.BackgroundTransparency = 1
ImageButton9.BorderSizePixel = 0
LocalScript10.Name = "Script"
LocalScript10.Parent = ImageButton9
table.insert(cors,sandbox(LocalScript10,function()
local SizeThing = script.Parent.Parent.Parent
local Sizing = false
local x = SizeThing.Size.X.Offset
local y = SizeThing.Size.Y.Offset
local XX = SizeThing.Size.X.Scale
local YY = SizeThing.Size.Y.Scale
local Releaser = nil
local Fx
local Fy
local Nx
local NPos
function ReleaserB()
	local n = Instance.new("ImageButton")
	n.Size = UDim2.new(50, 5000, 50, 5000)
	n.Position = UDim2.new(0.5, 0, 0.5, 0)
	n.AnchorPoint = Vector2.new(0.5,0.5)
	n.BackgroundTransparency = 1
	n.Name = "ReleaserButton"
	n.ZIndex = 999999999
	n.Parent = SizeThing
	return n
end

function Down(xx, yy)
	Sizing = true
	x = SizeThing.Size.X.Offset
	y = SizeThing.Size.Y.Offset
	XX = SizeThing.Size.X.Scale
	YY = SizeThing.Size.Y.Scale
	Fx = xx - x
	Fy = yy - y
	Nx = SizeThing.Size.X.Offset
	NPos = SizeThing.Position
	Releaser = ReleaserB()
	Releaser.MouseMoved:connect(function(x, y) Move(x, y) end)
	Releaser.MouseButton1Up:connect(Up)
	Releaser.MouseLeave:connect(Up)
end 

function Up()
	Sizing = false
	if Releaser == nil then return end
	Releaser:Destroy()
	Releaser.Parent = nil
	Releaser = nil
end 

function Move(xx, yy)
	if Sizing then
		local X = xx - Fx
		local Y = yy - Fy
		if X < script.Parent.Parent.MinX.Value then return end
		if Nx-(X - Nx) < script.Parent.Parent.MinX.Value then return end
		if Y < script.Parent.Parent.MinY.Value then return end
		local SizeThingSize = UDim2.new(XX, X, YY, y)
		local SizeThingSizeN = UDim2.new(XX, Nx-(X - Nx) , YY, y)
		
		SizeThing.Position = UDim2.new(NPos.X.Scale,NPos.X.Offset+(X - Nx),NPos.Y.Scale,NPos.Y.Offset)
		SizeThing.Size = SizeThingSizeN
		
	end
end 
script.Parent.MouseButton1Down:connect(function(x, y) Down(x, y) end)
end))
ImageButton11.Name = "LB"
ImageButton11.Parent = Frame2
ImageButton11.Position = UDim2.new(0, -6, 1, -8)
ImageButton11.Size = UDim2.new(0, 16, 0, 16)
ImageButton11.BackgroundColor = BrickColor.new("Light grey metallic")
ImageButton11.BackgroundColor3 = Color3.new(0.690196, 0.686275, 0.698039)
ImageButton11.BackgroundTransparency = 1
ImageButton11.BorderSizePixel = 0
LocalScript12.Name = "Script"
LocalScript12.Parent = ImageButton11
table.insert(cors,sandbox(LocalScript12,function()
local SizeThing = script.Parent.Parent.Parent
local Sizing = false
local x = SizeThing.Size.X.Offset
local y = SizeThing.Size.Y.Offset
local XX = SizeThing.Size.X.Scale
local YY = SizeThing.Size.Y.Scale
local Releaser = nil
local Fx
local Fy
local Nx
local Ny
local NPos
function ReleaserB()
	local n = Instance.new("ImageButton")
	n.Size = UDim2.new(50, 5000, 50, 5000)
	n.Position = UDim2.new(0.5, 0, 0.5, 0)
	n.AnchorPoint = Vector2.new(0.5,0.5)
	n.BackgroundTransparency = 1
	n.Name = "ReleaserButton"
	n.ZIndex = 999999999
	n.Parent = SizeThing
	return n
end

function Down(xx, yy)
	Sizing = true
	x = SizeThing.Size.X.Offset
	y = SizeThing.Size.Y.Offset
	XX = SizeThing.Size.X.Scale
	YY = SizeThing.Size.Y.Scale
	Fx = xx - x
	Fy = yy - y
	Nx = SizeThing.Size.X.Offset
	Ny = SizeThing.Size.Y.Offset
	NPos = SizeThing.Position
	Releaser = ReleaserB()
	Releaser.MouseMoved:connect(function(x, y) Move(x, y) end)
	Releaser.MouseButton1Up:connect(Up)
	Releaser.MouseLeave:connect(Up)
end 

function Up()
	Sizing = false
	if Releaser == nil then return end
	Releaser:Destroy()
	Releaser.Parent = nil
	Releaser = nil
end 

function Move(xx, yy)
	if Sizing then
		local X = xx - Fx
		local Y = yy - Fy
		if X < 200 then X = 200 end
		if Nx-(X - Nx) < 200 then return end
		if Y < 80 then Y = 80 end
		local SizeThingSize = UDim2.new(XX, X, YY, Y)
		local SizeThingSizeN = UDim2.new(XX, Nx-(X - Nx) , YY, Y)
		
		SizeThing.Position = UDim2.new(NPos.X.Scale,NPos.X.Offset+(X - Nx),NPos.Y.Scale,NPos.Y.Offset)
		SizeThing.Size = SizeThingSizeN
		
	end
end 
script.Parent.MouseButton1Down:connect(function(x, y) Down(x, y) end)
end))
NumberValue13.Name = "MinX"
NumberValue13.Parent = Frame2
NumberValue13.Value = 200
NumberValue14.Name = "MinY"
NumberValue14.Parent = Frame2
NumberValue14.Value = 200
Frame15.Name = "Bar"
Frame15.Parent = Frame1
Frame15.Size = UDim2.new(1, 0, 0, 22)
Frame15.BackgroundColor = BrickColor.new("Black")
Frame15.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Frame15.BorderSizePixel = 0
Frame15.ClipsDescendants = true
TextButton16.Name = "drager"
TextButton16.Parent = Frame15
TextButton16.Size = UDim2.new(1, 0, 1, 0)
TextButton16.BackgroundColor = BrickColor.new("Light grey metallic")
TextButton16.BackgroundColor3 = Color3.new(0.678431, 0.67451, 0.686275)
TextButton16.BackgroundTransparency = 1
TextButton16.Font = Enum.Font.SourceSans
TextButton16.FontSize = Enum.FontSize.Size14
TextButton16.Text = ""
TextButton16.TextColor = BrickColor.new("Really black")
TextButton16.TextColor3 = Color3.new(0, 0, 0)
TextButton16.TextSize = 14
LocalScript17.Parent = TextButton16
table.insert(cors,sandbox(LocalScript17,function()
local drager = script.Parent
local dragObject = script.Parent.Parent.Parent

local Releaser = Instance.new("TextButton",dragObject.Parent)
Releaser.Text = ""
Releaser.Name = "Releaser"
Releaser.Size = UDim2.new(1,6500,1,6500)
Releaser.Position = UDim2.new(0.5,0,0.5,0)
Releaser.AnchorPoint = Vector2.new(0.5,0.5)
Releaser.BackgroundTransparency = 1
Releaser.Visible = false
Releaser.ZIndex = 999999999
local MouseDownPosition = nil
Releaser.MouseMoved:Connect(function(x,y)
	if MouseDownPosition == nil then
		Releaser.Visible = false
	else
		local position = UDim2.new(0,x-MouseDownPosition.X,0,y-MouseDownPosition.Y)
		--wait(0.08)
		dragObject.Position = position
	end
end)
Releaser.MouseButton1Up:Connect(function()
	MouseDownPosition = nil
	Releaser.Visible = false
end)
drager.MouseButton1Up:Connect(function()
	MouseDownPosition = nil
	Releaser.Visible = false
end)
drager.MouseButton1Down:Connect(function(x,y)
	MouseDownPosition = Vector2.new(x-drager.AbsolutePosition.X,y-drager.AbsolutePosition.Y)
	Releaser.Visible = true
end)
end))
Frame18.Name = "RButton"
Frame18.Parent = Frame15
Frame18.Position = UDim2.new(1, -1, 0, 0)
Frame18.Size = UDim2.new(0.5, -1, 1, 0)
Frame18.AnchorPoint = Vector2.new(1, 0)
Frame18.BackgroundColor = BrickColor.new("Institutional white")
Frame18.BackgroundColor3 = Color3.new(1, 1, 1)
Frame18.BackgroundTransparency = 1
UIListLayout19.Parent = Frame18
UIListLayout19.FillDirection = Enum.FillDirection.Horizontal
UIListLayout19.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout19.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout19.VerticalAlignment = Enum.VerticalAlignment.Center
ImageButton20.Name = "Mini"
ImageButton20.Parent = Frame18
ImageButton20.Position = UDim2.new(1, 0, 0, 0)
ImageButton20.Size = UDim2.new(0, 38, 0, 22)
ImageButton20.AnchorPoint = Vector2.new(1, 0)
ImageButton20.BackgroundColor = BrickColor.new("Institutional white")
ImageButton20.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton20.BackgroundTransparency = 1
ImageButton20.BorderSizePixel = 0
Frame21.Name = "Line"
Frame21.Parent = ImageButton20
Frame21.Size = UDim2.new(1, 0, 1, 0)
Frame21.BackgroundColor = BrickColor.new("Institutional white")
Frame21.BackgroundColor3 = Color3.new(1, 1, 1)
Frame21.BackgroundTransparency = 1
Frame21.BorderSizePixel = 0
Frame22.Parent = Frame21
Frame22.Size = UDim2.new(0, 2, 1, 0)
Frame22.BackgroundColor = BrickColor.new("Institutional white")
Frame22.BackgroundColor3 = Color3.new(1, 1, 1)
Frame22.BackgroundTransparency = 1
Frame22.BorderSizePixel = 0
Frame22.ClipsDescendants = true
Frame23.Parent = Frame21
Frame23.Position = UDim2.new(1, 0, 0, 0)
Frame23.Size = UDim2.new(0, 2, 1, 0)
Frame23.AnchorPoint = Vector2.new(1, 0)
Frame23.BackgroundColor = BrickColor.new("Institutional white")
Frame23.BackgroundColor3 = Color3.new(1, 1, 1)
Frame23.BackgroundTransparency = 1
Frame23.BorderSizePixel = 0
Frame23.ClipsDescendants = true
Frame24.Parent = Frame21
Frame24.Position = UDim2.new(0, 2, 0, 0)
Frame24.Size = UDim2.new(1, -4, 0, 2)
Frame24.BackgroundColor = BrickColor.new("Institutional white")
Frame24.BackgroundColor3 = Color3.new(1, 1, 1)
Frame24.BackgroundTransparency = 1
Frame24.BorderSizePixel = 0
Frame24.ClipsDescendants = true
Frame25.Parent = Frame21
Frame25.Position = UDim2.new(0, 2, 1, 0)
Frame25.Size = UDim2.new(1, -4, 0, 2)
Frame25.AnchorPoint = Vector2.new(0, 1)
Frame25.BackgroundColor = BrickColor.new("Institutional white")
Frame25.BackgroundColor3 = Color3.new(1, 1, 1)
Frame25.BackgroundTransparency = 1
Frame25.BorderSizePixel = 0
Frame25.ClipsDescendants = true
Frame26.Name = "Main"
Frame26.Parent = ImageButton20
Frame26.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame26.Size = UDim2.new(1, -4, 1, -4)
Frame26.AnchorPoint = Vector2.new(0.5, 0.5)
Frame26.BackgroundColor = BrickColor.new("Institutional white")
Frame26.BackgroundColor3 = Color3.new(1, 1, 1)
Frame26.BackgroundTransparency = 1
Frame26.BorderSizePixel = 0
Frame26.ClipsDescendants = true
ImageLabel27.Name = "ButtonImage"
ImageLabel27.Parent = ImageButton20
ImageLabel27.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel27.Size = UDim2.new(0, 8, 0, 1)
ImageLabel27.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel27.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel27.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel27.BorderSizePixel = 0
ImageLabel27.ZIndex = 2
ImageLabel27.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel27.ImageTransparency = 1
LocalScript28.Parent = ImageButton20
table.insert(cors,sandbox(LocalScript28,function()
local Shadow = script.ImageLabel:Clone()
local Mouse = game.Players.LocalPlayer:GetMouse()
local Button = script.Parent
local Main = script.Parent.Main
local TweenService = game:GetService("TweenService")
local MainMouseSH = script.ShadowLabel:Clone():Clone()
local MainMouseRippler = script.Rippler:Clone():Clone()
local RipplerTransparency = MainMouseRippler.ImageTransparency
MainMouseRippler.ImageTransparency = 1
local MainEnter = TweenService:Create(
	Main,
	TweenInfo.new(
		0.45, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 0.94;
	}
)

local MainLeave = TweenService:Create(
	Main,
	TweenInfo.new(
		0.48, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 1;
	}
)

local SHOn = TweenService:Create(
	Main,
	TweenInfo.new(
		0.72, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 0.89;
	}
)

local RippleSize --= Button.AbsoluteSize.Y * 1.33
--if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
--	RippleSize = Button.AbsoluteSize.X * 1.33
--end
local Ripple-- = TweenService:Create(
--	MainMouseRippler,
--	TweenInfo.new(
--		4.2, -- time
--		Enum.EasingStyle.Quint, -- style
--		Enum.EasingDirection.Out, -- direction
--		0,
--		false,
--		0
--	),
--	{ -- Properties
--		Size = UDim2.new(0,RippleSize,0,RippleSize);
--		ImageTransparency = 1
--	}
--)
local RippleOut-- = TweenService:Create(
--	MainMouseRippler,
--	TweenInfo.new(
--		2.12, -- time
--		Enum.EasingStyle.Quint, -- style
--		Enum.EasingDirection.Out, -- direction
--		0,
--		false,
--		0
--	),
--	{ -- Properties
--		Size = UDim2.new(0,RippleSize,0,RippleSize);
--		ImageTransparency = 1
--	}
--)
local Size = Button.AbsoluteSize.Y * 0.86
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	Size = Button.AbsoluteSize.X * 0.86
end
local DownRippleSize = Button.AbsoluteSize.Y * 0.35
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	DownRippleSize = Button.AbsoluteSize.X * 0.35
end

Shadow.Size = UDim2.new(0,Size,0,Size)

local list = {}
for i,v in pairs(script.Parent.Line:GetChildren()) do
	local SC = Shadow:Clone()
	SC.Parent = v
	list[#list+1] = SC
end
list[#list+1] = MainMouseSH
Mouse.Move:Connect(function()
	Size = Button.AbsoluteSize.Y * 0.86
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		Size = Button.AbsoluteSize.X * 0.86
	end
	local X = Mouse.X
	local Y = Mouse.Y
	for i,v in pairs(list) do
		v.Visible = true
		v.Position = UDim2.new(0,X-v.Parent.AbsolutePosition.X,0,Y-v.Parent.AbsolutePosition.Y)
		if v.Name == "ImageLabel" then
			v.Size = UDim2.new(0,Size,0,Size)
		end
	end
end)

local SizeH = Button.AbsoluteSize.Y * 1.722
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	SizeH = Button.AbsoluteSize.X * 1.722
end
MainMouseSH.Size = UDim2.new(0,SizeH,0,SizeH)

local SHSize = MainMouseSH.Size
MainMouseSH.Size = UDim2.new(0,0,0,0)
MainMouseSH.Parent = Main

MainMouseRippler.Parent = Main

Main.MouseEnter:Connect(function()
	MainEnter:Play()
	SizeH = Button.AbsoluteSize.Y * 1.722
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		SizeH = Button.AbsoluteSize.X * 1.722
	end
	SHSize = UDim2.new(0,SizeH,0,SizeH)
	MainMouseSH.Size = SHSize
	for i,v in pairs(Button.Line:GetChildren()) do
		v.BackgroundTransparency = 0.82
	end
end)
Button.MouseLeave:Connect(function()
	MainLeave:Play()
	MainMouseSH.Size = UDim2.new(0,0,0,0)
	--Ripple:Pause()
	--MainMouseRippler.Size = UDim2.new(0,0,0,0)
	--MainMouseRippler.ImageTransparency = 0.72
	for i,v in pairs(Button.Line:GetChildren()) do
		v.BackgroundTransparency = 1
	end
	Ripple = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			0, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			ImageTransparency = 1
		}
	)
	Ripple:Play()
	MainMouseRippler.ImageTransparency = 1
end)

Button.MouseButton1Down:Connect(function()
	SHOn:Play()
	DownRippleSize = Button.AbsoluteSize.Y * 0.35
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		DownRippleSize = Button.AbsoluteSize.X * 0.35
	end
	MainMouseRippler.Size = UDim2.new(0,DownRippleSize,0,DownRippleSize)
	MainMouseRippler.Position = MainMouseSH.Position
	MainMouseRippler.ImageTransparency = RipplerTransparency
	RippleSize = Button.AbsoluteSize.Y * 1.33
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		RippleSize = Button.AbsoluteSize.X * 1.33
	end
	Ripple = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			4.2, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Size = UDim2.new(0,RippleSize,0,RippleSize);
			ImageTransparency = 1
		}
	)
	Ripple:Play()
	delay(1.752,function()
		MainMouseRippler.Size = UDim2.new(0,0,0,0)
	end)
end)
Button.MouseButton1Up:Connect(function()
	MainEnter:Play()
	--Ripple:Pause()
	--MainMouseRippler.Size = UDim2.new(0,0,0,0)
	--MainMouseRippler.ImageTransparency = 0.72
	local lastRippleSize = RippleSize
	RippleSize = Button.AbsoluteSize.Y * 1.33
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		RippleSize = Button.AbsoluteSize.X * 1.33
	end
	RippleOut = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			1.28*(((RippleSize-MainMouseRippler.Size.X.Offset)/RippleSize)+0.5), -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Size = UDim2.new(0,RippleSize,0,RippleSize);
			ImageTransparency = 1
		}
	)
	RippleOut:Play()
end)
local Main = script.Parent.Parent.Parent.Parent
local Show = Main.Parent.Show
local SaveSize
Button.MouseButton1Click:Connect(function()
	Show.Visible = true
	if Show.Parent == Main.Parent then
		Main.Visible = false
		Show.Position = Main.Position
		Show.Size = Main.Size
		Show:TweenSize(UDim2.new(0,31,0,31),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true,nil)
	else
		SaveSize = Main.Size
		Main:TweenSize(UDim2.new(0,31,0,31),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true,nil)
		wait(0.21)
		Main.Visible = false
		Main.Size = SaveSize
	end
end)


end))
ImageLabel29.Parent = LocalScript28
ImageLabel29.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel29.Visible = false
ImageLabel29.Size = UDim2.new(0, 80, 0, 80)
ImageLabel29.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel29.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel29.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel29.BackgroundTransparency = 1
ImageLabel29.Image = "rbxassetid://3701386917"
ImageLabel29.ImageTransparency = 0.73000001907349
ImageLabel30.Name = "ShadowLabel"
ImageLabel30.Parent = LocalScript28
ImageLabel30.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel30.Visible = false
ImageLabel30.Size = UDim2.new(0, 80, 0, 80)
ImageLabel30.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel30.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel30.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel30.BackgroundTransparency = 1
ImageLabel30.Image = "rbxassetid://3701386917"
ImageLabel30.ImageTransparency = 0.85000002384186
ImageLabel31.Name = "Rippler"
ImageLabel31.Parent = LocalScript28
ImageLabel31.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel31.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel31.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel31.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel31.BackgroundTransparency = 1
ImageLabel31.Image = "rbxassetid://3701391885"
ImageLabel31.ImageTransparency = 0.81000000238419
ImageButton32.Name = "Close"
ImageButton32.Parent = Frame18
ImageButton32.Position = UDim2.new(1, 0, 0, 0)
ImageButton32.Size = UDim2.new(0, 38, 0, 22)
ImageButton32.AnchorPoint = Vector2.new(1, 0)
ImageButton32.BackgroundColor = BrickColor.new("Institutional white")
ImageButton32.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton32.BackgroundTransparency = 1
ImageButton32.BorderSizePixel = 0
ImageButton32.LayoutOrder = 2
Frame33.Name = "Line"
Frame33.Parent = ImageButton32
Frame33.Size = UDim2.new(1, 0, 1, 0)
Frame33.BackgroundColor = BrickColor.new("Institutional white")
Frame33.BackgroundColor3 = Color3.new(1, 1, 1)
Frame33.BackgroundTransparency = 1
Frame33.BorderSizePixel = 0
Frame34.Parent = Frame33
Frame34.Size = UDim2.new(0, 2, 1, 0)
Frame34.BackgroundColor = BrickColor.new("Institutional white")
Frame34.BackgroundColor3 = Color3.new(1, 1, 1)
Frame34.BackgroundTransparency = 1
Frame34.BorderSizePixel = 0
Frame34.ClipsDescendants = true
Frame35.Parent = Frame33
Frame35.Position = UDim2.new(1, 0, 0, 0)
Frame35.Size = UDim2.new(0, 2, 1, 0)
Frame35.AnchorPoint = Vector2.new(1, 0)
Frame35.BackgroundColor = BrickColor.new("Institutional white")
Frame35.BackgroundColor3 = Color3.new(1, 1, 1)
Frame35.BackgroundTransparency = 1
Frame35.BorderSizePixel = 0
Frame35.ClipsDescendants = true
Frame36.Parent = Frame33
Frame36.Position = UDim2.new(0, 2, 0, 0)
Frame36.Size = UDim2.new(1, -4, 0, 2)
Frame36.BackgroundColor = BrickColor.new("Institutional white")
Frame36.BackgroundColor3 = Color3.new(1, 1, 1)
Frame36.BackgroundTransparency = 1
Frame36.BorderSizePixel = 0
Frame36.ClipsDescendants = true
Frame37.Parent = Frame33
Frame37.Position = UDim2.new(0, 2, 1, 0)
Frame37.Size = UDim2.new(1, -4, 0, 2)
Frame37.AnchorPoint = Vector2.new(0, 1)
Frame37.BackgroundColor = BrickColor.new("Institutional white")
Frame37.BackgroundColor3 = Color3.new(1, 1, 1)
Frame37.BackgroundTransparency = 1
Frame37.BorderSizePixel = 0
Frame37.ClipsDescendants = true
Frame38.Name = "Main"
Frame38.Parent = ImageButton32
Frame38.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame38.Size = UDim2.new(1, -4, 1, -4)
Frame38.AnchorPoint = Vector2.new(0.5, 0.5)
Frame38.BackgroundColor = BrickColor.new("Institutional white")
Frame38.BackgroundColor3 = Color3.new(1, 1, 1)
Frame38.BackgroundTransparency = 1
Frame38.BorderSizePixel = 0
Frame38.ClipsDescendants = true
TextLabel39.Parent = ImageButton32
TextLabel39.Position = UDim2.new(0, 0, 0, 1)
TextLabel39.Size = UDim2.new(1, 0, 1, 0)
TextLabel39.BackgroundColor = BrickColor.new("Really red")
TextLabel39.BackgroundColor3 = Color3.new(1, 0, 0)
TextLabel39.BackgroundTransparency = 1
TextLabel39.Font = Enum.Font.SourceSans
TextLabel39.FontSize = Enum.FontSize.Size18
TextLabel39.Text = "X"
TextLabel39.TextColor = BrickColor.new("Institutional white")
TextLabel39.TextColor3 = Color3.new(1, 1, 1)
TextLabel39.TextSize = 16
LocalScript40.Parent = ImageButton32
table.insert(cors,sandbox(LocalScript40,function()
local Shadow = script.ImageLabel:Clone()
local Mouse = game.Players.LocalPlayer:GetMouse()
local Button = script.Parent
local Main = script.Parent.Main
local TweenService = game:GetService("TweenService")
local MainMouseSH = script.ShadowLabel:Clone():Clone()
local MainMouseRippler = script.Rippler:Clone():Clone()
local RipplerTransparency = MainMouseRippler.ImageTransparency
MainMouseRippler.ImageTransparency = 1
local MainEnter = TweenService:Create(
	Main,
	TweenInfo.new(
		0.45, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 0.94;
	}
)

local MainLeave = TweenService:Create(
	Main,
	TweenInfo.new(
		0.48, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 1;
	}
)

local SHOn = TweenService:Create(
	Main,
	TweenInfo.new(
		0.72, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 0.89;
	}
)

local RippleSize --= Button.AbsoluteSize.Y * 1.33
--if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
--	RippleSize = Button.AbsoluteSize.X * 1.33
--end
local Ripple-- = TweenService:Create(
--	MainMouseRippler,
--	TweenInfo.new(
--		4.2, -- time
--		Enum.EasingStyle.Quint, -- style
--		Enum.EasingDirection.Out, -- direction
--		0,
--		false,
--		0
--	),
--	{ -- Properties
--		Size = UDim2.new(0,RippleSize,0,RippleSize);
--		ImageTransparency = 1
--	}
--)
local RippleOut-- = TweenService:Create(
--	MainMouseRippler,
--	TweenInfo.new(
--		2.12, -- time
--		Enum.EasingStyle.Quint, -- style
--		Enum.EasingDirection.Out, -- direction
--		0,
--		false,
--		0
--	),
--	{ -- Properties
--		Size = UDim2.new(0,RippleSize,0,RippleSize);
--		ImageTransparency = 1
--	}
--)
local Size = Button.AbsoluteSize.Y * 0.86
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	Size = Button.AbsoluteSize.X * 0.86
end
local DownRippleSize = Button.AbsoluteSize.Y * 0.35
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	DownRippleSize = Button.AbsoluteSize.X * 0.35
end

Shadow.Size = UDim2.new(0,Size,0,Size)

local list = {}
for i,v in pairs(script.Parent.Line:GetChildren()) do
	local SC = Shadow:Clone()
	SC.Parent = v
	list[#list+1] = SC
end
list[#list+1] = MainMouseSH
Mouse.Move:Connect(function()
	Size = Button.AbsoluteSize.Y * 0.86
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		Size = Button.AbsoluteSize.X * 0.86
	end
	local X = Mouse.X
	local Y = Mouse.Y
	for i,v in pairs(list) do
		v.Visible = true
		v.Position = UDim2.new(0,X-v.Parent.AbsolutePosition.X,0,Y-v.Parent.AbsolutePosition.Y)
		if v.Name == "ImageLabel" then
			v.Size = UDim2.new(0,Size,0,Size)
		end
	end
end)

local SizeH = Button.AbsoluteSize.Y * 1.722
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	SizeH = Button.AbsoluteSize.X * 1.722
end
MainMouseSH.Size = UDim2.new(0,SizeH,0,SizeH)

local SHSize = MainMouseSH.Size
MainMouseSH.Size = UDim2.new(0,0,0,0)
MainMouseSH.Parent = Main

MainMouseRippler.Parent = Main

Main.MouseEnter:Connect(function()
	MainEnter:Play()
	SizeH = Button.AbsoluteSize.Y * 1.722
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		SizeH = Button.AbsoluteSize.X * 1.722
	end
	SHSize = UDim2.new(0,SizeH,0,SizeH)
	MainMouseSH.Size = SHSize
	for i,v in pairs(Button.Line:GetChildren()) do
		v.BackgroundTransparency = 0.82
	end
end)
Button.MouseLeave:Connect(function()
	MainLeave:Play()
	MainMouseSH.Size = UDim2.new(0,0,0,0)
	--Ripple:Pause()
	--MainMouseRippler.Size = UDim2.new(0,0,0,0)
	--MainMouseRippler.ImageTransparency = 0.72
	for i,v in pairs(Button.Line:GetChildren()) do
		v.BackgroundTransparency = 1
	end
	Ripple = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			0, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			ImageTransparency = 1
		}
	)
	Ripple:Play()
	MainMouseRippler.ImageTransparency = 1
end)

Button.MouseButton1Down:Connect(function()
	SHOn:Play()
	DownRippleSize = Button.AbsoluteSize.Y * 0.35
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		DownRippleSize = Button.AbsoluteSize.X * 0.35
	end
	MainMouseRippler.Size = UDim2.new(0,DownRippleSize,0,DownRippleSize)
	MainMouseRippler.Position = MainMouseSH.Position
	MainMouseRippler.ImageTransparency = RipplerTransparency
	RippleSize = Button.AbsoluteSize.Y * 1.33
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		RippleSize = Button.AbsoluteSize.X * 1.33
	end
	Ripple = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			4.2, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Size = UDim2.new(0,RippleSize,0,RippleSize);
			ImageTransparency = 1
		}
	)
	Ripple:Play()
	delay(1.752,function()
		MainMouseRippler.Size = UDim2.new(0,0,0,0)
	end)
end)
Button.MouseButton1Up:Connect(function()
	MainEnter:Play()
	--Ripple:Pause()
	--MainMouseRippler.Size = UDim2.new(0,0,0,0)
	--MainMouseRippler.ImageTransparency = 0.72
	local lastRippleSize = RippleSize
	RippleSize = Button.AbsoluteSize.Y * 1.33
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		RippleSize = Button.AbsoluteSize.X * 1.33
	end
	RippleOut = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			1.28*(((RippleSize-MainMouseRippler.Size.X.Offset)/RippleSize)+0.5), -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Size = UDim2.new(0,RippleSize,0,RippleSize);
			ImageTransparency = 1
		}
	)
	RippleOut:Play()
end)
Button.MouseButton1Click:Connect(function()
	local SizeOfMain = script.Parent.Parent.Parent.Parent.Size
	script.Parent.Parent.Parent.Parent:TweenSize(UDim2.new(0,0,0,0), "Out", "Quad", 0.2, true, nil)
	wait(0.2)
	script.Parent.Parent.Parent.Parent.Size = SizeOfMain
	script.Parent.Parent.Parent.Parent.Parent.Enabled = false
		script.Parent.Parent.Parent.Parent.Parent:Destroy()
end)


end))
ImageLabel41.Parent = LocalScript40
ImageLabel41.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel41.Visible = false
ImageLabel41.Size = UDim2.new(0, 80, 0, 80)
ImageLabel41.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel41.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel41.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel41.BackgroundTransparency = 1
ImageLabel41.Image = "rbxassetid://3701386917"
ImageLabel41.ImageTransparency = 0.73000001907349
ImageLabel42.Name = "ShadowLabel"
ImageLabel42.Parent = LocalScript40
ImageLabel42.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel42.Visible = false
ImageLabel42.Size = UDim2.new(0, 80, 0, 80)
ImageLabel42.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel42.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel42.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel42.BackgroundTransparency = 1
ImageLabel42.Image = "rbxassetid://3701386917"
ImageLabel42.ImageTransparency = 0.85000002384186
ImageLabel43.Name = "Rippler"
ImageLabel43.Parent = LocalScript40
ImageLabel43.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel43.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel43.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel43.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel43.BackgroundTransparency = 1
ImageLabel43.Image = "rbxassetid://3701391885"
ImageLabel43.ImageTransparency = 0.81000000238419
ImageButton44.Name = "Max"
ImageButton44.Parent = Frame18
ImageButton44.Position = UDim2.new(1, 0, 0, 0)
ImageButton44.Size = UDim2.new(0, 38, 0, 22)
ImageButton44.AnchorPoint = Vector2.new(1, 0)
ImageButton44.BackgroundColor = BrickColor.new("Institutional white")
ImageButton44.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton44.BackgroundTransparency = 1
ImageButton44.BorderSizePixel = 0
ImageButton44.LayoutOrder = 1
Frame45.Name = "Line"
Frame45.Parent = ImageButton44
Frame45.Size = UDim2.new(1, 0, 1, 0)
Frame45.BackgroundColor = BrickColor.new("Institutional white")
Frame45.BackgroundColor3 = Color3.new(1, 1, 1)
Frame45.BackgroundTransparency = 1
Frame45.BorderSizePixel = 0
Frame46.Parent = Frame45
Frame46.Size = UDim2.new(0, 2, 1, 0)
Frame46.BackgroundColor = BrickColor.new("Institutional white")
Frame46.BackgroundColor3 = Color3.new(1, 1, 1)
Frame46.BackgroundTransparency = 1
Frame46.BorderSizePixel = 0
Frame46.ClipsDescendants = true
Frame47.Parent = Frame45
Frame47.Position = UDim2.new(1, 0, 0, 0)
Frame47.Size = UDim2.new(0, 2, 1, 0)
Frame47.AnchorPoint = Vector2.new(1, 0)
Frame47.BackgroundColor = BrickColor.new("Institutional white")
Frame47.BackgroundColor3 = Color3.new(1, 1, 1)
Frame47.BackgroundTransparency = 1
Frame47.BorderSizePixel = 0
Frame47.ClipsDescendants = true
Frame48.Parent = Frame45
Frame48.Position = UDim2.new(0, 2, 0, 0)
Frame48.Size = UDim2.new(1, -4, 0, 2)
Frame48.BackgroundColor = BrickColor.new("Institutional white")
Frame48.BackgroundColor3 = Color3.new(1, 1, 1)
Frame48.BackgroundTransparency = 1
Frame48.BorderSizePixel = 0
Frame48.ClipsDescendants = true
Frame49.Parent = Frame45
Frame49.Position = UDim2.new(0, 2, 1, 0)
Frame49.Size = UDim2.new(1, -4, 0, 2)
Frame49.AnchorPoint = Vector2.new(0, 1)
Frame49.BackgroundColor = BrickColor.new("Institutional white")
Frame49.BackgroundColor3 = Color3.new(1, 1, 1)
Frame49.BackgroundTransparency = 1
Frame49.BorderSizePixel = 0
Frame49.ClipsDescendants = true
Frame50.Name = "Main"
Frame50.Parent = ImageButton44
Frame50.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame50.Size = UDim2.new(1, -4, 1, -4)
Frame50.AnchorPoint = Vector2.new(0.5, 0.5)
Frame50.BackgroundColor = BrickColor.new("Institutional white")
Frame50.BackgroundColor3 = Color3.new(1, 1, 1)
Frame50.BackgroundTransparency = 1
Frame50.BorderSizePixel = 0
Frame50.ClipsDescendants = true
ImageLabel51.Name = "Front"
ImageLabel51.Parent = ImageButton44
ImageLabel51.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel51.Size = UDim2.new(0, 11, 0, 11)
ImageLabel51.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel51.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel51.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel51.BackgroundTransparency = 1
ImageLabel51.Image = "rbxassetid://3707115439"
ImageLabel51.ImageTransparency = 1
ImageLabel51.ScaleType = Enum.ScaleType.Crop
ImageLabel51.SliceScale = 0
Frame52.Parent = ImageLabel51
Frame52.Position = UDim2.new(0, 0, 0, 2)
Frame52.Size = UDim2.new(0, 1, 0, 8)
Frame52.BackgroundColor = BrickColor.new("Institutional white")
Frame52.BackgroundColor3 = Color3.new(1, 1, 1)
Frame52.BorderSizePixel = 0
Frame53.Parent = ImageLabel51
Frame53.Position = UDim2.new(1, -3, 0, 2)
Frame53.Size = UDim2.new(0, 1, 0, 9)
Frame53.BackgroundColor = BrickColor.new("Institutional white")
Frame53.BackgroundColor3 = Color3.new(1, 1, 1)
Frame53.BorderSizePixel = 0
Frame54.Parent = ImageLabel51
Frame54.Position = UDim2.new(0, 0, 0, 10)
Frame54.Size = UDim2.new(0, 8, 0, 1)
Frame54.BackgroundColor = BrickColor.new("Institutional white")
Frame54.BackgroundColor3 = Color3.new(1, 1, 1)
Frame54.BorderSizePixel = 0
Frame55.Parent = ImageLabel51
Frame55.Position = UDim2.new(0, 0, 0, 2)
Frame55.Size = UDim2.new(0, 8, 0, 1)
Frame55.BackgroundColor = BrickColor.new("Institutional white")
Frame55.BackgroundColor3 = Color3.new(1, 1, 1)
Frame55.BorderSizePixel = 0
ImageLabel56.Name = "Back"
ImageLabel56.Parent = ImageButton44
ImageLabel56.Position = UDim2.new(0.5, 2, 0.5, -2)
ImageLabel56.Visible = false
ImageLabel56.Size = UDim2.new(0, 11, 0, 11)
ImageLabel56.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel56.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel56.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel56.BackgroundTransparency = 1
ImageLabel56.Image = "rbxassetid://3707115439"
ImageLabel56.ImageTransparency = 1
ImageLabel56.ScaleType = Enum.ScaleType.Crop
ImageLabel56.SliceScale = 0
Frame57.Parent = ImageLabel56
Frame57.Position = UDim2.new(0, 0, 0, 2)
Frame57.Size = UDim2.new(0, 1, 0, 2)
Frame57.BackgroundColor = BrickColor.new("Institutional white")
Frame57.BackgroundColor3 = Color3.new(1, 1, 1)
Frame57.BorderSizePixel = 0
Frame58.Parent = ImageLabel56
Frame58.Position = UDim2.new(1, -3, 0, 2)
Frame58.Size = UDim2.new(0, 1, 0, 9)
Frame58.BackgroundColor = BrickColor.new("Institutional white")
Frame58.BackgroundColor3 = Color3.new(1, 1, 1)
Frame58.BorderSizePixel = 0
Frame59.Parent = ImageLabel56
Frame59.Position = UDim2.new(0, 6, 0, 10)
Frame59.Size = UDim2.new(0, 2, 0, 1)
Frame59.BackgroundColor = BrickColor.new("Institutional white")
Frame59.BackgroundColor3 = Color3.new(1, 1, 1)
Frame59.BorderSizePixel = 0
Frame60.Parent = ImageLabel56
Frame60.Position = UDim2.new(0, 0, 0, 2)
Frame60.Size = UDim2.new(0, 8, 0, 1)
Frame60.BackgroundColor = BrickColor.new("Institutional white")
Frame60.BackgroundColor3 = Color3.new(1, 1, 1)
Frame60.BorderSizePixel = 0
LocalScript61.Parent = ImageButton44
table.insert(cors,sandbox(LocalScript61,function()
local Shadow = script.ImageLabel:Clone()
local Mouse = game.Players.LocalPlayer:GetMouse()
local Button = script.Parent
local Main = script.Parent.Main
local TweenService = game:GetService("TweenService")
local MainMouseSH = script.ShadowLabel:Clone():Clone()
local MainMouseRippler = script.Rippler:Clone():Clone()
local RipplerTransparency = MainMouseRippler.ImageTransparency
MainMouseRippler.ImageTransparency = 1
local MainEnter = TweenService:Create(
	Main,
	TweenInfo.new(
		0.45, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 0.94;
	}
)

local MainLeave = TweenService:Create(
	Main,
	TweenInfo.new(
		0.48, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 1;
	}
)

local SHOn = TweenService:Create(
	Main,
	TweenInfo.new(
		0.72, -- time
		Enum.EasingStyle.Quint, -- style
		Enum.EasingDirection.Out, -- direction
		0,
		false,
		0
	),
	{ -- Properties
		BackgroundTransparency = 0.89;
	}
)

local RippleSize --= Button.AbsoluteSize.Y * 1.33
--if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
--	RippleSize = Button.AbsoluteSize.X * 1.33
--end
local Ripple-- = TweenService:Create(
--	MainMouseRippler,
--	TweenInfo.new(
--		4.2, -- time
--		Enum.EasingStyle.Quint, -- style
--		Enum.EasingDirection.Out, -- direction
--		0,
--		false,
--		0
--	),
--	{ -- Properties
--		Size = UDim2.new(0,RippleSize,0,RippleSize);
--		ImageTransparency = 1
--	}
--)
local RippleOut-- = TweenService:Create(
--	MainMouseRippler,
--	TweenInfo.new(
--		2.12, -- time
--		Enum.EasingStyle.Quint, -- style
--		Enum.EasingDirection.Out, -- direction
--		0,
--		false,
--		0
--	),
--	{ -- Properties
--		Size = UDim2.new(0,RippleSize,0,RippleSize);
--		ImageTransparency = 1
--	}
--)
local Size = Button.AbsoluteSize.Y * 0.86
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	Size = Button.AbsoluteSize.X * 0.86
end
local DownRippleSize = Button.AbsoluteSize.Y * 0.35
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	DownRippleSize = Button.AbsoluteSize.X * 0.35
end

Shadow.Size = UDim2.new(0,Size,0,Size)

local list = {}
for i,v in pairs(script.Parent.Line:GetChildren()) do
	local SC = Shadow:Clone()
	SC.Parent = v
	list[#list+1] = SC
end
list[#list+1] = MainMouseSH
Mouse.Move:Connect(function()
	Size = Button.AbsoluteSize.Y * 0.86
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		Size = Button.AbsoluteSize.X * 0.86
	end
	local X = Mouse.X
	local Y = Mouse.Y
	for i,v in pairs(list) do
		v.Visible = true
		v.Position = UDim2.new(0,X-v.Parent.AbsolutePosition.X,0,Y-v.Parent.AbsolutePosition.Y)
		if v.Name == "ImageLabel" then
			v.Size = UDim2.new(0,Size,0,Size)
		end
	end
end)

local SizeH = Button.AbsoluteSize.Y * 1.722
if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
	SizeH = Button.AbsoluteSize.X * 1.722
end
MainMouseSH.Size = UDim2.new(0,SizeH,0,SizeH)

local SHSize = MainMouseSH.Size
MainMouseSH.Size = UDim2.new(0,0,0,0)
MainMouseSH.Parent = Main

MainMouseRippler.Parent = Main

Main.MouseEnter:Connect(function()
	MainEnter:Play()
	SizeH = Button.AbsoluteSize.Y * 1.722
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		SizeH = Button.AbsoluteSize.X * 1.722
	end
	SHSize = UDim2.new(0,SizeH,0,SizeH)
	MainMouseSH.Size = SHSize
	for i,v in pairs(Button.Line:GetChildren()) do
		v.BackgroundTransparency = 0.82
	end
end)
Button.MouseLeave:Connect(function()
	MainLeave:Play()
	MainMouseSH.Size = UDim2.new(0,0,0,0)
	--Ripple:Pause()
	--MainMouseRippler.Size = UDim2.new(0,0,0,0)
	--MainMouseRippler.ImageTransparency = 0.72
	for i,v in pairs(Button.Line:GetChildren()) do
		v.BackgroundTransparency = 1
	end
	Ripple = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			0, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			ImageTransparency = 1
		}
	)
	Ripple:Play()
	MainMouseRippler.ImageTransparency = 1
end)

Button.MouseButton1Down:Connect(function()
	SHOn:Play()
	DownRippleSize = Button.AbsoluteSize.Y * 0.35
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		DownRippleSize = Button.AbsoluteSize.X * 0.35
	end
	MainMouseRippler.Size = UDim2.new(0,DownRippleSize,0,DownRippleSize)
	MainMouseRippler.Position = MainMouseSH.Position
	MainMouseRippler.ImageTransparency = RipplerTransparency
	RippleSize = Button.AbsoluteSize.Y * 1.33
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		RippleSize = Button.AbsoluteSize.X * 1.33
	end
	Ripple = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			4.2, -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Size = UDim2.new(0,RippleSize,0,RippleSize);
			ImageTransparency = 1
		}
	)
	Ripple:Play()
	delay(1.752,function()
		MainMouseRippler.Size = UDim2.new(0,0,0,0)
	end)
end)
Button.MouseButton1Up:Connect(function()
	MainEnter:Play()
	--Ripple:Pause()
	--MainMouseRippler.Size = UDim2.new(0,0,0,0)
	--MainMouseRippler.ImageTransparency = 0.72
	local lastRippleSize = RippleSize
	RippleSize = Button.AbsoluteSize.Y * 1.33
	if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
		RippleSize = Button.AbsoluteSize.X * 1.33
	end
	RippleOut = TweenService:Create(
		MainMouseRippler,
		TweenInfo.new(
			1.28*(((RippleSize-MainMouseRippler.Size.X.Offset)/RippleSize)+0.5), -- time
			Enum.EasingStyle.Quint, -- style
			Enum.EasingDirection.Out, -- direction
			0,
			false,
			0
		),
		{ -- Properties
			Size = UDim2.new(0,RippleSize,0,RippleSize);
			ImageTransparency = 1
		}
	)
	RippleOut:Play()
end)
local Max = false
local Main = script.Parent.Parent.Parent.Parent
local Mainsize = Main.Size
local MainPos = Main.Position
local Show = Main.Parent.Show
function On()
	if Max then
		Mainsize = Main.Size
		MainPos = Main.Position
		if Show.Parent == Main.Parent then
			Main:TweenSizeAndPosition(UDim2.new(1,0,1,0),UDim2.new(0,0,0,0), "Out", "Quad", 0.15, true, nil)
		else
			Main:TweenSizeAndPosition(UDim2.new(1,0,1,-Show.AbsoluteSize.Y),UDim2.new(0,0,0,0), "Out", "Quad", 0.15, true, nil)
		end
		Main.Bar.drager.Visible = false
		Button.Back.Visible = true
		--Button.Front.Visible = true
	else
		Main:TweenSizeAndPosition(Mainsize,MainPos, "Out", "Quad", 0.15, true, nil)
		Main.Bar.drager.Visible = true
		Button.Back.Visible = false
		--Button.Front.Visible = false
	end
end
Button.MouseButton1Click:Connect(function()
	Max = not Max
end)
On()
end))
ImageLabel62.Parent = LocalScript61
ImageLabel62.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel62.Visible = false
ImageLabel62.Size = UDim2.new(0, 80, 0, 80)
ImageLabel62.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel62.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel62.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel62.BackgroundTransparency = 1
ImageLabel62.Image = "rbxassetid://3701386917"
ImageLabel62.ImageTransparency = 0.73000001907349
ImageLabel63.Name = "ShadowLabel"
ImageLabel63.Parent = LocalScript61
ImageLabel63.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel63.Visible = false
ImageLabel63.Size = UDim2.new(0, 80, 0, 80)
ImageLabel63.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel63.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel63.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel63.BackgroundTransparency = 1
ImageLabel63.Image = "rbxassetid://3701386917"
ImageLabel63.ImageTransparency = 0.85000002384186
ImageLabel64.Name = "Rippler"
ImageLabel64.Parent = LocalScript61
ImageLabel64.Position = UDim2.new(0.5, 0, 0.300000012, 0)
ImageLabel64.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel64.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel64.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel64.BackgroundTransparency = 1
ImageLabel64.Image = "rbxassetid://3701391885"
ImageLabel64.ImageTransparency = 0.81000000238419
Frame65.Name = "LButton"
Frame65.Parent = Frame15
Frame65.Position = UDim2.new(0, 1, 0, 0)
Frame65.Size = UDim2.new(0.5, -1, 1, 0)
Frame65.BackgroundColor = BrickColor.new("Institutional white")
Frame65.BackgroundColor3 = Color3.new(1, 1, 1)
Frame65.BackgroundTransparency = 1
Frame65.BorderSizePixel = 0
ImageLabel66.Name = "Icon"
ImageLabel66.Parent = Frame65
ImageLabel66.Rotation = 45
ImageLabel66.Size = UDim2.new(0, 20, 0, 20)
ImageLabel66.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel66.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel66.BackgroundTransparency = 1
ImageLabel66.BorderSizePixel = 0
ImageLabel66.Image = "http://www.roblox.com/asset/?id=5904200330"
ImageLabel66.ImageColor3 = Color3.new(0.176471, 0.176471, 0.176471)
TextLabel67.Name = "Title"
TextLabel67.Parent = Frame65
TextLabel67.Position = UDim2.new(0.140000001, 0, 0, 0)
TextLabel67.Size = UDim2.new(0.972920716, -21, 1, 0)
TextLabel67.BackgroundColor = BrickColor.new("Institutional white")
TextLabel67.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel67.BackgroundTransparency = 1
TextLabel67.BorderSizePixel = 0
TextLabel67.LayoutOrder = 1
TextLabel67.Font = Enum.Font.SourceSans
TextLabel67.FontSize = Enum.FontSize.Size14
TextLabel67.Text = "Sniper's Logger | ui by moistcr1tikal"
TextLabel67.TextColor = BrickColor.new("Institutional white")
TextLabel67.TextColor3 = Color3.new(1, 1, 1)
TextLabel67.TextSize = 14
TextLabel67.TextXAlignment = Enum.TextXAlignment.Left
Frame68.Name = "workspace"
Frame68.Parent = Frame1
Frame68.Position = UDim2.new(0, 0, 0, 22)
Frame68.Size = UDim2.new(1, 0, 1, -22)
Frame68.BackgroundColor = BrickColor.new("Black")
Frame68.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Frame68.BackgroundTransparency = 1
Frame68.BorderSizePixel = 0
Frame68.ClipsDescendants = true
Frame69.Name = "Shadow"
Frame69.Parent = Frame1
Frame69.Size = UDim2.new(1, 0, 1, 0)
Frame69.BackgroundColor = BrickColor.new("Institutional white")
Frame69.BackgroundColor3 = Color3.new(1, 1, 1)
Frame69.BackgroundTransparency = 1
Frame70.Name = "Shadow6"
Frame70.Parent = Frame69
Frame70.Size = UDim2.new(1, 0, 1, 0)
Frame70.BackgroundColor = BrickColor.new("Institutional white")
Frame70.BackgroundColor3 = Color3.new(1, 1, 1)
Frame70.BackgroundTransparency = 1
ImageLabel71.Name = "L"
ImageLabel71.Parent = Frame70
ImageLabel71.Size = UDim2.new(0, 6, 1, 0)
ImageLabel71.AnchorPoint = Vector2.new(1, 0)
ImageLabel71.BackgroundColor = BrickColor.new("Really black")
ImageLabel71.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel71.BackgroundTransparency = 1
ImageLabel71.BorderSizePixel = 0
ImageLabel71.Image = "rbxassetid://2715140280"
ImageLabel71.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel71.ImageTransparency = 0.80000001192093
ImageLabel72.Name = "R"
ImageLabel72.Parent = Frame70
ImageLabel72.Position = UDim2.new(1, 0, 0, 0)
ImageLabel72.Size = UDim2.new(0, 6, 1, 0)
ImageLabel72.BackgroundColor = BrickColor.new("Really black")
ImageLabel72.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel72.BackgroundTransparency = 1
ImageLabel72.BorderSizePixel = 0
ImageLabel72.Image = "rbxassetid://2715141619"
ImageLabel72.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel72.ImageTransparency = 0.80000001192093
ImageLabel73.Name = "T"
ImageLabel73.Parent = Frame70
ImageLabel73.Size = UDim2.new(1, 0, 0, 6)
ImageLabel73.AnchorPoint = Vector2.new(0, 1)
ImageLabel73.BackgroundColor = BrickColor.new("Really black")
ImageLabel73.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel73.BackgroundTransparency = 1
ImageLabel73.BorderSizePixel = 0
ImageLabel73.Image = "rbxassetid://2715138063"
ImageLabel73.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel73.ImageTransparency = 0.80000001192093
ImageLabel74.Name = "B"
ImageLabel74.Parent = Frame70
ImageLabel74.Position = UDim2.new(0, 0, 1, 0)
ImageLabel74.Size = UDim2.new(1, 0, 0, 6)
ImageLabel74.BackgroundColor = BrickColor.new("Really black")
ImageLabel74.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel74.BackgroundTransparency = 1
ImageLabel74.BorderSizePixel = 0
ImageLabel74.Image = "rbxassetid://2715137474"
ImageLabel74.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel74.ImageTransparency = 0.80000001192093
ImageLabel75.Name = "LB"
ImageLabel75.Parent = Frame70
ImageLabel75.Position = UDim2.new(0, 0, 1, 0)
ImageLabel75.Size = UDim2.new(0, 6, 0, 6)
ImageLabel75.AnchorPoint = Vector2.new(1, 0)
ImageLabel75.BackgroundColor = BrickColor.new("Really black")
ImageLabel75.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel75.BackgroundTransparency = 1
ImageLabel75.BorderSizePixel = 0
ImageLabel75.Image = "rbxassetid://2715199828"
ImageLabel75.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel75.ImageTransparency = 0.80000001192093
ImageLabel76.Name = "RB"
ImageLabel76.Parent = Frame70
ImageLabel76.Position = UDim2.new(1, 0, 1, 0)
ImageLabel76.Size = UDim2.new(0, 6, 0, 6)
ImageLabel76.BackgroundColor = BrickColor.new("Really black")
ImageLabel76.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel76.BackgroundTransparency = 1
ImageLabel76.BorderSizePixel = 0
ImageLabel76.Image = "rbxassetid://2715200973"
ImageLabel76.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel76.ImageTransparency = 0.80000001192093
ImageLabel77.Name = "RT"
ImageLabel77.Parent = Frame70
ImageLabel77.Position = UDim2.new(1, 0, 0, 0)
ImageLabel77.Size = UDim2.new(0, 6, 0, 6)
ImageLabel77.AnchorPoint = Vector2.new(0, 1)
ImageLabel77.BackgroundColor = BrickColor.new("Really black")
ImageLabel77.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel77.BackgroundTransparency = 1
ImageLabel77.BorderSizePixel = 0
ImageLabel77.Image = "rbxassetid://2715201545"
ImageLabel77.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel77.ImageTransparency = 0.80000001192093
ImageLabel78.Name = "LT"
ImageLabel78.Parent = Frame70
ImageLabel78.Size = UDim2.new(0, 6, 0, 6)
ImageLabel78.AnchorPoint = Vector2.new(1, 1)
ImageLabel78.BackgroundColor = BrickColor.new("Really black")
ImageLabel78.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel78.BackgroundTransparency = 1
ImageLabel78.BorderSizePixel = 0
ImageLabel78.Image = "rbxassetid://2715200507"
ImageLabel78.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel78.ImageTransparency = 0.80000001192093
Frame79.Name = "Shadow8"
Frame79.Parent = Frame69
Frame79.Size = UDim2.new(1, 0, 1, 0)
Frame79.BackgroundColor = BrickColor.new("Institutional white")
Frame79.BackgroundColor3 = Color3.new(1, 1, 1)
Frame79.BackgroundTransparency = 1
ImageLabel80.Name = "L"
ImageLabel80.Parent = Frame79
ImageLabel80.Size = UDim2.new(0, 8, 1, 0)
ImageLabel80.AnchorPoint = Vector2.new(1, 0)
ImageLabel80.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel80.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel80.BackgroundTransparency = 1
ImageLabel80.BorderSizePixel = 0
ImageLabel80.Image = "rbxassetid://2715140280"
ImageLabel80.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel80.ImageTransparency = 0.80000001192093
ImageLabel81.Name = "R"
ImageLabel81.Parent = Frame79
ImageLabel81.Position = UDim2.new(1, 0, 0, 0)
ImageLabel81.Size = UDim2.new(0, 8, 1, 0)
ImageLabel81.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel81.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel81.BackgroundTransparency = 1
ImageLabel81.BorderSizePixel = 0
ImageLabel81.Image = "rbxassetid://2715141619"
ImageLabel81.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel81.ImageTransparency = 0.80000001192093
ImageLabel82.Name = "T"
ImageLabel82.Parent = Frame79
ImageLabel82.Size = UDim2.new(1, 0, 0, 8)
ImageLabel82.AnchorPoint = Vector2.new(0, 1)
ImageLabel82.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel82.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel82.BackgroundTransparency = 1
ImageLabel82.BorderSizePixel = 0
ImageLabel82.Image = "rbxassetid://2715138063"
ImageLabel82.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel82.ImageTransparency = 0.80000001192093
ImageLabel83.Name = "B"
ImageLabel83.Parent = Frame79
ImageLabel83.Position = UDim2.new(0, 0, 1, 0)
ImageLabel83.Size = UDim2.new(1, 0, 0, 8)
ImageLabel83.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel83.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel83.BackgroundTransparency = 1
ImageLabel83.BorderSizePixel = 0
ImageLabel83.Image = "rbxassetid://2715137474"
ImageLabel83.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel83.ImageTransparency = 0.80000001192093
ImageLabel84.Name = "LB"
ImageLabel84.Parent = Frame79
ImageLabel84.Position = UDim2.new(0, 0, 1, 0)
ImageLabel84.Size = UDim2.new(0, 8, 0, 8)
ImageLabel84.AnchorPoint = Vector2.new(1, 0)
ImageLabel84.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel84.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel84.BackgroundTransparency = 1
ImageLabel84.BorderSizePixel = 0
ImageLabel84.Image = "rbxassetid://2715199828"
ImageLabel84.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel84.ImageTransparency = 0.80000001192093
ImageLabel85.Name = "RB"
ImageLabel85.Parent = Frame79
ImageLabel85.Position = UDim2.new(1, 0, 1, 0)
ImageLabel85.Size = UDim2.new(0, 8, 0, 8)
ImageLabel85.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel85.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel85.BackgroundTransparency = 1
ImageLabel85.BorderSizePixel = 0
ImageLabel85.Image = "rbxassetid://2715200973"
ImageLabel85.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel85.ImageTransparency = 0.80000001192093
ImageLabel86.Name = "RT"
ImageLabel86.Parent = Frame79
ImageLabel86.Position = UDim2.new(1, 0, 0, 0)
ImageLabel86.Size = UDim2.new(0, 8, 0, 8)
ImageLabel86.AnchorPoint = Vector2.new(0, 1)
ImageLabel86.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel86.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel86.BackgroundTransparency = 1
ImageLabel86.BorderSizePixel = 0
ImageLabel86.Image = "rbxassetid://2715201545"
ImageLabel86.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel86.ImageTransparency = 0.80000001192093
ImageLabel87.Name = "LT"
ImageLabel87.Parent = Frame79
ImageLabel87.Size = UDim2.new(0, 8, 0, 8)
ImageLabel87.AnchorPoint = Vector2.new(1, 1)
ImageLabel87.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel87.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel87.BackgroundTransparency = 1
ImageLabel87.BorderSizePixel = 0
ImageLabel87.Image = "rbxassetid://2715200507"
ImageLabel87.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel87.ImageTransparency = 0.80000001192093
Frame88.Name = "shadow4"
Frame88.Parent = Frame69
Frame88.Size = UDim2.new(1, 0, 1, 0)
Frame88.BackgroundColor = BrickColor.new("Institutional white")
Frame88.BackgroundColor3 = Color3.new(1, 1, 1)
Frame88.BackgroundTransparency = 1
ImageLabel89.Name = "L"
ImageLabel89.Parent = Frame88
ImageLabel89.Size = UDim2.new(0, 4, 1, 0)
ImageLabel89.AnchorPoint = Vector2.new(1, 0)
ImageLabel89.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel89.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel89.BackgroundTransparency = 1
ImageLabel89.BorderSizePixel = 0
ImageLabel89.Image = "rbxassetid://2715140280"
ImageLabel89.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel89.ImageTransparency = 0.80000001192093
ImageLabel90.Name = "R"
ImageLabel90.Parent = Frame88
ImageLabel90.Position = UDim2.new(1, 0, 0, 0)
ImageLabel90.Size = UDim2.new(0, 4, 1, 0)
ImageLabel90.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel90.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel90.BackgroundTransparency = 1
ImageLabel90.BorderSizePixel = 0
ImageLabel90.Image = "rbxassetid://2715141619"
ImageLabel90.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel90.ImageTransparency = 0.80000001192093
ImageLabel91.Name = "T"
ImageLabel91.Parent = Frame88
ImageLabel91.Size = UDim2.new(1, 0, 0, 4)
ImageLabel91.AnchorPoint = Vector2.new(0, 1)
ImageLabel91.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel91.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel91.BackgroundTransparency = 1
ImageLabel91.BorderSizePixel = 0
ImageLabel91.Image = "rbxassetid://2715138063"
ImageLabel91.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel91.ImageTransparency = 0.80000001192093
ImageLabel92.Name = "B"
ImageLabel92.Parent = Frame88
ImageLabel92.Position = UDim2.new(0, 0, 1, 0)
ImageLabel92.Size = UDim2.new(1, 0, 0, 4)
ImageLabel92.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel92.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel92.BackgroundTransparency = 1
ImageLabel92.BorderSizePixel = 0
ImageLabel92.Image = "rbxassetid://2715137474"
ImageLabel92.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel92.ImageTransparency = 0.80000001192093
ImageLabel93.Name = "LB"
ImageLabel93.Parent = Frame88
ImageLabel93.Position = UDim2.new(0, 0, 1, 0)
ImageLabel93.Size = UDim2.new(0, 4, 0, 4)
ImageLabel93.AnchorPoint = Vector2.new(1, 0)
ImageLabel93.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel93.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel93.BackgroundTransparency = 1
ImageLabel93.BorderSizePixel = 0
ImageLabel93.Image = "rbxassetid://2715199828"
ImageLabel93.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel93.ImageTransparency = 0.80000001192093
ImageLabel94.Name = "RB"
ImageLabel94.Parent = Frame88
ImageLabel94.Position = UDim2.new(1, 0, 1, 0)
ImageLabel94.Size = UDim2.new(0, 4, 0, 4)
ImageLabel94.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel94.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel94.BackgroundTransparency = 1
ImageLabel94.BorderSizePixel = 0
ImageLabel94.Image = "rbxassetid://2715200973"
ImageLabel94.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel94.ImageTransparency = 0.80000001192093
ImageLabel95.Name = "RT"
ImageLabel95.Parent = Frame88
ImageLabel95.Position = UDim2.new(1, 0, 0, 0)
ImageLabel95.Size = UDim2.new(0, 4, 0, 4)
ImageLabel95.AnchorPoint = Vector2.new(0, 1)
ImageLabel95.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel95.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel95.BackgroundTransparency = 1
ImageLabel95.BorderSizePixel = 0
ImageLabel95.Image = "rbxassetid://2715201545"
ImageLabel95.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel95.ImageTransparency = 0.80000001192093
ImageLabel96.Name = "LT"
ImageLabel96.Parent = Frame88
ImageLabel96.Size = UDim2.new(0, 4, 0, 4)
ImageLabel96.AnchorPoint = Vector2.new(1, 1)
ImageLabel96.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel96.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel96.BackgroundTransparency = 1
ImageLabel96.BorderSizePixel = 0
ImageLabel96.Image = "rbxassetid://2715200507"
ImageLabel96.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel96.ImageTransparency = 0.80000001192093
Frame97.Name = "OutLine"
Frame97.Parent = Frame1
Frame97.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame97.Visible = false
Frame97.Size = UDim2.new(1, 2, 1, 2)
Frame97.AnchorPoint = Vector2.new(0.5, 0.5)
Frame97.BackgroundColor = BrickColor.new("Institutional white")
Frame97.BackgroundColor3 = Color3.new(1, 1, 1)
Frame97.BackgroundTransparency = 1
Frame97.ZIndex = 0
Frame98.Parent = Frame97
Frame98.Size = UDim2.new(0, 1, 1, 0)
Frame98.BackgroundColor = BrickColor.new("Dark taupe")
Frame98.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
Frame98.BorderSizePixel = 0
Frame99.Parent = Frame97
Frame99.Position = UDim2.new(1, -1, 0, 0)
Frame99.Size = UDim2.new(0, 1, 1, 0)
Frame99.BackgroundColor = BrickColor.new("Dark taupe")
Frame99.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
Frame99.BorderSizePixel = 0
Frame100.Parent = Frame97
Frame100.Size = UDim2.new(1, 0, 0, 1)
Frame100.BackgroundColor = BrickColor.new("Dark taupe")
Frame100.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
Frame100.BorderSizePixel = 0
Frame101.Parent = Frame97
Frame101.Position = UDim2.new(0, 0, 1, -1)
Frame101.Size = UDim2.new(1, 0, 0, 1)
Frame101.BackgroundColor = BrickColor.new("Dark taupe")
Frame101.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
Frame101.BorderSizePixel = 0
LocalScript102.Name = "OutLine"
LocalScript102.Parent = Frame97
table.insert(cors,sandbox(LocalScript102,function()
local Gui = script.Parent.Parent.Parent
local OutLine = script.Parent
Gui.Changed:Connect(function()
	if Gui.DisplayOrder == 1 then
		OutLine.Visible = false
	end
	if Gui.DisplayOrder == 2 or Gui.DisplayOrder == 3 then
		OutLine.Visible = true
	end
end)
end))
Frame103.Name = "PointShadow"
Frame103.Parent = Frame97
Frame103.Size = UDim2.new(1, 0, 1, 0)
Frame103.BackgroundColor = BrickColor.new("Institutional white")
Frame103.BackgroundColor3 = Color3.new(1, 1, 1)
Frame103.BackgroundTransparency = 1
Frame103.BorderSizePixel = 0
Frame104.Name = "Shadow10"
Frame104.Parent = Frame103
Frame104.Visible = false
Frame104.Size = UDim2.new(1, 0, 1, 0)
Frame104.BackgroundColor = BrickColor.new("Institutional white")
Frame104.BackgroundColor3 = Color3.new(1, 1, 1)
Frame104.BackgroundTransparency = 1
ImageLabel105.Name = "L"
ImageLabel105.Parent = Frame104
ImageLabel105.Size = UDim2.new(0, 10, 1, 0)
ImageLabel105.AnchorPoint = Vector2.new(1, 0)
ImageLabel105.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel105.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel105.BackgroundTransparency = 1
ImageLabel105.BorderSizePixel = 0
ImageLabel105.Image = "rbxassetid://2715140280"
ImageLabel105.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel105.ImageTransparency = 0.75
ImageLabel106.Name = "R"
ImageLabel106.Parent = Frame104
ImageLabel106.Position = UDim2.new(1, 0, 0, 0)
ImageLabel106.Size = UDim2.new(0, 10, 1, 0)
ImageLabel106.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel106.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel106.BackgroundTransparency = 1
ImageLabel106.BorderSizePixel = 0
ImageLabel106.Image = "rbxassetid://2715141619"
ImageLabel106.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel106.ImageTransparency = 0.75
ImageLabel107.Name = "T"
ImageLabel107.Parent = Frame104
ImageLabel107.Size = UDim2.new(1, 0, 0, 10)
ImageLabel107.AnchorPoint = Vector2.new(0, 1)
ImageLabel107.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel107.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel107.BackgroundTransparency = 1
ImageLabel107.BorderSizePixel = 0
ImageLabel107.Image = "rbxassetid://2715138063"
ImageLabel107.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel107.ImageTransparency = 0.75
ImageLabel108.Name = "B"
ImageLabel108.Parent = Frame104
ImageLabel108.Position = UDim2.new(0, 0, 1, 0)
ImageLabel108.Size = UDim2.new(1, 0, 0, 10)
ImageLabel108.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel108.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel108.BackgroundTransparency = 1
ImageLabel108.BorderSizePixel = 0
ImageLabel108.Image = "rbxassetid://2715137474"
ImageLabel108.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel108.ImageTransparency = 0.75
ImageLabel109.Name = "LB"
ImageLabel109.Parent = Frame104
ImageLabel109.Position = UDim2.new(0, 0, 1, 0)
ImageLabel109.Size = UDim2.new(0, 10, 0, 10)
ImageLabel109.AnchorPoint = Vector2.new(1, 0)
ImageLabel109.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel109.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel109.BackgroundTransparency = 1
ImageLabel109.BorderSizePixel = 0
ImageLabel109.Image = "rbxassetid://2715199828"
ImageLabel109.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel109.ImageTransparency = 0.75
ImageLabel110.Name = "RB"
ImageLabel110.Parent = Frame104
ImageLabel110.Position = UDim2.new(1, 0, 1, 0)
ImageLabel110.Size = UDim2.new(0, 10, 0, 10)
ImageLabel110.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel110.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel110.BackgroundTransparency = 1
ImageLabel110.BorderSizePixel = 0
ImageLabel110.Image = "rbxassetid://2715200973"
ImageLabel110.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel110.ImageTransparency = 0.75
ImageLabel111.Name = "RT"
ImageLabel111.Parent = Frame104
ImageLabel111.Position = UDim2.new(1, 0, 0, 0)
ImageLabel111.Size = UDim2.new(0, 10, 0, 10)
ImageLabel111.AnchorPoint = Vector2.new(0, 1)
ImageLabel111.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel111.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel111.BackgroundTransparency = 1
ImageLabel111.BorderSizePixel = 0
ImageLabel111.Image = "rbxassetid://2715201545"
ImageLabel111.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel111.ImageTransparency = 0.75
ImageLabel112.Name = "LT"
ImageLabel112.Parent = Frame104
ImageLabel112.Size = UDim2.new(0, 10, 0, 10)
ImageLabel112.AnchorPoint = Vector2.new(1, 1)
ImageLabel112.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel112.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel112.BackgroundTransparency = 1
ImageLabel112.BorderSizePixel = 0
ImageLabel112.Image = "rbxassetid://2715200507"
ImageLabel112.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel112.ImageTransparency = 0.75
Frame113.Name = "Shadow6"
Frame113.Parent = Frame103
Frame113.Size = UDim2.new(1, 0, 1, 0)
Frame113.BackgroundColor = BrickColor.new("Institutional white")
Frame113.BackgroundColor3 = Color3.new(1, 1, 1)
Frame113.BackgroundTransparency = 1
ImageLabel114.Name = "L"
ImageLabel114.Parent = Frame113
ImageLabel114.Size = UDim2.new(0, 6, 1, 0)
ImageLabel114.AnchorPoint = Vector2.new(1, 0)
ImageLabel114.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel114.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel114.BackgroundTransparency = 1
ImageLabel114.BorderSizePixel = 0
ImageLabel114.Image = "rbxassetid://2715140280"
ImageLabel114.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel114.ImageTransparency = 0.80000001192093
ImageLabel115.Name = "R"
ImageLabel115.Parent = Frame113
ImageLabel115.Position = UDim2.new(1, 0, 0, 0)
ImageLabel115.Size = UDim2.new(0, 6, 1, 0)
ImageLabel115.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel115.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel115.BackgroundTransparency = 1
ImageLabel115.BorderSizePixel = 0
ImageLabel115.Image = "rbxassetid://2715141619"
ImageLabel115.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel115.ImageTransparency = 0.80000001192093
ImageLabel116.Name = "T"
ImageLabel116.Parent = Frame113
ImageLabel116.Size = UDim2.new(1, 0, 0, 6)
ImageLabel116.AnchorPoint = Vector2.new(0, 1)
ImageLabel116.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel116.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel116.BackgroundTransparency = 1
ImageLabel116.BorderSizePixel = 0
ImageLabel116.Image = "rbxassetid://2715138063"
ImageLabel116.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel116.ImageTransparency = 0.80000001192093
ImageLabel117.Name = "B"
ImageLabel117.Parent = Frame113
ImageLabel117.Position = UDim2.new(0, 0, 1, 0)
ImageLabel117.Size = UDim2.new(1, 0, 0, 6)
ImageLabel117.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel117.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel117.BackgroundTransparency = 1
ImageLabel117.BorderSizePixel = 0
ImageLabel117.Image = "rbxassetid://2715137474"
ImageLabel117.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel117.ImageTransparency = 0.80000001192093
ImageLabel118.Name = "LB"
ImageLabel118.Parent = Frame113
ImageLabel118.Position = UDim2.new(0, 0, 1, 0)
ImageLabel118.Size = UDim2.new(0, 6, 0, 6)
ImageLabel118.AnchorPoint = Vector2.new(1, 0)
ImageLabel118.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel118.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel118.BackgroundTransparency = 1
ImageLabel118.BorderSizePixel = 0
ImageLabel118.Image = "rbxassetid://2715199828"
ImageLabel118.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel118.ImageTransparency = 0.80000001192093
ImageLabel119.Name = "RB"
ImageLabel119.Parent = Frame113
ImageLabel119.Position = UDim2.new(1, 0, 1, 0)
ImageLabel119.Size = UDim2.new(0, 6, 0, 6)
ImageLabel119.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel119.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel119.BackgroundTransparency = 1
ImageLabel119.BorderSizePixel = 0
ImageLabel119.Image = "rbxassetid://2715200973"
ImageLabel119.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel119.ImageTransparency = 0.80000001192093
ImageLabel120.Name = "RT"
ImageLabel120.Parent = Frame113
ImageLabel120.Position = UDim2.new(1, 0, 0, 0)
ImageLabel120.Size = UDim2.new(0, 6, 0, 6)
ImageLabel120.AnchorPoint = Vector2.new(0, 1)
ImageLabel120.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel120.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel120.BackgroundTransparency = 1
ImageLabel120.BorderSizePixel = 0
ImageLabel120.Image = "rbxassetid://2715201545"
ImageLabel120.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel120.ImageTransparency = 0.80000001192093
ImageLabel121.Name = "LT"
ImageLabel121.Parent = Frame113
ImageLabel121.Size = UDim2.new(0, 6, 0, 6)
ImageLabel121.AnchorPoint = Vector2.new(1, 1)
ImageLabel121.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel121.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel121.BackgroundTransparency = 1
ImageLabel121.BorderSizePixel = 0
ImageLabel121.Image = "rbxassetid://2715200507"
ImageLabel121.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel121.ImageTransparency = 0.80000001192093
Frame122.Name = "Shadow8"
Frame122.Parent = Frame103
Frame122.Visible = false
Frame122.Size = UDim2.new(1, 0, 1, 0)
Frame122.BackgroundColor = BrickColor.new("Institutional white")
Frame122.BackgroundColor3 = Color3.new(1, 1, 1)
Frame122.BackgroundTransparency = 1
ImageLabel123.Name = "L"
ImageLabel123.Parent = Frame122
ImageLabel123.Size = UDim2.new(0, 8, 1, 0)
ImageLabel123.AnchorPoint = Vector2.new(1, 0)
ImageLabel123.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel123.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel123.BackgroundTransparency = 1
ImageLabel123.BorderSizePixel = 0
ImageLabel123.Image = "rbxassetid://2715140280"
ImageLabel123.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel123.ImageTransparency = 0.80000001192093
ImageLabel124.Name = "R"
ImageLabel124.Parent = Frame122
ImageLabel124.Position = UDim2.new(1, 0, 0, 0)
ImageLabel124.Size = UDim2.new(0, 8, 1, 0)
ImageLabel124.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel124.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel124.BackgroundTransparency = 1
ImageLabel124.BorderSizePixel = 0
ImageLabel124.Image = "rbxassetid://2715141619"
ImageLabel124.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel124.ImageTransparency = 0.80000001192093
ImageLabel125.Name = "T"
ImageLabel125.Parent = Frame122
ImageLabel125.Size = UDim2.new(1, 0, 0, 8)
ImageLabel125.AnchorPoint = Vector2.new(0, 1)
ImageLabel125.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel125.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel125.BackgroundTransparency = 1
ImageLabel125.BorderSizePixel = 0
ImageLabel125.Image = "rbxassetid://2715138063"
ImageLabel125.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel125.ImageTransparency = 0.80000001192093
ImageLabel126.Name = "B"
ImageLabel126.Parent = Frame122
ImageLabel126.Position = UDim2.new(0, 0, 1, 0)
ImageLabel126.Size = UDim2.new(1, 0, 0, 8)
ImageLabel126.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel126.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel126.BackgroundTransparency = 1
ImageLabel126.BorderSizePixel = 0
ImageLabel126.Image = "rbxassetid://2715137474"
ImageLabel126.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel126.ImageTransparency = 0.80000001192093
ImageLabel127.Name = "LB"
ImageLabel127.Parent = Frame122
ImageLabel127.Position = UDim2.new(0, 0, 1, 0)
ImageLabel127.Size = UDim2.new(0, 8, 0, 8)
ImageLabel127.AnchorPoint = Vector2.new(1, 0)
ImageLabel127.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel127.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel127.BackgroundTransparency = 1
ImageLabel127.BorderSizePixel = 0
ImageLabel127.Image = "rbxassetid://2715199828"
ImageLabel127.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel127.ImageTransparency = 0.80000001192093
ImageLabel128.Name = "RB"
ImageLabel128.Parent = Frame122
ImageLabel128.Position = UDim2.new(1, 0, 1, 0)
ImageLabel128.Size = UDim2.new(0, 8, 0, 8)
ImageLabel128.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel128.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel128.BackgroundTransparency = 1
ImageLabel128.BorderSizePixel = 0
ImageLabel128.Image = "rbxassetid://2715200973"
ImageLabel128.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel128.ImageTransparency = 0.80000001192093
ImageLabel129.Name = "RT"
ImageLabel129.Parent = Frame122
ImageLabel129.Position = UDim2.new(1, 0, 0, 0)
ImageLabel129.Size = UDim2.new(0, 8, 0, 8)
ImageLabel129.AnchorPoint = Vector2.new(0, 1)
ImageLabel129.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel129.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel129.BackgroundTransparency = 1
ImageLabel129.BorderSizePixel = 0
ImageLabel129.Image = "rbxassetid://2715201545"
ImageLabel129.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel129.ImageTransparency = 0.80000001192093
ImageLabel130.Name = "LT"
ImageLabel130.Parent = Frame122
ImageLabel130.Size = UDim2.new(0, 8, 0, 8)
ImageLabel130.AnchorPoint = Vector2.new(1, 1)
ImageLabel130.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel130.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel130.BackgroundTransparency = 1
ImageLabel130.BorderSizePixel = 0
ImageLabel130.Image = "rbxassetid://2715200507"
ImageLabel130.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel130.ImageTransparency = 0.80000001192093
Frame131.Name = "shadow4"
Frame131.Parent = Frame103
Frame131.Visible = false
Frame131.Size = UDim2.new(1, 0, 1, 0)
Frame131.BackgroundColor = BrickColor.new("Institutional white")
Frame131.BackgroundColor3 = Color3.new(1, 1, 1)
Frame131.BackgroundTransparency = 1
ImageLabel132.Name = "L"
ImageLabel132.Parent = Frame131
ImageLabel132.Size = UDim2.new(0, 4, 1, 0)
ImageLabel132.AnchorPoint = Vector2.new(1, 0)
ImageLabel132.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel132.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel132.BackgroundTransparency = 1
ImageLabel132.BorderSizePixel = 0
ImageLabel132.Image = "rbxassetid://2715140280"
ImageLabel132.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel132.ImageTransparency = 0.80000001192093
ImageLabel133.Name = "R"
ImageLabel133.Parent = Frame131
ImageLabel133.Position = UDim2.new(1, 0, 0, 0)
ImageLabel133.Size = UDim2.new(0, 4, 1, 0)
ImageLabel133.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel133.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel133.BackgroundTransparency = 1
ImageLabel133.BorderSizePixel = 0
ImageLabel133.Image = "rbxassetid://2715141619"
ImageLabel133.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel133.ImageTransparency = 0.80000001192093
ImageLabel134.Name = "T"
ImageLabel134.Parent = Frame131
ImageLabel134.Size = UDim2.new(1, 0, 0, 4)
ImageLabel134.AnchorPoint = Vector2.new(0, 1)
ImageLabel134.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel134.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel134.BackgroundTransparency = 1
ImageLabel134.BorderSizePixel = 0
ImageLabel134.Image = "rbxassetid://2715138063"
ImageLabel134.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel134.ImageTransparency = 0.80000001192093
ImageLabel135.Name = "B"
ImageLabel135.Parent = Frame131
ImageLabel135.Position = UDim2.new(0, 0, 1, 0)
ImageLabel135.Size = UDim2.new(1, 0, 0, 4)
ImageLabel135.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel135.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel135.BackgroundTransparency = 1
ImageLabel135.BorderSizePixel = 0
ImageLabel135.Image = "rbxassetid://2715137474"
ImageLabel135.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel135.ImageTransparency = 0.80000001192093
ImageLabel136.Name = "LB"
ImageLabel136.Parent = Frame131
ImageLabel136.Position = UDim2.new(0, 0, 1, 0)
ImageLabel136.Size = UDim2.new(0, 4, 0, 4)
ImageLabel136.AnchorPoint = Vector2.new(1, 0)
ImageLabel136.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel136.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel136.BackgroundTransparency = 1
ImageLabel136.BorderSizePixel = 0
ImageLabel136.Image = "rbxassetid://2715199828"
ImageLabel136.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel136.ImageTransparency = 0.80000001192093
ImageLabel137.Name = "RB"
ImageLabel137.Parent = Frame131
ImageLabel137.Position = UDim2.new(1, 0, 1, 0)
ImageLabel137.Size = UDim2.new(0, 4, 0, 4)
ImageLabel137.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel137.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel137.BackgroundTransparency = 1
ImageLabel137.BorderSizePixel = 0
ImageLabel137.Image = "rbxassetid://2715200973"
ImageLabel137.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel137.ImageTransparency = 0.80000001192093
ImageLabel138.Name = "RT"
ImageLabel138.Parent = Frame131
ImageLabel138.Position = UDim2.new(1, 0, 0, 0)
ImageLabel138.Size = UDim2.new(0, 4, 0, 4)
ImageLabel138.AnchorPoint = Vector2.new(0, 1)
ImageLabel138.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel138.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel138.BackgroundTransparency = 1
ImageLabel138.BorderSizePixel = 0
ImageLabel138.Image = "rbxassetid://2715201545"
ImageLabel138.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel138.ImageTransparency = 0.80000001192093
ImageLabel139.Name = "LT"
ImageLabel139.Parent = Frame131
ImageLabel139.Size = UDim2.new(0, 4, 0, 4)
ImageLabel139.AnchorPoint = Vector2.new(1, 1)
ImageLabel139.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel139.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel139.BackgroundTransparency = 1
ImageLabel139.BorderSizePixel = 0
ImageLabel139.Image = "rbxassetid://2715200507"
ImageLabel139.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel139.ImageTransparency = 0.80000001192093
Frame140.Name = "Chat"
Frame140.Parent = Frame1
Frame140.Position = UDim2.new(0.5, 0, 0.970000029, 0)
Frame140.Size = UDim2.new(0.980000019, 0, 0.850000024, 0)
Frame140.AnchorPoint = Vector2.new(0.5, 1)
Frame140.BackgroundColor = BrickColor.new("Black")
Frame140.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
Frame140.BorderColor = BrickColor.new("Dark taupe")
Frame140.BorderColor3 = Color3.new(0.294118, 0.294118, 0.294118)
Frame140.ClipsDescendants = true
ScrollingFrame141.Parent = Frame140
ScrollingFrame141.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame141.Active = true
ScrollingFrame141.BackgroundColor = BrickColor.new("Institutional white")
ScrollingFrame141.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame141.BackgroundTransparency = 1
ScrollingFrame141.CanvasSize = UDim2.new(0, 0, 0, 0)
UIListLayout142.Parent = ScrollingFrame141
UIListLayout142.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout142.VerticalAlignment = Enum.VerticalAlignment.Bottom
Frame143.Parent = Frame140
Frame143.Position = UDim2.new(1.29999995, 0, 0, 5)
Frame143.Size = UDim2.new(0, 100, 0, 24)
Frame143.AnchorPoint = Vector2.new(1, 0)
Frame143.BackgroundColor = BrickColor.new("Institutional white")
Frame143.BackgroundColor3 = Color3.new(1, 1, 1)
Frame143.BackgroundTransparency = 1
TextButton144.Name = "OptionsButton"
TextButton144.Parent = Frame143
TextButton144.Position = UDim2.new(-0.0500000007, 0, 0, 0)
TextButton144.Size = UDim2.new(0, 24, 0, 24)
TextButton144.AnchorPoint = Vector2.new(1, 0)
TextButton144.BackgroundTransparency = 1
TextButton144.ZIndex = 2
TextButton144.Text = ""
ImageLabel145.Name = "Image"
ImageLabel145.Parent = TextButton144
ImageLabel145.Size = UDim2.new(1, 0, 1, 0)
ImageLabel145.BackgroundTransparency = 1
ImageLabel145.ZIndex = 2
ImageLabel145.Image = "https://www.roblox.com/asset/?id=261882463"
TextBox146.Name = "ContainsFilter"
TextBox146.Parent = Frame143
TextBox146.Position = UDim2.new(0, 0, 1, 0)
TextBox146.Size = UDim2.new(1, 0, 0, 24)
TextBox146.BackgroundColor = BrickColor.new("Really black")
TextBox146.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TextBox146.BackgroundTransparency = 0.5
TextBox146.BorderSizePixel = 0
TextBox146.ZIndex = 2
TextBox146.Font = Enum.Font.SourceSans
TextBox146.FontSize = Enum.FontSize.Size18
TextBox146.Text = ""
TextBox146.TextColor = BrickColor.new("Institutional white")
TextBox146.TextColor3 = Color3.new(1, 1, 1)
TextBox146.TextSize = 18
TextBox146.TextTruncate = Enum.TextTruncate.AtEnd
TextBox146.TextXAlignment = Enum.TextXAlignment.Left
TextBox146.PlaceholderText = "FilterName"
Frame147.Name = "Command Msg"
Frame147.Parent = Frame143
Frame147.Position = UDim2.new(1, 0, 0, 0)
Frame147.Size = UDim2.new(0, 24, 0, 24)
Frame147.Active = true
Frame147.AnchorPoint = Vector2.new(1, 0)
Frame147.BackgroundColor = BrickColor.new("Really red")
Frame147.BackgroundColor3 = Color3.new(1, 0, 0)
Frame147.BackgroundTransparency = 1
Frame147.ZIndex = 2
TextButton148.Name = "Button"
TextButton148.Parent = Frame147
TextButton148.Position = UDim2.new(0, 2, 0, 2)
TextButton148.Size = UDim2.new(1, -4, 1, -4)
TextButton148.BackgroundColor = BrickColor.new("Really black")
TextButton148.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TextButton148.BackgroundTransparency = 0.5
TextButton148.BorderSizePixel = 0
TextButton148.ZIndex = 2
TextButton148.Text = ""
Frame149.Name = "Check"
Frame149.Parent = TextButton148
Frame149.Position = UDim2.new(0, 4, 0, 4)
Frame149.Size = UDim2.new(1, -8, 1, -8)
Frame149.BackgroundColor = BrickColor.new("Really red")
Frame149.BackgroundColor3 = Color3.new(1, 0, 0)
Frame149.BorderSizePixel = 0
Frame149.ZIndex = 2
Frame150.Name = "Border"
Frame150.Parent = Frame147
Frame150.Size = UDim2.new(1, 0, 0, 2)
Frame150.BackgroundColor = BrickColor.new("Really red")
Frame150.BackgroundColor3 = Color3.new(1, 0, 0)
Frame150.BorderSizePixel = 0
Frame150.ZIndex = 2
Frame151.Name = "Border"
Frame151.Parent = Frame147
Frame151.Size = UDim2.new(0, 2, 1, 0)
Frame151.BackgroundColor = BrickColor.new("Really red")
Frame151.BackgroundColor3 = Color3.new(1, 0, 0)
Frame151.BorderSizePixel = 0
Frame151.ZIndex = 2
Frame152.Name = "Border"
Frame152.Parent = Frame147
Frame152.Position = UDim2.new(0, 0, 1, -2)
Frame152.Size = UDim2.new(1, 0, 0, 2)
Frame152.BackgroundColor = BrickColor.new("Really red")
Frame152.BackgroundColor3 = Color3.new(1, 0, 0)
Frame152.BorderSizePixel = 0
Frame152.ZIndex = 2
Frame153.Name = "Border"
Frame153.Parent = Frame147
Frame153.Position = UDim2.new(1, -2, 0, 0)
Frame153.Size = UDim2.new(0, 2, 1, 0)
Frame153.BackgroundColor = BrickColor.new("Really red")
Frame153.BackgroundColor3 = Color3.new(1, 0, 0)
Frame153.BorderSizePixel = 0
Frame153.ZIndex = 2
Frame154.Name = "Player Log"
Frame154.Parent = Frame143
Frame154.Position = UDim2.new(0.75, 0, 0, 0)
Frame154.Size = UDim2.new(0, 24, 0, 24)
Frame154.AnchorPoint = Vector2.new(1, 0)
Frame154.BackgroundColor = BrickColor.new("Medium orange")
Frame154.BackgroundColor3 = Color3.new(1, 0.6, 0.4)
Frame154.BackgroundTransparency = 1
Frame154.ZIndex = 2
TextButton155.Name = "Button"
TextButton155.Parent = Frame154
TextButton155.Position = UDim2.new(0, 2, 0, 2)
TextButton155.Size = UDim2.new(1, -4, 1, -4)
TextButton155.BackgroundColor = BrickColor.new("Really black")
TextButton155.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TextButton155.BackgroundTransparency = 0.5
TextButton155.BorderSizePixel = 0
TextButton155.ZIndex = 2
TextButton155.Text = ""
Frame156.Name = "Check"
Frame156.Parent = TextButton155
Frame156.Position = UDim2.new(0, 4, 0, 4)
Frame156.Size = UDim2.new(1, -8, 1, -8)
Frame156.BackgroundColor = BrickColor.new("Medium orange")
Frame156.BackgroundColor3 = Color3.new(1, 0.6, 0.4)
Frame156.BorderSizePixel = 0
Frame156.ZIndex = 2
Frame157.Name = "Border"
Frame157.Parent = Frame154
Frame157.Position = UDim2.new(1, -2, 0, 0)
Frame157.Size = UDim2.new(0, 2, 1, 0)
Frame157.BackgroundColor = BrickColor.new("Medium orange")
Frame157.BackgroundColor3 = Color3.new(1, 0.6, 0.4)
Frame157.BorderSizePixel = 0
Frame157.ZIndex = 2
Frame158.Name = "Border"
Frame158.Parent = Frame154
Frame158.Size = UDim2.new(0, 2, 1, 0)
Frame158.BackgroundColor = BrickColor.new("Medium orange")
Frame158.BackgroundColor3 = Color3.new(1, 0.6, 0.4)
Frame158.BorderSizePixel = 0
Frame158.ZIndex = 2
Frame159.Name = "Border"
Frame159.Parent = Frame154
Frame159.Position = UDim2.new(0, 0, 1, -2)
Frame159.Size = UDim2.new(1, 0, 0, 2)
Frame159.BackgroundColor = BrickColor.new("Medium orange")
Frame159.BackgroundColor3 = Color3.new(1, 0.6, 0.4)
Frame159.BorderSizePixel = 0
Frame159.ZIndex = 2
Frame160.Name = "Border"
Frame160.Parent = Frame154
Frame160.Size = UDim2.new(1, 0, 0, 2)
Frame160.BackgroundColor = BrickColor.new("Medium orange")
Frame160.BackgroundColor3 = Color3.new(1, 0.6, 0.4)
Frame160.BorderSizePixel = 0
Frame160.ZIndex = 2
Frame161.Name = "Normal Msg"
Frame161.Parent = Frame143
Frame161.Size = UDim2.new(0, 24, 0, 24)
Frame161.BackgroundColor = BrickColor.new("Institutional white")
Frame161.BackgroundColor3 = Color3.new(1, 1, 1)
Frame161.BackgroundTransparency = 1
Frame161.ZIndex = 2
TextButton162.Name = "Button"
TextButton162.Parent = Frame161
TextButton162.Position = UDim2.new(0, 2, 0, 2)
TextButton162.Size = UDim2.new(1, -4, 1, -4)
TextButton162.BackgroundColor = BrickColor.new("Really black")
TextButton162.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TextButton162.BackgroundTransparency = 0.5
TextButton162.BorderSizePixel = 0
TextButton162.ZIndex = 2
TextButton162.Text = ""
Frame163.Name = "Check"
Frame163.Parent = TextButton162
Frame163.Position = UDim2.new(0, 4, 0, 4)
Frame163.Size = UDim2.new(1, -8, 1, -8)
Frame163.BackgroundColor = BrickColor.new("Institutional white")
Frame163.BackgroundColor3 = Color3.new(1, 1, 1)
Frame163.BorderSizePixel = 0
Frame163.ZIndex = 2
Frame164.Name = "Border"
Frame164.Parent = Frame161
Frame164.Position = UDim2.new(1, -2, 0, 0)
Frame164.Size = UDim2.new(0, 2, 1, 0)
Frame164.BackgroundColor = BrickColor.new("Institutional white")
Frame164.BackgroundColor3 = Color3.new(1, 1, 1)
Frame164.BorderSizePixel = 0
Frame164.ZIndex = 2
Frame165.Name = "Border"
Frame165.Parent = Frame161
Frame165.Size = UDim2.new(0, 2, 1, 0)
Frame165.BackgroundColor = BrickColor.new("Institutional white")
Frame165.BackgroundColor3 = Color3.new(1, 1, 1)
Frame165.BorderSizePixel = 0
Frame165.ZIndex = 2
Frame166.Name = "Border"
Frame166.Parent = Frame161
Frame166.Position = UDim2.new(0, 0, 1, -2)
Frame166.Size = UDim2.new(1, 0, 0, 2)
Frame166.BackgroundColor = BrickColor.new("Institutional white")
Frame166.BackgroundColor3 = Color3.new(1, 1, 1)
Frame166.BorderSizePixel = 0
Frame166.ZIndex = 2
Frame167.Name = "Border"
Frame167.Parent = Frame161
Frame167.Size = UDim2.new(1, 0, 0, 2)
Frame167.BackgroundColor = BrickColor.new("Institutional white")
Frame167.BackgroundColor3 = Color3.new(1, 1, 1)
Frame167.BorderSizePixel = 0
Frame167.ZIndex = 2
Frame168.Name = "Whisper Msg"
Frame168.Parent = Frame143
Frame168.Position = UDim2.new(0.25, 0, 0, 0)
Frame168.Size = UDim2.new(0, 24, 0, 24)
Frame168.BackgroundColor = BrickColor.new("Alder")
Frame168.BackgroundColor3 = Color3.new(0.4, 0.498039, 1)
Frame168.BackgroundTransparency = 1
Frame168.ZIndex = 2
TextButton169.Name = "Button"
TextButton169.Parent = Frame168
TextButton169.Position = UDim2.new(0, 2, 0, 2)
TextButton169.Size = UDim2.new(1, -4, 1, -4)
TextButton169.BackgroundColor = BrickColor.new("Really black")
TextButton169.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TextButton169.BackgroundTransparency = 0.5
TextButton169.BorderSizePixel = 0
TextButton169.ZIndex = 2
TextButton169.Text = ""
Frame170.Name = "Check"
Frame170.Parent = TextButton169
Frame170.Position = UDim2.new(0, 4, 0, 4)
Frame170.Size = UDim2.new(1, -8, 1, -8)
Frame170.BackgroundColor = BrickColor.new("Alder")
Frame170.BackgroundColor3 = Color3.new(0.4, 0.5, 1)
Frame170.BorderSizePixel = 0
Frame170.ZIndex = 2
Frame171.Name = "Border"
Frame171.Parent = Frame168
Frame171.Size = UDim2.new(0, 2, 1, 0)
Frame171.BackgroundColor = BrickColor.new("Alder")
Frame171.BackgroundColor3 = Color3.new(0.4, 0.5, 1)
Frame171.BorderSizePixel = 0
Frame171.ZIndex = 2
Frame172.Name = "Border"
Frame172.Parent = Frame168
Frame172.Size = UDim2.new(1, 0, 0, 2)
Frame172.BackgroundColor = BrickColor.new("Alder")
Frame172.BackgroundColor3 = Color3.new(0.4, 0.5, 1)
Frame172.BorderSizePixel = 0
Frame172.ZIndex = 2
Frame173.Name = "Border"
Frame173.Parent = Frame168
Frame173.Position = UDim2.new(1, -2, 0, 0)
Frame173.Size = UDim2.new(0, 2, 1, 0)
Frame173.BackgroundColor = BrickColor.new("Alder")
Frame173.BackgroundColor3 = Color3.new(0.4, 0.5, 1)
Frame173.BorderSizePixel = 0
Frame173.ZIndex = 2
Frame174.Name = "Border"
Frame174.Parent = Frame168
Frame174.Position = UDim2.new(0, 0, 1, -2)
Frame174.Size = UDim2.new(1, 0, 0, 2)
Frame174.BackgroundColor = BrickColor.new("Alder")
Frame174.BackgroundColor3 = Color3.new(0.4, 0.5, 1)
Frame174.BorderSizePixel = 0
Frame174.ZIndex = 2
LocalScript175.Parent = Frame140
table.insert(cors,sandbox(LocalScript175,function()
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
--
local CMDMSGCOLOR = Color3.fromRGB(255, 0, 0)
local NMSGCOLOR = Color3.fromRGB(255, 255, 255)
local PLRLOGCOLOR = Color3.fromRGB(255, 153, 102)
local WHISPERCOLOR = Frame168.BackgroundColor3 --Color3.fromRGB(102, 126, 255)
local layoutorder = 1
local msgs = {}
--
local function createmessage(txt,plr,dacolor)
	local newtitle = script.Title:Clone()
	newtitle.LayoutOrder = layoutorder
	layoutorder = layoutorder + 1
	newtitle.TextColor3 = dacolor
	newtitle.Text = txt
	newtitle.Visible = true
	newtitle.Parent = script.Parent.ScrollingFrame
	newtitle.Parent.CanvasSize = newtitle.Parent.CanvasSize + UDim2.new(0,0,0,newtitle.Size.Y.Offset)
	newtitle.Transparency = 1
	local tweenInfo = TweenInfo.new(
		0.2, --Time
		Enum.EasingStyle.Quad, --EasingStyle
		Enum.EasingDirection.In, --EasingDirection
		0, --Repeat count
		false, --Reverses if true
		0 --Delay time
	)
	local tween = game:GetService("TweenService"):Create(newtitle, tweenInfo, {TextTransparency = 0})
	tween:Play()	
	table.insert(msgs,{
		newtitle,
		plr.Name
	})
end
local function CreateSignal()
	local this = {}

	local mBindableEvent = Instance.new('BindableEvent')
	local mAllCns = {} --all connection objects returned by mBindableEvent::connect

	--main functions
	function this:connect(func)
		if self ~= this then error("connect must be called with `:`, not `.`", 2) end
		if type(func) ~= 'function' then
			error("Argument #1 of connect must be a function, got a "..type(func), 2)
		end
		local cn = mBindableEvent.Event:Connect(func)
		mAllCns[cn] = true
		local pubCn = {}
		function pubCn:disconnect()
			cn:Disconnect()
			mAllCns[cn] = nil
		end
		pubCn.Disconnect = pubCn.disconnect

		return pubCn
	end

	function this:disconnect()
		if self ~= this then error("disconnect must be called with `:`, not `.`", 2) end
		for cn, _ in pairs(mAllCns) do
			cn:Disconnect()
			mAllCns[cn] = nil
		end
	end

	function this:wait()
		if self ~= this then error("wait must be called with `:`, not `.`", 2) end
		return mBindableEvent.Event:Wait()
	end

	function this:fire(...)
		if self ~= this then error("fire must be called with `:`, not `.`", 2) end
		mBindableEvent:Fire(...)
	end

	this.Connect = this.connect
	this.Disconnect = this.disconnect
	this.Wait = this.wait
	this.Fire = this.fire

	return this
end
local CreateDisconnectSignal; do
	local Methods = {}
	local Metatable = {__index = Methods}
	function Methods.fire(this, ...)
		return this.Signal:fire(...)
	end
	function Methods.wait(this, ...)
		return this.Signal:wait(...)
	end
	function Methods.connect(this, func)
		local t = type(func)
		if t == 'table' or t == 'userdata' then
			-- Got event listener
			local listener = func
			function func()
				listener:disconnect()
			end
		elseif t ~= 'function' then
			error('Invalid disconnect method type: ' .. t, 2)
		end

		local listener;
		listener = this.Signal:connect(function(...)
			if listener then
				listener:disconnect()
				listener = nil
				func(...)
			end
		end)
		return listener
	end
	function CreateDisconnectSignal()
		return setmetatable({
			Signal = CreateSignal();
		}, Metatable)
	end
end
--
local function onChatted(p,msg)
	msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
	local dacolor
	local togglebutton = false
	if string.sub(msg,1,2) == "/e" or string.sub(msg,1,2) == "/w" or string.sub(msg,1,2) == "/t" then
		dacolor = WHISPERCOLOR
	elseif string.sub(msg,1,1) == ":" or  string.sub(msg,1,1) == ";" or string.sub(msg,1,1) == "!" then
		dacolor = CMDMSGCOLOR
	else
			dacolor = NMSGCOLOR
	end
--										print(p.Name)
	createmessage(" " .. ("[" .. p.Name .. "]: " .. msg),p,dacolor)
--		privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
--		StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
end
wait(0.2)
for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
	if script.Parent.Frame["Player Log"].Button.Check.Visible == true then
		createmessage(" " .. p.Name .. " has joined",p.Name,PLRLOGCOLOR)
	end
end)

for i,v in pairs(script.Parent.Frame:GetChildren()) do
	if v:IsA("Frame") then
		v.Button.MouseButton1Click:Connect(function()
			v.Button.Check.Visible = not v.Button.Check.Visible
			for _,g in pairs(script.Parent.ScrollingFrame:GetChildren()) do
				if g:IsA("TextLabel") and g.TextColor3 == v.BackgroundColor3 then
					g.Visible = v.Button.Check.Visible
				end
			end
		end)
	end
end
local open = true
local disconnector = CreateDisconnectSignal()
local RenderLerpAnimation; do
	local math_cos = math.cos
	local math_pi = math.pi
	function RenderLerpAnimation(disconnectSignal, length, callback)
		disconnectSignal:fire()
		local timeStamp = tick()
		local listener = game:GetService("RunService").RenderStepped:connect(function()
			local t = (tick() - timeStamp) / length
			if t >= 1 then
				t = 1
				disconnectSignal:fire()
			else
				t = (1 - math_cos(t * math_pi)) / 2 -- cosine interpolation aka 'Sine' in :TweenSizeAndPosition
			end
			callback(t)
		end)
		disconnectSignal:connect(listener)
		return listener
	end
end
local gearRotation0 = script.Parent.Frame.OptionsButton.Image.Rotation
local gearRotation1 = script.Parent.Frame.OptionsButton.Image.Rotation - 90
script.Parent.Frame.OptionsButton.MouseButton1Click:Connect(function()
	open = not open
	if open then
		script.Parent.Frame:TweenPosition(
			UDim2.new(1.3, 0, 0, 5),-- -Style.OptionAreaHeight),
			'Out', 'Sine', 0.5, true
		)
		local gearRotation = script.Parent.Frame.OptionsButton.Image.Rotation
		RenderLerpAnimation(disconnector, 0.5, function(t)
			script.Parent.Frame.OptionsButton.Image.Rotation = gearRotation1 * t + gearRotation * (1 - t)
		end)
	else
		script.Parent.Frame:TweenPosition(
			UDim2.new(1, 0, 0, 5),
			'Out', 'Sine', 0.5, true
		)
		local gearRotation = script.Parent.Frame.OptionsButton.Image.Rotation
		RenderLerpAnimation(disconnector, 0.5, function(t)
			script.Parent.Frame.OptionsButton.Image.Rotation = gearRotation0 * t + gearRotation * (1 - t)
		end)
	end
end)
local function getPlayersByName(name)
	local found = {}
	for i,v in pairs(Players:GetChildren()) do
		if string.sub(string.lower(v.Name),1,#name) == string.lower(name) then
			table.insert(found,{v,name})
		end
	end
	return found
end
local function checkforany(msgname,list)
	for i,v in pairs(list) do
		if string.lower(v[2]) == string.sub(string.lower(msgname),1,#v[2]) then
			return true
		end 
	end
end
script.Parent.Frame.ContainsFilter:GetPropertyChangedSignal("Text"):Connect(function()
	for i,v in pairs(msgs) do
		if checkforany(v[2],getPlayersByName(script.Parent.Frame.ContainsFilter.Text)) then
			v[1].Visible = true
		elseif script.Parent.Frame.ContainsFilter.Text == "" then
			v[1].Visible = true
		else
			v[1].Visible = false
		end
	end
end)
end))
TextLabel176.Name = "Title"
TextLabel176.Parent = LocalScript175
TextLabel176.Position = UDim2.new(0.140000001, 0, 0, 0)
TextLabel176.Visible = false
TextLabel176.Size = UDim2.new(1, 0, 0, 15)
TextLabel176.BackgroundColor = BrickColor.new("Institutional white")
TextLabel176.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel176.BackgroundTransparency = 1
TextLabel176.BorderSizePixel = 0
TextLabel176.LayoutOrder = 1
TextLabel176.Font = Enum.Font.SourceSans
TextLabel176.FontSize = Enum.FontSize.Size14
TextLabel176.Text = " Player2 has left"
TextLabel176.TextColor = BrickColor.new("Medium orange")
TextLabel176.TextColor3 = Color3.new(1, 0.6, 0.4)
TextLabel176.TextSize = 14
TextLabel176.TextXAlignment = Enum.TextXAlignment.Left
TextButton177.Name = "Show"
TextButton177.Parent = ScreenGui0
TextButton177.Visible = false
TextButton177.Size = UDim2.new(0, 31, 0, 31)
TextButton177.BackgroundColor = BrickColor.new("Black metallic")
TextButton177.BackgroundColor3 = Color3.new(0.133333, 0.133333, 0.133333)
TextButton177.BorderSizePixel = 0
TextButton177.ZIndex = 2
TextButton177.AutoButtonColor = false
TextButton177.Font = Enum.Font.SourceSans
TextButton177.FontSize = Enum.FontSize.Size14
TextButton177.Text = ""
TextButton177.TextColor = BrickColor.new("Institutional white")
TextButton177.TextColor3 = Color3.new(1, 1, 1)
TextButton177.TextSize = 13
TextButton177.TextTransparency = 1
TextButton177.TextWrap = true
TextButton177.TextWrapped = true
LocalScript178.Name = "Open"
LocalScript178.Parent = TextButton177
table.insert(cors,sandbox(LocalScript178,function()
local Show = script.Parent
local gui = Show.Parent
Show.TextFrame.Text = gui.Main.Bar.LButton.Title.Text
if gui.Main.Bar.LButton.Icon.Image ~= "rbxassetid://924320031" and gui.Main.Bar.LButton.Icon.Image ~= "" then
	Show.TextFrame.Visible = false
	Show.Ico.Visible = true
	Show.Ico.Image = gui.Main.Bar.LButton.Icon.Image
end
Show.MouseButton2Click:Connect(function()
	if gui.Main.Visible == true then
		return
	end
	local a = gui.Main.Size
	gui.Main.Size = Show.Size
	
	gui.Main:TweenSize(a,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true,nil)
	gui.Main.Visible = true
	if Show.Parent == gui then
	gui.Main.Position = Show.Position
	Show.Visible = false
	end
	--Show.Dragble = true
end)
Show.MouseButton1Down:Connect(function()
	if Show.Parent ~= gui and Show.Parent.Name == "WindowTask" then
		if gui.Main.Visible == true then
			return
		end
		local a = gui.Main.Size
		gui.Main.Size = Show.Size
		gui.Main:TweenSize(a,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true,nil)
		gui.Main.Visible = true		
		--Show.Dragble = true
	end
end)
Show.Changed:Connect(function()
	wait(0.2)
	if Show.Position.X.Offset < 0 then
		Show.Position = UDim2.new(Show.Position.X.Scale,0,Show.Position.Y.Scale,Show.Position.Y.Offset)
	end
end)
gui.AncestryChanged:Connect(function(_, parent)
	if not parent then
		Show:Destroy()
	end
end)
function guiChanged()
	if Show.Parent ~= gui then
		if gui.Enabled then
			Show.Visible = true
		else
			Show.Visible = false
		end
		if gui.DisplayOrder ~= 2 then
			Show.Off.Visible = true
		end
		Show.OutLine.Visible = false
	else
		Show.OutLine.Visible = true
	end
end gui.Changed:Connect(guiChanged)
gui:GetPropertyChangedSignal("DisplayOrder"):Connect(function()
	if gui.AutoDisplayOrder.Disabled == true then
		return
	end
	if Show.Parent ~= gui then
		if gui.DisplayOrder == 2 then
			Show.Back.BackgroundTransparency = 0.83
			Show.On.Visible = true
			Show.Off.Visible = false
		else
			Show.Back.BackgroundTransparency = 1
			Show.On.Visible = false
			Show.Off.Visible = true
		end
	end
end)
gui.Main:GetPropertyChangedSignal("Visible"):Connect(function()
	if Show.Parent ~= gui then
		if gui.Main.Visible == false then
			Show.Back.BackgroundTransparency = 1
		end
	end
end)
wait(1)
guiChanged()
--gui:GetPropertyChangedSignal("Enabled"):Connect(function()
--	if Show.Parent ~= gui then
--		if gui.Enabled then
--			Show.Back.BackgroundTransparency = 0.8
--		else
--			Show.Back.BackgroundTransparency = 1
--		end
--	end
--end)
end))
Frame179.Name = "OutLine"
Frame179.Parent = TextButton177
Frame179.Size = UDim2.new(1, 0, 1, 0)
Frame179.BackgroundColor = BrickColor.new("Institutional white")
Frame179.BackgroundColor3 = Color3.new(1, 1, 1)
Frame179.BackgroundTransparency = 1
Frame179.BorderSizePixel = 0
Frame179.ZIndex = 0
Frame180.Name = "L"
Frame180.Parent = Frame179
Frame180.Size = UDim2.new(0, 1, 1, 0)
Frame180.BackgroundColor = BrickColor.new("Really black")
Frame180.BackgroundColor3 = Color3.new(0, 0, 0)
Frame180.BackgroundTransparency = 0.80000001192093
Frame180.BorderSizePixel = 0
Frame180.ZIndex = 2
Frame181.Name = "R"
Frame181.Parent = Frame179
Frame181.Position = UDim2.new(1, 0, 0, 0)
Frame181.Size = UDim2.new(0, 1, 1, 0)
Frame181.AnchorPoint = Vector2.new(1, 0)
Frame181.BackgroundColor = BrickColor.new("Really black")
Frame181.BackgroundColor3 = Color3.new(0, 0, 0)
Frame181.BackgroundTransparency = 0.80000001192093
Frame181.BorderSizePixel = 0
Frame181.ZIndex = 2
Frame182.Name = "T"
Frame182.Parent = Frame179
Frame182.Position = UDim2.new(0, 1, 0, 0)
Frame182.Size = UDim2.new(1, -2, 0, 1)
Frame182.BackgroundColor = BrickColor.new("Really black")
Frame182.BackgroundColor3 = Color3.new(0, 0, 0)
Frame182.BackgroundTransparency = 0.80000001192093
Frame182.BorderSizePixel = 0
Frame182.ZIndex = 2
Frame183.Name = "T"
Frame183.Parent = Frame179
Frame183.Position = UDim2.new(0, 1, 1, 0)
Frame183.Size = UDim2.new(1, -2, 0, 1)
Frame183.AnchorPoint = Vector2.new(0, 1)
Frame183.BackgroundColor = BrickColor.new("Really black")
Frame183.BackgroundColor3 = Color3.new(0, 0, 0)
Frame183.BackgroundTransparency = 0.80000001192093
Frame183.BorderSizePixel = 0
Frame183.ZIndex = 2
LocalScript184.Name = "Move"
LocalScript184.Parent = TextButton177
table.insert(cors,sandbox(LocalScript184,function()
local drager = script.Parent
local dragObject = script.Parent

local Releaser = Instance.new("TextButton",drager)
Releaser.Text = ""
Releaser.Name = "Releaser"
Releaser.Size = UDim2.new(1,6500,1,6500)
Releaser.Position = UDim2.new(0.5,0,0.5,0)
Releaser.AnchorPoint = Vector2.new(0.5,0.5)
Releaser.BackgroundTransparency = 1
Releaser.Visible = false

local MouseDownPosition = nil
Releaser.MouseMoved:Connect(function(x,y)
	if MouseDownPosition == nil then
		Releaser.Visible = false
	else
		local position = UDim2.new(0,x-MouseDownPosition.X,0,y-MouseDownPosition.Y)
		wait(0.1)
		dragObject.Position = position
	end
end)
Releaser.MouseButton1Up:Connect(function()
	MouseDownPosition = nil
	Releaser.Visible = false
end)
drager.MouseButton1Up:Connect(function()
	MouseDownPosition = nil
	Releaser.Visible = false
end)

drager.MouseButton1Down:Connect(function(x,y)
	MouseDownPosition = Vector2.new(x-drager.AbsolutePosition.X,y-drager.AbsolutePosition.Y)
	Releaser.Visible = true
end)

drager.MouseButton2Up:Connect(function()
	MouseDownPosition = nil
end)
end))
Frame185.Name = "Back"
Frame185.Parent = TextButton177
Frame185.Size = UDim2.new(1, 0, 1, 0)
Frame185.BackgroundColor = BrickColor.new("Institutional white")
Frame185.BackgroundColor3 = Color3.new(1, 1, 1)
Frame185.BackgroundTransparency = 1
Frame185.BorderSizePixel = 0
TextLabel186.Name = "TextFrame"
TextLabel186.Parent = TextButton177
TextLabel186.Size = UDim2.new(1, 0, 1, 0)
TextLabel186.BackgroundColor = BrickColor.new("Institutional white")
TextLabel186.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel186.BackgroundTransparency = 1
TextLabel186.BorderSizePixel = 0
TextLabel186.ZIndex = 2
TextLabel186.Font = Enum.Font.SourceSans
TextLabel186.FontSize = Enum.FontSize.Size14
TextLabel186.Text = "Open"
TextLabel186.TextColor = BrickColor.new("Institutional white")
TextLabel186.TextColor3 = Color3.new(1, 1, 1)
TextLabel186.TextSize = 14
TextLabel186.TextWrap = true
TextLabel186.TextWrapped = true
ImageLabel187.Name = "Ico"
ImageLabel187.Parent = TextButton177
ImageLabel187.Visible = false
ImageLabel187.Size = UDim2.new(1, 0, 1, 0)
ImageLabel187.BackgroundColor = BrickColor.new("Institutional white")
ImageLabel187.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel187.BackgroundTransparency = 1
ImageLabel187.BorderSizePixel = 0
ImageLabel187.ZIndex = 2
ImageLabel187.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Frame188.Name = "On"
Frame188.Parent = TextButton177
Frame188.Position = UDim2.new(0.5, 0, 1, 0)
Frame188.Visible = false
Frame188.Size = UDim2.new(1, 0, 0, 2)
Frame188.AnchorPoint = Vector2.new(0.5, 1)
Frame188.BackgroundColor = BrickColor.new("Cyan")
Frame188.BackgroundColor3 = Color3.new(0.184314, 0.580392, 1)
Frame188.BorderSizePixel = 0
Frame189.Name = "Off"
Frame189.Parent = TextButton177
Frame189.Position = UDim2.new(0.5, 0, 1, 0)
Frame189.Visible = false
Frame189.Size = UDim2.new(0.699999988, 0, 0, 2)
Frame189.AnchorPoint = Vector2.new(0.5, 1)
Frame189.BackgroundColor = BrickColor.new("Cyan")
Frame189.BackgroundColor3 = Color3.new(0.184314, 0.580392, 1)
Frame189.BorderSizePixel = 0
LocalScript190.Name = "AutoDisplayOrder"
LocalScript190.Parent = ScreenGui0
table.insert(cors,sandbox(LocalScript190,function()
local Show = script.Parent.Show
local Mouse = game.Players.LocalPlayer:GetMouse()
local MouseOn = false
local Main = script.Parent.Main
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(Key, GameProcessedEvent)
	--if Key.KeyCode ~= Enum.KeyCode.Unknown then
	--	return
	--end
	if Key.UserInputType == Enum.UserInputType.MouseButton1 or Key.UserInputType == Enum.UserInputType.MouseButton2 then
		if MouseOn then
			script.Parent.DisplayOrder = 2
		else
			script.Parent.DisplayOrder = 1
		end
	end
end)

Mouse.Button1Down:Connect(function()
	if MouseOn then
		script.Parent.DisplayOrder = 2
	else
		script.Parent.DisplayOrder = 1
	end
end)
Show.MouseButton1Down:Connect(function()
	--print(Show.Parent ~= script.Parent)
	if Show.Parent ~= script.Parent then
		script.Parent.DisplayOrder = 2
		MouseOn = true
		wait()
		MouseOn = false
	end
end)
Main.Bar.drager.MouseButton1Down:Connect(function() script.Parent.DisplayOrder = 2 MouseOn = true end)
Main.Bar.RButton.Max.MouseButton1Click:Connect(function() script.Parent.DisplayOrder = 2 MouseOn = true end)
Main.MouseEnter:Connect(function() MouseOn = true end)
Main.MouseLeave:Connect(function() MouseOn = false end)

end))
StringValue191.Name = "MTL_Class"
StringValue191.Parent = ScreenGui0
StringValue191.Value = "Window"
ModuleScript192.Name = "PropertiesData"
ModuleScript192.Parent = StringValue191
table.insert(cors,sandbox(ModuleScript192,function()
local Main = script.Parent.Parent.Main

local Properties = {
	GetPropertiesDataModuleRoot = function()
		return script
	end;
	PropertieName = {
		Properties = {
			"ClassName";
			"Parent";
			"Name";
			"AbsolutePosition";
			"AbsoluteSize";
			"AnchorPoint";
			"Enabled";
			"Visible";
			"Size";
			"Position";
			"BackgroundColor3";
			"AnimateColor";
			"BarColor";
			"BlurBackground";
			"Window_Title";
			"Window_TitleVisible";
			"Window_Icon";
			"Window_IconVisible";
			"Window_CanResize";
			"Window_CanClose";
			"Window_CanMini";
			"Window_CanMax";
			"Window_AutoDisplayOrder";
			"Window_DestroyOnClose";
			"Window_CanOpen";
			"Window_CanTask";
			"Window_MinX";
			"Window_MinY";
			"Window_Max";
		};
		Event = {
			
		};
	};
	PropertieType = {
		ClassName="string";
		Parent="Instance";
		Name="string";
		AbsolutePosition="Vector2"; 
		AbsoluteSize="Vector2";
		AnchorPoint="Vector2";
		Enabled="boolean";
		Visible="boolean";
		Size="UDim2";
		Position="UDim2";
		BackgroundColor3="Color3";
		AnimateColor="Color3";
		BarColor="Color3";
		BlurBackground="boolean";
		Window_Title="string";
		Window_TitleVisible="boolean";
		Window_Icon="string";
		Window_IconVisible="boolean";
		Window_CanResize="boolean";
		Window_CanClose="boolean";
		Window_CanMini="boolean";
		Window_CanMax="boolean";
		Window_AutoDisplayOrder="boolean";
		Window_DestroyOnClose="boolean";
		Window_CanOpen="boolean";
		Window_CanTask="boolean";
		Window_MinX="number";
		Window_MinY="number";
		Window_Max="boolean";
	};
	ReadOnry = {
		"ClassName";
		"AbsolutePosition";
		"AbsoluteSize";
	};
	ClassName = function()
		return script.Parent.Value -- Read Onry data
	end;
	Parent = function(Value)
		if Value == nil then
			return Main.Parent --Read
		else
			Main.Parent = Value --write
		end
	end;
	Name = function(Value)
		if Value == nil then
			return Main.Parent.Name
		else
			Main.Parent.Name = Value
		end
	end;
	AbsolutePosition = function(Value)
		return Main.AbsolutePosition
	end;
	AbsoluteSize = function(Value)
		return Main.AbsoluteSize
	end;
	AnchorPoint = function(Value)
		if Value == nil then
			return Main.AnchorPoint
		else
			Main.AnchorPoint = Value
		end
	end;
	Enabled = function(Value)
		if Value == nil then
			return Main.Parent.Enabled
		else
			Main.Parent.Enabled = Value
		end
	end;
	Visible = function(Value)
		if Value == nil then
			return Main.Visible
		else
			Main.Visible = Value
		end
	end;
	Size = function(Value)
		if Value == nil then
			return Main.Size
		else
			Main.Size = Value
		end
	end;
	Position = function(Value)
		if Value == nil then
			return Main.Position
		else
			Main.Position = Value
		end
	end;
	BackgroundColor3 = function(Value)
		if Value == nil then
			return Main.BackgroundColor3
		else
			Main.BackgroundColor3 = Value
		end
	end;
	AnimateColor = function(Value)
		if Value == nil then
			return Main.Parent.Show.BackgroundColor3
		else
			Main.Parent.Show.BackgroundColor3 = Value
		end
	end;
	BarColor = function(Value)
		if Value == nil then
			return Main.Bar.BackgroundColor3
		else
			Main.Bar.BackgroundColor3 = Value
		end
	end;
	BlurBackground = function(Value)
		if Value == nil then
			return not Main.BlurScreen3D.Disabled
		else
			Main.BlurScreen3D.Disabled = not Value
		end
	end;
	Window_Title = function(Value)
		if Value == nil then
			return Main.Bar.LButton.Title.Text
		else
			Main.Bar.LButton.Title.Text = Value
		end
	end;
	Window_TitleVisible = function(Value)
		if Value == nil then
			return Main.Bar.LButton.Title.Visible
		else
			Main.Bar.LButton.Title.Visible = Value
		end
	end;
	Window_Icon = function(Value)
		if Value == nil then
			return Main.Bar.LButton.Icon.Image
		else
			Main.Bar.LButton.Icon.Image = Value
		end
	end;
	Window_IconVisible = function(Value)
		if Value == nil then
			return Main.Bar.LButton.Icon.Visible
		else
			Main.Bar.LButton.Icon.Visible = Value
		end
	end;
	Window_CanClose = function(Value)
		if Value == nil then
			return Main.Bar.RButton.Close.Visible
		else
			Main.Bar.RButton.Close.Visible = Value
		end
	end;
	Window_CanMini = function(Value)
		if Value == nil then
			return Main.Bar.RButton.Mini.Visible
		else
			Main.Bar.RButton.Mini.Visible = Value
		end
	end;
	Window_CanMax = function(Value)
		if Value == nil then
			return Main.Bar.RButton.Max.Visible
		else
			Main.Bar.RButton.Max.Visible = Value
		end
	end;
	Window_AutoDisplayOrder = function(Value)
		if Value == nil then
			return not (Main.Parent.AutoDisplayOrder.Disabled)
		else
			Main.Parent.AutoDisplayOrder.Disabled = not (Value)
			if Value then
				script.Parent.Parent.DisplayOrder = 1
			else
				script.Parent.Parent.DisplayOrder = 3
			end
		end
	end;
	Window_DestroyOnClose = function(Value)
		if Value == nil then
			return Main.Parent.DestroyOnClose.Value
		else
			Main.Parent.DestroyOnClose.Value = (Value)
		end
	end;
	Window_CanOpen = function(Value)
		if Value == nil then
			return Main.Parent.CanOpen.Value
		else
			Main.Parent.CanOpen.Value = (Value)
		end
	end;
	Window_CanTask = function(Value)
		if Value == nil then
			return Main.Parent.CanTask.Value
		else
			Main.Parent.CanTask.Value = (Value)
		end
	end;
	Window_MinX = function(Value)
		if Value == nil then
			return Main.Resize.MinX.Value
		else
			Main.Resize.MinX.Value = (Value)
		end
	end;
	Window_MinY = function(Value)
		if Value == nil then
			return Main.Resize.MinY.Value
		else
			Main.Resize.MinY.Value = (Value)
		end
	end;
	Window_Max = function(Value)
		if Value == nil then
			return Main.Parent.Max.Value
		else
			Main.Parent.Max.Value = (Value)
		end
	end;
	Window_CanResize = function(Value)
		if Value == nil then
			return Main.Resize.Visible
		else
			Main.Resize.Visible = (Value)
		end
	end;
}
return Properties

end))
BoolValue193.Name = "CanTask"
BoolValue193.Parent = ScreenGui0
BoolValue193.Value = true
for i,v in pairs(mas:GetChildren()) do
	v.Parent = workspace
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
