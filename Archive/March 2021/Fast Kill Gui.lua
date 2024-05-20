--[[ // METADATA

Last Modified: 3/4/2021 11:55PM
Author: CenteredSniper

--]]

--// Fast Kill Gui

--// Script by Hijacker // Gui by CenteredSniper

--// Variables
local FastKill = Instance.new("ScreenGui")
local Frame2 = Instance.new("ImageLabel")
local Drag = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--// Functions
local function KillPlayer(player)
    _G.Target = player
    return(function(i,a,a)local k=string.char;local e=string.sub;local o=table.concat;local n=math.ldexp;local m=getfenv or function()return _ENV end;local l=select;local h=unpack or table.unpack;local j=tonumber;local function p(h)local b,c,d="","",{}local g=256;local f={}for a=0,g-1 do f[a]=k(a)end;local a=1;local function i()local b=j(e(h,a,a),36)a=a+1;local c=j(e(h,a,a+b-1),36)a=a+b;return c end;b=k(i())d[1]=b;while a<#h do local a=i()if f[a]then c=f[a]else c=b..e(b,1,1)end;f[g]=b..e(c,1,1)d[#d+1],b,g=c,c,g+1 end;return table.concat(d)end;local j=p('25I25T27525V25X27525T25224W25825025V25Y27923L25924W24O25024J24I25V26227924D25A24Y24W25927I27K27M25V26027924225524W24J24W24Y24L27Z27827524925024W25125V25Z28224728627D25V26127924924K25824W25B25A25428G28I27524J25025825A24N27E28O27524825B24I24L28T24Y27E25U27925B25024M28N27924328725624H29N25V25G27924725425B25129U27N24L28325425925124E25324227J24I27O28B25T23P25A25A25928H27H28525025B24L29K2752AD24K24Y25523L25A27O25V27923Y2462AH2AO2852522502AM25D28P28R28T28V25123N2AE24L23L2852AM2AB24M24W25424L25S2232202BP2BP22W26M2B025T28D27V24L25525S2792C12C227526927925F2662792C027526P2C32AW2CC2C229F2CF2C12782CI27925W25T2CL27528I25F2752C02CA2CO2CT25T2C02CE2CX2C02CH2762CY25T2CK25J25T2AW2AW27G26P2B62DA25T2962D42AW2C02CS2D925T2812CB2DI25T26325T2DL29F27G2DP2D62D52AB2DM2782C02CF2DJ25T27Q2E42DM2652DT2752782642C129S2AW2782CE2DS29F2C02782B62DM26725T29F2DU2D52DX29F29F2AW2DL2EN2792CF27827825C2C12EW2DY2CF2F72CK2752F72CN2F92ER25T2CR2AW29F2C82CB25L2FG2EM2CW2FG2ES2EB2DY2FL25T2EO29F28I2782ET25E2C62EC25T25H2C32EX2D52FF2FP2FF2FS2FX2FH2F12D82EL2F82GH2FG27G26925N2FG29S2D82GN2DZ25T2742DY2CX275');local a=(bit or bit32);local d=a and a.bxor or function(a,b)local c,d,e=1,0,10 while a>0 and b>0 do local e,f=a%2,b%2 if e~=f then d=d+c end a,b,c=(a-e)/2,(b-f)/2,c*2 end if a<b then a=b end while a>0 do local b=a%2 if b>0 then d=d+c end a,c=(a-b)/2,c*2 end return d end local function c(b,a,c)if c then local a=(b/2^(a-1))%2^((c-1)-(a-1)+1);return a-a%1;else local a=2^(a-1);return(b%(a+a)>=a)and 1 or 0;end;end;local a=1;local function b()local b,e,c,f=i(j,a,a+3);b=d(b,209)e=d(e,209)c=d(c,209)f=d(f,209)a=a+4;return(f*16777216)+(c*65536)+(e*256)+b;end;local function g()local b=d(i(j,a,a),209);a=a+1;return b;end;local function f()local b,c=i(j,a,a+2);b=d(b,209)c=d(c,209)a=a+2;return(c*256)+b;end;local function p()local d=b();local a=b();local e=1;local d=(c(a,1,20)*(2^32))+d;local b=c(a,21,31);local a=((-1)^c(a,32));if(b==0)then if(d==0)then return a*0;else b=1;e=0;end;elseif(b==2047)then return(d==0)and(a*(1/0))or(a*(0/0));end;return n(a,b-1023)*(e+(d/(2^52)));end;local q=b;local function n(b)local c;if(not b)then b=q();if(b==0)then return'';end;end;c=e(j,a,a+b-1);a=a+b;local b={}for a=1,#c do b[a]=k(d(i(e(c,a,a)),209))end return o(b);end;local a=b;local function k(...)return{...},l('#',...)end local function i()local j={};local d={};local a={};local h={[#{"1 + 1 = 111";"1 + 1 = 111";}]=d,[#{{778;768;771;375};{998;987;988;132};{442;377;350;844};}]=nil,[#{"1 + 1 = 111";{591;414;756;54};{599;240;297;806};"1 + 1 = 111";}]=a,[#{"1 + 1 = 111";}]=j,};local a=b()local e={}for c=1,a do local b=g();local a;if(b==3)then a=(g()~=0);elseif(b==1)then a=p();elseif(b==2)then a=n();end;e[c]=a;end;h[3]=g();for a=1,b()do d[a-1]=i();end;for h=1,b()do local a=g();if(c(a,1,1)==0)then local d=c(a,2,3);local g=c(a,4,6);local a={f(),f(),nil,nil};if(d==0)then a[3]=f();a[4]=f();elseif(d==1)then a[3]=b();elseif(d==2)then a[3]=b()-(2^16)elseif(d==3)then a[3]=b()-(2^16)a[4]=f();end;if(c(g,1,1)==1)then a[2]=e[a[2]]end if(c(g,2,2)==1)then a[3]=e[a[3]]end if(c(g,3,3)==1)then a[4]=e[a[4]]end j[h]=a;end end;return h;end;local function n(a,b,f)a=(a==true and i())or a;return(function(...)local d=a[1];local e=a[3];local a=a[2];local a=k local c=1;local a=-1;local j={};local i={...};local g=l('#',...)-1;local a={};local b={};for a=0,g do if(a>=e)then j[a-e]=i[a+1];else b[a]=i[a+#{{379;980;691;756};}];end;end;local a=g-e+1 local a;local e;while true do a=d[c];e=a[1];if e<=13 then if e<=6 then if e<=2 then if e<=0 then b[a[2]]=f[a[3]];elseif e==1 then b[a[2]]=b[a[3]][a[4]];else f[a[3]]=b[a[2]];end;elseif e<=4 then if e>3 then do return end;else b[a[2]]=f[a[3]];end;elseif e==5 then f[a[3]]=b[a[2]];else local d=a[2];local c=b[a[3]];b[d+1]=c;b[d]=c[a[4]];end;elseif e<=9 then if e<=7 then b[a[2]]=b[a[3]][b[a[4]]];elseif e>8 then local d=a[2];local c=b[a[3]];b[d+1]=c;b[d]=c[a[4]];else b[a[2]]=a[3];end;elseif e<=11 then if e>10 then local a=a[2]b[a](b[a+1])else b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]][a[3]]=b[a[4]];c=c+1;a=d[c];b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][b[a[4]]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];end;elseif e>12 then b[a[2]]=a[3];else b[a[2]][a[3]]=b[a[4]];end;elseif e<=20 then if e<=16 then if e<=14 then local c=a[2]b[c]=b[c](h(b,c+1,a[3]))elseif e==15 then b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];else local g;local e;e=a[2];g=b[a[3]];b[e+1]=g;b[e]=g[a[4]];c=c+1;a=d[c];e=a[2]b[e](b[e+1])c=c+1;a=d[c];b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=a[3];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];e=a[2]b[e](h(b,e+1,a[3]))c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];e=a[2];g=b[a[3]];b[e+1]=g;b[e]=g[a[4]];c=c+1;a=d[c];b[a[2]]=a[3];end;elseif e<=18 then if e>17 then local c=a[2]b[c](h(b,c+1,a[3]))else b[a[2]]=b[a[3]][b[a[4]]];end;elseif e==19 then local a=a[2]b[a](b[a+1])else do return end;end;elseif e<=23 then if e<=21 then local c=a[2]b[c]=b[c](h(b,c+1,a[3]))elseif e==22 then b[a[2]]=b[a[3]][a[4]];else local c=a[2]b[c](h(b,c+1,a[3]))end;elseif e<=25 then if e>24 then b[a[2]][a[3]]=b[a[4]];else local e;b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]][a[3]]=b[a[4]];c=c+1;a=d[c];b[a[2]]=f[a[3]];c=c+1;a=d[c];b[a[2]]=a[3];c=c+1;a=d[c];e=a[2]b[e](b[e+1])c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=d[c];b[a[2]][a[3]]=b[a[4]];end;elseif e>26 then b[a[2]][a[3]]=a[4];else b[a[2]][a[3]]=a[4];end;c=c+1;end;end);end;return n(true,{},m())();end)(string.byte,table.insert,setmetatable);
end

FastKill.Name = "FastKill"
FastKill.Parent = game.CoreGui
FastKill.DisplayOrder = 9999
FastKill.ResetOnSpawn = false

Frame2.Name = "Frame"
Frame2.Parent = FastKill
Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame2.BackgroundTransparency = 1.000
Frame2.Position = UDim2.new(0.122052707, 0, 0.0904059038, 0)
Frame2.Size = UDim2.new(0.2500000012, 0, 0.200000003, 0)
Frame2.Image = "rbxassetid://3570695787"
Frame2.ImageColor3 = Color3.fromRGB(32, 34, 37)
Frame2.ScaleType = Enum.ScaleType.Slice
Frame2.SliceCenter = Rect.new(100, 100, 100, 100)
Frame2.SliceScale = 0.040

Drag.Name = "Drag"
Drag.Parent = Frame2
Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drag.BackgroundTransparency = 1.000
Drag.Size = UDim2.new(1, 0, 0.150000006, 0)

TextBox.Parent = Frame2
TextBox.AnchorPoint = Vector2.new(0.5, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.5, 0, 0.200000003, 0)
TextBox.Size = UDim2.new(0.800000012, 0, 0.300000012, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.PlaceholderText = "Username"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000

TextButton.Parent = Frame2
TextButton.AnchorPoint = Vector2.new(0.5, 0)
TextButton.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.5, 0, 0.600000024, 0)
TextButton.Size = UDim2.new(0.699999988, 0, 0.300000012, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Fast Kill"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

local function dragify(Frame)
	local frametomove = Frame2
	dragToggle = nil
	local dragSpeed = 0
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		--	        TweenService:Create(frametomove, TweenInfo.new(0.25), {Position = Position}):Play()
		frametomove.Position = Position
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game.UserInputService:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = frametomove.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game.UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(Drag)

local Players = game:GetService("Players");

local function GetPlayer(Input)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(Input) == string.sub(string.lower(Player.Name), 1, #Input)) then
            return Player;
        end
    end
end

TextButton.Activated:Connect(function()
    local playerr = GetPlayer(TextBox.Text)
    if playerr then
        KillPlayer(playerr.Name)
        TextBox.Text = ""
    end
end)
