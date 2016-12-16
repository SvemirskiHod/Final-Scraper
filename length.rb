require 'json'
file = File.read("./summary2 .json")
test1 = JSON.parse(file)
puts test1.length