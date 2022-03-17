--local preloadanimations = true -- enable this if you want to preload all animations (lagspike)
if not getgenv().preloadanimations then getgenv().preloadanimations = false end
if not getgenv().loadtime then getgenv().loadtime = 0.1 end
if not getgenv().reanimate then getgenv().reanimate = true end

local function wait(val) 
    if val == nil then val = 0.00001 end
    if val ~= 0 then 
        task.wait(val) 
    end 
end

local files = game:GetObjects("rbxassetid://9122671729")[1]
if getgenv().preloadanimations then
    local gui = files.ScreenGui:Clone()
    gui.Parent = game.CoreGui
    local loadamount,amounttoload = 0,0
    amounttoload = #files.Folder:GetChildren()--amounttoload + 1
    for i,v in pairs(files.Folder:GetChildren()) do
        if getgenv().loadtime ~= 0 then
            wait(getgenv().loadtime)
        end
        spawn(function()
            local animid,soundid = v.ToolTip,v.AnimationID.SoundID.SoundId
            if soundid then
                local soundwait = Instance.new("Sound",game.Players.LocalPlayer)
                soundwait.SoundId = soundid
                spawn(function()
                        soundwait.Loaded:Wait()
                        soundwait:Destroy()    
                end)
            end
            if animid then
                pcall(function()
                    game:GetObjects('rbxassetid://'..animid)
                end)
            end
            
            loadamount = loadamount + 1
            print(loadamount,amounttoload)
        end)
    end
    repeat task.wait() until loadamount == amounttoload
    gui:Destroy()
end
if getgenv().reanimate then
  getgenv().AutoAnimate = false
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua",true))()
  wait()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/AnimyForthing",true))()

for i,v in pairs(files.Folder:GetChildren()) do
    spawn(function()
        local tool = v:Clone()
        tool.Parent = game.Players.LocalPlayer.Backpack
        wait()
        tool.Activated:Connect(function()
            if _G.runanimation then
                _G.runanimation(v.ToolTip,string.sub(v.AnimationID.SoundID.SoundId,14))
            end
        end)
        tool.Unequipped:Connect(function()
            _G.dancing = false
            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Sound") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Sound:Destroy()
            end
        end)
    end)
end
