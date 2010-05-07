class DevicesController < ApplicationController
  
  before_filter :require_user, :only => :index
  
  def new
    @device = Device.new
  end
  
  def create
    @device = Device.find_by_uuid(params[:device][:uuid])
    if @device #&& !@device.registered?
      @user = User.find_or_initialize_by_email(params[:device][:email])
      unless @user.email.blank?
        
      else
        flash[:error] = "Wrong email."
        redirect_to new_device_path
      end
    else
      flash[:error] = "Wrong PixShare uuid."
      redirect_to new_device_path
    end
  end
  
  def index
    @devices = current_user.devices
  end
  
  def show
    @device = Device.find(params[:id])
  end
  
  def edit
    @device = Device.find(params[:id])
  end
  
  def update
    @device = Device.find(params[:id])
    
    if @device.update_attributes(params[:device])
      redirect_to @device
    else
      render :action => :edit
    end
  end
  
  def contact
    @contact = Contact.find(params[:id])
  end
  
end
