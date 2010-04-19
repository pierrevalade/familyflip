class Admin::AlbumsController < ApplicationController
  layout 'admin'
  active_scaffold :album
end
