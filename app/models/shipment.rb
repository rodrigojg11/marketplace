class Shipment < ApplicationRecord
  belongs_to :order

  validates :provider, :tracking_number, :status, :cost, :order, presence: true
end
