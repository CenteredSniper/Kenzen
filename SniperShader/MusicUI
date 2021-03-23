local music = false
local UserInputService = game:GetService("UserInputService")
local Gui = Instance.new("ScreenGui",game.CoreGui)
Gui.ResetOnSpawn = false
local TimeLabel = Instance.new("TextLabel",Gui)
TimeLabel.Font = Enum.Font.PermanentMarker
TimeLabel.TextXAlignment = Enum.TextXAlignment.Center
TimeLabel.TextYAlignment = Enum.TextYAlignment.Center
TimeLabel.TextScaled = true
TimeLabel.Size = UDim2.new(0.1,0,0,36)
TimeLabel.Position = UDim2.new(0.5,0,1,0)
TimeLabel.AnchorPoint = Vector2.new(0.5,1)
TimeLabel.BackgroundTransparency = 1
TimeLabel.TextStrokeTransparency = 0
TimeLabel.TextColor3 = Color3.new(1,1,1)
lighting:GetPropertyChangedSignal("TimeOfDay"):Connect(function()
    TimeLabel.Text = string.sub(lighting.TimeOfDay,1,5)
end)
local MusicBox = Instance.new("TextBox",Gui)
MusicBox.Font = Enum.Font.PermanentMarker
MusicBox.TextXAlignment = Enum.TextXAlignment.Center
MusicBox.TextYAlignment = Enum.TextYAlignment.Center
MusicBox.TextScaled = true
local openn = false
MusicBox.Size = UDim2.new(0,0,0,20) --UDim2.new(0.15,0,0,20)
MusicBox.Position = UDim2.new(0.5,0,0.95,0)
MusicBox.AnchorPoint = Vector2.new(0.5,1)
MusicBox.BackgroundTransparency = 0.5
MusicBox.TextStrokeTransparency = 0
MusicBox.TextColor3 = Color3.new(1,1,1)
local song = Instance.new("Sound",MusicBox)
song.Looped = true
song.Volume = 2
song.Name = "SniperSong"
UserInputService.InputBegan:connect(function(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.Delete then
--        openn = not openn
        if openn then
            MusicBox:TweenSize(UDim2.new(0, 0, 0, 20),Enum.EasingDirection.In,Enum.EasingStyle.Quad,0.5)
            wait(0.5)
            openn = false
        else
            MusicBox:TweenSize(UDim2.new(0.15, 0, 0, 20),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.5)
            wait(0.5)
            openn = true
        end
    end
end)
MusicBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if MusicBox.Text == "0" or MusicBox.Text == "stop" then
            song:Stop()
            music = false
            _G.Releasee:Disconnect()
        else
            if music then
                song:Stop()
                music = false
                _G.Releasee:Disconnect()
            end
            song.SoundId = "rbxassetid://" .. MusicBox.Text
            song:Play()
            for i,v in pairs(game:GetDescendants()) do
                coroutine.resume(coroutine.create(function()
                    if v.Name ~= "SniperSong" and v:IsA("Sound") then
                           local a = v.Volume
                           v.Volume = v.Volume*0.25
                           repeat wait() until music == false
                           v.Volume = a
                    end
                end))
            end
            _G.Releasee = workspace.DescendantAdded:Connect(function(v)
                if v.Name ~= "SniperSong" and v:IsA("Sound") then
                           local a = v.Volume
                           v.Volume = v.Volume*0.25
                           repeat wait() until music == false
                           v.Volume = a
                end
            end)
            music = true
        end
    end
end)
