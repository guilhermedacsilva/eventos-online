Rails.application.routes.draw do
  get 'students/new'

  get 'students/create'

  # ----------------------
  devise_for :users, controllers: {
    sessions: 'custom_devise/sessions',
    registrations: 'custom_devise/registrations'
  }

  root 'home#app_root'
  resources 'coordinators'
  patch 'coordinators/:id/enable', to: 'coordinators#enable', as: 'enable_coordinator'
  resources 'events' do
    resources 'activities'
    resources 'students'
  end
end
