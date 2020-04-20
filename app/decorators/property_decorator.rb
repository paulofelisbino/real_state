class PropertyDecorator < ApplicationDecorator
  delegate_all

  CATEGORY_MAPPING = {
    sell: I18n.t('activerecord.enums.property.category.sell'),
    rent: I18n.t('activerecord.enums.property.category.rent'),
  }

  def formatted_price
    format_to_currency(object.price)
  end

  def mapped_category
    CATEGORY_MAPPING[object.category.to_sym]
  end

  def dt_actions
    links = []
    links << dt_link_show
    links << dt_link_edit
    links << dt_link_delete
    safe_join(links, '')
  end

  private

  def dt_link_show
    link_to(
      I18n.t('actions.view'),
      admin_property_path(object),
      class: 'dt-action btn btn-primary'
    )
  end

  def dt_link_edit
    link_to(
      I18n.t('actions.edit'),
      edit_admin_property_path(object),
      class: 'dt-action btn btn-info'
    )
  end

  def dt_link_delete
    link_to(
      I18n.t('actions.delete'),
      admin_property_path(object),
      method: :delete,
      remote: true,
      class: 'dt-action btn btn-danger'
    )
  end
end
