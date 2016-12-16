# require ("./summary2.json")
require 'json'
file = File.read("./api_movie_call.json")
test1 = JSON.parse(file)
# test2 = {}
puts test1.length
# test1.each do |x|
#   puts x["Title"]
# end
# puts file[0]
# movie_ids = test1.keys

# count = 0

# begin
# test2[movie_ids[count]] = test1[movie_ids[count]]
# # puts test1[movie_ids[count]]

# if count == 1
#   break
# end

# count += 1
# end while count < 5

# open('test.json', 'w') {|f|
#   f << test2.to_json
# }
