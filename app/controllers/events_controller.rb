class EventsController < ApplicationController
  def index
    @events = Event.order(:name)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: I18n.t('success')
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @activities = @event.activities.order(:name)
  end

  # def edit
  #   @event = Event.find(params[:id])
  # end

  # def update
  #   @event = Event.find(params[:id])
  #   if @event.update(event_params)
  #     redirect_to edit_event_path(@event), notice: 'Event updated'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   event = Event.find(params[:id])
  #   event.destroy
  #   redirect_to events_path, notice: 'Event deleted'
  # end

  # private

  def event_params
    params.require(:event).permit(:name)
  end
end
