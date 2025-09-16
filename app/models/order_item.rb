class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product, :order, :price_at_purchase, :quantity, presence: true
  validates :price_at_purchase, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 1}
end
