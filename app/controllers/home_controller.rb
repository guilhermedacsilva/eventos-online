class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def app_root
    if user_signed_in?
      redirect_to coordinator_path
    else
      redirect_to new_user_session_path
    end
  end
end
