local displayHud = true

local function getFPS()
    return math.floor(1 / GetFrameTime())
end

RegisterNetEvent("hud:updatePlayerCount")
AddEventHandler("hud:updatePlayerCount", function(playerCount, maxPlayers)
    SendNUIMessage({
        action = "updatePlayerCount",
        playersOnline = playerCount,
        maxPlayers = maxPlayers
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        if displayHud then
            local playerId = PlayerId()
            local playerName = GetPlayerName(playerId)
            local fps = getFPS()

            TriggerServerEvent("hud:getPlayerCount")

            local hour, minute = GetClockHours(), GetClockMinutes()
            local formattedTime = string.format("%02d:%02d", hour, minute)
			
            SendNUIMessage({
                action = "updateHUD",
                playerName = playerName,
                fps = fps,
                gameTime = formattedTime,
            })
        end
    end
end)

RegisterCommand("togglehud", function()
    displayHud = not displayHud
    SendNUIMessage({ action = "toggleHUD", show = displayHud })
end, false)