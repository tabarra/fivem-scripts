resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'tbr_toptext - Display text/images in the top of the screen'
repository 'https://github.com/tabarra/fivem-scripts'
version '0.1'

ui_page('public/index.html')
client_scripts {
    'client.lua',
}
files({
    'public/css/bootstrap.min.css',
    'public/js/bootstrap.min.js',
    'public/css/style.css',
    'public/img/demo.png',
    'public/index.html',
    'public/js/config.js',
    'public/js/main.js'
})
