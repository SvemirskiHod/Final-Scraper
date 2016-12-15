require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

all_pages_link = []
  # link_wo = "http://www.imdb.com/title/tt0087304/?ref_=adv_li_tt"
  link = "http://www.imdb.com/title/tt1746163/?ref_=adv_li_tt"
# link = "http://www.imdb.com/search/title?genres=history&title_type=feature&sort=moviemeter,asc&view=advanced&page=1&ref_=adv_prv"
root_url = "http://www.imdb.com/search/title"
# parse_page.css('.summary_text')[0].children[0].text.strip

# begin
  page = HTTParty.get(link)
  parse_page = Nokogiri::HTML(page)
  # Pry.start(binding)
#   next_button = parse_page.css('a.lister-page-next.next-page')

#   parse_page.css('.lister-item-header').css('a').each do |film|
#     all_pages_link << film.attributes["href"].value
#   end

#   if next_button[0]
#     button_link = next_button[0].attributes["href"].value
#     link = root_url + button_link
#   end
# end while next_button[0]

# open('summary.json', 'w') {|f|
#   f << all_pages_link.to_json
# }

# if no ratings, no keywords, no summary_text
