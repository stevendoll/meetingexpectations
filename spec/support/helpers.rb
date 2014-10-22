require 'support/helpers/session_helpers'
require 'support/helpers/request_helpers'
#require 'support/helpers/auth_helpers'
RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature

  # http://dhartweg.roon.io/rspec-testing-for-a-json-api
  config.include Requests::JsonHelpers, type: :controller
  #config.include AuthHelpers, type: :controller

  # basic auth
  # https://gist.github.com/mattconnolly/4158961
  config.include BasicAuthRequestHelpers, :type => :request
  config.include BasicAuthHelpers, :type => :controller

end
