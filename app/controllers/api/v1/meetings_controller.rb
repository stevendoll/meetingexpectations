class API::V1::MeetingsController < ApplicationController
  
  # token authentication see https://github.com/gonzalo-bulnes/simple_token_authentication
  acts_as_token_authentication_handler_for User #, fallback_to_devise: false
  before_filter :authenticate_user_from_token!

  before_action :set_meeting, only: [:show, :edit, :update]

  respond_to :json


  # GET meetingexpectations.herokuapp.com/api/v1/meetings
  #
  # {
  #   planned_meetings: [
  #     {
  #       id: "13f6cd1e-1fa0-4ff2-8ccb-9f7c92454242",
  #       name: "Lets get together",
  #       description: "I wanna talk to everyone",
  #       trashed: false,
  #       template: false,
  #       draft: false,
  #       archived: false,
  #       completed: false,
  #       privacy: "",
  #       starts_at: "2014-10-21T20:27:00.000Z",
  #       ends_at: "2014-10-21T20:27:00.000Z",
  #       all_day: false,
  #       location_comments: "Don't forget to bring snacks",
  #       color: "#fff",
  #       created_at: "2014-10-21T20:27:56.584Z",
  #       updated_at: "2014-10-21T20:27:56.584Z",
  #       url: http://meetingexpectations.herokuapp.com/meetings/13f6cd1e-1fa0-4ff2-8ccb-9f7c92454242,
  #
  #       creator: {
  #         name: "Steven",
  #         full_name: "Steven Doll",
  #         description: "",
  #         avatar_url: /avatars/thumb/missing.png
  #       },
  #
  #       location: {
  #         name: "Rigil Conference Room",
  #         address_1: "888 17th St NW",
  #         address_2: "3rd Floor",
  #         city: "Washington",
  #         state: "DC",
  #         zip: "20008"
  #       },
  #       participants: [
  #         {
  #           name: "Steven",
  #           full_name: "Steven Doll",
  #           first_name: "Steven",
  #           last_name: "Doll",
  #           email: "user@example.com",
  #           description: "",
  #           created_at: "2014-10-21T03:47:49.095Z",
  #           updated_at: "2014-10-21T20:25:58.828Z",
  #           url: http://meetingexpectations.herokuapp.com/participants/fc0210a7-8d91-43aa-bdd9-e6d5e040197a
  #         }
  #       ],
  #         agenda_items: [
  #         {
  #           id: "53e68bd7-96e6-465a-a3dc-ebe969d92116",
  #           ends_at: "2014-10-21T20:30:00.000Z",
  #           starts_at: "2014-10-21T20:30:00.000Z",
  #           completed: false,
  #           trashed: false,
  #           description: "",
  #           position: null,
  #           presenter: "Sean",
  #           name: "Talk about Picio",
  #           created_at: "2014-10-21T20:31:09.239Z",
  #           updated_at: "2014-10-21T20:31:09.239Z",
  #           url: http://meetingexpectations.herokuapp.com/agenda_items/53e68bd7-96e6-465a-a3dc-ebe969d92116
  #           },
  #           {
  #             id: "2aa471a1-e1a2-43d3-adf1-74dc9f52ea89",
  #             ends_at: "2014-10-21T20:31:00.000Z",
  #             starts_at: "2014-10-21T20:31:00.000Z",
  #             completed: false,
  #             trashed: false,
  #             description: "",
  #             position: null,
  #             presenter: "The team",
  #             name: "Provide an update",
  #             created_at: "2014-10-21T20:31:41.540Z",
  #             updated_at: "2014-10-21T20:31:41.540Z",
  #             url: http://meetingexpectations.herokuapp.com/agenda_items/2aa471a1-e1a2-43d3-adf1-74dc9f52ea89
  #           }
  #         ]
  #       }
  #     ]
  #   }
  def index
    if (
      @meetings = Meeting.all
      )

      render action: 'index', status: 200
    else
      warden.custom_failure!
      render json: "fail", status: :unprocessable_entity
    end

  end


  # GET /posts/1
  # GET /posts/1.json
  def show
  end


  # GET /posts/1/edit
  def edit
  end



  # POST /api/v1/posts
  def create

    # remember: Content-Type: application/json

    # basic create
    # {"post":{"title":"My pico", "picture":{"data":"R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=", "filename":"dot.gif", "content_type":"image/gif"}}}

    # add friends
    # {"post":{"title":"My pico", "friends":["Mr_Sparky","Rakhi"], "picture":{"data":"R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=", "filename":"dot.gif", "content_type":"image/gif"}}}
    
    # add tag list comma-delim
    # {"post":{"title":"My pico","privacy":"friends", "tag_list":"hot, more", "friends":["Sean","Rakhi","sdf", "ser"], "picture":{"data":"R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=", "filename":"dot.gif", "content_type":"image/gif"}}}

    # add tag list as array
    # {"post":{"title":"My pico","privacy":"friends", "tag_list":["name","more"], "friends":["Sean","Rakhi","sdf", "ser"], "picture":{"data":"R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=", "filename":"dot.gif", "content_type":"image/gif"}}}


    if params[:post] && params[:post][:picture]
      process_picture(params[:post])
      # data = StringIO.new(Base64.decode64(params[:post][:picture][:data]))
      # data.class.class_eval { attr_accessor :original_filename, :content_type }
      # data.original_filename = params[:post][:picture][:filename]
      # data.content_type = params[:post][:picture][:content_type]
      # params[:post][:picture] = data

    end
    
    if params[:post] && params[:post][:audio]
      # :process_audio(params[:post])
      data = StringIO.new(Base64.decode64(params[:post][:audio][:data]))
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = params[:post][:audio][:filename]
      data.content_type = params[:post][:audio][:content_type]
      params[:post][:audio] = data

    end

    @friend_names = params[:post][:friends]

    params[:post] = params[:post].except(:friends, :friend_ids)


    @post = Post.new(post_params)

    @post.creator = current_user

    if @post.save

      # add shares to share with friends
      unless @friend_names.nil?
        @friend_names.each do |friend_name|
          
          unless User.find_by_name(friend_name).nil? || User.find_by_name(friend_name) == current_user
            @share = Share.new
            @share.shared_with = User.find_by_name(friend_name)
            @share.shared_by = current_user
            @post.shares << @share
          end
        end
      end

      # show post
      render action: 'show', status: :created

    else
      warden.custom_failure!
      render json: @post.errors, status: :unprocessable_entity
    end

  end



  # remember: Content-Type: application/json
  #
  # note: the correct rfc-compliant content type doesn't work
  # application/json-patch+json.
  # jsonapi.org/format
  #
  # PATCH is successful with 204 no content or 200
  #
  # PATCH/PUT /api/v1/posts/06e9...
  # www.picioapp.com/api/v1/posts/d14cd91c-8447-4714-bd5f-767d0ae53e20
  # {"post":{"title":"My picio","privacy":"friends", "tag_list":"hot, stuff", "friends":["Sean","Rakhi","Mr_Sparky", "ser"]}}
  #
  # supported:
  #
  # title, body, privacy, friends, tag_list[] (array), tag_list (comma-delim text string)
  #
  # picture: if picture params are included, picture will be updated. note: this will delete the current picture
  # audio: if audio params are included, audio will be updated. note: this will delete the current audio
  #
  def update

    # if picture is included, convert it and add to params
    if params[:post] && params[:post][:picture]
      data = StringIO.new(Base64.decode64(params[:post][:picture][:data]))
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = params[:post][:picture][:filename]
      data.content_type = params[:post][:picture][:content_type]
      params[:post][:picture] = data

      @post.update_attributes(picture_params)
      @post.touch
    end
    
    # if audio is included, convert it and add to params
    if params[:post] && params[:post][:audio]
      data = StringIO.new(Base64.decode64(params[:post][:audio][:data]))
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = params[:post][:audio][:filename]
      data.content_type = params[:post][:audio][:content_type]
      params[:post][:audio] = data

      @post.update_attributes(audio_params)
      @post.touch
    end

    
    # convert friend names to id's
    @friend_names = params[:post][:friends]
    params[:post] = params[:post].except(:friends, :friend_ids) #remove friend_ids if someone tried to send it


    unless @friend_names.nil?
      @friend_names.each do |friend_name|
        
        unless User.find_by_name(friend_name).nil?
          shared_with = User.find_by_name(friend_name)
          
          unless @post.shares.where(shared_with: shared_with).where(shared_by: current_user).exists? || shared_with == current_user
            @share = Share.new
            @share.shared_with = shared_with
            @share.shared_by = current_user
            @post.shares << @share
          end
        end
      end
    end


    if @post.update(post_params_without_attachments)
      render action: 'show', status: 200
    else
      render json: @post.errors, status: :unprocessable_entity
    end

  end


  # DELETE /api/v1/posts/06e925f1-cfd1-4795-85c9-8a785ddbe514
  def destroy
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to api_v1_posts_path, status: 303
      return
    end

    if @post && @post.creator == current_user
      @post.destroy
      head :no_content
    else
      warden.custom_failure!
      render :json => { :error => true, :message => "Error 403, you don't have permissions for this operation." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :description, :privacy, :picture, :audio, :tag_list, tag_list: [], friend_ids: [], friends: [], picture_attributes: [:filename, :data, :content_type], audio_attributes: [:filename, :data, :content_type]) 
    end

    # # without picture and audio
    # def post_params_without_attachments
    #   params.require(:post).permit(:title, :body, :privacy, :tag_list, tag_list: [], friend_ids: [], friends: []) 
    # end

    # def picture_params
    #   params.require(:post).permit(:picture, picture_attributes: [:filename, :data, :content_type]) 
    # end

    # def audio_params
    #   params.require(:post).permit(:audio, audio_attributes: [:filename, :data, :content_type]) 
    # end

    def process_picture(post)
      data = StringIO.new(Base64.decode64(post[:picture][:data]))
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = post[:picture][:filename]
      data.content_type = post[:picture][:content_type]
      params[:post][:picture] = data
    end


end