--[[ // METADATA

Last Modified: 10/14/2019 6:49PM
Author: ???

--]]

Player = game.Players.LocalPlayer
    
    local mt = getrawmetatable(game)
make_writeable(mt)
local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = args[#args]
    if method == "BreakJoints" then return end
    return old(self, ...)
end)
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local mouse = plr:GetMouse()
local hum = char:FindFirstChild("HumanoidRootPart")
hum.Anchored = false
local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local Character = Player.Character
local Root = Character.HumanoidRootPart


    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MainFrame2 = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local walkspeedbutton = Instance.new("TextButton")
    local noclipbutton = Instance.new("TextButton")
    local input = Instance.new("TextBox")
    local Gravitybutton = Instance.new("TextButton")
    local craftbutton = Instance.new("TextButton")
    local jumpowerbutton = Instance.new("TextButton")
    local noclipbutton_2 = Instance.new("TextButton")
    local noclipbutton_3 = Instance.new("TextButton")
    local noclipbutton_4 = Instance.new("TextButton")
    local Frame = Instance.new("Frame")
    local openclosebutton = Instance.new("TextButton")
    local TextLabel_2 = Instance.new("TextLabel")
    local exitbutton = Instance.new("TextButton")
    local esp = Instance.new("TextButton")
    local esp1 = Instance.new("TextButton")
    local TeleportItems = Instance.new("TextButton")
    local MaxItems = Instance.new("TextBox")
    local void = Instance.new("TextButton")
    
    
    
    
    ScreenGui.Parent = game.CoreGui
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.Active = true
    MainFrame.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Draggable = true
    MainFrame.Position = UDim2.new(0.500367403, -234, 0.500636935, -120)
    MainFrame.Size = UDim2.new(0, 469, 0, 400)
    
    MainFrame2.Name = "MainFrame2"
    MainFrame2.Parent = MainFrame
    MainFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
    MainFrame2.BackgroundTransparency = 1
    MainFrame2.Position = UDim2.new(0.5, -234, 0.5, -120)
    MainFrame2.Size = UDim2.new(0, 469, 0, 239)
    
    TextLabel.Parent = MainFrame2
    TextLabel.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.362148255, 0, -0.23506569, 0)
    TextLabel.Size = UDim2.new(0, 129, 0, 38)
    TextLabel.Font = Enum.Font.Highway
    TextLabel.Text = "Fiusen Crafting GUI   by fiusen#4281"
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 12
    TextLabel.TextWrapped = true
    
    MaxItems.Name = "MaxItems"
    MaxItems.Parent = MainFrame2
    MaxItems.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
    MaxItems.BorderColor3 = Color3.new(1, 1, 1)
    MaxItems.Position = UDim2.new(0.100000001, 0, 1.04999995, 0)
    MaxItems.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
    MaxItems.Font = Enum.Font.SciFi
    MaxItems.FontSize = Enum.FontSize.Size14
    MaxItems.Text = "1"
    MaxItems.TextColor3 = Color3.new(1, 1, 1)
    MaxItems.TextSize = 14
    MaxItems.Visible = false
    
    walkspeedbutton.Name = "walkspeedbutton"
    walkspeedbutton.Parent = MainFrame2
    walkspeedbutton.BackgroundColor3 = Color3.new(0, 0, 0)
    walkspeedbutton.BorderSizePixel = 0
    walkspeedbutton.Position = UDim2.new(0.378503054, 0, 0.220140266, 0)
    walkspeedbutton.Size = UDim2.new(0, 116, 0, 35)
    walkspeedbutton.Font = Enum.Font.Highway
    walkspeedbutton.Text = "Walkspeed (Hold 'Q')"
    walkspeedbutton.TextColor3 = Color3.new(1, 1, 1)
    walkspeedbutton.TextSize = 12
    
    
    
    noclipbutton.Name = "noclipbutton"
    noclipbutton.Parent = MainFrame2
    noclipbutton.BackgroundColor3 = Color3.new(0, 0, 0)
    noclipbutton.BorderSizePixel = 0
    noclipbutton.Position = UDim2.new(0.378503084, 0, 0.426614184, 0)
    noclipbutton.Size = UDim2.new(0, 116, 0, 35)
    noclipbutton.Font = Enum.Font.Highway
    noclipbutton.Text = "Noclip"
    noclipbutton.TextColor3 = Color3.new(1, 1, 1)
    noclipbutton.TextSize = 14
    
    
    input.Name = "input"
    input.Parent = MainFrame2
    input.BackgroundColor3 = Color3.new(0, 0, 0)
    input.BorderSizePixel = 0
    input.Position = UDim2.new(0.0351812392, 0, 0.00017471716, 0)
    input.Size = UDim2.new(0, 437, 0, 42)
    input.Font = Enum.Font.Highway
    input.PlaceholderColor3 = Color3.new(1, 1, 1)
    input.PlaceholderText = "Input Number"
    input.Text = ""
    input.TextColor3 = Color3.new(1, 1, 1)
    input.TextSize = 14

    
    Gravitybutton.Name = "Gravitybutton"
    Gravitybutton.Parent = MainFrame2
    Gravitybutton.BackgroundColor3 = Color3.new(0, 0, 0)
    Gravitybutton.BorderSizePixel = 0
    Gravitybutton.Position = UDim2.new(0.0352194794, 0, 0.426614184, 0)
    Gravitybutton.Size = UDim2.new(0, 116, 0, 35)
    Gravitybutton.Font = Enum.Font.Highway
    Gravitybutton.Text = "Gravity"
    Gravitybutton.TextColor3 = Color3.new(1, 1, 1)
    Gravitybutton.TextSize = 14
    
    craftbutton.Name = "craftbutton"
    craftbutton.Parent = MainFrame2
    craftbutton.BackgroundColor3 = Color3.new(0, 0, 0)
    craftbutton.BorderSizePixel = 0
    craftbutton.Position = UDim2.new(0.0352194794, 0, 0.220140266, 0)
    craftbutton.Size = UDim2.new(0, 116, 0, 35)
    craftbutton.Font = Enum.Font.Highway
    craftbutton.Text = "Craft"
    craftbutton.TextColor3 = Color3.new(1, 1, 1)
    craftbutton.TextSize = 14
    
    jumpowerbutton.Name = " jumpowerbutton"
    jumpowerbutton.Parent = MainFrame2
    jumpowerbutton.BackgroundColor3 = Color3.new(0, 0, 0)
    jumpowerbutton.BorderSizePixel = 0
    jumpowerbutton.Position = UDim2.new(0.719654441, 0, 0.220140266, 0)
    jumpowerbutton.Size = UDim2.new(0, 116, 0, 35)
    jumpowerbutton.Font = Enum.Font.Highway
    jumpowerbutton.Text = "JumpPower"
    jumpowerbutton.TextColor3 = Color3.new(1, 1, 1)
    jumpowerbutton.TextSize = 14
    
    noclipbutton_2.Name = "noclipbutton"
    noclipbutton_2.Parent = MainFrame2
    noclipbutton_2.BackgroundColor3 = Color3.new(0, 0, 0)
    noclipbutton_2.BorderSizePixel = 0
    noclipbutton_2.Position = UDim2.new(0.715390086, 0, 0.426614184, 0)
    noclipbutton_2.Size = UDim2.new(0, 116, 0, 35)
    noclipbutton_2.Font = Enum.Font.Highway
    noclipbutton_2.Text = "Clear FOG"
    noclipbutton_2.TextColor3 = Color3.new(1, 1, 1)
    noclipbutton_2.TextSize = 14
    noclipbutton_2.MouseButton1Down:connect(function()
    game.Lighting.FogEnd = 10000
    end)
    
    noclipbutton_3.Name = "noclipbutton"
    noclipbutton_3.Parent = MainFrame2
    noclipbutton_3.BackgroundColor3 = Color3.new(0, 0, 0)
    noclipbutton_3.BorderSizePixel = 0
    noclipbutton_3.Position = UDim2.new(0.715390086, 0, 0.641063461, 0)
    noclipbutton_3.Size = UDim2.new(0, 116, 0, 35)
    noclipbutton_3.Font = Enum.Font.Highway
    noclipbutton_3.Text = "Infinite Jump"
    noclipbutton_3.TextColor3 = Color3.new(1, 1, 1)
    noclipbutton_3.TextSize = 14
    noclipbutton_3.MouseButton1Down:connect(function()
    local Player = game:GetService'Players'.LocalPlayer;
    local UIS = game:GetService'UserInputService';
    
    _G.JumpHeight = 50;
    
    function Action(Object, Function) if Object ~= nil then Function(Object); end end
    
    UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                    end)
                end
            end)
        end
    end)
    end)
    
    esp.Name = "player_esp"
    esp.Parent = MainFrame2
    esp.BackgroundColor3 = Color3.new(0, 0, 0)
    esp.BorderSizePixel = 0
    esp.Position = UDim2.new(0.0352194794, 0, 0.641063461, 0)
    esp.Size = UDim2.new(0, 116, 0, 35)
    esp.Font = Enum.Font.Highway
    esp.Text = "Player ESP"
    esp.TextColor3 = Color3.new(1, 1, 1)
    esp.TextSize = 14
    esp.MouseButton1Down:connect(function()
        
    
    Important = {Players = game:GetService("Players"), Workspace = game:GetService("Workspace"), CoreGui = game:GetService("CoreGui")}
    
    local enabledesp = false
    
    function CreateESP(plr)
        
        if plr ~= nil then
            
            local GetChar = plr.Character
            if not GetChar then return end
            
            local GetHead do
                
                repeat wait() until GetChar:FindFirstChild("Head")
                
            end
            GetHead = GetChar.Head        
            
            local bb = Instance.new("BillboardGui", Important.CoreGui)
            bb.Adornee = GetHead
            bb.ExtentsOffset = Vector3.new(0, 1, 0)
            bb.AlwaysOnTop = true
            bb.Size = UDim2.new(0, 5, 0, 5)
            bb.StudsOffset = Vector3.new(0, 3, 0)
            bb.Name = "ESP_PLAYER_" .. plr.Name
    
            local displayframe = Instance.new("Frame", bb)
            displayframe.ZIndex = 10
            displayframe.BackgroundTransparency = 1
            displayframe.Size = UDim2.new(1,0,1,0)
            
            local name = Instance.new("TextLabel", displayframe)
            name.Name = "Name"
            name.ZIndex = 10
            name.Text = plr.Name
            name.Visible = true
            name.TextColor3 = Color3.new(170,0,0)
            name.BackgroundTransparency = 1
            name.Size = UDim2.new(1,0,10,0)
            name.Font = Enum.Font.SourceSansLight
            name.TextSize = 14
            name.TextStrokeTransparency = .5
            
        end
        
    end
    
        
        for i,v in pairs(Important.Players:GetChildren()) do
            
            CreateESP(v)
            
        end
    end)
    
    void.Name = "void"
    void.Parent = MainFrame2
    void.BackgroundColor3 = Color3.new(0, 0, 0)
    void.BorderSizePixel = 0
    void.Position = UDim2.new(0.0352194794, 0, 0.847537381, 0)
    void.Size = UDim2.new(0, 116, 0, 35)
    void.Font = Enum.Font.Highway
    void.Text = "TP to VOID"
    void.TextColor3 = Color3.new(1, 1, 1)
    void.TextSize = 14
    void.MouseButton1Down:connect(function()
    game:GetService("TeleportService"):Teleport(2021740958,game.Players.LocalPlayer)
    end)
    
    TeleportItems.Name = "TeleportItems"
    TeleportItems.Parent = MainFrame2
    TeleportItems.BackgroundColor3 = Color3.new(0, 0, 0)
    TeleportItems.BorderSizePixel = 0
    TeleportItems.Position = UDim2.new(0.375304788, 0, 0.641063461, 0)
    TeleportItems.Size = UDim2.new(0, 116, 0, 35)
    TeleportItems.Font = Enum.Font.Highway
    TeleportItems.Text = "TP to Item"
    TeleportItems.TextColor3 = Color3.new(1, 1, 1)
    TeleportItems.TextSize = 12
    
    
    
    
    
    
    Frame.Parent = MainFrame
    Frame.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 446, 0, 16)
    
    openclosebutton.Name = "open/close button"
    openclosebutton.Parent = MainFrame
    openclosebutton.BackgroundColor3 = Color3.new(0, 0, 0)
    openclosebutton.BorderSizePixel = 0
    openclosebutton.Position = UDim2.new(0.916050732, 0, 0, 0)
    openclosebutton.Size = UDim2.new(0, 23, 0, 16)
    openclosebutton.Font = Enum.Font.SourceSans
    openclosebutton.Text = "X"
    openclosebutton.TextColor3 = Color3.new(1, 1, 1)
    openclosebutton.TextScaled = true
    openclosebutton.TextSize = 14
    openclosebutton.TextTransparency = 1
    openclosebutton.TextWrapped = true

    TextLabel_2.Parent = openclosebutton
    TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
    TextLabel_2.BackgroundTransparency = 1
    TextLabel_2.Position = UDim2.new(0.304347813, 0, -0.25, 0)
    TextLabel_2.Size = UDim2.new(0, 16, 0, 16)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = "_"
    TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
    TextLabel_2.TextSize = 14
    TextLabel_2.TextWrapped = true
    
    exitbutton.Name = "exitbutton"
    exitbutton.Parent = MainFrame
    exitbutton.BackgroundColor3 = Color3.new(0, 0, 0)
    exitbutton.BorderSizePixel = 0
    exitbutton.Position = UDim2.new(0.950165868, 0, 0, 0)
    exitbutton.Size = UDim2.new(0, 23, 0, 16)
    exitbutton.Font = Enum.Font.SourceSans
    exitbutton.Text = "X"
    exitbutton.TextColor3 = Color3.new(1, 1, 1)
    exitbutton.TextScaled = true
    exitbutton.TextSize = 16
    exitbutton.TextWrapped = true
    
    Gravitybutton.MouseButton1Down:connect(function()
    if Gravity == true then
    Gravity = false
    game.workspace.Gravity = 196.2
    else
    Gravity = true
    game.workspace.Gravity = input.Text
    end
      end)
    jumpowerbutton.MouseButton1Down:connect(function()
    if Jump == true then
        Jump = false
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    else
        Jump = true
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = input.Text
    end
     end)
    exitbutton.MouseButton1Down:connect(function()
            MainFrame:TweenPosition(UDim2.new(1, 769,0.483, -120), "Out", "Sine", 1)
            wait(0.4)
            ScreenGui:remove()
    end)
    
    openclosebutton.MouseButton1Down:connect(function()
    TabPosition = not TabPosition
        if TabPosition then
            MainFrame:TweenSize(UDim2.new(0, 469,0, 17), "Out", "Sine", 1)
            MainFrame2.Visible = false
        else
            MainFrame:TweenSize(UDim2.new(0, 469,0, 239), "Out", "Sine", 1)
            MainFrame2.Visible = true
        end
    end)
    
    
    craftbutton.MouseButton1Down:connect(function()
        local item = input.Text
        local Event = game:GetService("ReplicatedStorage").Events.CraftItem
        Event:FireServer(item)
    end)
    
    walkspeedbutton.MouseButton1Down:connect(function()
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    local hum = char:FindFirstChild("HumanoidRootPart")
    
    
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    local hum = char:FindFirstChild("HumanoidRootPart")
    mouse.KeyDown:connect(function(key)
        if key == "q" then
            loop = true
            while loop do
                hum.CFrame = hum.CFrame + hum.CFrame.lookVector * "2"
                wait()
            end
            end
            end)
    end)
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    mouse.KeyUp:connect(function(key)
        if key == "q" then
            loop = false
        end
    end)
    
    noclipbutton.MouseButton1Down:connect(function()
        -- made by tturley23
        
        --[[ Thank you for choosing this noclip script!
            
            The noclip will be enabled automatically, please enter the values below - mode, hitpart according the the instructions.
            Want to disable the noclip? Type "noclip disable" in chat.
            Want to re-enable the noclip? Type "noclip enable" in chat.
        
            If you are going to share this etc please give credit :)
            
        --]]
        
        local plr = game.Players.LocalPlayer -- Player
        
        local mode = "noclip"
        
        --[[ MODE:
            
            The mode is what mode the noclip script is on. You must enter one of these values. CASE SENSITIVE.
            
            tempnoclip - Will allow you to walk through touched objects for 3 seconds before making them solid again. While you can walk through them they are semi-transparent
            destroy - Will permanently destroy any touched objects
            noclip - Will Allow you to walk through any touched object permanently
            invis - Will make any touched object invisible.
            
        --]]
        
        local HitPart = "RightFoot" , "LeftLeg" , "Head" , "Torso" , "HumanoidRootPart", "LeftFoot" , "RightFoot"
        
        --[[ HITPART
            
            This Value is what part of your character will activate the noclip mode. You must enter one of the following values. CASE SENSITIVE.
            BE AWARE OF WETHER YOU ARE PLAYING R15 OR R6 ANIMATED GAMES.
            
            Head - R15/R6
            Torso - R6
            HumanoidRootPart - R15 Torso
            LeftLeg - R15
            LeftFoot - R15
            RightLeg - R15
            RightFoot - R15
            
        --]]
        
        local enabled = true
        
        if (plr ~= nil) then
            
        
            enabled = true
            
                    
            if (mode ~= "TEMPNOCLIP" and mode ~= "tempnoclip" and mode ~= "DESTROY" and mode ~= "destroy" and mode ~= "NOCLIP" and mode ~= "noclip" and mode ~= "INVIS" and mode ~= "invis") then
                mode = "noclip"
            else
            
            end
            
            if (HitPart ~= "Head" and HitPart ~= "Torso" and HitPart ~= "HumanoidRootPart" and HitPart ~= "LeftHand" and HitPart ~= "LeftFoot" and HitPart ~= "RightFoot" and HitPart ~= "RightHand") then
                HitPart = "Head"
            else
            end
            
            
        end
        
        plr.Chatted:connect(function(msg)
            
            if (msg == string.lower("nd")) then
                enabled = false		
            end
            
            if (msg == string.lower("ne")) then
                enabled = true
            end
        end)
        
        plr.Character[HitPart].Touched:connect(function(obj)
            
            if(obj:IsA("MeshPart") or obj:IsA("Part") or obj:IsA("WedgePart") or obj:IsA("UnionOperation")) then
                if(obj.CanCollide == true) then
                    
                    if (mode == "TEMPNOCLIP" or mode == "tempnoclip") then	
                        
                        if enabled == true then				
                            local ogtransp = obj.Transparency
                            
                            obj.CanCollide = false
                            obj.Transparency = 0.5
                            
                            wait(4)
                            
                            obj.CanCollide = true
                            obj.Transparency = ogtransp
                        end
                        
                    end
                    
                    
                    if (mode == "DESTROY" or mode == "destroy") then
                        if enabled == true then
                            obj:remove()
                        end
                    end
                    
                    if (mode == "NOCLIP" or mode == "noclip") then
                        if enabled == true then
                            obj.CanCollide = false
                        end
                    end
                    
                    if (mode == "INVIS" or mode == "invis") then
                        if enabled == true then
                            obj.Transparency = 0.8
                            else
                        end
                    end
                    
                end
                
            else
        
            end
            
        end)
        
        end)
    
        function TeleportToItem(Item)
            for _,v in pairs(workspace:GetChildren()) do
                if tostring(v):lower():find(Item) or tostring(v):lower() == Item or tostring(v) == Item then
                    if v:FindFirstChild("Pickup") then
                        while wait() and v.Parent == workspace do
                            Root.CFrame = v.CFrame
                            if (Root.Position - v.Position).magnitude <= 15 then
                                RepStorage.Events.Pickup:FireServer(v)
                            end
                        end
                    end
                end
            end
        end

        TeleportItems.MouseButton1Down:Connect(function()
            local IP = input.Text
            TeleportToItem(IP)
        end)
         
       print("made by fiusen#4281")
