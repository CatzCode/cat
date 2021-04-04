local mode_good = nil
local mode_sick = nil
local mode_bad = nil

local DiscordLib = loadstring(game:HttpGet"https://virtuallization.com/DiscordLibBackup.txt")()

local win = DiscordLib:Window("Cattori Hub")

local serv = win:Server("Funky Friday", "")

local tgls = serv:Channel("Main")

local drop = tgls:Dropdown("Mode",{"Bad","Good","Sick"}, function(bool)
if bool == "Sick" then
mode_sick = true
mode_bad = false
else
if bool == "Good" then 
mode_good = true
mode_bad = false
mode_sick = false
else
mode_bad = true
mode_good = false
mode_sick = false
end
end
end)

tgls:Toggle("Legit Mode",false, function(bool) --Shitty
if bool == true then
mode_good = nil
mode_sick = nil
mode_bad = nil

getgenv().Randomizer = true
while getgenv().Randomizer == true do
mode_good = nil
mode_sick = nil
mode_bad = nil
mode_bad = true
wait(0.4)
mode_bad = nil
mode_good = true
wait(0.5)
mode_good = nil
mode_sick = nil
mode_bad = true
wait(0.4)
mode_bad = nil
mode_good = true
wait(0.5)
mode_good = nil
mode_sick = nil
mode_bad = true
wait(0.6)
end
	else
mode_good = nil
mode_sick = nil
mode_bad = nil

getgenv().Randomizer = false
while getgenv().Randomizer == true do
mode_good = nil
mode_sick = nil
mode_bad = nil
mode_bad = true
wait(0.4)
mode_bad = nil
mode_good = true
wait(0.5)
mode_good = nil
mode_sick = nil
mode_bad = true
wait(0.4)
mode_bad = nil
mode_good = true
wait(0.5)
mode_good = nil
mode_sick = nil
mode_bad = true
wait(0.6)
end
end
end)

tgls:Toggle("Auto Play",false, function(bool)
if bool == true then --Modded Wally's auto player, credits to him for player crds to xiba for mod ðŸ˜š
ToggleAuto = true
local maxdelay = .09
local framework;
local funcs = {}
local islclosure = islclosure or is_l_closure
local getinfo = getinfo or debug.getinfo
local getupvalues = getupvalues or debug.getupvalues
local getconstants = getconstants or debug.getconstants
local marked = {}
local map = { [0] = 'Left', [1] = 'Down', [2] = 'Up', [3] = 'Right', }
local keys = { Up = Enum.KeyCode.W; Down = Enum.KeyCode.S; Left = Enum.KeyCode.A; Right = Enum.KeyCode.D; }
... (147 lines left)
