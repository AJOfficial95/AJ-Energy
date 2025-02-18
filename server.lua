QBCore = exports['qb-core']:GetCoreObject()

-- Handle the application of buffs sent from the client
RegisterNetEvent('sneak:server:ApplyBuff', function(effectType, effectValue)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if effectType == "speed" then
        -- Example: Store speed boost for the player (you can add more logic here if needed)
        Player.Functions.SetMetaData("speed_boost", true)
        TriggerClientEvent('QBCore:Notify', src, "Speed boost applied!", "success")
    elseif effectType == "swim" then
        -- Apply swim boost (similar logic)
        Player.Functions.SetMetaData("swim_boost", true)
        TriggerClientEvent('QBCore:Notify', src, "Swim boost applied!", "success")
    elseif effectType == "high_speed" then
        -- Apply high-speed boost
        Player.Functions.SetMetaData("high_speed", true)
        TriggerClientEvent('QBCore:Notify', src, "High-speed boost applied!", "success")
    elseif effectType == "stress" then
        -- Reduce stress
        local stressRelief = effectValue or 0
        local currentStress = Player.Functions.GetMetaData("stress") or 0
        local newStress = math.max(0, currentStress - stressRelief)
        Player.Functions.SetMetaData("stress", newStress)
        TriggerClientEvent('QBCore:Notify', src, "Stress relieved!", "success")
    elseif effectType == "armor" then
        -- Example: Apply armor boost
        local currentArmor = Player.Functions.GetMetaData("armor") or 0
        Player.Functions.SetMetaData("armor", currentArmor + effectValue)
        TriggerClientEvent('QBCore:Notify', src, "Armor boosted!", "success")
    elseif effectType == "stamina" then
        -- Apply stamina boost (you can add stamina-specific logic here)
        TriggerClientEvent('QBCore:Notify', src, "Stamina boosted!", "success")
    elseif effectType == "health" then
        -- Apply health boost
        local currentHealth = Player.Functions.GetMetaData("health") or 100
        Player.Functions.SetMetaData("health", math.min(100, currentHealth + effectValue))
        TriggerClientEvent('QBCore:Notify', src, "Health boosted!", "success")
    elseif effectType == "regen" then
        -- Regeneration (could be stamina or health)
        TriggerClientEvent('QBCore:Notify', src, "Regeneration started!", "success")
    elseif effectType == "focus" then
        -- Apply focus boost (you can add effects like sharpness, fast reactions)
        TriggerClientEvent('QBCore:Notify', src, "Focus boost applied!", "success")
    end
end)

-- Handle thirst increase
RegisterNetEvent('sneak:server:IncreaseThirst', function(thirstAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Increase thirst
    local currentThirst = Player.Functions.GetMetaData("thirst") or 100
    Player.Functions.SetMetaData("thirst", math.min(100, currentThirst + thirstAmount))
end)
