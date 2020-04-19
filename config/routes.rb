Rails.application.routes.draw do
  namespace :admin do
    resources :properties

    root to: "properties#index"
  end
  root to: "properties#index"

  get 'dataTablesI18n/:lang', to: 'datatables#datatable_i18n'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
