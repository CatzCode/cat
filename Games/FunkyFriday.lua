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
if bool == true then --Modded Wally's auto player, credits to him for player crds to xiba for mod 😚
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
local runService = game:GetService('RunService')
local fastWait, fastSpawn do
    function fastWait(t)
        local d = 0;
        while d < t do
            d += runService.RenderStepped:wait()
        end
    end
    function fastSpawn(f)
        coroutine.wrap(f)()
    end
end

for i, v in next, getgc(true) do
    if type(v) == 'table' and rawget(v, 'GameUI') then
        framework = v;
    end
    if type(v) == 'function' and islclosure(v) then
        local info = getinfo(v);
        if info.name == '' then continue end
        if info.source:match('%.Arrows$') then
            local constants = getconstants(v);
            if table.find(constants, 'Right') and table.find(constants, 'NewThread') then
                funcs.KeyDown = v;
            elseif table.find(constants, 'Multiplier') and table.find(constants, 'MuteVoices') then
                funcs.KeyUp = v;
            end
        end
    end
    if framework and funcs.KeyUp and funcs.KeyDown then break end
end
if type(framework) ~= 'table' or (not rawget(framework, 'UI')) then
    return game.Players.LocalPlayer:Kick('Failed to locate framework.')
elseif (not (funcs.KeyDown and funcs.KeyUp)) then
    return game.Players.LocalPlayer:Kick('Failed to locate key functions.')
end
while runService.RenderStepped:wait() do
    if ToggleAuto == true then
    for _, arrow in next, framework.UI.ActiveSections do
        if _ == 1 then
        else
            if arrow.Side ~= framework.UI.CurrentSide then continue end
            if marked[arrow] then continue end
            local index = arrow.Data.Position % 4
            local position = map[index]
            if (not position) then continue end
            local distance = (1 -math.abs(arrow.Data.Time - framework.SongPlayer.CurrentlyPlaying.TimePosition)) * 100
            if distance >= 95 then
                marked[arrow] = true;
                fastSpawn(function()
               if mode_sick == true then
                   wait(Random.new():NextNumber(0.001, maxdelay))
                   else
                    if mode_good == true then wait(Random.new():NextNumber(0.1, maxdelay))
                    else
                    wait(Random.new():NextNumber(0.365, maxdelay))
                    end
                    end
                    funcs.KeyDown(position)
                    if arrow.Data.Length > 0 then
                        fastWait(arrow.Data.Length)
                    else
                        fastWait(0.05)
                    end
                    funcs.KeyUp(position)
                    marked[arrow] = nil
                end)
            end
        end
    end
end
end
	else
ToggleAuto = false
end
end)

tgls:Seperator()
tgls:Button("Infinite Score", function()
DiscordLib:Notification("Cattori", "Set score to Infinite", "Okay!")
local args = {
    [1] = {
        [1] = "Server",
        [2] = "SongManager",
        [3] = "UpdateScore"
    },
    [2] = {
        [1] = math.huge
    }
}

game:GetService("ReplicatedStorage").RF:InvokeServer(unpack(args))

end)


if Drawing then
local ESP = loadstring(game:HttpGet("https://virtuallization.com/ESP%20Library.txt"))()
ESP.Names = false
ESP.Boxes = false
ESP.Tracers = false

local esptab = serv:Channel("ESP")


esptab:Toggle("ESP",false, function(bool)
if bool == true then
ESP:Toggle(true)
  else
ESP:Toggle(false)
end
end)

esptab:Toggle("Team Colors",true, function(bool)
if bool == true then
ESP.TeamColor = true
  else
ESP.TeamColor = false
end
end)


esptab:Toggle("Boxes",false, function(bool)
if bool == true then
ESP.Boxes = true
  else
ESP.Boxes = false
end
end)

esptab:Toggle("Tracers",false, function(bool)
if bool == true then
ESP.Tracers = true
  else
ESP.Tracers = false
end
end)

esptab:Toggle("Names",false, function(bool)
if bool == true then
ESP.Names = true
  else
ESP.Names = false
end
end)

end
