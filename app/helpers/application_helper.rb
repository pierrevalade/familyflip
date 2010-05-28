# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_flash(sym, options = {})
    options[:class] = options[:class].blank? ? "#{sym}" : "#{options[:class]} #{sym}"
    content_tag(:p, flash[sym], options) unless flash[sym].blank?
  end
  
  def youtube(message)
    text = simple_format(message.text)
    text.gsub(/http:\/\/www.youtube.com\/watch\?v=([a-zA-Z0-9]*)/) do |url|
      render 'messages/video', :url => url, :message => message
    end
  end
  
end
