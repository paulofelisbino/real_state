class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper

  def format_to_currency(value)
    number_to_currency(
      value,
      unit: 'R$',
      separator: ',',
      delimiter: '.'
    )
  end
end
