--[[ // METADATA

Last Modified: 6/25/2018 9:35PM
Author: ???

--]]

--Fixed RemoteSpy by Internecivus
--Credit to Autumn for the original RemoteSpy
--GUI made by AmicusVale

local TextB = 0 
local Position = 0
local Size = 50
local CSize = 2  
local Setting = "MessageWarning" 
local Parent = game.CoreGui 
local IndexGame = "game." 
local IndexRE = ":FireServer(" 
local IndexRF = ":InvokeServer(" 
local Structure = ""
local CheckEORF = ""
local Arguments = ""
local ConvEORF = "nothing" 

Instance.new("ScreenGui", Parent)
Parent.ScreenGui.Name = "RSS" 

Instance.new("TextButton", Parent.RSS)
Parent.RSS.TextButton.Name = "MainFrame"
Parent.RSS.MainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
Parent.RSS.MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
Parent.RSS.MainFrame.Text = "" 
Parent.RSS.MainFrame.Draggable = true 
Parent.RSS.MainFrame.AutoButtonColor = false 
Parent.RSS.MainFrame.Style = "RobloxRoundButton"

wait(0.01) 
Instance.new("ScrollingFrame", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.ScrollingFrame.Name = "Output"
Parent.RSS.MainFrame.Output.Size = UDim2.new(0.95, 0, 0.5, 0)
Parent.RSS.MainFrame.Output.Position = UDim2.new(0.02, 0, 0.15, 0)
Parent.RSS.MainFrame.Output.BackgroundColor3 = Color3.fromRGB(236,236,236)
Parent.RSS.MainFrame.Output.BorderSizePixel = 3 
Parent.RSS.MainFrame.Output.CanvasSize = UDim2.new(0,0,2,0)

wait(0.01) 
Instance.new("TextBox", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.TextBox.Name = "Input"
Parent.RSS.MainFrame.Input.Size = UDim2.new(0.8, 0, 0.3, 0)
Parent.RSS.MainFrame.Input.Position = UDim2.new(0.1, 0, 0.68, 0)
Parent.RSS.MainFrame.Input.TextWrapped = true 
Parent.RSS.MainFrame.Input.Text = "" 
Parent.RSS.MainFrame.Input.TextScaled = true
Parent.RSS.MainFrame.Input.BackgroundColor3 = Color3.fromRGB(255,255,255)
Parent.RSS.MainFrame.Input.TextColor3 = Color3.fromRGB(36, 84, 241)
Parent.RSS.MainFrame.Input.ClearTextOnFocus = false 
Parent.RSS.MainFrame.Input.MultiLine = true

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.TextButton.Name = "MadeBy"
Parent.RSS.MainFrame.MadeBy.Size = UDim2.new(0.6, 0, 0.15, 0)
Parent.RSS.MainFrame.MadeBy.Position = UDim2.new(0.2, 0, 1.015, 0)
Parent.RSS.MainFrame.MadeBy.Text = "Made by: Amicus Vale"
Parent.RSS.MainFrame.MadeBy.TextSize = "20" 
Parent.RSS.MainFrame.MadeBy.Style = "RobloxButton"
Parent.RSS.MainFrame.MadeBy.TextColor3 = Color3.fromRGB(255,255,255)
Parent.RSS.MainFrame.MadeBy.AutoButtonColor = false 

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.TextButton.Name = "Execute"
Parent.RSS.MainFrame.Execute.Size = UDim2.new(0.25, 0, 0.15, 0)
Parent.RSS.MainFrame.Execute.Position = UDim2.new(-0.02, 0, 1.015, 0)
Parent.RSS.MainFrame.Execute.Text = "EXECUTE"
Parent.RSS.MainFrame.Execute.TextSize = "20" 
Parent.RSS.MainFrame.Execute.Style = "RobloxRoundDefaultButton"

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.TextButton.Name = "Clear"
Parent.RSS.MainFrame.Clear.Size = UDim2.new(0.25, 0, 0.15, 0)
Parent.RSS.MainFrame.Clear.Position = UDim2.new(0.774, 0, 1.015, 0)
Parent.RSS.MainFrame.Clear.Text = "CLEAR"
Parent.RSS.MainFrame.Clear.TextSize = "20" 
Parent.RSS.MainFrame.Clear.Style = "RobloxRoundDefaultButton"

wait(0.01) 
Instance.new("TextButton", Parent.RSS)
Parent.RSS.TextButton.Name = "Open"
Parent.RSS.Open.Size = UDim2.new(0.1, 0, 0.05, 0)
Parent.RSS.Open.Position = UDim2.new(0.31, 0, 0, 0)
Parent.RSS.Open.Text = "OPEN GUI"
Parent.RSS.Open.TextSize = "20" 
Parent.RSS.Open.Style = "RobloxRoundDefaultButton"
Parent.RSS.Open.Visible = false 

wait(0.01) 
Instance.new("TextButton", Parent.RSS)
Parent.RSS.TextButton.Name = "Close"
Parent.RSS.Close.Size = UDim2.new(0.1, 0, 0.05, 0)
Parent.RSS.Close.Position = UDim2.new(0.31, 0, 0, 0)
Parent.RSS.Close.Text = "CLOSE GUI"
Parent.RSS.Close.TextSize = "20" 
Parent.RSS.Close.Style = "RobloxRoundDefaultButton"

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.TextButton.Name = "CButton"
Parent.RSS.MainFrame.CButton.Size = UDim2.new(0.25, 0, 0.12, 0)
Parent.RSS.MainFrame.CButton.Position = UDim2.new(0.75, 0, 0, 0)
Parent.RSS.MainFrame.CButton.Text = "CONVERTER"
Parent.RSS.MainFrame.CButton.TextSize = "16" 
Parent.RSS.MainFrame.CButton.Style = "RobloxRoundDefaultButton"

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.TextButton.Name = "COButton"
Parent.RSS.MainFrame.COButton.Size = UDim2.new(0.25, 0, 0.12, 0)
Parent.RSS.MainFrame.COButton.Position = UDim2.new(0, 0, 0, 0)
Parent.RSS.MainFrame.COButton.Text = "clear output"
Parent.RSS.MainFrame.COButton.TextSize = "16" 
Parent.RSS.MainFrame.COButton.Style = "RobloxRoundDefaultButton"

wait(0.01) 
Instance.new("Frame", Parent.RSS.MainFrame)
Parent.RSS.MainFrame.Frame.Name = "SideFrame"
Parent.RSS.MainFrame.SideFrame.Size = UDim2.new(0.8, 0, 1, 0)
Parent.RSS.MainFrame.SideFrame.Position = UDim2.new(1.025, 0, 0, 0)
Parent.RSS.MainFrame.SideFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
Parent.RSS.MainFrame.SideFrame.BackgroundTransparency = 0.5 
Parent.RSS.MainFrame.SideFrame.BorderSizePixel = 0 
Parent.RSS.MainFrame.SideFrame.Visible = false 

wait(0.01) 
Instance.new("TextBox", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextBox.Name = "Path"
Parent.RSS.MainFrame.SideFrame.Path.Size = UDim2.new(0.8, 0, 0.1, 0)
Parent.RSS.MainFrame.SideFrame.Path.Position = UDim2.new(0.1, 0, 0.15, 0)
Parent.RSS.MainFrame.SideFrame.Path.TextWrapped = true 
Parent.RSS.MainFrame.SideFrame.Path.Text = "" 
Parent.RSS.MainFrame.SideFrame.Path.TextScaled = true
Parent.RSS.MainFrame.SideFrame.Path.BackgroundColor3 = Color3.fromRGB(255,255,255)
Parent.RSS.MainFrame.SideFrame.Path.TextColor3 = Color3.fromRGB(36, 84, 241)
Parent.RSS.MainFrame.SideFrame.Path.ClearTextOnFocus = false 
Parent.RSS.MainFrame.SideFrame.Path.MultiLine = true

wait(0.01) 
Instance.new("TextBox", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextBox.Name = "Arg"
Parent.RSS.MainFrame.SideFrame.Arg.Size = UDim2.new(0.8, 0, 0.1, 0)
Parent.RSS.MainFrame.SideFrame.Arg.Position = UDim2.new(0.1, 0, 0.4, 0)
Parent.RSS.MainFrame.SideFrame.Arg.TextWrapped = true 
Parent.RSS.MainFrame.SideFrame.Arg.Text = "" 
Parent.RSS.MainFrame.SideFrame.Arg.TextScaled = true
Parent.RSS.MainFrame.SideFrame.Arg.BackgroundColor3 = Color3.fromRGB(255,255,255)
Parent.RSS.MainFrame.SideFrame.Arg.TextColor3 = Color3.fromRGB(36, 84, 241)
Parent.RSS.MainFrame.SideFrame.Arg.ClearTextOnFocus = false 
Parent.RSS.MainFrame.SideFrame.Arg.MultiLine = true

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "REB"
Parent.RSS.MainFrame.SideFrame.REB.Size = UDim2.new(0.1, 0, 0.12, 0)
Parent.RSS.MainFrame.SideFrame.REB.Position = UDim2.new(0.22, 0, 0.55, 0)
Parent.RSS.MainFrame.SideFrame.REB.Text = ""
Parent.RSS.MainFrame.SideFrame.REB.TextSize = "16" 
Parent.RSS.MainFrame.SideFrame.REB.TextColor3 = Color3.fromRGB(255,255,255)
Parent.RSS.MainFrame.SideFrame.REB.BackgroundColor3 = Color3.fromRGB(150,150,150)
Parent.RSS.MainFrame.SideFrame.REB.BorderSizePixel = 0

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "REF"
Parent.RSS.MainFrame.SideFrame.REF.Size = UDim2.new(0.1, 0, 0.12, 0)
Parent.RSS.MainFrame.SideFrame.REF.Position = UDim2.new(0.65, 0, 0.55, 0)
Parent.RSS.MainFrame.SideFrame.REF.Text = ""
Parent.RSS.MainFrame.SideFrame.REF.TextSize = "16" 
Parent.RSS.MainFrame.SideFrame.REF.TextColor3 = Color3.fromRGB(255,255,255)
Parent.RSS.MainFrame.SideFrame.REF.BackgroundColor3 = Color3.fromRGB(150,150,150)
Parent.RSS.MainFrame.SideFrame.REF.BorderSizePixel = 0

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "Convert"
Parent.RSS.MainFrame.SideFrame.Convert.Size = UDim2.new(0.25, 0, 0.12, 0)
Parent.RSS.MainFrame.SideFrame.Convert.Position = UDim2.new(0.35, 0, 0.8, 0)
Parent.RSS.MainFrame.SideFrame.Convert.Text = "CONVERT"
Parent.RSS.MainFrame.SideFrame.Convert.TextSize = "16" 
Parent.RSS.MainFrame.SideFrame.Convert.Style = "RobloxRoundDefaultButton"

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "PTitle"
Parent.RSS.MainFrame.SideFrame.PTitle.Size = UDim2.new(0.25, 0, 0.12, 0)
Parent.RSS.MainFrame.SideFrame.PTitle.Position = UDim2.new(0.35, 0, 0.01, 0)
Parent.RSS.MainFrame.SideFrame.PTitle.Text = "Path:"
Parent.RSS.MainFrame.SideFrame.PTitle.TextSize = "20" 
Parent.RSS.MainFrame.SideFrame.PTitle.BackgroundTransparency = 1 
Parent.RSS.MainFrame.SideFrame.PTitle.TextColor3 = Color3.fromRGB(255,255,255)

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "ATitle"
Parent.RSS.MainFrame.SideFrame.ATitle.Size = UDim2.new(0.25, 0, 0.12, 0)
Parent.RSS.MainFrame.SideFrame.ATitle.Position = UDim2.new(0.38, 0, 0.26, 0)
Parent.RSS.MainFrame.SideFrame.ATitle.Text = "Args:"
Parent.RSS.MainFrame.SideFrame.ATitle.TextSize = "20" 
Parent.RSS.MainFrame.SideFrame.ATitle.BackgroundTransparency = 1 
Parent.RSS.MainFrame.SideFrame.ATitle.TextColor3 = Color3.fromRGB(255,255,255)

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "RETitle"
Parent.RSS.MainFrame.SideFrame.RETitle.Size = UDim2.new(0.25, 0, 0.15, 0)
Parent.RSS.MainFrame.SideFrame.RETitle.Position = UDim2.new(0.14, 0, 0.65, 0)
Parent.RSS.MainFrame.SideFrame.RETitle.Text = "RemoteEvent"
Parent.RSS.MainFrame.SideFrame.RETitle.TextSize = "18" 
Parent.RSS.MainFrame.SideFrame.RETitle.BackgroundTransparency = 1 
Parent.RSS.MainFrame.SideFrame.RETitle.TextColor3 = Color3.fromRGB(255,255,255)

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "RFTitle"
Parent.RSS.MainFrame.SideFrame.RFTitle.Size = UDim2.new(0.25, 0, 0.15, 0)
Parent.RSS.MainFrame.SideFrame.RFTitle.Position = UDim2.new(0.59, 0, 0.65, 0)
Parent.RSS.MainFrame.SideFrame.RFTitle.Text = "RemoteFunction"
Parent.RSS.MainFrame.SideFrame.RFTitle.TextSize = "18" 
Parent.RSS.MainFrame.SideFrame.RFTitle.BackgroundTransparency = 1 
Parent.RSS.MainFrame.SideFrame.RFTitle.TextColor3 = Color3.fromRGB(255,255,255)

wait(0.01) 
Instance.new("TextButton", Parent.RSS.MainFrame.SideFrame)
Parent.RSS.MainFrame.SideFrame.TextButton.Name = "Error"
Parent.RSS.MainFrame.SideFrame.Error.Size = UDim2.new(0.25, 0, 0.12, 0)
Parent.RSS.MainFrame.SideFrame.Error.Position = UDim2.new(0.38, 0, 0.88, 0)
Parent.RSS.MainFrame.SideFrame.Error.Text = "YOU NEED TO SELECT A REMOTE"
Parent.RSS.MainFrame.SideFrame.Error.TextSize = "16" 
Parent.RSS.MainFrame.SideFrame.Error.BackgroundTransparency = 1 
Parent.RSS.MainFrame.SideFrame.Error.TextColor3 = Color3.fromRGB(255,0,0)
Parent.RSS.MainFrame.SideFrame.Error.Visible = false 

local enabled = {
   -- Set any of these objects to false to stop logging them
   BindableEvent = false;
   BindableFunction = false;
   RemoteEvent = true;
   RemoteFunction = true;
}

local ignore = {
   -- Any remotes matching the names listed below will be ignored
   Event = true;
}

local meta,oldmeta = getrawmetatable(game),{}
for i,v in next,meta do oldmeta[i] = v end
function formatargs(args,showkeys)
   if type(args) ~= "table" then args = {args} end
   if #args == 0 then return "N/A" end
   local strargs = {}
   for k,v in next,args do
       local argstr = ""
       if type(v) == "string" then
           argstr = "\"" .. v .. "\""
       elseif type(v) == "table" then
           argstr = "{" .. formatargs(v,true) .. "}"
       else
           argstr = tostring(v)
       end
       if showkeys and type(k) ~= "number" then
           table.insert(strargs,k.."="..argstr)
       else
           table.insert(strargs,argstr)
       end
   end
   return table.concat(strargs, ", ")
end
local realmethods = {}
realmethods.Fire = Instance.new("BindableEvent").Fire
realmethods.Invoke = Instance.new("BindableFunction").Invoke
realmethods.FireServer = Instance.new("RemoteEvent").FireServer
realmethods.InvokeServer = Instance.new("RemoteFunction").InvokeServer
meta.__namecall = function(t,...)
   local args = {...}
   local k = args[#args]
   if (k == "Fire" or k == "Invoke" or k == "FireServer" or k == "InvokeServer") and (enabled[t.ClassName] and not ignore[t.Name]) then
           ret = oldmeta.__namecall(t,...)
           table.remove(args)
Structure = IndexGame .. t:GetFullName() 
CheckEORF = t.ClassName
Arguments = formatargs(args) .. ")" 
wait(0.05) 
 warn(t.ClassName.." called!\nPath: "..t:GetFullName().."\n".."Args: "..formatargs(args).."\nReturn: "..formatargs(ret))

return ret

else
	
       return oldmeta.__namecall(t,...)
    
	end
end

game:GetService("LogService").MessageOut:connect(function(Message, Type)
while wait() do 
local wow = string.match(Message, "R%w+")
if CheckEORF == "RemoteEvent" and Type == Enum.MessageType[Setting] and wow == "RemoteEvent" then
TextB = TextB + 1 
Instance.new("TextButton", Parent.RSS.MainFrame.Output)
Parent.RSS.MainFrame.Output.TextButton.Name = TextB 
Parent.RSS.MainFrame.Output[TextB].Size = UDim2.new(0.8, 0, 0, (Size))
Parent.RSS.MainFrame.Output[TextB].Text = Structure .. IndexRE .. Arguments
Parent.RSS.MainFrame.Output[TextB].TextScaled = true
Parent.RSS.MainFrame.Output[TextB].BackgroundColor3 = Color3.fromRGB(171,0,0)
Parent.RSS.MainFrame.Output[TextB].Font = "SciFi"
Parent.RSS.MainFrame.Output[TextB].TextColor3 = Color3.fromRGB(255,255,255)
CSize = CSize + 0.5
Parent.RSS.MainFrame.Output.CanvasSize = UDim2.new(0, 0, (CSize), 0)
Position = Position + 50
Parent.RSS.MainFrame.Output[TextB].Position = UDim2.new(0.07, 0, 0, (Position))
break 

elseif CheckEORF == "RemoteFunction" and Type == Enum.MessageType[Setting] and wow == "RemoteFunction" then 
TextB = TextB + 1 
Instance.new("TextButton", Parent.RSS.MainFrame.Output)
Parent.RSS.MainFrame.Output.TextButton.Name = TextB 
Parent.RSS.MainFrame.Output[TextB].Size = UDim2.new(0.8, 0, 0, (Size))
Parent.RSS.MainFrame.Output[TextB].Text = Structure .. IndexRF .. Arguments
Parent.RSS.MainFrame.Output[TextB].TextScaled = true
Parent.RSS.MainFrame.Output[TextB].BackgroundColor3 = Color3.fromRGB(171,0,0)
Parent.RSS.MainFrame.Output[TextB].Font = "SciFi"
Parent.RSS.MainFrame.Output[TextB].TextColor3 = Color3.fromRGB(255,255,255)
CSize = CSize + 0.5
Parent.RSS.MainFrame.Output.CanvasSize = UDim2.new(0, 0, (CSize), 0)
Position = Position + 50
Parent.RSS.MainFrame.Output[TextB].Position = UDim2.new(0.07, 0, 0, (Position))
break
 
end 
     end   
end)

Parent.RSS.MainFrame.Output.ChildAdded:connect(function(c)
if c:IsA("TextButton") then 
c.MouseButton1Down:connect(function()
Parent.RSS.MainFrame.Input.Text = Parent.RSS.MainFrame.Input.Text .. "   " .. c.Text
end)
end 
end) 

Parent.RSS.MainFrame.Execute.MouseButton1Down:connect(function() 
loadstring(Parent.RSS.MainFrame.Input.Text)() 
end)

Parent.RSS.MainFrame.Clear.MouseButton1Down:connect(function() 
Parent.RSS.MainFrame.Input.Text = ""
end)

Parent.RSS.Close.MouseButton1Down:connect(function() 
Parent.RSS.Close.Visible = false 
Parent.RSS.MainFrame.Visible = false 
Parent.RSS.Open.Visible = true 	
end)

Parent.RSS.Open.MouseButton1Down:connect(function() 
Parent.RSS.Open.Visible = false 
Parent.RSS.MainFrame.Visible = true
Parent.RSS.Close.Visible = true 	
end)


Parent.RSS.MainFrame.CButton.MouseButton1Down:connect(function() 
if Parent.RSS.MainFrame.SideFrame.Visible == false then 
	Parent.RSS.MainFrame.SideFrame.Visible = true 
else 
	Parent.RSS.MainFrame.SideFrame.Visible = false	
	end
end)

Parent.RSS.MainFrame.SideFrame.REB.MouseButton1Down:connect(function() 
if Parent.RSS.MainFrame.SideFrame.REF.Text ~= "X" and Parent.RSS.MainFrame.SideFrame.REB.Text == ""  then 
Parent.RSS.MainFrame.SideFrame.REB.Text = "X" 
ConvEORF = ":FireServer(" 
elseif  
	Parent.RSS.MainFrame.SideFrame.REB.Text == "X"
then 
    Parent.RSS.MainFrame.SideFrame.REB.Text = "" 
    ConvEORF = "nothing" 
end 
end)

Parent.RSS.MainFrame.SideFrame.REF.MouseButton1Down:connect(function() 
if Parent.RSS.MainFrame.SideFrame.REB.Text ~= "X" and Parent.RSS.MainFrame.SideFrame.REF.Text == "" then 
Parent.RSS.MainFrame.SideFrame.REF.Text = "X" 
ConvEORF = ":InvokeServer(" 
elseif  
	Parent.RSS.MainFrame.SideFrame.REF.Text == "X" 
then 
 	Parent.RSS.MainFrame.SideFrame.REF.Text = "" 
    ConvEORF = "nothing" 
end 
end)

Parent.RSS.MainFrame.SideFrame.Convert.MouseButton1Down:connect(function() 
if ConvEORF == "nothing" then 
	Parent.RSS.MainFrame.SideFrame.Error.Visible = true 
	wait(2) 
	Parent.RSS.MainFrame.SideFrame.Error.Visible = false 
else 
	Parent.RSS.MainFrame.Input.Text = Parent.RSS.MainFrame.Input.Text .. "   " .. IndexGame .. Parent.RSS.MainFrame.SideFrame.Path.Text .. ConvEORF.. Parent.RSS.MainFrame.SideFrame.Arg.Text .. ")" 
	end
end)

Parent.RSS.MainFrame.COButton.MouseButton1Down:connect(function()
for index, buttons in pairs(Parent.RSS.MainFrame.Output:GetChildren()) do
(buttons):remove()
Position = 0
TextB = 0 
Parent.RSS.MainFrame.Output.CanvasSize = UDim2.new(0, 0, 2, 0)
CSize = 2  
	end
end)
