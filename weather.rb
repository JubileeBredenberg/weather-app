require "yahoo_weatherman"

puts "What zip code would you like the weather for?"
user_location = gets

client = Weatherman::Client.new :unit => "F"
response = client.lookup_by_location(user_location)

today = Time.now.strftime('%w').to_i
condition = response.condition['text']
temperature = response.condition['temp']
city = response.location['city']
region = response.location['region']

puts "Right now it's #{condition.downcase} and #{temperature} degrees farenheit in #{city}, #{region}."
(0..4).each do |num|
weather = response.forecasts[num]

day = weather['day']
high = weather['high']
low = weather['low']
condition = weather['text']
if num == 0
day = "Tomorrow"
end

puts "#{day} will be #{condition.downcase} with a low of #{low} and a high of #{high} degrees Farenheit."
end