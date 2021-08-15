getgenv().Framework = {
    getpos = "Head",
    Enabled = false
}

local mt = getrawmetatable(game)
local hookpos
setreadonly(mt, false)

local old;
old = hookfunction(mt.__namecall, newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(self) == "mouse" and tostring(method) == "FireServer" then
        if Framework.Enabled then
            args[1] = nearest().Character[Framework.getpos].Position
        end

        hookpos = args[1]

        return self.FireServer(self, unpack(args))
    end

    return old(self, ...)
end))

setreadonly(mt, true)
