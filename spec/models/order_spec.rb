require_relative '../../app/models/order'

RSpec.describe Order do
  it "return an instance of an Order" do
    order = Order.new()
    expect(order).to be_a Order
  end

  it "return an instance of an Order with one product" do
    order = Order.new()
    order.add_product("2 book at 12.49")
    expect(order.order_products).to eq ["2 book at 12.49"]
  end
end
