class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :address

  has_and_belongs_to_many :rent_insurances

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :rent_insurances, allow_destroy: true

  enum category: { sell: 0, rent: 1 }

  delegate :name, to: :property_type, prefix: true

  validates :bathrooms, :category, :parking_space, :price,
            :reference, :rooms, :size, :title, presence: true
  validates :rent_insurances, presence: true, if: :property_to_rent?

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

  def property_to_rent?
    rent?
  end

  def self.category_enum_value(value)
    defined_enums.deep_symbolize_keys.dig(:category, value.to_sym)
  end
end
