class EmailObserver < ActiveRecord::Observer
  
  def after_create(email)
    if email.valid?
      message = Message.new
      message.email = email
      if message.save!
        email.message = message
      end
    end
  end
  
end
