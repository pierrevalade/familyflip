#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

require File.dirname(__FILE__) + "/../../config/environment"

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  
  # Replace this with your code
  ActiveRecord::Base.logger.info "{cloudapp-update} is running at #{Time.now}.\n"
  Contact.all.each do |contact|
    contact.cloudapp.try(:update!)
  end
  
  sleep 10
end