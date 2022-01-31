Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :users
  resources :workdays

  post 'workdays/update_all_holidays'
end
