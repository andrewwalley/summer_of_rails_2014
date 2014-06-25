require 'rack'
module FormBuilder
  def search_form
    content = %Q{
      <h2>Product search</h2>
      <form method="GET" action="/search">
        <label for="query">Search term</label>
        <input id="query" type="text" name="query">
        <input type="submit" value="Submit">
      </form>
    }
  end
end

class Product
attr_accessor :name, :price    

def initialize(attributes = {})
  @name = attributes[:name] || ""
  @price = attributes[:price] || 0
end
end

class ProductCatalog
  attr_reader :products

  def initialize
    @products = []
    @products << Product.new(name: "Widget", price: 25.00)
    @products << Product.new(name: "Dodad", price: 20.00)
    @products << Product.new(name: "Whatzit", price: 15.00)
    @products << Product.new(name: "Whatzit", price: 15.00)
  end

  def find_all_by_keyword(query)
    query = query.downcase
    self.products.select{|p|p.name.downcase.include?(query)}
  end
end

class SearchForm
  def self.call(env)
    content = %Q{
      <h2>Product search</h2>
      <form method="GET" action="/search">
        <label for="query">Search term</label>
        <input id="query" type="text" name="query">
        <input type="submit" value="Submit">
      </form>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class HandleResults
  include FormBuilder
  def call(env)
    content = search_form
    request = Rack::Request.new(env)
    query = request.GET["query"]
    catalog = ProductCatalog.new
    products = catalog.find_all_by_keyword(query) 
    products.each do |product|
      content << "<p>#{product.name}: #{product.price}</p>"
    end
    [200, {"Content-type" => "text/html"}, [content]]
  end
end
app = Rack::Builder.new do
  map "/" do
    run SearchForm
  end
  map "/search" do 
    run HandleResults.new
  end 
end

server = Rack::Server.new :app => app, :server => "webrick"
server.start
