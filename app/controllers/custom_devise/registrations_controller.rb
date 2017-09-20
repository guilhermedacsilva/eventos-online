class CustomDevise::RegistrationsController < Devise::RegistrationsController
  layout 'signed_out'
end
