class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum access_level: {
    organizer: 0,
    admin: 1
  }
end
