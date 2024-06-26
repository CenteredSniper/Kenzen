--[[ // METADATA

Last Modified: 12/29/2021 6:45AM
Author: ???

--]]

local gui = game:GetObjects("rbxassetid://8393592926")[1]
gui.Parent = game.CoreGui

local roundDecimals = function(num) --num is your number or value and places is number of decimal places, in your case you would need 2
    local places = 2
    places = math.pow(10, places or 0)
    num = num * places
   
    if num >= 0 then 
        num = math.floor(num + 0.5) 
    else 
        num = math.ceil(num - 0.5) 
    end
    
    return num / places
    
end

while gui do
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    local cpu,maxcpu = game:GetService("Stats").PerformanceStats.CPU:GetValue()
    local avggpu,gpu,maxgpu = game:GetService("Stats").FrameRateManager.AverageGPU:GetValue(),game:GetService("Stats").PerformanceStats.GPU:GetValue()
    local memory,maxmemory = game:GetService("Stats").PerformanceStats.Memory:GetValue()
    gui.Frame.Frame.Ping.Text = "Ping: " .. roundDecimals(ping)
    gui.Frame.Frame.Cpu.Text = "CPU: \n Now: " .. roundDecimals(cpu) 
    gui.Frame.Frame.Gpu.Text = "GPU: \n Avg: " .. roundDecimals(avggpu) .. " | Now: " .. roundDecimals(gpu) 
    gui.Frame.Frame.Memory.Text = "Memory: \n Now: " .. roundDecimals(memory) 
    wait(0.25)
end

local UIS = game:GetService("UserInputService")
local function dragify(Frame,boool)
	local frametomove = Frame.Parent
	local dragToggle,dragInput,dragStart,startPos
	local dragSpeed = 0
	local function updateInput(input)
		local Delta = input.Position - dragStart
		frametomove.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = frametomove.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)	
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(gui.Frame.Drag)
