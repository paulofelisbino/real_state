class Property < ApplicationRecord
  belongs_to :property_type

  enum category: { sell: 0, rent: 1 }

  def self.category_enum_valid?(enum)
    return false unless category_enum_value(enum).present?
    true
  end

  private

  def self.category_enum_value(value)
    defined_enums.deep_symbolize_keys.dig(:category, value.to_sym)
  end
end
