class ManifestController < ApplicationController
  
  def index
    @contacts = @current_device.contacts.all
    @albums = Message.albums.all
    @images = Image.all
  end
  
end
