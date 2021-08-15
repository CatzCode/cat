getgenv().Framework = {
    getpos = "Head",
    Enabled = false,
    VisiblityCheck = false,
}

local lplr = game.Players.LocalPlayer
local mouse = game.Players.LocalPlayer:GetMouse()

local function IsVisible(pos, ignoreList)
    return #workspace.CurrentCamera:GetPartsObscuringTarget({game.Players.LocalPlayer.Character.Head.Position, pos}, ignoreList) == 0 and true or false
end

function nearest()
    local target = nil
    local dist = math.huge
    for i, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health ~= 0 and (not Framework.VisiblityCheck or IsVisible(v.Character.Head.Position, {v.Character, game.Players.LocalPlayer.Character, workspace.CurrentCamera}) == true) then
                local screenpoint = workspace.CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
                local fovcheck = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude

                if check < dist then
                    target  = v
                    dist = check
                end
            end
        end
    end
    
    return target
end

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
