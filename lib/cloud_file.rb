class CloudFile
  
  attr_accessor :file_id, :file_name, :item_type, :remote_url
  attr_accessor :message, :contact
  
  def initialize(params)
    self.remote_url = params["remote_url"]
    self.file_name = params["name"]
    self.file_id = params["id"].to_i
    self.item_type = params["item_type"]
    self.message = Message.new(:reply => false)
  end
  
  def name
    file_name.match(/.*(?=\..+$)/)[0]
  end
  
  def save!
    case item_type
      when "image"
        save_image!
      when "archive"
        save_archive!
    end
  end
  
  def contact=(contact)
    message.contact = contact
  end
  
  def save_image!
    message.subject = self.name
    message.images.build(:image_url => self.remote_url)
    message.save!
  end
  
  def save_archive!
    # message.subject = self.name
    # Zip::ZipFile.open(open(URI.parse(self.remote_url))) do |zipfile|
    #   # puts dir.entries('.')
    #   zipfile.each do |entry|
    #     puts "#{entry}"
    #     zipfile.extract(entry, "./tmp/#{entry}")
    #     image = Image.new
    #     image.attachment = File.open("./tmp/#{entry}")
    #     image.message = Message.albums.last
    #     image.save!
    #   end
    # end
    # message.save!
  end
  
end