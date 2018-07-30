require 'rubygems'
require 'nokogiri'
require 'open-uri'


url = "https://www.pecattestation.com"

doc = Nokogiri::HTML(open(url))


img_urls = doc.css('img').map{ |i| i['src'] }
img_captions = doc.css('image_alt').map{ |alt| alt }


header_tags = (1..6).map { |num| "h#{num}" }
headers = []

#head = doc.search('h3')
#head_and_description = head.map{ |head|
#  description = head.next_element.search('p')
#  [head.text, description.map(&:text)]
#}.to_h
#puts head_and_description.to_s.gsub('\n','')

#head = (1..6).map { |num| doc.search("h#{num}") }
#title = doc.css('title').text.gsub('|','')
#puts title



doc.css('h2').each do |h2|
  ct = h2.xpath('count(following-sibling::h2)')
  dds = h2.xpath("following-sibling::p[count(following-sibling::h2)=#{ct}]")
  puts [h2.text,dds.map(&:text)]
end


head = doc.css('h3')
head_and_description = head.map{ |head| description = head.next_element.css('p')
[head.text, description.map(&:text)]
}.to_h
puts head_and_description





#puts [head.text, contents.map(&:text)]



#details = doc.search('h3[text()="Attestation"] ~ *')
#puts doc.css('h3').text
#puts doc.css('.description').children.text

#doc.xpath('//h3/following-sibling::p').each do |node|
#puts node.text
#end

#puts doc.css('h3').map(&:text)
#puts header
#puts description
#puts img_captions
#puts img_urls

#details = doc.search('h2[text()="about PEC"] ~ *')
#head = doc.css('h2')[1].text.to_s
#puts head
#puts doc.xpath("//h2[text()='about PEC']/following-sibling::div")[0]
#end