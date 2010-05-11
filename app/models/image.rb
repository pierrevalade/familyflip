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
  
  # image from url
  attr_accessor :image_url
  before_validation :download_remote_image, :if => :image_url_provided?
  
  # image from canvas
  attr_accessor :attachment64
  before_validation :save_attachment64, :if => :attachment64_provided?
  
  # paperclip
  def url(size = :normal)
    attachment.url(size)
  end
  
  validates_attachment_presence :attachment
  
  has_attached_file :attachment, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/aws.yml",
                                 :path => "messages_images/:id/:style/:filename",
                                 :styles => { :original => ['1000x600>'],
                                              :normal => ['500x500>'],
                                              :stack => ['137x133>']
                                            },
                                 :default_style => :normal
                                 # , :convert_options => { :all => '-auto-orient' }
                                 
  private
    def attachment64_provided?
      !self.attachment64.blank?
    end
    
    def save_attachment64
      File.open("tmp/reply.png", "wb") { |f| f.write(Datafy::decode_data_uri(attachment64)[0]) }  
      self.attachment = File.open("tmp/reply.png", "r")
    end
    
    def image_url_provided?
      !self.image_url.blank?
    end
    
    def download_remote_image
      self.attachment = do_download_remote_image
      # self.image_remote_url = image_url
    end
  
    def do_download_remote_image
      io = open(URI.parse(image_url))
      def io.original_filename; base_uri.path.split('/').last; end
      io.original_filename.blank? ? nil : io
    rescue
      # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
    end
  
end
