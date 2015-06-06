require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://fishbase.org/Country/CountryChecklist.php?what=list&trpp=50&c_code=840B&csub_code=&cpresence=Reported&sortby=alpha2&ext_pic=on&vhabitat=commercial" 
base_uri = "http://fishbase.org"

doc = Nokogiri::HTML(open(url))

species = doc.css('i > a').text
puts ""
doc.css(".t_value1").each do |speciesName|
	puts "<dict>"
	puts "<key>" + "SpeciesName" + "</key>"
	puts "<string>" + speciesName.at_css("i > a").text + "</string>"

	puts "<key>" + "CommonName" + "</key>"
	puts "<string>" + speciesName.at_css("td:nth-child(5)").text + "</string>"

	puts "<key>" + "ImageURL" + "</key>"
	puts "<string>" + base_uri + speciesName.at_css("a > img")[:src] + "</string>"
	puts "</dict>"
end
