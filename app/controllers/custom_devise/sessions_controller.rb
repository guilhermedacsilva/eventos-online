class CustomDevise::SessionsController < Devise::SessionsController
  layout 'signed_out'
end
