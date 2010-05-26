class AlbumsController < ApplicationController
    
  def index
    @albums = Message.albums.all(:order => 'created_at DESC')
    #@albums = @albums * 3
    @per_page = 6
    @groups = @albums.in_groups_of(@per_page, false)
  end
  
  def new
    @album = Message.new(:contact_id => Contact.first.id)
    
    render :layout => false
  end
  
  def show
    @album = Message.albums.find(params[:id])
    @images = @album.images.all
    @per_page = 2
    @groups = @images.in_groups_of(@per_page, false)
  end
  
  def image
    @album = Message.albums.find(params[:id])
    
    render :layout => false
  end
  
  def carousel
    @album = Message.albums.find(params[:id])
    @images = @album.images.all
  end
  
end
