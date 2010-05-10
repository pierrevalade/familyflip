class EmailsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def create
    email = Email.sendgrid(params)
    email.save!
    
    # m = Message.new
    # m.images.build(:attachment => open(params[:attachment1]))
    # m.contact = Contact.first
    # m.text = "ok"
    # m.save!
    
    render :nothing => true
  end
  
end
