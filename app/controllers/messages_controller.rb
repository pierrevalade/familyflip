class MessagesController < ApplicationController
  
  def new
    
  end
  
  def index
    @messages = Message.all
  end
  
  def show
    @message = Message.find(params[:id])
  end
  
  def reply
  end
  
end
