--[[ // METADATA

Last Modified: 11/15/2020 6:47PM
Author: Me

--]]

	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Tool") then
				currentToolSize = v.Handle.Size
				currentGripPos = v.GripPos
				local a = Instance.new("SelectionBox",v.Handle)
				a.Name = "SelectionBoxCreated"
				a.Adornee = v.Handle
				v.Handle.Massless = true
				v.Handle.Size = Vector3.new(2000,100,2000)
				v.GripPos = Vector3.new(0,0,0)
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
		end
	end
