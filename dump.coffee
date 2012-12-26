file_system=require 'fs'
file=file_system.open('urls.txt','r')
client1=redis.createClient()
dump=(url,callback)->
	page=require('webpage').create()
	page.open url,(status)->
		if status is 'success'
			console.log page.content
		else
			console.log 'The status is'+status
		page.close()
		callback.apply()
urls=(url for url in file.read().split "/n")
process=()->
	if(urls.length > 0)
		url=urls[0]
		urls.splice(0,1)
		console.log url
		dump(url,process)
	else 
		phantom.exit()
process()

		

						
