# == Schema Information
#
# Table name: video_calls
#
#  id         :integer(4)      not null, primary key
#  user       :string(255)
#  uuid       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VideoCall < ActiveRecord::Base
end
