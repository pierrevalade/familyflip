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
  
  def url
    "/albums/#{album_id}/0#{rand(9) + 1}.jpg"
  end
  
end
