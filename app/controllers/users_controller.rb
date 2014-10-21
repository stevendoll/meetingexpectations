class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:role, :name, :email, :authentication_token, :password, :password_confirmation, :current_password, :first_name, :last_name, :phone, :description, :avatar, :invitation_code)
  end

end
