--[[ // METADATA

Last Modified: 4/25/2023 4:51AM
Author: Me

--]]

-- ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
--  RoTracker by ProductionTakeOne#3330
-- ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅

if not readfile then
	return -- You need file access
end

local PlayersInGame = {}
local Players = game:GetService("Players")
local HTTP = game:GetService("HttpService")
local isfile = isfile or readfile and function(f) return pcall(function() readfile(f) end) end
local Global = Global or getgenv and getgenv() or shared or _G or getfenv(0)
local fwait = fwait or task.wait
local Data = isfile("RoTracker.Data") and HTTP:JSONDecode(readfile("RoTracker.Data")); if not Data then
	writefile("RoTracker.Data",HTTP:JSONEncode({})); Data = {}
end

--[[ 
	To Do:
	- Log games played
	- Log playtime
	- Log messages sent
]]

local function SaveData()
	for i,v in pairs(PlayersInGame) do
		local Additive = tick()-v
		PlayersInGame[i] = tick()
		local UserId = tostring(i.UserId)
		Data[UserId].PlayTimeTotal += Additive
		local Table = Data[UserId].Games[game.PlaceId]
		Data[UserId].Games[game.PlaceId] = {Table[1]+(Additive),Table[2],Table[3]}
	end
	--print(HTTP:JSONEncode(Data))
	writefile("RoTracker.Data",HTTP:JSONEncode(Data))
end

local function AddPlayer(Player)
	if Player ~= Players.LocalPlayer then
		local UserId = tostring(Player.UserId)

		PlayersInGame[Player] = tick()

		if not Data[UserId] then
			Data[UserId] = {
				Games = {
					[game.PlaceId] = {0,0,1} -- PlayTime,Messages,TimesMet
				},
				MessagesTotal = 0,
				TimesMetTotal = 1,
				PlayTimeTotal = 0,
				NameHistory = {Player.Name},
			}; 
		else
			if Data[UserId].Games[game.PlaceId] then
				local Table = Data[UserId].Games[game.PlaceId]
				Data[UserId].Games[game.PlaceId] = {Table[1],Table[2],Table[3]+1}
			else
				Data[UserId].Games[game.PlaceId] = {0,0,1}
			end

			Data[UserId].TimesMetTotal += 1

			if not table.find(Data[UserId].NameHistory,Player.Name) then
				table.insert(Data[UserId].NameHistory,Player.Name)
			end
		end
	end
end

local function RemovePlayer(Player)
	SaveData()
	PlayersInGame[Player] = nil
end

if not game:IsLoaded("Workspace") then 
	game.Loaded:Wait()
end; fwait = Global.fwait or task.wait
local RoundNumber = Global.RoundNumber or math.round

game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(message)
	pcall(function()
		local UserId = game:GetService("Players"):FindFirstChild(message.FromSpeaker)
		if UserId then UserId = tostring(UserId.UserId)
			Data[UserId].MessagesTotal += 1
			local Table = Data[UserId].Games[game.PlaceId]
			Data[UserId].Games[game.PlaceId] = {Table[1],Table[2]+1,Table[3]}
		end
	end)
end)

local LocalPlayer = Players.LocalPlayer

for i,v in pairs(Players:GetPlayers()) do
	AddPlayer(v)
end

Players.PlayerAdded:Connect(AddPlayer)
Players.PlayerRemoving:Connect(RemovePlayer)

Global.SavePlayerData = SaveData

Global.GetPlayerData = function(Name)
	local Searching = true
	for i,v in pairs(Data) do
		--if string.lower(Players:GetNameFromUserIdAsync(i)) == string.lower(Name) then
		if table.find(v.NameHistory,Name) then
			Searching = false
			return "Player " .. Name .. " | Times Met: " .. v.TimesMetTotal .. " | Playtime: " .. RoundNumber(v.PlayTimeTotal,2)
			--return "---\n" .. "Player " .. i .. " (" .. v.NameHistory[#v.NameHistory] .. ")\nTimes Met: " .. v.TimesMetTotal .. "\nMessages: " .. v.MessagesTotal .. "\nPlayTimeTotal: " .. v.PlayTimeTotal .. "\n---"
		end
	end
	if Searching then
		return "Player " .. Name .. " is not in the database."
	end
end

while true do
	fwait(60) -- 5 minutes is good
	SaveData()
end
