require './parse_items.rb'

class Order
  
  def initialize(input_file)
    @input_file = input_file
    @items = ParseItems.from_file(@input_file)
  end

  def output
    require 'byebug'; byebug
    puts @items.count
  end
end