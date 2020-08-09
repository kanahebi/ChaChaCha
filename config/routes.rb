Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "roots#index"

  resources :daily_reports, only: [:new]

  resource :session, only: [:new, :create, :destroy]
end
