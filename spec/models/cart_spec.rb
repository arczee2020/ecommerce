require 'rails_helper'

RSpec.describe Cart, type: :model do
    it "Add Product to Cart" do
      cart = Cart.new(product_id: "", user: "")
      cart.save
      expect(cart).to eq(false)
    end
end


RSpec.describe Cart, type: :model do
  it "Add Product to Cart" do
    cart = Cart.new(product_id: 1, user: "")
    cart.save
    expect(cart).to eq(false)
  end
end

RSpec.describe Cart, type: :model do
  it "Add Product to Cart" do
    cart = Cart.new(product_id: product.last, user: user.last)
    cart.save
    expect(cart).to eq(false)
  end
end