Rails.application.routes.draw do

  ############################
  # clearance
  ############################

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # resource :session, controller: "clearance/sessions", only: [:create]
  resource :session, controller: "sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in", to: "clearance/sessions#new", as: "sign_in"
  delete "/sign_out", to: "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up", to: "clearance/users#new", as: "sign_up"

  ############################
  # admin
  ############################

  namespace :admin do
    concern :with_datatable do
      post 'datatable', on: :collection
    end

    resources :properties, concerns: [:with_datatable]

    root to: "properties#index"
  end

  ############################
  # normal
  ############################

  get 'dataTablesI18n/:lang', to: 'datatables#datatable_i18n'
  get 'addresses/find_by_zipcode/:zipcode', to: 'addresses#find_by_zipcode'

  root to: "home#index"
end
