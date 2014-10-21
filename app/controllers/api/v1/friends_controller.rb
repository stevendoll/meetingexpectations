class API::V1::FriendsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  protect_from_forgery :with => :null_session
  respond_to :json
  acts_as_token_authentication_handler_for User
  before_filter :authenticate_user!


  # def index
  def index

    @friends = current_user.friends
    @friend_requests = current_user.friend_requests
    @pending_friends = current_user.pending_friends

  end

  
  # POST www.picioapp.com/api/v1/friends
  def create

    # include content-type, email and token
    #
    # {
    #   "invite_friends":["Mr_Sparky","Rakhi","sdf", "ser"],
    #   "accept_friends":["Mr_Sparky","Rakhi","sdf", "ser"],
    #   "breakup_friends":["Mr_Sparky","Rakhi","sdf", "ser"],
    #   "find_friends_by_email":["steven@Rigil.com","Rakhi","sdf", "ser"],
    #   "find_friends_by_phone":["202-333-1234","Rakhi","sdf", "ser"],
    #   "username":"stev"
    # }


    @find_friends_phones = params[:find_friends_by_phone]
    @find_friends_emails = params[:find_friends_by_email]
    @invite_friends_names = params[:invite_friends]
    @accept_friends_names = params[:accept_friends]
    @breakup_friends_names = params[:breakup_friends]

    @username = params[:username]


    # invite
    unless @invite_friends_names.nil?
        @invite_friends_names.each do |friend_name|
        if @friend = User.find_by_name(friend_name)
          Friendship.request(@friend, current_user)
        end
      end
    end

    # accept
    unless @accept_friends_names.nil?
        @accept_friends_names.each do |friend_name|
        if @friend = User.find_by_name(friend_name)
          Friendship.accept(current_user, @friend)
        end
      end
    end

    # unfriend
    unless @breakup_friends_names.nil?
        @breakup_friends_names.each do |friend_name|
        if @friend = User.find_by_name(friend_name)
          Friendship.breakup(current_user, @friend)
        end
      end
    end

    # find by phone
    #
    # \A\+?[78]\d{10}\z
    #
    @users_by_phone = []
    unless @find_friends_phones.nil?
      @find_friends_phones.each do |phone|
        @users_by_phone << User.first(conditions: [ "lower(phone) = ?", phone.downcase ]) unless User.first(conditions: [ "lower(phone) = ?", phone.downcase ]).nil?
      end
    end

    # find by email
    @users_by_email = []
    unless @find_friends_emails.nil?
      @find_friends_emails.each do |email|
        @users_by_email << User.first(conditions: [ "lower(email) = ?", email.downcase ]) unless User.first(conditions: [ "lower(email) = ?", email.downcase ]).nil?
      end
    end

    # lookup a username
    @username_lookups = []
    unless @username.nil?
      @username_lookups = User.search(@username)
    end


    
    # items for view
    @friends = current_user.friends
    @friend_requests = current_user.friend_requests
    @pending_friends = current_user.pending_friends


    respond_to do |format|
      #if @friend.save
        format.json { render action: 'show', status: :created }
      # else
      #   warden.custom_failure!
      #   format.json { render json: @post.errors, status: :unprocessable_entity }
      # end
    end


  end

end

