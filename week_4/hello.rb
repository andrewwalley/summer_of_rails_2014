require 'sinatra'

get "/" do 
  "Hello World"
end

get "/about" do 
  "<h1>This is the About Page</h1>"
end

get "/hello/:name" do 
  name = params[:name]
  "Hello. #{name}."
end
