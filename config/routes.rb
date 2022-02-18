Rails.application.routes.draw do
  root "workdays#index"
  devise_for :users
  resources :users
  resources :workdays
  resources :statistics

  post 'workdays/update_all_holidays'
end
