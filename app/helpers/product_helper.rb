require_relative '../models/product'
require_relative '../models/order_product'

def getOrderProductByInput(input)
	quantity = input[0, input.index(' ')]
	price = input[input.rindex(' ') + 1, input.length-1]
	productDescription = input[input.index(' ') + 1, input.rindex(' ') - 1]
	productDescription.slice! " at "

	product = Product.new(productDescription, price)
	orderProduct = OrderProduct.new(product, quantity.to_i)
end
