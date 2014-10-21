# spec/support/auth_helpers.rb
# http://dhartweg.roon.io/rspec-testing-for-a-json-api

module AuthHelpers
  def auth_with_user(user)
    request.headers['X-USER-TOKEN'] = "#{user.find_api_key.authentication_token}"
    request.headers['X-USER-EMAIL'] = "#{user.find_api_key.email}"
  end

  def clear_token
    request.headers['X-USER-TOKEN'] = nil
    request.headers['X-USER-EMAIL'] = nil
  end
end
