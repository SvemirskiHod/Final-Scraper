require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'

file = File.read("./links.json")

data_hash = JSON.parse(file)

# puts data_hash[1]
imdb_api_root = "https://www.omdbapi.com/?i="

link = imdb_api_root + data_hash[0]



  page = HTTParty.get("https://www.omdbapi.com/?i=tt5530016")
  Pry.start(binding)
  # test1 = JSON.parse(page)

  # puts page


