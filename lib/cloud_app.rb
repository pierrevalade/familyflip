class CloudApp
    
  include HTTParty
  base_uri 'my.cl.ly'
  
  attr_reader :contact
  
  def contact=(contact)
    @contact = contact
    @auth = {:username => contact.cloudapp_login, :password => contact.cloudapp_password}
  end
  
  def self.find_by_contact(contact)
    cloudapp = CloudApp.new
    cloudapp.contact = contact
    cloudapp
  end
  
  def items(options = {})
    options.merge!({:digest_auth => @auth})
    self.class.get("/items.json", options)
  end
  
  def files
    items.collect { |item| CloudFile.new(item) }
  end
  
  def update!
    files.each do |file|
      file.contact = contact
      file.save! if file.file_id > (contact.cloudapp_last_file_id || 0)
    end
    contact.update_attribute(:cloudapp_last_file_id, files.first.file_id)
  end
  
end