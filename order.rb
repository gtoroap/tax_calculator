require './parse_items.rb'
require './tax_handler.rb'

class Order
  
  def initialize(input_file)
    @input_file = input_file
    @items = ParseItems.from_file(@input_file)
  end

  def output
    return unless @items

    tax_handler = TaxHandler.new(@items)
    taxed_items = tax_handler.classify
    sales_taxes = tax_handler.calculate
    total = tax_handler.totalize

    taxed_items.each do |item|
      puts "#{item.quantity} #{item.description}: #{item.quantity * item.price_plus_taxes}"
    end
    
    puts "Sales Taxes: #{sales_taxes.ceil(2)}"
    puts "Total: #{total.ceil(2)}"
  end
end