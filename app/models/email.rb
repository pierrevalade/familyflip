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
#  device_id  :integer(4)
#

class Email < ActiveRecord::Base
  
  belongs_to :contact
  belongs_to :device
  belongs_to :message, :validate => false
  
  before_validation :set_device, :set_contact
  after_create :set_last_email_id_to_device
  
  validates_presence_of :device, :contact
  
  attr_accessor :images
  
  include HTTParty
  base_uri 'familyflip.heroku.com'
  
  def self.update!
    from = Device.first.last_email_id
    messages = self.get("/emails?from=#{from}")
    messages.each do |message|
      email = Email.new(message["email"])
      email.save
    end
  end
  
  def subdomain
    self.to.match(/(.*)@/)[1]
  end
  
  private
    def set_last_email_id_to_device
      self.device.update_attribute(:last_email_id, self.id)
    end
  
    def set_contact
      self.contact = device.contacts.find_by_email(self.from) if self.device
    end
    
    def set_device
      self.device = Device.find_by_subdomain(self.subdomain)
    end
  
end
