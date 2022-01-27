-- https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330

if getgenv().Fling == nil then getgenv().Fling = _G.Fling or false end
if getgenv().TorsoFling == nil then getgenv().TorsoFling = _G.TorsoFling or false end
if getgenv().ShowReal == nil then getgenv().ShowReal = _G.ShowReal or false end
if getgenv().FakeGod == nil then getgenv().FakeGod = _G.FakeGod or false end
if getgenv().GodMode == nil then getgenv().GodMode = _G.GodMode or true end
if getgenv().AutoAnimate == nil then getgenv().AutoAnimate = _G.AutoAnimate or true end
if getgenv().Tools == nil then getgenv().Tools = _G.Tools or true end
if getgenv().Velocity == nil then getgenv().Velocity = _G.Velocity or -25.05 end
if getgenv().Collisions == nil then getgenv().Collisions = _G.Collisions or true end
if getgenv().CheckForDeath == nil then getgenv().CheckForDeath = _G.CheckForDeath or true end
if getgenv().Netless2 == nil then getgenv().Netless2 = _G.Netless2 or false end
if getgenv().Claim2 == nil then getgenv().Claim2 = _G.Claim2 or false end
if getgenv().ExtremeNetless == nil then getgenv().ExtremeNetless = _G.ExtremeNetless or false end
if getgenv().Notification == nil then getgenv().Notification = _G.Notification or false end

loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua"))()
