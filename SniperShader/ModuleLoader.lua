if _G.loadmode then
  if _G.loadmode["Shaders"] then
    loadstring(game:HttpGet('https://github.com/CenteredSniper/Kenzen/blob/master/SniperShader/Shaders.lua'))()
  if _G.loadmode["MusicUI"] then
    loadstring(game:HttpGet('https://github.com/CenteredSniper/Kenzen/blob/master/SniperShader/MusicUI.lua'))()
  if _G.loadmode["SyncCommands"] then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/SniperSync.lua'))()
  end
end
