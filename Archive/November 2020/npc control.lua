--[[ // METADATA

Last Modified: 11/13/2020 5:34AM
Author: Me

--]]

                spawn(function()
                    game.RunService.RenderStepped:Connect(function()
                        game.Players.LocalPlayer.MaximumSimulationRadius = math.huge;
                        setsimulationradius(math.huge);
                    end)
                end)
                local Player = game.Players.LocalPlayer
                local Mouse = Player:GetMouse()
                Mouse.KeyDown:connect(function(key)
                	if key == "e" then
                        if Mouse.Target ~= nil and Mouse.Target.Parent.Name ~= "Workspace" and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
                            local Char = Mouse.Target.Parent
                            Player.Character = Mouse.Target.Parent
                            workspace.CurrentCamera.CameraSubject = Char
                            Char.Animate.Disabled = true
                            wait(0.1)
                            Char.Animate.Disabled = false
                        end
                    end
                end)
