class Student < ApplicationRecord
  has_many :presences, dependent: :delete_all

  def set_activities(activity_ids)
    activity_ids.each do |activity_id|
      presences.create(activity_id: activity_id)
    end
  end
end
