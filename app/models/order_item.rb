class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :account
end