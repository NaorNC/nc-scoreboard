AddEventHandler('playerSpawned', function()
	if not alreadySet then 
		TriggerServerEvent('Bad-ServerList:SetupImg')
		alreadySet = true;
	end 
end)
alreadySet = false;
nui = false;
pageSize = Config.PageSize;
pageCount = 1;
count = 0;
function mod(a, b)
    return a - (math.floor(a/b)*b)
end

jobCounts = {};
RegisterNetEvent('Bad-ServerList:JobCountUpdate')
AddEventHandler('Bad-ServerList:JobCountUpdate', function(jobCounts)
	jobCounts = jobCounts;
end)
function ternary ( cond , T , F )
    if cond then return T else return F end
end
curCount = 0;
Citizen.CreateThread(function()
	local key = Config.ScoreboardKey;
	nui = false;
	local col = true;
	while true do 
		Wait(1);
		if IsControlPressed(0, key) then 
			if not nui then 
				local left = "";
				local right = "";
				col = true;
				local maxCount = 0;
				for id, ava in pairs(avatarss) do
					maxCount = maxCount + 1;
				end
				local counter = 0;
				local keys = {}
				for key, ava in pairs(avatarss) do 
					table.insert(keys, tonumber(key));
				end
				table.sort(keys);
				for key = 1, #keys do
					local id = tostring(keys[key]);
					local ava = avatarss[id];
					if (count < (pageSize * pageCount) and counter >= curCount) then 
						if (pingss[id] ~= nil and playerNames[id] ~= nil and discordNames[id] ~= nil) then 
							if pingss[id] < 60 then 
								left = left .. '<tr class="player-box">' ..
								'<td><img class="img-fluid rounded-circle" src="' .. ava .. '" />' .. discordNames[id]:gsub("<", ""):gsub(">", "") .. '</td>' ..
								"<td>" .. playerNames[id]:gsub("<", ""):gsub(">", "") .. "</td>" .. 
								"<td>" .. id .. "</td>" ..
								"<td class='ping-good'>" .. pingss[id] .. "ms</td>" ..
								"</tr>";
							end 
							if pingss[id] >= 60 and pingss[id] < 90 then 
								left = left .. '<tr class="player-box">' ..
								'<td><img class="img-fluid rounded-circle" src="' .. ava .. '" />' .. discordNames[id]:gsub("<", ""):gsub(">", "") .. '</td>' ..
								"<td>" .. playerNames[id]:gsub("<", ""):gsub(">", "") .. "</td>" .. 
								"<td>" .. id .. "</td>" ..
								"<td class='ping-warn'>" .. pingss[id] .. "ms</td>" ..
								"</tr>";
							end
							if pingss[id] >= 90 then  
								left = left .. '<tr class="player-box">' ..
								'<td><img class="img-fluid rounded-circle" src="' .. ava .. '" />' .. discordNames[id]:gsub("<", ""):gsub(">", "") .. '</td>' ..
								"<td>" .. playerNames[id]:gsub("<", ""):gsub(">", "") .. "</td>" .. 
								"<td>" .. id .. "</td>" ..
								"<td class='ping-bad'>" .. pingss[id] .. "ms</td>" ..
								"</tr>";
							end
							count = count + 1;
						end
					end 
					counter = counter + 1;
				end
				SendNUIMessage({
					addRowLeft = left,
					playerCount = "Players: " .. maxCount .. " / " .. Config.ServerSlots,
					page = "Page: " .. pageCount,
					serverIcon = Config.ServerIcon,
					emsCount = ternary(jobCounts["ambulance"] ~= nil, jobCounts["ambulance"],  '0'),
					policeCount = ternary(jobCounts["police"] ~= nil, jobCounts["police"],  '0'),
					taxiCount = ternary(jobCounts["taxi"] ~= nil, jobCounts["taxi"],  '0'),
					mechanicCount = ternary(jobCounts["mechanic"] ~= nil, jobCounts["mechanic"],  '0'),
					cardealerCount = ternary(jobCounts["cardealer"] ~= nil, jobCounts["cardealer"], '0'),
					estateCount = ternary(jobCounts["realestateagent"] ~= nil, jobCounts["realestateagent"],  '0')
				})
				if (count >= maxCount) then 
					print("Count is=" .. count .. " and maxCount=" .. maxCount)
					count = 0;
					pageCount = 1;
					col = true;
					curCount = 0;
				end
				if (count >= (pageSize * pageCount)) then 
					pageCount = pageCount + 1;
					curCount = (pageSize * pageCount) - pageSize; -- Used to be -10
					col = true;
				end
				SendNUIMessage({
					display = true;
				})
				
				nui = true
		        while nui do
		            Wait(0)
		            if(IsControlPressed(0, key) == false) then
		                nui = false
		                SendNUIMessage({
		                    display = false;
		                })
		                break
		            end
	        	end
	        end 
		end
	end
end)
avatarss = {}
pingss = {}
playerNames = {}
discordNames = {}
RegisterNetEvent('Bad-ServerList:DiscordUpdate')
AddEventHandler('Bad-ServerList:DiscordUpdate', function(players)
	discordNames = {};
	for id, discordName in pairs(players) do 
		discordNames[id] = discordName;
	end
end)
RegisterNetEvent('Bad-ServerList:PlayerUpdate')
AddEventHandler('Bad-ServerList:PlayerUpdate', function(players)
	playerNames = {};
	for id, playerName in pairs(players) do 
		playerNames[id] = playerName;
	end
end)
RegisterNetEvent('Bad-ServerList:PingUpdate')
AddEventHandler('Bad-ServerList:PingUpdate', function(pingList)
	pingss = {};
	for id, ping in pairs(pingList) do 
		pingss[id] = ping;
	end
end)
RegisterNetEvent('Bad-ServerList:ClientUpdate')
AddEventHandler('Bad-ServerList:ClientUpdate', function(avas)
	avatarss = {};
	for id, ava in pairs(avas) do 
		avatarss[id] = ava;
	end
end)