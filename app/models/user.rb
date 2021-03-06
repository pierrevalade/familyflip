# == Schema Information
#
# Table name: users
#
#  id                    :integer(4)      not null, primary key
#  email                 :string(255)     not null
#  crypted_password      :string(255)     not null
#  password_salt         :string(255)     not null
#  persistence_token     :string(255)     not null
#  single_access_token   :string(255)     not null
#  perishable_token      :string(255)     not null
#  created_at            :datetime
#  updated_at            :datetime
#  cloudapp_login        :string(255)
#  cloudapp_password     :string(255)
#  cloudapp_last_file_id :integer(4)
#

class User < ActiveRecord::Base
  
  has_many :devices
  
  acts_as_authentic do |c|
    
  end
  
end
