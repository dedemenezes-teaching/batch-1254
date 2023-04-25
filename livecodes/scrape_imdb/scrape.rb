# visiting the website by doing HTTP request
# parse the response using nokogiri
require 'open-uri'
require 'nokogiri'

def fetch_movie_urls
  url = 'https://www.imdb.com/chart/top'
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)
  html_doc.search('.titleColumn a').first(5).map do |element|
    element.attribute('href').value
  end
end

def scrape_movie(url)
  #=> url = '/title/tt0111161/'
  # visiting the website by doing HTTP request
  # parse the response using nokogiri
  base_url = 'https://www.imdb.com'
  html_file = URI.open("#{base_url}#{url}", "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36", "Accept-Language" => 'en-US').read
  html_doc = Nokogiri::HTML.parse(html_file)
  title = html_doc.search('h1').first.text
  storyline = html_doc.search('.sc-5f699a2-0.kcphyk').text
  cast = html_doc.search('.ipc-metadata-list__item:contains("Stars") a.ipc-metadata-list-item__list-content-item').map do |element|
    element.text
  end.uniq
  director = html_doc.search('.ipc-metadata-list__item:contains("Director") a').first.text
  year = html_doc.search('.ipc-inline-list.ipc-inline-list--show-dividers.sc-afe43def-4.kdXikI.baseAlt li:first-child').text.to_i
  {
    cast: cast,
    storyline: storyline,
    title: title,
    director: director,
    year: year
  }
end
