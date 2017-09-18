class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def app_root
    if user_signed_in?
      if current_user.admin?
        redirect_to manager_path
      else
        render plain: 'Not implemented', status: 404
      end
    else
      redirect_to new_user_session_path
    end
  end
end
