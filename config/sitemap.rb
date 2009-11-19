
Sitemap::Routes.host = 'http://localhost:3001'
Sitemap::Routes.priority = 0.8    # default is 1.0

Sitemap::Routes.draw do |map|
 # map.resources :services,:collection => {:feed => :get}
 map.root :controller => "viewer", :action=>"show", :name => 'home'

 
 map.resources :properties
 #map.resources :services

 
 #map.view_page ':name', :controller => 'viewer', :action => 'show'
 
end
