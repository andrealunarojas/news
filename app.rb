require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "cc56c1b4ade32f26d3afeae7d1ae7617"

get "/" do
    view "ask"
end
get "/news" do
    results = Geocoder.search(params["q"])
    lat_long = results.first.coordinates
    lat= lat_long[0]
    long= lat_long[1]
    @forecast = ForecastIO.forecast(lat,long).to_hash
    @current_temp = @forecast ["currently"]["temperature"]
    @current_cond = @forecast ["currently"]["summary"]
    url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=5c6ab66caccc42be8fdca6414e89b85b"
@newspaper = HTTParty.get(url).parsed_response.to_hash
    @deck = [ ]
    @decknews = [ ]
for days in @forecast["daily"]["data"]
    @deck << "A high temperature of #{days["temperatureHigh"]} and #{days["summary"]}"
end

for news in @newspaper ["articles"]
    @decknews << [news["title"],news["url"]]
end
view "ask"
end