class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @participants = Participant.all
    respond_with(@participants)
  end

  def show
    respond_with(@participant)
  end

  def new
    @participant = Participant.new
    respond_with(@participant)
  end

  def edit
  end

  def create
    @participant = Participant.new(participant_params)
    flash[:notice] = 'Participant was successfully created.' if @participant.save
    respond_with(@participant)
  end

  def update
    flash[:notice] = 'Participant was successfully updated.' if @participant.update(participant_params)
    respond_with(@participant)
  end

  def destroy
    @participant.destroy
    respond_with(@participant)
  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:meeting_id, :user_id, :attended, :description)
    end
end
