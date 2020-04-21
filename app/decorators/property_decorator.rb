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
    links << dt_link_show(admin_property_path(object))
    links << dt_link_edit(edit_admin_property_path(object))

    delete_params = {
      url: admin_property_path(object),
      model: I18n.t('activerecord.models.property.one')
    }
    links << dt_link_delete(delete_params)
    safe_join(links, '')
  end
end
