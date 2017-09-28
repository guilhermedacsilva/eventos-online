class StudentsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @activities = @event.activities.order(:name)
    @student = Student.new
    @student_activities = []
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      @student.set_activities(params[:student][:activity_ids])
      redirect_to @student, notice: I18n.t('success')
    else
      render :new
    end
  end

  def remove_from_event
    event = Event.find(params[:event_id])
    activities = event.activities
    student = Student.find(params[:id])
    student.presences.each do |presence|
      activities.each do |activity|
        presence.destroy if activity.id == presence.activity_id
      end
    end
    redirect_to event, notice: t('success')
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end
end
