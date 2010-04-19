class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])
    @images = 10.times.map do |i|
      @album.images.build
    end
  end
  
end
