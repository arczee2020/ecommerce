class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates :email, uniqueness: true
  has_many :carts
  has_many :products

end
