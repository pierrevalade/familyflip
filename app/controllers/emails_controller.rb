class EmailsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def create
    email = Email.sendgrid(params)
    # raise "#{email.inspect}"
    email.save!

    render :nothing => true
  end
  
end
