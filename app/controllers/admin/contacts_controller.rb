class Admin::ContactsController < ApplicationController
  layout 'admin'
  active_scaffold :contact
end
