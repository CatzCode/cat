local gamelist = {
    [2041312716] = "CatdollEngine",
    [1962086868] = "TowerOfMeow",
    [5977280685] = "CattoLegends",
    [537413528] = "BABFT",
    [4169490976] = "MortemMecattum",
    [914010731] = "CatGhoul",
    [286090429] = "Arsenal",
    [4849736274] = "SoulCat"
}

for gameId,CatWare in pairs(gamelist) do
    if gameId == game.PlaceId then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/CatzCode/cat/main/Games/'..CatWare..'.lua'))()
    end
end

spawn(function()
    local VirtualUser=game:GetService'VirtualUser'
    game:GetService'Players'.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)
