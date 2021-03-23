local lighting = game:GetService("Lighting")
local music = false
lighting.Brightness = 3
--lighting.Technology = Enum.Technology.ShadowMap
sethiddenproperty(lighting, "Technology", Enum.Technology.ShadowMap)  
lighting.GlobalShadows = true
lighting.ShadowSoftness = 0.2
lighting.ExposureCompensation = 0.4

for i,v in pairs(lighting:GetChildren()) do
    if v:IsA("SunRaysEffect") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") then 
        v:Destroy()
    end
end

local sunRays = lighting:FindFirstChild("SniperSun") or Instance.new("SunRaysEffect",lighting)
local bloom = lighting:FindFirstChild("SniperBloom") or Instance.new("BloomEffect",lighting)
local colorc = lighting:FindFirstChild("SniperColor") or Instance.new("ColorCorrectionEffect",lighting)
local blur = lighting:FindFirstChild("SniperBlur") or Instance.new("BlurEffect",lighting)

colorc.Name = "SniperColor"
colorc.Brightness = 0.05
colorc.Saturation = 0.2

sunRays.Name = "SniperSun"
sunRays.Intensity = .3
sunRays.Spread = 0.5

bloom.Name = "SniperBloom"
bloom.Intensity = 0.96
bloom.Size = 32
bloom.Threshold = 2.7

blur.Name = "SniperBlur"
blur.Size = 0.5

-- Lights
for i,v in pairs(workspace:GetDescendants()) do
    if v:IsA("SpotLight") and v.Brightness >= 2.001 then
        v.Brightness = 2
    elseif v:IsA("PointLight") and v.Brightness >= 2.001 then
        v.Brightness = 2   
    end
end

-- Day Cycle
if _G.DayCycle ~= true then
  _G.DayCycle = true
  --lighting.ClockTime = 0
  local dayLength = 24
  local cycleTime = dayLength*60
  local minutesInADay = 24*60
  local startTime = tick() - (lighting:getMinutesAfterMidnight() / minutesInADay)*cycleTime
  local endTime = startTime + cycleTime
  local timeRatio = minutesInADay / cycleTime
  if dayLength == 0 then
	  dayLength = 1
  end
repeat
	local currentTime = tick()
	
	if currentTime > endTime then
		startTime = endTime
		endTime = startTime + cycleTime
	end
	
	lighting:setMinutesAfterMidnight((currentTime - startTime)*timeRatio)
	wait(1/15)
until false
end
