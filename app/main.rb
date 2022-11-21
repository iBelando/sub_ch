require_relative 'models/order'
require_relative 'helpers/product_helper'

puts "Welcome! Enter a product with the following format: '1 music CD at 14.99'"
puts "After entering all the products, type end"

order = Order.new
while true
	input = STDIN.gets.chomp
	if input == 'end' then break end

	order.add_product(getOrderProductByInput(input))
end

order.generate_receipt
