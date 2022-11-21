require_relative '../../app/models/order_product'

RSpec.describe OrderProduct do
  it "return an instance of an OrderProduct" do
    order_product = OrderProduct.new("book at 12.49", 1)
    expect(order_product).to be_a OrderProduct
  end
end
