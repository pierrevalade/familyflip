# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_flash(sym, options = {})
    options[:class] = options[:class].blank? ? "#{sym}" : "#{options[:class]} #{sym}"
    content_tag(:p, flash[sym], options) unless flash[sym].blank?
  end
  
end
