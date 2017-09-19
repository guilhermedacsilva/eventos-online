Rails.application.routes.draw do
  get 'activities/new'

  devise_for :users

  root 'home#app_root'
  get 'managers', to: 'managers#index'
  resources 'events' do
    resources 'activities'
  end
end
