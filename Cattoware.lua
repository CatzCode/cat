green   = Color3.new(0, 1, 0.498039)
yellow  = Color3.new(1, 1, 0.498039)
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "Welcome to Cattori, "..game:GetService("Players").LocalPlayer.Name.."!",
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

function add(placeID, exec)
    if placeID == game.PlaceId then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/CatzCode/cat/main/Games/'..exec..'.lua'))()
    end
end

function ApplyGame()
	add(2041312716, "RagdollEngine")
	add(1962086868, "TOH")
	add(5977280685, "NinjaLegends")
	add(537413528, "BABFT")
	add(4169490976, "MortemMetallum")
	add(914010731, "RoGhoul")
	add(286090429, "Arsenal")
	add(4849736274, "SoulCombat")
	add(1401417393, "RagdollSystemTest")
	add(71315343, "DBR")
	add(662417684, "LuckyBlockBattlegrounds")
	add(855499080, "Skywars")
	add(3527629287, "BigPaintball")
	add(566399244, "ElementalBattlegrounds")
	add(537600204, "ElementalBattlegrounds")
	add(570158081, "ElementalBattlegrounds")
	add(2569625809, "ElementalBattlegrounds")
	add(3840352284, "VolleyBall")
	add(301549746, "CounterBlox")
	add(3254838662, "Blacklands")
	add(621129760, "KAT")
	add(12109643, "Fencing")
end

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
	script.Parent.HubName.Text = "Cattow"
	wait(.1)
	script.Parent.HubName.Text = "Cattowa"
	wait(.1)
	script.Parent.HubName.Text = "Cattowar"
	wait(.1)
	script.Parent.HubName.Text = "Cattoware"
	wait(.1)
	script.Parent.HubName.Text = "Cattoware 1"
	wait(.1)
	script.Parent.HubName.Text = "Cattoware 1.7"
	wait(.1)
	script.Parent.HubName.Text = "Cattoware 1.7.5"
	wait(.1)
	script.Parent.HubName.Text = "Cattoware 1.7.5b"..Exlusive
	wait(2)
	script.Parent.Log:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Linear", 1)
	script.Parent.DropShadow:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Linear", 1)
	script.Parent.HubName:TweenPosition(UDim2.new(0.5, 0, 2, 0), "Out", "Linear", 1)
	Blur.Enabled = false
    wait(2)
    ApplyGame()
end
coroutine.wrap(MQIFNCL_fake_script)()

spawn(function()
    local VirtualUser=game:GetService'VirtualUser'
    game:GetService'Players'.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)
