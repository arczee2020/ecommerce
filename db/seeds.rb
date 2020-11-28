# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Admin has been created"
User.create(
    name: 'Admin',
    email: 'admin@ecommerce.com',
    password: 'password',
    role: 'admin'
)
require 'faker'
puts "400 Records of User created"
1.upto(400) do
  User.create(
      name: Faker::Name.unique.name,
      email: Faker::Internet.email,
      password: 'password'
  )
end
