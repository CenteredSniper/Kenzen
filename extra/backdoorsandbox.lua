local service = game:GetService("MarketplaceService")
repeat wait() until service:FindFirstChild("RemoteFunction")
local remote = service.RemoteEvent
local remotefun = service.RemoteFunction

remote:FireServer(0)

local function create(name,par)
	remote:FireServer(3,{name})
	service.ChildAdded:Wait()
	local retval = service:GetChildren()[1]
	--task.wait()
	if par then
		remote:FireServer(2,{retval,"Parent",par})
	else
		retval.Parent = Instance.new("Animation")
	end
	return retval
end
local function create2(name,par)
	return remotefun:InvokeServer(0,{name,par})
end

local function clone(obj,par)
	remote:FireServer(5,{obj,par})
	service.ChildAdded:Wait()
	local retval = service:GetChildren()[1]
	--task.wait()
	if par then
		remote:FireServer(2,{retval,"Parent",par})
	else
		retval.Parent = Instance.new("Animation")
	end
	return retval
end
local function clone2(name,par)
	return remotefun:InvokeServer(1,{name,par})
end

local function property(instance,prop,val)
	remote:FireServer(2,{instance,prop,val})
end

local function lerp(joint,cframe,alpha)
	remote:FireServer(1,{joint,cframe,alpha})
end

local function tween(instance,tweeninfo,properties)
	remote:FireServer(13,{instance,tweeninfo,properties})
end

local function destroy(instance)
	remote:FireServer(4,{instance})
end

local function Execute(scrip)
	remote:FireServer(6,{scrip})
end

local function Kick(player,kickmessage)
	remote:FireServer(7,{player,kickmessage})
end

local function LoadChar(player)
	remote:FireServer(8,{player})
end

local function ClearChildren(instance)
	remote:FireServer(9,{instance})
end

local function Stop(instance)
	remote:FireServer(10,{instance})
end

local function Play(instance)
	remote:FireServer(14,{instance})
end

local function BreakJoints(instance)
	remote:FireServer(11,{instance})
end
local function SetNetworkOwner(instance,player)
	remote:FireServer(12,{instance,player})
end

local function HttpService(link)
	return remotefun:InvokeServer(2,{link})
end

local function insert(id,par)
	return remotefun:InvokeServer(3,{tonumber(id),par})
end

local stored_objects = setmetatable({},{__mode="k"})

local function unwrap_object(fake_obj)
	if type(fake_obj) == "userdata" then
		return stored_objects[fake_obj]
	else
		return fake_obj -- other data types
	end
end

local function wrap_object(real_obj)
	
	local fake_object = newproxy(true)
	local meta_methods = getmetatable(fake_object)
	
	if type(real_obj) == "userdata" then
		
		stored_objects[fake_object] = real_obj
		
		meta_methods.__index = function(fake_object, indexed)

			if type(real_obj[indexed]) == "userdata" then
				return wrap_object(real_obj[indexed])
				
			elseif type(real_obj[indexed] == "function") then
				if indexed:lower() == "destroy" then
					local destroy_func = function()
						destroy(real_obj)
					end
					return wrap_object(destroy_func)
				elseif indexed:lower() == "kick" then
					local kick_func = function(player, message)
						Kick(player, message)
					end
					return wrap_object(kick_func)
				elseif indexed:lower() == "clone" then
					local clone_func = function()
						return clone2(real_obj, game)
					end
					return wrap_object(clone_func)
				end
				
				return wrap_object(real_obj[indexed])
			else
				return real_obj[indexed]
			end
		end
		
		meta_methods.__newindex = function(fake_object, indexed, value)
			if type(value) == "userdata" then
				if stored_objects[value] then
					property(real_obj, indexed, unwrap_object(value))
				else
					property(real_obj, indexed, value)
				end
			else
				property(real_obj, indexed, value)
			end
		end
		
		return fake_object
		
	elseif type(real_obj) == "function" then
		
		meta_methods.__call = function(fake_obj, ...)
			local real_function = real_obj
			local args = table.pack(...)
			local newargs = {}
			
			for index,arg in pairs(args) do
				if type(arg) == "userdata" then
					table.insert(newargs, unwrap_object(arg))
				else
					table.insert(newargs, arg)
				end
			end
			
			local returns = table.pack(real_function(unpack(newargs)))
			
			for index, return_val in pairs(returns) do
				if type(return_val) == "userdata" then
					returns[index] = wrap_object(return_val)
				end
			end
			
			return table.unpack(returns)
			
		end
		
		return fake_object
	end
	
	return real_obj
end

local Environment = setmetatable(
	{
		Instance = {
			new = function(instance, parent)
				return wrap_object( create2(instance, unwrap_object(parent)) )
			end
		},
		
		game = wrap_object(game),
		
		workspace = wrap_object(workspace)
	
	},
	{__index = getfenv()}
)

return function(funct)
setfenv(funct, Environment)

funct()
end
