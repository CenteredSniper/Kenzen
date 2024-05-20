--[[ // METADATA

Last Modified: 7/22/2021 9:22PM
Author: Me

--]]

local function creategui(market)
    spawn(function()
        if market.Configuration:FindFirstChild("CashLeft") then
            local BillboardGui0 = Instance.new("BillboardGui")
            local TextLabel1 = Instance.new("TextLabel")
            BillboardGui0.Name = "Billboard"
            BillboardGui0.Parent = market.Range
            BillboardGui0.LightInfluence = 1
            BillboardGui0.Size = UDim2.new(0, 200, 0, 50)
            BillboardGui0.Active = true
            BillboardGui0.ClipsDescendants = true
            BillboardGui0.ResetOnSpawn = false
            BillboardGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BillboardGui0.AlwaysOnTop = true
            TextLabel1.Name = "PlrName"
            TextLabel1.Parent = BillboardGui0
            TextLabel1.Size = UDim2.new(0, 200, 0, 50)
            TextLabel1.BackgroundTransparency = 1
            TextLabel1.Font = Enum.Font.PermanentMarker
            TextLabel1.FontSize = Enum.FontSize.Size14
            TextLabel1.TextColor = BrickColor.new("Really red")
            TextLabel1.TextColor3 = Color3.new(1, 0, 0)
            TextLabel1.TextScaled = true
            TextLabel1.TextSize = 14
            TextLabel1.TextStrokeTransparency = 0
            TextLabel1.TextWrap = true
            TextLabel1.TextWrapped = true
            TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel1.TextYAlignment = Enum.TextYAlignment.Top
            market.Configuration.CashLeft.Changed:Connect(function()
                TextLabel1.Text = "$" .. tostring(market.Configuration.CashLeft.Value)
            end)
            TextLabel1.Text = "$" .. tostring(market.Configuration.CashLeft.Value)
        end
    end)
end

game:GetService("Workspace").Game.Towers.ChildAdded:Connect(function(v)
    if v.Name == "Market" then
        wait(0.1)
        creategui(v)
    end
end)

for i,v in pairs(game:GetService("Workspace").Game.Towers:GetChildren()) do
    if v.Name == "Market" then
        wait(0.1)
        creategui(v)
    end
end
