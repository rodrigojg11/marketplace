class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_one :payment
  has_one :shipment

  validates :total, :status, :user, :address, presence: true
end
