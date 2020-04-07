require './order.rb'

input_file = ARGV[0]
order = Order.new(input_file)
order.output