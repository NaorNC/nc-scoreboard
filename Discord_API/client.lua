triggered = false;
AddEventHandler("playerSpawned", function()
    if not triggered then 
        triggered = true;
        Citizen.Wait((1000 * 20));
        TriggerServerEvent('Discord_API:PlayerLoaded');
    end
end)