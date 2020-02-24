require "httparty"
 
url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=5c6ab66caccc42be8fdca6414e89b85b"
news = HTTParty.get(url).parsed_response.to_hash
deck = [ ]
for daily in news["articles"]
    deck << [daily["title"],daily["url"]]
end
puts deck [1][0]
