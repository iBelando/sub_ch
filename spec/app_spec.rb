require_relative '../app/models/order'
require_relative '../app/models/order_product'
require_relative '../app/models/product'

RSpec.describe Order do
  it "case 1 provided by the assessment" do
    order = Order.new
    # Added the product "2 book at 12.49"
		order.add_product(OrderProduct.new(Product.new('book', '12.49'), 2))
    # Added the product "1 music CD at 14.99"
    order.add_product(OrderProduct.new(Product.new('music CD', '14.99'), 1))
    # Added the product "1 chocolate bar at 0.85"
    order.add_product(OrderProduct.new(Product.new('chocolate bar', '0.85'), 1))

    expect(order.total_order_tax).to eq 1.50
    expect(order.total_order_without_tax).to eq 42.32
  end

  it "case 2 provided by the assessment" do
    order = Order.new
    # Added the product "1 imported box of chocolates at 10.00"
		order.add_product(OrderProduct.new(Product.new('imported box of chocolates', '10.00'), 1))
    # Added the product "1 imported bottle of perfume at 47.50"
    order.add_product(OrderProduct.new(Product.new('imported bottle of perfume', '47.50'), 1))

    expect(order.total_order_tax).to eq 7.65
    expect(order.total_order_without_tax).to eq 65.15
  end

  it "case 3 provided by the assessment" do
    order = Order.new
    # Added the product "1 imported bottle of perfume at 27.99"
		order.add_product(OrderProduct.new(Product.new('imported bottle of perfume', '27.99'), 1))
    # Added the product "1 bottle of perfume at 18.99"
    order.add_product(OrderProduct.new(Product.new('bottle of perfume', '18.99'), 1))
    # Added the product "1 packet of headache pills at 9.75"
    order.add_product(OrderProduct.new(Product.new('packet of headache pills', '9.75'), 1))
    # Added the product "3 imported boxes of chocolates at 11.25"
    order.add_product(OrderProduct.new(Product.new('imported boxes of chocolates', '11.25'), 3))

    expect(order.total_order_tax).to eq 7.90
    expect(order.total_order_without_tax).to eq 98.38
  end
end
