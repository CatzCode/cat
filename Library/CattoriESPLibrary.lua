local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera
local worldToViewportPoint = camera.worldToViewportPoint
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local gethealth

for i,v in pairs(getgc()) do
    if game.PlaceId == 292439477 then
        if type(v) == "function" and debug.getinfo(v).name ~= nil then
            if string.find(string.lower(debug.getinfo(v).name), "gethealth") then
                gethealth = v
            end
        end
    end
end

local Settings = {
    Box2DEnabled = false,
    HealthbarBox2D = true,
    TracerEnabled = false,
    NameEnabled = false,
    SkeletonESPEnabled = false,
    Box3DEnabled = false,
    ViewTracerEnabled = false,
    TextOutlineEnabled = false,
    TeamCheckEnabled = false,
    MouseFrom = false,
    BottomFrom = true,
    HeadFrom = false,
    RoundedCorner = 12,
    Length = 14,
    FOVSize = 300,
    FOVEnabled = false,
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
    ["RainbowEnabled"] = false,
    ["Box2DColor"] = Color3.fromRGB(255,255,255),
    ["TracersColor"] = Color3.fromRGB(255,255,255),
    ["NameESPColor"] = Color3.fromRGB(255,255,255),
    ["SkeletonESPColor"] = Color3.fromRGB(255,255,255),
    ["Box3DColor"] = Color3.fromRGB(255,255,255),
    ["ViewTracersColor"] = Color3.fromRGB(255,255,255),
    ["FOVColor"] = Color3.fromRGB(255,255,255),
    ["BulletTracerColor"] = Color3.fromRGB(255,255,255),
    ["BulletImpactColor"] = Color3.fromRGB(255,255,255)
}

