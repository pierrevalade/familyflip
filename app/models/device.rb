# == Schema Information
#
# Table name: devices
#
#  id            :integer(4)      not null, primary key
#  uuid          :string(255)
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer(4)
#  subdomain     :string(255)
#  last_email_id :integer(4)
#

class Device < ActiveRecord::Base
  
  attr_accessor :email
  
  belongs_to :user
  has_many :contacts
  
  validates_presence_of :name, :user_id
  
  validates_format_of :subdomain, :with => /^[A-Za-z0-9-]+$/
                      #, :message => 'The subdomain can only contain alphanumeric characters and dashes.',
                      # :allow_blank => true
  validates_uniqueness_of :subdomain, :case_sensitive => false
  
  before_validation :downcase_subdomain
  
  def downcase_subdomain
    self.subdomain.downcase!
  end
  
  def email
    "#{self.subdomain}@usefulsocial.com"
  end
  
end
