resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

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