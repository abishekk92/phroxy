http = require 'http'
url_parser= require 'url'
redis = require 'redis'
port_number= 1337
count=0
options=
    hostname: "127.0.0.1"
    port:	7379
    path:  "/lrange/mylist/0/4"
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
redis_client=redis.createClient()
console.log "Server started at #{port_number}"
