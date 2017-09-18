Rails.application.routes.draw do
  devise_for :users

  root 'home#app_root'
  get 'managers', to: 'managers#index'
  resources 'events'
end
