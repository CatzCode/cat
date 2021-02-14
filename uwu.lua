local gamelist = {
    [2041312716] = "fixedRagdoll",
    [1962086868] = "towerofmeow",
    [5977280685] = "cattolegends",
    [537413528] = "buildcatnipforcatto",
    [4169490976] = "mortemthecat"
}

for gameId,CatWare in pairs(gamelist) do
    if gameId == game.PlaceId then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/CatzCode/cat/main/'..CatWare..'.lua'))()
    end
end

spawn(function()
    local VirtualUser=game:GetService'VirtualUser'
    game:GetService'Players'.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)
