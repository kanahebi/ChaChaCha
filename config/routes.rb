Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "roots#index"

  resources :daily_reports, only: [:index, :show, :new, :create, :edit, :update]

  resource :session, only: [:new, :create, :destroy]

  namespace :api do
    resources :users, only: [:index]
  end

  namespace :client_admin do
    root "roots#index"

    resources :work_contents, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :work_properties, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  namespace :system_admin do
    root "roots#index"

    resources :clients, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
