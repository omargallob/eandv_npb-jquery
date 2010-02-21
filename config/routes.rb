ActionController::Routing::Routes.draw do |map|
  map.resources :s3_uploads

  
  map.resources :contact
  map.resources :eandv
	map.resources :blog
  map.resources :services #, :path_prefix => ":locale"
  map.resources :properties,:collection => {:feed => :get, :filter=>:get,:unfilter=>:get,:sort => :get, :unsort => :get}
  map.resources :rss,:collection => {:favs => :get,:properties => :get}
  
  #search url
  map.search_query '/search/', :controller => "properties", :action => "search", :method => :get
  # know your neighbourhood
  map.neighbourhood '/neighbourhood', :controller => "contact", :action => "neighbourhood"
  # mortgage
  map.neighbourhood '/mortgage/:id', :controller => "contact", :action => "mortgage"
  # plugoo
  map.plugoo '/plugoo', :controller => "contact", :action => "plugoo"
  # social (twitter & facebook)
  map.plugoo '/social', :controller => "contact", :action => "social"
  
  #user action ( login signup logout)
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session
  #map.namespace :services do |services|
   # services.pare
  #end
 
  map.services_par '/services/:category', :controller => "services", :action => "show"
  
  map.services_sub '/services/:category/:subcategory.:format', :controller => "services", :action => "show"
  #admin section
  map.namespace :admin  do |admin|
     admin.root :controller => "overview"
     admin.resources :pages
	   #admin.page_subs "/pages/:parent/subs", :controller => "partners", :action => "index"
     admin.resources :page_about
     admin.resources :metatag
     admin.resources :services
     admin.resources :types
     admin.resources :categories
     admin.category_partners "/category/:category_id/partners", :controller => "partners", :action => "index"
     admin.category_new_partner "/category/:category_id/new/partner", :controller => "partners", :action => "new"
     admin.resources :partners
     admin.resources :countries
     admin.resources :locations
     admin.country '/:country/locations', :controller => "locations", :action => "index"
     admin.new_location '/:country/locations/new', :controller => "locations", :action => "new" 
     admin.edit_location '/:country/locations/:id/edit', :controller => "locations", :action => "edit"
     admin.update_location '/locations/:id', :controller => "locations", :action => "update"
     admin.resources :developments
     admin.developments '/:country/:zipcod/developments', :controller => "developments", :action => "index"
     admin.new_development '/:country/:zipcod/developments/new', :controller => "developments", :action => "new"
     admin.edit_development '/:country/:zipcod/developments/:id/edit', :controller => "developments", :action => "edit"
     admin.resources :properties
     admin.update_fp 'properties/:property_id/update_fp',:controller => "properties", :action => "update_featured_photo"
     admin.resources :facilities
     admin.resources :property_thumbnail
     admin.resources :googlemap
     admin.resources :users
     admin.resources :roles
     admin.resources :staff
     admin.resources :opening
     admin.resources :posts
     admin.resources :galleries
     admin.resources :faq
     admin.resources :gossip
     admin.resources :featured
		 admin.featured_property "/properties/:property_id/featured", :controller => "featured", :action =>"show"
		 admin.new_feature_gallery_property "/properties/:property_id/featured/new", :controller => "featured", :action =>"new"
     admin.resources :galleries, :collection => { :prioritize_uploads => :post }
      admin.resources :uploads
      admin.update_gallery 'galleries/:id', :controller=>"galleries",:action => "update"
  end
  
	map.featured '/featured', :controller => "properties", :action => "index", :filter => "featured"
  map.view_page ':name', :controller => 'viewer', :action => 'show'
  map.view_page_parent ':parent/:name', :controller => 'viewer', :action => 'show'
  map.feed_properties '/rss/properties.:format', :controller => 'properties', :action => 'feeds'
  map.feed_favs '/rss/favs.:format', :controller => 'rss', :action => 'favs'
  map.property_images '/properties/:id/images.xml', :controller => 'properties', :action => 'feed_images'     
  map.service_feed '/services/:category/:subcategory/feed.xml', :controller => 'services', :action => 'feed'
  map.about_nb '/about.xml', :controller => "rss", :action => "about"
  map.partners '/partners.xml', :controller => "rss", :action => "partners"
	map.similar '/properties/:id/similar.xml', :controller => "rss", :action => "similar"
	map.view_blog '/blog/:title', :controller => "blog", :action => "show"
	map.properties_page '/properties/page/:page', :controller=>"properties", :action => "index"
	map.properties_order '/properties/order/:order', :controller => "properties", :action => "index"
	map.properties_filter '/properties/filter/:filter', :controller => "properties", :action => "index"
	map.properties_filter_order '/properties/filter/:filter/order/:order', :controller => "properties", :action => "index"
	#map.featured '/properties/featured', :controller => "properties", :action => "index", :aux=>"featured"
	#map.connect '/blog/:year/:month/:day', :controller => "blog", :action => "show", :year => /\d{4/},:month => /\d{1,2/},:year => /\d{4/},
  # 
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "viewer", :action=>"show", :name => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect 'properties/feed.:format', :controller => 'properties', :action => 'feed'
  map.connect ':controller/:action.:format'
  #map.connect '/properties/favs.:format',:controller=>"properties",:action=>'favs'
end
