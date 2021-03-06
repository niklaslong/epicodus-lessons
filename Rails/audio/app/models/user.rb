class User < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :products, through: :reviews
  
  validates :name, presence: true

end