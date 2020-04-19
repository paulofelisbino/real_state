class PropertyDecorator < ApplicationDecorator
  delegate_all

  def price
    format_to_currency(object.price)
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
