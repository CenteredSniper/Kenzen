--R15 Release
local notify = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/notificationstuff/main/src.lua",true))()
local wait = fwait or task.wait
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

if getgenv().Preload == nil then getgenv().Preload = false end
if getgenv().PreloadWait == nil then getgenv().PreloadWait = 0.1 end
if getgenv().Reanimate == nil then getgenv().Reanimate = true end

local Files = loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/R15AnimationsIndex.lua",true))()--game:GetObjects("rbxassetid://9353862873")[1]
if getgenv().Preload then
	local GUI = Instance.new("ScreenGui")
	local TextLabel = Instance.new("TextLabel")

	GUI.DisplayOrder = 9999
	GUI.ResetOnSpawn = false

	TextLabel.BackgroundTransparency = 1
	TextLabel.ZIndex = 999
	TextLabel.Position = UDim2.new(0.375, 0,0.021, 0)
	TextLabel.Font = Enum.Font.PermanentMarker
	TextLabel.TextScaled = true
	TextLabel.Text = "Loading Animations"

	TextLabel.Parent = GUI
	GUI.Parent = game.CoreGui
	local LoadAmount,NumberToLoad = 0,#Files
	for i,v in pairs(Files) do
		if getgenv().PreloadWait > (1/60) then
			wait(getgenv().PreloadWait)
		end
		task.spawn(function()
			local AnimationID = v[1]
			if v[2] ~= "" then
				local soundwait = Instance.new("Sound",game.Players.LocalPlayer)
				soundwait.SoundId = v[3] and getsynassetfromurl(v[3],v[1]) or v[2]
				task.spawn(function()
					soundwait.Loaded:Wait()
					soundwait:Destroy()    
				end)
			end
			if AnimationID then
				pcall(function()
					game:GetObjects('rbxassetid://'..v[1])
				end)
			end

			loadamount = loadamount + 1
			print(loadamount,NumberToLoad)
		end)
	end
	repeat wait(0/1) until loadamount == NumberToLoad
	GUI:Destroy()
end

if getgenv().Reanimate then
	getgenv().AutoAnimate = false
	getgenv().R6 = false
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/ZendeyReanimate.lua", true))()
	wait(0/1)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/AnimZR15.lua",true))()

for i,v in pairs(Files) do
	local Tool = Instance.new("Tool")
	Tool.CanBeDropped = false
	Tool.RequiresHandle = false
	Tool.Name = not v[3] and v[2] == "" and "(NS) " .. i or i
	Tool.Parent = game.Players.LocalPlayer.Backpack
	local ToolPlaying = false
	Tool.Activated:Connect(function()
		if getgenv().RunAnimation then
			local SoundID = v[3] and getsynassetfromurl(v[3],v[1]) or v[2]
			ToolPlaying = true
			getgenv().RunAnimation(v[1],SoundID)
		end
	end)
	Tool.Unequipped:Connect(function()
		if ToolPlaying then
			ToolPlaying = false
			getgenv().RunAnimation()
		end
	end)
	wait(0/1)
end
