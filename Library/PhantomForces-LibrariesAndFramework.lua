-- Libaries and framework (open source for faster loading time)
local getLibraries = function()
    local libs = { }
    success = pcall(function()
        local _ = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cat/main/Library/CattoriESPLibrary.lua", true))
        local __ = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cat/main/Library/HexagonUiLib.lua", true))
        libs = {
            esp = _(),
            ui = __()
        }
    end)
    return libs, success
end
local getFramework = function()
    local framework = { }
    local success = true
    
    success = pcall(function()
        for i,v in pairs(getgc(true)) do
            if type(v) == "function" then
                local function_name = debug.getinfo(v).name:lower()
                if function_name == "trajectory" then
                    framework.trajectory = v
                end
                if function_name == "getgunlist" then
                    framework.getgunlist = v
                end
            end
            if type(v) == "table" then
                if rawget(v, "step") and rawget(v, "reset") and rawget(v, "new") then
                    framework.particle = v
                end 
                if rawget(v, "PlaySoundId") then
                    framework.sound = v
                end 
                if rawget(v, "setmovementmode") then
                    framework.character = v
                end    
                if rawget(v, "send") then
                    framework.network = v
                end
                if rawget(v, "gammo") then
                    framework.gamelogic = v
                end
                if rawget(v, "basecframe") then
                    framework.camera = v
                end
                if rawget(v, "breakwindow") then
                    framework.effects = v
                end
                if rawget(v, "firehitmarker") then
                    framework.uieffects = v
                end
                if rawget(v, "getbodyparts") then
                    framework.replication = v
                end
                if rawget(v, "bulletLifeTime") then
                    framework.publicsettings = v
                end
            end
        end
    end)
    return framework, success and (framework.trajectory and framework.getgunlist and framework.particle and framework.sound and framework.character and framework.network and framework.gamelogic and framework.camera and framework.effects and framework.uieffects and framework.replication and framework.publicsettings)
end
return getLibraries, getFramework
