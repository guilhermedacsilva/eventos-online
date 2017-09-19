class ActivitiesController < ApplicationController
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
      redirect_to @event, notice: I18n.t('activity_created')
    else
      render :new
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to @event, notice: I18n.t('activity_deleted')
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def activity_params
    params.require(:activity).permit(:name)
  end
end
