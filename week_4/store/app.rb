require 'sinatra/base'
require 'sqlite3'

class MyStore < Sinatra::Base
  CONNECTION = SQLite3::Database.new("store.sqlite3")

  CONNECTION.execute <<-SQL
    CREATE TABLE IF NOT EXISTS "items" (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "name" VARCHAR,
      "price" DOUBLE DEFAULT 0
    )
  SQL

  post "/items" do
    name = params[:name]
    price = params[:price]
    CONNECTION.execute("INSERT INTO items (name, price) VALUES (?,?)", [name, price])
    redirect "/items"
  end

  get "/items" do 
    @results = CONNECTION.execute("select name,price from items ORDER BY id DESC LIMIT 20")
    erb :items
  end

  get "/items/:id" do
    id = params[:id]
    @results = CONNECTION.execute("select name,price from items where id = (?)", [id])
    erb :items_id
  end
end
