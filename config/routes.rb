ActionController::Routing::Routes.draw do |map|
  
  # html5
  map.resource :manifest, :controller => "manifest", :member => {:store => :get}, :only => :show
  
  # api
  map.resources :emails, :only => :create
  
  map.resource :account
  
  # authlogic
  map.resources :users
  map.resource :user_session
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.signup 'signup', :controller => "users", :action => "new"
  
  # devices
  map.resources :devices, :collection => {:contact => :get}
  
  # embarqued
  map.resources :videocalls
  map.resources :contacts, :member => {:call => :get, :new_call => :get, :write => :get, :read => :post, :new_show => :get}, :collection => {:new_index => :get}
  map.paged_contacts '/contacts/pages/:page', :controller => :contacts  
  map.paged_images_contacts '/contacts/:id/pages/:page', :controller => :contacts, :action => :show
  
  map.resources :messages, :member => {:reply => :get}, :collection => {:video => :get}
  
  map.resources :albums, :member => {:image => :get, :carousel => :get, :new_show => :get}, :collection => {:messages => :get, :new_index => :get}
  map.paged_albums '/albums/pages/:page', :controller => :albums
  map.paged_images_albums '/albums/:id/pages/:page', :controller => :albums, :action => :show
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect '/set_device', :controller => "welcome", :action => :set_device
  map.connect '/notifications', :controller => "welcome", :action => :notifications
  map.root :controller => 'welcome', :action => :index
  
end
