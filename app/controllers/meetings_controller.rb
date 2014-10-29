class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @meetings = policy_scope(Meeting)
    respond_with(@meetings)
  end

  def show
    authorize @meeting
    respond_with(@meeting)
  end

  def new
    @meeting = Meeting.new
    authorize @meeting
    respond_with(@meeting)
  end

  def edit
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    authorize @meeting
    flash[:notice] = 'Meeting was successfully created.' if @meeting.save
    respond_with(@meeting)
  end

  def update
    authorize @meeting
    flash[:notice] = 'Meeting was successfully updated.' if @meeting.update(meeting_params)
    respond_with(@meeting)
  end

  def destroy
    authorize @meeting
    @meeting.destroy
    respond_with(@meeting)
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :description, :trashed, :template, :draft, :archived, :completed, :privacy, :starts_at, :ends_at, :all_day, :creator_id, :account_id, :location_id, :location_comments, :color, :tag_list)
    end
end
