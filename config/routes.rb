Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "roots#index"

  resources :daily_reports, only: [:index, :show, :new, :create, :edit, :update]
  resources :daily_reports, only: [:new, :create, :edit, :update]
  resources :arigatonas, only: [:index]

  get 'signin', to: 'sessions#new', as: :signin
  resource :session, only: [:create, :destroy]

  namespace :api do
    resources :users, only: [:index]
  end

  namespace :client_admin do
    root "roots#index"

    resources :departments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :work_contents, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :work_properties, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :daily_reports, only: [:show, :edit, :update]
    resources :daily_report_users, only: [:index, :show] do
      member do
        get '/new', to: 'daily_report_users#new', as: 'new'
        post '/', to: 'daily_report_users#create', as: 'create'
      end
    end
  end

  namespace :system_admin do
    root "roots#index"

    resources :clients, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
