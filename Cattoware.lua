--[[                                                                      
      ::::::::      ::: ::::::::::: ::::::::::: ::::::::  :::::::::  ::::::::::: 
    :+:    :+:   :+: :+:   :+:         :+:    :+:    :+: :+:    :+:     :+:      
   +:+         +:+   +:+  +:+         +:+    +:+    +:+ +:+    +:+     +:+       
  +#+        +#++:++#++: +#+         +#+    +#+    +:+ +#++:++#:      +#+        
 +#+        +#+     +#+ +#+         +#+    +#+    +#+ +#+    +#+     +#+         
#+#    #+# #+#     #+# #+#         #+#    #+#    #+# #+#    #+#     #+#          
########  ###     ### ###         ###     ########  ###    ### ###########       
]]
red     = Color3.new(0.741176, 0, 0)
green   = Color3.new(0, 1, 0.498039)
yellow  = Color3.new(1, 1, 0.498039)
function sysmsg(content, color)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = content,
	Color = color,
})
end
local cattori = {
	cattori.Handler = Instance.new("ScreenGui"),
	cattori.RBXS = Instance.new("ScreenGui"),
	cattori.CattoriLibv2 = Instance.new("ScreenGui"),
	cattori.CattoriServices = Instance.new("ScreenGui"),
	cattori.Handler.Parent = game.CoreGui,
	cattori.RBXS.Parent = game.CoreGui,
	cattori.CattoriLibv2.Parent = game.CoreGui,
	cattori.CattoriServices.Parent = game.CoreGui,
	cattori.Handler.Name = "Request Handler"
	cattori.RBXS.Name = "RBXS Lua Engine"
	cattori.CattoriLibv2.Name = "Cattori Lib v2"
	cattori.CattoriServices.Name = "Cattori Services"
}
for _, v in pairs(game.CoreGui:GetChildren()) do
	if v.Name = "Request Handler" or v.Name == "RBXS Lua Engine" or v.Name == "Cattori Lib v2" or v.Name == "Cattori Services" then
		sysmsg("Cattori is already executed!", red)
	else
local gitgames = {}
local webgames = {}

function cattori:registerGame(id, name)
	gitgames[tostring(id)] = {name = name}
end

function cattori:registervGame(id, name)
	webgames[tostring(id)] = {name = name}
end

cattori:registerGame(3527629287, "BigPaintball")
cattori:registerGame(292439477, "PhantomForces")
cattori:registervGame(4894544370, "Pistol1v1")
cattori:registervGame(5603739866, "Psycho100Infinity")
cattori:registervGame(6201963079, "ZeroTwoDance")
cattori:registerGame(23578803, "HotelElephant")
cattori:registervGame(6447798030, "FunkyFriday")
cattori:registerGame(621129760, "KAT")
cattori:registerGame(286090429, "Arsenal")
cattori:registerGame(914010731, "RoGhoul")
cattori:registerGame(4169490976, "MortemMetallum")
cattori:registerGame(537413528, "BABFT")
cattori:registerGame(5977280685, "NinjaLegends")
cattori:registerGame(1962086868, "Tower Of Hell")
cattori:registerGame(2569625809, "ElementalBattlegrounds")
cattori:registerGame(570158081, "ElementalBattlegrounds")
cattori:registerGame(537600204, "ElementalBattlegrounds")
cattori:registerGame(566399244, "ElementalBattlegrounds")
cattori:registerGame(3840352284, "VolleyBall")
cattori:registerGame(301549746, "CounterBlox")
cattori:registerGame(3254838662, "Blacklands")
cattori:registerGame(12109643, "Fencing")
cattori:registerGame(4849736274, "SoulCombat")
cattori:registerGame(1401417393, "RagdollSystemTest")
cattori:registerGame(71315343, "DBR")
cattori:registerGame(3371469539, "DBR")
cattori:registerGame(3336119605, "DBR")
cattori:registerGame(1362482151, "DBR")
cattori:registerGame(855499080, "Skywars")
cattori:registerGame(662417684, "LuckyBlockBattlegrounds")
cattori:registervGame(23144831, "CraftWars")
cattori:registervGame(617830641, "CraftWarsRetro")
cattori:registervGame(183364845, "SpeedRun4")
cattori:registervGame(6073366803, "RageRunner")
cattori:registervGame(6242296404, "HappyRunner")
cattori:registerGame(2753915549, "BloxFruit")

