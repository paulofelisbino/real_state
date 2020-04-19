class ApplicationDecorator < Draper::Decorator
  include ActionView::Context
  include ActionView::Helpers
  include ActionDispatch::Routing
  include Rails.application.routes.url_helpers

  def format_to_currency(value)
    number_to_currency(
      value,
      unit: 'R$',
      separator: ',',
      delimiter: '.'
    )
  end
end
