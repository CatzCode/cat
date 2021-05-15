local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cat/main/Library/MaterialUILib.lua", true))()

local UI = UILib.Load({
    Title = "Cattori | Funky Friday",
    Style = 1,
    SizeX = 300,
    SizeY = 500,
    Theme = _G.UITheme
})

local MainTab = UI.New({Title = "Main"})
local CheatsTab = UI.New({Title = "Cheats"})
local VisualsTab = UI.New({Title = "Visuals"})
local mode_good = nil
local mode_sick = nil
local mode_bad = nil

MainTab.Button({
    Text = "Copy discord invite",
    Callback = function()
        if setclipboard then
            setclipboard("http://discord.gg/xjg2KHm")
        else
            print("Your exploit doesnt have the setclipboard function, here is the invite link: http://discord.gg/xjg2KHm")
        end
    end
})

MainTab:Label({}).SetText("Credits:")
MainTab:Label({}).SetText("wally | Auto Player")
MainTab:Label({}).SetText("xiba.cool#9637 | Modified")
MainTab:Label({}).SetText("Cattori Dev Team") 

CheatsTab:Label({}).SetText("Auto Play Settings")
CheatsTab.Dropdown({
    Text = "AutoPlay Mode",
    Default = "Sick",
    Callback = function(bool)
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
    end,
    Options = {"Bad","Good","Sick"}
})

CheatsTab:Label({}).SetText("Legit")
CheatsTab.Toggle({
    Text = "Legit Mode",
    Enabled = false, 
    Callback = function(bool)
        if bool then
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
    end,
})

CheatsTab:Label({}).SetText("AutoPlayer")
CheatsTab.Toggle({
    Text = "AutoPlay",
    Enabled = false, 
    Callback = function(bool)
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
    end,
})

CheatsTab:Label({}).SetText("Misc")
CheatsTab.Button({
    Text = "Inf Score",
    Callback = function()
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
    end
})
