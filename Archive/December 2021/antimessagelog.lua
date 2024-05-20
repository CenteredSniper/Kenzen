--[[ // METADATA

Last Modified: 12/28/2021 10:41PM
Author: ???

--]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local origchat = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Chat")
if origchat then origchat:Destroy() end

local LP, Chatted = game:GetService('Players').LocalPlayer, Instance.new('BindableEvent')
local Chat, MessagePosted = game:GetService('Chat')

Chatted.Name = LP.Name..'_Chatted_Event'

if Chat and Chat:FindFirstChild('ChatScript') and Chat.ChatScript:FindFirstChild('ChatMain') then
    MessagePosted = require(Chat.ChatScript.ChatMain).MessagePosted

    local Old
    Old = hookmetamethod(game, '__namecall', function(self, ...)
        local Method = getnamecallmethod()
        if self == MessagePosted and not checkcaller() and Method == 'Fire' then
            Chatted:Fire(...)
            return
        end
       
        return Old(self, ...)
    end)

    local Old2
    Old2 = hookmetamethod(game, '__index', newcclosure(function(self, Index)
        if checkcaller() and self == LP and Index == 'Chatted' then
            return Chatted.Event
        end
       
        return Old2(self, Index)
    end))
end

task.wait()
local chat = game:GetService("Players").LocalPlayer.PlayerGui.Chat
game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.Slash and not gameProcessedEvent and chat.Enabled then 
        task.wait()
		chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:CaptureFocus()
    end 
end)
repeat task.wait() until game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame:FindFirstChild("ChatIcon")
print("found")
game:GetService("CoreGui").ThemeProvider.TopBarFrame.LeftFrame.ChatIcon.Background.Activated:Connect(function()
print("click")
chat.Enabled = not chat.Enabled
end)
