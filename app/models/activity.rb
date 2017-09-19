class Activity < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :workload, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :people_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
end
