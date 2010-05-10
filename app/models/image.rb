# == Schema Information
#
# Table name: images
#
#  id                      :integer(4)      not null, primary key
#  message_id              :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#

class Image < ActiveRecord::Base
  
  belongs_to :message
  
  attr_accessor :url
  
  has_attached_file :attachment, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/aws.yml"
                                 # , :convert_options => { :all => '-auto-orient' }
                                 # , :styles => { :original => ['300x300>'], :normal => ['75x75#']}
                                 # , :default_style => :normal,
                                 # :path => "profile_images/:id/:style/:filename"
  
end
