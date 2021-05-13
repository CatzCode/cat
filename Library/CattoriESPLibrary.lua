--if u skid then u gae
local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera
local worldToViewportPoint = camera.worldToViewportPoint
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local gethealth--<3

if game.PlaceId == 292439477 then
    for i,v in pairs(getgc()) do
        if type(v) == "function" and debug.getinfo(v).name:lower() == "gethealth" then
            gethealth = v
        end
    end
end--ass

local Settings = {
    Box2DEnabled = false,
    ShowHealthbar = false,
    TracerEnabled = false,
    NameEnabled = false,
    BoxEnabled = false,
    SkeletonESPEnabled = false,
    Box3DEnabled = false,
    ChamsEnabled = false,
    ViewTracerEnabled = false,
    TextOutlineEnabled = false,
    TeamCheckEnabled = true,
    TracerFrom = "Bottom",
    RoundedCorner = 12,
    Length = 14,
    FOVSize = 300,
    FOVEnabled = false,
    FOVTransparency = 1,
    FOVFilled = false,
    ESPColor = Color3.fromRGB(255,255,255),
    Thickness = 1,
    TextSize = 15,
    Transparency = 1,
    HeadOff = Vector3.new(0,0.5,0),
    LegOff = Vector3.new(0,3,0)
}

local Colors
Colors = {
    ["ChangeAll"] = function(color) 
        for i,v in pairs(Colors) do
            if tostring(typeof(v)):lower() == "color3" then
                Colors[i] = color
            end
        end
    end,
    ["UseTeamColor"] = true,
    ["RainbowEnabled"] = false,
    ["BoxColor"] = Color3.fromRGB(255,255,255),
    ["Box2DColor"] = Color3.fromRGB(255,255,255),
    ["TracersColor"] = Color3.fromRGB(255,255,255),
    ["NameESPColor"] = Color3.fromRGB(255,255,255),
    ["SkeletonESPColor"] = Color3.fromRGB(255,255,255),
    ["Box3DColor"] = Color3.fromRGB(255,255,255),
    ["ViewTracersColor"] = Color3.fromRGB(255,255,255),
    ["FOVColor"] = Color3.fromRGB(255,255,255),
    ["BulletTracerColor"] = Color3.fromRGB(255,255,255),
    ["BulletImpactColor"] = Color3.fromRGB(255,255,255),
    ["ChamsColor"] = Color3.fromRGB(255,255,255)
}

