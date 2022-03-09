fx_version 'cerulean'
game 'gta5'

description 'nc-scoreboard'
version '1.0.0'

client_script "config.lua"
server_script "config.lua"
client_script 'client.lua'
server_script "server.lua"

ui_page "NUI/panel.html"

files {
	"NUI/panel.js",
	"NUI/panel.html",
	"NUI/panel.css",
}
