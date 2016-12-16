require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'

exports = []

file = File.read("./keywords_links.json")
file2 = File.read("./summary.json")

movies_with_keywords = JSON.parse(file)
movies_with_summary = JSON.parse(file2)

# puts data_hash[1]
imdb_api_root = "https://www.omdbapi.com/?i="


count = 0
ids = movies_with_keywords.keys

begin

  movie_info = HTTParty.get(imdb_api_root + ids[count])
  movie_info["keywords"] = movies_with_keywords[ids[count]]
  movie_info["id"] = ids[count]
  if movies_with_summary.has_key?(ids[count])
    movie_info["summary_text"] = movies_with_summary[ids[count]]
  end
    exports << movie_info
  # Pry.start(binding)
  count += 1
  puts count
end while count < 300

# pp exports
open('api_movie_call.json', 'w') {|f|
  f << exports.to_json
}
# link = imdb_api_root + data_hash[0]
# link = imdb_api_root + data_hash[1]




  # page = HTTParty.get("https://www.omdbapi.com/?i=tt5530016")
  # Pry.start(binding)
  # test1 = JSON.parse(page)

  # puts page


