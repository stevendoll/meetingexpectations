class ApplicationController < ActionController::Base
  # authorization
  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # api behavior
  # see http://www.soryy.com/ruby/api/rails/authentication/2014/03/16/apis-with-devise.html
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "Access denied."
    redirect_to(request.referrer || root_path)
  end

end
