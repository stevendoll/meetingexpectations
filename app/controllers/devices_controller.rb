class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @devices = Device.all
    respond_with(@devices)
  end

  def show
    respond_with(@device)
  end

  def new
    @device = Device.new
    respond_with(@device)
  end

  def edit
  end

  def create
    @device = Device.new(device_params)
    flash[:notice] = 'Device was successfully created.' if @device.save
    respond_with(@device)
  end

  def update
    flash[:notice] = 'Device was successfully updated.' if @device.update(device_params)
    respond_with(@device)
  end

  def destroy
    @device.destroy
    respond_with(@device)
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:device_type, :device_token, :user_id)
    end
end
