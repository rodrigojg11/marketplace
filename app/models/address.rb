class Address < ApplicationRecord
  belongs_to :user

  has_many :orders

  validates :city, :zip_code, :country, :type, presence: true
end
