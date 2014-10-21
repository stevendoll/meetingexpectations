class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def show
    respond_with(@location)
  end

  def new
    @location = Location.new
    respond_with(@location)
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    flash[:notice] = 'Location was successfully created.' if @location.save
    respond_with(@location)
  end

  def update
    flash[:notice] = 'Location was successfully updated.' if @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :address_1, :address_2, :city, :state, :zip, :account_id)
    end
end
