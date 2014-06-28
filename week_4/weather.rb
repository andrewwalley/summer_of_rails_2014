require 'open-uri'
require 'json'
require 'sinatra'

class Weather 
  attr_reader :city, :temperature, :error_message

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def fetch
    @error_message = nil
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{@zipcode}&units=imperial"
    begin 
      raw_data = open(url).read
      weather_data = JSON.parse(raw_data)
      @temperature = weather_data["main"]["temp"]
      @city = weather_data["name"]
    rescue
      @error_message = "I don't seem to be able to grab the weather for you."
    end

    @error_message == nil
  end
end

get "/weather/:zipcode" do 
  zipcode = params[:zipcode]
  "The zipcode is #{zipcode}"
end

  
  weather = Weather.new(zipcode)
  if weather.fetch
    puts weather.temperature
    puts weather.city
  else
    puts weather.error_message
  end
