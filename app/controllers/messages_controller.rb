class MessagesController < ApplicationController
  
  def new
    @message = Message.new(:contact_id => params[:contact_id])
  end
  
  def create
    
    @message = Message.new(params[:message])
    @message.save
    redirect_to @message.contact
  end
  
end
