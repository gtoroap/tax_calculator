require './parse_items.rb'
require './tax_handler.rb'

class Order
  
  def initialize(input_file)
    @input_file = input_file
    @items = ParseItems.from_file(@input_file)
  end

  def has_items?
    @items
  end

  def output
    return unless has_items?

    lines = []
    tax_handler = TaxHandler.new(@items)
    taxed_items = tax_handler.classify
    sales_taxes = tax_handler.calculate
    total = tax_handler.totalize

    taxed_items.each do |item|
      lines << "#{item.quantity} #{item.description}: #{item.quantity * item.price_plus_taxes}"
    end
    
    lines << "Sales Taxes: #{sales_taxes}"
    lines << "Total: #{total}"
    lines
  end
end