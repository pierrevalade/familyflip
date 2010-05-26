class ManifestController < ApplicationController
  
  include ActionView::Helpers::AssetTagHelper
  
  def offline
    
  end
  
  def store
    
  end
  
  def show
    @time = Contact.find(:first, :order => 'updated_at DESC').updated_at
    
    @version = "#{@time.to_s}"
    
    @contacts = @current_device.contacts.all
    @albums = Message.albums.all
    @images = Image.all
    
    @paths = []
    @paths << stylesheet_path('reset-fonts-grids.css')
    @paths << stylesheet_path('device.css')
    @paths << stylesheet_path("#{Rails.env}.css")
    
    @paths << javascript_path('jquery-1.4.2.min.js')
    @paths << javascript_path('jquery.hotkeys.js')
    @paths << javascript_path('application.js')
    @paths << javascript_path('canvas.js')
    @paths << javascript_path("#{Rails.env}.js")
    @paths << javascript_path("gears.js")
    
    @paths << '/images/background.jpg'
    @paths << '/images/ajax-loader-store.gif'
    @paths << image_path('erase.png')
    @paths << image_path('send.png')
    @paths << image_path('next.png')
    @paths << image_path('previous.png')
    @paths << image_path('interface/bphone.png')
    @paths << image_path('interface/bwrite.png')
    @paths << '/images/interface/contact-bg.png'
    @paths << image_path('hstack.png')
    @paths << '/images/wstack.png'
    
    @paths << contacts_path
    @paths << albums_path
    
    @contacts.each do |contact|
      @paths << contact_path(contact)
      @paths << new_message_path(:contact_id => contact.id)
      # @paths << contact.image_path
    end
      
    @albums.each do |album|
      @paths << album_path(album)
    end

    @images.each do |image|
      # @paths << image.url
      # @paths << image.url(:small)
    end
  end
  
end
