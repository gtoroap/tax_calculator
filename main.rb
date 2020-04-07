require './order.rb'

input_file = ARGV[0]
order = Order.new(input_file)

if order.has_items?
  puts order.output
else
  puts 'There was an error trying to open the file. Check an try again.'
end