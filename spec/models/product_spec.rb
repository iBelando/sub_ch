require_relative '../../app/models/product'

RSpec.describe Product do
  it "return an instance of a Product" do
    product = Product.new('book', '12.49')
    expect(product).to be_a Product
  end

  it "return the final_price without taxes" do
    product = Product.new('book', '12.49')
    expect(product.final_price).to eq 12.49
  end

  it "when the product is imported return the final_price with taxes" do
    product = Product.new('imported bottle of perfume', '47.50')
    expect(product.final_price).to eq 54.65
  end
end

