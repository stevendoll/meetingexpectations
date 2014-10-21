class AgendaItemsController < ApplicationController
  before_action :set_agenda_item, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @agenda_items = AgendaItem.all
    respond_with(@agenda_items)
  end

  def show
    respond_with(@agenda_item)
  end

  def new
    @agenda_item = AgendaItem.new
    respond_with(@agenda_item)
  end

  def edit
  end

  def create
    @agenda_item = AgendaItem.new(agenda_item_params)
    flash[:notice] = 'AgendaItem was successfully created.' if @agenda_item.save
    respond_with(@agenda_item)
  end

  def update
    flash[:notice] = 'AgendaItem was successfully updated.' if @agenda_item.update(agenda_item_params)
    respond_with(@agenda_item)
  end

  def destroy
    @agenda_item.destroy
    respond_with(@agenda_item)
  end

  private
    def set_agenda_item
      @agenda_item = AgendaItem.find(params[:id])
    end

    def agenda_item_params
      params.require(:agenda_item).permit(:ends_at, :starts_at, :completed, :trashed, :description, :position, :presenter, :name, :meeting_id)
    end
end
