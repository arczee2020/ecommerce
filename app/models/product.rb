class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def self.import(file)
    counter =0
    CSV.foreach(file.pathmap, headers: true) do |row|
      if counter == 200
        product = Product.new(title:row['product_name'],manufacturer: row['manufacturer'],price: row['price'],product_description: row['product_information'], description: row['description'],user: User.first)
        product.image.attach(io: File.open('./app/assets/images/'), filename: "#{rand(1..17)}.jpg")
        product.save
      end
      counter  = counter + 1
      # product = Product.new(title:row['product_name'],manufacturer: row['manufacturer'],price: row['price'],product_description: row['product_information'], description: row['description'],user: User.first)
      # product.image.attach(File.new(File.join(Rails.root,'app/assets/images/1.jpg')))
      # product.save
    end
  end

end
