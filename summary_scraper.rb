require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

all_pages_summary_text = {}
root_url = "http://www.imdb.com/title/"

file = File.read("./summary.json")
movie_links = JSON.parse(file)
# Pry.start(binding)
count = 1
movie_links.keys.each do |link|

  full_link = root_url + link

  page = HTTParty.get(full_link)
  parse_page = Nokogiri::HTML(page)

  summary_text = parse_page.css('.summary_text')[0]
  if parse_page.css('.summary_text')[0] != nil
    summary_text = parse_page.css('.summary_text')[0].children.text.strip
    if summary_text.length > 0
      all_pages_summary_text[link] = summary_text
      puts "Scraped page #{count}"
    end
  end

    puts "Looked at page #{count}"
    count += 1
end

  # Pry.start(binding)
open('summary3.json', 'w') {|f|
  f << all_pages_summary_text.to_json
}
