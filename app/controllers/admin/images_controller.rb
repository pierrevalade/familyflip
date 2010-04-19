class Admin::ImagesController < ApplicationController
  layout 'admin'
  active_scaffold :image
end
