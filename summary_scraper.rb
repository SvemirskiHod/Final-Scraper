require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

all_pages_summary_text = {}
root_url = "http://www.imdb.com/title/"

file = File.read("./links.json")
movie_links = JSON.parse(file)
count = 1
movie_links.each do |link|

  full_link = root_url + link

  page = HTTParty.get(full_link)
  parse_page = Nokogiri::HTML(page)

  # Pry.start(binding)
  # summary_text = parse_page.css('.summary_text')[0]
  if parse_page.css('.summary_text')[0] != nil
    summary_text = parse_page.css('.summary_text')[0].children[0].text.strip
    if summary_text.length > 0
      all_pages_summary_text[link] = summary_text
      puts "Scraped page #{count}"
    end
  end

    puts "Looked at page #{count}"
    count += 1
end
  # puts all_pages_summary_text
  # link_wo = "http://www.imdb.com/title/tt0087304/?ref_=adv_li_tt"
  # link = "http://www.imdb.com/title/tt1746163/?ref_=adv_li_tt"
# link = "http://www.imdb.com/search/title?genres=history&title_type=feature&sort=moviemeter,asc&view=advanced&page=1&ref_=adv_prv"
# parse_page.css('.summary_text')[0].children[0].text.strip

 # begin
  # page = HTTParty.get(link)
  # parse_page = Nokogiri::HTML(page)
  # Pry.start(binding)
#   next_button = parse_page.css('a.lister-page-next.next-page')

#   parse_page.css('.lister-item-header').css('a').each do |film|
#     all_pages_summary_text << film.attributes["href"].value
#   end

#   if next_button[0]
#     button_link = next_button[0].attributes["href"].value
#     link = root_url + button_link
#   end
# end while next_button[0]

open('summary.json', 'w') {|f|
  f << all_pages_summary_text.to_json
}

# if no ratings, no keywords, no summary_text
