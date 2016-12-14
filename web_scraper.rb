require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

all_pages_link = []
initial_link = "http://www.imdb.com/search/title?genres=history&title_type=feature&sort=moviemeter,asc&view=advanced&page=1&ref_=adv_prv"
link = "http://www.imdb.com/search/title?genres=history&title_type=feature&sort=moviemeter,asc&view=advanced&page=107&ref_=adv_prv"

# next_button = parse_page.css('a.lister-page-next.next-page')

# next_button[0].attributes["href"].value

# root_url = "http://www.imdb.com/search/title"



# parse_page.css('.lister-item-header').css('a')[1].attributes["href"].value



def scrape_ids_from_link(link)
  page = HTTParty.get(link)
  parse_page = Nokogiri::HTML(page)

  page_links = []

  parse_page.css('.lister-item-header').css('a').each do |film|
    page_links << film.attributes["href"].value
  end
  return page_links
end

 all_pages_link += scrape_ids_from_link("http://www.imdb.com/search/title?genres=history&title_type=feature&sort=moviemeter,asc&view=advanced&page=1&ref_=adv_prv")
 # puts all_pages_link

def has_next?(link)
  page = HTTParty.get(link)
  parse_page = Nokogiri::HTML(page)
  next_button = parse_page.css('a.lister-page-next.next-page')
  Pry.start(binding)
  if next_button[0]
    true
  else
    false
  end
end

# Pry.start(binding)


# next_button[0].attributes["href"].value != nil
# do
#   invoke scrape_ids_from_link with initial with link

#   check for next_button
#     if true
#       get next button link
#       link  = next_button link
#     else
#       break
#     end


# while has_next == true





