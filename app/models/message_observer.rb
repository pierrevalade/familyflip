class MessageObserver < ActiveRecord::Observer
  
  def after_create(message)
    if message.reply?
      MessageMailer.deliver_reply_email(message)
    end
  end
end
