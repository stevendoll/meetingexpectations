require 'support/helpers/session_helpers'
require 'support/helpers/request_helpers'
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature

  # http://dhartweg.roon.io/rspec-testing-for-a-json-api
  config.include Requests::JsonHelpers, type: :controller
end
