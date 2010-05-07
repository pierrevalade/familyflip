class AlbumsController < ApplicationController
    
  def index
    @albums = Album.paginate(:page => params[:page], :per_page => 4)
    #@albums_in_groups = @albums.in_groups_of(2, false)
  end
  
  def show
    @album = Album.find(params[:id])
    @images = @album.images.paginate(:page => params[:page], :per_page => 4)
    @images_in_groups = @images.in_groups_of(2, false)
  end
  
  def image
    @album = Album.find(params[:id])
    
    render :layout => false
  end
  
end
