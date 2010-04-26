# == Schema Information
#
# Table name: devices
#
#  id         :integer(4)      not null, primary key
#  uuid       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer(4)
#

class Device < ActiveRecord::Base
  
  attr_accessor :email
  
  belongs_to :user
  
  validates_presence_of :name, :user_id
  
end
