local permanentUIDs = {}

-- Function to generate a unique permanent UID for a player
function GeneratePermanentUID(player)
    local identifiers = GetPlayerIdentifiers(player)

    if identifiers and #identifiers > 0 then
        -- Using the first identifier as the permanent UID
        local permanentUID = identifiers[1]
        permanentUIDs[player] = permanentUID
        return permanentUID
    else
        return nil
    end
end

-- Function to get a player's permanent UID
function GetPermanentUID(player)
    return permanentUIDs[player] or GeneratePermanentUID(player)
end

-- Event handler to initialize permanent UIDs for players
AddEventHandler("playerConnecting", function(name, setCallback)
    local player = source
    local permanentUID = GetPermanentUID(player)

    if permanentUID then
        print("Player " .. GetPlayerName(player) .. " has permanent UID: " .. permanentUID)
    else
        print("Player " .. GetPlayerName(player) .. " does not have a valid permanent UID.")
    end
end)
