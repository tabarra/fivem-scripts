resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'tbr_onlinegroups - See how many osers online by group set.'
repository 'https://github.com/tabarra/fivem-scripts'
version '0.1'

dependency {
	'vrp',
	'pNotify'
}
server_scripts {
	'@vrp/lib/utils.lua',
	'config.lua',
	'server.lua'
}
client_scripts {
	'config.lua',
	'client.lua'
}
