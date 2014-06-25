class Product
  attr_accessor :name, :price    

  def initialize(attributes = {})
    @name = attributes[:name] || ""
    @price = attributes[:price] || 0
  end
end
