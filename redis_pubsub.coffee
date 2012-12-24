redis = require 'redis'
client1=redis.createClient()
client2=redis.createClient()
message_count=0
client1.on "subscribe",(channel,count)->
	client2.publish "foo","Imma sending a message"
	client2.publish "foo","Yo,second message"
	client2.publish "foo","Sending all over again"
client1.on "message",(channel,message)->
	console.log "Client1-#{channel}:#{message}"
	message_count+=1
	if message_count is 5
		client1.unsubscribe()
		client1.end()
		client2.end()
client1.subscribe "foo"
