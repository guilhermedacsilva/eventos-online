Rails.application.routes.draw do
  # ----------------------
  devise_for :users, controllers: {
    sessions: 'custom_devise/sessions',
    registrations: 'custom_devise/registrations'
  }

  root 'home#app_root'
  get 'coordinator', to: 'coordinators#index'
  resources 'users'
  patch 'users/:id/enable', to: 'users#enable', as: 'enable_user'
  resources 'events' do
    resources 'activities'
  end
end
