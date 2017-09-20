class CoordinatorsController < ApplicationController
  before_action :is_admin?

  def index
    @coordinators = User.order(:email)
  end

  def new
    @coordinator = User.new
  end

  def create
    @coordinator = User.new(coordinator_params)
    @coordinator.enabled = true
    if @coordinator.save
      redirect_to coordinators_path, notice: I18n.t('success')
    else
      render :new
    end
  end

  def edit
    @coordinator = User.find(params[:id])
  end

  def update
    @coordinator = User.find(params[:id])
    if update_coordinator(@coordinator)
      redirect_to coordinators_path, notice: I18n.t('success')
    else
      render :edit
    end
  end

  def enable
    coordinator = User.find(params[:id])
    if coordinator.admin?
      redirect_to coordinators_path, flash: { error: I18n.t('forbidden') }
    else
      coordinator.enabled = !coordinator.enabled?
      coordinator.save
      redirect_to coordinators_path, notice: I18n.t('success')
    end
  end

  def destroy
    coordinator = User.find(params[:id])
    coordinator.destroy
    redirect_to coordinators_path, notice: I18n.t('success')
  end

  def show
    coordinator = User.find(params[:id])
    redirect_to edit_coordinator_path(coordinator)
  end

  private

  def coordinator_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def update_coordinator(coordinator)
    if coordinator_params[:password].blank?
      coordinator.update(email: coordinator_params[:email])
    else
      coordinator.update(coordinator_params)
    end
  end
end