local ApplyESP = function(getargs)
    if not getargs or (getargs and typeof(getargs) ~= "function") then
        print("Usage: ApplyESP(function() return (player), (humanoidrootpart) end)")
        return
    end--pp

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.fromRGB(255,255,255)
    Box.Thickness = Settings.Thickness
    Box.Transparency = Settings.Transparency
    Box.Filled = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = Settings.Thickness
    HealthBar.Filled = false
    HealthBar.Transparency = Settings.Transparency
    HealthBar.Visible = false
    
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.fromRGB(255,255,255)
    Tracer.Thickness = Settings.Thickness
    Tracer.Transparency = Settings.Transparency
    
    local Name = Drawing.new("Text")
    Name.Visible = false
    Name.Color = Color3.fromRGB(255,255,255)
    Name.Size = 15
    Name.Center = true
    Name.Outline = true
    Name.Transparency = Settings.Transparency
    
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Thickness = 1
    FOVCircle.Radius = 300
    FOVCircle.NumSides = 12
    FOVCircle.Color = Color3.fromRGB(255,255,255)
    FOVCircle.Visible = false
    FOVCircle.Transparency = Settings.FOVTransparency

    local SkeletonTorso = Drawing.new("Line")
    SkeletonTorso.Visible = false
    SkeletonTorso.From = Vector2.new(0, 0)
    SkeletonTorso.To = Vector2.new(200, 200)
    SkeletonTorso.Color = Color3.fromRGB(255,255,255)
    SkeletonTorso.Thickness = 1
    SkeletonTorso.Transparency = Settings.Transparency

    local SkeletonHead = Drawing.new("Line")
    SkeletonHead.Visible = false
    SkeletonHead.From = Vector2.new(0, 0)
    SkeletonHead.To = Vector2.new(200, 200)
    SkeletonHead.Color = Color3.fromRGB(255,255,255)
    SkeletonHead.Thickness = 1
    SkeletonHead.Transparency = Settings.Transparency

    local SkeletonLeftLeg = Drawing.new("Line")
    SkeletonLeftLeg.Visible = false
    SkeletonLeftLeg.From = Vector2.new(0, 0)
    SkeletonLeftLeg.To = Vector2.new(200, 200)
    SkeletonLeftLeg.Color = Color3.fromRGB(255,255,255)
    SkeletonLeftLeg.Thickness = 1
    SkeletonLeftLeg.Transparency = Settings.Transparency

    local SkeletonRightLeg = Drawing.new("Line")
    SkeletonRightLeg.Visible = false
    SkeletonRightLeg.From = Vector2.new(0, 0)
    SkeletonRightLeg.To = Vector2.new(200, 200)
    SkeletonRightLeg.Color = Color3.fromRGB(255,255,255)
    SkeletonRightLeg.Thickness = 1
    SkeletonRightLeg.Transparency = Settings.Transparency

    local SkeletonLeftArm = Drawing.new("Line")
    SkeletonLeftArm.Visible = false
    SkeletonLeftArm.From = Vector2.new(0, 0)
    SkeletonLeftArm.To = Vector2.new(200, 200)
    SkeletonLeftArm.Color = Color3.fromRGB(255,255,255)
    SkeletonLeftArm.Thickness = 1
    SkeletonLeftArm.Transparency = Settings.Transparency

    local SkeletonRightArm = Drawing.new("Line")
    SkeletonRightArm.Visible = false
    SkeletonRightArm.From = Vector2.new(0, 0)
    SkeletonRightArm.To = Vector2.new(200, 200)
    SkeletonRightArm.Color = Color3.fromRGB(255,255,255)
    SkeletonRightArm.Thickness = 1
    SkeletonRightArm.Transparency = Settings.Transparency

    local line1 = Drawing.new("Line")
    line1.Visible = false
    line1.Color = Color3.fromRGB(255,255,255)
    line1.Thickness = Settings.Thickness
    line1.Transparency = Settings.Transparency

    local line2 = Drawing.new("Line")
    line2.Visible = false
    line2.Color = Color3.fromRGB(255,255,255)
    line2.Thickness = Settings.Thickness
    line2.Transparency = Settings.Transparency

    local line3 = Drawing.new("Line")
    line3.Visible = false
    line3.Color = Color3.fromRGB(255,255,255)
    line3.Thickness = Settings.Thickness
    line3.Transparency = Settings.Transparency

    local line4 = Drawing.new("Line")
    line4.Visible = false
    line4.Color = Color3.fromRGB(255,255,255)
    line4.Thickness = Settings.Thickness
    line4.Transparency = Settings.Transparency

    local line5 = Drawing.new("Line")
    line5.Visible = false
    line5.Color = Color3.fromRGB(255,255,255)
    line5.Thickness = Settings.Thickness
    line5.Transparency = Settings.Transparency

    local line6 = Drawing.new("Line")
    line6.Visible = false
    line6.Color = Color3.fromRGB(255,255,255)
    line6.Thickness = Settings.Thickness
    line6.Transparency = Settings.Transparency

    local line7 = Drawing.new("Line")
    line7.Visible = false
    line7.Color = Color3.fromRGB(255,255,255)
    line7.Thickness = Settings.Thickness
    line7.Transparency = Settings.Transparency

    local line8 = Drawing.new("Line")
    line8.Visible = false
    line8.Color = Color3.fromRGB(255,255,255)
    line8.Thickness = Settings.Thickness
    line8.Transparency = Settings.Transparency

    local line9 = Drawing.new("Line")
    line9.Visible = false
    line9.Color = Color3.fromRGB(255,255,255)
    line9.Thickness = Settings.Thickness
    line9.Transparency = Settings.Transparency

    local line10 = Drawing.new("Line")
    line10.Visible = false
    line10.Color = Color3.fromRGB(255,255,255)
    line10.Thickness = Settings.Thickness
    line10.Transparency = Settings.Transparency

    local line11 = Drawing.new("Line")
    line11.Visible = false
    line11.Color = Color3.fromRGB(255,255,255)
    line11.Thickness = Settings.Thickness
    line11.Transparency = Settings.Transparency

    local line12 = Drawing.new("Line")
    line12.Visible = false
    line12.Color = Color3.fromRGB(255,255,255)
    line12.Thickness = Settings.Thickness
    line12.Transparency = Settings.Transparency

    local Viewline = Drawing.new("Line") --// Parse and Set the line for tracer
    Viewline.Visible = false
    Viewline.From = Vector2.new(0, 0)
    Viewline.To = Vector2.new(0, 0)
    Viewline.Color = Color3.fromRGB(255,255,255)
    Viewline.Thickness = Settings.Thickness
    Viewline.Transparency = Settings.Transparency

    local ChamsHead = Instance.new("BoxHandleAdornment")
    ChamsHead.Transparency = 0.5
    ChamsHead.ZIndex = 5
    ChamsHead.AlwaysOnTop = true

    local ChamsTorso = Instance.new("BoxHandleAdornment")
    ChamsTorso.Transparency = 0.5
    ChamsTorso.ZIndex = 5
    ChamsTorso.AlwaysOnTop = true

    local ChamsRightArm = Instance.new("BoxHandleAdornment")
    ChamsRightArm.Transparency = 0.5
    ChamsRightArm.ZIndex = 5
    ChamsRightArm.AlwaysOnTop = true

    local ChamsLeftArm = Instance.new("BoxHandleAdornment")
    ChamsLeftArm.Transparency = 0.5
    ChamsLeftArm.ZIndex = 5
    ChamsLeftArm.AlwaysOnTop = true

    local ChamsRightLeg = Instance.new("BoxHandleAdornment")
    ChamsRightLeg.Transparency = 0.5
    ChamsRightLeg.ZIndex = 5
    ChamsRightLeg.AlwaysOnTop = true

    local ChamsLeftLeg = Instance.new("BoxHandleAdornment")
    ChamsLeftLeg.Transparency = 0.5
    ChamsLeftLeg.ZIndex = 5
    ChamsLeftLeg.AlwaysOnTop = true

    local BoxLine1 = Drawing.new("Line")
    line1.Visible = false
    line1.Color = Color3.fromRGB(255,255,255)
    line1.Thickness = Settings.Thickness
    line1.Transparency = Settings.Transparency

    local BoxLine2 = Drawing.new("Line")
    line2.Visible = false
    line2.Color = Color3.fromRGB(255,255,255)
    line2.Thickness = Settings.Thickness
    line2.Transparency = Settings.Transparency

    local BoxLine3 = Drawing.new("Line")
    line3.Visible = false
    line3.Color = Color3.fromRGB(255,255,255)
    line3.Thickness = Settings.Thickness
    line3.Transparency = Settings.Transparency

    local BoxLine4 = Drawing.new("Line")
    line4.Visible = false
    line4.Color = Color3.fromRGB(255,255,255)
    line4.Thickness = Settings.Thickness
    line4.Transparency = Settings.Transparency

    game:GetService("RunService").RenderStepped:Connect(function()
        local MainPlayer, ESPPart, closest, closest2 = getargs()

        local ClosestBody, Closest
        if closest then
            if type(closest) == "function" then
                ClosestBody, Closest = closest()
            elseif type(closest) == "table" then
                ClosestBody, Closest = closest[1], closest[2]
            else
                if closest2 then
                    ClosestBody, Closest = closest, closest2
                end
            end
        end
        if Settings.FOVEnabled then
            FOVCircle.Visible = true
            FOVCircle.Position = Vector2.new(mouse.X, mouse.Y + 36)
            FOVCircle.Thickness = Settings.Thickness
            FOVCircle.NumSides = Settings.RoundedCorner
            FOVCircle.Radius = Settings.FOVSize
            FOVCircle.Transparency = Settings.FOVTransparency
            FOVCircle.Filled = Settings.FOVFilled
            if Colors.RainbowEnabled then
                FOVCircle.Color = Color3.fromHSV(tick()%5/5,1,1)
            else
                FOVCircle.Color = Colors.FOVColor
            end
        else
            FOVCircle.Visible = false
        end


        if ESPPart and ESPPart.Parent and ESPPart.Parent ~= game:GetService("Players").LocalPlayer.Character then
            local Health = 100
            local MaxHealth = 100
            if game.PlaceId == 292439477 then --fix for phantom forces lol
                if gethealth then
                    Health, MaxHealth = gethealth(MainPlayer)
                end
            else
                if ESPPart.Parent:FindFirstChild("Humanoid") then
                    Health = ESPPart.Parent:FindFirstChild("Humanoid").Health
                    MaxHealth = ESPPart.Parent:FindFirstChild("Humanoid").MaxHealth
                end
            end

            if ESPPart.Parent:FindFirstChild("Head") then
                local Vector, onScreen = camera:worldToViewportPoint(ESPPart.Position)
                local Distance = (camera.CFrame.p - ESPPart.Position).Magnitude
                local RootPart = ESPPart
                local Head = ESPPart.Parent:FindFirstChild("Head")
                local RootPosition, RootVis = worldToViewportPoint(camera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(camera, Head.Position + Settings.HeadOff)
                local LegPosition = worldToViewportPoint(camera, RootPart.Position - Settings.LegOff)
                local offsetCFrame = CFrame.new(0, 0, -Settings.Length)
                local headpos, OnScreen = camera:WorldToViewportPoint(Head.Position)
                local dir = Head.CFrame:ToWorldSpace(offsetCFrame)
                local dirpos, vis = camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))

                if onScreen then
                    if Settings.ChamsEnabled then
                        local PlayerBody = ESPPart.Parent
                        local _head = PlayerBody:FindFirstChild("Head")
                        local _torso = PlayerBody:FindFirstChild("Torso")
                        local _leftarm = PlayerBody:FindFirstChild("Left Arm")
                        local _rightarm = PlayerBody:FindFirstChild("Right Arm")
                        local _rightleg = PlayerBody:FindFirstChild("Right Leg")
                        local _leftleg = PlayerBody:FindFirstChild("Left Leg")

                        if _head and _torso and _leftarm and _rightarm and _rightleg and _leftleg then
                            local teamcheck = true 
                            if Settings.TeamCheckEnabled and MainPlayer.TeamColor == plr.TeamColor then
                                teamcheck = false
                            end
                            ChamsHead.Parent = _head
                            ChamsHead.Adornee = _head
                            ChamsHead.Size = _head.Size
                            ChamsHead.Visible = teamcheck
                            ChamsHead.Transparency = (1 - Settings.Transparency)

                            ChamsTorso.Parent = _torso
                            ChamsTorso.Adornee = _torso
                            ChamsTorso.Size = _torso.Size
                            ChamsTorso.Visible = teamcheck
                            ChamsTorso.Transparency = (1 - Settings.Transparency)
                            
                            ChamsLeftArm.Parent = _leftarm
                            ChamsLeftArm.Adornee = _leftarm
                            ChamsLeftArm.Size = _leftarm.Size
                            ChamsLeftArm.Visible = teamcheck
                            ChamsLeftArm.Transparency = (1 - Settings.Transparency)
                            
                            ChamsRightArm.Parent = _rightarm
                            ChamsRightArm.Adornee = _rightarm
                            ChamsRightArm.Size = _rightarm.Size
                            ChamsRightArm.Visible = teamcheck
                            ChamsRightArm.Transparency = (1 - Settings.Transparency)
                            
                            ChamsRightLeg.Parent = _rightleg
                            ChamsRightLeg.Adornee = _rightleg
                            ChamsRightLeg.Size = _rightleg.Size
                            ChamsRightLeg.Visible = teamcheck
                            ChamsRightLeg.Transparency = (1 - Settings.Transparency)
                            
                            ChamsLeftLeg.Parent = _leftleg
                            ChamsLeftLeg.Adornee = _leftleg
                            ChamsLeftLeg.Size = _leftleg.Size
                            ChamsLeftLeg.Visible = teamcheck
                            ChamsLeftLeg.Transparency = (1 - Settings.Transparency)

                            if ClosestBody and Closest and MainPlayer then
                                if Closest.Name == MainPlayer.Name then
                                    ChamsHead.Color3 = Color3.fromRGB(255, 255, 255)
                                    ChamsTorso.Color3 = Color3.fromRGB(255, 255, 255)
                                    ChamsLeftArm.Color3 = Color3.fromRGB(255, 255, 255)
                                    ChamsRightArm.Color3 = Color3.fromRGB(255, 255, 255)
                                    ChamsRightLeg.Color3 = Color3.fromRGB(255, 255, 255)
                                    ChamsLeftLeg.Color3 = Color3.fromRGB(255, 255, 255)
                                else
                                    if Colors.RainbowEnabled then
                                        ChamsHead.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                        ChamsTorso.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                        ChamsLeftArm.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                        ChamsRightArm.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                        ChamsRightLeg.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                        ChamsLeftLeg.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    elseif Colors.UseTeamColor then
                                        ChamsHead.Color3 = MainPlayer.TeamColor.Color
                                        ChamsTorso.Color3 = MainPlayer.TeamColor.Color
                                        ChamsLeftArm.Color3 = MainPlayer.TeamColor.Color
                                        ChamsRightArm.Color3 = MainPlayer.TeamColor.Color
                                        ChamsRightLeg.Color3 = MainPlayer.TeamColor.Color
                                        ChamsLeftLeg.Color3 = MainPlayer.TeamColor.Color
                                    else
                                        ChamsHead.Color3 = Colors.ChamsColor
                                        ChamsTorso.Color3 = Colors.ChamsColor
                                        ChamsLeftArm.Color3 = Colors.ChamsColor
                                        ChamsRightArm.Color3 = Colors.ChamsColor
                                        ChamsRightLeg.Color3 = Colors.ChamsColor
                                        ChamsLeftLeg.Color3 = Colors.ChamsColor
                                    end
                                end
                            else
                                if Colors.RainbowEnabled then
                                    ChamsHead.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    ChamsTorso.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    ChamsLeftArm.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    ChamsRightArm.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    ChamsRightLeg.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    ChamsLeftLeg.Color3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    ChamsHead.Color3 = MainPlayer.TeamColor.Color
                                    ChamsTorso.Color3 = MainPlayer.TeamColor.Color
                                    ChamsLeftArm.Color3 = MainPlayer.TeamColor.Color
                                    ChamsRightArm.Color3 = MainPlayer.TeamColor.Color
                                    ChamsRightLeg.Color3 = MainPlayer.TeamColor.Color
                                    ChamsLeftLeg.Color3 = MainPlayer.TeamColor.Color
                                else
                                    ChamsHead.Color3 = Colors.ChamsColor
                                    ChamsTorso.Color3 = Colors.ChamsColor
                                    ChamsLeftArm.Color3 = Colors.ChamsColor
                                    ChamsRightArm.Color3 = Colors.ChamsColor
                                    ChamsRightLeg.Color3 = Colors.ChamsColor
                                    ChamsLeftLeg.Color3 = Colors.ChamsColor
                                end
                            end
                        end
                    else
                        ChamsHead.Visible = false
                        ChamsTorso.Visible = false
                        ChamsLeftArm.Visible = false
                        ChamsRightArm.Visible = false
                        ChamsRightLeg.Visible = false
                        ChamsLeftLeg.Visible = false
                    end

                    if Settings.BoxEnabled then
                        local Size = Vector2.new(2, 3) * ESPPart.Parent.Head.Size.Y
                        local Top1 = ESPPart.CFrame * CFrame.new(Size.X, Size.Y, 0)
                        Top1 = camera:worldToViewportPoint(Top1.p)
                        local Top2 = ESPPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)
                        Top2 = camera:worldToViewportPoint(Top2.p)
                        local Bottom1 = ESPPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)
                        Bottom1 = camera:worldToViewportPoint(Bottom1.p)
                        local Bottom2 = ESPPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)
                        Bottom2 = camera:worldToViewportPoint(Bottom2.p)

                        BoxLine1.From = Vector2.new(Top1.X, Top1.Y)
                        BoxLine1.To = Vector2.new(Top2.X, Top2.Y)

                        BoxLine2.From = Vector2.new(Top2.X, Top2.Y)
                        BoxLine2.To = Vector2.new(Bottom2.X, Bottom2.Y)

                        BoxLine3.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        BoxLine3.To = Vector2.new(Bottom1.X, Bottom1.Y)

                        BoxLine4.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        BoxLine4.To = Vector2.new(Top1.X, Top1.Y)

                        BoxLine1.Thickness = Settings.Thickness
                        BoxLine2.Thickness = Settings.Thickness
                        BoxLine3.Thickness = Settings.Thickness
                        BoxLine4.Thickness = Settings.Thickness

                        BoxLine1.Transparency = Settings.Transparency
                        BoxLine2.Transparency = Settings.Transparency
                        BoxLine3.Transparency = Settings.Transparency
                        BoxLine4.Transparency = Settings.Transparency

                        BoxLine1.Visible = not (MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled)
                        BoxLine2.Visible = not (MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled)
                        BoxLine3.Visible = not (MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled)
                        BoxLine4.Visible = not (MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled)

                        if ClosestBody and Closest and MainPlayer then
                            if Closest.Name == MainPlayer.Name then
                                BoxLine1.Color = Color3.fromRGB(255, 255, 255)
                                BoxLine2.Color = Color3.fromRGB(255, 255, 255)
                                BoxLine3.Color = Color3.fromRGB(255, 255, 255)
                                BoxLine4.Color = Color3.fromRGB(255, 255, 255)
                            else
                                if Colors.RainbowEnabled then
                                    BoxLine1.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    BoxLine2.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    BoxLine3.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    BoxLine4.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    BoxLine1.Color = MainPlayer.TeamColor.Color
                                    BoxLine2.Color = MainPlayer.TeamColor.Color
                                    BoxLine3.Color = MainPlayer.TeamColor.Color
                                    BoxLine4.Color = MainPlayer.TeamColor.Color
                                else
                                    BoxLine1.Color = Colors.BoxColor
                                    BoxLine2.Color = Colors.BoxColor
                                    BoxLine3.Color = Colors.BoxColor
                                    BoxLine4.Color = Colors.BoxColor
                                end
                            end
                        else
                            if Colors.RainbowEnabled then
                                BoxLine1.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                BoxLine2.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                BoxLine3.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                BoxLine4.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            elseif Colors.UseTeamColor then
                                BoxLine1.Color = MainPlayer.TeamColor.Color
                                BoxLine2.Color = MainPlayer.TeamColor.Color
                                BoxLine3.Color = MainPlayer.TeamColor.Color
                                BoxLine4.Color = MainPlayer.TeamColor.Color
                            else
                                BoxLine1.Color = Colors.BoxColor
                                BoxLine2.Color = Colors.BoxColor
                                BoxLine3.Color = Colors.BoxColor
                                BoxLine4.Color = Colors.BoxColor
                            end
                        end
                    else
                        BoxLine1.Visible = false
                        BoxLine2.Visible = false
                        BoxLine3.Visible = false
                        BoxLine4.Visible = false
                    end

                    if Settings.ShowHealthbar then
                        local size = Vector2.new(2000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        local pos = Vector2.new(RootPosition.X - size.X / 2, RootPosition.Y - size.Y / 2)

                        HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (MaxHealth / math.clamp(Health, 0, MaxHealth)))
                        HealthBar.Position = Vector2.new(pos.X - 6, pos.Y + (1 / HealthBar.Size.Y))
                        HealthBar.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)
                        HealthBar.Visible = true
                        HealthBar.Thickness = Settings.Thickness
                        HealthBar.Transparency = Settings.Transparency

                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            HealthBar.Visible = false
                        else
                            HealthBar.Visible = true
                        end
                    else
                        HealthBar.Visible = false
                    end

                    if Settings.Box2DEnabled then
                        Box.Size = Vector2.new(2000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Box.Visible = true
                        Box.Thickness = Settings.Thickness
                        Box.Transparency = Settings.Transparency

                        if ClosestBody and Closest and MainPlayer then
                            if Closest.Name == MainPlayer.Name then
                                Box.Color = Color3.fromRGB(255, 255, 255)
                            else
                                if Colors.RainbowEnabled then
                                    Box.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    Box.Color = MainPlayer.TeamColor.Color
                                else
                                    Box.Color = Colors.Box2DColor
                                end
                            end
                        else
                            if Colors.RainbowEnabled then
                                Box.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            elseif Colors.UseTeamColor then
                                Box.Color = MainPlayer.TeamColor.Color
                            else
                                Box.Color = Colors.Box2DColor
                            end
                        end

                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            Box.Visible = false
                        else
                            Box.Visible = true
                        end
                    else
                        Box.Visible = false
                        HealthBar.Visible = false
                    end

                    if Settings.TracerEnabled then
                        if plr.Character and plr.Character:FindFirstChild("Head") then
                            if Settings.TracerFrom == "Bottom" then
                                Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                            elseif Settings.TracerFrom == "Top" then
                                Tracer.From = Vector2.new(camera.ViewportSize.X / 2, 0)
                            elseif Settings.TracerFrom == "Middle" then
                                Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                            end
                            
                            if Settings.Box2DEnabled then
                                Tracer.To = Vector2.new(Box.Position.X + (Box.Size.X / 2), Box.Position.Y)
                            else
                                if Settings.BoxEnabled then
                                    local line = BoxLine3
                                    if Settings.TracerFrom == "Top" then
                                        line = BoxLine1
                                    end
                                    local location = (line.To + line.From) / 2
                                    Tracer.To = Vector2.new(location.X, location.Y)
                                else
                                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                                end
                            end
                            Tracer.Visible = true
                            Tracer.Transparency = Settings.Transparency

                            Tracer.Thickness = Settings.Thickness

                            if ClosestBody and Closest and MainPlayer then
                                if Closest.Name == MainPlayer.Name then
                                    Tracer.Color = Color3.fromRGB(255, 255, 255)
                                else
                                    if Colors.RainbowEnabled then
                                        Tracer.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    elseif Colors.UseTeamColor then
                                        Tracer.Color = MainPlayer.TeamColor.Color
                                    else
                                        Tracer.Color = Colors.TracersColor
                                    end
                                end
                            else
                                if Colors.RainbowEnabled then
                                    Tracer.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    Tracer.Color = MainPlayer.TeamColor.Color
                                else
                                    Tracer.Color = Colors.TracersColor
                                end
                            end

                            if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                                Tracer.Visible = false
                            else
                                Tracer.Visible = true
                            end
                        end
                    else
                        Tracer.Visible = false
                    end
                    if Settings.ViewTracerEnabled then
                        Viewline.From = Vector2.new(headpos.X, headpos.Y)
                        offsetCFrame = offsetCFrame * CFrame.new(0, 0, 0.01)
                        Viewline.To = Vector2.new(dirpos.X, dirpos.Y)
                        Viewline.Visible = true
                        offsetCFrame = CFrame.new(0, 0, -Settings.Length)
                        Viewline.Thickness = Settings.Thickness

                        if ClosestBody and Closest and MainPlayer then
                            if Closest.Name == MainPlayer.Name then
                                Viewline.Color = Color3.fromRGB(255, 255, 255)
                            else
                                if Colors.RainbowEnabled then
                                    Viewline.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    Viewline.Color = MainPlayer.TeamColor.Color
                                else
                                    Viewline.Color = Colors.ViewTracersColor
                                end
                            end
                        else
                            if Colors.RainbowEnabled then
                                Viewline.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            elseif Colors.UseTeamColor then
                                Viewline.Color = MainPlayer.TeamColor.Color
                            else
                                Viewline.Color = Colors.ViewTracersColor
                            end
                        end

                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            Viewline.Visible = false
                        else
                            Viewline.Visible = true
                        end
                    else
                        Viewline.Visible = false
                    end
                    if Settings.NameEnabled then
                        Name.Text = tostring("["..math.floor(Distance).."] "..MainPlayer.Name.." ["..math.floor(MaxHealth).."/"..math.floor(Health).."]")
                        Name.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Name.Size = Settings.TextSize
                        Name.Transparency = Settings.Transparency
                        Name.Visible = true
                        Name.Outline = Settings.TextOutlineEnabled

                        if ClosestBody and Closest and MainPlayer then
                            if Closest.Name == MainPlayer.Name then
                                Name.Color = Color3.fromRGB(255, 255, 255)
                            else
                                if Colors.RainbowEnabled then
                                    Name.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    Name.Color = MainPlayer.TeamColor.Color
                                else
                                    Name.Color = Colors.NameESPColor
                                end
                            end
                        else
                            if Colors.RainbowEnabled then
                                Name.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            elseif Colors.UseTeamColor then
                                Name.Color = MainPlayer.TeamColor.Color
                            else
                                Name.Color = Colors.NameESPColor
                            end
                        end

                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            Name.Visible = false
                        else
                            Name.Visible = true
                        end
                    else
                        Name.Visible = false
                    end
                    if Settings.Box3DEnabled then
                        local Scale = ESPPart.Parent.Head.Size.Y/2
                        local Size = Vector3.new(2, 3, 1.5) * (Scale * 2)

                        local Top1 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                        local Top2 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                        local Top3 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                        local Top4 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                        local Bottom1 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                        local Bottom2 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                        local Bottom3 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                        local Bottom4 = camera:WorldToViewportPoint((ESPPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                        --// Top:
                        line1.From = Vector2.new(Top1.X, Top1.Y)
                        line1.To = Vector2.new(Top2.X, Top2.Y)

                        line2.From = Vector2.new(Top2.X, Top2.Y)
                        line2.To = Vector2.new(Top3.X, Top3.Y)

                        line3.From = Vector2.new(Top3.X, Top3.Y)
                        line3.To = Vector2.new(Top4.X, Top4.Y)

                        line4.From = Vector2.new(Top4.X, Top4.Y)
                        line4.To = Vector2.new(Top1.X, Top1.Y)

                        --// Bottom:
                        line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                        line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                        line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                        line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                        line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                        line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                        --// Sides:
                        line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        line9.To = Vector2.new(Top1.X, Top1.Y)

                        line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        line10.To = Vector2.new(Top2.X, Top2.Y)

                        line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                        line11.To = Vector2.new(Top3.X, Top3.Y)

                        line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                        line12.To = Vector2.new(Top4.X, Top4.Y)

                        line1.Thickness = Settings.Thickness
                        line2.Thickness = Settings.Thickness
                        line3.Thickness = Settings.Thickness
                        line4.Thickness = Settings.Thickness
                        line5.Thickness = Settings.Thickness
                        line6.Thickness = Settings.Thickness
                        line7.Thickness = Settings.Thickness
                        line8.Thickness = Settings.Thickness
                        line9.Thickness = Settings.Thickness
                        line10.Thickness = Settings.Thickness
                        line11.Thickness = Settings.Thickness
                        line12.Thickness = Settings.Thickness

                        line1.Transparency = Settings.Transparency
                        line2.Transparency = Settings.Transparency
                        line3.Transparency = Settings.Transparency
                        line4.Transparency = Settings.Transparency
                        line5.Transparency = Settings.Transparency
                        line6.Transparency = Settings.Transparency
                        line7.Transparency = Settings.Transparency
                        line8.Transparency = Settings.Transparency
                        line9.Transparency = Settings.Transparency
                        line10.Transparency = Settings.Transparency
                        line11.Transparency = Settings.Transparency
                        line12.Transparency = Settings.Transparency

                        line1.Visible = true
                        line2.Visible = true
                        line3.Visible = true
                        line4.Visible = true
                        line5.Visible = true
                        line6.Visible = true
                        line7.Visible = true
                        line8.Visible = true
                        line9.Visible = true
                        line10.Visible = true
                        line11.Visible = true
                        line12.Visible = true


                        if ClosestBody and Closest and MainPlayer then
                            if Closest.Name == MainPlayer.Name then
                                line1.Color = Color3.fromRGB(255, 255, 255)
                                line2.Color = Color3.fromRGB(255, 255, 255)
                                line3.Color = Color3.fromRGB(255, 255, 255)
                                line4.Color = Color3.fromRGB(255, 255, 255)
                                line5.Color = Color3.fromRGB(255, 255, 255)
                                line6.Color = Color3.fromRGB(255, 255, 255)
                                line7.Color = Color3.fromRGB(255, 255, 255)
                                line8.Color = Color3.fromRGB(255, 255, 255)
                                line9.Color = Color3.fromRGB(255, 255, 255)
                                line10.Color = Color3.fromRGB(255, 255, 255)
                                line11.Color = Color3.fromRGB(255, 255, 255)
                                line12.Color = Color3.fromRGB(255, 255, 255)
                            else
                                if Colors.RainbowEnabled then
                                    line1.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line2.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line3.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line4.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line5.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line6.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line7.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line8.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line9.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line10.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line11.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                    line12.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                elseif Colors.UseTeamColor then
                                    line1.Color = MainPlayer.TeamColor.Color
                                    line2.Color = MainPlayer.TeamColor.Color
                                    line3.Color = MainPlayer.TeamColor.Color
                                    line4.Color = MainPlayer.TeamColor.Color
                                    line5.Color = MainPlayer.TeamColor.Color
                                    line6.Color = MainPlayer.TeamColor.Color
                                    line7.Color = MainPlayer.TeamColor.Color
                                    line8.Color = MainPlayer.TeamColor.Color
                                    line9.Color = MainPlayer.TeamColor.Color
                                    line10.Color = MainPlayer.TeamColor.Color
                                    line11.Color = MainPlayer.TeamColor.Color
                                    line12.Color = MainPlayer.TeamColor.Color
                                else
                                    line1.Color = Colors.Box3DColor
                                    line2.Color = Colors.Box3DColor
                                    line3.Color = Colors.Box3DColor
                                    line4.Color = Colors.Box3DColor
                                    line5.Color = Colors.Box3DColor
                                    line6.Color = Colors.Box3DColor
                                    line7.Color = Colors.Box3DColor
                                    line8.Color = Colors.Box3DColor
                                    line9.Color = Colors.Box3DColor
                                    line10.Color = Colors.Box3DColor
                                    line11.Color = Colors.Box3DColor
                                    line12.Color = Colors.Box3DColor
                                end
                            end
                        else
                            if Colors.RainbowEnabled then
                                line1.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line2.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line3.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line4.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line5.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line6.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line7.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line8.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line9.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line10.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line11.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                line12.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            elseif Colors.UseTeamColor then
                                line1.Color = MainPlayer.TeamColor.Color
                                line2.Color = MainPlayer.TeamColor.Color
                                line3.Color = MainPlayer.TeamColor.Color
                                line4.Color = MainPlayer.TeamColor.Color
                                line5.Color = MainPlayer.TeamColor.Color
                                line6.Color = MainPlayer.TeamColor.Color
                                line7.Color = MainPlayer.TeamColor.Color
                                line8.Color = MainPlayer.TeamColor.Color
                                line9.Color = MainPlayer.TeamColor.Color
                                line10.Color = MainPlayer.TeamColor.Color
                                line11.Color = MainPlayer.TeamColor.Color
                                line12.Color = MainPlayer.TeamColor.Color
                            else
                                line1.Color = Colors.Box3DColor
                                line2.Color = Colors.Box3DColor
                                line3.Color = Colors.Box3DColor
                                line4.Color = Colors.Box3DColor
                                line5.Color = Colors.Box3DColor
                                line6.Color = Colors.Box3DColor
                                line7.Color = Colors.Box3DColor
                                line8.Color = Colors.Box3DColor
                                line9.Color = Colors.Box3DColor
                                line10.Color = Colors.Box3DColor
                                line11.Color = Colors.Box3DColor
                                line12.Color = Colors.Box3DColor
                            end
                        end

                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            line1.Visible = false
                            line2.Visible = false
                            line3.Visible = false
                            line4.Visible = false
                            line5.Visible = false
                            line6.Visible = false
                            line7.Visible = false
                            line8.Visible = false
                            line9.Visible = false
                            line10.Visible = false
                            line11.Visible = false
                            line12.Visible = false
                        else
                            line1.Visible = true
                            line2.Visible = true
                            line3.Visible = true
                            line4.Visible = true
                            line5.Visible = true
                            line6.Visible = true
                            line7.Visible = true
                            line8.Visible = true
                            line9.Visible = true
                            line10.Visible = true
                            line11.Visible = true
                            line12.Visible = true
                        end
                    else
                        line1.Visible = false
                        line2.Visible = false
                        line3.Visible = false
                        line4.Visible = false
                        line5.Visible = false
                        line6.Visible = false
                        line7.Visible = false
                        line8.Visible = false
                        line9.Visible = false
                        line10.Visible = false
                        line11.Visible = false
                        line12.Visible = false
                    end
                    if Settings.SkeletonESPEnabled then
                        local Torso = camera:WorldToViewportPoint(ESPPart.Parent["Torso"].Position)
        
                        local LeftLeg = camera:WorldToViewportPoint(ESPPart.Parent["Left Leg"].Position)
                        local RightLeg = camera:WorldToViewportPoint(ESPPart.Parent["Right Leg"].Position)
        
                        local LeftArm = camera:WorldToViewportPoint(ESPPart.Parent["Left Arm"].Position)
                        local RightArm = camera:WorldToViewportPoint(ESPPart.Parent["Right Arm"].Position)
        
                        local Head = camera:WorldToViewportPoint(ESPPart.Parent["Head"].Position)
                        
                        SkeletonTorso.Visible = true
                        SkeletonHead.Visible = true
                        SkeletonLeftArm.Visible = true
                        SkeletonLeftLeg.Visible = true
                        SkeletonRightArm.Visible = true
                        SkeletonRightLeg.Visible = true

                        SkeletonTorso.Transparency = Settings.Transparency
                        SkeletonHead.Transparency = Settings.Transparency
                        SkeletonLeftArm.Transparency = Settings.Transparency
                        SkeletonLeftLeg.Transparency = Settings.Transparency
                        SkeletonRightArm.Transparency = Settings.Transparency
                        SkeletonRightLeg.Transparency = Settings.Transparency

                        SkeletonTorso.Thickness = Settings.Thickness
                        SkeletonHead.Thickness = Settings.Thickness
                        SkeletonLeftArm.Thickness = Settings.Thickness
                        SkeletonLeftLeg.Thickness = Settings.Thickness
                        SkeletonRightArm.Thickness = Settings.Thickness
                        SkeletonRightLeg.Thickness = Settings.Thickness
                        
                        SkeletonTorso.From = Vector2.new(Torso.X, Torso.Y)
                        SkeletonTorso.To = Vector2.new(Torso.X, Torso.Y)
        
                        SkeletonHead.From = Vector2.new(Torso.X, Torso.Y)
                        SkeletonHead.To = Vector2.new(Head.X, Head.Y)
        
                        SkeletonLeftLeg.From = Vector2.new(LeftLeg.X, LeftLeg.Y)
                        SkeletonLeftLeg.To = Vector2.new(Torso.X, Torso.Y)
        
                        SkeletonRightLeg.From = Vector2.new(RightLeg.X, RightLeg.Y)
                        SkeletonRightLeg.To = Vector2.new(Torso.X, Torso.Y)
        
                        SkeletonLeftArm.From = Vector2.new(LeftArm.X, LeftArm.Y)
                        SkeletonLeftArm.To = Vector2.new(Torso.X, Torso.Y)
        
                        SkeletonRightArm.From = Vector2.new(RightArm.X, RightArm.Y)
                        SkeletonRightArm.To = Vector2.new(Torso.X, Torso.Y)

                        if ClosestBody and Closest and MainPlayer then
                            if Closest.Name == MainPlayer.Name then
                                Viewline.Color = Color3.fromRGB(255, 255, 255)
                                SkeletonTorso.Color = Color3.fromRGB(255, 255, 255)
                                SkeletonHead.Color = Color3.fromRGB(255, 255, 255)
                                SkeletonLeftArm.Color = Color3.fromRGB(255, 255, 255)
                                SkeletonLeftLeg.Color = Color3.fromRGB(255, 255, 255)
                                SkeletonRightArm.Color = Color3.fromRGB(255, 255, 255)
                                SkeletonRightLeg.Color = Color3.fromRGB(255, 255, 255)
                            else
                                if Colors.RainbowEnabled then
                                    SkeletonTorso.Color = Color3.fromHSV(tick()%5/5,1,1)
                                    SkeletonHead.Color = Color3.fromHSV(tick()%5/5,1,1)
                                    SkeletonLeftArm.Color = Color3.fromHSV(tick()%5/5,1,1)
                                    SkeletonLeftLeg.Color = Color3.fromHSV(tick()%5/5,1,1)
                                    SkeletonRightArm.Color = Color3.fromHSV(tick()%5/5,1,1)
                                    SkeletonRightLeg.Color = Color3.fromHSV(tick()%5/5,1,1)
                                elseif Colors.UseTeamColor then
                                    SkeletonTorso.Color = MainPlayer.TeamColor.Color
                                    SkeletonHead.Color = MainPlayer.TeamColor.Color
                                    SkeletonLeftArm.Color = MainPlayer.TeamColor.Color
                                    SkeletonLeftLeg.Color = MainPlayer.TeamColor.Color
                                    SkeletonRightArm.Color = MainPlayer.TeamColor.Color
                                    SkeletonRightLeg.Color = MainPlayer.TeamColor.Color
                                else
                                    SkeletonTorso.Color = Colors.SkeletonESPColor
                                    SkeletonHead.Color = Colors.SkeletonESPColor
                                    SkeletonLeftArm.Color = Colors.SkeletonESPColor
                                    SkeletonLeftLeg.Color = Colors.SkeletonESPColor
                                    SkeletonRightArm.Color = Colors.SkeletonESPColor
                                    SkeletonRightLeg.Color =Colors.SkeletonESPColor
                                end
                            end
                        else
                            if Colors.RainbowEnabled then
                                SkeletonTorso.Color = Color3.fromHSV(tick()%5/5,1,1)
                                SkeletonHead.Color = Color3.fromHSV(tick()%5/5,1,1)
                                SkeletonLeftArm.Color = Color3.fromHSV(tick()%5/5,1,1)
                                SkeletonLeftLeg.Color = Color3.fromHSV(tick()%5/5,1,1)
                                SkeletonRightArm.Color = Color3.fromHSV(tick()%5/5,1,1)
                                SkeletonRightLeg.Color = Color3.fromHSV(tick()%5/5,1,1)
                            elseif Colors.UseTeamColor then
                                SkeletonTorso.Color = MainPlayer.TeamColor.Color
                                SkeletonHead.Color = MainPlayer.TeamColor.Color
                                SkeletonLeftArm.Color = MainPlayer.TeamColor.Color
                                SkeletonLeftLeg.Color = MainPlayer.TeamColor.Color
                                SkeletonRightArm.Color = MainPlayer.TeamColor.Color
                                SkeletonRightLeg.Color = MainPlayer.TeamColor.Color
                            else
                                SkeletonTorso.Color = Colors.SkeletonESPColor
                                SkeletonHead.Color = Colors.SkeletonESPColor
                                SkeletonLeftArm.Color = Colors.SkeletonESPColor
                                SkeletonLeftLeg.Color = Colors.SkeletonESPColor
                                SkeletonRightArm.Color = Colors.SkeletonESPColor
                                SkeletonRightLeg.Color =Colors.SkeletonESPColor
                            end
                        end
                        
                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            SkeletonTorso.Visible = false
                            SkeletonHead.Visible = false
                            SkeletonLeftArm.Visible = false
                            SkeletonLeftLeg.Visible = false
                            SkeletonRightArm.Visible = false
                            SkeletonRightLeg.Visible = false
                        else
                            SkeletonTorso.Visible = true
                            SkeletonHead.Visible = true
                            SkeletonLeftArm.Visible = true
                            SkeletonLeftLeg.Visible = true
                            SkeletonRightArm.Visible = true
                            SkeletonRightLeg.Visible = true
                        end
                    else
                        SkeletonTorso.Visible = false
                        SkeletonHead.Visible = false
                        SkeletonLeftArm.Visible = false
                        SkeletonLeftLeg.Visible = false
                        SkeletonRightArm.Visible = false
                        SkeletonRightLeg.Visible = false
                    end
                else
                    Box.Visible = false
                    HealthBar.Visible = false
                    Tracer.Visible = false
                    Name.Visible = false
                    SkeletonTorso.Visible = false
                    SkeletonHead.Visible = false
                    SkeletonLeftArm.Visible = false
                    SkeletonLeftLeg.Visible = false
                    SkeletonRightArm.Visible = false
                    SkeletonRightLeg.Visible = false
                    line1.Visible = false
                    line2.Visible = false
                    line3.Visible = false
                    line4.Visible = false
                    line5.Visible = false
                    line6.Visible = false
                    line7.Visible = false
                    line8.Visible = false
                    line9.Visible = false
                    line10.Visible = false
                    line11.Visible = false
                    line12.Visible = false
                    Viewline.Visible = false
                    BoxLine1.Visible = false
                    BoxLine2.Visible = false
                    BoxLine3.Visible = false
                    BoxLine4.Visible = false
                end
            else
                Box.Visible = false
                HealthBar.Visible = false
                Tracer.Visible = false
                Name.Visible = false
                SkeletonTorso.Visible = false
                SkeletonHead.Visible = false
                SkeletonLeftArm.Visible = false
                SkeletonLeftLeg.Visible = false
                SkeletonRightArm.Visible = false
                SkeletonRightLeg.Visible = false
                line1.Visible = false
                line2.Visible = false
                line3.Visible = false
                line4.Visible = false
                line5.Visible = false
                line6.Visible = false
                line7.Visible = false
                line8.Visible = false
                line9.Visible = false
                line10.Visible = false
                line11.Visible = false
                line12.Visible = false
                Viewline.Visible = false
                BoxLine1.Visible = false
                BoxLine2.Visible = false
                BoxLine3.Visible = false
                BoxLine4.Visible = false
            end
        else
            Box.Visible = false
            HealthBar.Visible = false
            Tracer.Visible = false
            Name.Visible = false
            SkeletonTorso.Visible = false
            SkeletonHead.Visible = false
            SkeletonLeftArm.Visible = false
            SkeletonLeftLeg.Visible = false
            SkeletonRightArm.Visible = false
            SkeletonRightLeg.Visible = false
            line1.Visible = false
            line2.Visible = false
            line3.Visible = false
            line4.Visible = false
            line5.Visible = false
            line6.Visible = false
            line7.Visible = false
            line8.Visible = false
            line9.Visible = false
            line10.Visible = false
            line11.Visible = false
            line12.Visible = false
            Viewline.Visible = false
            BoxLine1.Visible = false
            BoxLine2.Visible = false
            BoxLine3.Visible = false
            BoxLine4.Visible = false
        end
    end)
    return {Box, HealthBar, Tracer, Name, FOVCircle, SkeletonTorso, SkeletonHead, SkeletonLeftLeg, SkeletonRightLeg, SkeletonLeftArm, SkeletonRightArm, 
    line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, Viewline}
end

local function CreateLightning(startPos, endPos)
    local tracercolor = Colors.BulletTracerColor
    if Colors.RainbowEnabled then
        tracercolor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
	local lastloc = startPos
	for i = 0, ((startPos - endPos).Magnitude / 3.3) do
		local offset = Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1,1))
		local newPos = startPos + (endPos - startPos).Unit * i * (endPos - startPos).Magnitude / ((startPos - endPos).Magnitude / 3.3)
		if i == 0 or i == ((startPos - endPos).Magnitude / 3.3) then
			offset = Vector3.new(0, 0, 0)
		end
        local currentpos = newPos + offset
        if i == ((startPos - endPos).Magnitude / 3.3) then
            currentpos = endPos
        end

		local startoftracer = Instance.new("Part", game.Workspace:FindFirstChild("Ignore") or game.Workspace)
		local endoftracer = Instance.new("Part", game.Workspace:FindFirstChild("Ignore") or game.Workspace)
		local attach = Instance.new("Attachment", startoftracer)
		local attach2 = Instance.new("Attachment", endoftracer)
		local laser = Instance.new("Beam", startoftracer)
		startoftracer.Size = Vector3.new(1, 1, 1)
		startoftracer.Transparency = 1
		startoftracer.CanCollide = false
		startoftracer.CFrame = CFrame.new(lastloc)
		startoftracer.Anchored = true
		endoftracer.Size = Vector3.new(1, 1, 1)
		endoftracer.Transparency = 1
		endoftracer.CanCollide = false
		endoftracer.CFrame = CFrame.new(currentpos)
		endoftracer.Anchored = true
		laser.FaceCamera = false
		laser.Color = ColorSequence.new(tracercolor, tracercolor)
		laser.LightEmission = 3
		laser.LightInfluence = 0
		laser.Width0 = 0.15
		laser.Width1 = 0.15
		laser.Attachment0 = attach
		laser.Attachment1 = attach2
		lastloc = currentpos
		delay(1.6, function()
			for i = 0.5, 1.3, 0.2 do
				wait()
				laser.Transparency = NumberSequence.new(i)
			end
			startoftracer:Destroy()
			endoftracer:Destroy()
		end)
	end
