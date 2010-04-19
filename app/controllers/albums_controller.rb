class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])
    @images = 10.times.map { |i| @album.images.build }
  end
  
end
