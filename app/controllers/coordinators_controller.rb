class CoordinatorsController < ApplicationController
  def index
    @admin = User.find_by(access_level: 1)
  end
end
