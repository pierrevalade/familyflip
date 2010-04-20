# == Schema Information
#
# Table name: images
#
#  id         :integer(4)      not null, primary key
#  album_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Image < ActiveRecord::Base
  
  belongs_to :album
  
  attr_accessor :url
  
end
