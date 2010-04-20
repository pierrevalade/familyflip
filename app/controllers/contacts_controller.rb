class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.paginate(:page => params[:page], :per_page => 12)
    @contacts_in_groups = @contacts.in_groups_of(6, false)
  end
  
  def show
    @contact = Contact.find(params[:id])
    @images = @contact.albums
    @images = @images.map { |album| album.images }.flatten.paginate(:page => params[:page], :per_page => 1) if @images
  end
  
  def call
    @contact = Contact.find(params[:id])
  end
  
end
