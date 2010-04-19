class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])
    @images = (1..9).to_a.map { |i| @album.images.build }
  end
  
end
