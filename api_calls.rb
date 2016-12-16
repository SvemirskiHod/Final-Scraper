require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'

file = File.read("./links.json")

data_hash = JSON.parse(file)

# puts data_hash[1]
imdb_api_root = "https://www.omdbapi.com/?i="

open('ryo_test.json', 'w') {|f|
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[0]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[1]}").to_json
}

# link = imdb_api_root + data_hash[0]
# link = imdb_api_root + data_hash[1]




  # page = HTTParty.get("https://www.omdbapi.com/?i=tt5530016")
  # Pry.start(binding)
  # test1 = JSON.parse(page)

  # puts page


