class API::V1::InvitationsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  protect_from_forgery :with => :null_session
  acts_as_token_authentication_handler_for User
  #before_filter :authenticate_user!

  respond_to :json


  def index
  end
   
  # invite by email
  # invite by sms

  # POST www.picioapp.com/api/v1/invitations
  def create

    # include content-type, email and token
    #
    # {
    #   "invite_by_email":["steven@Rigil.com","Rakhi","sdf", "ser"],
    #   "invite_by_phone":["202-333-1234","Rakhi","sdf", "ser"],
    # }

    @invite_phones = params[:invite_by_phone]
    @invite_emails = params[:invite_by_email]


    # twilio setup
    twilio_sid = ENV['TWILIO_ACCOUNT_SID']
    twilio_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_phone_number = ENV['TWILIO_NUMBER']
     
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token


    # send invite by sms
    unless @invite_phones.nil?
      @invite_phones.each do |phone|
     
        @twilio_client.account.sms.messages.create(
          :from => "+1#{twilio_phone_number}",
          :to => phone,
          :body => "#{current_user.full_name}, a. k. a. #{current_user.name} has invited you to join Picio! http://www.picioapp.com"
        )

      end
    end

    # send invite by email
    unless @invite_emails.nil?
      @invite_emails.each do |email|
        
        #check if email is valid
        User.invite!({:email => email}, current_user) # current_user will be set as invited_by
        #
      end
    end

    render :json => { :result => 'invitations sent'}, status: :created


  end
end