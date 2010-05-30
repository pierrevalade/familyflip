class MessagesController < ApplicationController
  
  def new
    @message = Message.new(:contact_id => params[:contact_id])
  end
  
  def create
    @message = Message.new(params[:message])
    @message.reply = true
    @message.save!
    redirect_to new_show_contact_path(@message.contact)
  end
  
end
