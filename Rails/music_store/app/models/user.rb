class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :products, through: :reviews

  has_one :account, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true

  after_create :associate_account

  def associate_account
    self.create_account(cart_status: 'empty')
  end
end
