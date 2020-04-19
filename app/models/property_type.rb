class PropertyType < ApplicationRecord
  has_many :properties

  validates :title, presence: true
end
