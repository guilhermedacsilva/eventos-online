class EventsController < ApplicationController
  def index
    @events = Event.order(:name)
  end

  # def new
  #   @product = Event.new
  # end

  # def create
  #   @product = Event.new(product_params)
  #   if @product.save
  #     redirect_to edit_product_path(@product), notice: 'Event created'
  #   else
  #     render :new
  #   end
  # end

  # def show
  #   redirect_to edit_product_path(params[:id])
  # end

  # def edit
  #   @product = Event.find(params[:id])
  # end

  # def update
  #   @product = Event.find(params[:id])
  #   if @product.update(product_params)
  #     redirect_to edit_product_path(@product), notice: 'Event updated'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   product = Event.find(params[:id])
  #   product.destroy
  #   redirect_to events_path, notice: 'Event deleted'
  # end

  # private

  # def product_params
  #   params.require(:product).permit(:name, :video, :title, :subtitle)
  # end
end
