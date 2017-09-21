class StudentsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @activities = @event.activities.order(:name)
    @student = Student.new
  end

  def create
    @student = Event.new(student_params)
    if @student.save
      redirect_to @event, notice: I18n.t('success')
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end
end
