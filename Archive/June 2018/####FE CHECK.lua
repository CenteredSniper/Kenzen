--[[ // METADATA

Last Modified: 6/25/2018 9:34PM
Author: ???

--]]

if game.Workspace.FilteringEnabled then
game.StarterGui:SetCore("SendNotification",{Title="FE CHECK!",Text="FE Is Enabled :(",Icon="",Duration=2,Callback=c,Button1="",Button2=""})
else
game.StarterGui:SetCore("SendNotification",{Title="FE CHECK!",Text="FE Is Disabled :)",Icon="",Duration=2,Callback=c,Button1="",Button2=""})
end
