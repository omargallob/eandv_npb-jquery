class ViewerController < ApplicationController
  include Geokit::Geocoders
  def show
    @page = Page.find_by_name(params[:name])
    @parent = Page.find_by_name(params[:parent])
    if params[:parent]
      @subpages = @parent.subpages
    else
      @parent = @page
       @subpages = @page.subpages
    end
		if @page.name == "shop"
		 string = "260 Newport Center Drive, Newport Beach, CA 92660" 

			@res=GoogleGeocoder.geocode(string)    
			if @res.success
				@lng = @res.lng
				@lat = @res.lat
			end

			@map = GMap.new("map")
			@map.control_init(:large_map => true,:map_type => true)
			@map.center_zoom_init([@lat,@lng],14)
			@map.overlay_init(GMarker.new([@lat,@lng],:info_window => "#{string}"))
		end
		if params[:parent] == "shop"
			if params[:name] == "staff"
					@staff = Worker.find(:all, :conditions => {:vacancy => false})
			end
			if params[:name] == "employment"
					@staff = Worker.find(:all,:conditions => {:vacancy => true})
			end
		end
		
		if @page.name == "home"
			@posts = Post.find_sub(4)
		end

    if @page.metatag
      set_meta_tags :title =>  @page.title,
                  :description => @page.metatag.description,
                  :keywords =>  @page.metatag.keywords 
    else
      set_meta_tags :title =>  @page.title
    end  
    
    #@properties = Property.find(:all)
  end

end
