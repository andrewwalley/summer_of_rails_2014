class BrowseProducts
  def call(env) 
    content = ""
    catalog = ProductCatalog.new
    products = catalog.find_all_by_keyword("")
    products.each do |p|
      content << "<p>#{p.name}: #{p.price}</p>"
    end

  [200, {"Content-type" => "text/html"}, [content]]
  end
end
