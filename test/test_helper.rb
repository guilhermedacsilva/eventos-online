ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'sidekiq/testing'

# Sidekiq::Testing.fake!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Devise::Test::IntegrationHelpers

  def assert_show_model_errors
    assert_response :success
    assert_select '#error_explanation'
  end
end
