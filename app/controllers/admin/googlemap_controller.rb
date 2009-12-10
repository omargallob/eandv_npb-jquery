class Admin::GooglemapController < Admin::BaseController

  include Geokit::Geocoders


  def index
  end
  
  def show
    @property = Property.find_by_id(params[:id])
    string =  @property.title+", "+@property.location.region+", "+@property.location.county+", "+@property.location.state
    
    @res=MultiGeocoder.geocode(string)    
    
     @map = GMap.new("map")
     @map.control_init(:large_map => true,:map_type => true)
     
  end
  
  def create
  end
  
  def update
  end
  
end
