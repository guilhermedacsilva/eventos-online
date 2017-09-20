Rails.application.routes.draw do
  # ----------------------
  devise_for :users, controllers: {
    sessions: 'custom_devise/sessions',
    registrations: 'custom_devise/registrations'
  }

  root 'home#app_root'
  get 'coordinator', to: 'coordinators#index'
  resources 'events' do
    resources 'activities'
  end
end
