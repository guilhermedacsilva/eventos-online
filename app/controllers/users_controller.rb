class UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.order(:email)
  end

  def enable
    user = User.find(params[:id])
    if user.admin?
      redirect_to users_path, flash: { error: I18n.t('forbidden') }
    else
      user.enabled = !user.enabled?
      user.save
      redirect_to users_path, notice: I18n.t('success')
    end
  end
end
