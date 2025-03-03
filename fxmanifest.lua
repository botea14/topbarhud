fx_version 'cerulean'
game 'gta5'

author 'DriftX'
description 'TopBar HUD – Clean & Minimalistic Server UI'
version '1.0.0'

lua54 'yes'

server_scripts {
    'server/main.lua',
}

client_scripts {
    'client/main.lua',
}

ui_page 'html/hud.html'

files {
	'html/logo.png',
    'html/hud.html',
    'html/hud.css',
    'html/hud.js'
}

escrow_ignore {
  "*.lua",
  "**/*.lua"
}