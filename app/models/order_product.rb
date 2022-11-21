class OrderProduct
	attr_reader :product, :quantity

	def initialize(product, quantity)
		@product = product
		@quantity = quantity
	end

	def format_product_description
    "#{@quantity} #{@product.description}: #{calculate_product_total_value.round(2)}"
	end

	def calculate_product_total_value
		@product.final_price * @quantity
	end

	def calculate_product_total_tax_value
		@product.tax_value * @quantity
  end
end
