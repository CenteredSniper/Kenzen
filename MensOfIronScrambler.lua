-- _G.PaintBrickcolors
local dacolor = Color3.new(0.262745, 0.137255, 0.0196078)

local function shfghgfsdhgfsdhfgsdhfd(obj, prop)
	return ({pcall(function()if(typeof(obj[prop])=="Instance")then error()end end)})[1]
end

local function check4property(obj)
	return shfghgfsdhgfsdhfgsdhfd(obj,"Color")
end

local function colorobj(obj)
  local randomvalue = math.random(1,#_G.PaintBrickcolors)
  colorcheck(_G.PaintBrickcolors[randomvalue])
	if check4property(obj) then
		local ohTable1 = {
			["Part"] = obj,
			["Request"] = "Paint",
			["Color"] = dacolor
		}
		player.Character.Paint.RemoteEvent:FireServer(ohTable1)
	end
end

local function transformToColor3(col) --Function to convert, just cuz c;
	local r = col.r --Red value
	local g = col.g --Green value
	local b = col.b --Blue value
	return Color3.new(r,g,b); --Color3 datatype, made of the RGB inputs
end

local function colorcheck(name)
	if BrickColor.new(name) then
		dacolor = transformToColor3(BrickColor.new(name))
  else
    dacolor = Color3.new(0.262745, 0.137255, 0.0196078)
	end
end 

local function checkforpaint()
	if player.Character:FindFirstChild("Paint") == nil and player.Backpack:FindFirstChild("Paint") then
		player.Character.Humanoid:EquipTool(player.Backpack:WaitForChild("Paint"))
		return true
	elseif player.Character:FindFirstChild("Paint") then
		return true
	else
		return false
	end
end

local function partialmap()
--	checkforpaint()
	if checkforpaint() then
		for i,v in pairs(workspace.MapParts:GetChildren()) do
			colorobj(v)
		end
	end
end

partialmap()
