class WelcomeController < ApplicationController
  
  def index
    if @current_device 
      return redirect_to(store_manifest_path)
    end
  end
  
end
