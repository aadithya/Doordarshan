require 'rexml/document'

def populate_db
	f = File.open("guide.xml","r")
	xml = f.read()
	doc = REXML::Document.new(xml)
 	#doc.elements.each('tv/channel') do |ele|
	#Channel.create(name:ele.attributes['id'])
	#end			
	doc.elements.each('tv/programme') do |ele|
	title = ele.elements['title'].text	
	date = 	ele.elements['date'].text
	category = ele.elements['category'].text
	channel = ele.attributes['channel']		
	start = ele.attributes['start']
	stop = ele.attributes['stop']
	Program.create(title:title,date:date,category:category,channel:channel,start:start,stop:stop)
	end
end

