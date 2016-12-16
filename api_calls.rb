require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'

file = File.read("./links.json")

data_hash = JSON.parse(file)

# puts data_hash[1]
imdb_api_root = "https://www.omdbapi.com/?i="

open('ryo_test.json', 'w') {|f|
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[10]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[11]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[2]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[3]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[4]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[5]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[6]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[7]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[8]}").to_json
  f << HTTParty.get("https://www.omdbapi.com/?i=#{data_hash[9]}").to_json

}

# link = imdb_api_root + data_hash[0]
# link = imdb_api_root + data_hash[1]




  # page = HTTParty.get("https://www.omdbapi.com/?i=tt5530016")
  # Pry.start(binding)
  # test1 = JSON.parse(page)

  # puts page


