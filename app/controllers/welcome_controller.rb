class WelcomeController < ApplicationController
  
  def index
    # authenticate_or_request_with_http_digest("Test") do |user|
    #   ''
    # end
    if @current_device 
      return redirect_to(albums_path)
    end
  end
  
end
