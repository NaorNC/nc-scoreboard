fx_version 'cerulean'
game 'gta5'

description 'Discord_API'

client_scripts {
	'client.lua',
}

server_scripts {
	'config.lua',
	"server.lua"
}

server_exports { 
	"GetDiscordRoles",
	"GetRoleIdfromRoleName",
	"GetDiscordAvatar",
	"GetDiscordName",
	"GetDiscordEmail",
	"IsDiscordEmailVerified",
	"GetDiscordNickname",
	"GetGuildIcon",
	"GetGuildSplash",
	"GetGuildName",
	"GetGuildDescription",
	"GetGuildMemberCount",
	"GetGuildOnlineMemberCount",
	"GetGuildRoleList",
	"ResetCaches",
	"CheckEqual"
} 
