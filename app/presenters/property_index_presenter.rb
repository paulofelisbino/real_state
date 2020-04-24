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
    content_tag(:p) do
      subtitle_text
    end
  end

  def datatable_source
    return datatable_admin_properties_path(format: :json) if filter_category.nil?

    datatable_admin_properties_path(
      filter: filter_category,
      format: :json
    )
  end

  private

  def subtitle_text
    i18n = 'all'
    i18n = filter_category if filter_category.present?
    I18n.t("property.index.subtitle.#{i18n}")
  end
end
