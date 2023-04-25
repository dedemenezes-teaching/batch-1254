require "open-uri" # TO do HTTP Requests
require "nokogiri" # To parse the HTML

# Let's scrape recipes from https://www.bbcgoodfood.com


html_file = URI.open('https://www.bbcgoodfood.com/search?q=chicken').read
html_doc = Nokogiri::HTML.parse(html_file)
html_doc.search('.card__content .heading-4').each do |element|
  p element.text
end
