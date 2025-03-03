RegisterNetEvent("hud:getPlayerCount")
AddEventHandler("hud:getPlayerCount", function()
    local playerCount = #GetPlayers()
	
    local maxPlayers = 128 

    TriggerClientEvent("hud:updatePlayerCount", source, playerCount, maxPlayers)
end)