ActionController::Routing::Routes.draw do |map|

  map.resources :contacts, :member => {:call => :get, :write => :get}
  map.paged_contacts '/contacts/pages/:page', :controller => :contacts  
  map.paged_images_contacts '/contacts/:id/pages/:page', :controller => :contacts, :action => :show
  
  map.resources :messages, :member => {:reply => :get}
  
  map.resources :albums
  map.paged_albums '/albums/pages/:page', :controller => :albums
  map.paged_images_albums '/albums/:id/pages/:page', :controller => :albums, :action => :show
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :controller => 'albums', :action => :index
  
end
