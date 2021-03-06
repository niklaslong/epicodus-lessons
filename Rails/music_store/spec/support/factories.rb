FactoryGirl.define do

 sequence :email { |n| "basic#{n}@test" }

  factory :account do
    user
    cart_status "empty"
  end

  factory :user do
    email
    password  "testpassword"
    password_confirmation "testpassword"
    admin false
  end

  factory :product do
    name "test_product"
    description "test_description"
    price "20"
  end

  factory :order_item do
    account
    product
  end
end