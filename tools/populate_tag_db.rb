require 'rexml/document'

def populate_tag_db
	f = File.open("actornames.xml","r")
	xml = f.read()
	doc = REXML::Document.new(xml)		
	doc.elements.each('AN/actorname') do |ele|
	name = ele.elements['name'].text	
	Tag.create(name:name)
	end
end

