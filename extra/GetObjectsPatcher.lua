local Global = getgenv and getgenv() or shared or _G

if not Global.GetObjects then
	local cloneref = cloneref or function(ref) return ref end
	local clonefunction = clonefunction or function(func) return func end
	local protectedcall = clonefunction(pcall)
	local GetService = clonefunction(game.GetService)
	local InsertService = cloneref(GetService(game, "InsertService"))
	local LoadLocalAsset = clonefunction(InsertService.LoadLocalAsset)
	local OldGetObjects = clonefunction(game.GetObjects)
	local table_insert = clonefunction(table.insert)
	local task_spawn = clonefunction(task.spawn)
	
	local NewGetObjects = function(ID,Toggle)
		return ID and Toggle and OldGetObjects(ID) or ID and {LoadLocalAsset(InsertService, ID)}
	end
	
	Global.GetObjects = NewGetObjects -- feel obligated to add this
	
	if Global.HookGetObjects and not Global.GetObjectsPatch then
		local OldGetObjects

		if pcall(function() tostring(game.GetObjects) end) then
			OldGetObjects = hookfunction(game.GetObjects, newcclosure(function(Self, ...)
				if checkcaller() and Self == game then 
					return NewGetObjects(Self, ...)
				end
				return OldGetObjects(Self, ...)
			end))
		end

		local OldNameCall = nil

		OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
			local NameCallMethod = getnamecallmethod()
			if checkcaller()and Self == game and NameCallMethod == "GetObjects" then
				return NewGetObjects(...)
			end
			return OldNameCall(Self, ...)
		end))
		Global.GetObjectsPatch = true
	end
end
