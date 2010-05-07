class WelcomeController < ApplicationController
  
  def index
    if @current_device 
      return redirect_to albums_path
    end
  end
  
end
