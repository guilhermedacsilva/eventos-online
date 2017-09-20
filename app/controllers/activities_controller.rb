class ActivitiesController < ApplicationController
  before_action :enable_user!
  before_action :set_event

  def index
    redirect_to @event
  end

  def new
    @activity = @event.activities.build
  end

  def create
    @activity = @event.activities.build(activity_params)
    if @activity.save
      redirect_to @event, notice: I18n.t('success')
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to @event, notice: I18n.t('success')
    else
      render :edit
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to @event, notice: I18n.t('success')
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def activity_params
    params.require(:activity).permit(:name, :workload, :people_limit)
  end
end
