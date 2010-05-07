# == Schema Information
#
# Table name: emails
#
#  id         :integer(4)      not null, primary key
#  from       :string(255)
#  to         :string(255)
#  subject    :string(255)
#  text_body  :text
#  html_body  :text
#  created_at :datetime
#  updated_at :datetime
#  contact_id :integer(4)
#  message_id :integer(4)
#

class Email < ActiveRecord::Base
  
  belongs_to :contact
  belongs_to :device
  belongs_to :message
  
  before_validation :set_device, :set_contact
  
  validates_presence_of :contact
  
  def self.sendgrid(params)
    email = Email.new
    email.from = format_from(params[:from])
    email.to = clean_field(params[:to])
    email.subject = clean_field(params[:subject])
    email.text_body = params[:text]
    email.html_body = params[:html]

    email
  end
  
  def self.format_from(email)
    clean_field(email.match(/<(.*)>/)[1])
  end
  
  def self.clean_field(field)
    field.gsub(/\n/,'') if field
  end
  
  def subdomain
    self.to.match(/(.*)@/)[1]
  end
  
  private
    def set_contact
      self.contact = device.contacts.find_by_email(self.from)
    end
    
    def set_device
      self.device = Device.find_by_subdomain(self.subdomain)
    end
  
end
