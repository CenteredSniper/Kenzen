local Global = getgenv and getgenv() or shared or _G

local Settings = Global.ToolDancesSettings or {
	Preload = false,
	PreloadWait = true,
	Reanimate = true,
	R15 = false,
	GetObjectsPatch = false,
}

Global.HookGetObjects = Settings.GetObjectsPatch; do
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/GetObjectsPatcher.lua",true))()
end
	
local notify = Global.ErrorNotify or loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/extra/Notifications.lua",true))()
local Encode = Global.Encoding or loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/EncodeAnimation.lua",true))()
local fwait = fwait or task.wait
local cloneref = cloneref or function(ref) return ref end
local sethiddenproperty = sethiddenproperty or sethiddenprop; 

local Players = cloneref(game:GetService("Players"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local LocalPlayer = getlocalplayer and getlocalplayer() or Players.LocalPlayer
local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack") or LocalPlayer:WaitForChild("Backpack")

local function getsynassetfromurl(URL, Name)
	if isfolder and not isfolder("FakeAudios") then makefolder("FakeAudios") end
	Name = "FakeAudios/"..Name..".ogg"
	local getsynasset, request = getsynasset or getcustomasset, (syn and syn.request) or (http and http.request) or (request)
	if getsynasset and request then
		if isfile(Name) then
			return getsynasset(Name)
		else
			local NameSplit = string.split(URL,"/"); notify({
				Text = "Downloading: "..NameSplit[#NameSplit],
				Duration = 3
			})
			pcall(function()
				writefile(Name, request({Url = URL, Method = 'GET'}).Body)
			end)
			return isfile(Name) and getsynasset(Name)
		end
	end
end

local Files = loadstring(game:HttpGet(Settings.R15 and "https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/R15AnimationsIndex.lua" or "https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/AnimationsIndex.lua", true))()

if Settings.Preload then
	local LoadAmount, Amount = 0, #Files

	local GUI, TextLabel = cloneref(Instance.new("ScreenGui")), nil; do
		GUI.ResetOnSpawn = false
		GUI.DisplayOrder = 10000

		if syn and not gethui then pcall(syn.protect_gui, GUI) end
		if sethiddenproperty then pcall(sethiddenproperty, GUI, "OnTopOfCoreBlur", true) end

		GUI.Parent = gethiddengui and gethiddengui() or gethui and gethui() or CoreGui:FindFirstChildOfClass("ScreenGui") or CoreGui:FindFirstChildOfClass("Folder") or CoreGui

		TextLabel = cloneref(Instance.new("TextLabel")); do
			TextLabel.BackgroundTransparency = 1
			TextLabel.Position = UDim2.new(0.375, 0,0.021, 0)
			TextLabel.Font = Enum.Font.PermanentMarker
			TextLabel.TextScaled = true
			TextLabel.Text = "Preloading assets, (0/" .. tostring(Amount) .. ")"
			TextLabel.Parent = GUI
		end
	end

	for AnimName, TableAssets in next, Files do -- TableAssets[1] = animid, TableAssets[2] = rbxassetid, TableAssets[3] = mp3 link
		local TempFunction = function()
			local Sound = TableAssets[3] and getsynassetfromurl(TableAssets[3], TableAssets[1]) or TableAssets[2] ~= "" and "rbxassetid://" .. TableAssets[2]; if Sound then
				local TempSound = cloneref(Instance.new("Sound")); task.defer(function()
					TempSound.SoundId = Sound

					if syn and not gethui then pcall(syn.protect_gui, TempSound) end

					TempSound.Parent = cloneref(game:GetService("SoundService"))
					TempSound.Loaded:Wait()
					TempSound:Destroy()
				end)
			end

			pcall(function()
				if not isfile("FakeAudios/"..TableAssets[1]..".Anim") then
					--Encode(game:GetObjects('rbxassetid://'..TableAssets[1])[1], TableAssets[1])
					Encode(Global.GetObjects('rbxassetid://'..TableAssets[1])[1], TableAssets[1])
				end
			end)

			LoadAmount += 1
			TextLabel.Text = "Preloading assets, (" .. tostring(LoadAmount) .. "/" .. tostring(Amount) .. ")"
		end
		if Settings.PreloadWait then
			TempFunction()
		else
			task.defer(TempFunction)
		end
	end

	repeat fwait() until LoadAmount >= Amount
	GUI:Destroy()
end

if Settings.Preload then
	fwait(1) -- to make sure claims dont break
end

if Settings.Reanimate then
	Global.AutoAnimate = false
	if Settings.R15 then
		Global.R15ToR6 = false
		Global.R15ToR6M2 = false
	else
		Global.R15ToR6 = true
		Global.R15ToR6M2 = true
	end
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/ZendeyReanimate.lua", true))()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/AwsZFvR4Fh6/Ya/main/AnimZ.lua", true))()

for i,v in pairs(Files) do
	local Tool = Instance.new("Tool"); do
		Tool.CanBeDropped = false
		Tool.RequiresHandle = false
		Tool.Name = not v[3] and v[2] == "" and "[NS] "..i or i
		Tool.Parent = Backpack
	end

	local ToolPlaying = false

	Tool.Activated:Connect(function()
		if Global.RunAnimation then
			local SoundID = v[3] and getsynassetfromurl(v[3], v[1]) or v[2]
			ToolPlaying = true
			Global.RunAnimation(v[1],SoundID) -- dont like unneccessary threading
		end
	end)
	Tool.Unequipped:Connect(function()
		if ToolPlaying then
			ToolPlaying = false
			Global.RunAnimation() -- dont like unneccessary threading
		end
	end)
	fwait()
end
