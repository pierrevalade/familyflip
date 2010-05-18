require 'zip/zipfilesystem'

namespace :archives do
  desc('unzip file')
  task(:unzip => :environment) do
    file = "./chrome.zip"
    Dir.mkdir("./tmp/chrome")
    
    Zip::ZipFile.open(file) do |zipfile|
      # puts dir.entries('.')
      zipfile.each do |entry|
        puts "#{entry}"
        zipfile.extract(entry, "./tmp/#{entry}")
      end
    end

  end
end