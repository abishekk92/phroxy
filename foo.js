var page = require('webpage').create();
var server = require('webserver').create();
var file_system=require('fs');
var lines=file_system.open('urls.txt','r').read().split('\n');
lines.forEach(function(line){
			console.log(line)});
console.log(page.myProp);
phantom.exit();
				
		


