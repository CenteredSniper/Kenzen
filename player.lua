local getasset = getsynasset or getcustomasset or error("Exploit not supported")
local isfile = isfile or readfile and function(f) return pcall(function() readfile(f) end) end
local request = (syn and syn.request) or (http and http.request) or (request)
local VideoFrame = workspace:WaitForChild("Screen"):WaitForChild("SurfaceGui"):WaitForChild("VideoFrame")

local TimeStamp,URL,URLName = VideoFrame:WaitForChild("TimeStamp"),VideoFrame:WaitForChild("URL"),VideoFrame:WaitForChild("URLName")

local fwait = fwait or task.wait

if not isfolder("Videos") then makefolder("Videos") end

local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SliderGui")
if gui:FindFirstChild("Frame") then
	gui.Frame:Destroy()
end

local function PlayVideo()
	if URL.Value ~= "" then
		game:GetService("ReplicatedStorage").Loading:FireServer(true)
		gui.TextLabel.Visible = true
		local name = "Videos/" .. URLName.Value
		print(name)
		local file,filesize
		local lowestquality = gui:GetAttribute("LowestQuality")
		if isfile(name) then
			file = getasset(name)
		else
			local Link = URL.Value
			if string.find(URL.Value,"ytmp4.buzz") then
				local Response, TempFile
				if request then
					Response, TempFile = request({Url = URL.Value,Method = 'GET'})
					Response = Response.Body
				else
					Response, TempFile = game:HttpGet(URL.Value)
				end
				Response = game:GetService("HttpService"):JSONDecode(Response)
				Link = Response.vidInfo[lowestquality and #Response.vidInfo or 1].dloadUrl
				filesize = Response.vidInfo[lowestquality and #Response.vidInfo or 1].rSize
			end
			if request then
				local Response, TempFile = request({Url = Link,Method = 'GET'})
				if Response.StatusCode == 200 then
					writefile(name,Response.Body)
					file = getasset(name)
				end
			else
				local Response = game:HttpGet(URL.Value)
				if Response then
					writefile(name, Response)
					file = getasset(name)
				end
			end
		end
		
		
		if file then
			VideoFrame.Video = file
			repeat  
				gui.TextLabel.Text = "Video Downloading.. (" .. tostring(math.round(readfile(name):len()/10000)/100) .. "/" ..  filesize .. ")"
				fwait()
			until VideoFrame.IsLoaded
			VideoFrame:Play()
			VideoFrame.TimePosition = TimeStamp.Value
		end
		game:GetService("ReplicatedStorage").Loading:FireServer(false)
		gui.TextLabel.Visible = false
	else
		VideoFrame:Pause()
		VideoFrame.TimePosition = TimeStamp.Value
	end
end

URL.Changed:Connect(function()
	PlayVideo()
end)

PlayVideo()
