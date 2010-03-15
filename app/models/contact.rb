# == Schema Information
#
# Table name: contacts
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  has_many :messages
  
  default_scope :order => 'last_name'
  
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def to_s
    name
  end
  
  def image_path
    "contacts/#{first_name.parameterize}.jpg"
  end
  
end
