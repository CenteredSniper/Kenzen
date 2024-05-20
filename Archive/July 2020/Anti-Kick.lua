--[[ // METADATA

Last Modified: 7/26/2020 9:57PM
Author: ???

--]]

local mt = getrawmetatable(game)
local backup = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
   local method = getnamecallmethod()
   local args = {...}
   if method == "Kick" then
       return wait(9e9)
   end
   return backup(self,...)
end)

setreadonly(mt, true)
