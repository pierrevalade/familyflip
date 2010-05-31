class MessageMailer < ActionMailer::Base

  def reply_email(message)
    recipients  message.contact.email
    from        "FamilyFlip Notifications <notifications@familyflip.com>"
    subject     "New message from #{message.contact.device.name}"
    sent_on     Time.now
    body        :message => message, :contact => message.contact, :device => message.contact.device
    reply_to    "#{message.contact.device.email}"
  end

end
