-- Libaries and framework (open source for faster loading time)
local getLibraries = function()
    local libs = { }
    local success = pcall(function()
        local _esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cat/main/Library/CattoriESPLibrary.lua", true))
        local _ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Libraries/UI/bruh.lua", true))
        libs = {
            esp = _esp(),
            ui = _ui()
        }
    end)
    return libs, success
end
local getFramework = function()
    local framework = { }
    local success = pcall(function()
        local tries = 0
        repeat
            tries = tries + 1
            for i,v in pairs(getgc(true)) do
                if type(v) == "function" and debug.getinfo(v).name:lower() == "getgunlist" then
                    framework.getgunlist = v
                end
                if type(v) == "table" and rawget(v, "step") and rawget(v, "reset") and rawget(v, "new") then
                    framework.particle = v
                end 
                if type(v) == "table" and rawget(v, "PlaySoundId") then
                    framework.sound = v
                end 
                if type(v) == "table" and rawget(v, "setmovementmode") then
                    framework.character = v
                end    
                if type(v) == "table" and rawget(v, "send") then
                    framework.network = v
                end
                if type(v) == "table" and rawget(v, "gammo") then
                    framework.gamelogic = v
                end
                if type(v) == "table" and rawget(v, "basecframe") then
                    framework.camera = v
                end
                if type(v) == "table" and rawget(v, "breakwindow") then
                    framework.effects = v
                end
                if type(v) == "table" and rawget(v, "firehitmarker") then
                    framework.uieffects = v
                end
                if type(v) == "table" and rawget(v, "getbodyparts") then
                    framework.replication = v
                end
                if type(v) == "table" and rawget(v, "bulletLifeTime") then
                    framework.publicsettings = v
                end
            end
            if tries > 0 then
                wait(1)
            end
        until tries >= 10 or (framework.getgunlist and framework.particle and framework.sound and framework.character and framework.network and framework.gamelogic and framework.camera and framework.effects and framework.uieffects and framework.replication and framework.publicsettings)
    end)
    return framework, success and (framework.getgunlist and framework.particle and framework.sound and framework.character and framework.network and framework.gamelogic and framework.camera and framework.effects and framework.uieffects and framework.replication and framework.publicsettings)
end
return getLibraries, getFramework
