require "forecast_io"
ForecastIO.api_key = "cc56c1b4ade32f26d3afeae7d1ae7617"

lat = rand(-90.0..90.0)
log = rand(-180.0..180.0)
forecast = ForecastIO.forecast(lat,log).to_hash
@deck = [ ]
for days in forecast["daily"]["data"]
    @deck << "A high temperature of #{days["temperatureHigh"]} and #{days["summary"]} "
end
puts @deck