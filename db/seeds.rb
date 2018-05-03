# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Order.destroy_all
LineItem.destroy_all

response = RestClient::Request.execute(
method: :get,
url: 'https://api.nytimes.com/svc/books/v3/lists/combined-print-and-e-book-fiction.json',
headers: {api_key: ENV['NYT_API_KEY']}
)

JSON.parse(response)["results"]["books"].each do |book|
  Product.create!(name: book["title"], price: Faker::Commerce.price, image: book["book_image"], category: "books")
end

100.times do |index|
  Product.create!(name: Faker::Commerce.product_name, price: Faker::Commerce.price, image: Faker::LoremPixel.image, category: "other")
end

p "Created #{Product.count} products"
