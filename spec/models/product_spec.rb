require 'rails_helper'

RSpec.describe Product, type: :model do
  it "Adding Product" do
    product = Product.new(title: "abc",price: "abc@gmail.com", description: "123", product_description: 123)
    product.image.attach(io: File.open("./app/assets/images/1.jpg"), filename: "1.jpg")
    product.save
    expect(product).to eq(false)
  end
end


RSpec.describe Product, type: :model do
  it "Adding Product" do
    product = Product.new(title: "",price: "", description: "", product_description: "")
    product.image.attach(io: File.open("./app/assets/images/1.jpg"), filename: "1.jpg")
    product.save
    expect(product).to eq(false)
  end
end

RSpec.describe Product, type: :model do
  it "Adding Product" do
    product = Product.new(title: "abc",price: 123, description: "123", product_description: "asdas")
    product.image.attach(io: File.open("./app/assets/images/1.jpg"), filename: "1.jpg")
    product.save
    expect(product).to eq(false)
  end
end
