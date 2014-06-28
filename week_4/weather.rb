require 'sinatra'
require 'open-uri'
require 'json'


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
  weather = Weather.new(zipcode)
  if weather.fetch
    "The temperature in #{weather.city} is #{weather.temperature}."
  else
    "#{weather.error_message}"
  end 
end

  
