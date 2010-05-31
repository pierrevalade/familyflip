class ContactsController < ApplicationController
  
  def index
    @contacts = @current_device.contacts.all
    # @contacts = @contacts * 3
    @per_page = 8
    @groups = @contacts.in_groups_of(@per_page, false)
  end
  
  def show
    @contact = @current_device.contacts.find(params[:id])
    @messages = @contact.messages.find(:all, :order => 'created_at DESC')
  end
  
  def call
    @contact = Contact.find(params[:id])
  end
  
  def write
    @contact = Contact.find(params[:id])
    @message = @contact.messages.build
  end
  
  def new_call
    @contact = Contact.find(params[:id])
  end
  
  def new
    @contact = Contact.new(:device_id => params[:device_id])
  end
  
  def read
    @contact = Contact.find(params[:id])
    @contact.read!
    
    render :nothing => true
  end
  
  def new_index
    @contacts = @current_device.contacts.all
    @per_page = 7.0
    @groups = @contacts.in_groups_of(@per_page, false)
  end
  
  def new_show
    @contact = @current_device.contacts.find(params[:id])
    @contact.read!
    @messages = @contact.messages.find(:all, :order => 'created_at DESC')
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to @contact.device
    else
      render :action => :new
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update_attributes(params[:contact])
      redirect_to contact_devices_path(:id => @contact.id)
    else
      render :edit
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    
    redirect_to @contact.device
  end
  
end
