--[[                                                                      
      ::::::::      ::: ::::::::::: ::::::::::: ::::::::  :::::::::  ::::::::::: 
    :+:    :+:   :+: :+:   :+:         :+:    :+:    :+: :+:    :+:     :+:      
   +:+         +:+   +:+  +:+         +:+    +:+    +:+ +:+    +:+     +:+       
  +#+        +#++:++#++: +#+         +#+    +#+    +:+ +#++:++#:      +#+        
 +#+        +#+     +#+ +#+         +#+    +#+    +#+ +#+    +#+     +#+         
#+#    #+# #+#     #+# #+#         #+#    #+#    #+# #+#    #+#     #+#          
########  ###     ### ###         ###     ########  ###    ### ###########       
]]
--Colors !!
red     = Color3.new(0.741176, 0, 0)
green   = Color3.new(0, 1, 0.498039)
yellow  = Color3.new(1, 1, 0.498039)
--This is to check if it has been executed before
local GamerDetected = nil
for i,v in pairs(game.CoreGui:GetChildren()) do
	if v.Name == 'Request Handler' or v.Name == 'Cattori Services' or v.Name == 'RBXS Lua Engine' then
	    if GamerDetected == true then
	        else
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "You have already executed Cattori!",
		Color = red,
	})
	GamerDetected = true
	end
		else
	end
end
    if GamerDetected == true then
        else
local cattolib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cattolib/main/module.lua"))()
cattolib:bypass_ws_jp()
game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "Welcome Cattori, "..game:GetService("Players").LocalPlayer.Name.."!",
	Color = green,
})
game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "Join the discord for more!",
	Color = green,
})
game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "cattoware.tk/discord",
	Color = yellow,
})
local loader = {
	Handler = Instance.new("ScreenGui"),
	RBXS = Instance.new("ScreenGui"),
	CattoriLibv2 = Instance.new("ScreenGui"),
	CattoriServices = Instance.new("ScreenGui"),
	
}
--Load haker man stuffz 💻
loader.Handler.Name = "Request Handler"
loader.RBXS.Name = "RBXS Lua Engine"
loader.CattoriLibv2.Name = "Cattori Lib v2"
loader.CattoriServices.Name = "Cattori Services"
loader.Handler.Parent = game.CoreGui
loader.RBXS.Parent = game.CoreGui
loader.CattoriLibv2.Parent = game.CoreGui
loader.CattoriServices.Parent = game.CoreGui

loader.games = {}

function loader:registerGame(id, name, url)
	loader.games[tostring(id)] = {name = name, loadstring = url}
end

function loader:detectGame()
	local detectedGame = self.games[tostring(game.PlaceId)]
	
	if detectedGame then
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Supported Game!",
		Color = green,
	})
		return detectedGame
	else
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Game Not supported, loaded universal!",
		Color = red,
	})
		loadstring(game:HttpGet('https://virtuallization.com/Cattori/Universal.txt'))()
	end
end
	
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
	-- games
loader:registerGame(3527629287, "Big Paintball", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/BigPaintball.lua")
loader:registerGame(292439477, "Phantom Forces", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/PhantomForces.lua")
loader:registerGame(4894544370, "Pistol 1v1", "https://virtuallization.com/Cattori/Pistol1v1.txt")
loader:registerGame(5603739866, "Psycho 100: Infinity", "https://virtuallization.com/Cattori/Psycho100Infinity.txt")
loader:registerGame(6201963079, "Zero Two Dance", "https://virtuallization.com/Cattori/ZeroTwoDance.txt")
loader:registerGame(23578803, "Hotel Elephant", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/HotelElephant.lua")
loader:registerGame(621129760, "KAT", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/KAT.lua")
loader:registerGame(286090429, "Arsenal", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/Arsenal.lua")
loader:registerGame(914010731, "RoGhoul", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/RoGhoul.lua")
loader:registerGame(4169490976, "MortemMetallum", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/MortemMetallum.lua")
loader:registerGame(537413528, "BABFT", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/BABFT.lua")
loader:registerGame(5977280685, "NinjaLegends", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/NinjaLegends.lua")
loader:registerGame(1962086868, "Tower Of Hell", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/TowerOfHell.lua")
loader:registerGame(2569625809, "ElementalBattlegrounds", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/ElementalBattlegrounds.lua")
loader:registerGame(570158081, "ElementalBattlegrounds", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/ElementalBattlegrounds.lua")
loader:registerGame(537600204, "ElementalBattlegrounds", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/ElementalBattlegrounds.lua")
loader:registerGame(566399244, "ElementalBattlegrounds", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/ElementalBattlegrounds.lua")
loader:registerGame(3840352284, "Volley Ball", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/VolleyBall.lua")
loader:registerGame(301549746, "Counter Blox", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/CounterBlox.lua")
loader:registerGame(3254838662, "Blacklands", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/Blacklands.lua")
loader:registerGame(12109643, "Fencing", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/Fencing.lua")
loader:registerGame(4849736274, "Soul Combat", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/SoulCombat.lua")
loader:registerGame(1401417393, "Ragdoll System Test", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/RagdollSystemTest.lua")
loader:registerGame(71315343, "DBR", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/DBR.lua")
loader:registerGame(3371469539, "DBR", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/DBR.lua")
loader:registerGame(3336119605, "DBR", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/DBR.lua")
loader:registerGame(1362482151, "DBR", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/DBR.lua")
loader:registerGame(855499080, "Skywars", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/Skywars.lua")
loader:registerGame(662417684, "Lucky Block Battlegrounds", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/LuckyBlockBattlegrounds.lua")
loader:registerGame(23144831, "CraftWars", "https://virtuallization.com/Cattori/CraftWars.txt")
loader:registerGame(617830641, "CraftWarsRetro", "https://virtuallization.com/Cattori/CraftWarsRetro.txt")
loader:registerGame(183364845, "SpeedRun4", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/SpeedRun4.lua")
loader:registerGame(6073366803, "RageRunner", "https://virtuallization.com/Cattori/RageRunner.txt")
loader:registerGame(6242296404, "HappyRunner", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/HappyRunner.lua")
loader:registerGame(2753915549, "BloxFruit", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/BloxFruit.lua")
loader:registerGame(4442272183, "BloxFruit", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/BloxFruit.lua")
loader:registerGame(6115869347, "Ben 10", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/Ben.lua")
loader:registerGame(6447798030, "Funky Senpai", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/FunkySenpai.lua")
loader:registerGame(23578803, "Hotel Elephants uwu", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/He.lua")

local detectedGame = loader:detectGame()
if detectedGame then
	if not ({pcall(function()
			local Elements = {"Line", "Text", "Image", "Circle", "Square", "Quad", "Triangle"}
				for i, v in ipairs(Elements) do
					Drawing.new(v):Remove()
				end
			end)})[1] then
			Drawing = nil
			end
			loadstring(game:HttpGet(detectedGame.loadstring))()
		end
	end
