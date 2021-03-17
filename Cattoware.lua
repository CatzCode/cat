--[[
  /$$$$$$              /$$      /$$$$$$                  /$$           /$$      /$$                              
 /$$__  $$            | $$     /$$__  $$                | $$          | $$  /$ | $$                              
| $$  \__/  /$$$$$$  /$$$$$$  | $$  \__/  /$$$$$$   /$$$$$$$  /$$$$$$ | $$ /$$$| $$  /$$$$$$   /$$$$$$   /$$$$$$ 
| $$       |____  $$|_  $$_/  | $$       /$$__  $$ /$$__  $$ /$$__  $$| $$/$$ $$ $$ |____  $$ /$$__  $$ /$$__  $$
| $$        /$$$$$$$  | $$    | $$      | $$  \ $$| $$  | $$| $$$$$$$$| $$$$_  $$$$  /$$$$$$$| $$  \__/| $$$$$$$$
| $$    $$ /$$__  $$  | $$ /$$| $$    $$| $$  | $$| $$  | $$| $$_____/| $$$/ \  $$$ /$$__  $$| $$      | $$_____/
|  $$$$$$/|  $$$$$$$  |  $$$$/|  $$$$$$/|  $$$$$$/|  $$$$$$$|  $$$$$$$| $$/   \  $$|  $$$$$$$| $$      |  $$$$$$$
 \______/  \_______/   \___/   \______/  \______/  \_______/ \_______/|__/     \__/ \_______/|__/       \_______/

For the Top Cats.

Developed by falseopx#2012 and Vault#0001. (keshiki#1749 and Compwnter#5640)
--]]

local gamelist = {
    [2041312716] = "RagdollEngine",
    [1962086868] = "TOH",
    [5977280685] = "NinjaLegends",
    [537413528] = "BABFT",
    [4169490976] = "MortemMetallum",
    [914010731] = "RoGhoul",
    [286090429] = "Arsenal",
    [4849736274] = "SoulCombat",
    [1401417393] = "RagdollSystemTest",
    [71315343] = "DBR",
    [662417684] = "LuckyBlockBattlegrounds",
    [855499080] = "Skywars",
    [3527629287] = "BigPaintball",
    [566399244] = "ElementalBattlegrounds",
    [537600204] = "ElementalBattlegrounds",
    [570158081] = "ElementalBattlegrounds",
    [2569625809] = "ElementalBattlegrounds",
    [3840352284] = "VolleyBall",
    [301549746] = "CounterBlox",
    [3254838662] = "Blacklands",
    [621129760] = "KAT",
    [12109643] = "Fencing"
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