end

local function BulletTracer(p1, p2)
    local tracercolor = Colors.BulletTracerColor
    if Colors.RainbowEnabled then
        tracercolor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
    local colorSequence = ColorSequence.new(tracercolor, Color3.fromRGB(255, 255, 255))
    local startoftracer = Instance.new("Part", game.Workspace.Map)
    local endoftracer = Instance.new("Part", game.Workspace.Map)
    local attach = Instance.new("Attachment", startoftracer)
    local attach2 = Instance.new("Attachment", endoftracer)
    local laser = Instance.new("Beam", startoftracer)
    startoftracer.Size = Vector3.new(1, 1, 1)
    startoftracer.Transparency = 1
    startoftracer.CanCollide = false
    startoftracer.CFrame = CFrame.new(p1)
    startoftracer.Anchored = true
    endoftracer.Size = Vector3.new(1, 1, 1)
    endoftracer.Transparency = 1
    endoftracer.CanCollide = false
    endoftracer.CFrame = CFrame.new(p2)
    endoftracer.Anchored = true
    laser.FaceCamera = false
    laser.Color = colorSequence
    laser.LightEmission = 0
    laser.LightInfluence = 0
    laser.Width0 = 0.1
    laser.Width1 = 0.1
    laser.Attachment0 = attach
    laser.Attachment1 = attach2
    delay(1.6, function()
        for i = 0.5, 1.3, 0.2 do
            wait()
            laser.Transparency = NumberSequence.new(i)
        end
        startoftracer:Destroy()
        endoftracer:Destroy()
    end)
end

local function BulletImpact(p)
    local impactcolor = Colors.BulletImpactColor
    if Colors.RainbowEnabled then
        impactcolor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
    local impact = Instance.new("Part", game.Workspace)
    impact.Color = impactcolor
    impact.Size = Vector3.new(0.55, 0.55, 0.55)
    impact.Material = Enum.Material.ForceField
    impact.Position = p
    impact.Anchored = true
    impact.CanCollide = false
    delay(1.6, function()
        for i = 0.5, 1.3, 0.2 do
            wait()
            impact.Transparency = NumberSequence.new(i)
        end
        impact:Destroy()
    end)
end

print("Using CattoriESP Library!")

return {
    ["Settings"] = Settings,
    ["ApplyESP"] = ApplyESP,
    ["Colors"] = Colors,
    ["Extra"] = {
        ["CreateBulletTracer"] = BulletTracer,
        ["CreateBulletImpact"] = BulletImpact,
        ["CreateLightning"] = CreateLightning
    }
}
