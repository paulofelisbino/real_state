class Address < ApplicationRecord
  has_one :property

  validates :address, :city, :neighborhood,  :state, :zipcode, presence: true
end
