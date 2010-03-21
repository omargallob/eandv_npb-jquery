class PropertiesController < ApplicationController
  include Geokit::Geocoders

  def index
    #@properties = Property.find(:all,:order => 'created_at')
	  @search_query = SearchQuery.find_by_id(156)
		pickup_properties(@search_query.id)
    #@properties.sort!{|x| x.featured }
		#@properties.sort!{|x| x.featured == true }
   @sellers = Faq.find(:all, :conditions => ["gossip = ? AND buyer_or_seller = ?",false,"seller"])
   @buyers = Faq.find(:all, :conditions => ["gossip = ? AND buyer_or_seller = ?",false,"buyer"])
		case params[:filter]
			when "rent"
			@properties.delete_if {|x| x.rental == false }
			when "buy"
			@properties.delete_if {|x| x.rental == true }		
			when "featured"
			@properties.delete_if {|x| x.featured == false }		
		end	
		if params[:order]=="des"
			@properties.sort!{|y,x| x.price <=> y.price}	
			@order = "asc"	
		else
			@properties.sort!{|x,y| x.price <=> y.price}	
			@order = "des"	
		end
	  @properties.delete_if {|x| x.validated == false }
		@properties = @properties.paginate :page => params[:page], :per_page => 10     			
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
 @sellers = Faq.find(:all, :conditions => ["gossip = ? AND buyer_or_seller = ?",false,"seller"])
   @buyers = Faq.find(:all, :conditions => ["gossip = ? AND buyer_or_seller = ?",false,"buyer"])
    @property = Property.find_by_id(params[:id])
    @page = Page.find_by_name('properties')
  	@subpages = @page.subpages
	 set_meta_tags :title =>  "("+@property.location.zipcod+") "+@property.location.region+" - "+ @property.title

	 string =  @property.address

	  @res=GoogleGeocoder.geocode(string)    
	  if @res.success
	    @lng = @res.lng
	    @lat = @res.lat
	  end

	  @map = GMap.new("map")
	  @map.control_init(:large_map => true,:map_type => true)
	  @map.center_zoom_init([@lat,@lng],14)
	  @map.overlay_init(GMarker.new([@lat,@lng],:info_window => "#{@property.address}"))
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
  #  @properties = []
    @page = Page.find_by_name('properties')
    @subpages = @page.subpages
    @search_query = SearchQuery.new(params[:search_query])
    @search_query.save
	 @sellers = Faq.find(:all, :conditions => ["gossip = ? AND buyer_or_seller = ?",false,"seller"])
   @buyers = Faq.find(:all, :conditions => ["gossip = ? AND buyer_or_seller = ?",false,"buyer"])
    pickup_properties(@search_query.id)
	case params[:filter]
			when "rent"
			@properties.delete_if {|x| x.rental == false }
			when "buy"
			@properties.delete_if {|x| x.rental == true }		
			when "featured"
			@properties.delete_if {|x| x.featured == false }		
		end	
		if params[:order]=="des"
			@properties.sort!{|y,x| x.price <=> y.price}	
			@order = "asc"	
		else
			@properties.sort!{|x,y| x.price <=> y.price}	
			@order = "des"	
		end
		@properties = @properties.paginate :page => params[:page], :per_page => 10     
  end

  def filter
    @sort_by = params[:sort_by]

    if params[:search_query][:referal]=="search"
        pickup_properties(params[:search_query][:id])    
         case @sort_by.downcase
            when "rent"
              @properties.delete_if {|x| x.rental == false }
            when "buy"
              @properties.delete_if {|x| x.rental == true }
          end
    else
       pickup_properties(156)    
         case @sort_by.downcase
            when "rent"
              @properties.delete_if {|x| x.rental == false }
            when "buy"
              @properties.delete_if {|x| x.rental == true }
          end
    end
    
     if params[:active]
        @active =params[:active].downcase
        @order = params[:search_query][:order]
        case @active
          when "price"
             case @order
               when "ASC" 
                 @properties.sort!{|x,y| x.price <=> y.price}
               when "DESC"
                 @properties.sort!{|x,y| y.price <=> x.price}
             end
           when "date"
             case @order
               when "ASC" 
                 @properties.sort!{|x,y| x.id <=> y.id}
               when "DESC"
                 @properties.sort!{|x,y| y.id <=> x.id}
             end
        end

      end
    respond_to do |format|
      format.js
    end
  end
  
  def unfilter
    @unsort_by = params[:unsort_by]

    if params[:search_query][:referal]=="search"
      pickup_properties(params[:search_query][:id])    
    else
      @properties = Property.find(:all)
    end
    
    if params[:search_query][:order]
        case @active
          when "price"
             case @order
               when "ASC" 
                 @properties.sort!{|x,y| x.price <=> y.price}
               when "DESC"
                 @properties.sort!{|x,y| y.price <=> x.price}
             end
           when "date"
             case @order
               when "ASC" 
                 @properties.sort!{|x,y| x.id <=> y.id}
               when "DESC"
                 @properties.sort!{|x,y| y.id <=> x.id}
             end
        end
    end
    respond_to do |format|
      format.js #javascript 
    end
  end
  
  def sort
    @sort_by = params[:sort_by].downcase
    @order = params[:search_query][:order]
  
    
    if params[:search_query][:referal]=="search"
        pickup_properties(params[:search_query][:id]) 
			 # @properties = @properties.paginate :page => params[:page], :per_page => 10        
         case @sort_by
            when "price"
              case @order
                when "ASC" 
                  @properties.sort!{|x,y| x.price <=> y.price}
                when "DESC"
                  @properties.sort!{|x,y| y.price <=> x.price}
              end
            when "date"
              case @order
                when "ASC" 
                  @properties.sort!{|x,y| x.id <=> y.id}
                when "DESC"
                  @properties.sort!{|x,y| y.id <=> x.id}
              end
          end
			#@properties = @properties.paginate :page => params[:page], :per_page => 10     		
    else
 				pickup_properties(156)    
			  
         case @sort_by
            when "price"
              case @order
                when "ASC" 
                  @properties.sort!{|x,y| x.price <=> y.price}
                when "DESC"
                  @properties.sort!{|x,y| y.price <=> x.price}
              end
            when "date"
              case @order
                when "ASC" 
                  @properties.sort!{|x,y| x.id <=> y.id}
                when "DESC"
                  @properties.sort!{|x,y| y.id <=> x.id}
              end
          end
			#@properties = @properties.paginate :page => params[:page], :per_page => 10     		
    end
    
    if params[:active]
      @active =params[:active].downcase
      case @active
       when "rent"
         @properties.delete_if {|x| x.rental == false }
       when "buy"
         @properties.delete_if {|x| x.rental == true }
      end
    
    end
   	@properties = @properties.paginate :page => params[:page], :per_page => 10   
  end
  
  def auxiliar
		render :layout => "search"
	end
  
  def mls
 		@page = Page.find_by_name('properties')
      if @page.metatag
         set_meta_tags :title =>  @page.title,
                     :description => @page.metatag.description,
                     :keywords =>  @page.metatag.keywords 
       else
         set_meta_tags :title =>  @page.title
      end
     @subpages = @page.subpages
	end
end
