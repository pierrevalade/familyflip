# == Schema Information
#
# Table name: albums
#
#  id         :integer(4)      not null, primary key
#  contact_id :integer(4)
#  title      :string(255)
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  
  belongs_to :contact
  #has_many :images
  
  def preview_url
    "/albums/#{self.id}/01.jpg"
  end
  
  def images
    Dir.glob("public/albums/#{self.id}/*.jpg").map { |i| Image.new(:album => self, :url => i.gsub('public', '')) }
  end
  
end
