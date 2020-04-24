class CustomMoneyValidator < ActiveModel::Validator
  def validate(record)
    unless money_valid?(record)
      record.errors.add(
        :price,
        I18n.t('activerecord.errors.messages.property.money_error')
      )
    end
  end

  private

  def money_valid?(record)
    Money.new(record.price_cents) > Money.new(0) &&
    Money.new(record.price_cents) < Money.new(100000000000000000) # quadrillion in cents
  end
end
