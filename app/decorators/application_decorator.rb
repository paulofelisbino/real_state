class ApplicationDecorator < Draper::Decorator
  include ActionView::Context
  include ActionView::Helpers
  include ActionDispatch::Routing
  include Rails.application.routes.url_helpers

  def dt_link_show(url)
    link_to(
      I18n.t('actions.view'),
      url,
      class: 'dt-action btn btn-primary'
    )
  end

  def dt_link_edit(url)
    link_to(
      I18n.t('actions.edit'),
      url,
      class: 'dt-action btn btn-info'
    )
  end

  def dt_link_delete(**options)
    confirm_params = {
      confirm: I18n.t('actions.confirm'),
      title: "#{I18n.t('actions.delete')} #{options.fetch(:model)}",
      commit: I18n.t('boolean.true'),
      cancel: I18n.t('boolean.false')
    }

    link_to(
      I18n.t('actions.delete'),
      options.fetch(:url),
      method: :delete,
      remote: true,
      data: confirm_params,
      class: 'dt-action action-delete btn btn-danger'
    )
  end
end
