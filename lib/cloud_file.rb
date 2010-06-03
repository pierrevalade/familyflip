require 'open-uri'

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
    message.subject = self.name
    archive = open(URI.parse(self.remote_url))
    dir_path = "./tmp/#{UUIDTools::UUID.random_create}"
    puts dir_path
    Zip::ZipFile.open(archive.path) do |zipfile|
      zipfile.each do |entry|
        # puts "#{dir}/#{entry}"
        file_path = "#{dir_path}/#{entry}"
        FileUtils.mkdir_p(File.dirname(file_path))
        zipfile.extract(entry, file_path)
        puts "file: #{entry} #{image_type(file_path)}"
        if image_type(file_path)
          image = message.images.build
          image.attachment = File.open(file_path)
          image.save!
        end
      end
    end
    message.save!
  end
  
  def image_type(file)
    begin
      case IO.read(file, 10)
        when /^GIF8/: 'gif'
        when /^\x89PNG/: 'png'
        when /^\xff\xd8\xff\xe0\x00\x10JFIF/: 'jpg'
        when /^\xff\xd8\xff\xe1(.*){2}Exif/: 'jpg'
      else nil
      end
    rescue
      nil
    end
  end
  
end