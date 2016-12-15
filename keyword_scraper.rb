require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

exports = {}

root_url = "http://www.imdb.com/title/"

file = File.read("./links.json")
movie_links = JSON.parse(file)
# count = 1

movie_links.each do |link|

  full_link = root_url + link

  page = HTTParty.get(full_link)
  parse_page = Nokogiri::HTML(page)


  keyword_extension = parse_page.css("#titleStoryLine").css(".see-more").css("nobr")[0].children[0].attributes["href"].value
  keyword_link = "http://www.imdb.com" + keyword_extension

  keyword_page = HTTParty.get(keyword_link)
  keyword_parse_page = Nokogiri::HTML(keyword_page)


  keywords_on_page = keyword_parse_page.css(".sodatext")

  keywords = []

  keywords_on_page.each do |keyword|
    keywords <<  keyword.css("a").children.text
  end

  exports[link] = keywords

end

open('keywords_links.json', 'w') {|f|
  f << exports.to_json
}
