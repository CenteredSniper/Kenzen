--[[ // METADATA

Last Modified: 1/16/2022 8:15PM
Author: ???

--]]

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/discordui.lua")()

local win = DiscordLib:Window("discord library")

local serv = win:Server("Reanimate", "https://www.roblox.com/asset-thumbnail/image?assetId=3714002497&width=420&height=420&format=png")
local btns = serv:Channel("Main")

btns:Button("Reanimate", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/netlessreanimate.lua"))()
end)

btns:Seperator()

btns:Toggle("Fling",_G.Fling or false, function(bool)
	_G.Fling = bool
end)

btns:Toggle("Show Real",_G.ShowReal or false, function(bool)
	_G.ShowReal = bool
end)

btns:Toggle("Fake God",_G.FakeGod or false, function(bool)
	_G.FakeGod = bool
end)

btns:Toggle("God Mode",_G.GodMode or true, function(bool)
	_G.GodMode = bool
end)

btns:Toggle("R15toR6",_G.R15toR6 or true, function(bool)
	_G.R15toR6 = bool
end)

btns:Toggle("Auto Animate",_G.AutoAnimate or true, function(bool)
	_G.AutoAnimate = bool
end)

btns:Toggle("Tools",_G.Tools or true, function(bool)
	_G.Tools = bool
end)

btns:Toggle("Collisions",_G.Collisions or true, function(bool)
	_G.Collisions = bool
end)

btns:Toggle("Network",_G.Network or true, function(bool)
	_G.Network = bool
end)

btns:Toggle("Claim2",_G.Claim2 or false, function(bool)
	_G.Claim2 = bool
end)

btns:Toggle("Netless2",_G.Netless2 or false, function(bool)
	_G.Netless2 = bool
end)

btns:Textbox("Velocity", "-25.05", _G.Velocity or true, function(t)
	_G.Velocity = t
end)

local scripts = serv:Channel("Scripts")

scripts:Button("Eyozen", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/eyozen.txt"))()
end)

scripts:Button("Majora Mask", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/Majora%20Mask.txt"))()
end)

scripts:Button("WAO", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/WAO%20FE.txt"))()
end)


local AnimyServer = win:Server("AnimY", "https://www.roblox.com/asset-thumbnail/image?assetId=3021368605&width=420&height=420&format=png")
local btns2 = AnimyServer:Channel("Buttons")

local selected = nil

local drop = btns2:Dropdown("Animations",{}, function(bool)
	selected = bool
end)

btns2:Seperator()

local animationlist = {}

btns2:Button("Play Animation", function()
	if selected and _G.runanimation then
		local animdata = animationlist[selected]:split(" ")
		_G.runanimation(animdata[1],animdata[2])
	end
end)

btns2:Button("Load All Animations", function()
	local loadedamount = Instance.new("TextLabel",game.Players.LocalPlayer.PlayerGui:GetChildren()[1])
	local loadamount,amounttoload = 1,0
	for i,v in pairs(animationlist) do
		amounttoload = amounttoload + 1
	end
	loadedamount.Text = "1/".. amounttoload
	loadedamount.AnchorPoint = Vector2.new(0.5,0)
	loadedamount.Position = UDim2.new(0.5, 0, 0, 0)
	loadedamount.Size = UDim2.new(0, 200, 0, 50)
	for i,v in pairs(animationlist) do
		spawn(function()
			local args = v:split(" ")
			local animid,soundid = args[1],args[2]
			if soundid then
				local soundwait = Instance.new("Sound",game.Players.LocalPlayer)
				soundwait.SoundId = "rbxassetid://" .. soundid
				soundwait.Loaded:Wait()
				soundwait:Destroy()
			end
			if animid then
				pcall(function()
					game:GetObjects('rbxassetid://'..animid)
				end)
			end
			loadamount = loadamount + 1
			loadedamount.Text = loadamount .. "/".. amounttoload
		end)
	end
	repeat task.wait() until loadamount == amounttoload
	loadedamount:Destroy()
end)


btns2:Button("Load All Sounds (Boombox)", function()
	local boomboxx = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Remote",true)
	if boomboxx then
		local loadedamount = Instance.new("TextLabel",game.Players.LocalPlayer.PlayerGui:GetChildren()[1])
		local loadamount,amounttoload = 1,0
		for i,v in pairs(animationlist) do
			amounttoload = amounttoload + 1
		end
		loadedamount.Text = "1/".. amounttoload
		loadedamount.AnchorPoint = Vector2.new(0.5,0)
		loadedamount.Position = UDim2.new(0.5, 0, 0.1, 0)
		loadedamount.Size = UDim2.new(0, 200, 0, 50)
		local soundwait = boomboxx.Parent.Handle.Sound
		boomboxx.Parent.Handle.ChildAdded:Connect(function(newins)
			wait()
			soundwait = newins
		end)
		for i,v in pairs(animationlist) do
			local args = v.Name:split(" ")
			local soundid = args[2]
			if soundid then
				boomboxx:FireServer("PlaySong", soundid)
				repeat task.wait() until string.match(soundwait.SoundId , "%d+") == soundid
				repeat task.wait() until soundwait.Playing and soundwait.TimeLength ~= 0
			end
			loadamount = loadamount + 1
			loadedamount.Text = loadamount .. "/".. amounttoload
		end
		repeat task.wait() until loadamount == amounttoload
		loadedamount:Destroy()
	end
end)

_G.AnimationSpeed = 1
local sldr = btns2:Slider("Animation Speed", 1, 5, 1, function(t)
	_G.AnimationSpeed = t
end)

btns2:Seperator()

btns2:Button("Load AnimY", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimyForthing"))()
end)

local OtherServer = win:Server("Extra", "")

local btns3 = OtherServer:Channel("Buttons")

btns3:Button("Ping Prediction", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/pingpredict.lua"))()
end)

btns3:Button("Kaiju Anti-Grab", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/antigrab"))()
end)

btns3:Button("Advanced Decompiler", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/message%20(19).txt"))()
end)

btns3:Button("Statistics", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/message%20(18).txt"))()
end)

btns3:Button("Animation Grabber", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimationStealer.lua"))()
end)

btns3:Button("Kenzen", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/KenzenScript.lua"))()
end)

local animationslist = game:GetObjects("rbxassetid://8564319315")[1] --7979526466")[1] --7948728902")[1] --7113399253")[1]

for i,v in pairs(animationslist:GetChildren()) do
	spawn(function()
		repeat task.wait() until v:FindFirstChildOfClass("Sound")
		drop:Add(v.Name)
		animationlist[v.Name] = v.Value .. " " .. string.match(v:FindFirstChildOfClass("Sound").SoundId , "%d+")
		--runanimation(newbutton)
	end)
end
wait(1)
animationslist:Destroy()
