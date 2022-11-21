class Order
	attr_accessor :order_products

	def initialize
		@order_products = []
	end

	def add_product(product)
		@order_products.push(product)
	end

	def print_products_order
		@order_products.each { |product| puts product.format_product_description }
	end

	def print_total_order
		# Print the total order with tax and without it
		puts "Sales Taxes: #{total_order_tax}"
		puts "Total: #{total_order_without_tax}"
	end

	def total_order_without_tax
		total_order_without_tax_value = 0

		# Calcultate the total order without tax
		@order_products.each { |product| total_order_without_tax_value += product.calculate_product_total_value }
		total_order_without_tax_value.round(2)
	end

	def total_order_tax
		total_order_tax_value = 0

		# Calculate the total order tax
		@order_products.each { |product| total_order_tax_value += product.calculate_product_total_tax_value }
		total_order_tax_value.round(2)
	end

	def generate_receipt
		# Print the products order
		print_products_order

		# Print the total amount of the order
		print_total_order
	end
end
