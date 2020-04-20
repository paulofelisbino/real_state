class PropertyDecorator < ApplicationDecorator
  delegate_all

  CATEGORY_MAPPING = {
    sell: I18n.t('activerecord.enums.property.category.sell'),
    rent: I18n.t('activerecord.enums.property.category.rent'),
  }

  def price
    format_to_currency(object.price)
  end

  def mapped_category
    CATEGORY_MAPPING[object.category.to_sym]
  end

  def dt_actions
    links = []

    edit_link = link_to('Editar', edit_admin_property_path(object), class: 'dt-action btn btn-info')
    delete_link = link_to('Remover', admin_property_path(object), method: :delete, remote: true, class: 'dt-action btn btn-danger')

    links << edit_link
    links << delete_link
    safe_join(links, '')
  end
end
