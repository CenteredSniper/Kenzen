-- [[ https://discord.gg/8EZcyvtDcq // ProductionTakeOne#3330 & nul#3174 ]] --
-- [[ Zendey Reanimate // By ProductionTakeOne#3330 // Additional support from nul#3174 and Iamverybored#9941 ]] --

local Global = getgenv and getgenv() or _G
local NewGlobal = getgenv and getgenv() or shared

do -- [[ Create Global Table ]]
	if not NewGlobal['0'] then
		NewGlobal['0'] = {}
	end
	NewGlobal = NewGlobal['0']
end

local function TranslateSetting(Setting,NewName)
	if Global[Setting] then
		NewGlobal[NewName] = Global[Setting]
	end
end

TranslateSetting("Fling","Fling")
TranslateSetting("TorsoFling","TorsoFling")
TranslateSetting("EnableSpin","EnableSpin")

TranslateSetting("PartGUI","PartGUI")
TranslateSetting("ShowReal","ShowReal")

TranslateSetting("Network","SimRadius")
TranslateSetting("AutoReclaim","AutoReclaim")
TranslateSetting("AntiSleep","AntiSleep")

TranslateSetting("Velocity","Velocity")
TranslateSetting("MovementVelocity","MovementVelocity")

TranslateSetting("GodMode","PermaDeath")
TranslateSetting("R6","R15ToR6")
TranslateSetting("AutoAnimate","AutoAnimate")
TranslateSetting("Collisions","Collisions")
TranslateSetting("GameOptimize","Optimizer")
TranslateSetting("Notifications","Notifications")

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/ZendeyReanimate.lua", true))()
