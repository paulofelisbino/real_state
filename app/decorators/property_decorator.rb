class PropertyDecorator < ApplicationDecorator
  delegate_all

  CATEGORY_MAPPING = {
    sell: I18n.t('activerecord.enums.property.category.sell'),
    rent: I18n.t('activerecord.enums.property.category.rent'),
  }

  RENT_INSURANCE_MAPPING = {
    deposit: I18n.t('activerecord.enums.property.rent_insurance.deposit'),
    bank: I18n.t('activerecord.enums.property.rent_insurance.bank'),
    guarantor: I18n.t('activerecord.enums.property.rent_insurance.guarantor'),
    other: I18n.t('activerecord.enums.property.rent_insurance.other')
  }

  def mapped_category
    CATEGORY_MAPPING[object.category.to_sym]
  end

  def mapped_rent_insurance
    insurance = object.rent_insurance
    RENT_INSURANCE_MAPPING[insurance.to_sym] if insurance.present?
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
