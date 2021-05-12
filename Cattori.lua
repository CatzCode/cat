local load = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Top = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local cat = Instance.new("TextLabel")
local ori = Instance.new("TextLabel")
local word = Instance.new("TextLabel")

local loader = {}
loader.games = {}
local ts = game:GetService("TweenService")
local starttime = tick()

load.Name = "load"
load.Parent = game.CoreGui
load.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn then
	syn.protect_gui(load)
end

Main.Name = "Main"
Main.Parent = load
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 232, 0, 60)
Main.BackgroundTransparency = 1

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Main

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(0, 232, 0, 23)
Top.BackgroundTransparency = 1

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = Top

cat.Name = "cat"
cat.Parent = Top
cat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cat.BackgroundTransparency = 1.000
cat.TextTransparency = 1.000
cat.Position = UDim2.new(0.0258620698, 0, 0, 0)
cat.Size = UDim2.new(0, 160, 0, 23)
cat.Font = Enum.Font.SourceSans
cat.Text = "Catt"
cat.TextColor3 = Color3.fromRGB(127, 0, 191)
cat.TextSize = 16.000
cat.TextXAlignment = Enum.TextXAlignment.Left

ori.Name = "ori"
ori.Parent = Top
ori.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ori.BackgroundTransparency = 1.000
ori.TextTransparency = 1.000
ori.Size = UDim2.new(0, 78, 0, 23)
ori.Font = Enum.Font.SourceSans
ori.Text = "ori"
ori.TextColor3 = Color3.fromRGB(0, 255, 127)
ori.TextSize = 16.000


word.Name = "word"
word.Parent = Main
word.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
word.BackgroundTransparency = 1.000
word.Position = UDim2.new(0.0258620698, 0, 0.508333325, 0)
word.Size = UDim2.new(0, 220, 0, 23)
word.Font = Enum.Font.SourceSans
word.TextTransparency = 1.000
word.Text = "nya ~"
word.TextColor3 = Color3.fromRGB(255, 255, 255)
word.TextSize = 19.000

function loader:registerGame(id, name, url)
	loader.games[tostring(id)] = {name = name, loadstring = url}
end

function loader:detectGame()
	local detectedGame = self.games[tostring(game.PlaceId)]
	
    if detectedGame then
    	return detectedGame
    else
		loadstring(game:HttpGet('https://virtuallization.com/Cattori/Universal.txt'))()
	end
end

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
    loader:registerGame(6447798030, "Funky Friday", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/FunkyFriday.lua")
    loader:registerGame(23578803, "Hotel Elephants uwu", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/He.lua")
    loader:registerGame(2041312716, "Ragdoll Engine", "https://raw.githubusercontent.com/CatzCode/cat/main/Games/RagdollEngine.lua")

local detectedGame = loader:detectGame()

spawn(function()
	ts:Create(Main, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
	ts:Create(cat, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
	ts:Create(ori, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
	ts:Create(Top, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
	wait(.5)
	ts:Create(word, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
	wait(.5)
	word.Text = "loaded " .. math.floor((tick() - starttime) * 10) / 10 .. " (secs)"
	wait(.5)
	if detectedGame then
	    word.Text = "supported game!"
	else
	    word.Text = "we are working on universal..."
	end
	wait(1)
	cat.Visible = false
	ori.Visible = false
	word.Visible = false
	Top.Visible = false
	Main:TweenSize(UDim2.new(0, 0, 0, 60), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1, false)
	wait(1)
    	load:Destroy()
    
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
end)
