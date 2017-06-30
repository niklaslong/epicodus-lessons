Product.destroy_all
User.destroy_all

user = User.create(name: "nkls")

50.times do |i|
  product = Product.create(name: Faker::Ancient.primordial, cost:Faker::Number.digit, country: Faker::Address.country)

  Faker::Number.between(1, 10).times do |j|
    review = Review.create(rating: Faker::Number.between(1, 5), content: Faker::Lorem.characters(51))

    user.reviews << review
    product.reviews << review
  end
end