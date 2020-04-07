class Item
  def initialize(quantity, imported, description, price)
    @quantity = quantity
    @description = description
    @imported = imported
    @price = price
    @tax = 0.0
    @taxes = 0.0
    @price_plus_taxes = 0.0
  end

  attr_accessor :quantity, :imported, :description, :price, :tax, :taxes, :price_plus_taxes
end