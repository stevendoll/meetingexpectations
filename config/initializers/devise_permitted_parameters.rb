module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :first_name, :last_name, :phone, :avatar, :description, :invitation_code)}
    devise_parameter_sanitizer.for(:accept_invitation) {|u| u.permit(:name, :email, :password, :password_confirmation, :first_name, :last_name, :phone, :avatar, :description, :invitation_code)} 
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :phone, :avatar, :description, :invitation_code)}

  end

end

DeviseController.send :include, DevisePermittedParameters
