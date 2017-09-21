class Presence < ApplicationRecord
  belongs_to :student
  belongs_to :activity
end
