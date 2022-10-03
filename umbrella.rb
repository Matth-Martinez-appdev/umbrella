require "json"
require "open-uri"

puts "========================================"
puts "Will you need an umbrella?"
puts "========================================"



p "Where are you "

# user_location = gets.chomp

user_location = "Charlotte"

p user_location




gmaps_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

raw_gmaps_data = URI.open(gmaps_api_url).read

parsed_gmaps_data = JSON.parse(raw_gmaps_data)

  results_array = parsed_gmaps_data.fetch("results")

  first_result = results_array.at(0)

 lattitude = first_result.fetch("geometry").fetch("location").fetch("lat")
                                                                            #variables to get lattitude and longitude
 longitude = first_result.fetch("geometry").fetch("location").fetch("lng")




 dskys_api_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{lattitude},#{longitude}"

raw_dskys_data = URI.open(dskys_api_url).read

parsed_dskys_data = JSON.parse(raw_dskys_data)

current_temp = parsed_dskys_data.fetch("currently").fetch("apparentTemperature").to_i  #variable to get current temperature of location

raw_temp_data = parsed_dskys_data.fetch("hourly").fetch("data")

next_hour_summary = parsed_dskys_data.fetch("minutely").fetch("summary")

12.times do |x|
temp_data = raw_temp_data.at(x)

rain_propability = temp_data.fetch("precipProbability") #variable to get precipitation for next 12 hours

end




p "Checking the weather at #{user_location}...."
p "Your coordinates are #{lattitude}, #{longitude}."
p "It is currently #{current_temp}F and will be #{next_hour_summary}"
