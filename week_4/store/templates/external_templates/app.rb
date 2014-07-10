require 'sinatra'

get "/" do
  @title = "Home"
  @message = "Hello World"
  erb :index
end


get "/links" do 
  @links = [
    {:text => "Google", :href => "http://google.com"},
    {:text => "Hacker News", :href => "http://news.ycombinator.com"},
    {:text => "This Week In Tech", :href => "http://twit.tv/show/this-weekin-tech"}
  ]
  erb :links
end 

