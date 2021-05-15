if loaded then
	return
end

pcall(function()
	getgenv().loaded = true
	getgenv().start_tick = tick()
end)

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

function loader:addGame(id, name, url)
	loader.games[tostring(id)] = {name = name, loadstring = url}
end

function loader:detectGame()
	local detectedGame = self.games[tostring(game.PlaceId)]
	if detectedGame then
		return detectedGame
	else
		print("unsupported")
	end
end

loader:addGame(286090429, "Arsenal", "arsenal")
loader:addGame(6115869347, "Ben 10", "ben10")
loader:addGame(3527629287, "Big Paintball", "bigpaintball")
loader:addGame(3254838662, "Blacklands", "blacklands")
loader:addGame(4442272183, "Blox Fruits", "bloxfruits")
loader:addGame(2753915549, "Blox Fruits", "bloxfruits")
loader:addGame(537413528, "Build a Boat for Treasure", "buildaboat")
loader:addGame(301549746, "CB:RO", "cbro")
loader:addGame(23144831, "CraftWars", "craftwars")
loader:addGame(617830641, "CraftWars: Retro", "craftwarsretro")
loader:addGame(71315343, "Dragon Ball Rage", "dragonballrage")
loader:addGame(3371469539, "Dragon Ball Rage", "dragonballrage")
loader:addGame(3336119605, "Dragon Ball Rage", "dragonballrage")
loader:addGame(1362482151, "Dragon Ball Rage", "dragonballrage")
loader:addGame(2569625809, "Elemental Battlegrounds", "elementalbattlegrounds")
loader:addGame(570158081, "Elemental Battlegrounds", "elementalbattlegrounds")
loader:addGame(537600204, "Elemental Battlegrounds", "elementalbattlegrounds")
loader:addGame(566399244, "Elemental Battlegrounds", "elementalbattlegrounds")
loader:addGame(6447798030, "Funky Friday", "funkyfriday")
loader:addGame(6242296404, "Happy Runner", "happyrunner")
loader:addGame(23578803, "Hotel Elephant", "hotelelephant")
loader:addGame(621129760, "K.A.T", "kat")
loader:addGame(662417684, "Lucky Block Battlegrounds", "luckyblockbattlegrounds")
loader:addGame(4169490976, "Mortem Metallum", "mortemmetallum")
loader:addGame(5977280685, "Ninja Legends", "ninjalegends")
loader:addGame(292439477, "Phantom Forces", "phantomforces")
loader:addGame(4894544370, "Pistol 1v1", "pistol1v1")
loader:addGame(5603739866, "Psycho 100: Infinity", "psycho100infinity")
loader:addGame(2041312716, "Ragdoll Engine", "ragdollengine")
loader:addGame(1401417393, "Ragdoll System Test", "ragdollsystemtest")
loader:addGame(914010731, "RoGhoul", "roghoul")
loader:addGame(855499080, "Skywars", "skywars")
loader:addGame(4849736274, "Soul Combat", "soulcombat")
loader:addGame(183364845, "Speed Run 4", "speedrun4")
loader:addGame(1962086868, "Tower Of Hell", "towerofhell")
loader:addGame(3840352284, "Volleyball 4.1", "volleyball")

local detectedGame = loader:detectGame()

spawn(function()
	ts:Create(Main, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
	ts:Create(cat, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
	ts:Create(ori, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
	ts:Create(Top, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
	wait(.5)
	ts:Create(word, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
	wait(.5)
	word.Text = "loaded " .. math.floor((tick() - getgenv().start_tick) * 10) / 10 .. " (secs)"
	wait(.5)
	if detectedGame then
		word.Text = "supported game! loading ".. detectedGame.name
	else
		word.Text = "we are currently working on universal..."
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
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cat/main/Games/".. detectedGame.loadstring ..".lua"))()
	end
end)
