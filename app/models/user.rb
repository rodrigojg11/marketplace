class User < ApplicationRecord
  has_secure_password

  has_many :products
  has_many :addresses
  has_many :orders

  has_one :cart

  validates :email, uniqueness: true, presence: true, format: { with: /\A[\w\.]+@([\w]+\.)+[\w]{2,4}\z/ }
  validates :password, length: { in: 6..16 }
end
