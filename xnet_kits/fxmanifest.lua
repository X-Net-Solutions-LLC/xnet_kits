fx_version 'cerulean'
game 'gta5'

author 'Xnet_Solutions'
description 'X-Net Vangelico Robbery'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'ox_lib'
}

lua54 'yes'

