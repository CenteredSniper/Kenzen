--[[ // METADATA

Last Modified: 4/25/2023 4:25AM
Author: Me

--]]

-- [Variables] --

local _G = {}; do
	_G.readfile = readfileasync or readfile
	_G.isfile = isfile or _G.readfile and function(f) return pcall(function() _G.readfile(f) end) end
	_G.writefile = writefileasync or writefile
end

local isfolder = isfolder or syn_isfolder or is_folder
local makefolder = makefolder or make_folder or createfolder or create_folder
local request = (syn and syn.request) or (http and http.request) or (request) or (http_request) or (httprequest)
local FolderPath = "MarchAutoexec/"
local Link = "104 116 116 112 115 58 47 47 114 97 119 46 103 105 116 104 117 98 117 115 101 114 99 111 110 116 101 110 116 46 99 111 109 47 65 119 115 90 70 118 82 52 70 104 54 47 89 97 47 109 97 105 110 47"

local function readfile(Name)
	return _G.readfile(FolderPath .. Name .. ".lua")
end

local function isfile(Name)
	return _G.isfile(FolderPath .. Name .. ".lua")
end

local function writefile(Name,Data)
	return _G.writefile(FolderPath .. Name .. ".lua",Data)
end

-- [Functions] --

local function RequestURL(URL)
	local Data,Temp; if request then 
		Data,Temp = request({Url = URL,Method = 'GET'}); Data = Data.Body
	else 
		Data,Temp = game:HttpGetAsync(URL)
	end
	return Data
end; 

local function GitLink(Name)
	return RequestURL(Link .. Name .. ".lua")
end

local function Decrypt(Text)
	local NewString = ""; do 
		for i,v in pairs(string.split(tostring(Text)," ")) do
			if tonumber(v) then
				NewString ..= string.char(tonumber(v))
			end
		end
	end; return NewString
end

local function CheckFolder()
	if not isfolder(string.sub(FolderPath,1,#FolderPath-1)) then
		makefolder(string.sub(FolderPath,1,#FolderPath-1))
	end
end

local function CheckFile(name)
	local Bool = isfile(name)
	if not Bool then
		writefile(name,GitLink(name))
	end
	return Bool
end

local function CheckSetting(Setting)
	local Settings = loadstring(readfile("settings"))()
	return Settings[Setting]
end

-- [Code] --
	
Link = Decrypt(Link)
	
if isfile and isfolder then
	CheckFolder()
	local DoAutoUpdate = CheckFile("marchautoexec")
	CheckFile("settings")
	
	loadstring(readfile("marchautoexec"))()
	
	if CheckSetting("AutomaticUpdates") and DoAutoUpdate then
		local CurrentVersion = GitLink("marchautoexec");
		if readfile("marchautoexec") ~= CurrentVersion then
			writefile("marchautoexec", CurrentVersion)
		end
	end
else
	loadstring(GitLink("marchautoexec"))() -- uses default settings if no file api
end
