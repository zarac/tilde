var fs = require('fs')

fs.watch('/var/lib/teamspeak3-server/files/virtualserver_1/', function(e, f) {
  console.log('i see', e, f, this) } )
