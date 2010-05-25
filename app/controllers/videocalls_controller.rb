class VideocallsController < ApplicationController
  
  def index
    if params[:username]
      @call = VideoCall.find_or_create_by_user(params[:username])
      @call.uuid = params[:identity]
      @call.save
    else
      @call = VideoCall.find_by_user(params[:friends])
    end
  end
  
end
