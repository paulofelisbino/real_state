Rails.application.routes.draw do
  namespace :admin do
    concern :with_datatable do
      post 'datatable', on: :collection
    end

    resources :properties, concerns: [:with_datatable]

    root to: "properties#index"
  end
  root to: "properties#index"

  get 'dataTablesI18n/:lang', to: 'datatables#datatable_i18n'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
