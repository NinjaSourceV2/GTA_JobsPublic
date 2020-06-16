fx_version 'bodacious'
game 'gta5'

dependency 'nMenuPersonnel'

server_scripts {
    'server_main/server.lua',
    'mineur/mineur_server.lua'
} 

client_scripts { 
    'config/config.lua',
    'main.lua',
    'utils/utils.lua',
    'mineur/mineur_client.lua'
}