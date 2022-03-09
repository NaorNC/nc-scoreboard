QBCore = nil;
Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:getObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

avatars = {}
discordNames = {}
RegisterNetEvent('Bad-ServerList:SetupImg')
AddEventHandler('Bad-ServerList:SetupImg', function()
    -- Add their avatar 
    local src = source;
    local license = ExtractIdentifiers(src).license;
    -- Only run this code if they have not been set up already 
    if avatars[license] == nil then 
        local ava = GetAvatar(src);
        local discordName = GetDiscordName(src);
        if (ava ~= nil) then 
            avatars[license] = ava;
        else 
            avatars[license] = Config.Default_Profile;
        end
        if (discordName ~= nil) then 
            discordNames[license] = discordName;
        else 
            discordNames[license] = Config.Discord_Not_Found;
        end
    end
end)
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        -- It's this resource 
        for _, id in pairs(GetPlayers()) do
            Wait(3000); 
            TriggerEvent('Bad-ServerList:SetupRestart', id);
        end
    end
end)
RegisterNetEvent('Bad-ServerList:SetupRestart')
AddEventHandler('Bad-ServerList:SetupRestart', function(src)
    -- Add their avatar 
    local ava = GetAvatar(src);
    local discordName = GetDiscordName(src);
    local license = ExtractIdentifiers(src).license;
    if (ava ~= nil) then 
        avatars[license] = ava;
    else 
        avatars[license] = Config.Default_Profile;;
    end
    if (discordName ~= nil) then 
        discordNames[license] = discordName;
    else 
        discordNames[license] = Config.Discord_Not_Found;
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait((1000 * 5)); -- Every 5 seconds, update 
        local avatarIDs = {};
        local pings = {};
        local players = {};
        local discords = {};
        local jobCounts = {};
        for _, id in ipairs(GetPlayers()) do 
            local license = ExtractIdentifiers(id).license;
            local ping = GetPlayerPing(id); 
            players[id] = GetPlayerName(id);
            if (QBCore ~= nil) then 
                local xPlayer = QBCore.Functions.GetPlayer(src)
                if (xPlayer ~= nil) then 
                    if (jobCounts[xPlayer.job.name] ~= nil) then 
                        local currCount = jobCounts[xPlayer.job.name];
                        jobCounts[xPlayer.job.name] = currCount + 1;
                    else 
                        jobCounts[xPlayer.job.name] = 1;
                    end
                end
            end
            pings[id] = ping;
            if (avatars[license] ~= nil) then 
                avatarIDs[id] = avatars[license];
            else 
                avatarIDs[id] = Config.Default_Profile;
            end
            if (discordNames[license] ~= nil) then 
                discords[id] = discordNames[license]
            else 
                discords[id] = Config.Discord_Not_Found;
            end
        end
        TriggerClientEvent('Bad-ServerList:PlayerUpdate', -1, players)
        TriggerClientEvent('Bad-ServerList:PingUpdate', -1, pings)
        TriggerClientEvent('Bad-ServerList:ClientUpdate', -1, avatarIDs)
        TriggerClientEvent('Bad-ServerList:DiscordUpdate', -1, discords)
        TriggerClientEvent('Bad-ServerList:JobCountUpdate', -1, jobCounts);
    end
end)


function GetAvatar(user) 
    return exports.Discord_API:GetDiscordAvatar(user);
end
function GetDiscordName(user) 
    return exports.Discord_API:GetDiscordName(user);
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    --Loop over all identifiers
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        --Convert it to a nice table.
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end