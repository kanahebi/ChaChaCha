Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "roots#index"

  resources :daily_reports, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  namespace :api do
    resources :users, only: [:index]
  end

  namespace :system_admin do
    root "roots#index"
  end
end
