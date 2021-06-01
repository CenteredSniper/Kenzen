if game.GameId ~= 848145103 then
    error("wrong game")
    return
end
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("introGui") == nil
wait(1)
local buttons = game:GetService("Players").LocalPlayer.PlayerGui.inventory.mainBackground.innerBackground.rightSideFrame.ScrollingFrame
local quickbutton = game:GetService("Players").LocalPlayer.PlayerGui.abilities.Frame.ImageLabel:Clone()
local setvalue = 0
local cooldown = true
quickbutton.Parent = game:GetService("Players").LocalPlayer.PlayerGui.abilities.Frame
quickbutton.Position = UDim2.new(1.2,0,0,0)
quickbutton.AnchorPoint = Vector2.new(0,0)
quickbutton.Name = "QuickSwitch"
quickbutton.slot1.Name = "QuickSlot"
quickbutton.QuickSlot.LocalScript:Destroy()
quickbutton.QuickSlot.bind.Position = UDim2.new(1,0,1,0)
quickbutton.QuickSlot.ImageButton.Image = ""
quickbutton.QuickSlot.bind.Text = "R"
local function quickset(button)
    setvalue = button.itemType.uniqueItemNum.Value
    quickbutton.QuickSlot.ImageButton.Image = button.itemType.imageId.Value
end

for i,v in pairs(buttons:GetChildren()) do
    if v:IsA("ImageLabel") then
        if v.itemType.Value == "ability" then
            v.button.MouseButton2Click:Connect(function()
                quickset(v)
            end)
        end
    end
end
buttons.ChildAdded:Connect(function(v)
    wait(1)
    if v:IsA("ImageLabel") then
        if v.itemType.Value == "ability" then
            v.button.MouseButton2Click:Connect(function()
                quickset(v)
            end)
        end
    end
end)

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.R then
        if setvalue ~= 0 then
            if game:GetService("Players").LocalPlayer.PlayerGui.abilities.Frame:FindFirstChild("slot2",true).cooldownNumber.Visible == false and cooldown then
                cooldown = false
                
            local whaterver = game:GetService("Players").LocalPlayer.PlayerGui.inventory.mainBackground.innerBackground.leftSideFrame.eAbility.itemType
            local a = {whaterver.uniqueItemNum.Value,whaterver.imageId.Value}
            game:GetService("ReplicatedStorage").remotes.equipItem:InvokeServer("ability", setvalue, "e")
            if a and a[1] and a[2] then
				setvalue = a[1]
				quickbutton.QuickSlot.ImageButton.Image = a[2]
			else
				setvalue = 0
				quickbutton.QuickSlot.ImageButton.Image = ""
			end
            wait(1)
            cooldown = true
            end
        end
    end 
end)
