class WelcomeController < ApplicationController
  
  def index
    # authenticate_or_request_with_http_digest("Test") do |user|
    #   ''
    # end
    if @current_device
      return redirect_to(new_index_albums_path)
    end
  end
  
  def set_device
    session[:device] = "box1"
    redirect_to new_index_albums_path
  end
  
  def notifications
    state = false
    Contact.all.each do |contact|
      state = true if contact.notification?
    end
    render :text => state
  end
  
end
