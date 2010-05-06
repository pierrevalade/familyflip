# == Schema Information
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  contact_id :integer(4)
#  subject    :string(255)
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  
  belongs_to :contact
  
  validates_presence_of :contact, :text
  
  default_scope :order => 'created_at ASC'
  
  def to_s
    subject
  end
  
  def email=(email)
    self.contact = email.contact
    self.subject = email.subject
    self.text = email.text_body
  end
  
end
