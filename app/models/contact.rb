# == Schema Information
#
# Table name: contacts
#
#  id                    :integer(4)      not null, primary key
#  first_name            :string(255)
#  last_name             :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  email                 :string(255)
#  device_id             :integer(4)
#  image_file_name       :string(255)
#  image_content_type    :string(255)
#  image_file_size       :integer(4)
#  image_updated_at      :datetime
#  cloudapp_login        :string(255)
#  cloudapp_password     :string(255)
#  cloudapp_last_file_id :integer(4)      default(0)
#  read_at               :datetime
#

class Contact < ActiveRecord::Base
  
  has_many :messages
  belongs_to :device
  
  validates_presence_of :first_name, :last_name, :email, :device
  
  default_scope :order => 'last_name'
  
  boolean_datetime_attribute :read_at
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def to_s
    name
  end
  
  def notification?
    if messages.empty?
      false
    else
      if self.read_at
        if self.read_at < self.messages.last.created_at
          true
        else
          false
        end
      else
        true
      end
    end
  end
  
  def image_path(size = 'normal')
    image.url(size)
  end
  
  def cloudapp
    @cloudapp ||= CloudApp.find_by_contact(self)
  end
  
  has_attached_file :image, :styles => { :original => ['300x300>'],
                                         :normal => ['100x100#'],
                                         :small => ['70x70#']
                                       },
                            :default_style => :normal,
                            :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/aws.yml",
                            :path => "profile_images/:id/:style/:filename"
                            # http://stackoverflow.com/questions/2465035/how-to-pass-additional-convert-options-to-paperclip-on-heroku
                            #, :convert_options => { :all => '-auto-orient' }
                            
  
end
