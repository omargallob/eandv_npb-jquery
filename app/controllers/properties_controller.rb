class PropertiesController < ApplicationController
  def index

     @properties = Property.find(:all, :include => 'location',:order => 'locations.region')
     @page = Page.find_by_name('properties')
      if @page.metatag
         set_meta_tags :title =>  @page.title,
                     :description => @page.metatag.description,
                     :keywords =>  @page.metatag.keywords 
       else
         set_meta_tags :title =>  @page.title
      end
     @subpages = @page.subpages
      respond_to do |format|
          format.html # show.html.erb
          format.xml  #{ render :xml => @properties }
        end
  end

  def show

    @property = Property.find_by_id(params[:id])
    @page = Page.find_by_name('properties')
  @subpages = @page.subpages
       set_meta_tags :title =>  "("+@property.location.zipcod+") "+@property.location.region+" - "+ @property.title

       @map = GMap.new("map")
       @map.control_init(:large_map => true,:map_type => true)
       @map.center_zoom_init([33.599624,-117.827938],8)
        


      #@aux = @property.location.zipcod+", "+@property.location.state

     #results = Geocoding::get("Newport Beach California")
      # if results.status == Geocoding::GEO_SUCCESS
       #  coord = results[0].latlon
      #    @map.center_zoom_init(coord,12)
      # end

  end 
  
  def feed
    @favs = Page.find(:all, :conditions=>['featured=?',true])
    respond_to do |format|
        format.xml  #{ render :xml => @properties }
    end
  end
 
  def feed_images
     @property = Property.find_by_id(params[:id])
     respond_to do |format|
         format.xml  #{ render :xml => @properties }
     end
  end
  
  def search
    @properties = []
    @page = Page.find_by_name('properties')
    @subpages = @page.subpages
    @search_query = SearchQuery.new(params[:search_query])
    @search_query.save
    
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

end
