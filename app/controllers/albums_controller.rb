class AlbumsController < ApplicationController
    
  def index
    @albums = Message.albums.paginate(:page => params[:page], :per_page => 8)
    @albums_in_groups = @albums.in_groups_of(2, false)
  end
  
  def new
    @album = Message.new(:contact_id => Contact.first.id, :album => true)
    
    render :layout => false
  end
  
  def show
    @album = Message.albums.find(params[:id])
    @images = @album.images.paginate(:page => params[:page], :per_page => 4)
    @images_in_groups = @images.in_groups_of(2, false)
  end
  
  def image
    @album = Message.albums.find(params[:id])
    
    render :layout => false
  end
  
end
