class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def self.import(file)
    CSV.foreach(file.pathmap, headers: true) do |row|
      Product.create!(title:row['product_name'],manufacturer: row['manufacturer'],price: row['price'],product_description: row['product_information'], description: row['description'],user: User.first)
    end
  end

end
