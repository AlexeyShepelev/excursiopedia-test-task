Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'cities#index'

  resources :cities, only: [:index, :show]
  resources :excursions, only: :show
end
