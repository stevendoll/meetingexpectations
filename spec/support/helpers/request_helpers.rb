# spec/support/request_helpers.rb
module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end

    def auth_with_user(user)
      request.headers['X-USER-TOKEN'] = "#{user.authentication_token}"
      request.headers['X-USER-EMAIL'] = "#{user.email}"
    end

    def clear_token
      request.headers['X-USER-TOKEN'] = nil
      request.headers['X-USER-EMAIL'] = nil
    end
  end
end