-- Import the GetPermanentUID function from permanent_uid.lua
local GetPermanentUID = nil
Citizen.CreateThread(function()
    while GetPermanentUID == nil do
        TriggerEvent("GetPermanentUID", function(uidFunction)
            GetPermanentUID = uidFunction
        end)
        Citizen.Wait(0)
    end
end)

-- Example usage of GetPermanentUID
RegisterCommand("myuid", function(source, args)
    local player = source
    local permanentUID = GetPermanentUID(player)

    if permanentUID then
        TriggerClientEvent("chatMessage", source, "^2Your permanent UID is: " .. permanentUID)
    else
        TriggerClientEvent("chatMessage", source, "^1Error: Unable to retrieve your permanent UID.")
    end
end, false)