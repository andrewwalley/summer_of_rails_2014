require 'sinatra'

get "/name/:name" do
  @name = params[:name]
  erb :index
end

get "/people" do
  @people = [
    {first_name: "Homer", last_name: "Simpson"},
    {first_name: "Marge", last_name: "Simpson"},
    {first_name: "Bart", last_name: "Simpson"}
  ]
  erb :people
end

__END__

@@people
<h1>People Page</h1>
<% @people.each do |person| %> 
  <table>
   <tr><%= person[:first_name] %> </tr>
   <tr><%= person[:last_name] %></tr>
  </table> 
<% end %>
