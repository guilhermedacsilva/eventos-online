Rails.application.routes.draw do
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
  patch 'event/:event_id/student/:id/remove', to: 'students#remove_from_event', as: 'remove_student_from_event'
end
