class Property < ApplicationRecord
  belongs_to :property_type

  enum category: { sell: 0, rent: 1 }

  delegate :name, to: :property_type, prefix: true

  validates :bathrooms, :category, :parking_space, :price,
            :reference, :rooms, :size, :title, presence: true

  validates :reference, uniqueness: true

  monetize :price_cents
  validates_with CustomMoneyValidator # workaround numericality money gem bug

  def self.validate_filter_category(filter)
    category = filter.to_s.downcase.strip
    raise ArgumentError, 'Invalid filter' unless category_enum_valid?(category)
    true
  end

  def self.category_enum_valid?(enum)
    return false unless category_enum_value(enum).present?
    true
  end

  private

  def self.category_enum_value(value)
    defined_enums.deep_symbolize_keys.dig(:category, value.to_sym)
  end
end
