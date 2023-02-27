local Global = Global or getgenv and getgenv() or shared or _G

if Global.GasStation then
	return
end; Global.GasStation = true

local Settings = {
	AutoCash = true,
	AutoClean = true, -- includes soda buying
}

--===--

local function GetToPath(From,Directory)
	for i,v in pairs(string.split(Directory,".")) do
		From = From:WaitForChild(v)
	end return From
end

local Player = game:GetService("Players").LocalPlayer

local PlayerAction = GetToPath(Player.Character,"HumanoidRootPart.InfoUI.Holder.PlayerAction")
local Amount = GetToPath(Player,"PlayerGui.GameUI.Stamina.Bar.Amount")
local CashPrompt = GetToPath(Player,"PlayerGui.paycheck.Check.Prompt.Claim")
local ReportPrompt = GetToPath(Player,"PlayerGui.GameUI.Billing")
local Soda = GetToPath(workspace,"Vendors.Vendor_BloxBull_1.Root.Button.BuyBloxBull")

local Queue = {}
local fwait = fwait or task.wait

local function FireProximity(Proximity)
	fireproximityprompt(Proximity,3)
	repeat PlayerAction.Changed:Wait() until PlayerAction.Text ~= ""
	repeat PlayerAction.Changed:Wait() until PlayerAction.Text == ""
end

local function FireButton(GUIButton)
	for i,v in ipairs({'MouseButton1Down','MouseButton1Click','Activated','MouseButton1Up'}) do
		firesignal(GUIButton[v])
		for i,v in pairs(getconnections(GUIButton[v])) do
			v:Fire()
		end
	end
end

if Settings.AutoCash and firesignal and getconnections then 
	CashPrompt.Changed:Connect(function()
		task.wait(.3)
		FireButton(CashPrompt)
	end) 
	ReportPrompt:GetPropertyChangedSignal("Visible"):Connect(function()
		ReportPrompt.Visible = false
	end)
end

if Settings.AutoClean and fireproximityprompt then
	for i,v in pairs(GetToPath(workspace,"Windows"):GetChildren()) do
		local Prompt = GetToPath(v,"Attachment.Clean")
		if Prompt.Enabled then
			table.insert(Queue,Prompt)
		end
		Prompt.Changed:Connect(function()
			if Prompt.Enabled then
				task.wait(5) -- delay jsut incase
				table.insert(Queue,Prompt)
			end
		end)
	end
	-- game:GetService("Workspace").Checkouts.Register_Test1.Items["Chocolate Bar"].Root.Scan
	for i,v in pairs(GetToPath(workspace,"Checkouts"):GetChildren()) do
		for i,Item in pairs(GetToPath(v,"Items"):GetChildren()) do
			if Item:FindFirstChild("Scan",true) then
				table.insert(Queue,GetToPath(Item,"Root.Scan"))
			end
		end
		GetToPath(v,"Items").ChildAdded:Connect(function(Item)
			task.wait(2)
			if Item:FindFirstChild("Scan",true) then
				table.insert(Queue,Item:FindFirstChild("Scan",true))
			end
		end)
	end
	
	for i,v in pairs(GetToPath(workspace,"Solar.Panels"):GetChildren()) do
		local Prompt = GetToPath(v,"Stand.CleanPosition.Clean")
		if Prompt.Enabled then
			table.insert(Queue,Prompt)
		end
		Prompt.Changed:Connect(function()
			if Prompt.Enabled then
				task.wait(5) -- delay jsut incase
				table.insert(Queue,Prompt)
			end
		end)
	end
	
	for i,Stain in pairs(GetToPath(workspace,"Stains"):GetChildren()) do
		if Stain:FindFirstChild("Clean") then
			--FireProximity(GetToPath(Stain,"Clean"))
			table.insert(Queue,GetToPath(Stain,"Clean"))
		end
	end
	
	GetToPath(workspace,"Stains").ChildAdded:Connect(function(Stain)
		task.wait(1.5) -- delay just incase
		if Stain:FindFirstChild("Clean") then
			--FireProximity(GetToPath(Stain,"Clean"))
			table.insert(Queue,GetToPath(Stain,"Clean"))
		end
	end)

	task.defer(function()
		while true do
			if tonumber(string.sub(Amount.Text,1,#Amount.Text-1)) <= 20 then 
				FireProximity(Soda)
			end

			if Queue[1] then
				if Queue[1].Parent and Queue[1].Enabled then 
					FireProximity(Queue[1])
				end
				table.remove(Queue,1)
			end

			fwait()
		end
	end)
end
