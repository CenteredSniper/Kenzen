--[[
	How to use:
	local ErrorPrompt = <loadstring>
	ErrorPrompt(
		"Title",
		"Text",
		{{Text = "Button",Callback = function() prompt:_close() end}}
		true
	)
]]

local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local GUI = Instance.new("ScreenGui")
GUI.ResetOnSpawn = false

local ErrorPrompt = getrenv().require(game.CoreGui.RobloxGui.Modules.ErrorPrompt)

GUI.Parent = gethui and gethui() or CoreGui

return function(Title,Text,ButtonData,SetBlur)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	
	prompt:setErrorTitle(tostring(Title))
	prompt:updateButtons(ButtonData or {{Text = "OK",Callback = function() prompt:_close() end}}, 'Default')
	if SetBlur then
		RunService:SetRobloxGuiFocused(true)
	end
	
	prompt:setParent(GUI)
	prompt:_open(Text)
end
