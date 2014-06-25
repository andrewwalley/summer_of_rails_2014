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
