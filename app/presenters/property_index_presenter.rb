class PropertyIndexPresenter
  include ActionView::Context
  include ActionView::Helpers
  include ActionDispatch::Routing
  include Rails.application.routes.url_helpers

  attr_reader :filter_category

  def initialize(**options)
    @filter_category = options.fetch(:filter_category)
  end

  def subtitle
    return unless filter_category.present?
    content_tag(:p, class: 'mb-4') do
      I18n.t("property.index.subtitle.#{filter_category}")
    end
  end

  def datatable_source
    datatable_admin_properties_path(
      filter: filter_category,
      format: :json
    )
  end
end
