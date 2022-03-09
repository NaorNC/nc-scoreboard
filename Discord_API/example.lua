RegisterCommand('testResource', function(source, args, rawCommand)
	local user = source; -- The user 

	local roleName = "Founder"; -- Change this to an existing role name on your Discord server 

	local roleID = GetRoleIdFromRoleName(roleName);
	print("[Discord_API Example] The roleID for (" .. roleName .. ") is: " .. tostring(roleID));

	local isVerified = IsDiscordEmailVerified(user);
	print("[Discord_API Example] Player " .. GetPlayerName(user) .. " has Discord email verified?: " .. tostring(isVerified));

	local emailAddr = GetDiscordEmail(user);
	print("[Discord_API Example] Player " .. GetPlayerName(user) .. " has Discord email address: " .. tostring(emailAddr));

	local name = GetDiscordName(user);
	print("[Discord_API Example] Player " .. GetPlayerName(user) .. " has Discord name: " .. tostring(name));

	local icon_URL = GetGuildIcon();
	print("[Discord_API Example] Guild icon URL is: " .. tostring(icon_URL));

	local splash_URL = GetGuildSplash();
	print("[Discord_API Example] Guild splash URL is: " .. tostring(splash_URL));

	local guildName = GetGuildName();
	print("[Discord_API Example] Guild name is: " .. tostring(guildName));

	local guildDesc = GetGuildDescription();
	print("[Discord_API Example] Guild description is: " .. tostring(guildDesc));

	local guildMemCount = GetGuildMemberCount();
	print("[Discord_API Example] Guild member count is: " .. tostring(guildMemCount));

	local onlineMemCount = GetGuildOnlineMemberCount();
	print("[Discord_API Example] Guild online member count is: " .. tostring(onlineMemCount));

	local avatar = GetDiscordAvatar(user);
	print("[Discord_API Example] Player " .. GetPlayerName(user) .. " has Discord avatar: " .. tostring(avatar));

	local nickname = GetDiscordNickname(user);
	print("[Discord_API Example] Player " .. GetPlayerName(user) .. " has Discord nickname: " .. tostring(nickname));

	local roles = GetGuildRoleList();
	for roleName, roleID in pairs(roles) do 
		print(roleName .. " === " .. roleID);
	end

	local roles = GetDiscordRoles(user)
	for i = 1, #roles do  
		print(roles[i]);
	end

	local isRolesEqual = CheckEqual("Founder", 597446100206616596);
	local isRolesEqual2 = CheckEqual("FounderRef", "Founder"); -- Refer to config.lua file, this is basically checking if FounderRef in the config is 
end)
