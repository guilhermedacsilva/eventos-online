class Event < ApplicationRecord
  has_many :activities

  validates :name, presence: true

  def students
    Event
      .select('students.id, students.name, students.email')
      .joins(activities: { presences: :student })
      .where(id: id)
      .order('students.name')
      .distinct
  end
end
