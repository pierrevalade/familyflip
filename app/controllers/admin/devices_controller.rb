class Admin::DevicesController < ApplicationController
  layout 'admin'
  active_scaffold :device
end
