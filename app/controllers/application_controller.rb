# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :setmeta, :get_pages_for_tabs, :set_user_locale, :pickupproperties, :gossip
  
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  
  def setmeta
    set_meta_tags :site => 'E&V - Newport Beach'
  end 
  
  def get_pages_for_tabs
    @tabs = Page.find_main
  end
  
  def set_user_locale
    I18n.locale = current_user.language if logged_in?
  end
  
  def pickupproperties
    @locations = Location.find(:all, :include => :country)
		@locations.delete_if{|q| q.properties.size == 0}
		@locations.delete_if{|q| q.country.title != "United States"}

    @countries = Country.find(:all)
		
		@countries.delete_if{|s| s.locations.size == 0}
		@countries = @countries.collect {|p| [ p.title, p.title ]}
		
    @states = @locations.map { |x| x.state }
    @county = @locations.map { |x| x.city+" - "+x.county }  
    @region = @locations.map { |x| x.region }
    @region << "All"
    @aux_props = Property.find(:all,:order => "bedrooms")
    @bedrooms = @aux_props.map{ |y| y.bedrooms}
    @bedrooms << "All"
  end
	
	def pickup_dropdowns_country()

	end
  
def pickup_properties(id)
    @properties = []
    @search_query = SearchQuery.find_by_id(id)
    if @search_query.query
      set_meta_tags :title =>  "Search: "+  @search_query.query.capitalize
      if params[:query] == "All"
        @properties = Property.find(:all)
      else
        @properties = Property.find_by_contents(@search_query.query)
        @locations = Location.find_by_contents(@search_query.query)
        @types = Type.find_by_contents(@search_query.query)
        for location in @locations
          if location.properties
           for p in location.properties
            @properties << p
           end
          end
        end
        for type in @types
          if type.properties
           for q in type.properties
            @properties << q
           end
          end
        end
      end  
    else
      set_meta_tags :title =>  "Search: "+ @search_query.region.downcase+": "+ @search_query.area.downcase
        #@properties = Property.find_by_contents(params[:query])
        #@query = params[:states]+" "+params[:region]
        
        if @search_query.area=="All"
          @tag = @search_query.region.split(' - ')
           @c0 = @tag[0]
           @c1 = @tag[1]+" County"
          @locations = Location.find_by_contents(@c0)
        else
          @locations = Location.find_by_contents(@search_query.area)
        end

        if @search_query.bedrooms=="All"
            for location in @locations
                if location.properties
                 for p in location.properties       
                   unless @search_query.price == "All"            
                      if p.price_condition(@search_query.price)
                        @properties << p
                      end
                   else
                     @properties << p
                   end
                 end
                end
              end
         else
           for location in @locations
               if location.properties
                for p in location.properties
                 if p.bedrooms == @search_query.bedrooms.to_i
                    unless @search_query.price == "All"            
                       if p.price_condition(@search_query.price)
                         @properties << p
                       end
                    else
                      @properties << p
                    end
                 end
                end
								
               end
             end
         end
    end

 end
	def gossip	
	   @latest_posts = Post.find_all_sub
		@latest_posts.delete_if{|q| q.parent.name == "news"}
	end
  #def default_url_options(options={}) 
  #   logger.debug "default_url_options is passed options: #{options.inspect}\n"
  #   { :locale => I18n.locale }
  #end 
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

end
