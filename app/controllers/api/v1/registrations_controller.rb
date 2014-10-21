class API::V1::RegistrationsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  acts_as_token_authentication_handler_for User, only: [:update, :destroy]
  before_filter :authenticate_user_from_token!, only: [:update, :destroy]


  # GET localhost:3000/api/v1/registrations
  #
  # basic auth with username and password
  # returns authentication_token with rest of use object
  #
  # {
  #   email: "steven@rigil.com"
  #   authentication_token: "s8SfPjALyN6-ktvJrAJK"
  #   name: "StevenD"
  #   first_name: "Steven"
  #   last_name: "Doll"
  #   phone: ""
  #   description: "I'm a curious guy."
  #   full_name: "Steven Doll"
  #   avatar_url: http://s3.amazonaws.com/PictureAppBackup/users/avatars/e0b/22d/2d-/thumb/dot.gif?1409089589
  # }

  def index

    # authenticate user with basic
    authenticate_with_http_basic do |username,password|
      #logger.info "try basic-auth: username=#{username} password=#{password}"
      resource = User.find_by_email(username)
      if resource.valid_password?(password)
        @user = resource
      end
    end


    respond_to do |format|
      if @user
        format.json { render :json => @user.as_json(:only => [:authentication_token, :name, :email, :first_name, :last_name, :email, :phone, :description], :methods => [:full_name, :avatar_url]), status: :created }
      else
        warden.custom_failure!
        format.json { render :json => { :result => 'login failed'}, status: :unauthorized}
      end
    end
  end


  def create

    # need name, phone, password, email
    # optional: first_name, last_name, description

    @user = User.new(user_params)
    @user.password_confirmation = @user.password

    respond_to do |format|
      if @user.save
        format.json { render :json => @user.as_json(:only => [:authentication_token, :email]), status: :created }
      else
        warden.custom_failure!
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end


  end



  # PATCH is successful with 204 no content or 200
  #
  # PATCH /api/v1/profile
  #
  # www.picioapp.com/api/v1/profile
  # {"user":{"email": "steven@rigil.com", "name": "StevenD", "first_name": "Steven", "last_name": "Doll", "phone": "", "gender": "Male", "accepts_friend_requests": true, "age": "21-25", "description": "I'm a curious guy.", "avatar":{"data":"R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=", "filename":"dot.gif", "content_type":"image/gif"}}}

  # patch with device
  # {"user": {"email": "steven@rigil.com", "name": "StevenD", "first_name": "Steven", "last_name": "Doll", "phone": "", "gender": "Male", "accepts_friend_requests": true, "age": "21-25", "description": "I'm a curious guy.", "devices_attributes":[{"device_type":"aass","device_token":"1234"}]}}

  # device_type 'APNS' for Apple Push Notification Service (iOS) 
  # device_token
  #

  # {
  # email: "steven@rigil.com"
  # name: "StevenD"
  # first_name: "Steven"
  # last_name: "Doll"
  # phone: ""
  # gender: "Male"
  # accepts_friend_requests: true
  # age: "21-25"
  # description: "I'm a curious guy."
  # full_name: "Steven Doll"
  # avatar_url: http://s3.amazonaws.com/PictureAppBackup/users/avatars/e0b/22d/2d-/thumb/dot.gif?1404334255
  # -devices: [
  # -{
  # device_type: "aass"
  # device_token: "1234"
  # }
  # ]
  # }

  # def update

  #   # current_user from token authentication
  #   @user = current_user

  #   # if avatar is included, convert it and add to params
  #   if params[:user] && params[:user][:avatar]
  #     data = StringIO.new(Base64.decode64(params[:user][:avatar][:data]))
  #     data.class.class_eval { attr_accessor :original_filename, :content_type }
  #     data.original_filename = params[:user][:avatar][:filename]
  #     data.content_type = params[:user][:avatar][:content_type]
  #     params[:user][:avatar] = data

  #     @user.update_attributes(avatar_params)
  #     @user.touch
  #   end

  #   # Rails.logger.debug "user update: #{current_user.name}"

  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.json { render :json => @user.as_json(:only => [:name, :email, :first_name, :last_name, :email, :phone, :description], :include => {:devices => 
  #                                {:only => [:device_type, :device_token]}}, :methods => [:full_name, :avatar_url]), status: 200 }
  #     else
  #       warden.custom_failure!
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end


  # end

  private
    # Use callbacks to share common setup or constraints between actions.

    def user_params
      #params.require(:user).permit(:name, :first_name, :last_name, :email, :phone, :description, :password, devices_attributes: [:device_type, :device_token] )
      params.require(:user).permit(:name, :first_name, :last_name, :email, :phone, :description, :password )
    end

    def avatar_params
      params.require(:user).permit(:avatar, avatar_attributes: [:filename, :data, :content_type]) 
    end


end