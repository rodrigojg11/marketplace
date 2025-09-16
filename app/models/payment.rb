class Payment < ApplicationRecord
  belongs_to :order

  validates :amount, :method, :status, :order, presence: true
end
