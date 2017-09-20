class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def app_root
    if user_signed_in?
      @admin = User.find_by(access_level: 1)
      render :hello
    else
      redirect_to new_user_session_path
    end
  end
end
