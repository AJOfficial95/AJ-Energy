QBCore = exports['qb-core']:GetCoreObject()
Config = Config or {}

-- Update: The new config data for consumables
ConsumeablesSneak = {
    ["sneak_energy_stealth"] = { thirst = math.random(15, 25), effect = "speed", duration = 5000, multiplier = 1.2 },
    ["sneak_energy_blueraz"] = { thirst = math.random(15, 25), effect = "stress", value = {5, 10} },
    ["sneak_energy_strawbw"] = { thirst = math.random(15, 25), effect = "swim", duration = 5000, multiplier = 1.2 },
    ["sneak_energy_strawbmil"] = { thirst = math.random(15, 25), effect = "armor", amount = 10 },
    ["sneak_energy_bubblemil"] = { thirst = math.random(15, 25), effect = "stamina", duration = 7000 },
    ["sneak_energy_purplestorm"] = { thirst = math.random(15, 25), effect = "high_speed", duration = 7000, multiplier = 1.3 },
    ["sneak_energy_tropikilla"] = { thirst = math.random(15, 25), effect = "stress", value = {10, 15} },
    ["sneak_energy_cherrybomb"] = { thirst = math.random(15, 25), effect = "health", amount = 10 },
    ["sneak_energy_sapple"] = { thirst = math.random(15, 25), effect = "stamina", duration = 10000 },
    ["sneak_energy_neonpunch"] = { thirst = math.random(15, 25), effect = "focus", duration = 10000 },
    ["sneak_energy_grapecrush"] = { thirst = math.random(15, 25), effect = "regen", duration = 8000 },
}

local function ApplyBuffs(itemName)
    local effectData = ConsumeablesSneak[itemName]
    if effectData then
        if effectData.effect == "speed" then
            SetRunSprintMultiplierForPlayer(PlayerId(), effectData.multiplier)
            TriggerServerEvent("sneak:server:ApplyBuff", "speed", effectData.duration)
        elseif effectData.effect == "swim" then
            SetSwimMultiplierForPlayer(PlayerId(), effectData.multiplier)
            TriggerServerEvent("sneak:server:ApplyBuff", "swim", effectData.duration)
        elseif effectData.effect == "high_speed" then
            SetRunSprintMultiplierForPlayer(PlayerId(), effectData.multiplier)
            TriggerServerEvent("sneak:server:ApplyBuff", "high_speed", effectData.duration)
        elseif effectData.effect == "stress" then
            TriggerServerEvent('hud:server:RelieveStress', math.random(effectData.value[1], effectData.value[2]))
        elseif effectData.effect == "armor" then
            -- Assuming armor is applied here
            TriggerServerEvent("sneak:server:ApplyBuff", "armor", effectData.amount)
        elseif effectData.effect == "stamina" then
            -- Handle stamina boost (e.g., restore stamina, increase regeneration)
            TriggerServerEvent("sneak:server:ApplyBuff", "stamina", effectData.duration)
        elseif effectData.effect == "health" then
            -- Assuming health boost here
            TriggerServerEvent("sneak:server:ApplyBuff", "health", effectData.amount)
        elseif effectData.effect == "regen" then
            -- Apply regeneration effect
            TriggerServerEvent("sneak:server:ApplyBuff", "regen", effectData.duration)
        elseif effectData.effect == "focus" then
            -- Apply focus effect (e.g., sharpness, faster reaction time)
            TriggerServerEvent("sneak:server:ApplyBuff", "focus", effectData.duration)
        end
    end
end

RegisterNetEvent('consumables:client:DrinkSneak', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(PlayerPedId())
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ApplyBuffs(itemName)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesSneak[itemName].thirst)
    end)
end)
