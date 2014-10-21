class InvitationsController < Devise::InvitationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:accept_invitation) {|u| u.permit(:name, :email, :password, :password_confirmation, :first_name, :last_name, :phone, :avatar, :description, :invitation_code, :invitation_token)} 
  end

end