local Inoria = Instance.new("ScreenGui")
local DropShadow = Instance.new("ImageLabel")
local Log = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local HubName = Instance.new("TextLabel")

--Properties:

Inoria.Name = "Inoria"
Inoria.Parent = game.CoreGui
Inoria.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

DropShadow.Name = "DropShadow"
DropShadow.Parent = Inoria
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropShadow.BackgroundTransparency = 1.000
DropShadow.Position = UDim2.new(0.5, 0, -1, 0)
DropShadow.Size = UDim2.new(0, 170, 0, 170)
DropShadow.ZIndex = 0
DropShadow.Image = "http://www.roblox.com/asset/?id=258799800"

Log.Name = "Log"
Log.Parent = Inoria
Log.AnchorPoint = Vector2.new(0.5, 0.5)
Log.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Log.BackgroundTransparency = 1.000
Log.Position = UDim2.new(0.5, 0, -1, 0)
Log.Size = UDim2.new(0, 150, 0, 150)
Log.Image = "http://www.roblox.com/asset/?id=6533811900"

UICorner.CornerRadius = UDim.new(0, 90)
UICorner.Parent = Log

HubName.Name = "HubName"
HubName.Parent = Inoria
HubName.AnchorPoint = Vector2.new(0.5, 0.5)
HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HubName.BackgroundTransparency = 1.000
HubName.Position = UDim2.new(0.5, 0, -1, 0)
HubName.Size = UDim2.new(0, 200, 0, 37)
HubName.Font = Enum.Font.JosefinSans
HubName.Text = ""
HubName.TextColor3 = Color3.fromRGB(255, 255, 255)
HubName.TextSize = 18.000
HubName.TextWrapped = true

-- Scripts:

local function MQIFNCL_fake_script() -- Inoria.Tween 
	local script = Instance.new('LocalScript', Inoria)

	-- Check Game Loaded --
	repeat wait() until game:IsLoaded()
	-- Variable --
	local Exlusive = ""
	local TweenService = game:GetService("TweenService")
	local Blur = Instance.new("BlurEffect")
	Blur.Parent = game:GetService("Lighting")
	Blur.Name = "LynxSexy"
	Blur.Size = 24
	Blur.Enabled = true
	-- Stuff --
	script.Parent.Log:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Linear", 1)
	script.Parent.DropShadow:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Linear", 1)
	script.Parent.HubName:TweenPosition(UDim2.new(0.5, 0, 0.685, 0), "Out", "Elastic", 3)
	wait(4)
	script.Parent.HubName.Text = "C"
	wait(.1)
	script.Parent.HubName.Text = "Ca"
	wait(.1)
	script.Parent.HubName.Text = "Cat"
	wait(.1)
	script.Parent.HubName.Text = "Catt"
	wait(.1)
	script.Parent.HubName.Text = "Catto"
	wait(.1)
	script.Parent.HubName.Text = "Cattor"
	wait(.1)
	script.Parent.HubName.Text = "Cattori"..Exlusive
	wait(2)
	script.Parent.Log:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Linear", 1)
	script.Parent.DropShadow:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Linear", 1)
	script.Parent.HubName:TweenPosition(UDim2.new(0.5, 0, 2, 0), "Out", "Linear", 1)
	Blur.Enabled = false
    wait(2)
    sysmsg("Welcome to Cattori, "..game:GetService("Players").LocalPlayer.Name.."!", green)
    sysmsg("Detecting game, please wait..", yellow)
    wait(0.5)
    local d	local detectedGame2 = Cattori.webgames[tostring(game.PlaceId)]
	if detectedGame1 then
	    sysmsg("Detected game!", green)
	    loadstring(game:HttpGet('https://raw.githubusercontent.com/CatzCode/cat/main/Games/'.. detectedGame1.name ..'.lua'))()
	elseif detectedGame2 then
	    sysmsg("Detected game!", green)
	    loadstring(game:HttpGet('https://virtuallization.com/Cattori/'.. detectedGame2.name ..'.txt'))()
	else
	    sysmsg("Unsupported game! Loading universal..")
	    loadstring(game:HttpGet('https://virtuallization.com/Cattori/Universal.txt'))()
	endetectedGame1 = Cattori.gitgames[tostring(game.PlaceId)]

end
coroutine.wrap(MQIFNCL_fake_script)()
end
end
