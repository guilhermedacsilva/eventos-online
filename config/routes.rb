Rails.application.routes.draw do
  root 'home#app_root'

  devise_for :users
end
