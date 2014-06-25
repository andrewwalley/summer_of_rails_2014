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
