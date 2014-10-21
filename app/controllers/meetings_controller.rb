class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @meetings = Meeting.all
    respond_with(@meetings)
  end

  def show
    respond_with(@meeting)
  end

  def new
    @meeting = Meeting.new
    respond_with(@meeting)
  end

  def edit
  end

  def create
    @meeting = Meeting.new(meeting_params)
    flash[:notice] = 'Meeting was successfully created.' if @meeting.save
    respond_with(@meeting)
  end

  def update
    flash[:notice] = 'Meeting was successfully updated.' if @meeting.update(meeting_params)
    respond_with(@meeting)
  end

  def destroy
    @meeting.destroy
    respond_with(@meeting)
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :description, :trashed, :template, :draft, :archived, :completed, :privacy, :starts_at, :ends_at, :all_day, :creator_id, :account_id, :location_id, :location_comments, :color)
    end
end
