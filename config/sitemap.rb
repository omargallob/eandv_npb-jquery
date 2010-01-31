Sitemap::Routes.host = 'http://npb.heroku.com'
Sitemap::Routes.priority = 0.8    # default is 1.0

Sitemap::Routes.draw do |map|

  # root routes
  map.root :controller => 'viewer', :action => 'show', :name => "name"

  #map.connect '/properties/:id', :controller => 'properties', :action => 'show', :substitution => {:model => 'Properties',:id => 'id'}

  
  map.resources :properties
  #map.services_par "/services ", :controller => "services", :action =>"index"
  
  map.connect 'services', :controller => "services", :action => "index"
  map.connect 'services/:parent',  :controller => "services", :action => "show", :substitution => {:model => "Category",:category => "parent_id"} 
  #map.services_sub 'services/:parent', :controller => 'sitemaps', :action => 'index'
  #map.services '/services/:parent/:category', :controller => "services", :action => "show", :substitution => {:model => 'Category',:parent=>"parent_id",:category => 'name'}
  
  #map.resources :pages
  #map.connect 'services', :controller => "services", :action => "index"
  #map.connect 'services/:parent', :controller => "services", :action => "show", :substitution => {:model => "Category", :parent => "name"} 
end