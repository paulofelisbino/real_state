class PropertyIndexPresenter
  include ActionView::Context
  include ActionView::Helpers::TagHelper

  attr_reader :properties, :filter_category

  def initialize(**options)
    properties = options.fetch(:properties)
    @filter_category = options.fetch(:filter_category)

    @properties = PropertyDecorator.decorate_collection(properties)
  end

  def subtitle
    return unless filter_category.present?
    content_tag(:p, class: 'mb-4') do
      I18n.t("property.index.subtitle.#{filter_category}")
    end
  end
end
