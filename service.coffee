http = require 'http'
url_parser= require 'url'
port_number= 1337
count=0
options=
    hostname: "127.0.0.1"
    port:	7379
    path:  "/GET/foo"
http.createServer (request,response)->
	params=url_parser.parse request.url
	query=params['query']
	if /count=/.test query
		response.writeHead 200,{'Content-Type':'application/json'}
		http.request options,(resp)->
			data=""
			resp.on "data",(chunk)->
				data+=chunk
			resp.on "end",->
				response.end data
		.end()
.listen(port_number,'127.0.0.1')
console.log "Server started at #{port_number}"
