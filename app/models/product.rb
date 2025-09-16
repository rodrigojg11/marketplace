class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :cart_items
  has_many :order_items

  validates :title, presence: true, length: { minimum: 3 }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates :published, presence: true
end