local ApplyESP = function(getargs)
    if not getargs or (getargs and typeof(getargs) ~= "function") then
        print("Usage: ApplyESP(function() return (player), (humanoidrootpart) end)")
        return
    end

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
    FOVCircle.Transparency = Settings.Transparency

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

    game:GetService("RunService").RenderStepped:Connect(function()
        local MainPlayer, ESPPart = getargs()

        if Settings.FOVEnabled then
            FOVCircle.Visible = true
            FOVCircle.Position = Vector2.new(mouse.X, mouse.Y + 36)
            FOVCircle.Thickness = Settings.Thickness
            FOVCircle.NumSides = Settings.RoundedCorner
            FOVCircle.Radius = Settings.FOVSize
            if Colors.RainbowEnabled then
                FOVCircle.Color = Color3.fromHSV(tick()%5/5,1,1)
            else
                FOVCircle.Color = Colors.FOVColor
            end
        else
            FOVCircle.Visible = false
        end


        if (ESPPart and ESPPart.Parent) and ESPPart.Parent ~= game:GetService("Players").LocalPlayer.Character then
            local Health = 100
            local MaxHealth = 100
            if game.PlaceId == 292439477 then --fix for phantom forces lol
                if gethealth(MainPlayer) then
                    Health = gethealth(MainPlayer)["health0"]
                    MaxHealth = gethealth(MainPlayer)["maxhealth"]
                end
            else
                if ESPPart.Parent:FindFirstChild("Humanoid") then
                    Health = ESPPart.Parent:FindFirstChild("Humanoid").Health
                    MaxHealth = ESPPart.Parent:FindFirstChild("Humanoid").MaxHealth
                end
            end

            --if Health > 0 then
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
                    if Settings.Box2DEnabled then
                        Box.Size = Vector2.new(2000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Box.Visible = true
        
                        HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (MaxHealth / math.clamp(Health, 0, MaxHealth)))
                        HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                        HealthBar.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)
                        HealthBar.Visible = Settings.HealthbarBox2D

                        Box.Thickness = Settings.Thickness
                        HealthBar.Thickness = Settings.Thickness
                        Box.Transparency = Settings.Transparency
                        HealthBar.Transparency = Settings.Transparency

                        if Colors.RainbowEnabled then
                            Box.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                        else
                            Box.Color = Colors.Box2DColor
                        end

                        if MainPlayer.TeamColor == plr.TeamColor and Settings.TeamCheckEnabled then
                            HealthBar.Visible = false
                            Box.Visible = false
                        else
                            Box.Visible = true
                            if Settings.HealthbarBox2D then
                                HealthBar.Visible = true
                            end
                        end
                    else
                        Box.Visible = false
                        HealthBar.Visible = false
                    end
                    if Settings.TracerEnabled then
                        if plr.Character:FindFirstChild("Head") then
                            if Settings.BottomFrom then
                                Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                            elseif Settings.HeadFrom then
                                local headpos = camera:WorldToViewportPoint(plr.Character:FindFirstChild("Head").Position)
                                Tracer.From = Vector2.new(headpos.X, headpos.Y)
                            elseif Settings.MouseFrom then
                                Tracer.From = Vector2.new(mouse.X, mouse.Y+36)
                            end
                            if Settings.Box2DEnabled then
                                Tracer.To = Vector2.new(Box.Position.X + (Box.Size.X / 2), Box.Position.Y)
                            else
                                Tracer.To = Vector2.new(Vector.X, Vector.Y)
                            end
                            Tracer.Visible = true
                            Tracer.Transparency = Settings.Transparency

                            Tracer.Thickness = Settings.Thickness

                            if Colors.RainbowEnabled then
                                Tracer.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            else
                                Tracer.Color = Colors.TracersColor
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
                        if Colors.RainbowEnabled then
                            Viewline.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                        else
                            Viewline.Color = Colors.ViewTracersColor
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

                        if Colors.RainbowEnabled then
                            Name.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                        else
                            Name.Color = Colors.NameESPColor
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

                        --//S ides:
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

                        if Colors.RainbowEnabled then
                            SkeletonTorso.Color = Color3.fromHSV(tick()%5/5,1,1)
                            SkeletonHead.Color = Color3.fromHSV(tick()%5/5,1,1)
                            SkeletonLeftArm.Color = Color3.fromHSV(tick()%5/5,1,1)
                            SkeletonLeftLeg.Color = Color3.fromHSV(tick()%5/5,1,1)
                            SkeletonRightArm.Color = Color3.fromHSV(tick()%5/5,1,1)
                            SkeletonRightLeg.Color = Color3.fromHSV(tick()%5/5,1,1)
                        else
                            SkeletonTorso.Color = Colors.SkeletonESPColor
                            SkeletonHead.Color = Colors.SkeletonESPColor
                            SkeletonLeftArm.Color = Colors.SkeletonESPColor
                            SkeletonLeftLeg.Color = Colors.SkeletonESPColor
                            SkeletonRightArm.Color = Colors.SkeletonESPColor
                            SkeletonRightLeg.Color =Colors.SkeletonESPColor
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
                end
                --[[
            else
                if getbodyparts(MainPlayer) then
                    print(getbodyparts(MainPlayer))
                end
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
            end
            ]]--
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
        end
    end)
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
    local impact = Instance.new("Part", game.Workspace.Map)
    impact.Color = impactcolor
    impact.Size = Vector3.new(1, 1, 1)
    impact.Transparency = 0.5
    impact.Position = p
    impact.Anchored = true
    impact.CanCollide = false
    delay(1.6, function()
        for i = 1, 10 do
            wait()
            impact.Transparency = impact.Transparency + 0.05
        end
        impact:Destroy()
    end)
end

_G.GetCattowareESP = function()
    print("Using CattoriESP Library!")
    return {
        ["Settings"] = Settings,
        ["ApplyESP"] = ApplyESP,
        ["Colors"] = Colors,
        ["Extra"] = {
            ["CreateBulletTracer"] = BulletTracer,
            ["CreateBulletImpact"] = BulletImpact,
        }
    }
end
