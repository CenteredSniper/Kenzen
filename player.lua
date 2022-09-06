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

local AverageDownloadSpeed = 0
task.spawn(function()
	local Tick = tick()
	local Response, TempFile
	if request then
		Response, TempFile = request({Url = "https://gist.githubusercontent.com/khaykov/a6105154becce4c0530da38e723c2330/raw/41ab415ac41c93a198f7da5b47d604956157c5c3/gistfile1.txt",Method = 'GET'})
	else
		Response, TempFile = game:HttpGet("https://gist.githubusercontent.com/khaykov/a6105154becce4c0530da38e723c2330/raw/41ab415ac41c93a198f7da5b47d604956157c5c3/gistfile1.txt")
	end
	AverageDownloadSpeed = tick()-Tick
	print("Average Download: " .. AverageDownloadSpeed)
end)

local function PlayVideo()
	if URL.Value ~= "" then
		game:GetService("ReplicatedStorage").Loading:FireServer(true)
		gui.TextLabel.Visible = true
		gui.TextLabel.Text = "Downloading Video.."
		local name = "Videos/" .. URLName.Value
		print(name)
		local file
		local filesize = "?"
		local lowestquality = gui:GetAttribute("LowestQuality") == true
		warn(lowestquality and "360p" or "720p")
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
				local Quality = Response.vidInfo[lowestquality and 2 or 1]
				Link = Response.vidInfo[lowestquality and #Response.vidInfo or 1].dloadUrl
				filesize = Response.vidInfo[lowestquality and #Response.vidInfo or 1].rSize
			elseif string.find(URL.Value,"vevioz.com") then
				local Response, TempFile
				if request then
					Response, TempFile = request({Url = URL.Value,Method = 'GET'})
					Response = Response.Body
				else
					Response, TempFile = game:HttpGet(URL.Value)
				end
				local Quality = lowestquality and 2 or 1
				
				local Links = {}
				for i,v in pairs(string.split(Response,'<a href="')) do
					if i == 2 or i == 3 then
						local link = string.sub(v,1,string.find(v,'"')-1)
						local filesize = string.sub(v,string.find(v,'MB')-10,string.find(v,'MB')+1)
						filesize = string.sub(filesize,string.find(filesize,'>')+1)
						table.insert(Links,{link,filesize})
					end
				end
				Link = Links[Quality][1]
				filesize = Links[Quality][2]
			end
			filesize = tonumber(string.sub(filesize,1,#filesize-3))
			gui.TextLabel.Text = "Downloading Video (Est. " .. tostring(math.round((filesize*AverageDownloadSpeed)*10)/10) .. "s)"
			local Response
			if request then
				local RE, TempFile = request({Url = Link,Method = 'GET'})
				Response = RE.Body
			else
				local Response = game:HttpGet(URL.Value)
			end
			if Response then
				writefile(name, Response)
				file = getasset(name)
			end
		end
		
		if file then
			VideoFrame.Video = file
			if not VideoFrame.IsLoaded then VideoFrame.Loaded:Wait() end
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
