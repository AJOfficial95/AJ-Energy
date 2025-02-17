QBCore.Functions.CreateUseableItem("sneak_energy_stealth", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkSneak", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sneak_energy_blueraz", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkSneak", src, item.name)
    end
end)

-- Repeat this pattern for the rest of the consumables

